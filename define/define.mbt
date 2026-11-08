// Translated from upstream define.ml; edit this file directly.

///|
/// CASEWISE_DEF
fn step_1() -> Unit raise {
  let t1 = @term_syntax.parse_term("(CASEWISE : (List[((_) -> _, (_, _) -> _)], _, _) -> _)(NIL, (f : _), (x : _)) == select((y : _) => true) && CASEWISE(CONS((h : ((_) -> _, (_, _) -> _)), (t : List[((_) -> _, (_, _) -> _)])), f, x) == (if (∃ y : _, FST(h, y) == x) { SND(h, f, select((y : _) => FST(h, y) == x)) } else { CASEWISE(t, f, x) })")
  casewise_def_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t1),
  )
}

///|
let casewise_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CASEWISE_DEF")

///|
/// `CASEWISE_DEF`
pub fn casewise_def() -> @kernel.Thm {
  casewise_def_c.get()
}

///|
/// CASEWISE
fn step_2() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([casewise_def()]))
  casewise_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(CASEWISE : (List[((_) -> _, (_, _) -> _)], _, _) -> _)((NIL : List[((_) -> _, (_, _) -> _)]), (f : _), (x : _)) == select((y : _) => true) && CASEWISE(CONS(((s : (_) -> _), (t : (_, _) -> _)), (clauses : List[((_) -> _, (_, _) -> _)])), f, x) == (if (∃ y : _, s(y) == x) { t(f, select((y : _) => s(y) == x)) } else { CASEWISE(clauses, f, x) })"),
      t2,
    ),
  )
}

///|
let casewise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CASEWISE")

///|
/// `CASEWISE`
pub fn casewise() -> @kernel.Thm {
  casewise_c.get()
}

///|
/// CASEWISE_CASES
fn step_3() -> Unit raise {
  let t5 = @meson.asm_meson_tac(@list.List([]))
  let t4 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3 = @simp.rewrite_tac(
    @list.List([
      @lists.mem(),
      casewise(),
      @pair.forall_pair_thm(),
      @pair.pair_eq(),
    ]),
  )
  let t6 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t3),
        t4,
      ),
      @class.cond_cases_tac,
    ),
    t5,
  )
  casewise_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ clauses : List[((_) -> _, (_, _) -> _)], ∀ c : _, ∀ x : _, (∃ s : (_) -> _, ∃ t : (_, _) -> _, ∃ a : _, MEM((s, t), clauses) && s(a) == x && CASEWISE(clauses, c, x) == t(c, a)) || !(∃ s : (_) -> _, ∃ t : (_, _) -> _, ∃ a : _, MEM((s, t), clauses) && s(a) == x) && CASEWISE(clauses, c, x) == select((y : _) => true)"),
      t6,
    ),
  )
}

///|
let casewise_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CASEWISE_CASES")

///|
/// `CASEWISE_CASES`
pub fn casewise_cases() -> @kernel.Thm {
  casewise_cases_c.get()
}

///|
/// CASEWISE_WORKS
fn step_4() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([casewise_cases()]))
  let t8 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([@equal.gsym(@lists.all_mem()), @pair.forall_pair_thm()]),
    ),
    t7,
  )
  casewise_works_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ clauses : List[((P) -> A, (C, P) -> B)], ∀ c : C, (∀ s : (P) -> A, ∀ t : (C, P) -> B, ∀ s' : (P) -> A, ∀ t' : (C, P) -> B, ∀ x : P, ∀ y : P, MEM((s, t), clauses) && MEM((s', t'), clauses) && s(x) == s'(y) → t(c, x) == t'(c, y)) → ALL(fn { (s, t) => ∀ x : P, CASEWISE(clauses, c, s(x)) == t(c, x) }, clauses)"),
      t8,
    ),
  )
}

///|
let casewise_works_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CASEWISE_WORKS")

///|
/// `CASEWISE_WORKS`
pub fn casewise_works() -> @kernel.Thm {
  casewise_works_c.get()
}

///|
/// admissible
fn step_5() -> Unit raise {
  admissible_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(admissible : ((_, _) -> Bool, ((_) -> _, _) -> Bool, (_) -> _, ((_) -> _, _) -> _) -> Bool)((op_lt_lt : (_, _) -> Bool), (p : ((_) -> _, _) -> Bool), (s : (_) -> _), (t : ((_) -> _, _) -> _)) == (∀ f : (_) -> _, ∀ g : (_) -> _, ∀ a : _, p(f, a) && p(g, a) && (∀ z : _, op_lt_lt(z, s(a)) → f(z) == g(z)) → t(f, a) == t(g, a))"),
    ),
  )
}

///|
let admissible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("admissible")

///|
/// `admissible`
pub fn admissible() -> @kernel.Thm {
  admissible_c.get()
}

///|
/// tailadmissible
fn step_6() -> Unit raise {
  tailadmissible_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(tailadmissible : ((A, A) -> Bool, ((A) -> B, P) -> Bool, (P) -> A, ((A) -> B, P) -> B) -> Bool)((op_lt_lt : (A, A) -> Bool), (p : ((A) -> B, P) -> Bool), (s : (P) -> A), (t : ((A) -> B, P) -> B)) == (∃ P : ((A) -> B, P) -> Bool, ∃ G : ((A) -> B, P) -> A, ∃ H : ((A) -> B, P) -> B, (∀ f : (A) -> B, ∀ a : P, ∀ y : A, P(f, a) && op_lt_lt(y, G(f, a)) → op_lt_lt(y, s(a))) && (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ a : P, (∀ z : A, op_lt_lt(z, s(a)) → f(z) == g(z)) → P(f, a) == P(g, a) && G(f, a) == G(g, a) && H(f, a) == H(g, a)) && (∀ f : (A) -> B, ∀ a : P, p(f, a) → t(f, a) == (if P(f, a) { f(G(f, a)) } else { H(f, a) })))"),
    ),
  )
}

///|
let tailadmissible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tailadmissible")

///|
/// `tailadmissible`
pub fn tailadmissible() -> @kernel.Thm {
  tailadmissible_c.get()
}

///|
/// superadmissible
fn step_7() -> Unit raise {
  superadmissible_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(superadmissible : ((_, _) -> Bool, ((_) -> _, _) -> Bool, (_) -> _, ((_) -> _, _) -> _) -> Bool)((op_lt_lt : (_, _) -> Bool), (p : ((_) -> _, _) -> Bool), (s : (_) -> _), (t : ((_) -> _, _) -> _)) == (admissible(op_lt_lt, (f : (_) -> _) => (a : _) => true, s, p) → tailadmissible(op_lt_lt, p, s, t))"),
    ),
  )
}

///|
let superadmissible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "superadmissible",
)

///|
/// `superadmissible`
pub fn superadmissible() -> @kernel.Thm {
  superadmissible_c.get()
}

///|
/// MATCH_SEQPATTERN
fn step_8() -> Unit raise {
  let t9 = @meson.meson_tac(@list.List([]))
  let t10 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@pair._match(), @pair._seqpattern()])),
    t9,
  )
  match_seqpattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("_MATCH((x : _), _SEQPATTERN((r : (_, _) -> Bool), (s : (_, _) -> Bool))) == (if (∃ y : _, r(x, y)) { _MATCH(x, r) } else { _MATCH(x, s) })"),
      t10,
    ),
  )
}

///|
let match_seqpattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MATCH_SEQPATTERN",
)

///|
/// `MATCH_SEQPATTERN`
pub fn match_seqpattern() -> @kernel.Thm {
  match_seqpattern_c.get()
}

///|
/// ADMISSIBLE_CONST
fn step_9() -> Unit raise {
  let t11 = @simp.rewrite_tac(@list.List([admissible()]))
  admissible_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : ((_) -> _, _) -> Bool, ∀ s : (_) -> _, ∀ c : (_) -> _, admissible((op_lt_lt : (_, _) -> Bool), p, s, (f : (_) -> _) => c)"),
      t11,
    ),
  )
}

///|
let admissible_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_CONST",
)

///|
/// `ADMISSIBLE_CONST`
pub fn admissible_const() -> @kernel.Thm {
  admissible_const_c.get()
}

///|
/// ADMISSIBLE_BASE
fn step_10() -> Unit raise {
  let t12 = @meson.meson_tac(@list.List([]))
  let t13 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([admissible()])),
    t12,
  )
  admissible_base_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ t : (P) -> A, (∀ f : (A) -> B, ∀ a : P, p(f, a) → `<<`(t(a), s(a))) → admissible(`<<`, p, s, (f : (A) -> B) => (x : P) => f(t(x)))"),
      t13,
    ),
  )
}

///|
let admissible_base_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_BASE",
)

///|
/// `ADMISSIBLE_BASE`
pub fn admissible_base() -> @kernel.Thm {
  admissible_base_c.get()
}

///|
/// ADMISSIBLE_COMB
fn step_11() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([]))
  let t15 = @tactics.then_tac(@simp.simp_tac(@list.List([admissible()])), t14)
  admissible_comb_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ g : ((A) -> B, P, C) -> D, ∀ y : ((A) -> B, P) -> C, admissible(`<<`, p, s, g) && admissible(`<<`, p, s, y) → admissible(`<<`, p, s, (f : (A) -> B) => (x : P) => g(f, x, y(f, x)))"),
      t15,
    ),
  )
}

///|
let admissible_comb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_COMB",
)

///|
/// `ADMISSIBLE_COMB`
pub fn admissible_comb() -> @kernel.Thm {
  admissible_comb_c.get()
}

///|
/// ADMISSIBLE_RAND
fn step_12() -> Unit raise {
  let t16 = @meson.meson_tac(@list.List([]))
  let t17 = @tactics.then_tac(@simp.simp_tac(@list.List([admissible()])), t16)
  admissible_rand_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ g : (P, C) -> D, ∀ y : ((A) -> B, P) -> C, admissible(`<<`, p, s, y) → admissible(`<<`, p, s, (f : (A) -> B) => (x : P) => g(x, y(f, x)))"),
      t17,
    ),
  )
}

///|
let admissible_rand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_RAND",
)

///|
/// `ADMISSIBLE_RAND`
pub fn admissible_rand() -> @kernel.Thm {
  admissible_rand_c.get()
}

///|
/// ADMISSIBLE_LAMBDA
fn step_13() -> Unit raise {
  let t18 = @meson.meson_tac(@list.List([]))
  let t19 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([admissible(), @class.fun_eq_thm(), @pair.forall_pair_thm()]),
    ),
    t18,
  )
  admissible_lambda_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ t : ((A) -> B, C, P) -> Bool, admissible(`<<`, (f : (A) -> B) => fn { (u, x) => p(f, x) }, fn { (u, x) => s(x) }, (f : (A) -> B) => fn { (u, x) => t(f, u, x) }) → admissible(`<<`, p, s, (f : (A) -> B) => (x : P) => (u : C) => t(f, u, x))"),
      t19,
    ),
  )
}

///|
let admissible_lambda_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_LAMBDA",
)

///|
/// `ADMISSIBLE_LAMBDA`
pub fn admissible_lambda() -> @kernel.Thm {
  admissible_lambda_c.get()
}

///|
/// ADMISSIBLE_NEST
fn step_14() -> Unit raise {
  let t20 = @meson.meson_tac(@list.List([]))
  let t21 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([admissible()])),
    t20,
  )
  admissible_nest_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ t : ((A) -> B, P) -> A, admissible(`<<`, p, s, t) && (∀ f : (A) -> B, ∀ a : P, p(f, a) → `<<`(t(f, a), s(a))) → admissible(`<<`, p, s, (f : (A) -> B) => (x : P) => f(t(f, x)))"),
      t21,
    ),
  )
}

///|
let admissible_nest_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_NEST",
)

///|
/// `ADMISSIBLE_NEST`
pub fn admissible_nest() -> @kernel.Thm {
  admissible_nest_c.get()
}

///|
/// ADMISSIBLE_COND
fn step_15() -> Unit raise {
  let t28 = @meson.asm_meson_tac(@list.List([]))
  let t27 = @simp.asm_rewrite_tac(@list.List([]))
  let t26 = @tactics.disch_then(fn(
    x24 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x24
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t23 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
  )
  let t22 = @simp.rewrite_tac(
    @list.List([admissible(), @theorems.and_forall_thm()]),
  )
  let t29 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t22),
          t23,
        ),
        t26,
      ),
      t27,
    ),
    t28,
  )
  admissible_cond_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (_, _) -> Bool, ∀ p : ((_) -> _, P) -> Bool, ∀ P : ((_) -> _, P) -> Bool, ∀ s : (P) -> _, ∀ h : ((_) -> _, P) -> _, ∀ k : ((_) -> _, P) -> _, admissible(`<<`, p, s, P) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && P(f, x), s, h) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && !P(f, x), s, k) → admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => if P(f, x) { h(f, x) } else { k(f, x) })"),
      t29,
    ),
  )
}

///|
let admissible_cond_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_COND",
)

///|
/// `ADMISSIBLE_COND`
pub fn admissible_cond() -> @kernel.Thm {
  admissible_cond_c.get()
}

///|
/// ADMISSIBLE_MATCH
fn step_16() -> Unit raise {
  let t32 = @meson.asm_meson_tac(@list.List([]))
  let t31 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t30 = @tactics.repeat_tac(@tactics.strip_tac)
  let t33 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([admissible(), @pair._match()])),
        t30,
      ),
      t31,
    ),
    t32,
  )
  admissible_match_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (_, _) -> Bool, ∀ p : ((_) -> _, P) -> Bool, ∀ s : (P) -> _, ∀ e : ((_) -> _, P) -> _, ∀ c : ((_) -> _, P, _, _) -> Bool, admissible(`<<`, p, s, e) && admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => c(f, x, e(f, x))) → admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => _MATCH(e(f, x), c(f, x)))"),
      t33,
    ),
  )
}

///|
let admissible_match_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_MATCH",
)

///|
/// `ADMISSIBLE_MATCH`
pub fn admissible_match() -> @kernel.Thm {
  admissible_match_c.get()
}

///|
/// ADMISSIBLE_SEQPATTERN
fn step_17() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([]))
  let t35 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@pair._seqpattern(), admissible()])),
    t34,
  )
  admissible_seqpattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (_, _) -> Bool, ∀ p : ((_) -> _, P) -> Bool, ∀ s : (P) -> _, ∀ c1 : ((_) -> _, P, _, _) -> Bool, ∀ c2 : ((_) -> _, P, _, _) -> Bool, ∀ e : ((_) -> _, P) -> _, admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => ∃ y : _, c1(f, x, e(f, x), y)) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && (∃ y : _, c1(f, x, e(f, x), y)), s, (f : (_) -> _) => (x : P) => c1(f, x, e(f, x))) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && !(∃ y : _, c1(f, x, e(f, x), y)), s, (f : (_) -> _) => (x : P) => c2(f, x, e(f, x))) → admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => _SEQPATTERN(c1(f, x), c2(f, x), e(f, x)))"),
      t35,
    ),
  )
}

///|
let admissible_seqpattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_SEQPATTERN",
)

///|
/// `ADMISSIBLE_SEQPATTERN`
pub fn admissible_seqpattern() -> @kernel.Thm {
  admissible_seqpattern_c.get()
}

///|
/// ADMISSIBLE_UNGUARDED_PATTERN
fn step_18() -> Unit raise {
  let t40 = @meson.asm_meson_tac(@list.List([]))
  let t39 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("(a : Bool) == (a' : Bool) && (a && a' → (b : Bool) == (b' : Bool)) → (a && b) == (a' && b')"),
    ),
  )
  let t38 = @tactics.repeat_tac(@tactics.strip_tac)
  let t37 = @simp.rewrite_tac(@list.List([@pair.geq_def()]))
  let t36 = @simp.rewrite_tac(
    @list.List([
      admissible(),
      @pair.forall_pair_thm(),
      @pair._unguarded_pattern(),
    ]),
  )
  let t41 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t36),
          t37,
        ),
        t38,
      ),
      t39,
    ),
    t40,
  )
  admissible_unguarded_pattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (_, _) -> Bool, ∀ p : ((_) -> _, P) -> Bool, ∀ s : (P) -> _, ∀ pat : ((_) -> _, P) -> _, ∀ e : ((_) -> _, P) -> _, ∀ t : ((_) -> _, P) -> _, ∀ y : ((_) -> _, P) -> _, admissible(`<<`, p, s, pat) && admissible(`<<`, p, s, e) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && pat(f, x) == e(f, x), s, t) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && pat(f, x) == e(f, x), s, y) → admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => _UNGUARDED_PATTERN(GEQ(pat(f, x), e(f, x)), GEQ(t(f, x), y(f, x))))"),
      t41,
    ),
  )
}

///|
let admissible_unguarded_pattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_UNGUARDED_PATTERN",
)

///|
/// `ADMISSIBLE_UNGUARDED_PATTERN`
pub fn admissible_unguarded_pattern() -> @kernel.Thm {
  admissible_unguarded_pattern_c.get()
}

///|
/// ADMISSIBLE_GUARDED_PATTERN
fn step_19() -> Unit raise {
  let t48 = @meson.asm_meson_tac(@list.List([]))
  let t47 = @tactics.try_tac(
    @tactics.match_mp_tac(
      @meson.meson(
        @list.List([]),
        @term_syntax.parse_term("(x : _) == (x' : _) && (y : _) == (y' : _) → (x == y) == (x' == y')"),
      ),
    ),
  )
  let t45 = @tactics.repeat_tac(@tactics.strip_tac)
  let t46 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(
        @class.taut(
          @term_syntax.parse_term("(a : Bool) == (a' : Bool) && (a && a' → (b : Bool) == (b' : Bool)) → (a && b) == (a' && b')"),
        ),
      ),
      t45,
    ),
  )
  let t44 = @tactics.repeat_tac(@tactics.strip_tac)
  let t43 = @simp.rewrite_tac(@list.List([@pair.geq_def()]))
  let t42 = @simp.rewrite_tac(
    @list.List([admissible(), @pair.forall_pair_thm(), @pair._guarded_pattern()]),
  )
  let t49 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t42),
            t43,
          ),
          t44,
        ),
        t46,
      ),
      t47,
    ),
    t48,
  )
  admissible_guarded_pattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (_, _) -> Bool, ∀ p : ((_) -> _, P) -> Bool, ∀ s : (P) -> _, ∀ pat : ((_) -> _, P) -> _, ∀ q : ((_) -> _, P) -> Bool, ∀ e : ((_) -> _, P) -> _, ∀ t : ((_) -> _, P) -> _, ∀ y : ((_) -> _, P) -> _, admissible(`<<`, p, s, pat) && admissible(`<<`, p, s, e) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && pat(f, x) == e(f, x) && q(f, x), s, t) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && pat(f, x) == e(f, x), s, q) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && pat(f, x) == e(f, x) && q(f, x), s, y) → admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => _GUARDED_PATTERN(GEQ(pat(f, x), e(f, x)), q(f, x), GEQ(t(f, x), y(f, x))))"),
      t49,
    ),
  )
}

///|
let admissible_guarded_pattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_GUARDED_PATTERN",
)

///|
/// `ADMISSIBLE_GUARDED_PATTERN`
pub fn admissible_guarded_pattern() -> @kernel.Thm {
  admissible_guarded_pattern_c.get()
}

///|
/// ADMISSIBLE_NSUM
fn step_20() -> Unit raise {
  let t52 = @meson.asm_meson_tac(@list.List([]))
  let t51 = @tactics.match_mp_tac(@iterate.nsum_eq_numseg())
  let t50 = @tactics.repeat_tac(@tactics.strip_tac)
  let t53 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([admissible(), @pair.forall_pair_thm()])),
        t50,
      ),
      t51,
    ),
    t52,
  )
  admissible_nsum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (B, A) -> Bool, ∀ p : ((B) -> C, P) -> Bool, ∀ s : (P) -> A, ∀ h : ((B) -> C, P, Num) -> Num, ∀ a : (P) -> Num, ∀ b : (P) -> Num, admissible(`<<`, (f : (B) -> C) => fn { (k, x) => a(x) <= k && k <= b(x) && p(f, x) }, fn { (k, x) => s(x) }, (f : (B) -> C) => fn { (k, x) => h(f, x, k) }) → admissible(`<<`, p, s, (f : (B) -> C) => (x : P) => nsum(op_dot_dot(a(x), b(x)), h(f, x)))"),
      t53,
    ),
  )
}

///|
let admissible_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_NSUM",
)

///|
/// `ADMISSIBLE_NSUM`
pub fn admissible_nsum() -> @kernel.Thm {
  admissible_nsum_c.get()
}

///|
/// ADMISSIBLE_SUM
fn step_21() -> Unit raise {
  let t56 = @meson.asm_meson_tac(@list.List([]))
  let t55 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t54 = @tactics.repeat_tac(@tactics.strip_tac)
  let t57 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(@list.List([admissible(), @pair.forall_pair_thm()])),
        t54,
      ),
      t55,
    ),
    t56,
  )
  admissible_sum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (B, A) -> Bool, ∀ p : ((B) -> C, P) -> Bool, ∀ s : (P) -> A, ∀ h : ((B) -> C, P, Num) -> Real, ∀ a : (P) -> Num, ∀ b : (P) -> Num, admissible(`<<`, (f : (B) -> C) => fn { (k, x) => a(x) <= k && k <= b(x) && p(f, x) }, fn { (k, x) => s(x) }, (f : (B) -> C) => fn { (k, x) => h(f, x, k) }) → admissible(`<<`, p, s, (f : (B) -> C) => (x : P) => sum(op_dot_dot(a(x), b(x)), h(f, x)))"),
      t57,
    ),
  )
}

///|
let admissible_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADMISSIBLE_SUM")

///|
/// `ADMISSIBLE_SUM`
pub fn admissible_sum() -> @kernel.Thm {
  admissible_sum_c.get()
}

///|
/// ADMISSIBLE_MAP
fn step_22() -> Unit raise {
  let t66 = @meson.asm_meson_tac(@list.List([]))
  let t65 = @simp.asm_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t64 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t63 = @tactics.repeat_tac(@tactics.strip_tac)
  let t62 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t61 = @tactics.match_mp_tac(@lists.map_eq())
  let t60 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t59 = @tactics.match_mp_tac(
    @meson.meson(
      @list.List([]),
      @term_syntax.parse_term("(x : List[_]) == (y : List[_]) && MAP((f : (_) -> _), x) == MAP((g : (_) -> _), x) → MAP(f, x) == MAP(g, y)"),
    ),
  )
  let t58 = @tactics.repeat_tac(@tactics.strip_tac)
  let t67 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @simp.rewrite_tac(
                        @list.List([admissible(), @pair.forall_pair_thm()]),
                      ),
                      t58,
                    ),
                    t59,
                  ),
                  @tactics.conj_tac,
                ),
                t60,
              ),
              t61,
            ),
            t62,
          ),
          t63,
        ),
        t64,
      ),
      t65,
    ),
    t66,
  )
  admissible_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, _) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> _, ∀ h : ((A) -> B, P, _) -> _, ∀ l : ((A) -> B, P) -> List[_], admissible(`<<`, p, s, l) && admissible(`<<`, (f : (A) -> B) => fn { (y, x) => p(f, x) && MEM(y, l(f, x)) }, fn { (y, x) => s(x) }, (f : (A) -> B) => fn { (y, x) => h(f, x, y) }) → admissible(`<<`, p, s, (f : (A) -> B) => (x : P) => MAP(h(f, x), l(f, x)))"),
      t67,
    ),
  )
}

///|
let admissible_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADMISSIBLE_MAP")

///|
/// `ADMISSIBLE_MAP`
pub fn admissible_map() -> @kernel.Thm {
  admissible_map_c.get()
}

///|
/// ADMISSIBLE_MATCH_SEQPATTERN
fn step_23() -> Unit raise {
  let t68 = @simp.rewrite_tac(
    @list.List([match_seqpattern(), admissible_cond()]),
  )
  admissible_match_seqpattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (_, _) -> Bool, ∀ p : ((_) -> _, P) -> Bool, ∀ s : (P) -> _, ∀ c1 : ((_) -> _, P, _, _) -> Bool, ∀ c2 : ((_) -> _, P, _, _) -> Bool, ∀ e : ((_) -> _, P) -> _, admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => ∃ y : _, c1(f, x, e(f, x), y)) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && (∃ y : _, c1(f, x, e(f, x), y)), s, (f : (_) -> _) => (x : P) => _MATCH(e(f, x), c1(f, x))) && admissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && !(∃ y : _, c1(f, x, e(f, x), y)), s, (f : (_) -> _) => (x : P) => _MATCH(e(f, x), c2(f, x))) → admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => _MATCH(e(f, x), _SEQPATTERN(c1(f, x), c2(f, x))))"),
      t68,
    ),
  )
}

///|
let admissible_match_seqpattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_MATCH_SEQPATTERN",
)

///|
/// `ADMISSIBLE_MATCH_SEQPATTERN`
pub fn admissible_match_seqpattern() -> @kernel.Thm {
  admissible_match_seqpattern_c.get()
}

///|
/// ADMISSIBLE_IMP_SUPERADMISSIBLE
fn step_24() -> Unit raise {
  let t77 = @meson.asm_meson_tac(@list.List([]))
  let t76 = @simp.asm_rewrite_tac(@list.List([]))
  let t73 = @term_syntax.parse_term("(f : (A) -> B) => (a : P) => if (p : ((A) -> B, P) -> Bool)(f, a) { (t : ((A) -> B, P) -> B)(f, a) } else { (fixed : B) }")
  let t74 = @term_syntax.parse_term("(f : (A) -> B) => (anything : (P) -> A)")
  let t75 = @tactics.map_every(
    fn(
      x70 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s71 = @tactics.exists_tac(x70)
      fn(
        x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s71(x72)
      }
    },
    @list.List([@term_syntax.parse_term("(f : (A) -> B) => (x : P) => false"), t74, t73]),
  )
  let t69 = @tactics.repeat_tac(@tactics.strip_tac)
  let t78 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([admissible(), superadmissible(), tailadmissible()]),
          ),
          t69,
        ),
        t75,
      ),
      t76,
    ),
    t77,
  )
  admissible_imp_superadmissible_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ t : ((A) -> B, P) -> B, admissible(`<<`, p, s, t) → superadmissible(`<<`, p, s, t)"),
      t78,
    ),
  )
}

///|
let admissible_imp_superadmissible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_IMP_SUPERADMISSIBLE",
)

///|
/// `ADMISSIBLE_IMP_SUPERADMISSIBLE`
pub fn admissible_imp_superadmissible() -> @kernel.Thm {
  admissible_imp_superadmissible_c.get()
}

///|
/// SUPERADMISSIBLE_CONST
fn step_25() -> Unit raise {
  let t80 = @simp.rewrite_tac(@list.List([admissible_const()]))
  let t79 = @tactics.match_mp_tac(admissible_imp_superadmissible())
  let t81 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t79),
    t80,
  )
  superadmissible_const_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : ((_) -> _, _) -> Bool, ∀ s : (_) -> _, ∀ c : (_) -> _, superadmissible((op_lt_lt : (_, _) -> Bool), p, s, (f : (_) -> _) => c)"),
      t81,
    ),
  )
}

///|
let superadmissible_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUPERADMISSIBLE_CONST",
)

///|
/// `SUPERADMISSIBLE_CONST`
pub fn superadmissible_const() -> @kernel.Thm {
  superadmissible_const_c.get()
}

///|
/// SUPERADMISSIBLE_TAIL
fn step_26() -> Unit raise {
  let t90 = @meson.asm_meson_tac(@list.List([]))
  let t89 = @simp.asm_rewrite_tac(@list.List([]))
  let t86 = @term_syntax.parse_term("(f : (A) -> B) => (anything : (P) -> B)")
  let t87 = @term_syntax.parse_term("(f : (A) -> B) => (a : P) => if (p : ((A) -> B, P) -> Bool)(f, a) { (t : ((A) -> B, P) -> A)(f, a) } else { (s : (P) -> A)(a) }")
  let t88 = @tactics.map_every(
    fn(
      x83 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s84 = @tactics.exists_tac(x83)
      fn(
        x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s84(x85)
      }
    },
    @list.List([@term_syntax.parse_term("(f : (A) -> B) => (x : P) => true"), t87, t86]),
  )
  let t82 = @tactics.repeat_tac(@tactics.strip_tac)
  let t91 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([admissible(), superadmissible(), tailadmissible()]),
          ),
          t82,
        ),
        t88,
      ),
      t89,
    ),
    t90,
  )
  superadmissible_tail_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ t : ((A) -> B, P) -> A, admissible(`<<`, p, s, t) && (∀ f : (A) -> B, ∀ a : P, p(f, a) → (∀ y : A, `<<`(y, t(f, a)) → `<<`(y, s(a)))) → superadmissible(`<<`, p, s, (f : (A) -> B) => (x : P) => f(t(f, x)))"),
      t91,
    ),
  )
}

///|
let superadmissible_tail_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUPERADMISSIBLE_TAIL",
)

///|
/// `SUPERADMISSIBLE_TAIL`
pub fn superadmissible_tail() -> @kernel.Thm {
  superadmissible_tail_c.get()
}

///|
/// SUPERADMISSIBLE_COND
fn step_27() -> Unit raise {
  let t144 = @meson.asm_meson_tac(@list.List([]))
  let t143 = @simp.asm_rewrite_tac(@list.List([]))
  let t142 = @tactics.disch_then(fn(
    x140 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_3 = x140
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th_3))
  })
  let t139 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_forall()),
      @tactics.gen_tac,
    ),
  )
  let t138 = @simp.rewrite_tac(
    @list.List([@theorems.imp_imp(), @theorems.and_forall_thm()]),
  )
  let t136 = @tactics.pop_assum_list(fn(
    x135 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x131 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s132 = @tactics.mp_tac(x131)
      fn(
        x133 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s132(x133)
      }
    })(
      ((x134 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x134))(
        x135,
      ),
    )
  })
  let t137 = @list.List([
    @meson.asm_meson_tac(@list.List([])),
    t136,
    @tactics.all_tac,
  ])
  let t130 = @tactics.repeat_tac(
    @tactics.then_tac(
      @tactics.match_mp_tac(@theorems.mono_and()),
      @tactics.conj_tac,
    ),
  )
  let t129 = @simp.rewrite_tac(@list.List([]))
  let t128 = @tactics.disch_then(fn(
    x120 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_2 = x120
    let t127 = @tactics.mp_tac(th_2)
    let t125 = @term_syntax.parse_term("(f : (A) -> B) => (a : P) => if (p : ((A) -> B, P) -> Bool)(f, a) { if (P : ((A) -> B, P) -> Bool)(f, a) { (H2 : ((A) -> B, P) -> B)(f, a) } else { (H1 : ((A) -> B, P) -> B)(f, a) } } else { (w : B) }")
    let t126 = @term_syntax.parse_term("(f : (A) -> B) => (a : P) => if (p : ((A) -> B, P) -> Bool)(f, a) { if (P : ((A) -> B, P) -> Bool)(f, a) { (G2 : ((A) -> B, P) -> A)(f, a) } else { (G1 : ((A) -> B, P) -> A)(f, a) } } else { (z : A) }")
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x122 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s123 = @tactics.exists_tac(x122)
          fn(
            x124 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s123(x124)
          }
        },
        @list.List([
          @term_syntax.parse_term("(f : (A) -> B) => (a : P) => if (p : ((A) -> B, P) -> Bool)(f, a) { if (P : ((A) -> B, P) -> Bool)(f, a) { (P2 : ((A) -> B, P) -> Bool)(f, a) } else { (P1 : ((A) -> B, P) -> Bool)(f, a) } } else { false }"),
          t126,
          t125,
        ]),
      ),
      t127,
    )
  })
  let t119 = @simp.rewrite_tac(
    @list.List([
      @class.taut(
        @term_syntax.parse_term("((a1 : Bool) && (b1 : Bool) && (c1 : Bool) → (a2 : Bool) && (b2 : Bool) && (c2 : Bool) → (x : Bool)) == ((a1 && a2) && (b1 && b2) && c1 && c2 → x)"),
      ),
    ]),
  )
  let t113 = @term_syntax.parse_term("(H2 : ((A) -> B, P) -> B)")
  let t114 = @term_syntax.parse_term("(G2 : ((A) -> B, P) -> A)")
  let t115 = @term_syntax.parse_term("(P2 : ((A) -> B, P) -> Bool)")
  let t116 = @term_syntax.parse_term("(H1 : ((A) -> B, P) -> B)")
  let t117 = @term_syntax.parse_term("(G1 : ((A) -> B, P) -> A)")
  let t118 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([
      @term_syntax.parse_term("(P1 : ((A) -> B, P) -> Bool)"),
      t117,
      t116,
      t115,
      t114,
      t113,
    ]),
  )
  let t112 = @simp.rewrite_tac(
    @list.List([
      @theorems.left_imp_exists_thm(),
      @theorems.right_imp_forall_thm(),
    ]),
  )
  let t111 = @simp.rewrite_tac(@list.List([tailadmissible()]))
  let t110 = @tactics.disch_then(fn(
    x107 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x107
    let t109 = @tactics.mp_tac(th_1)
    @tactics.thenl(
      @tactics.ants_tac,
      @list.List([@meson.asm_meson_tac(@list.List([])), t109]),
    )
  })
  let t106 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t105 = @tactics.disch_then(fn(
    x100 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x100
    @tactics.then_tac(
      @tactics.disch_tac,
      @tactics.conjuncts_then(fn(
        x102 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s103 = @tactics.mp_tac(x102)
        fn(
          x104 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s103(x104)
        }
      })(th),
    )
  })
  let t99 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x93 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s94 = @tactics.assume_tac(x93)
        fn(
          x95 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s94(x95)
        }
      },
      fn(
        x96 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s97 = @tactics.mp_tac(x96)
        fn(
          x98 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s97(x98)
        }
      },
    ),
  )
  let t92 = @tactics.repeat_tac(@tactics.gen_tac)
  let t145 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.thenl(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @simp.rewrite_tac(
                                          @list.List([
                                            superadmissible(),
                                            admissible(),
                                          ]),
                                        ),
                                        t92,
                                      ),
                                      t99,
                                    ),
                                    t105,
                                  ),
                                  @tactics.ants_tac,
                                ),
                                t106,
                              ),
                              t110,
                            ),
                            t111,
                          ),
                          t112,
                        ),
                        t118,
                      ),
                      t119,
                    ),
                    t128,
                  ),
                  t129,
                ),
                t130,
              ),
              t137,
            ),
            t138,
          ),
          t139,
        ),
        t142,
      ),
      t143,
    ),
    t144,
  )
  superadmissible_cond_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ P : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ h : ((A) -> B, P) -> B, ∀ k : ((A) -> B, P) -> B, admissible(`<<`, p, s, P) && superadmissible(`<<`, (f : (A) -> B) => (x : P) => p(f, x) && P(f, x), s, h) && superadmissible(`<<`, (f : (A) -> B) => (x : P) => p(f, x) && !P(f, x), s, k) → superadmissible(`<<`, p, s, (f : (A) -> B) => (x : P) => if P(f, x) { h(f, x) } else { k(f, x) })"),
      t145,
    ),
  )
}

///|
let superadmissible_cond_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUPERADMISSIBLE_COND",
)

///|
/// `SUPERADMISSIBLE_COND`
pub fn superadmissible_cond() -> @kernel.Thm {
  superadmissible_cond_c.get()
}

///|
/// SUPERADMISSIBLE_MATCH_SEQPATTERN
fn step_28() -> Unit raise {
  let t146 = @simp.rewrite_tac(
    @list.List([match_seqpattern(), superadmissible_cond()]),
  )
  superadmissible_match_seqpattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (_, _) -> Bool, ∀ p : ((_) -> _, P) -> Bool, ∀ s : (P) -> _, ∀ c1 : ((_) -> _, P, _, _) -> Bool, ∀ c2 : ((_) -> _, P, _, _) -> Bool, ∀ e : ((_) -> _, P) -> _, admissible(`<<`, p, s, (f : (_) -> _) => (x : P) => ∃ y : _, c1(f, x, e(f, x), y)) && superadmissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && (∃ y : _, c1(f, x, e(f, x), y)), s, (f : (_) -> _) => (x : P) => _MATCH(e(f, x), c1(f, x))) && superadmissible(`<<`, (f : (_) -> _) => (x : P) => p(f, x) && !(∃ y : _, c1(f, x, e(f, x), y)), s, (f : (_) -> _) => (x : P) => _MATCH(e(f, x), c2(f, x))) → superadmissible(`<<`, p, s, (f : (_) -> _) => (x : P) => _MATCH(e(f, x), _SEQPATTERN(c1(f, x), c2(f, x))))"),
      t146,
    ),
  )
}

///|
let superadmissible_match_seqpattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUPERADMISSIBLE_MATCH_SEQPATTERN",
)

///|
/// `SUPERADMISSIBLE_MATCH_SEQPATTERN`
pub fn superadmissible_match_seqpattern() -> @kernel.Thm {
  superadmissible_match_seqpattern_c.get()
}

///|
/// SUPERADMISSIBLE_MATCH_UNGUARDED_PATTERN
fn step_29() -> Unit raise {
  let t162 = @meson.asm_meson_tac(@list.List([]))
  let t161 = @simp.simp_tac(@list.List([]))
  let t160 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([admissible()])),
  )
  let t157 = @term_syntax.parse_term("(f : (A) -> B) => (x : P) => select((z : B) => false)")
  let t158 = @term_syntax.parse_term("(f : (A) -> B) => (x : P) => (arg : (P, Q) -> A)(x, select((t : Q) => (pat : (Q) -> D)(t) == (e : (P) -> D)(x)))")
  let t159 = @tactics.map_every(
    fn(
      x154 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s155 = @tactics.exists_tac(x154)
      fn(
        x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s155(x156)
      }
    },
    @list.List([
      @term_syntax.parse_term("(f : (A) -> B) => (x : P) => (p : ((A) -> B, P) -> Bool)(f, x) && (∃ t : Q, (pat : (Q) -> D)(t) == (e : (P) -> D)(x))"),
      t158,
      t157,
    ]),
  )
  let t153 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t152 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ f : (A) -> B, ∀ x : P, (p : ((A) -> B, P) -> Bool)(f, x) → existsunique((v : B) => ∃ t : Q, (pat : (Q) -> D)(t) == (e : (P) -> D)(x) && f((arg : (P, Q) -> A)(x, t)) == v) == (∃ t : Q, pat(t) == e(x))"),
    fn(
      x150 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x150
      @simp.simp_tac(@list.List([th]))
    },
  )
  let t149 = @simp.rewrite_tac(@list.List([tailadmissible()]))
  let t148 = @simp.rewrite_tac(
    @list.List([@pair._unguarded_pattern(), @pair.geq_def(), @pair._match()]),
  )
  let t147 = @simp.rewrite_tac(@list.List([superadmissible()]))
  let t163 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.repeat_tac(@tactics.gen_tac),
                        @tactics.strip_tac,
                      ),
                      t147,
                    ),
                    @tactics.disch_tac,
                  ),
                  t148,
                ),
                t149,
              ),
              t152,
            ),
            t153,
          ),
          t159,
        ),
        t160,
      ),
      t161,
    ),
    t162,
  )
  superadmissible_match_unguarded_pattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term(
        "∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ e : (P) -> D, ∀ pat : (Q) -> D, ∀ arg : (P, Q) -> A, (∀ f : (A) -> B, ∀ a : P, ∀ t : Q, ∀ u : Q, p(f, a) && pat(t) == e(a) && pat(u) == e(a) → arg(a, t) == arg(a, u)) && (∀ f : (A) -> B, ∀ a : P, ∀ t : Q, p(f, a) && pat(t) == e(a) → (∀ y : A, `<<`(y, arg(a, t)) → `<<`(y, s(a)))) → superadmissible(`<<`, p, s, (f : (A) -> B) => (x : P) => _MATCH(e(x), (u : D) => (v : B) => ∃ t : Q, _UNGUARDED_PATTERN(GEQ(pat(t), u), GEQ(f(arg(x, t)), v))))",
      ),
      t163,
    ),
  )
}

///|
let superadmissible_match_unguarded_pattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUPERADMISSIBLE_MATCH_UNGUARDED_PATTERN",
)

///|
/// `SUPERADMISSIBLE_MATCH_UNGUARDED_PATTERN`
pub fn superadmissible_match_unguarded_pattern() -> @kernel.Thm {
  superadmissible_match_unguarded_pattern_c.get()
}

///|
/// SUPERADMISSIBLE_MATCH_GUARDED_PATTERN
fn step_30() -> Unit raise {
  let t179 = @meson.asm_meson_tac(@list.List([]))
  let t178 = @simp.simp_tac(@list.List([]))
  let t177 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([admissible()])),
  )
  let t174 = @term_syntax.parse_term("(f : (A) -> B) => (x : P) => select((z : B) => false)")
  let t175 = @term_syntax.parse_term("(f : (A) -> B) => (x : P) => (arg : (P, Q) -> A)(x, select((t : Q) => (pat : (Q) -> D)(t) == (e : (P) -> D)(x) && (q : (P, Q) -> Bool)(x, t)))")
  let t176 = @tactics.map_every(
    fn(
      x171 : @kernel.Term,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s172 = @tactics.exists_tac(x171)
      fn(
        x173 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s172(x173)
      }
    },
    @list.List([
      @term_syntax.parse_term("(f : (A) -> B) => (x : P) => (p : ((A) -> B, P) -> Bool)(f, x) && (∃ t : Q, (pat : (Q) -> D)(t) == (e : (P) -> D)(x) && (q : (P, Q) -> Bool)(x, t))"),
      t175,
      t174,
    ]),
  )
  let t170 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t169 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ f : (A) -> B, ∀ x : P, (p : ((A) -> B, P) -> Bool)(f, x) → existsunique((v : B) => ∃ t : Q, (pat : (Q) -> D)(t) == (e : (P) -> D)(x) && (q : (P, Q) -> Bool)(x, t) && f((arg : (P, Q) -> A)(x, t)) == v) == (∃ t : Q, pat(t) == e(x) && q(x, t))"),
    fn(
      x167 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x167
      @simp.simp_tac(@list.List([th]))
    },
  )
  let t166 = @simp.rewrite_tac(@list.List([tailadmissible()]))
  let t165 = @simp.rewrite_tac(
    @list.List([@pair._guarded_pattern(), @pair.geq_def(), @pair._match()]),
  )
  let t164 = @simp.rewrite_tac(@list.List([superadmissible()]))
  let t180 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.repeat_tac(@tactics.gen_tac),
                        @tactics.strip_tac,
                      ),
                      t164,
                    ),
                    @tactics.disch_tac,
                  ),
                  t165,
                ),
                t166,
              ),
              t169,
            ),
            t170,
          ),
          t176,
        ),
        t177,
      ),
      t178,
    ),
    t179,
  )
  superadmissible_match_guarded_pattern_c.set(
    @tactics.prove(
      @term_syntax.parse_term(
        "∀ `<<` : (A, A) -> Bool, ∀ p : ((A) -> B, P) -> Bool, ∀ s : (P) -> A, ∀ e : (P) -> D, ∀ pat : (Q) -> D, ∀ q : (P, Q) -> Bool, ∀ arg : (P, Q) -> A, (∀ f : (A) -> B, ∀ a : P, ∀ t : Q, ∀ u : Q, p(f, a) && pat(t) == e(a) && q(a, t) && pat(u) == e(a) && q(a, u) → arg(a, t) == arg(a, u)) && (∀ f : (A) -> B, ∀ a : P, ∀ t : Q, p(f, a) && q(a, t) && pat(t) == e(a) → (∀ y : A, `<<`(y, arg(a, t)) → `<<`(y, s(a)))) → superadmissible(`<<`, p, s, (f : (A) -> B) => (x : P) => _MATCH(e(x), (u : D) => (v : B) => ∃ t : Q, _GUARDED_PATTERN(GEQ(pat(t), u), q(x, t), GEQ(f(arg(x, t)), v))))",
      ),
      t180,
    ),
  )
}

///|
let superadmissible_match_guarded_pattern_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUPERADMISSIBLE_MATCH_GUARDED_PATTERN",
)

///|
/// `SUPERADMISSIBLE_MATCH_GUARDED_PATTERN`
pub fn superadmissible_match_guarded_pattern() -> @kernel.Thm {
  superadmissible_match_guarded_pattern_c.get()
}

///|
/// WF_REC_TAIL_GENERAL'
fn step_31() -> Unit raise {
  let t183 = @meson.asm_meson_tac(@list.List([]))
  let t182 = @tactics.match_mp_tac(@wf.wf_rec_tail_general())
  let t181 = @simp.asm_rewrite_tac(@list.List([]))
  let t184 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t181),
      t182,
    ),
    t183,
  )
  wf_rec_tail_general_p_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : ((_) -> _, _) -> Bool, ∀ G : ((_) -> _, _) -> _, ∀ H : ((_) -> _, _) -> _, ∀ H' : ((_) -> _, _) -> _, WF((op_lt_lt : (_, _) -> Bool)) && (∀ f : (_) -> _, ∀ g : (_) -> _, ∀ x : _, (∀ z : _, op_lt_lt(z, x) → f(z) == g(z)) → P(f, x) == P(g, x) && G(f, x) == G(g, x) && H'(f, x) == H'(g, x)) && (∀ f : (_) -> _, ∀ x : _, ∀ y : _, P(f, x) && op_lt_lt(y, G(f, x)) → op_lt_lt(y, x)) && (∀ f : (_) -> _, ∀ x : _, H(f, x) == (if P(f, x) { f(G(f, x)) } else { H'(f, x) })) → (∃ f : (_) -> _, ∀ x : _, f(x) == H(f, x))"),
      t184,
    ),
  )
}

///|
let wf_rec_tail_general_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WF_REC_TAIL_GENERAL'",
)

///|
/// `WF_REC_TAIL_GENERAL'`
pub fn wf_rec_tail_general_p() -> @kernel.Thm {
  wf_rec_tail_general_p_c.get()
}

///|
/// WF_REC_CASES
fn step_32() -> Unit raise {
  let t239 = @meson.asm_meson_tac(@list.List([]))
  let t238 = @tactics.exists_tac(
    @term_syntax.parse_term("(f : (A) -> B) => (x : A) => if (∃ y : P, (s : (P) -> A)(y) == x) { (H2 : ((A) -> B, P) -> B)(f, select((y : P) => s(y) == x)) } else { (H1 : ((A) -> B, A) -> B)(f, x) }"),
  )
  let t237 = @tactics.exists_tac(
    @term_syntax.parse_term("(f : (A) -> B) => (x : A) => if (∃ y : P, (s : (P) -> A)(y) == x) { (G2 : ((A) -> B, P) -> A)(f, select((y : P) => s(y) == x)) } else { (G1 : ((A) -> B, A) -> A)(f, x) }"),
  )
  let t236 = @tactics.exists_tac(
    @term_syntax.parse_term("(f : (A) -> B) => (x : A) => if (∃ y : P, (s : (P) -> A)(y) == x) { (P2 : ((A) -> B, P) -> Bool)(f, select((y : P) => s(y) == x)) } else { (P1 : ((A) -> B, A) -> Bool)(f, x) }"),
  )
  let t235 = @simp.asm_rewrite_tac(@list.List([]))
  let t234 = @tactics.repeat_tac(@tactics.strip_tac)
  let t228 = @term_syntax.parse_term("(H2 : ((A) -> B, P) -> B)")
  let t229 = @term_syntax.parse_term("(G2 : ((A) -> B, P) -> A)")
  let t230 = @term_syntax.parse_term("(P2 : ((A) -> B, P) -> Bool)")
  let t231 = @term_syntax.parse_term("(H1 : ((A) -> B, A) -> B)")
  let t232 = @term_syntax.parse_term("(G1 : ((A) -> B, A) -> A)")
  let t233 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([
      @term_syntax.parse_term("(P1 : ((A) -> B, A) -> Bool)"),
      t232,
      t231,
      t230,
      t229,
      t228,
    ]),
  )
  let t227 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm()]))
  let t226 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t225 = @tactics.pop_assum_list(fn(
    x224 : @list.List[@kernel.Thm],
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.all_tac
  })
  let t223 = @simp.asm_rewrite_tac(@list.List([]))
  let t222 = @tactics.disch_then(fn(
    x213 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th = x213
    let t221 = @tactics.mp_tac(th)
    @tactics.then_tac(
      @tactics.disch_then(
        @tactics.conjuncts_then2(
          fn(
            x215 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s216 = @tactics.mp_tac(x215)
            fn(
              x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s216(x217)
            }
          },
          fn(
            x218 : @kernel.Thm,
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let s219 = @tactics.assume_tac(x218)
            fn(
              x220 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise {
              s219(x220)
            }
          },
        ),
      ),
      t221,
    )
  })
  let t210 = @term_syntax.parse_term("(clauses : List[((P) -> A, ((A) -> B, P) -> B)])")
  let t211 = @term_syntax.parse_term("(t : ((A) -> B, P) -> B)")
  let t212 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(s : (P) -> A)"), t211, t210]),
  )
  let t208 = @simp.rewrite_tac(@list.List([]))
  let t206 = @term_syntax.parse_term("(f : (A) -> B) => (x : A) => select((y : B) => true)")
  let t207 = @term_syntax.parse_term("(f : (A) -> B) => (anything : (A) -> A)")
  let t209 = @list.List([
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x203 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s204 = @tactics.exists_tac(x203)
          fn(
            x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s204(x205)
          }
        },
        @list.List([@term_syntax.parse_term("(f : (A) -> B) => (x : A) => false"), t207, t206]),
      ),
      t208,
    ),
    @tactics.all_tac,
  ])
  let t202 = @simp.rewrite_tac(
    @list.List([@lists.all(), casewise(), @pair.forall_pair_thm()]),
  )
  let t201 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t200 = @tactics.pop_assum(fn(
    x199 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    @tactics.all_tac
  })
  let t198 = @simp.asm_rewrite_tac(@list.List([]))
  let t196 = @term_syntax.parse_term("(clauses : List[((P) -> A, ((A) -> B, P) -> B)])")
  let t197 = @tactics.spec_tac(
    @term_syntax.parse_term("(clauses : List[((P) -> A, ((A) -> B, P) -> B)])"),
    t196,
  )
  let t195 = @tactics.first_x_assum(fn(
    x194 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x186 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s187 = @tactics.mp_tac(x186)
      fn(
        x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s187(x188)
      }
    })(
      ((x193 : @kernel.Thm) => {
        @lib.check(
          fn(x192 : @kernel.Thm) -> Bool raise {
            (fn(x190 : @kernel.Term) -> Bool raise {
              ((x189 : @kernel.Term) => @basics.is_binary("ALL", x189))(x190)
            })(
              (fn(x191 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x191)
              })(x192),
            )
          },
          x193,
        )
      })(x194),
    )
  })
  let t185 = @tactics.match_mp_tac(wf_rec_tail_general_p())
  let t240 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.thenl(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @tactics.then_tac(
                                              @tactics.repeat_tac(
                                                @tactics.strip_tac,
                                              ),
                                              t185,
                                            ),
                                            t195,
                                          ),
                                          t197,
                                        ),
                                        t198,
                                      ),
                                      t200,
                                    ),
                                    t201,
                                  ),
                                  t202,
                                ),
                                @tactics.conj_tac,
                              ),
                              t209,
                            ),
                            t212,
                          ),
                          t222,
                        ),
                        t223,
                      ),
                      t225,
                    ),
                    t226,
                  ),
                  t227,
                ),
                t233,
              ),
              t234,
            ),
            t235,
          ),
          t236,
        ),
        t237,
      ),
      t238,
    ),
    t239,
  )
  wf_rec_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ clauses : List[((P) -> A, ((A) -> B, P) -> B)], WF(`<<`) && ALL(fn { (s, t) => ∃ P : ((A) -> B, P) -> Bool, ∃ G : ((A) -> B, P) -> A, ∃ H : ((A) -> B, P) -> B, (∀ f : (A) -> B, ∀ a : P, ∀ y : A, P(f, a) && `<<`(y, G(f, a)) → `<<`(y, s(a))) && (∀ f : (A) -> B, ∀ g : (A) -> B, ∀ a : P, (∀ z : A, `<<`(z, s(a)) → f(z) == g(z)) → P(f, a) == P(g, a) && G(f, a) == G(g, a) && H(f, a) == H(g, a)) && (∀ f : (A) -> B, ∀ a : P, t(f, a) == (if P(f, a) { f(G(f, a)) } else { H(f, a) })) }, clauses) → (∃ f : (A) -> B, ∀ x : A, f(x) == CASEWISE(clauses, f, x))"),
      t240,
    ),
  )
}

///|
let wf_rec_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_REC_CASES")

///|
/// `WF_REC_CASES`
pub fn wf_rec_cases() -> @kernel.Thm {
  wf_rec_cases_c.get()
}

///|
/// WF_REC_CASES'
fn step_33() -> Unit raise {
  let t241 = @simp.rewrite_tac(@list.List([wf_rec_cases(), tailadmissible()]))
  wf_rec_cases_p_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ clauses : List[((_) -> A, ((A) -> B, _) -> B)], WF(`<<`) && ALL(fn { (s, t) => tailadmissible(`<<`, (f : (A) -> B) => (a : _) => true, s, t) }, clauses) → (∃ f : (A) -> B, ∀ x : A, f(x) == CASEWISE(clauses, f, x))"),
      t241,
    ),
  )
}

///|
let wf_rec_cases_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_REC_CASES'")

///|
/// `WF_REC_CASES'`
pub fn wf_rec_cases_p() -> @kernel.Thm {
  wf_rec_cases_p_c.get()
}

///|
/// RECURSION_CASEWISE
fn step_34() -> Unit raise {
  let t259 = @meson.asm_meson_tac(@list.List([casewise_works()]))
  let t258 = @simp.asm_rewrite_tac(@list.List([]))
  let t257 = @tactics.repeat_tac(@tactics.strip_tac)
  let t256 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t253 = @drule.match_mp(wf_rec_cases_p())
  let t255 = @tactics.disch_then(
    @tactics.choose_then(fn(
      x254 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x250 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s251 = @tactics.mp_tac(x250)
        fn(
          x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s251(x252)
        }
      })(t253(x254))
    }),
  )
  let t249 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x243 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s244 = @tactics.mp_tac(x243)
        fn(
          x245 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s244(x245)
        }
      },
      fn(
        x246 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s247 = @tactics.assume_tac(x246)
        fn(
          x248 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s247(x248)
        }
      },
    ),
  )
  let t242 = @simp.rewrite_tac(
    @list.List([@theorems.imp_imp(), @theorems.conj_assoc()]),
  )
  let t260 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t242),
              t249,
            ),
            t255,
          ),
          t256,
        ),
        t257,
      ),
      t258,
    ),
    t259,
  )
  recursion_casewise_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ clauses : List[((P) -> A, ((A) -> B, P) -> B)], (∃ `<<` : (A, A) -> Bool, WF(`<<`) && ALL(fn { (s, t) => tailadmissible(`<<`, (f : (A) -> B) => (a : P) => true, s, t) }, clauses)) && (∀ s : (P) -> A, ∀ t : ((A) -> B, P) -> B, ∀ s' : (P) -> A, ∀ t' : ((A) -> B, P) -> B, ∀ f : (A) -> B, ∀ x : P, ∀ y : P, MEM((s, t), clauses) && MEM((s', t'), clauses) → s(x) == s'(y) → t(f, x) == t'(f, y)) → (∃ f : (A) -> B, ALL(fn { (s, t) => ∀ x : P, f(s(x)) == t(f, x) }, clauses))"),
      t260,
    ),
  )
}

///|
let recursion_casewise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RECURSION_CASEWISE",
)

///|
/// `RECURSION_CASEWISE`
pub fn recursion_casewise() -> @kernel.Thm {
  recursion_casewise_c.get()
}

///|
/// RECURSION_CASEWISE_PAIRWISE
fn step_35() -> Unit raise {
  let t263 = @meson.asm_meson_tac(@list.List([]))
  let t262 = @simp.rewrite_tac(
    @list.List([@lists.pairwise(), @lists.mem(), @equal.gsym(@lists.all_mem())]),
  )
  let t261 = @tactics.repeat_tac(@tactics.gen_tac)
  let t264 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @theorems.imp_conj(),
                @theorems.right_forall_imp_thm(),
                @equal.gsym(@lists.all_mem()),
              ]),
            ),
            t261,
          ),
          @tactics.disch_tac,
        ),
        @lists.list_induct_tac,
      ),
      t262,
    ),
    t263,
  )
  let lemma = @tactics.prove(
    @term_syntax.parse_term("∀ P : (_, _) -> Bool, (∀ x : _, ∀ y : _, P(x, y) → P(y, x)) → (∀ l : List[_], (∀ x : _, ∀ y : _, MEM(x, l) && MEM(y, l) → P(x, y)) == (ALL((x : _) => P(x, x), l) && PAIRWISE(P, l)))"),
    t264,
  )
  let t265 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()]),
  )
  let paired_lambda = @tactics.prove(
    @term_syntax.parse_term("((x : (_, _)) => (P : ((_, _)) -> _)(x)) == GABS((f : ((_, _)) -> _) => ∀ a : _, ∀ b : _, GEQ(f((a, b)), P((a, b))))"),
    t265,
  )
  let t266 = @bool.ispec(
    @term_syntax.parse_term("fn { (s, t) => fn { (s', t') => ∀ c : _, ∀ x : A, ∀ y : A, s(x) == s'(y) → t(c, x) == t'(c, y) } }"),
    lemma,
  )
  let pth = @simp.rewrite_rule(
    @list.List([@pair.forall_pair_thm(), paired_lambda]),
  )(t266)
  let t267 = @meson.meson_tac(@list.List([]))
  let cth = @tactics.prove(@equal.lhand(@kernel.concl(pth)), t267)
  let t268 = @simp.rewrite_tac(@list.List([recursion_casewise()]))
  let t269 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @equal.gsym(@drule.match_mp(pth)(cth)),
        @theorems.right_imp_forall_thm(),
      ]),
    ),
    t268,
  )
  recursion_casewise_pairwise_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ clauses : List[((_) -> _, ((_) -> _, _) -> _)], (∃ `<<` : (_, _) -> Bool, WF(`<<`) && ALL(fn { (s, t) => tailadmissible(`<<`, (f : (_) -> _) => (a : _) => true, s, t) }, clauses)) && ALL(fn { (s, t) => ∀ f : (_) -> _, ∀ x : _, ∀ y : _, s(x) == s(y) → t(f, x) == t(f, y) }, clauses) && PAIRWISE(fn { (s, t) => fn { (s', t') => ∀ f : (_) -> _, ∀ x : _, ∀ y : _, s(x) == s'(y) → t(f, x) == t'(f, y) } }, clauses) → (∃ f : (_) -> _, ALL(fn { (s, t) => ∀ x : _, f(s(x)) == t(f, x) }, clauses))"),
      t269,
    ),
  )
}

///|
let recursion_casewise_pairwise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RECURSION_CASEWISE_PAIRWISE",
)

///|
/// `RECURSION_CASEWISE_PAIRWISE`
pub fn recursion_casewise_pairwise() -> @kernel.Thm {
  recursion_casewise_pairwise_c.get()
}

///|
/// SUPERADMISSIBLE_T
fn step_36() -> Unit raise {
  let t270 = @simp.rewrite_tac(@list.List([superadmissible(), admissible()]))
  superadmissible_t_c.set(
    @tactics.prove(
      @term_syntax.parse_term("superadmissible((op_lt_lt : (_, _) -> Bool), (f : (_) -> _) => (x : _) => true, (s : (_) -> _), (t : ((_) -> _, _) -> _)) == tailadmissible(op_lt_lt, (f : (_) -> _) => (x : _) => true, s, t)"),
      t270,
    ),
  )
}

///|
let superadmissible_t_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "SUPERADMISSIBLE_T",
)

///|
/// `SUPERADMISSIBLE_T`
pub fn superadmissible_t() -> @kernel.Thm {
  superadmissible_t_c.get()
}

///|
/// RECURSION_SUPERADMISSIBLE
fn step_37() -> Unit raise {
  recursion_superadmissible_c.set(
    @simp.rewrite_rule(@list.List([@equal.gsym(superadmissible_t())]))(
      recursion_casewise_pairwise(),
    ),
  )
}

///|
let recursion_superadmissible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RECURSION_SUPERADMISSIBLE",
)

///|
/// `RECURSION_SUPERADMISSIBLE`
pub fn recursion_superadmissible() -> @kernel.Thm {
  recursion_superadmissible_c.get()
}

///|
let instantiate_casewise_recursion_c : @lib.Cell[
  (@kernel.Term) -> @kernel.Thm raise,
] = @lib.Cell::new("instantiate_casewise_recursion")

///|
/// `instantiate_casewise_recursion`
pub fn instantiate_casewise_recursion(x : @kernel.Term) -> @kernel.Thm raise {
  instantiate_casewise_recursion_c.get()(x)
}

///|
let pure_prove_recursive_function_exists_c : @lib.Cell[
  (@kernel.Term) -> @kernel.Thm raise,
] = @lib.Cell::new("pure_prove_recursive_function_exists")

///|
/// `pure_prove_recursive_function_exists`
pub fn pure_prove_recursive_function_exists(
  x : @kernel.Term,
) -> @kernel.Thm raise {
  pure_prove_recursive_function_exists_c.get()(x)
}

///|
let prove_general_recursive_function_exists_c : @lib.Cell[
  (@kernel.Term) -> @kernel.Thm raise,
] = @lib.Cell::new("prove_general_recursive_function_exists")

///|
/// `prove_general_recursive_function_exists`
pub fn prove_general_recursive_function_exists(
  x : @kernel.Term,
) -> @kernel.Thm raise {
  prove_general_recursive_function_exists_c.get()(x)
}

///|
/// instantiate_casewise_recursion, pure_prove_recursive_function_exists, prove_general_recursive_function_exists
fn step_38() -> Unit raise {
  let t271 = @equal.land_conv(@equal.once_depth_conv(@equal.sym_conv))
  let lsym : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x274 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    (fn(x273 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.gen_all(
        ((x272 : @kernel.Thm) => @equal.conv_rule(t271, x272))(x273),
      )
    })(@bool.spec_all(x274))
  }
  let t283 = @simp.rewrite_tac(
    @list.List([
      @arith.even_mult(),
      @arith.even_add(),
      @calc_num.arith(),
      @arith.even(),
    ]),
  )
  let t279 = @term_syntax.parse_term("EVEN")
  let t282 = @tactics.disch_then(fn(
    x281 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x276 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s277 = @tactics.mp_tac(x276)
      fn(
        x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s277(x278)
      }
    })(((x280 : @kernel.Thm) => @equal.ap_term(t279, x280))(x281))
  })
  let t275 = @tactics.repeat_tac(@tactics.conj_tac)
  let t284 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([])), t275),
      t282,
    ),
    t283,
  )
  let evensimps = @tactics.prove(
    @term_syntax.parse_term("(2 * (m : Num) + 2 == 2 * (n : Num) + 1) == false && (2 * m + 1 == 2 * n + 2) == false && (2 * m == 2 * n + 1) == false && (2 * m + 1 == 2 * n) == false && (2 * m == SUC(2 * n)) == false && (SUC(2 * m) == 2 * n) == false"),
    t284,
  )
  let t287 = @int.arith_rule(
    @term_syntax.parse_term("(1 == (m : Num) + (n : Num)) == (m == 1 && n == 0 || m == 0 && n == 1)"),
  )
  let t288 = @int.arith_rule(
    @term_syntax.parse_term("((m : Num) + (n : Num) == 1) == (m == 1 && n == 0 || m == 0 && n == 1)"),
  )
  let t289 = lsym(@arith.mult_eq_1())
  let t290 = lsym(@arith.mult_eq_0())
  let t291 = lsym(@arith.add_eq_0())
  let t292 = @bool.eqt_intro(@bool.spec_all(@theorems.eq_refl()))
  let t293 = lsym(@arith.eq_add_lcancel_0())
  let allsimps = @lib.itlist(
    (x285 : @kernel.Thm, x286 : @list.List[@kernel.Thm]) => {
      @simp.mk_rewrites(false, x285, x286)
    },
    @list.List([
      @arith.eq_add_rcancel(),
      @arith.eq_add_lcancel(),
      @arith.eq_add_rcancel_0(),
      @arith.eq_add_lcancel_0(),
      lsym(@arith.eq_add_rcancel_0()),
      t293,
      @arith.eq_mult_rcancel(),
      @arith.eq_mult_lcancel(),
      t292,
      @arith.add_eq_0(),
      t291,
      @arith.mult_eq_0(),
      t290,
      @arith.mult_eq_1(),
      t289,
      t288,
      t287,
      evensimps,
      @calc_num.arith_eq(),
    ]),
    @list.List([]),
  )
  let simplify_welldefinedness_conv : (@kernel.Term) -> @kernel.Thm raise = match
    @lib.map(
      @drule.match_mp,
      @bool.conjuncts_rule(
        @class.taut(
          @term_syntax.parse_term("((a : Bool) == false && (b : Bool) == b → (a → b) == true) && (a == (a' : Bool) && (a' → b == true) → (a → b) == true) && (a == a' && (a' → b == (b' : Bool)) → (a → b) == (a' → b'))"),
        ),
      ),
    ) {
    More(simp1, tail=More(simp2, tail=More(simp3, tail=Empty))) => {
      let false_tm = @term_syntax.parse_term("false")
      let and_tm = @term_syntax.parse_term("op_slash_bslash")
      let eq_refl = @bool.eqt_intro(@bool.spec_all(@theorems.eq_refl()))
      fn(x294 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x294
        let net = @lib.itlist(
          (
            x295 : @kernel.Thm,
            x296 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]],
          ) => @simp.net_of_thm(false, x295, x296),
          allsimps,
          @ind_types.basic_rectype_net().val,
        )
        let t300 = @simp.gen_rewrite_conv(
          fn(
            x297 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s298 = @equal.depth_conv(x297)
            fn(x299 : @kernel.Term) -> @kernel.Thm raise { s298(x299) }
          },
          @list.List([@theorems.and_clauses(), @theorems.or_clauses()]),
        )
        let rectype_arith_eq_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
          @equal.top_sweep_conv(@simp.rewrites_conv(net)),
          t300,
        )
        let simplify_case_distinctness_clause : (@kernel.Term) -> @kernel.Thm raise = fn(
          x301 : @kernel.Term,
        ) -> @kernel.Thm raise {
          let tm_1 = x301
          let (avs, bod) = @basics.strip_forall(tm_1)
          let (ant, cons) = @basics.dest_imp(bod)
          let ath = rectype_arith_eq_conv(ant)
          let atm = @kernel.rand(@kernel.concl(ath))
          let bth = @bool.conj(
            ath,
            if atm == false_tm {
              @kernel.refl(cons)
            } else {
              @bool.disch(
                atm,
                @simp.pure_rewrite_conv(
                  @list.List([eq_refl, @kernel.assume_rule(atm)]),
                )(cons),
              )
            },
          )
          let cth = simp1(bth) catch {
            Failure(_) =>
              simp2(bth) catch {
                Failure(_) => simp3(bth)
                e => raise e
              }
            e => raise e
          }
          @lib.itlist(@drule.mk_forall_rule, avs, cth)
        }
        let t305 = @simp.gen_rewrite_conv(
          fn(
            x302 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s303 = @equal.depth_conv(x302)
            fn(x304 : @kernel.Term) -> @kernel.Thm raise { s303(x304) }
          },
          @list.List([@theorems.forall_simp(), @theorems.and_clauses()]),
        )
        @equal.thenc(
          @equal.depth_binop_conv(and_tm, simplify_case_distinctness_clause),
          t305,
        )(tm)
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:500")
  }
  let t306 = @meson.meson_tac(@list.List([]))
  let t307 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @pair._unguarded_pattern(),
        @pair._guarded_pattern(),
        @pair.geq_def(),
      ]),
    ),
    t306,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("(∃ y : _, _UNGUARDED_PATTERN(GEQ((s : _), (t : _)), GEQ((z : _), y))) == (s == t) && (∃ y : _, _GUARDED_PATTERN(GEQ(s, t), (g : Bool), GEQ(z, y))) == (g && s == t)"),
    t307,
  )
  let basecnv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x308 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x308
    },
    @list.List([pth]),
  )
  let pushcnv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x309 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x309
    },
    @list.List([@theorems.swap_exists_thm()]),
  )
  fn exists_pat_conv(x310 : @kernel.Term) -> @kernel.Thm raise {
    let tm_2 = x310
    @equal.orelsec(
      @equal.thenc(pushcnv, @equal.binder_conv(exists_pat_conv)),
      basecnv,
    )(tm_2)
  }
  let exists_pat_conv_1 : (@kernel.Term) -> @kernel.Thm raise = fn(
    x311 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_3 = x311
    if @basics.is_exists(tm_3) {
      exists_pat_conv(tm_3)
    } else {
      raise Failure("EXISTS_PAT_CONV")
    }
  }
  let t312 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()]),
  )
  let elemma0 = @tactics.prove(
    @term_syntax.parse_term("(∀ z : (_, _), GEQ((f : ((_, _)) -> _)(z), (g : ((_, _)) -> _)(z))) == (∀ x : _, ∀ y : _, GEQ(f((x, y)), g((x, y)))) && ((p : (_, _)) => (P : ((_, _)) -> _)(p)) == fn { (x, y) => P((x, y)) }"),
    t312,
  )
  let t337 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()]),
  )
  let t336 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t330 = @term_syntax.parse_term("(d : D) => (c : C) => (t : ((C, D)) -> E)((c, d))")
  let t333 = @tactics.first_x_assum(fn(
    x332 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x327 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s328 = @tactics.mp_tac(x327)
      fn(
        x329 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s328(x329)
      }
    })(((x331 : @kernel.Thm) => @bool.spec(t330, x331))(x332))
  })
  let t324 = @term_syntax.parse_term("(b : B) => (d : D) => (c : C) => (t : (B, (C, D)) -> E)(b, (c, d))")
  let t334 = @tactics.first_x_assum(fn(
    x326 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x321 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s322 = @tactics.mp_tac(x321)
      fn(
        x323 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s322(x323)
      }
    })(((x325 : @kernel.Thm) => @bool.spec(t324, x325))(x326))
  })
  let t318 = @term_syntax.parse_term("(a : A) => (b : B) => (d : D) => (c : C) => (t : (A, B, (C, D)) -> E)(a, b, (c, d))")
  let t335 = @list.List([
    @tactics.first_x_assum(fn(
      x320 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x315 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s316 = @tactics.mp_tac(x315)
        fn(
          x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s316(x317)
        }
      })(((x319 : @kernel.Thm) => @bool.spec(t318, x319))(x320))
    }),
    t334,
    t333,
  ])
  let t314 = @simp.asm_rewrite_tac(@list.List([]))
  let t313 = @tactics.repeat_tac(@tactics.strip_tac)
  let t338 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.strip_tac),
                @tactics.eq_tac,
              ),
              t313,
            ),
            t314,
          ),
          t335,
        ),
        t336,
      ),
      @tactics.ap_term_tac,
    ),
    t337,
  )
  let elemma1 = @tactics.prove(
    @term_syntax.parse_term("(∀ P : ((A, B, (C, D)) -> E) -> Bool, (∀ t : (A, B, (C, D)) -> E, P(t)) == (∀ t : (A, B, D, C) -> E, P((a : A) => (b : B) => fn { (c, d) => t(a, b, d, c) }))) && (∀ P : ((B, (C, D)) -> E) -> Bool, (∀ t : (B, (C, D)) -> E, P(t)) == (∀ t : (B, D, C) -> E, P((b : B) => fn { (c, d) => t(b, d, c) }))) && (∀ P : (((C, D)) -> E) -> Bool, (∀ t : ((C, D)) -> E, P(t)) == (∀ t : (D, C) -> E, P(fn { (c, d) => t(d, c) })))"),
    t338,
  )
  let hack_proforma : (Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x339 : Int64,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let n = x339
    fn(x340 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x340
      if n <= 1L {
        th
      } else {
        let mkname : (Int64) -> String raise = fn(
          x341 : Int64,
        ) -> String raise {
          let i = x341
          "_P" + Int64::to_string(i)
        }
        let ty = @lib.end_itlist(
          fn(
            x342 : @kernel.HolType,
            x343 : @kernel.HolType,
          ) -> @kernel.HolType raise {
            let s = x342
            let t = x343
            @kernel.mk_type("prod", @list.List([s, t]))
          },
          @lib.map(
            fn(x345 : Int64) -> @kernel.HolType raise {
              (fn(x344 : String) -> @kernel.HolType raise {
                @kernel.mk_vartype(x344)
              })(mkname(x345))
            },
            @lib.range(1L, n),
          ),
        )
        let conv : (Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
          x346 : Int64,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let i_1 = x346
          let name = "x" + Int64::to_string(i_1)
          let cnv : (@kernel.Term) -> @kernel.Thm raise = @equal.alpha_conv(
            @kernel.mk_var(name, @kernel.mk_vartype(mkname(i_1))),
          )
          fn(x348 : @kernel.Term) -> @kernel.Thm raise {
            let tm_4 = x348
            if @kernel.is_abs(tm_4) &&
              @printer.name_of(@basics.bndvar(tm_4)) != name {
              cnv(tm_4)
            } else {
              raise Failure("conv")
            }
          }
        }
        let convs : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
          @lib.map(conv, @lib.range(1L, n)),
        )
        let th1 = @kernel.inst_type(
          @list.List([(ty, @parser.parse_type("P"))]),
          th,
        )
        let th2 = @simp.rewrite_rule(@list.List([@pair.forall_pair_thm()]))(th1)
        let th3 = @simp.rewrite_rule(@list.List([elemma0, elemma1]))(th2)
        @equal.conv_rule(@equal.redepth_conv(convs), th3)
      }
    }
  }
  let eack_proforma : (Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(
    x349 : Int64,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let n_1 = x349
    fn(x350 : @kernel.Thm) -> @kernel.Thm raise {
      let th_1 = x350
      if n_1 <= 1L {
        th_1
      } else {
        let mkname_1 : (Int64) -> String raise = fn(
          x351 : Int64,
        ) -> String raise {
          let i_2 = x351
          "_Q" + Int64::to_string(i_2)
        }
        let ty_1 = @lib.end_itlist(
          fn(
            x352 : @kernel.HolType,
            x353 : @kernel.HolType,
          ) -> @kernel.HolType raise {
            let s_1 = x352
            let t_1 = x353
            @kernel.mk_type("prod", @list.List([s_1, t_1]))
          },
          @lib.map(
            fn(x355 : Int64) -> @kernel.HolType raise {
              (fn(x354 : String) -> @kernel.HolType raise {
                @kernel.mk_vartype(x354)
              })(mkname_1(x355))
            },
            @lib.range(1L, n_1),
          ),
        )
        let conv_1 : (Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
          x356 : Int64,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let i_3 = x356
          let name_1 = "t" + Int64::to_string(i_3)
          let cnv_1 : (@kernel.Term) -> @kernel.Thm raise = @equal.alpha_conv(
            @kernel.mk_var(name_1, @kernel.mk_vartype(mkname_1(i_3))),
          )
          fn(x358 : @kernel.Term) -> @kernel.Thm raise {
            let tm_5 = x358
            if @kernel.is_abs(tm_5) &&
              @printer.name_of(@basics.bndvar(tm_5)) != name_1 {
              cnv_1(tm_5)
            } else {
              raise Failure("conv")
            }
          }
        }
        let convs_1 : (@kernel.Term) -> @kernel.Thm raise = @equal.first_conv(
          @lib.map(conv_1, @lib.range(1L, n_1)),
        )
        let th1_1 = @kernel.inst_type(
          @list.List([(ty_1, @parser.parse_type("Q"))]),
          th_1,
        )
        let th2_1 = @simp.rewrite_rule(@list.List([@pair.exists_pair_thm()]))(
          th1_1,
        )
        let th3_1 = @simp.rewrite_rule(@list.List([elemma1]))(th2_1)
        let th4 = @simp.rewrite_rule(@list.List([@pair.forall_pair_thm()]))(
          th3_1,
        )
        @equal.conv_rule(@equal.redepth_conv(convs_1), th4)
      }
    }
  }
  let (hack_proforma_1, eack_proforma_1) = (hack_proforma, eack_proforma)
  let apply_proforma_tac : (@kernel.Thm) -> ((
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise = fn(
    x359 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_2 = x359
    fn(
      x360 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      let (asl, w) as gl = x360
      let vs = @basics.dest_gabs(@basics.body(@kernel.rand(w))).0
      let n_2 = @lib.add63(
        1L,
        Int::to_int64(@lib.length(@lib.splitlist(@pair.dest_pair, vs).0)),
      )
      @tactics.then_tac(
        @tactics.match_mp_tac(hack_proforma_1(n_2)(th_2)),
        @tactics.beta_tac,
      )(gl)
    }
  }
  let is_pattern : (String) -> ((Int64) -> ((@kernel.Term) -> Bool raise) raise) raise = fn(
    x361 : String,
  ) -> ((Int64) -> ((@kernel.Term) -> Bool raise) raise) raise {
    let p = x361
    fn(x362 : Int64) -> ((@kernel.Term) -> Bool raise) raise {
      let n_3 = x362
      fn(x363 : @kernel.Term) -> Bool raise {
        let tm_6 = x363
        try {
          let (f, args) = @basics.strip_comb(
            @basics.strip_exists(@basics.body(@basics.body(tm_6))).1,
          )
          @kernel.is_const(f) &&
          @printer.name_of(f) == p &&
          Int::to_int64(@lib.length(args)) == n_3
        } catch {
          Failure(_) => false
          e => raise e
        }
      }
    }
  }
  let pth0 = @meson.meson(
    @list.List([]),
    @term_syntax.parse_term("((a : Bool) && (x : _) == (k : _) → x == (y : _) → (d : Bool)) → a && x == k && y == k → d"),
  )
  let pth1 = @meson.meson(
    @list.List([]),
    @term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (x : _) == (k : _) → x == (y : _) → (d : Bool)) → a && x == k && b && y == k && c → d"),
  )
  let t367 = @simp.pure_rewrite_tac(
    @list.List([
      @theorems.and_clauses(),
      @theorems.imp_clauses(),
      @theorems.or_clauses(),
      @theorems.eq_clauses(),
      @class.not_clauses(),
    ]),
  )
  let t366 = @tactics.conv_tac(@equal.rand_conv(simplify_welldefinedness_conv))
  let t364 = @tactics.match_mp_tac(pth0)
  let t365 = @tactics.orelse_tac(@tactics.match_mp_tac(pth1), t364)
  let simplify_match_welldefined_tac : (
    (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t365),
      t366,
    ),
    t367,
  )
  fn headonly(x368 : @kernel.Term, x369 : @kernel.Term) -> Bool raise {
    let f_1 = x368
    let tm_7 = x369
    match tm_7 {
      @kernel.Term::Comb(s_2, t_2) =>
        headonly(f_1, s_2) && headonly(f_1, t_2) && !(t_2 == f_1)
      @kernel.Term::Abs(x, t_3) => headonly(f_1, t_3)
      _ => true
    }
  }
  let main_admiss_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = fn(
    x370 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise {
    let (asl_1, w_1) as gl_1 = x370
    let (had, args_1) = @basics.strip_comb(w_1)
    if !@kernel.is_const(had) {
      raise Failure("ADMISS_TAC")
    } else {
      let (f_2, fbod) = @kernel.dest_abs(@lib.last(args_1))
      let (xtup, bod_1) = @basics.dest_gabs(fbod)
      let (hop, args_2) = @basics.strip_comb(bod_1)
      let t371 = @printer.name_of(had)
      match (t371, @printer.name_of(hop)) {
        ("superadmissible", "COND") =>
          apply_proforma_tac(superadmissible_cond())(gl_1)
        ("superadmissible", "_MATCH") if @printer.name_of(
            @lib.repeat(@kernel.rator, @lib.last(args_2)),
          ) ==
          "_SEQPATTERN" => {
          let t372 = @tactics.conv_tac(
            @equal.once_depth_conv(exists_pat_conv_1),
          )
          @tactics.then_tac(
            apply_proforma_tac(superadmissible_match_seqpattern()),
            t372,
          )(gl_1)
        }
        ("superadmissible", "_MATCH") if ({
            let t373 = @lib.last(args_2)
            is_pattern("_UNGUARDED_PATTERN")(2L)(t373)
          }) => {
          let n_4 = Int::to_int64(
            @lib.length(
              @basics.strip_exists(
                @basics.body(@basics.body(@lib.last(args_2))),
              ).0,
            ),
          )
          let th_3 = eack_proforma_1(n_4)(
            superadmissible_match_unguarded_pattern(),
          )
          @tactics.thenl(
            @tactics.then_tac(apply_proforma_tac(th_3), @tactics.conj_tac),
            @list.List([simplify_match_welldefined_tac, @tactics.all_tac]),
          )(gl_1)
        }
        ("superadmissible", "_MATCH") if ({
            let t374 = @lib.last(args_2)
            is_pattern("_GUARDED_PATTERN")(3L)(t374)
          }) => {
          let n_5 = Int::to_int64(
            @lib.length(
              @basics.strip_exists(
                @basics.body(@basics.body(@lib.last(args_2))),
              ).0,
            ),
          )
          let th_4 = eack_proforma_1(n_5)(
            superadmissible_match_guarded_pattern(),
          )
          @tactics.thenl(
            @tactics.then_tac(apply_proforma_tac(th_4), @tactics.conj_tac),
            @list.List([simplify_match_welldefined_tac, @tactics.all_tac]),
          )(gl_1)
        }
        ("superadmissible", _) if @kernel.is_comb(bod_1) &&
          @kernel.rator(bod_1) == f_2 =>
          apply_proforma_tac(superadmissible_tail())(gl_1)
        ("admissible", "sum") => apply_proforma_tac(admissible_sum())(gl_1)
        ("admissible", "nsum") => apply_proforma_tac(admissible_nsum())(gl_1)
        ("admissible", "MAP") => apply_proforma_tac(admissible_map())(gl_1)
        ("admissible", "_MATCH") if @printer.name_of(
            @lib.repeat(@kernel.rator, @lib.last(args_2)),
          ) ==
          "_SEQPATTERN" => {
          let t375 = @tactics.conv_tac(
            @equal.once_depth_conv(exists_pat_conv_1),
          )
          @tactics.then_tac(
            apply_proforma_tac(admissible_match_seqpattern()),
            t375,
          )(gl_1)
        }
        ("admissible", "_MATCH") => apply_proforma_tac(admissible_match())(gl_1)
        ("admissible", "_UNGUARDED_PATTERN") =>
          apply_proforma_tac(admissible_unguarded_pattern())(gl_1)
        ("admissible", "_GUARDED_PATTERN") =>
          apply_proforma_tac(admissible_guarded_pattern())(gl_1)
        ("admissible", _) if @kernel.is_abs(bod_1) =>
          apply_proforma_tac(admissible_lambda())(gl_1)
        ("admissible", _) if @kernel.is_comb(bod_1) &&
          @kernel.rator(bod_1) == f_2 =>
          if @basics.free_in(f_2, @kernel.rand(bod_1)) {
            apply_proforma_tac(admissible_nest())(gl_1)
          } else {
            apply_proforma_tac(admissible_base())(gl_1)
          }
        ("admissible", _) if @kernel.is_comb(bod_1) && headonly(f_2, bod_1) =>
          apply_proforma_tac(admissible_comb())(gl_1)
        _ => raise Failure("MAIN_ADMISS_TAC")
      }
    }
  }
  let t377 = @tactics.match_mp_tac(admissible_imp_superadmissible())
  let t376 = @tactics.match_accept_tac(superadmissible_const())
  let admiss_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.orelse_tac(
    @tactics.orelse_tac(
      @tactics.orelse_tac(
        @tactics.orelse_tac(
          @tactics.conj_tac,
          @tactics.match_accept_tac(admissible_const()),
        ),
        t376,
      ),
      main_admiss_tac,
    ),
    t377,
  )
  let t379 = @simp.rewrite_tac(@list.List([@lists.all()]))
  let t380 = (
    @term_syntax.parse_term("ALL(fn { (s, t) => (P : (_, _) -> Bool)(s, t) }, [((a : _), (b : _))]) == P(a, b) && ALL(fn { (s, t) => P(s, t) }, CONS((a, b), (l : List[(_, _)]))) == (P(a, b) && ALL(fn { (s, t) => P(s, t) }, l))"),
    t379,
  )
  let (pth0_1, pth1_1) = @bool.conj_pair(
    (fn(
      x378 : (
        @kernel.Term,
        ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise,
      ),
    ) -> @kernel.Thm raise {
      @tactics.prove(x378.0, x378.1)
    })(t380),
  )
  let conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth0_1)
  let conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth1_1)
  fn conv_2(x381 : @kernel.Term) -> @kernel.Thm raise {
    let tm_8 = x381
    conv0(tm_8) catch {
      Failure(_) => {
        let th_5 = conv1(tm_8)
        @equal.conv_rule(
          @lib.funpow(
            2,
            fn(
              x382 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s383 = @equal.rand_conv(x382)
              fn(x384 : @kernel.Term) -> @kernel.Thm raise { s383(x384) }
            },
            conv_2,
          ),
          th_5,
        )
      }
      e => raise e
    }
  }
  let expand_paired_all_conv : (@kernel.Term) -> @kernel.Thm raise = conv_2
  let rewr1 : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    fn(
      x385 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x385
    },
    @list.List([@equal.gsym(@pair.forall_pair_thm())]),
  )
  let rewr2 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(
    fn(
      x386 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x386
    },
    @list.List([@class.fun_eq_thm()]),
  )
  let lambda_pair_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x387 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let parms = x387
    fn(x388 : @kernel.Term) -> @kernel.Thm raise {
      let tm_9 = x388
      let parm = @lib.end_itlist(
        (x389 : @kernel.Term, x390 : @kernel.Term) => {
          @lib.curry(@pair.mk_pair, x389, x390)
        },
        parms,
      )
      let (x_1, bod_2) = @kernel.dest_abs(tm_9)
      let tm_p = @basics.mk_gabs(
        parm,
        @kernel.vsubst(@list.List([(parm, x_1)]), bod_2),
      )
      let th1_2 = @equal.beta_conv(@kernel.mk_comb(tm_9, parm))
      let th2_2 = @pair.gen_beta_conv(@kernel.mk_comb(tm_p, parm))
      let th3_2 = @kernel.trans(th1_2, @equal.sym(th2_2))
      let t393 = @bool.gen(@lib.last(parms), th3_2)
      let th4_1 = @lib.itlist(
        fn(x391 : @kernel.Term, x392 : @kernel.Thm) -> @kernel.Thm raise {
          let v = x391
          let th_6 = x392
          rewr1(@bool.gen(v, th_6))
        },
        @lib.butlast(parms),
        t393,
      )
      @kernel.eq_mp(@equal.sym(rewr2(@basics.mk_eq(tm_9, tm_p))), th4_1)
    }
  }
  let rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    fn(
      x394 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s395 = @equal.rand_conv(x394)
      fn(x396 : @kernel.Term) -> @kernel.Thm raise { s395(x396) }
    },
    @list.List([@equal.gsym(@pair.forall_pair_thm())]),
  )
  let forall_pair_conv : (@kernel.Term) -> ((@list.List[@kernel.Term]) -> @kernel.Thm raise) raise = fn(
    x400 : @kernel.Term,
  ) -> ((@list.List[@kernel.Term]) -> @kernel.Thm raise) raise {
    let parm_1 = x400
    fn(x401 : @list.List[@kernel.Term]) -> @kernel.Thm raise {
      let parms_1 = x401
      let p_1 = @kernel.mk_var(
        "P",
        @basics.mk_fun_ty(@kernel.type_of(parm_1), @kernel.bool_ty),
      )
      let tm_10 = @bool.list_mk_forall(parms_1, @kernel.mk_comb(p_1, parm_1))
      @bool.gen(
        p_1,
        @equal.sym(((x397, x398) => depair_l(rule, x397, x398))(parms_1, tm_10)),
      )
    }
  }
  let t402 = @equal.top_depth_conv(@pair.gen_beta_conv)
  let elim_listops_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(
    @simp.pure_rewrite_conv(
      @list.List([
        @lists.pairwise(),
        @lists.all(),
        @equal.gsym(@theorems.conj_assoc()),
        @theorems.and_clauses(),
      ]),
    ),
    t402,
  )
  let tuple_function_existence : (@kernel.Term) -> @kernel.Thm raise = fn(
    x403 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_11 = x403
    let (f_3, def) = @basics.dest_exists(tm_11)
    let (domtys0, ranty0) = @lib.splitlist(
      @basics.dest_fun_ty,
      @kernel.type_of(f_3),
    )
    let nargs = @lib.itlist(
      fn(x416 : @kernel.Term, x417 : Int64) -> Int64 raise {
        (fn(
          x414 : (@list.List[@kernel.Term], @kernel.Term),
        ) -> ((Int64) -> Int64 raise) raise {
          (fn(x412 : @kernel.Term) -> ((Int64) -> Int64 raise) raise {
            (fn(x411 : @kernel.Term) -> ((Int64) -> Int64 raise) raise {
              (fn(
                x409 : (@kernel.Term, @list.List[@kernel.Term]),
              ) -> ((Int64) -> Int64 raise) raise {
                (fn(
                  x407 : @list.List[@kernel.Term],
                ) -> ((Int64) -> Int64 raise) raise {
                  (fn(x404 : Int64) -> ((Int64) -> Int64 raise) raise {
                    fn(x405 : Int64) -> Int64 raise {
                      if x404 >= x405 {
                        x404
                      } else {
                        x405
                      }
                    }
                  })(
                    (fn(x406 : @list.List[@kernel.Term]) -> Int64 raise {
                      Int::to_int64(@lib.length(x406))
                    })(x407),
                  )
                })(
                  (fn(
                    x408 : (@kernel.Term, @list.List[@kernel.Term]),
                  ) -> @list.List[@kernel.Term] raise {
                    x408.1
                  })(x409),
                )
              })(
                (fn(
                  x410 : @kernel.Term,
                ) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                  @basics.strip_comb(x410)
                })(x411),
              )
            })(@equal.lhs(x412))
          })(
            (fn(
              x413 : (@list.List[@kernel.Term], @kernel.Term),
            ) -> @kernel.Term raise {
              x413.1
            })(x414),
          )
        })(
          (fn(
            x415 : @kernel.Term,
          ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
            @basics.strip_forall(x415)
          })(x416),
        )(x417)
      },
      @basics.conjuncts(@basics.strip_forall(def).1),
      0L,
    )
    let (domtys, midtys) = @lib.chop_list(@lib.int63_to_int(nargs), domtys0)
    let ranty = @lib.itlist(@basics.mk_fun_ty, midtys, ranty0)
    if Int::to_int64(@lib.length(domtys)) <= 1L {
      @kernel.assume_rule(tm_11)
    } else {
      let dty = @lib.end_itlist(
        fn(
          x418 : @kernel.HolType,
          x419 : @kernel.HolType,
        ) -> @kernel.HolType raise {
          let ty1 = x418
          let ty2 = x419
          @kernel.mk_type("prod", @list.List([ty1, ty2]))
        },
        domtys,
      )
      let t420 = @basics.mk_fun_ty(dty, ranty)
      let t421 = @kernel.mk_var(@kernel.dest_var(f_3).0, t420)
      let f_p = @kernel.variant(@kernel.frees(tm_11), t421)
      let gvs = @lib.map(
        fn(x422 : @kernel.HolType) -> @kernel.Term raise {
          @basics.genvar(x422)
        },
        domtys,
      )
      let f_p_p = @basics.list_mk_abs(
        gvs,
        @kernel.mk_comb(
          f_p,
          @lib.end_itlist(
            (x423 : @kernel.Term, x424 : @kernel.Term) => {
              @lib.curry(@pair.mk_pair, x423, x424)
            },
            gvs,
          ),
        ),
      )
      let def_p = @basics.subst(@list.List([(f_p_p, f_3)]), def)
      let th1_3 = @bool.exists_rule(tm_11, f_p_p, @kernel.assume_rule(def_p))
      let bth_1 = @drule.betas_conv(@basics.list_mk_comb(f_p_p, gvs))
      let t428 = @lib.hd(@kernel.hyp(th1_3))
      let th2_3 = @simp.gen_rewrite_conv(
        fn(
          x425 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s426 = @equal.top_depth_conv(x425)
          fn(x427 : @kernel.Term) -> @kernel.Thm raise { s426(x427) }
        },
        @list.List([bth_1]),
      )(t428)
      @bool.simple_choose(
        f_p,
        @bool.prove_hyp(@bool.undisch(@bool.eq_imp_rule(th2_3).1), th1_3),
      )
    }
  }
  let pinstantiate_casewise_recursion : (@kernel.Term) -> @kernel.Thm raise = fn(
    x429 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let def_1 = x429
    @drule.part_match(
      fn(x430 : @kernel.Term) -> @kernel.Term raise { x430 },
      @theorems.exists_refl(),
    )(def_1) catch {
      Failure(_) => {
        let (f_4, bod_3) = @basics.dest_exists(def_1)
        let cjs = @basics.conjuncts(bod_3)
        let eqs = @lib.map(
          fn(x433 : @kernel.Term) -> @kernel.Term raise {
            (fn(
              x431 : (@list.List[@kernel.Term], @kernel.Term),
            ) -> @kernel.Term raise {
              x431.1
            })(
              (fn(
                x432 : @kernel.Term,
              ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
                @basics.strip_forall(x432)
              })(x433),
            )
          },
          cjs,
        )
        let (lefts, rights) = @lib.unzip(@lib.map(@kernel.dest_eq, eqs))
        let arglists = @lib.map(
          fn(x436 : @kernel.Term) -> @list.List[@kernel.Term] raise {
            (fn(
              x434 : (@kernel.Term, @list.List[@kernel.Term]),
            ) -> @list.List[@kernel.Term] raise {
              x434.1
            })(
              (fn(
                x435 : @kernel.Term,
              ) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                @basics.strip_comb(x435)
              })(x436),
            )
          },
          lefts,
        )
        let parms0 = @kernel.freesl(@lib.unions(arglists))
        let parms_2 = if parms0 != @list.List([]) {
          parms0
        } else {
          @list.List([@basics.genvar(@kernel.aty)])
        }
        let parm_2 = @lib.end_itlist(
          (x437 : @kernel.Term, x438 : @kernel.Term) => {
            @lib.curry(@pair.mk_pair, x437, x438)
          },
          parms_2,
        )
        let ss = @lib.map(
          fn(x439 : @list.List[@kernel.Term]) -> @kernel.Term raise {
            let a = x439
            @basics.mk_gabs(
              parm_2,
              @lib.end_itlist(
                (x440 : @kernel.Term, x441 : @kernel.Term) => {
                  @lib.curry(@pair.mk_pair, x440, x441)
                },
                a,
              ),
            )
          },
          arglists,
        )
        let ts = @lib.map(
          fn(x442 : @kernel.Term) -> @kernel.Term raise {
            let a_1 = x442
            @kernel.mk_abs(f_4, @basics.mk_gabs(parm_2, a_1))
          },
          rights,
        )
        let clauses = @lists.mk_flist(
          @lib.map2(
            (x443 : @kernel.Term, x444 : @kernel.Term) => {
              @lib.curry(@pair.mk_pair, x443, x444)
            },
            ss,
            ts,
          ),
        )
        let pth_1 = @bool.ispec(clauses, recursion_superadmissible())
        let fiddle_conv : ((@kernel.Term) -> @kernel.Thm raise) -> ((
          @kernel.Term,
        ) -> @kernel.Thm raise) raise = fn(
          x478 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x474 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            (fn(
              x470 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              (fn(
                x466 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                (fn(
                  x463 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  (fn(
                    x459 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    (fn(
                      x455 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      (fn(
                        x451 : (@kernel.Term) -> @kernel.Thm raise,
                      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                        (fn(
                          x445 : (@kernel.Term) -> @kernel.Thm raise,
                        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                          let s446 = @equal.land_conv(x445)
                          fn(x447 : @kernel.Term) -> @kernel.Thm raise {
                            s446(x447)
                          }
                        })(
                          (fn(
                            x448 : (@kernel.Term) -> @kernel.Thm raise,
                          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                            let s449 = @equal.land_conv(x448)
                            fn(x450 : @kernel.Term) -> @kernel.Thm raise {
                              s449(x450)
                            }
                          })(x451),
                        )
                      })(
                        (fn(
                          x452 : (@kernel.Term) -> @kernel.Thm raise,
                        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                          let s453 = @equal.binder_conv(x452)
                          fn(x454 : @kernel.Term) -> @kernel.Thm raise {
                            s453(x454)
                          }
                        })(x455),
                      )
                    })(
                      (fn(
                        x456 : (@kernel.Term) -> @kernel.Thm raise,
                      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                        let s457 = @equal.rand_conv(x456)
                        fn(x458 : @kernel.Term) -> @kernel.Thm raise {
                          s457(x458)
                        }
                      })(x459),
                    )
                  })(
                    (fn(
                      x460 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s461 = @equal.land_conv(x460)
                      fn(x462 : @kernel.Term) -> @kernel.Thm raise {
                        s461(x462)
                      }
                    })(x463),
                  )
                })(
                  (fn(
                    x464 : (@kernel.Term) -> @kernel.Thm raise,
                  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                    fn(x465 : @kernel.Term) -> @kernel.Thm raise {
                      @pair.gabs_conv(x464, x465)
                    }
                  })(x466),
                )
              })(
                (fn(
                  x467 : (@kernel.Term) -> @kernel.Thm raise,
                ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                  let s468 = @equal.rator_conv(x467)
                  fn(x469 : @kernel.Term) -> @kernel.Thm raise { s468(x469) }
                })(x470),
              )
            })(
              (fn(
                x471 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s472 = @equal.land_conv(x471)
                fn(x473 : @kernel.Term) -> @kernel.Thm raise { s472(x473) }
              })(x474),
            )
          })(
            (fn(
              x475 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s476 = @equal.abs_conv(x475)
              fn(x477 : @kernel.Term) -> @kernel.Thm raise { s476(x477) }
            })(x478),
          )
        }
        let th0 = @bool.undisch(
          @equal.conv_rule(fiddle_conv(lambda_pair_conv(parms_2)), pth_1),
        )
        let t479 = @kernel.concl(th0)
        let th1_4 = @kernel.eq_mp(@equal.gen_alpha_conv(f_4)(t479), th0)
        let rewr_forall_th : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
          forall_pair_conv(parm_2)(parms_2),
        )
        let th2_4 = @equal.conv_rule(
          @equal.binder_conv(
            @equal.thenc(
              @equal.land_conv((x480 : @kernel.Term) => {
                @pair.gabs_conv(rewr_forall_th, x480)
              }),
              expand_paired_all_conv,
            ),
          ),
          th1_4,
        )
        let (f2, bod2) = @basics.dest_exists(@kernel.concl(th2_4))
        let t488 = @bool.conjuncts_rule(@kernel.assume_rule(bod2))
        let t484 = @equal.thenc(
          @equal.rator_conv(@equal.beta_conv),
          @pair.gen_beta_conv,
        )
        let t485 = @equal.comb2_conv(
          @lib.funpow(
            2,
            fn(
              x481 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s482 = @equal.rand_conv(x481)
              fn(x483 : @kernel.Term) -> @kernel.Thm raise { s482(x483) }
            },
            @pair.gen_beta_conv,
          ),
          t484,
        )
        let ths3 = @lib.map(
          fn(x487 : @kernel.Thm) -> @kernel.Thm raise {
            ((x486 : @kernel.Thm) => @equal.conv_rule(t485, x486))(
              @bool.spec_all(x487),
            )
          },
          t488,
        )
        let ths4 = @lib.map2(
          fn(x489 : @kernel.Thm, x490 : @kernel.Term) -> @kernel.Thm raise {
            let th_7 = x489
            let t_5 = x490
            let (avs_1, tbod) = @basics.strip_forall(t_5)
            @lib.itlist(
              @bool.gen,
              avs_1,
              @drule.part_match(
                fn(x491 : @kernel.Term) -> @kernel.Term raise { x491 },
                th_7,
              )(tbod),
            )
          },
          ths3,
          cjs,
        )
        let th5 = @bool.simple_exists(f_4, @lib.end_itlist(@bool.conj, ths4))
        let th6 = @bool.prove_hyp(th2_4, @bool.simple_choose(f_4, th5))
        let t497 = @lib.hd(@kernel.hyp(th6))
        let t496 = @equal.land_conv(
          @lib.funpow(
            2,
            fn(
              x494 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              fn(x495 : @kernel.Term) -> @kernel.Thm raise {
                @pair.gabs_conv(x494, x495)
              }
            },
            @equal.binder_conv(
              @equal.thenc(@equal.binder_conv(rewr_forall_th), rewr_forall_th),
            ),
          ),
        )
        let t492 = @equal.binder_conv(
          @equal.thenc(@equal.binder_conv(rewr_forall_th), rewr_forall_th),
        )
        let th7 = @equal.thenc(
          @equal.rand_conv(
            @equal.comb2_conv(
              @equal.rand_conv(
                @equal.land_conv((x493 : @kernel.Term) => {
                  @pair.gabs_conv(t492, x493)
                }),
              ),
              t496,
            ),
          ),
          elim_listops_conv,
        )(t497)
        let th8 = @bool.prove_hyp(@bool.undisch(@bool.eq_imp_rule(th7).1), th6)
        let (wfasm, cdasm) = @basics.dest_conj(@lib.hd(@kernel.hyp(th8)))
        let t498 = @kernel.assume_rule(cdasm)
        let th9 = @bool.prove_hyp(
          @bool.conj(@kernel.assume_rule(wfasm), t498),
          th8,
        )
        let th10 = simplify_welldefinedness_conv(cdasm)
        let th11 = @bool.prove_hyp(
          @bool.undisch(@bool.eq_imp_rule(th10).1),
          th9,
        )
        @bool.prove_hyp(@bool.truth(), th11)
      }
      e => raise e
    }
  }
  let instantiate_casewise_recursion : (@kernel.Term) -> @kernel.Thm raise = fn(
    x499 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let etm = x499
    let eth = tuple_function_existence(etm)
    let dtm = @lib.hd(@kernel.hyp(eth))
    let dth = pinstantiate_casewise_recursion(dtm)
    @bool.prove_hyp(dth, eth)
  }
  let break_down_admissibility : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x500 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th1_5 = x500
    if @kernel.hyp(th1_5) == @list.List([]) {
      th1_5
    } else {
      let def_2 = @kernel.concl(th1_5)
      let (f_5, bod_4) = @basics.dest_exists(def_2)
      let cjs_1 = @basics.conjuncts(bod_4)
      let eqs_1 = @lib.map(
        fn(x503 : @kernel.Term) -> @kernel.Term raise {
          (fn(
            x501 : (@list.List[@kernel.Term], @kernel.Term),
          ) -> @kernel.Term raise {
            x501.1
          })(
            (fn(
              x502 : @kernel.Term,
            ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
              @basics.strip_forall(x502)
            })(x503),
          )
        },
        cjs_1,
      )
      let (lefts_1, rights_1) = @lib.unzip(@lib.map(@kernel.dest_eq, eqs_1))
      let arglists_1 = @lib.map(
        fn(x506 : @kernel.Term) -> @list.List[@kernel.Term] raise {
          (fn(
            x504 : (@kernel.Term, @list.List[@kernel.Term]),
          ) -> @list.List[@kernel.Term] raise {
            x504.1
          })(
            (fn(
              x505 : @kernel.Term,
            ) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
              @basics.strip_comb(x505)
            })(x506),
          )
        },
        lefts_1,
      )
      let parms0_1 = @kernel.freesl(@lib.unions(arglists_1))
      let parms_3 = if parms0_1 != @list.List([]) {
        parms0_1
      } else {
        @list.List([@basics.genvar(@kernel.aty)])
      }
      let wfasm_1 = @lib.find(
        fn(x507 : @kernel.Term) -> Bool raise { @basics.is_exists(x507) },
        @kernel.hyp(th1_5),
      )
      let (ord, bod_5) = @basics.dest_exists(wfasm_1)
      let t522 = @simp.pure_rewrite_tac(@list.List([@theorems.forall_simp()]))
      let t521 = @tactics.try_tac(fn(
        x520 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        (fn(
          x509 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let (asl_2, w_2) = x509
          let v_3 = @basics.dest_forall(w_2).0
          let t519 = @tactics.map_every(
            fn(
              x517 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let v_5 = x517
              @tactics.spec_tac(v_5, v_5)
            },
            @lib.rev(parms_3).concat(@list.List([v_3])),
          )
          let t516 = @tactics.conv_tac(
            @equal.top_depth_conv(@pair.gen_beta_conv),
          )
          let t515 = @tactics.map_every(
            fn(
              x511 : @kernel.Term,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let v_4 = x511
              let t514 = @tactics.x_gen_tac(v_4)
              @tactics.then_tac(
                @tactics.try_tac(
                  @simp.gen_rewrite_tac(
                    fn(
                      x513 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      x513
                    },
                    @list.List([@pair.forall_pair_thm()]),
                  ),
                ),
                t514,
              )
            },
            parms_3,
          )
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.x_gen_tac(v_3), t515),
              t516,
            ),
            t519,
          )
        })(x520)(x520)
      })
      let t508 = @tactics.repeat_tac(admiss_tac)
      let simp_admiss_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise = @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([@pair.let_def(), @pair.let_end_def()]),
                ),
                t508,
              ),
              t521,
            ),
            t522,
          ),
          fn(
            x527 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            (fn(
              x523 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let (asl_3, w_3) = x523
              @tactics.map_every(
                fn(
                  x525 : @kernel.Term,
                ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                  (
                    @list.List[@kernel.Term],
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                  ),
                  @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                  (
                    (
                      @list.List[(Int64, @kernel.Term)],
                      @list.List[(@kernel.Term, @kernel.Term)],
                      @list.List[(@kernel.HolType, @kernel.HolType)],
                    ),
                    @list.List[@kernel.Thm],
                  ) -> @kernel.Thm raise,
                ) raise) raise {
                  let t_6 = x525
                  @tactics.spec_tac(t_6, t_6)
                },
                @lib.subtract(@kernel.frees(w_3), @list.List([ord])),
              )
            })(x527)(x527)
          },
        ),
        fn(
          x530 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          (fn(
            x528 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            let (asl_4, w_4) = x528
            @tactics.accept_tac(@kernel.assume_rule(w_4))
          })(x530)(x530)
        },
      )
      let th2_5 = @tactics.tac_proof((@list.List([]), bod_5), simp_admiss_tac)
      let th3_3 = @bool.simple_exists(ord, th2_5)
      let allasms = @kernel.hyp(th3_3)
      let wfasm_2 = @equal.lhand(@kernel.concl(th2_5))
      let th4_2 = @kernel.assume_rule(
        @bool.list_mk_conj(
          @lib.subtract(allasms, @list.List([wfasm_2])).prepend(wfasm_2),
        ),
      )
      let th5_1 = @bool.simple_choose(
        ord,
        @lib.itlist(@bool.prove_hyp, @bool.conjuncts_rule(th4_2), th3_3),
      )
      @bool.prove_hyp(th5_1, th1_5)
    }
  }
  let pure_prove_recursive_function_exists : (@kernel.Term) -> @kernel.Thm raise = fn(
    x531 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let dtm_1 = x531
    let th_8 = break_down_admissibility(instantiate_casewise_recursion(dtm_1))
    if @kernel.concl(th_8) == dtm_1 {
      th_8
    } else {
      raise Failure("prove_general_recursive_function_exists: sanity")
    }
  }
  let num_ty = @parser.parse_type("num")
  let prove_depth_measure_exists : (String) -> @kernel.Thm raise = fn(
    x532 : String,
  ) -> @kernel.Thm raise {
    let tyname = x532
    let (_, _, sth) = @lib.assoc(tyname, @class.inductive_type_store().val)
    let (ty_2, zty) = @basics.dest_fun_ty(
      @kernel.type_of(
        @basics.dest_exists(@basics.strip_forall(@kernel.concl(sth)).1).0,
      ),
    )
    let rth = @kernel.inst_type(@list.List([(num_ty, zty)]), sth)
    let (avs_2, bod_6) = @basics.strip_forall(@kernel.concl(rth))
    let (ev, cbod) = @basics.dest_exists(bod_6)
    let process_clause : (Int64) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(
      x533 : Int64,
    ) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      let k = x533
      fn(x534 : @kernel.Term) -> @kernel.Term raise {
        let t_7 = x534
        let (avs_3, eq) = @basics.strip_forall(t_7)
        let (l_1, r) = @kernel.dest_eq(eq)
        let (fn_, cargs) = @kernel.dest_comb(l_1)
        let (con, args_3) = @basics.strip_comb(cargs)
        let bargs = @lib.filter(
          fn(x535 : @kernel.Term) -> Bool raise {
            let t_8 = x535
            @kernel.type_of(t_8) == ty_2
          },
          args_3,
        )
        let t538 = @lib.map(
          (x537 : @kernel.Term) => {
            @lib.curry(
              fn(x536 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                @kernel.mk_comb(x536.0, x536.1)
              },
              fn_,
              x537,
            )
          },
          bargs,
        )
        let t539 = t538.prepend(@nums.mk_small_numeral(k))
        let r_p = @basics.list_mk_binop(
          @term_syntax.parse_term("op_plus"),
          t539,
        )
        @bool.list_mk_forall(avs_3, @basics.mk_eq(l_1, r_p))
      }
    }
    let cjs_2 = @basics.conjuncts(cbod)
    let def_3 = @lib.map2(
      fn(x540 : Int64, x541 : @kernel.Term) -> @kernel.Term raise {
        let s542 = process_clause(x540)
        s542(x541)
      },
      @lib.range(1L, Int::to_int64(@lib.length(cjs_2))),
      cjs_2,
    )
    let t543 = @bool.list_mk_conj(def_3)
    @recursion.prove_recursive_functions_exist(sth)(t543)
  }
  let inductive_measure_then : (
    ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise = fn(
    x544 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let tac = x544
    fn(
      x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      let (asl_5, w_5) = x545
      let (ev_1, bod_7) = @basics.dest_exists(w_5)
      let ty_3 = @kernel.dest_type(@basics.dest_fun_ty(@kernel.type_of(ev_1)).0).0
      let th_9 = prove_depth_measure_exists(ty_3)
      let (ev_p, bod_p) = @basics.dest_exists(@kernel.concl(th_9))
      let t546 = @kernel.type_of(ev_1)
      let th_p = @kernel.inst_type(
        @basics.type_match(@kernel.type_of(ev_p), t546, @list.List([])),
        th_9,
      )
      let t550 = @tactics.disch_then(fn(
        x548 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let th_10 = x548
        @simp.rewrite_tac(@list.List([th_10]))
      })
      let t547 = @tactics.match_mp_tac(@theorems.mono_exists())
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.mp_tac(th_p), t547),
            @tactics.gen_tac,
          ),
          t550,
        ),
        tac,
      )((asl_5, w_5))
    }
  }
  let one_tm = @term_syntax.parse_term("1")
  let constant_measure_then : (
    ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise = fn(
    x551 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let tac_1 = x551
    fn(
      x552 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      let (asl_6, w_6) = x552
      let (ev_2, bod_8) = @basics.dest_exists(w_6)
      let ty_4 = @basics.dest_fun_ty(@kernel.type_of(ev_2)).0
      @tactics.then_tac(
        @tactics.exists_tac(@kernel.mk_abs(@basics.genvar(ty_4), one_tm)),
        tac_1,
      )((asl_6, w_6))
    }
  }
  let guess_measure_then : (
    ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise = fn(
    x553 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let tac_2 = x553
    let t556 = constant_measure_then(tac_2)
    let t555 = inductive_measure_then(tac_2)
    @tactics.orelse_tac(
      @tactics.orelse_tac(
        @tactics.then_tac(
          @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => n + 1")),
          tac_2,
        ),
        t555,
      ),
      t556,
    )
  }
  let t558 = @simp.asm_simp_tac(@list.List([@wf.wf_lex()]))
  let t557 = @tactics.exists_tac(
    @term_syntax.parse_term("fn { (x1, y1) => fn { (x2, y2) => (r : (A, A) -> Bool)(x1, x2) || x1 == x2 && (s : (B, B) -> Bool)(y1, y2) } }"),
  )
  let t559 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t557),
    t558,
  )
  let pth_lexleft = @tactics.prove(
    @term_syntax.parse_term("(∃ r : (A, A) -> Bool, WF(r) && (∃ s : (B, B) -> Bool, WF(s) && (P : (((A, B), (A, B)) -> Bool) -> Bool)(fn { (x1, y1) => fn { (x2, y2) => r(x1, x2) || x1 == x2 && s(y1, y2) } }))) → (∃ t : ((A, B), (A, B)) -> Bool, WF(t) && P(t))"),
    t559,
  )
  let t567 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()]),
  )
  let t566 = @tactics.first_x_assum(fn(
    x563 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_11 = x563
    let t565 = @tactics.match_mp_tac(@theorems.eq_imp())
    @tactics.then_tac(
      @tactics.then_tac(@tactics.mp_tac(th_11), t565),
      @tactics.ap_term_tac,
    )
  })
  let t561 = @term_syntax.parse_term("GABS((f : ((B, A)) -> (A, B)) => ∀ b : B, ∀ a : A, GEQ(f((b, a)), (a, b)))")
  let t562 = @simp.asm_simp_tac(
    @list.List([
      @wf.wf_lex(),
      @class.eta_ax(),
      @bool.ispecl(
        @list.List([@term_syntax.parse_term("(R : ((A, B), (A, B)) -> Bool)"), t561]),
        @wf.wf_measure_gen(),
      ),
    ]),
  )
  let t560 = @tactics.exists_tac(
    @term_syntax.parse_term("(u : (A, B)) => (v : (A, B)) => fn { (x1, y1) => fn { (x2, y2) => (r : (B, B) -> Bool)(x1, x2) || x1 == x2 && (s : (A, A) -> Bool)(y1, y2) } }(fn { (a, b) => (b, a) }(u), fn { (a, b) => (b, a) }(v))"),
  )
  let t568 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t560),
        t562,
      ),
      t566,
    ),
    t567,
  )
  let pth_lexright = @tactics.prove(
    @term_syntax.parse_term("(∃ r : (B, B) -> Bool, WF(r) && (∃ s : (A, A) -> Bool, WF(s) && (P : (((A, B), (A, B)) -> Bool) -> Bool)(fn { (x1, y1) => fn { (x2, y2) => r(y1, y2) || y1 == y2 && s(x1, x2) } }))) → (∃ t : ((A, B), (A, B)) -> Bool, WF(t) && P(t))"),
    t568,
  )
  let t569 = @meson.meson_tac(@list.List([@wf.wf_measure()]))
  let pth_measure = @tactics.prove(
    @term_syntax.parse_term("(∃ m : (A) -> Num, (P : ((A, A) -> Bool) -> Bool)(MEASURE(m))) → (∃ r : (A, A) -> Bool, WF(r) && P(r))"),
    t569,
  )
  fn guess_wf_then(
    x570 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise,
    x571 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> @tactics.Goalstate raise {
    let tac_3 = x570
    let (asl_7, w_7) = x571
    let t579 = guess_measure_then(tac_3)
    let t578 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
    let t577 = @simp.rewrite_tac(@list.List([@wf.measure(), @wf.measure_le()]))
    let t580 = @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(pth_measure), t577),
        t578,
      ),
      t579,
    )
    let t576 = @tactics.then_tac(@tactics.match_mp_tac(pth_lexright), (
      x575 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) => {
      guess_wf_then(
        (x574 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
          guess_wf_then(tac_3, x574)
        },
        x575,
      )
    })
    @tactics.orelse_tac(
      @tactics.orelse_tac(
        @tactics.then_tac(@tactics.match_mp_tac(pth_lexleft), (
          x573 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) => {
          guess_wf_then(
            (x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
              guess_wf_then(tac_3, x572)
            },
            x573,
          )
        }),
        t576,
      ),
      t580,
    )((asl_7, w_7))
  }
  let t581 = @equal.try_conv(@ind_types.forall_unwind_conv)
  let t582 = @equal.thenc(@equal.try_conv(simplify_welldefinedness_conv), t581)
  let pre_guess_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.conv_tac(
    @equal.binder_conv(
      @equal.depth_binop_conv(@term_syntax.parse_term("op_slash_bslash"), t582),
    ),
  )
  let false_tm_1 = @term_syntax.parse_term("(x : A) => (y : A) => false")
  let t587 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()])),
    @int.arith_tac,
  )
  let guess_ordering_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.orelse_tac(
    fn(
      x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      (fn(
        x583 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let (asl_8, w_8) = x583
        let ty_5 = @basics.dest_fun_ty(
            @kernel.type_of(@basics.dest_exists(w_8).0),
          ).0
        let t585 = @simp.rewrite_tac(@list.List([@wf.wf_false()]))
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.exists_tac(
              @kernel.inst(@list.List([(ty_5, @kernel.aty)]), false_tm_1),
            ),
            t585,
          ),
          @tactics.no_tac,
        )
      })(x586)(x586)
    },
    (x588 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
      guess_wf_then(t587, x588)
    },
  )
  let prove_general_recursive_function_exists : (@kernel.Term) -> @kernel.Thm raise = fn(
    x589 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let etm_1 = x589
    let th_12 = pure_prove_recursive_function_exists(etm_1)
    try {
      let wtm = @lib.find(
        fn(x590 : @kernel.Term) -> Bool raise { @basics.is_exists(x590) },
        @kernel.hyp(th_12),
      )
      let wth = @tactics.prove(
        wtm,
        @tactics.then_tac(pre_guess_tac, guess_ordering_tac),
      )
      @bool.prove_hyp(wth, th_12)
    } catch {
      Failure(_) => th_12
      e => raise e
    }
  }
  let (
    instantiate_casewise_recursion_1,
    pure_prove_recursive_function_exists_1,
    prove_general_recursive_function_exists_1,
  ) = (
    instantiate_casewise_recursion, pure_prove_recursive_function_exists, prove_general_recursive_function_exists,
  )
  instantiate_casewise_recursion_c.set(instantiate_casewise_recursion_1)
  pure_prove_recursive_function_exists_c.set(
    pure_prove_recursive_function_exists_1,
  )
  prove_general_recursive_function_exists_c.set(
    prove_general_recursive_function_exists_1,
  )
}

///|
fn[TA] depair_l(
  rule : (@kernel.Thm) -> @kernel.Thm raise,
  x397 : @list.List[TA],
  x398 : @kernel.Term,
) -> @kernel.Thm raise {
  let depair = (x397 : @list.List[TA], x398 : @kernel.Term) => {
    depair_l(rule, x397, x398)
  }
  let l = x397
  let t_4 = x398
  match l {
    More(v_1, tail=Empty) => @kernel.refl(t_4)
    More(v_2, tail=vs_1) =>
      rule(@equal.binder_conv((x399 : @kernel.Term) => depair(vs_1, x399))(t_4))
    _ => raise @lib.MatchFailure("tscript.ml:726")
  }
}

///|
/// define
fn step_39() -> Unit raise {
  let close_definition_clauses : (@kernel.Term) -> (@kernel.Term, @kernel.Thm) raise = fn(
    x591 : @kernel.Term,
  ) -> (@kernel.Term, @kernel.Thm) raise {
    let tm = x591
    let (avs, bod) = @basics.strip_forall(tm)
    let cjs = @basics.conjuncts(bod)
    let fs = @lib.map(
      fn(x597 : @kernel.Term) -> @kernel.Term raise {
        (fn(
          x595 : (@list.List[@kernel.Term], @kernel.Term),
        ) -> @kernel.Term raise {
          (fn(x593 : @kernel.Term) -> @kernel.Term raise {
            ((x592 : @kernel.Term) => @lib.repeat(@kernel.rator, x592))(
              @equal.lhs(x593),
            )
          })(
            (fn(
              x594 : (@list.List[@kernel.Term], @kernel.Term),
            ) -> @kernel.Term raise {
              x594.1
            })(x595),
          )
        })(
          (fn(
            x596 : @kernel.Term,
          ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
            @basics.strip_forall(x596)
          })(x597),
        )
      },
      cjs,
    ) catch {
      Failure(_) => raise Failure("close_definition_clauses: non-equation")
      e => raise e
    }
    if Int::to_int64(@lib.length(@lib.setify(fs))) != 1L {
      raise Failure("close_definition_clauses: defining multiple functions")
    } else {
      let f = @lib.hd(fs)
      if @lib.mem(f, avs) {
        raise Failure("close_definition_clauses: fn quantified")
      } else {
        let do_clause : (@kernel.Term) -> @kernel.Thm raise = fn(
          x598 : @kernel.Term,
        ) -> @kernel.Thm raise {
          let t = x598
          let (lvs, bod_1) = @basics.strip_forall(t)
          let fvs = @lib.subtract(
            @kernel.frees(@equal.lhs(bod_1)),
            lvs.prepend(f),
          )
          @bool.specl(fvs, @kernel.assume_rule(@bool.list_mk_forall(fvs, t)))
        }
        let ths = @lib.map(do_clause, cjs)
        let ajs = @lib.map(
          fn(x600 : @kernel.Thm) -> @kernel.Term raise {
            @lib.hd(
              (fn(x599 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
                @kernel.hyp(x599)
              })(x600),
            )
          },
          ths,
        )
        let th = @kernel.assume_rule(@bool.list_mk_conj(ajs))
        let t601 = @lib.end_itlist(@bool.conj, ths)
        (
          f,
          @lib.itlist(
            @bool.gen,
            avs,
            @lib.itlist(@bool.prove_hyp, @bool.conjuncts_rule(th), t601),
          ),
        )
      }
    }
  }
  let type_instantiate_defining_const : (@kernel.Term) -> @kernel.Term raise = fn(
    x602 : @kernel.Term,
  ) -> @kernel.Term raise {
    let t_1 = x602
    let cjs_1 = @basics.conjuncts(t_1)
    let fs_1 = @lib.map(
      fn(x608 : @kernel.Term) -> @kernel.Term raise {
        (fn(
          x606 : (@list.List[@kernel.Term], @kernel.Term),
        ) -> @kernel.Term raise {
          (fn(x604 : @kernel.Term) -> @kernel.Term raise {
            ((x603 : @kernel.Term) => @lib.repeat(@kernel.rator, x603))(
              @equal.lhs(x604),
            )
          })(
            (fn(
              x605 : (@list.List[@kernel.Term], @kernel.Term),
            ) -> @kernel.Term raise {
              x605.1
            })(x606),
          )
        })(
          (fn(
            x607 : @kernel.Term,
          ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
            @basics.strip_forall(x607)
          })(x608),
        )
      },
      cjs_1,
    )
    let f_1 = @lib.hd(fs_1)
    if !@kernel.is_const(f_1) {
      t_1
    } else {
      let fname = @printer.name_of(f_1)
      let f_occurs = @basics.find_terms(
        fn(x609 : @kernel.Term) -> Bool raise {
          let t_p = x609
          @kernel.is_const(t_p) && @printer.name_of(t_p) == fname && t_p != f_1
        },
        t_1,
      )
      @lib.itlist(
        fn(x610 : @kernel.Term, x611 : @kernel.Term) -> @kernel.Term raise {
          let f_p = x610
          let t_updated = x611
          @drule.instantiate(
            @drule.term_match(@list.List([]), f_p, f_1),
            t_updated,
          )
        },
        f_occurs,
        t_1,
      )
    }
  }
  define_c.set(fn(x612 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x612
    let tm_p = @basics.strip_forall(tm_1).1
    try {
      let tm_p_1 = type_instantiate_defining_const(tm_p)
      let (th_2, th_p) = @lib.tryfind(
        fn(x613 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
          let th_1 = x613
          (
            th_1,
            @drule.part_match(
              fn(x614 : @kernel.Term) -> @kernel.Term raise { x614 },
              th_1,
            )(tm_p_1),
          )
        },
        @pair.the_definitions().val,
      )
      let t616 = @kernel.concl(th_2)
      if @lib.can(
          @drule.part_match(
            fn(x615 : @kernel.Term) -> @kernel.Term raise { x615 },
            th_p,
          ),
          t616,
        ) {
        @lib.warn(true, "Benign redefinition")
        th_p
      } else {
        raise Failure("")
      }
    } catch {
      Failure(_) => {
        let (f_2, th_3) = close_definition_clauses(tm_1)
        if !@kernel.is_var(f_2) {
          raise Failure(
            "define: '" +
            (@printer.string_of_term(f_2) + "' is already defined"),
          )
        } else {
          let etm = @bool.mk_exists(f_2, @lib.hd(@kernel.hyp(th_3)))
          let th1 = prove_general_recursive_function_exists(etm)
          let th2 = @nums.new_specification(
            @list.List([@kernel.dest_var(f_2).0]),
          )(th1)
          let t617 = @kernel.dest_var(f_2)
          let g = @basics.mk_mconst(t617.0, t617.1)
          let th3 = @bool.prove_hyp(
            th2,
            @kernel.inst_rule(@list.List([(g, f_2)]), th_3),
          )
          {
            @pair.the_definitions().val = @pair.the_definitions().val.prepend(
              th3,
            )
            ()
          }
          th3
        }
      }
      e => raise e
    }
  })
}

///|
let define_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "define",
)

///|
/// `define`
pub fn define_(x : @kernel.Term) -> @kernel.Thm raise {
  define_c.get()(x)
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
  step_7()
  step_8()
  step_9()
  step_10()
  step_11()
  step_12()
  step_13()
  step_14()
  step_15()
  step_16()
  step_17()
  step_18()
  step_19()
  step_20()
  step_21()
  step_22()
  step_23()
  step_24()
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
}
