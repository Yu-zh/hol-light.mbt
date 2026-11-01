///|
fn show(quotation : String) -> String raise {
  let t = @parser.parse_term(quotation)
  let s = @term_syntax.print_term(t)
  assert_true(@term_syntax.same_term(@term_syntax.parse_term(s), t))
  s
}

///|
test "printing" {
  inspect(show("forall n. n + 0 = n"), content="∀ n : Num, n + 0 == n")
  inspect(
    show("forall p q r. p /\\ q \\/ r ==> ~p"),
    content="∀ p : Bool, ∀ q : Bool, ∀ r : Bool, p && q || r → !p",
  )
  inspect(show("\\x:num y. x * (y + 1)"), content="(x : Num) => (y : Num) => x * (y + 1)")
  inspect(
    show("forall x:num. (if x = 0 then 1 else x) > 0"),
    content="∀ x : Num, (if x == 0 { 1 } else { x }) > 0",
  )
  inspect(show("SUC n = n + 1"), content="SUC((n : Num)) == n + 1")
  inspect(show("[1;2], (T, F)"), content=(
    #|([1, 2], true, false)
  ))
  inspect(show("forall x':num. x' = x'"), content="∀ x' : Num, x' == x'")
}

///|
test "symbolic constants and operators as values" {
  inspect(show("@x:num. x = 1"), content="select((x : Num) => x == 1)")
  inspect(show("?!x:num. x = 1"), content="existsunique((x : Num) => x == 1)")
  inspect(show("(+) 1"), content="op_plus(1)")
  // a binder named like a constant keeps its name: it shadows the
  // constant, as in HOL
  let num = @kernel.mk_type("num", @list.List([]))
  let v = @kernel.mk_var("SUC", num)
  let t = @kernel.mk_abs(v, v)
  let s = @term_syntax.print_term(t)
  assert_true(@term_syntax.parse_term(s) == t)
  inspect(s, content=(
    #|(SUC : Num) => SUC
  ))
  let q = @term_syntax.parse_term("∀ SUC : Num, SUC == SUC")
  assert_true(
    q is Comb(Const("forall", _), Abs(Var("SUC", _) as w, Comb(Comb(Const("=", _), Var("SUC", _) as l), r))) &&
    l == w &&
    r == w,
  )
  // unless the body uses the constant too: in the binder's scope the name
  // would mean the binder, so the binder is renamed
  let suc = @kernel.mk_const("SUC", @list.List([]))
  let t2 = @kernel.mk_abs(v, @kernel.mk_comb(suc, v))
  let s2 = @term_syntax.print_term(t2)
  assert_true(@basics.aconv(@term_syntax.parse_term(s2), t2))
  inspect(s2, content="(SUC' : Num) => SUC(SUC')")
}

///|
test "types" {
  let ty = @term_syntax.print_type
  inspect(ty(@parser.parse_type("num->bool->bool")), content="(Num, Bool) -> Bool")
  inspect(ty(@parser.parse_type("(A->B)->A#B")), content="((A) -> B) -> (A, B)")
  inspect(ty(@parser.parse_type("(num)list")), content="List[Num]")
}

///|
fn round(t : @kernel.Term) -> String raise {
  let s = @term_syntax.print_term(t)
  assert_true(@basics.aconv(@term_syntax.parse_term(s), t))
  s
}

///|
test "spellings that would read back as something else" {
  let num = @kernel.mk_type("num", @list.List([]))
  // a type variable named like a type is not written as that type
  let unit_var = @kernel.mk_vartype("Unit")
  let r = try @term_syntax.print_type(unit_var) catch {
    @term_syntax.Unprintable(_) => "unprintable"
  }
  inspect(r, content="unprintable")
  // nor is an invented one, which a hole would not bring back
  let invented = @kernel.mk_vartype("?123")
  let endo = @basics.mk_fun_ty(invented, invented)
  let r = try @term_syntax.print_type(endo) catch {
    @term_syntax.Unprintable(_) => "unprintable"
  }
  inspect(r, content="unprintable")
  // a numeral not in canonical form keeps its structure
  let bit0 = @kernel.mk_comb(
    @kernel.mk_const("BIT0", @list.List([])),
    @kernel.mk_const("_0", @list.List([])),
  )
  inspect(
    round(@kernel.mk_comb(@kernel.mk_const("NUMERAL", @list.List([])), bit0)),
    content="NUMERAL(BIT0(_0))",
  )
  // a binder named like a keyword is renamed; one named like an interface
  // alias (exists) is not, since the term syntax does not read aliases
  let ex = @kernel.mk_var("exists", num)
  inspect(round(@kernel.mk_abs(ex, ex)), content="(exists : Num) => exists")
  let kw = @kernel.mk_var("let", num)
  inspect(round(@kernel.mk_abs(kw, kw)), content="(v : Num) => v")
}

///|
test "overloaded operators and names" {
  inspect(
    show("forall x y:real. x + y = y + x"),
    content="∀ x : Real, ∀ y : Real, x + y == y + x",
  )
  inspect(
    show("forall x:int. --x * x >= &0"),
    content="∀ x : Int, -x * x >= int_of_num(0)",
  )
  inspect(
    show("forall m n d. d divides m /\\ d divides n ==> d divides m + n"),
    content="∀ m : Num, ∀ n : Num, ∀ d : Num, divides(d, m) && divides(d, n) → divides(d, m + n)",
  )
}

///|
test "invented type variables print as holes" {
  // `{x} INTER s = ...` with nothing to fix the element type: elaboration
  // invents a type variable ?n
  let t = @parser.parse_term("{x} INTER s = if x IN s then {x} else {}")
  let s = @term_syntax.print_term(t)
  assert_true(@term_syntax.same_term(@term_syntax.parse_term(s), t))
  inspect(s, content=(
    #|INTER({(x : _)}, (s : (_) -> Bool)) == (if IN(x, s) { {x} } else { {} })

  ))
}

///|
test "comparisons are not chained" {
  inspect(
    show("forall x y z:num. (x + y = x + z) <=> (y = z)"),
    content="∀ x : Num, ∀ y : Num, ∀ z : Num, (x + y == x + z) == (y == z)",
  )
}

///|
test "exact printing keeps bound variable names" {
  let exact = fn(q : String) -> String raise {
    try @term_syntax.spell_quotation(q, @parser.parse_term(q)) catch {
      @term_syntax.Unprintable(m) => "unprintable: " + m
      e => raise e
    }
  }
  inspect(exact("forall n. n + 0 = n"), content="∀ n : Num, n + 0 == n")
  // an inner binder shadowing an outer one of another type keeps its name
  // when its body does not mention the outer variable
  inspect(
    exact("forall z i. (\\i. z + i) 0 = z"),
    content="∀ z : Num, ∀ i : _, ((i : Num) => z + i)(0) == z",
  )
  // and is renamed when it does: \\i:bool. \\i:num. if (i:bool) then i else 0
  guard @parser.parse_term("\\(i:bool) (j:num). if i then j else 0")
    is Abs(ib, Abs(j, body)) else {
    fail("unexpected reading")
  }
  let inum = @kernel.mk_var("i", @kernel.mk_type("num", @list.List([])))
  let t = @kernel.mk_abs(
    ib,
    @kernel.mk_abs(inum, @kernel.vsubst(@list.List([(inum, j)]), body)),
  )
  let s = @term_syntax.print_term(t)
  assert_true(@basics.aconv(@term_syntax.parse_term(s), t))
  inspect(s, content="(i : Bool) => (i' : Num) => if i { i' } else { 0 }")
}

///|
test "set notation" {
  let exact = fn(q : String) -> String raise {
    try @term_syntax.spell_quotation(q, @parser.parse_term(q)) catch {
      @term_syntax.Unprintable(m) => "unprintable: " + m
      e => raise e
    }
  }
  inspect(exact("{1, 2}"), content=(
    #|{1, 2}
  ))
  inspect(exact("{}:num->bool"), content=(
    #|({} : (Num) -> Bool)

  ))
  inspect(exact("{n | n < 2}"), content=(
    #|{(n : Num) | n < 2}
  ))
  inspect(exact("{x | x IN s /\\ P x}"), content=(
    #|{(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}
  ))
  inspect(exact("{f x | x IN s}"), content=(
    #|{(f : (_) -> _)((x : _)) | IN(x, (s : (_) -> Bool))}
  ))
  inspect(exact("{(x, y) | x < y}"), content=(
    #|{((x : Num), (y : Num)) | x < y}
  ))
  inspect(exact("{t | t SUBSET (s:A->bool)}"), content=(
    #|{(t : (A) -> Bool) | SUBSET(t, (s : (A) -> Bool))}
  ))
  inspect(exact("\\a:A. { b:A | forall s. f(s) = a ==> b IN s}"), content=(
    #|(a : A) => {(b : A) | ∀ s : (A) -> Bool, (f : ((A) -> Bool) -> A)(s) == a → IN(b, s)}
  ))
  inspect(exact("{f | x | x < 2}"), content=(
    #|{(f : _) | x : Num | x < 2}
  ))
  inspect(exact("{x + y | x | x < 2}"), content=(
    #|{(x : Num) + (y : Num) | x < 2}
  ))
  inspect(exact("{t | t SUBSET s /\\ t HAS_SIZE m} HAS_SIZE binom(n,m)"), content=(
    #|HAS_SIZE({(t : (_) -> Bool) | SUBSET(t, (s : (_) -> Bool)) && HAS_SIZE(t, (m : Num))}, (binom : ((_, Num)) -> Num)(((n : _), m)))
  ))
}

///|
test "set notation reads as HOL's" {
  // the same term, GEN%PVAR binders included, as the quotation syntax
  for q in [
    ("{(n : Num) | n < 2}", "{n:num | n < 2}"),
    ("{f(x) | x : Num | x < 2}", "{f x | x:num | x < 2}"),
    ("{1, 2}", "{1, 2}"),
  ] {
    let a = @term_syntax.parse_term(q.0)
    let b = @parser.parse_term(q.1)
    assert_true(@term_syntax.same_term(a, b), msg=q.0)
  }
}

///|
test "nested set comprehensions number GEN%PVAR as HOL's parser does" {
  let exact = fn(q : String) -> String raise {
    try @term_syntax.spell_quotation(q, @parser.parse_term(q)) catch {
      @term_syntax.Unprintable(m) => "unprintable: " + m
      e => raise e
    }
  }
  // HOL reads the element of {e | p} twice and of {e | vs | p} three
  // times, so the two forms number the comprehensions in e differently
  inspect(exact("{ {x | x < n} | n < 3}"), content=(
    #|{{(x : Num) | x < (n : Num)} | n < 3}
  ))
  inspect(exact("{ {x | x < n} | n | n < 3}"), content=(
    #|{{(x : Num) | x < n} | n : Num | n < 3}
  ))
  inspect(exact("{ { {x | x < m + n} | m < n} | n < 3}"), content=(
    #|{{{(x : Num) | x < (m : Num) + (n : Num)} | m < n} | (n : Num) < 3}
  ))
  inspect(exact("{ {x | x < n} | n IN {m | m < 3}}"), content=(
    #|{{(x : Num) | x < (n : Num)} | IN(n, {(m : Num) | m < 3})}
  ))
  // each comprehension takes its own form: here the outer one lists its
  // binders and the middle one does not
  inspect(exact("{{{x | x < n + m} | m < 3} | n | n < 3}"), content=(
    #|{{{(x : Num) | x < n + (m : Num)} | m < 3} | n : Num | n < 3}
  ))
  // a comprehension spelt GSPEC takes no name
  inspect(
    exact("({ {x | x < n} | n | n < 3}, GSPEC (\\g:num. SETSPEC g T (x:num)))"),
    content=(
      #|({{(x : Num) | x < n} | n : Num | n < 3}, GSPEC((g : Num) => SETSPEC(g, true, (x : Num))))
    ),
  )
  inspect(
    exact("({ {x | x < n} | n | n < 3}, GSPEC (\\g:num. ?x:num. SETSPEC g T x))"),
    content=(
      #|({{(x : Num) | x < n} | n : Num | n < 3}, GSPEC((g : Num) => ∃ x : Num, SETSPEC(g, true, x)))
    ),
  )
  // a comprehension with no binders has only one form
  inspect(
    exact(
      "{({0 | {{{0 | T} | T} | T} = {{{0}}}}, { {x | x < m} | m | m < n}) | n | n < 3}",
    ),
    content=(
      #|{({0 | {{{0 | true} | true} | true} == {{{0}}}}, {{(x : Num) | x < m} | m : Num | m < n}) | n : Num | n < 3}
    ),
  )
  // the forms are read off the numbering, however many comprehensions
  let nine = Array::make(9, "{ {x | x < n} | n | n < 3}")
  let spelled = exact("[" + nine.join("; ") + "]")
  inspect(spelled.contains("unprintable"), content="false")
  // a set of one comprehension reads it once
  inspect(exact("{ {x | x < 3} }"), content=(
    #|{{(x : Num) | x < 3}}
  ))
}

///|
test "set notation: binders, counters, degenerate comprehensions" {
  // a binder renamed because it is named like a constant (T) does not
  // capture a variable of the new name
  let t = @term_syntax.parse_term("{T' | T : Bool | T != T'}")
  assert_true(@kernel.frees(t).contains(@kernel.mk_var("T'", @kernel.bool_ty)))
  // checking a spelling leaves the GEN%PVAR counter as it was
  let s = @parser.parse_term("{n | n < 2}")
  let before = @parser.pgen_count()
  ignore(@term_syntax.print_term(s))
  ignore(@term_syntax.spell_quotation("{n | n < 2}", s))
  assert_eq(@parser.pgen_count(), before)
  // a comprehension with no binders to list is written as GSPEC
  inspect(
    @term_syntax.print_term(
      @parser.parse_term("GSPEC (\\g:num. SETSPEC g T (x:num))"),
    ),
    content=(
      #|GSPEC((g : Num) => SETSPEC(g, true, (x : Num)))
    ),
  )
}

///|
test "set notation: review cases" {
  // binders named T and F keep their names
  let t = @term_syntax.parse_term("{T | T : Bool, F : Bool | T != F}")
  inspect(@term_syntax.print_term(t), content=(
    #|{T | T : Bool, F : Bool | !(T == F)}
  ))
  // an inner binding of the same variable does not take the outer
  // binder's type annotation
  let q = "{((\\x:A. x), (x:A)) | T}"
  inspect(
    try @term_syntax.spell_quotation(q, @parser.parse_term(q)) catch {
      @term_syntax.Unprintable(m) => "unprintable: " + m
      e => raise e
    },
    content=(
      #|{((x : A) => x, (x : A)) | true}
    ),
  )
}

///|
test "set notation: spelled-out GSPEC and renamed binders" {
  let spell = fn(q : String) -> String raise {
    try @term_syntax.spell_quotation(q, @parser.parse_term(q)) catch {
      @term_syntax.Unprintable(m) => "unprintable: " + m
      e => raise e
    }
  }
  // a quotation that spells GSPEC out keeps its own binder
  inspect(spell("GSPEC (\\g:num. ?x:num. SETSPEC g T x)"), content=(
    #|GSPEC((g : Num) => ∃ x : Num, SETSPEC(g, true, x))
  ))
  // {T | T} binds nothing, in HOL and in the term syntax alike: a name like
  // T is no variable a comprehension binds implicitly, even under a binder
  inspect(
    @term_syntax.print_term(@parser.parse_term("\\T:bool. {T | T}")),
    content=(
      #|(T : Bool) => {T | T}
    ),
  )
}

///|
test "a symbolic variable, as the left side of a definition" {
  let q = "(s --> t) = {f:A->B | forall x. x IN s ==> f(x) IN t}"
  @printer.parse_as_infix("-->", (13L, "right"))
  let t = @parser.parse_term(q)
  let s = @term_syntax.spell_quotation(q, t)
  inspect(s, content=(
    #|(op_minus_minus_gt : ((A) -> Bool, (B) -> Bool, (A) -> B) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == {(f : (A) -> B) | ∀ x : A, IN(x, s) → IN(f(x), t)}
  ))
  // it reads back as the variable -->, not as op_minus_minus_gt
  assert_true(
    @kernel.frees(@term_syntax.parse_term(s)).iter().any(v => v is Var("-->", _)),
  )
}

///|
test "op_ names decode only in their own spelling" {
  // a non-canonical op_ spelling stays an ordinary variable
  let t = @term_syntax.parse_term("(op_left_dot_product : Bool) == op_left_dot_pro_duct")
  inspect(@kernel.frees(t).length(), content="2")
  // a generated name is never decoded
  let g = @term_syntax.parse_term("(op_GEN_pct_PVAR_pct_0 : Num) == 0")
  assert_true(
    @kernel.frees(g).iter().all(v => !(v is Var(n, _) && n.has_prefix("GEN%PVAR%"))),
  )
  // a binder spelt op_ is kept as it is
  inspect(
    @term_syntax.print_term(@term_syntax.parse_term("(op_minus_minus_gt : Bool) => op_minus_minus_gt")),
    content=(
      #|(op_minus_minus_gt : Bool) => op_minus_minus_gt
    ),
  )
}

///|
test "names are read the same under any overload priority" {
  let real = @kernel.mk_type("real", @list.List([]))
  let num = @kernel.mk_type("num", @list.List([]))
  let saved = @term_syntax.fixed_resolution.val
  @term_syntax.fixed_resolution.val = true
  defer {
    @term_syntax.fixed_resolution.val = saved
  }
  @preterm.with_interface_restored(() => {
    @preterm.prioritize_overload(real)
    // the quotation syntax follows the priority...
    assert_eq(@kernel.type_of(@parser.parse_term("x + y")), real)
    // ...the term syntax does not: types decide, else the fixed order
    assert_eq(@kernel.type_of(@term_syntax.parse_term("x + y")), num)
    assert_eq(
      @kernel.type_of(@term_syntax.parse_term("(x : Real) + y")),
      real,
    )
  })
  @preterm.with_interface_restored(() => {
    @preterm.prioritize_overload(num)
    assert_eq(@kernel.type_of(@term_syntax.parse_term("x + y")), num)
  })
}

///|
test "replacing an overload does not change a context-free reading" {
  let saved = @term_syntax.fixed_resolution.val
  @term_syntax.fixed_resolution.val = true
  defer {
    @term_syntax.fixed_resolution.val = saved
  }
  let before = @kernel.type_of(@term_syntax.parse_term("op_amp(0)"))
  @preterm.with_interface_restored(() => {
    // as Jordan's prioritize_real does: & now means only real_of_num
    @preterm.override_interface("&", @kernel.mk_const("real_of_num", @list.List([])))
    assert_eq(@kernel.type_of(@term_syntax.parse_term("op_amp(0)")), before)
  })
}

///|
test "binders named T and F bind variables, as in HOL" {
  fn spell(q : String) -> String raise {
    @term_syntax.spell_quotation(q, @parser.parse_term(q))
  }
  // the binder keeps its name and its annotation
  inspect(spell("\\T. T + 1"), content="(T : Num) => T + 1")
  inspect(spell("forall F. F + 0 = F"), content="∀ F : Num, F + 0 == F")
  // truth and falsity under such a binder stay the constants
  inspect(
    spell("\\T. T + (if F then 1 else 0)"),
    content="(T : Num) => T + (if false { 1 } else { 0 })",
  )
  inspect(spell("forall T:bool. T \\/ ~T"), content="∀ T : Bool, T || !T")
  // true under a binder named T is truth, not the bound variable (HOL's
  // own \T. ... T ... would mean the variable, hence the primed name here)
  let t = @term_syntax.parse_term("(T : Num) => T + (if true { 1 } else { 0 })")
  inspect(
    @term_syntax.same_term(t, @parser.parse_term("\\T'. T' + (if T then 1 else 0)")),
    content="true",
  )
}

///|
test "binders named T and F: comprehensions and patterns" {
  // the comprehension under a binder named T keeps its listed binders
  let t = @term_syntax.parse_term(
    "(T : Bool) => {(x, y) | x : Num, y : Num | T}",
  )
  assert_true(@term_syntax.same_term(@term_syntax.parse_term(@term_syntax.print_term(t)), t))
  // a comprehension's own binder named T is listed
  for q in ["{T | T : Bool | true}", "{F | F : Bool | F}"] {
    let c = @term_syntax.parse_term(q)
    assert_true(@term_syntax.same_term(@term_syntax.parse_term(@term_syntax.print_term(c)), c))
  }
  // under a pattern variable named T (printed T'), a comprehension's T is
  // listed
  let g = @term_syntax.parse_term(
    "GABS((f : ((Bool, Num)) -> (Bool) -> Bool) => ∀ T : Bool, ∀ x : Num, GEQ(f((T, x)), {T | T : Bool | true}))",
  )
  assert_true(@term_syntax.same_term(@term_syntax.parse_term(@term_syntax.print_term(g)), g))
  // in a lambda's pattern, read with nothing in scope, an outer T does
  // not make a comprehension's T a variable
  for q in ["(T : Bool) => fn { {T | T : Bool | true} => T }", "(F : Bool) => fn { {F | F : Bool | true} => F }"] {
    let c = @term_syntax.parse_term(q)
    assert_true(@term_syntax.same_term(@term_syntax.parse_term(@term_syntax.print_term(c)), c))
  }
  // comprehensions inside patterns (Codex)
  for q in [
    "(T : Bool) => ∀ ({T | T : Bool | true}, x) : ((Bool) -> Bool, Num), T",
    "fn { ((T : Bool) => {(x, y) | x : Num, y : Num | T}) => true }",
  ] {
    let c = @term_syntax.parse_term(q)
    assert_true(@term_syntax.same_term(@term_syntax.parse_term(@term_syntax.print_term(c)), c))
  }
  // a pattern variable named T is renamed: a pattern's T is truth
  let m = @parser.parse_term("match (x:bool) with T' -> T'")
  let s = @term_syntax.print_term(m)
  assert_true(@term_syntax.same_term(@term_syntax.parse_term(s), m))
}

///|
test "a comprehension applied to an argument is written in set notation" {
  let exact = fn(q : String) -> String raise {
    try @term_syntax.spell_quotation(q, @parser.parse_term(q)) catch {
      @term_syntax.Unprintable(m) => "unprintable: " + m
      e => raise e
    }
  }
  // GSPEC (\g. ...) y: spelled out, its binder would be a GEN%PVAR name
  inspect(exact("{x | x < c} b"), content=(
    #|{(x : Num) | x < (c : Num)}((b : Num))
  ))
  inspect(exact("s SUBSET u <=> {t:num->bool | t SUBSET u} s"), content=(
    #|SUBSET((s : (Num) -> Bool), (u : (Num) -> Bool)) == {(t : (Num) -> Bool) | SUBSET(t, u)}(s)
  ))
  // in the predicate and in the element of another comprehension
  inspect(exact("{f x | {g y | P y} (x:num)} = {f(g y) | P (y:num)}"), content=(
    #|{(f : (Num) -> _)((x : Num)) | {(g : (Num) -> Num)((y : Num)) | (P : (Num) -> Bool)(y)}(x)} == {f(g((y : Num))) | P(y)}
  ))
  inspect(exact("{ {x | x < n} m | n < 3 /\\ m < n}"), content=(
    #|{{(x : Num) | x < (n : Num)}((m : Num)) | n < 3 && m < n}
  ))
  inspect(exact("{x | x < 2} = {y | y < 2} /\\ {x | x < 3} 1"), content=(
    #|{(x : Num) | x < 2} == {(y : Num) | y < 2} && {(x : Num) | x < 3}(1)
  ))
}
