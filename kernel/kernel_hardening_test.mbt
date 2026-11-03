// Kernel hardening tests: atomicity of failed extensions, invariants on
// generated well-typed terms, and deep-structure stress tests.

///|
fn snapshot() -> String {
  let tys = @kernel.types().map(e => e.0 + "/" + e.1.to_string())
  let cs = @kernel.constants().map(e => e.0)
  tys.to_array().join(",") +
  " | " +
  cs.to_array().join(",") +
  " | " +
  @kernel.axioms().length().to_string() +
  " | " +
  @kernel.definitions().length().to_string()
}

///|
fn ty(name : String) -> @kernel.HolType {
  @kernel.mk_vartype(name)
}

///|
fn fn_ty(a : @kernel.HolType, b : @kernel.HolType) -> @kernel.HolType raise {
  @kernel.mk_type("fun", @list.List([a, b]))
}

///|
fn mk_eq(l : @kernel.Term, r : @kernel.Term) -> @kernel.Term raise {
  let t = @kernel.type_of(l)
  @kernel.mk_comb(
    @kernel.mk_comb(@kernel.mk_const("=", @list.List([(t, @kernel.aty)])), l),
    r,
  )
}

///|
/// `|- (\v. v = v) v` for a variable `v`: a witness for a type definition.
fn witness(v : @kernel.Term) -> @kernel.Thm raise {
  let pred = @kernel.mk_abs(v, mk_eq(v, v))
  let b = @kernel.beta(@kernel.mk_comb(pred, v))
  // SYM via MK_COMB/EQ_MP: from |- l = r derive |- r = l.
  let (l, _) = @kernel.dest_eq(@kernel.concl(b))
  let eqc = @kernel.rator(@kernel.rator(@kernel.concl(b)))
  let sym = @kernel.eq_mp(
    @kernel.mk_comb_rule(
      @kernel.mk_comb_rule(@kernel.refl(eqc), b),
      @kernel.refl(l),
    ),
    @kernel.refl(l),
  )
  @kernel.eq_mp(sym, @kernel.refl(v))
}

///|
fn expect_failure(f : () -> Unit raise, msg : String) -> Unit raise {
  try f() catch {
    Failure(m) => @test.assert_eq(m, msg)
    e => fail("unexpected error \{e}")
  } noraise {
    _ => fail("expected failure: " + msg)
  }
}

///|
test "failed extensions leave the kernel state unchanged" {
  let v = @kernel.mk_var("v", ty("A"))
  let w = witness(v)
  let before = snapshot()
  // Same name for abstraction and representation: upstream fails only
  // after registering the type and the abstraction constant.
  expect_failure(
    () => ignore(@kernel.new_basic_type_definition("hard_t", "hd", "hd", w)),
    "new_constant: constant hd has already been declared",
  )
  @test.assert_eq(snapshot(), before)
  expect_failure(
    () => ignore(@kernel.new_basic_type_definition("bool", "hd1", "hd2", w)),
    "new_basic_type_definition: Type already defined",
  )
  @test.assert_eq(snapshot(), before)
  expect_failure(
    () => ignore(@kernel.new_basic_type_definition("hard_t", "=", "hd2", w)),
    "new_basic_type_definition: Constant(s) already in use",
  )
  @test.assert_eq(snapshot(), before)
  expect_failure(
    () => {
      ignore(
        @kernel.new_basic_definition(mk_eq(@kernel.mk_var("=", ty("A")), v)),
      )
    },
    "new_definition: term not closed: v",
  )
  let x = @kernel.mk_var("x", ty("A"))
  let closed = @kernel.mk_abs(x, x)
  let eq_ty = fn_ty(ty("A"), ty("A"))
  expect_failure(
    () => {
      ignore(
        @kernel.new_basic_definition(mk_eq(@kernel.mk_var("=", eq_ty), closed)),
      )
    },
    "new_constant: constant = has already been declared",
  )
  @test.assert_eq(snapshot(), before)
  // A successful definition then publishes both the type and constants.
  let (th1, th2) = @kernel.new_basic_type_definition("hard_t", "hd1", "hd2", w)
  @test.assert_eq(
    @kernel.hyp(th1).is_empty() && @kernel.hyp(th2).is_empty(),
    true,
  )
  @test.assert_eq(@kernel.get_type_arity("hard_t"), 1)
  @test.assert_eq(@kernel.constants().take(2).map(e => e.0).to_array(), [
    "hd2", "hd1",
  ])
}

// ---------------------------------------------------------------------------
// Generated well-typed terms.
// ---------------------------------------------------------------------------

///|
priv struct Gen {
  mut seed : UInt32
}

///|
fn Gen::next(self : Gen, n : Int32) -> Int32 {
  self.seed = self.seed * 1664525U + 1013904223U
  ((self.seed >> 8).reinterpret_as_int() & 0xFFFFFF) % n
}

///|
/// A random term of type `target` over a few variable names and base types.
fn Gen::term(
  self : Gen,
  target : @kernel.HolType,
  depth : Int32,
) -> @kernel.Term raise {
  let names = ["x", "y", "z", "x'"]
  let bases = [ty("A"), ty("B"), @kernel.bool_ty]
  let choice = if depth <= 0 { 0 } else { self.next(4) }
  match choice {
    1 =>
      // Application of a function variable (or equality at bool).
      if target == @kernel.bool_ty && self.next(2) == 0 {
        let at = bases[self.next(3)]
        mk_eq(self.term(at, depth - 1), self.term(at, depth - 1))
      } else {
        let at = bases[self.next(3)]
        @kernel.mk_comb(
          self.term(fn_ty(at, target), depth - 1),
          self.term(at, depth - 1),
        )
      }
    2 =>
      match target {
        Tyapp("fun", More(dom, tail=More(cod, tail=Empty))) => {
          let v = @kernel.mk_var(names[self.next(4)], dom)
          @kernel.mk_abs(v, self.term(cod, depth - 1))
        }
        _ => @kernel.mk_var(names[self.next(4)], target)
      }
    _ => @kernel.mk_var(names[self.next(4)], target)
  }
}

///|
fn same_set(a : @list.List[@kernel.Term], b : @list.List[@kernel.Term]) -> Bool {
  a.all(x => b.contains(x)) && b.all(x => a.contains(x))
}

///|
fn sign(n : Int32) -> Int32 {
  if n < 0 {
    -1
  } else if n > 0 {
    1
  } else {
    0
  }
}

///|
test "substitution is capture-avoiding and type-preserving" {
  let g = { seed: 12345U, }
  let bases = [ty("A"), ty("B"), @kernel.bool_ty]
  for _ in 0..<300 {
    let target = bases[g.next(3)]
    let t = g.term(target, 5)
    // theta: replace one or two free variables by random terms.
    let fv = @kernel.frees(t).to_array()
    if fv.is_empty() {
      continue
    }
    let theta = []
    for _ in 0..<(1 + g.next(2)) {
      let x = fv[g.next(fv.length())]
      theta.push((g.term(@kernel.type_of(x), 3), x))
    }
    let theta = @list.List(theta)
    let t2 = @kernel.vsubst(theta, t)
    @test.assert_eq(@kernel.type_of(t2), @kernel.type_of(t))
    // frees(t[theta]) = (frees t - dom theta) u frees of the images of the
    // variables free in t (first binding wins, as in rev_assocd).
    let expected = []
    for x in fv {
      match theta.find(p => p.1 == x) {
        Some((s, _)) =>
          for y in @kernel.frees(s) {
            expected.push(y)
          }
        None => expected.push(x)
      }
    }
    @test.assert_eq(same_set(@kernel.frees(t2), @list.List(expected)), true)
  }
}

///|
test "type instantiation is capture-avoiding and type-preserving" {
  let g = { seed: 777U, }
  let bases = [ty("A"), ty("B"), @kernel.bool_ty]
  for _ in 0..<300 {
    let t = g.term(bases[g.next(3)], 5)
    let tyin = @list.List([(bases[g.next(3)], ty("A"))])
    let t2 = @kernel.inst(tyin, t)
    @test.assert_eq(
      @kernel.type_of(t2),
      @kernel.type_subst(tyin, @kernel.type_of(t)),
    )
    let expected = @kernel.frees(t).map(v => @kernel.inst(tyin, v))
    @test.assert_eq(same_set(@kernel.frees(t2), expected), true)
  }
}

///|
/// Independent alpha-equivalence oracle: a de Bruijn rendering, where bound
/// variables become indices and free variables keep their name and type.
fn debruijn(tm : @kernel.Term) -> String {
  fn go(env : @list.List[@kernel.Term], tm : @kernel.Term) -> String {
    match tm {
      Var(s, t) =>
        match env.find_index(v => v == tm) {
          Some(i) => "#" + i.to_string()
          None => s + ":" + sty(t)
        }
      Const(s, t) => "$" + s + ":" + sty(t)
      Comb(f, x) => "(" + go(env, f) + " " + go(env, x) + ")"
      Abs(Var(_, t) as v, b) =>
        "(\\:" + sty(t) + ". " + go(env.prepend(v), b) + ")"
      Abs(_) => abort("binder is not a variable")
    }
  }

  go(@list.List([]), tm)
}

///|
test "alphaorder is a total order whose zero is alpha-equivalence" {
  let g = { seed: 4242U, }
  let terms = []
  for i in 0..<60 {
    let t = g.term(@kernel.bool_ty, 4)
    // Half of the terms are abstractions, so binders are common.
    terms.push(
      if i % 2 == 0 {
        t
      } else {
        @kernel.mk_abs(@kernel.mk_var(["x", "y", "z"][i % 3], ty("A")), t)
      },
    )
  }
  // Alpha-variants: every binder renamed (recursively), so they are
  // structurally different but alpha-equivalent.
  let mut renamed = 0
  for i in 0..<60 {
    let v = rename_binders(terms[i])
    if v != terms[i] {
      renamed += 1
      terms.push(v)
    }
  }
  @test.assert_eq(renamed > 10, true)
  let mut distinct = 0
  let mut equivalent = 0
  for a in terms {
    @test.assert_eq(@kernel.alphaorder(a, a), 0)
    for b in terms {
      let ab = sign(@kernel.alphaorder(a, b))
      @test.assert_eq(ab == 0, debruijn(a) == debruijn(b))
      if ab == 0 {
        equivalent += 1
      } else {
        distinct += 1
      }
      @test.assert_eq(ab, -sign(@kernel.alphaorder(b, a)))
      for c in terms {
        if ab <= 0 && sign(@kernel.alphaorder(b, c)) <= 0 {
          @test.assert_eq(sign(@kernel.alphaorder(a, c)) <= 0, true)
        }
      }
    }
  }
  // The properties are not vacuous: both outcomes occur often.
  @test.assert_eq(distinct > 1000, true)
  @test.assert_eq(equivalent > terms.length(), true)
  // Structurally different alpha-equivalent pairs are compared as equal.
  let mut alpha_pairs = 0
  for a in terms {
    for b in terms {
      if a != b && @kernel.alphaorder(a, b) == 0 {
        alpha_pairs += 1
      }
    }
  }
  @test.assert_eq(alpha_pairs >= 2 * renamed, true)
}

///|
/// Rename every bound variable of `tm` (innermost first) to a fresh name.
fn rename_binders(tm : @kernel.Term) -> @kernel.Term raise {
  match tm {
    Comb(f, x) => @kernel.mk_comb(rename_binders(f), rename_binders(x))
    Abs(Var(name, vt) as v, b) => {
      let b1 = rename_binders(b)
      let fresh = @kernel.variant(
        @list.List([@kernel.mk_abs(v, b1), b1]),
        @kernel.mk_var(name + "_r", vt),
      )
      @kernel.mk_abs(fresh, @kernel.vsubst(@list.List([(fresh, v)]), b1))
    }
    _ => tm
  }
}

///|
fn strictly_sorted(l : @list.List[@kernel.Term]) -> Bool {
  let a = l.to_array()
  for i in 1..<a.length() {
    if @kernel.alphaorder(a[i - 1], a[i]) >= 0 {
      return false
    }
  }
  true
}

///|
fn db_set(l : @list.List[@kernel.Term]) -> Array[String] {
  let out = []
  for t in l {
    let d = debruijn(t)
    if !out.contains(d) {
      out.push(d)
    }
  }
  out.sort()
  out
}

///|
test "hypotheses are exactly the expected alpha-sorted set" {
  let g = { seed: 99U, }
  let mut th = @kernel.refl(@kernel.mk_var("p", @kernel.bool_ty))
  let mut expected : Array[String] = []
  for _ in 0..<200 {
    let p = g.term(@kernel.bool_ty, 3)
    // DEDUCT_ANTISYM_RULE th (ASSUME p): (A - {p}) u ({p} - {concl th}).
    let dp = debruijn(p)
    let next = expected.filter(d => d != dp)
    if dp != debruijn(@kernel.concl(th)) {
      next.push(dp)
    }
    next.sort()
    th = @kernel.deduct_antisym_rule(th, @kernel.assume_rule(p))
    expected = next
    @test.assert_eq(strictly_sorted(@kernel.hyp(th)), true)
    @test.assert_eq(@kernel.hyp(th).length(), expected.length())
    @test.assert_eq(db_set(@kernel.hyp(th)), expected)
    @test.assert_eq(@kernel.type_of(@kernel.concl(th)), @kernel.bool_ty)
    if g.next(4) == 0 {
      let tyin = @list.List([(@kernel.bool_ty, ty("A"))])
      let image = db_set(@kernel.hyp(th).map(h => @kernel.inst(tyin, h)))
      th = @kernel.inst_type(tyin, th)
      expected = image
      @test.assert_eq(strictly_sorted(@kernel.hyp(th)), true)
      @test.assert_eq(db_set(@kernel.hyp(th)), expected)
      @test.assert_eq(@kernel.hyp(th).length(), expected.length())
    }
  }
}

// ---------------------------------------------------------------------------
// Deep structures other than argument nesting.
// ---------------------------------------------------------------------------

///|
/// `\v0. \v1. ... \v(n-1). f v0 z` with binder names `prefix0..`.
fn binder_chain(
  prefix : String,
  n : Int32,
  z : @kernel.Term,
  a~ : @kernel.HolType = ty("A"),
) -> @kernel.Term raise {
  let f = @kernel.mk_var("f", fn_ty(a, fn_ty(a, a)))
  let vars = [ for i in 0..<n => @kernel.mk_var(prefix + i.to_string(), a) ]
  let mut body = @kernel.mk_comb(@kernel.mk_comb(f, vars[0]), z)
  for i = n - 1; i >= 0; i = i - 1 {
    body = @kernel.mk_abs(vars[i], body)
  }
  body
}

///|
test "deep binders, operator spines and types" {
  let a = ty("A")
  let b = ty("B")
  let n = 1000
  let z = @kernel.mk_var("z", a)
  let t1 = binder_chain("x", n, z)
  let t2 = binder_chain("y", n, z)
  // Independently built alpha-equivalent chains (no physical sharing).
  @test.assert_eq(physical_equal(t1, t2), false)
  @test.assert_eq(@kernel.alphaorder(t1, t2), 0)
  @test.assert_eq(debruijn(t1) == debruijn(t2), true)
  // Substituting the variable free beneath every binder.
  let w = @kernel.mk_var("w", a)
  let s1 = @kernel.vsubst(@list.List([(w, z)]), t1)
  @test.assert_eq(debruijn(s1), debruijn(binder_chain("x", n, w)))
  // Substituting a term that would be captured by the outermost binder.
  let x0 = @kernel.mk_var("x0", a)
  let s2 = @kernel.vsubst(@list.List([(x0, z)]), t1)
  @test.assert_eq(
    @kernel.frees(s2).map(v => @kernel.dest_var(v).0).contains("x0"),
    true,
  )
  @test.assert_eq(debruijn(s2), debruijn(binder_chain("y", n, x0)))
  // Type instantiation through every binder.
  let i1 = @kernel.inst(@list.List([(b, a)]), t1)
  let zb = @kernel.mk_var("z", b)
  @test.assert_eq(@kernel.type_vars_in_term(i1), @list.singleton(b))
  let fb = @kernel.mk_var("f", fn_ty(b, fn_ty(b, b)))
  @test.assert_eq(@kernel.frees(i1), @list.List([fb, zb]))
  // The binding structure survives: compare with an independently built
  // B-typed chain.
  @test.assert_eq(debruijn(i1), debruijn(binder_chain("v", n, zb, a=b)))
  // f a1 a2 ... an (left-nested operator spine) over a curried type.
  let vars = [ for i in 0..<n => @kernel.mk_var("x" + i.to_string(), a) ]
  let mut fty = a
  for _ in 0..<n {
    fty = fn_ty(a, fty)
  }
  let mut spine = @kernel.mk_var("f", fty)
  for i in 0..<n {
    spine = @kernel.mk_comb(spine, vars[i])
  }
  @test.assert_eq(@kernel.type_of(spine), a)
  @test.assert_eq(@kernel.frees(spine).length(), n + 1)
  let spine2 = @kernel.inst(@list.List([(b, a)]), spine)
  @test.assert_eq(@kernel.type_of(spine2), b)
  @test.assert_eq(@kernel.tyvars(fty).length(), 1)
  let th = @kernel.inst_type(@list.List([(b, a)]), @kernel.refl(spine))
  @test.assert_eq(@kernel.hyp(th).length(), 0)
  @test.assert_eq(@kernel.type_of(@kernel.rand(@kernel.concl(th))), b)
}
