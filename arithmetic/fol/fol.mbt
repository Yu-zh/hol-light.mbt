// Translated from upstream Arithmetic/fol.ml; edit this file directly.

///|
/// Arithmetic/fol.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// Arithmetic/fol.ml:11
fn step_2() -> Unit raise {
  @printer.parse_as_infix("++", (20L, "right"))
}

///|
/// Arithmetic/fol.ml:12
fn step_3() -> Unit raise {
  @printer.parse_as_infix("**", (22L, "right"))
}

///|
let term_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_INDUCT")

///|
/// `term_INDUCT`
pub fn term_induct() -> @kernel.Thm {
  term_induct_c.get()
}

///|
let term_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_RECURSION")

///|
/// `term_RECURSION`
pub fn term_recursion() -> @kernel.Thm {
  term_recursion_c.get()
}

///|
/// term_INDUCT, term_RECURSION
fn step_4() -> Unit raise {
  let (term_induct, term_recursion) = @ind_types.define_type("enum Term { Z; V(Num); Suc(Term); `++`(Term, Term); `**`(Term, Term) }")
  term_induct_c.set(term_induct)
  term_recursion_c.set(term_recursion)
}

///|
/// term_CASES
fn step_5() -> Unit raise {
  term_cases_c.set(@ind_types.prove_cases_thm(term_induct()))
}

///|
let term_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_CASES")

///|
/// `term_CASES`
pub fn term_cases() -> @kernel.Thm {
  term_cases_c.get()
}

///|
/// term_DISTINCT
fn step_6() -> Unit raise {
  term_distinct_c.set(@ind_types.distinctness("term"))
}

///|
let term_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_DISTINCT")

///|
/// `term_DISTINCT`
pub fn term_distinct() -> @kernel.Thm {
  term_distinct_c.get()
}

///|
/// term_INJ
fn step_7() -> Unit raise {
  term_inj_c.set(@ind_types.injectivity("term"))
}

///|
let term_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_INJ")

///|
/// `term_INJ`
pub fn term_inj() -> @kernel.Thm {
  term_inj_c.get()
}

///|
/// Arithmetic/fol.ml:31
fn step_8() -> Unit raise {
  @printer.parse_as_infix("===", (18L, "right"))
}

///|
/// Arithmetic/fol.ml:32
fn step_9() -> Unit raise {
  @printer.parse_as_infix("<<", (18L, "right"))
}

///|
/// Arithmetic/fol.ml:33
fn step_10() -> Unit raise {
  @printer.parse_as_infix("<<=", (18L, "right"))
}

///|
/// Arithmetic/fol.ml:35
fn step_11() -> Unit raise {
  @printer.parse_as_infix("&&", (16L, "right"))
}

///|
/// Arithmetic/fol.ml:36
fn step_12() -> Unit raise {
  @printer.parse_as_infix("||", (15L, "right"))
}

///|
/// Arithmetic/fol.ml:37
fn step_13() -> Unit raise {
  @printer.parse_as_infix("-->", (14L, "right"))
}

///|
/// Arithmetic/fol.ml:38
fn step_14() -> Unit raise {
  @printer.parse_as_infix("<->", (13L, "right"))
}

///|
let form_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_INDUCT")

///|
/// `form_INDUCT`
pub fn form_induct() -> @kernel.Thm {
  form_induct_c.get()
}

///|
let form_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_RECURSION")

///|
/// `form_RECURSION`
pub fn form_recursion() -> @kernel.Thm {
  form_recursion_c.get()
}

///|
/// form_INDUCT, form_RECURSION
fn step_15() -> Unit raise {
  let (form_induct, form_recursion) = @ind_types.define_type("enum Form { False; True; `===`(Term, Term); `<<`(Term, Term); `<<=`(Term, Term); Not(Form); `&&`(Form, Form); `||`(Form, Form); `-->`(Form, Form); `<->`(Form, Form); `!!`(Num, Form); `??`(Num, Form) }")
  form_induct_c.set(form_induct)
  form_recursion_c.set(form_recursion)
}

///|
/// form_CASES
fn step_16() -> Unit raise {
  form_cases_c.set(@ind_types.prove_cases_thm(form_induct()))
}

///|
let form_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_CASES")

///|
/// `form_CASES`
pub fn form_cases() -> @kernel.Thm {
  form_cases_c.get()
}

///|
/// form_DISTINCT
fn step_17() -> Unit raise {
  form_distinct_c.set(@ind_types.distinctness("form"))
}

///|
let form_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_DISTINCT")

///|
/// `form_DISTINCT`
pub fn form_distinct() -> @kernel.Thm {
  form_distinct_c.get()
}

///|
/// form_INJ
fn step_18() -> Unit raise {
  form_inj_c.set(@ind_types.injectivity("form"))
}

///|
let form_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_INJ")

///|
/// `form_INJ`
pub fn form_inj() -> @kernel.Thm {
  form_inj_c.get()
}

///|
/// Arithmetic/fol.ml:64
fn step_19() -> Unit raise {
  @printer.parse_as_infix("|->", (22L, "right"))
}

///|
/// valmod
fn step_20() -> Unit raise {
  valmod_c.set(@pair.new_definition(@term_syntax.parse_term("(op_bar_minus_gt : (A, B, (A) -> B, A) -> B)((x : A), (a : B), (v : (A) -> B)) == ((y : A) => if y == x { a } else { v(y) })")))
}

///|
let valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valmod")

///|
/// `valmod`
pub fn valmod() -> @kernel.Thm {
  valmod_c.get()
}

///|
/// termval
fn step_21() -> Unit raise {
  let t1 = @term_syntax.parse_term("(termval : ((Num) -> Num, Term) -> Num)((v : (Num) -> Num), Z) == 0 && termval(v, V((n : Num))) == v(n) && termval(v, Suc((t : Term))) == SUC(termval(v, t)) && termval(v, op_plus_plus((s : Term), t)) == termval(v, s) + termval(v, t) && termval(v, op_star_star(s, t)) == termval(v, s) * termval(v, t)")
  termval_c.set(@recursion.new_recursive_definition(term_recursion())(t1))
}

///|
let termval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("termval")

///|
/// `termval`
pub fn termval() -> @kernel.Thm {
  termval_c.get()
}

///|
/// holds
fn step_22() -> Unit raise {
  let t2 = @term_syntax.parse_term("(holds : ((Num) -> Num, Form) -> Bool)((v : (Num) -> Num), False) == false && holds(v, True) == true && holds(v, op_eq_eq_eq((s : Term), (t : Term))) == (termval(v, s) == termval(v, t)) && holds(v, op_lt_lt(s, t)) == (termval(v, s) < termval(v, t)) && holds(v, op_lt_lt_eq(s, t)) == (termval(v, s) <= termval(v, t)) && holds(v, Not((p : Form))) == !holds(v, p) && holds(v, op_amp_amp(p, (q : Form))) == (holds(v, p) && holds(v, q)) && holds(v, op_bar_bar(p, q)) == (holds(v, p) || holds(v, q)) && holds(v, op_minus_minus_gt(p, q)) == (holds(v, p) → holds(v, q)) && holds(v, op_lt_minus_gt(p, q)) == (holds(v, p) == holds(v, q)) && holds(v, op_bang_bang((x : Num), p)) == (∀ a : Num, holds(op_bar_minus_gt(x, a, v), p)) && holds(v, op_q_q(x, p)) == (∃ a : Num, holds(op_bar_minus_gt(x, a, v), p))")
  holds_c.set(@recursion.new_recursive_definition(form_recursion())(t2))
}

///|
let holds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("holds")

///|
/// `holds`
pub fn holds() -> @kernel.Thm {
  holds_c.get()
}

///|
/// arithtrue
fn step_23() -> Unit raise {
  arithtrue_c.set(@pair.new_definition(@term_syntax.parse_term("(arithtrue : (Form) -> Bool)((p : Form)) == (∀ v : (Num) -> Num, holds(v, p))")))
}

///|
let arithtrue_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arithtrue")

///|
/// `arithtrue`
pub fn arithtrue() -> @kernel.Thm {
  arithtrue_c.get()
}

///|
/// VALMOD
fn step_24() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([valmod()]))
  valmod_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, ∀ y : _, ∀ a : _, op_bar_minus_gt(x, y, v, a) == (if a == x { y } else { v(a) })"), t3))
}

///|
let valmod_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD")

///|
/// `VALMOD`
pub fn valmod_v1() -> @kernel.Thm {
  valmod_v1_c.get()
}

///|
/// VALMOD_BASIC
fn step_25() -> Unit raise {
  let t4 = @simp.rewrite_tac(@list.List([valmod()]))
  valmod_basic_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, ∀ y : _, op_bar_minus_gt(x, y, v, x) == y"), t4))
}

///|
let valmod_basic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_BASIC")

///|
/// `VALMOD_BASIC`
pub fn valmod_basic() -> @kernel.Thm {
  valmod_basic_c.get()
}

///|
/// VALMOD_VALMOD_BASIC
fn step_26() -> Unit raise {
  let t6 = @simp.asm_rewrite_tac(@list.List([]))
  let t5 = @tactics.repeat_tac(@tactics.gen_tac)
  let t7 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([valmod(), @class.fun_eq_thm()])), t5), @class.cond_cases_tac), t6)
  valmod_valmod_basic_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ a : _, ∀ b : _, ∀ x : _, op_bar_minus_gt(x, a, op_bar_minus_gt(x, b, v)) == op_bar_minus_gt(x, a, v)"), t7))
}

///|
let valmod_valmod_basic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_VALMOD_BASIC")

///|
/// `VALMOD_VALMOD_BASIC`
pub fn valmod_valmod_basic() -> @kernel.Thm {
  valmod_valmod_basic_c.get()
}

///|
/// VALMOD_REPEAT
fn step_27() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([]))
  let t9 = @tactics.then_tac(@simp.rewrite_tac(@list.List([valmod(), @class.fun_eq_thm()])), t8)
  valmod_repeat_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, op_bar_minus_gt(x, v(x), v) == v"), t9))
}

///|
let valmod_repeat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_REPEAT")

///|
/// `VALMOD_REPEAT`
pub fn valmod_repeat() -> @kernel.Thm {
  valmod_repeat_c.get()
}

///|
/// FORALL_VALMOD
fn step_28() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([valmod_repeat()]))
  forall_valmod_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, (∀ v : (_) -> _, ∀ a : _, (P : ((_) -> _) -> Bool)(op_bar_minus_gt(x, a, v))) == (∀ v : (_) -> _, P(v))"), t10))
}

///|
let forall_valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_VALMOD")

///|
/// `FORALL_VALMOD`
pub fn forall_valmod() -> @kernel.Thm {
  forall_valmod_c.get()
}

///|
/// VALMOD_SWAP
fn step_29() -> Unit raise {
  let t11 = @meson.meson_tac(@list.List([]))
  let t12 = @tactics.then_tac(@simp.rewrite_tac(@list.List([valmod(), @class.fun_eq_thm()])), t11)
  valmod_swap_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, ∀ y : _, ∀ a : _, ∀ b : _, !(x == y) → op_bar_minus_gt(x, a, op_bar_minus_gt(y, b, v)) == op_bar_minus_gt(y, b, op_bar_minus_gt(x, a, v))"), t12))
}

///|
let valmod_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_SWAP")

///|
/// `VALMOD_SWAP`
pub fn valmod_swap() -> @kernel.Thm {
  valmod_swap_c.get()
}

///|
/// VALMOD_TRIVIAL
fn step_30() -> Unit raise {
  let t13 = @meson.meson_tac(@list.List([]))
  let t14 = @tactics.then_tac(@simp.rewrite_tac(@list.List([valmod(), @class.fun_eq_thm()])), t13)
  valmod_trivial_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, v(x) == (t : _) → op_bar_minus_gt(x, t, v) == v"), t14))
}

///|
let valmod_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_TRIVIAL")

///|
/// `VALMOD_TRIVIAL`
pub fn valmod_trivial() -> @kernel.Thm {
  valmod_trivial_c.get()
}

///|
/// Arithmetic/fol.ml:127
fn step_31() -> Unit raise {
  @printer.parse_as_infix("|=>", (22L, "right"))
}

///|
/// assign
fn step_32() -> Unit raise {
  assign_c.set(@pair.new_definition(@term_syntax.parse_term("(op_bar_eq_gt : (Num, Term, Num) -> Term)((x : Num), (a : Term)) == op_bar_minus_gt(x, a, V)")))
}

///|
let assign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("assign")

///|
/// `assign`
pub fn assign() -> @kernel.Thm {
  assign_c.get()
}

///|
/// ASSIGN
fn step_33() -> Unit raise {
  let t15 = @simp.rewrite_tac(@list.List([assign(), valmod()]))
  assign_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ a : Term, op_bar_eq_gt(x, a, y) == (if y == x { a } else { V(y) })"), t15))
}

///|
let assign_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ASSIGN")

///|
/// `ASSIGN`
pub fn assign_v1() -> @kernel.Thm {
  assign_v1_c.get()
}

///|
/// ASSIGN_TRIV
fn step_34() -> Unit raise {
  let t16 = @simp.rewrite_tac(@list.List([valmod_repeat(), assign()]))
  assign_triv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, op_bar_eq_gt(x, V(x)) == V"), t16))
}

///|
let assign_triv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ASSIGN_TRIV")

///|
/// `ASSIGN_TRIV`
pub fn assign_triv() -> @kernel.Thm {
  assign_triv_c.get()
}

///|
/// FVT
fn step_35() -> Unit raise {
  let t17 = @term_syntax.parse_term("(FVT : (Term, Num) -> Bool)(Z) == {} && FVT(V((n : Num))) == {n} && FVT(Suc((t : Term))) == FVT(t) && FVT(op_plus_plus((s : Term), t)) == UNION(FVT(s), FVT(t)) && FVT(op_star_star(s, t)) == UNION(FVT(s), FVT(t))")
  fvt_c.set(@recursion.new_recursive_definition(term_recursion())(t17))
}

///|
let fvt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FVT")

///|
/// `FVT`
pub fn fvt() -> @kernel.Thm {
  fvt_c.get()
}

///|
/// FV
fn step_36() -> Unit raise {
  let t18 = @term_syntax.parse_term("(FV : (Form, Num) -> Bool)(False) == {} && FV(True) == {} && FV(op_eq_eq_eq((s : Term), (t : Term))) == UNION(FVT(s), FVT(t)) && FV(op_lt_lt(s, t)) == UNION(FVT(s), FVT(t)) && FV(op_lt_lt_eq(s, t)) == UNION(FVT(s), FVT(t)) && FV(Not((p : Form))) == FV(p) && FV(op_amp_amp(p, (q : Form))) == UNION(FV(p), FV(q)) && FV(op_bar_bar(p, q)) == UNION(FV(p), FV(q)) && FV(op_minus_minus_gt(p, q)) == UNION(FV(p), FV(q)) && FV(op_lt_minus_gt(p, q)) == UNION(FV(p), FV(q)) && FV(op_bang_bang((x : Num), p)) == DELETE(FV(p), x) && FV(op_q_q(x, p)) == DELETE(FV(p), x)")
  fv_c.set(@recursion.new_recursive_definition(form_recursion())(t18))
}

///|
let fv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV")

///|
/// `FV`
pub fn fv() -> @kernel.Thm {
  fv_c.get()
}

///|
/// FVT_FINITE
fn step_37() -> Unit raise {
  let t19 = @simp.simp_tac(@list.List([fvt(), @sets.finite_rules(), @sets.finite_insert(), @sets.finite_union()]))
  let t20 = @tactics.then_tac(@tactics.match_mp_tac(term_induct()), t19)
  fvt_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, FINITE(FVT(t))"), t20))
}

///|
let fvt_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FVT_FINITE")

///|
/// `FVT_FINITE`
pub fn fvt_finite() -> @kernel.Thm {
  fvt_finite_c.get()
}

///|
/// FV_FINITE
fn step_38() -> Unit raise {
  let t21 = @simp.simp_tac(@list.List([fv(), fvt_finite(), @sets.finite_rules(), @sets.finite_delete(), @sets.finite_union()]))
  let t22 = @tactics.then_tac(@tactics.match_mp_tac(form_induct()), t21)
  fv_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, FINITE(FV(p))"), t22))
}

///|
let fv_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_FINITE")

///|
/// `FV_FINITE`
pub fn fv_finite() -> @kernel.Thm {
  fv_finite_c.get()
}

///|
let axiom_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("axiom_RULES")

///|
/// `axiom_RULES`
pub fn axiom_rules() -> @kernel.Thm {
  axiom_rules_c.get()
}

///|
let axiom_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("axiom_INDUCT")

///|
/// `axiom_INDUCT`
pub fn axiom_induct() -> @kernel.Thm {
  axiom_induct_c.get()
}

///|
let axiom_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("axiom_CASES")

///|
/// `axiom_CASES`
pub fn axiom_cases() -> @kernel.Thm {
  axiom_cases_c.get()
}

///|
/// axiom_RULES, axiom_INDUCT, axiom_CASES
fn step_39() -> Unit raise {
  let (axiom_rules, axiom_induct, axiom_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ p : Form, ∀ q : Form, (axiom : (Form) -> Bool)(op_minus_minus_gt(p, op_minus_minus_gt(q, p)))) && (∀ p : Form, ∀ q : Form, ∀ r : Form, axiom(op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, r)), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p, r))))) && (∀ p : Form, axiom(op_minus_minus_gt(op_minus_minus_gt(op_minus_minus_gt(p, False), False), p))) && (∀ x : Num, ∀ p : Form, ∀ q : Form, axiom(op_minus_minus_gt(op_bang_bang(x, op_minus_minus_gt(p, q)), op_minus_minus_gt(op_bang_bang(x, p), op_bang_bang(x, q))))) && (∀ x : Num, ∀ p : Form, !IN(x, FV(p)) → axiom(op_minus_minus_gt(p, op_bang_bang(x, p)))) && (∀ x : Num, ∀ t : Term, !IN(x, FVT(t)) → axiom(op_q_q(x, op_eq_eq_eq(V(x), t)))) && (∀ t : Term, axiom(op_eq_eq_eq(t, t))) && (∀ s : Term, ∀ t : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_eq_eq_eq(Suc(s), Suc(t))))) && (∀ s : Term, ∀ t : Term, ∀ u : Term, ∀ v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_eq_eq_eq(op_plus_plus(s, u), op_plus_plus(t, v)))))) && (∀ s : Term, ∀ t : Term, ∀ u : Term, ∀ v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_eq_eq_eq(op_star_star(s, u), op_star_star(t, v)))))) && (∀ s : Term, ∀ t : Term, ∀ u : Term, ∀ v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_minus_minus_gt(op_eq_eq_eq(s, u), op_eq_eq_eq(t, v)))))) && (∀ s : Term, ∀ t : Term, ∀ u : Term, ∀ v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_minus_minus_gt(op_lt_lt(s, u), op_lt_lt(t, v)))))) && (∀ s : Term, ∀ t : Term, ∀ u : Term, ∀ v : Term, axiom(op_minus_minus_gt(op_eq_eq_eq(s, t), op_minus_minus_gt(op_eq_eq_eq(u, v), op_minus_minus_gt(op_lt_lt_eq(s, u), op_lt_lt_eq(t, v)))))) && (∀ p : Form, ∀ q : Form, axiom(op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(p, q)))) && (∀ p : Form, ∀ q : Form, axiom(op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(q, p)))) && (∀ p : Form, ∀ q : Form, axiom(op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(op_minus_minus_gt(q, p), op_lt_minus_gt(p, q))))) && axiom(op_lt_minus_gt(True, op_minus_minus_gt(False, False))) && (∀ p : Form, axiom(op_lt_minus_gt(Not(p), op_minus_minus_gt(p, False)))) && (∀ p : Form, ∀ q : Form, axiom(op_lt_minus_gt(op_amp_amp(p, q), op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, False)), False)))) && (∀ p : Form, ∀ q : Form, axiom(op_lt_minus_gt(op_bar_bar(p, q), Not(op_amp_amp(Not(p), Not(q)))))) && (∀ x : Num, ∀ p : Form, axiom(op_lt_minus_gt(op_q_q(x, p), Not(op_bang_bang(x, Not(p))))))"))
  axiom_rules_c.set(axiom_rules)
  axiom_induct_c.set(axiom_induct)
  axiom_cases_c.set(axiom_cases)
}

///|
/// Arithmetic/fol.ml:206
fn step_40() -> Unit raise {
  @printer.parse_as_infix("|--", (11L, "right"))
}

///|
let proves_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("proves_RULES")

///|
/// `proves_RULES`
pub fn proves_rules() -> @kernel.Thm {
  proves_rules_c.get()
}

///|
let proves_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("proves_INDUCT")

///|
/// `proves_INDUCT`
pub fn proves_induct() -> @kernel.Thm {
  proves_induct_c.get()
}

///|
let proves_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("proves_CASES")

///|
/// `proves_CASES`
pub fn proves_cases() -> @kernel.Thm {
  proves_cases_c.get()
}

///|
/// proves_RULES, proves_INDUCT, proves_CASES
fn step_41() -> Unit raise {
  let (proves_rules, proves_induct, proves_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ p : Form, axiom(p) || IN(p, (A : (Form) -> Bool)) → (op_bar_minus_minus : ((Form) -> Bool, Form) -> Bool)(A, p)) && (∀ p : Form, ∀ q : Form, op_bar_minus_minus(A, op_minus_minus_gt(p, q)) && op_bar_minus_minus(A, p) → op_bar_minus_minus(A, q)) && (∀ p : Form, ∀ x : Num, op_bar_minus_minus(A, p) → op_bar_minus_minus(A, op_bang_bang(x, p)))"))
  proves_rules_c.set(proves_rules)
  proves_induct_c.set(proves_induct)
  proves_cases_c.set(proves_cases)
}

///|
/// TERMVAL_VALUATION
fn step_42() -> Unit raise {
  let t25 = @meson.asm_meson_tac(@list.List([]))
  let t24 = @tactics.repeat_tac(@tactics.strip_tac)
  let t23 = @simp.rewrite_tac(@list.List([termval(), fvt(), @sets.in_insert(), @sets.in_union(), @sets.not_in_empty()]))
  let t26 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t23), t24), t25)
  termval_valuation_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ v : (Num) -> Num, ∀ v' : (Num) -> Num, (∀ x : Num, IN(x, FVT(t)) → v'(x) == v(x)) → termval(v', t) == termval(v, t)"), t26))
}

///|
let termval_valuation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMVAL_VALUATION")

///|
/// `TERMVAL_VALUATION`
pub fn termval_valuation() -> @kernel.Thm {
  termval_valuation_c.get()
}

///|
/// HOLDS_VALUATION
fn step_43() -> Unit raise {
  let t32 = @simp.asm_simp_tac(@list.List([]))
  let t31 = @tactics.first_assum(@tactics.match_mp_tac)
  let t30 = @tactics.repeat_tac(@tactics.strip_tac)
  let t29 = @simp.rewrite_tac(@list.List([valmod()]))
  let t28 = @simp.simp_tac(@list.List([termval_valuation()]))
  let t27 = @simp.rewrite_tac(@list.List([fv(), holds(), @sets.in_union(), @sets.in_delete()]))
  let t33 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induct()), t27), t28), t29), t30), @tactics.ap_term_tac), @tactics.abs_tac), t31), t32)
  holds_valuation_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ v : (Num) -> Num, ∀ v' : (Num) -> Num, (∀ x : Num, IN(x, FV(p)) → v'(x) == v(x)) → holds(v', p) == holds(v, p)"), t33))
}

///|
let holds_valuation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_VALUATION")

///|
/// `HOLDS_VALUATION`
pub fn holds_valuation() -> @kernel.Thm {
  holds_valuation_c.get()
}

///|
/// TERMVAL_VALMOD_OTHER
fn step_44() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([termval_valuation(), valmod_v1()]))
  termval_valmod_other_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ x : Num, ∀ a : Num, ∀ t : Term, !IN(x, FVT(t)) → termval(op_bar_minus_gt(x, a, v), t) == termval(v, t)"), t34))
}

///|
let termval_valmod_other_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMVAL_VALMOD_OTHER")

///|
/// `TERMVAL_VALMOD_OTHER`
pub fn termval_valmod_other() -> @kernel.Thm {
  termval_valmod_other_c.get()
}

///|
/// HOLDS_VALMOD_OTHER
fn step_45() -> Unit raise {
  let t35 = @meson.meson_tac(@list.List([holds_valuation(), valmod_v1()]))
  holds_valmod_other_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ x : Num, ∀ a : Num, ∀ p : Form, !IN(x, FV(p)) → holds(op_bar_minus_gt(x, a, v), p) == holds(v, p)"), t35))
}

///|
let holds_valmod_other_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_VALMOD_OTHER")

///|
/// `HOLDS_VALMOD_OTHER`
pub fn holds_valmod_other() -> @kernel.Thm {
  holds_valmod_other_c.get()
}

///|
/// AXIOMS_TRUE
fn step_46() -> Unit raise {
  let t48 = @meson.meson_tac(@list.List([]))
  let t49 = @tactics.conv_tac(@class.taut)
  let t50 = @tactics.conv_tac(@class.taut)
  let t51 = @tactics.conv_tac(@class.taut)
  let t52 = @simp.simp_tac(@list.List([termval()]))
  let t53 = @simp.simp_tac(@list.List([termval()]))
  let t54 = @simp.simp_tac(@list.List([termval()]))
  let t55 = @simp.simp_tac(@list.List([termval()]))
  let t56 = @simp.simp_tac(@list.List([termval()]))
  let t57 = @simp.simp_tac(@list.List([termval()]))
  let t58 = @simp.simp_tac(@list.List([termval()]))
  let t59 = @simp.simp_tac(@list.List([termval()]))
  let t47 = @meson.asm_meson_tac(@list.List([]))
  let t46 = @simp.rewrite_tac(@list.List([]))
  let t45 = @tactics.match_mp_tac(termval_valuation())
  let t44 = @simp.rewrite_tac(@list.List([termval(), valmod()]))
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("termval((v : (Num) -> Num), (t : Term))")), t44), t45), @tactics.gen_tac), t46), @class.cond_cases_tac), t47)
  let t43 = @meson.asm_meson_tac(@list.List([]))
  let t42 = @simp.rewrite_tac(@list.List([valmod()]))
  let t41 = @tactics.match_mp_tac(holds_valuation())
  let t40 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t39 = @tactics.repeat_tac(@tactics.gen_tac)
  let t61 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm()])), t39), t40), t41), t42), @tactics.gen_tac), @class.cond_cases_tac), t43)
  let t62 = @simp.simp_tac(@list.List([]))
  let t63 = @tactics.conv_tac(@class.taut)
  let t64 = @list.List([@tactics.conv_tac(@class.taut), t63, t62, t61, t60, t59, t58, t57, t56, t55, t54, t53, t52, t51, t50, t49, t48])
  let t38 = @simp.rewrite_tac(@list.List([holds()]))
  let t37 = @tactics.repeat_tac(@tactics.strip_tac)
  let t36 = @simp.rewrite_tac(@list.List([arithtrue()]))
  let t65 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(axiom_induct()), t36), t37), t38), t64)
  axioms_true_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, axiom(p) → arithtrue(p)"), t65))
}

///|
let axioms_true_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AXIOMS_TRUE")

///|
/// `AXIOMS_TRUE`
pub fn axioms_true() -> @kernel.Thm {
  axioms_true_c.get()
}

///|
/// THEOREMS_TRUE
fn step_47() -> Unit raise {
  let t69 = @simp.simp_tac(@list.List([holds(), arithtrue()]))
  let t68 = @simp.rewrite_tac(@list.List([@sets.in_(), axioms_true()]))
  let t67 = @simp.asm_simp_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t66 = @tactics.match_mp_tac(proves_induct())
  let t70 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))), @tactics.disch_tac), t66), t67), t68), t69)
  theorems_true_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Form) -> Bool, ∀ p : Form, (∀ q : Form, IN(q, A) → arithtrue(q)) && op_bar_minus_minus(A, p) → arithtrue(p)"), t70))
}

///|
let theorems_true_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THEOREMS_TRUE")

///|
/// `THEOREMS_TRUE`
pub fn theorems_true() -> @kernel.Thm {
  theorems_true_c.get()
}

///|
/// MAX_SYM
fn step_48() -> Unit raise {
  max_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, MAX(x, y) == MAX(y, x)"), @int.arith_tac))
}

///|
let max_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAX_SYM")

///|
/// `MAX_SYM`
pub fn max_sym() -> @kernel.Thm {
  max_sym_c.get()
}

///|
/// MAX_ASSOC
fn step_49() -> Unit raise {
  max_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ z : Num, MAX(x, MAX(y, z)) == MAX(MAX(x, y), z)"), @int.arith_tac))
}

///|
let max_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAX_ASSOC")

///|
/// `MAX_ASSOC`
pub fn max_assoc() -> @kernel.Thm {
  max_assoc_c.get()
}

///|
/// SETMAX
fn step_50() -> Unit raise {
  setmax_c.set(@pair.new_definition(@term_syntax.parse_term("(SETMAX : ((Num) -> Bool) -> Num)((s : (Num) -> Bool)) == ITSET(MAX, s, 0)")))
}

///|
let setmax_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX")

///|
/// `SETMAX`
pub fn setmax() -> @kernel.Thm {
  setmax_c.get()
}

///|
/// VARIANT
fn step_51() -> Unit raise {
  variant_c.set(@pair.new_definition(@term_syntax.parse_term("(VARIANT : ((Num) -> Bool) -> Num)((s : (Num) -> Bool)) == SETMAX(s) + 1")))
}

///|
let variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANT")

///|
/// `VARIANT`
pub fn variant() -> @kernel.Thm {
  variant_c.get()
}

///|
/// SETMAX_LEMMA
fn step_52() -> Unit raise {
  let t79 = @meson.asm_meson_tac(@list.List([@arith.le_cases(), @arith.le_trans(), @arith.le_antisym()]))
  let t78 = @simp.asm_rewrite_tac(@list.List([]))
  let t74 = @term_syntax.parse_term("(y : Num) <= (x : Num)")
  let t75 = @term_syntax.parse_term("(x : Num) <= (y : Num)")
  let t76 = @term_syntax.parse_term("(y : Num) <= (s : Num)")
  let t77 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(x : Num) <= (s : Num)"), t76, t75, t74]))
  let t73 = @tactics.repeat_tac(@tactics.gen_tac)
  let t72 = @simp.rewrite_tac(@list.List([@arith.max()]))
  let t71 = @tactics.match_mp_tac(@sets.finite_recursion())
  let t80 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([setmax()])), t71), t72), t73), t77), t78), t79)
  setmax_lemma_c.set(@tactics.prove(@term_syntax.parse_term("SETMAX({}) == 0 && (∀ x : Num, ∀ s : (Num) -> Bool, FINITE(s) → SETMAX(INSERT(x, s)) == (if IN(x, s) { SETMAX(s) } else { MAX(x, SETMAX(s)) }))"), t80))
}

///|
let setmax_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX_LEMMA")

///|
/// `SETMAX_LEMMA`
pub fn setmax_lemma() -> @kernel.Thm {
  setmax_lemma_c.get()
}

///|
/// SETMAX_MEMBER
fn step_53() -> Unit raise {
  let t87 = @meson.asm_meson_tac(@list.List([@arith.le_cases(), @arith.le_trans()]))
  let t86 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl()]))
  let t85 = @tactics.repeat_tac(@tactics.strip_tac)
  let t84 = @simp.asm_rewrite_tac(@list.List([@arith.max()]))
  let t83 = @simp.asm_simp_tac(@list.List([setmax_lemma()]))
  let t82 = @tactics.repeat_tac(@tactics.gen_tac)
  let t81 = @simp.rewrite_tac(@list.List([@sets.not_in_empty(), @sets.in_insert()]))
  let t88 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_induct_strong()), t81), t82), @tactics.strip_tac), t83), t84), t85), @class.cond_cases_tac), t86), t87)
  setmax_member_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) → (∀ x : Num, IN(x, s) → x <= SETMAX(s))"), t88))
}

///|
let setmax_member_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX_MEMBER")

///|
/// `SETMAX_MEMBER`
pub fn setmax_member() -> @kernel.Thm {
  setmax_member_c.get()
}

///|
/// SETMAX_THM
fn step_54() -> Unit raise {
  let t91 = @meson.asm_meson_tac(@list.List([setmax_member()]))
  let t90 = @simp.rewrite_tac(@list.List([@arith.max()]))
  let t89 = @simp.asm_simp_tac(@list.List([setmax_lemma()]))
  let t92 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t89), @class.cond_cases_tac), t90), @class.cond_cases_tac), t91)
  setmax_thm_c.set(@tactics.prove(@term_syntax.parse_term("SETMAX({}) == 0 && (∀ x : Num, ∀ s : (Num) -> Bool, FINITE(s) → SETMAX(INSERT(x, s)) == MAX(x, SETMAX(s)))"), t92))
}

///|
let setmax_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX_THM")

///|
/// `SETMAX_THM`
pub fn setmax_thm() -> @kernel.Thm {
  setmax_thm_c.get()
}

///|
/// SETMAX_UNION
fn step_55() -> Unit raise {
  let t93 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("UNION(INSERT((x : _), (s : (_) -> Bool)), (t : (_) -> Bool)) == INSERT(x, UNION(s, t))"), t93)
  let t102 = @simp.rewrite_tac(@list.List([max_assoc()]))
  let t101 = @simp.asm_simp_tac(@list.List([setmax_thm(), @sets.finite_union()]))
  let t100 = @simp.rewrite_tac(@list.List([lemma]))
  let t99 = @tactics.repeat_tac(@tactics.strip_tac)
  let t98 = @list.List([@simp.rewrite_tac(@list.List([@arith.max(), @arith.le_0()])), @tactics.all_tac])
  let t97 = @simp.rewrite_tac(@list.List([@sets.union_empty(), setmax_thm()]))
  let t96 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ t : (Num) -> Bool, FINITE(t) → (∀ s : (Num) -> Bool, FINITE(s) → SETMAX(UNION(s, t)) == MAX(SETMAX(s), SETMAX(t)))"), fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x94
    @meson.meson_tac(@list.List([th, @sets.finite_union()]))
  }), @tactics.gen_tac), @tactics.disch_tac), t96), t97), @tactics.conj_tac), t98), t99), t100), t101), t102)
  setmax_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, FINITE(UNION(s, t)) → SETMAX(UNION(s, t)) == MAX(SETMAX(s), SETMAX(t))"), t103))
}

///|
let setmax_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX_UNION")

///|
/// `SETMAX_UNION`
pub fn setmax_union() -> @kernel.Thm {
  setmax_union_c.get()
}

///|
/// VARIANT_FINITE
fn step_56() -> Unit raise {
  let t104 = @meson.meson_tac(@list.List([setmax_member(), @int.arith_rule(@term_syntax.parse_term("!((x : Num) + 1 <= x)"))]))
  let t105 = @tactics.then_tac(@simp.rewrite_tac(@list.List([variant()])), t104)
  variant_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) → !IN(VARIANT(s), s)"), t105))
}

///|
let variant_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANT_FINITE")

///|
/// `VARIANT_FINITE`
pub fn variant_finite() -> @kernel.Thm {
  variant_finite_c.get()
}

///|
/// VARIANT_THM
fn step_57() -> Unit raise {
  let t106 = @simp.rewrite_tac(@list.List([fv_finite()]))
  let t107 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(variant_finite())), t106)
  variant_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, !IN(VARIANT(FV(p)), FV(p))"), t107))
}

///|
let variant_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANT_THM")

///|
/// `VARIANT_THM`
pub fn variant_thm() -> @kernel.Thm {
  variant_thm_c.get()
}

///|
/// NOT_IN_VARIANT
fn step_58() -> Unit raise {
  let t108 = @meson.meson_tac(@list.List([@sets.subset(), variant_finite()]))
  not_in_variant_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, FINITE(s) && SUBSET(t, s) → !IN(VARIANT(s), t)"), t108))
}

///|
let not_in_variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_IN_VARIANT")

///|
/// `NOT_IN_VARIANT`
pub fn not_in_variant() -> @kernel.Thm {
  not_in_variant_c.get()
}

///|
/// termsubst
fn step_59() -> Unit raise {
  let t109 = @term_syntax.parse_term("(termsubst : ((Num) -> Term, Term) -> Term)((v : (Num) -> Term), Z) == Z && (∀ x : Num, termsubst(v, V(x)) == v(x)) && (∀ t : Term, termsubst(v, Suc(t)) == Suc(termsubst(v, t))) && (∀ s : Term, ∀ t : Term, termsubst(v, op_plus_plus(s, t)) == op_plus_plus(termsubst(v, s), termsubst(v, t))) && (∀ s : Term, ∀ t : Term, termsubst(v, op_star_star(s, t)) == op_star_star(termsubst(v, s), termsubst(v, t)))")
  termsubst_c.set(@recursion.new_recursive_definition(term_recursion())(t109))
}

///|
let termsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("termsubst")

///|
/// `termsubst`
pub fn termsubst() -> @kernel.Thm {
  termsubst_c.get()
}

///|
/// TERMVAL_TERMSUBST
fn step_60() -> Unit raise {
  let t111 = @simp.simp_tac(@list.List([termval(), termsubst(), @trivia.o_thm()]))
  let t110 = @tactics.match_mp_tac(term_induct())
  let t112 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t110), t111)
  termval_termsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ i : (Num) -> Term, ∀ t : Term, termval(v, termsubst(i, t)) == termval(o(termval(v), i), t)"), t112))
}

///|
let termval_termsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMVAL_TERMSUBST")

///|
/// `TERMVAL_TERMSUBST`
pub fn termval_termsubst() -> @kernel.Thm {
  termval_termsubst_c.get()
}

///|
/// TERMSUBST_TERMSUBST
fn step_61() -> Unit raise {
  let t114 = @simp.simp_tac(@list.List([termval(), termsubst(), @trivia.o_thm()]))
  let t113 = @tactics.match_mp_tac(term_induct())
  let t115 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t113), t114)
  termsubst_termsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : (Num) -> Term, ∀ j : (Num) -> Term, ∀ t : Term, termsubst(j, termsubst(i, t)) == termsubst(o(termsubst(j), i), t)"), t115))
}

///|
let termsubst_termsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_TERMSUBST")

///|
/// `TERMSUBST_TERMSUBST`
pub fn termsubst_termsubst() -> @kernel.Thm {
  termsubst_termsubst_c.get()
}

///|
/// TERMSUBST_TRIV
fn step_62() -> Unit raise {
  let t116 = @simp.simp_tac(@list.List([termsubst()]))
  let t117 = @tactics.then_tac(@tactics.match_mp_tac(term_induct()), t116)
  termsubst_triv_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, termsubst(V, t) == t"), t117))
}

///|
let termsubst_triv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_TRIV")

///|
/// `TERMSUBST_TRIV`
pub fn termsubst_triv() -> @kernel.Thm {
  termsubst_triv_c.get()
}

///|
/// TERMSUBST_EQ
fn step_63() -> Unit raise {
  let t119 = @meson.meson_tac(@list.List([]))
  let t118 = @simp.simp_tac(@list.List([termsubst(), fvt(), @sets.in_sing(), @sets.in_union()]))
  let t120 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t118), t119)
  termsubst_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ v : (Num) -> Term, ∀ v' : (Num) -> Term, (∀ x : Num, IN(x, FVT(t)) → v'(x) == v(x)) → termsubst(v', t) == termsubst(v, t)"), t120))
}

///|
let termsubst_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_EQ")

///|
/// `TERMSUBST_EQ`
pub fn termsubst_eq() -> @kernel.Thm {
  termsubst_eq_c.get()
}

///|
/// TERMSUBST_FVT
fn step_64() -> Unit raise {
  let t124 = @meson.meson_tac(@list.List([]))
  let t123 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_sing(), @sets.not_in_empty()]))
  let t122 = @simp.rewrite_tac(@list.List([fvt(), termsubst()]))
  let t121 = @tactics.match_mp_tac(term_induct())
  let t125 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()])), t121), t122), t123), t124)
  termsubst_fvt_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ i : (Num) -> Term, FVT(termsubst(i, t)) == {(x : Num) | ∃ y : Num, IN(y, FVT(t)) && IN(x, FVT(i(y)))}"), t125))
}

///|
let termsubst_fvt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_FVT")

///|
/// `TERMSUBST_FVT`
pub fn termsubst_fvt() -> @kernel.Thm {
  termsubst_fvt_c.get()
}

///|
/// TERMSUBST_ASSIGN
fn step_65() -> Unit raise {
  let t132 = @meson.asm_meson_tac(@list.List([]))
  let t131 = @simp.rewrite_tac(@list.List([assign_v1()]))
  let t130 = @tactics.match_mp_tac(termsubst_eq())
  let t129 = @simp.gen_rewrite_tac(fn(x126 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s127 = @equal.rand_conv(x126)
    fn(x128 : @kernel.Term) -> @kernel.Thm raise {
      s127(x128)
    }
  }, @list.List([@equal.gsym(termsubst_triv())]))
  let t133 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t129), t130), t131), t132)
  termsubst_assign_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ s : Term, ∀ t : Term, !IN(x, FVT(t)) → termsubst(op_bar_eq_gt(x, s), t) == t"), t133))
}

///|
let termsubst_assign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_ASSIGN")

///|
/// `TERMSUBST_ASSIGN`
pub fn termsubst_assign() -> @kernel.Thm {
  termsubst_assign_c.get()
}

///|
/// TERMSUBST_TRIVIAL
fn step_66() -> Unit raise {
  let t134 = @meson.meson_tac(@list.List([termsubst_eq(), termsubst_triv()]))
  termsubst_trivial_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Term, ∀ t : Term, (∀ x : Num, IN(x, FVT(t)) → v(x) == V(x)) → termsubst(v, t) == t"), t134))
}

///|
let termsubst_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_TRIVIAL")

///|
/// `TERMSUBST_TRIVIAL`
pub fn termsubst_trivial() -> @kernel.Thm {
  termsubst_trivial_c.get()
}

///|
/// formsubst
fn step_67() -> Unit raise {
  let t135 = @term_syntax.parse_term("(formsubst : ((Num) -> Term, Form) -> Form)((v : (Num) -> Term), False) == False && formsubst(v, True) == True && formsubst(v, op_eq_eq_eq((s : Term), (t : Term))) == op_eq_eq_eq(termsubst(v, s), termsubst(v, t)) && formsubst(v, op_lt_lt(s, t)) == op_lt_lt(termsubst(v, s), termsubst(v, t)) && formsubst(v, op_lt_lt_eq(s, t)) == op_lt_lt_eq(termsubst(v, s), termsubst(v, t)) && formsubst(v, Not((p : Form))) == Not(formsubst(v, p)) && formsubst(v, op_amp_amp(p, (q : Form))) == op_amp_amp(formsubst(v, p), formsubst(v, q)) && formsubst(v, op_bar_bar(p, q)) == op_bar_bar(formsubst(v, p), formsubst(v, q)) && formsubst(v, op_minus_minus_gt(p, q)) == op_minus_minus_gt(formsubst(v, p), formsubst(v, q)) && formsubst(v, op_lt_minus_gt(p, q)) == op_lt_minus_gt(formsubst(v, p), formsubst(v, q)) && formsubst(v, op_bang_bang((x : Num), q)) == LET((z : Num) => LET_END(op_bang_bang(z, formsubst(op_bar_minus_gt(x, V(z), v), q))), if (∃ y : Num, IN(y, FV(op_bang_bang(x, q))) && IN(x, FVT(v(y)))) { VARIANT(FV(formsubst(op_bar_minus_gt(x, V(x), v), q))) } else { x }) && formsubst(v, op_q_q(x, q)) == LET((z : Num) => LET_END(op_q_q(z, formsubst(op_bar_minus_gt(x, V(z), v), q))), if (∃ y : Num, IN(y, FV(op_q_q(x, q))) && IN(x, FVT(v(y)))) { VARIANT(FV(formsubst(op_bar_minus_gt(x, V(x), v), q))) } else { x })")
  formsubst_c.set(@recursion.new_recursive_definition(form_recursion())(t135))
}

///|
let formsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("formsubst")

///|
/// `formsubst`
pub fn formsubst() -> @kernel.Thm {
  formsubst_c.get()
}

///|
/// FORMSUBST_PROPERTIES
fn step_68() -> Unit raise {
  let t160 = @meson.asm_meson_tac(@list.List([@sets.in_delete()]))
  let t159 = @simp.rewrite_tac(@list.List([]))
  let t158 = @tactics.match_mp_tac(termval_valuation())
  let t157 = @simp.asm_rewrite_tac(@list.List([termval()]))
  let t156 = @simp.rewrite_tac(@list.List([valmod(), @trivia.o_def()]))
  let t155 = @tactics.match_mp_tac(holds_valuation())
  let t161 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac), t155), @tactics.gen_tac), t156), @class.cond_cases_tac), t157), @tactics.disch_tac), t158), @tactics.gen_tac), t159), @class.cond_cases_tac), t160)
  let t154 = @meson.asm_meson_tac(@list.List([fvt(), @sets.in_sing(), @sets.in_delete()]))
  let t162 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm(), valmod()])), @tactics.ap_term_tac), @tactics.abs_tac), @class.cond_cases_tac), t154), t161])
  let t153 = @simp.asm_rewrite_tac(@list.List([fv(), @sets.in_delete(), holds()]))
  let t151 = @simp.simp_tac(@list.List([]))
  let t150 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t149 = @simp.asm_rewrite_tac(@list.List([valmod(), @sets.in_delete(), @class.contrapos_thm()]))
  let t148 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("formsubst(op_bar_minus_gt((x : Num), V(x), (i : (Num) -> Term)), (p : Form))"), variant_thm()))
  let t147 = @simp.asm_rewrite_tac(@list.List([]))
  let t152 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("z"), @class.cond_cases_tac), t147), t148), t149), t150), t151), @tactics.all_tac])
  let t146 = @tactics.subgoal_then(@term_syntax.parse_term("!(∃ y : Num, IN(y, DELETE(FV((p : Form)), (x : Num))) && IN((z : Num), FVT((i : (Num) -> Term)(y))))"), fn(x143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s144 = @tactics.assume_tac(x143)
    fn(x145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s144(x145)
    }
  })
  let t142 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t141 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : (Num) -> Term)"))
  let t140 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t139 = @term_syntax.parse_term("(p : Form)")
  let t163 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t139])), @tactics.strip_tac), t140), t141), @pair.let_tac), t142), t146), t152), @tactics.conj_tac), @tactics.gen_tac), t153), t162)
  let t138 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])))
  let t137 = @simp.rewrite_tac(@list.List([fv(), holds(), formsubst(), termsubst_fvt(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_union(), termval_termsubst()]))
  let t136 = @tactics.match_mp_tac(form_induct())
  let t164 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()])), t136), t137), t138), @tactics.conj_tac), t163)
  formsubst_properties_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, (∀ i : (Num) -> Term, FV(formsubst(i, p)) == {(x : Num) | ∃ y : Num, IN(y, FV(p)) && IN(x, FVT(i(y)))}) && (∀ i : (Num) -> Term, ∀ v : (Num) -> Num, holds(v, formsubst(i, p)) == holds(o(termval(v), i), p))"), t164))
}

///|
let formsubst_properties_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_PROPERTIES")

///|
/// `FORMSUBST_PROPERTIES`
pub fn formsubst_properties() -> @kernel.Thm {
  formsubst_properties_c.get()
}

///|
/// FORMSUBST_FV
fn step_69() -> Unit raise {
  let t165 = @simp.rewrite_tac(@list.List([formsubst_properties()]))
  formsubst_fv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, FV(formsubst(i, p)) == {(x : Num) | ∃ y : Num, IN(y, FV(p)) && IN(x, FVT(i(y)))}"), t165))
}

///|
let formsubst_fv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_FV")

///|
/// `FORMSUBST_FV`
pub fn formsubst_fv() -> @kernel.Thm {
  formsubst_fv_c.get()
}

///|
/// HOLDS_FORMSUBST
fn step_70() -> Unit raise {
  let t166 = @simp.rewrite_tac(@list.List([formsubst_properties()]))
  holds_formsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, ∀ v : (Num) -> Num, holds(v, formsubst(i, p)) == holds(o(termval(v), i), p)"), t166))
}

///|
let holds_formsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_FORMSUBST")

///|
/// `HOLDS_FORMSUBST`
pub fn holds_formsubst() -> @kernel.Thm {
  holds_formsubst_c.get()
}

///|
/// FORMSUBST_EQ
fn step_71() -> Unit raise {
  let t186 = @meson.asm_meson_tac(@list.List([]))
  let t185 = @simp.rewrite_tac(@list.List([valmod()]))
  let t184 = @tactics.first_assum(@tactics.match_mp_tac)
  let t187 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_term_tac), t184), t185), t186)
  let t188 = @list.List([@meson.asm_meson_tac(@list.List([])), t187])
  let t182 = @simp.asm_simp_tac(@list.List([]))
  let t181 = @simp.rewrite_tac(@list.List([valmod()]))
  let t180 = @tactics.first_assum(@tactics.match_mp_tac)
  let t183 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t180), t181), t182)])
  let t178 = @simp.simp_tac(@list.List([]))
  let t177 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t176 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), form_inj()]))
  let t175 = @term_syntax.parse_term("(j : (Num) -> Term)")
  let t189 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(i : (Num) -> Term)"), t175]))), @tactics.disch_tac), t176), t177), t178), @tactics.conj_tac), t183), @tactics.ap_thm_tac), @tactics.binop_tac), t188)
  let t173 = @term_syntax.parse_term("(p : Form)")
  let t174 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t173]))
  let t172 = @list.List([@meson.meson_tac(@list.List([termsubst_eq()])), @tactics.all_tac])
  let t171 = @simp.gen_rewrite_tac(fn(x170 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x170
  }, @list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t169 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t168 = @simp.simp_tac(@list.List([]))
  let t167 = @simp.rewrite_tac(@list.List([fv(), formsubst(), @sets.in_union(), @sets.in_delete()]))
  let t190 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induct()), t167), t168), t169), t171), @tactics.conj_tac), t172), @tactics.conj_tac), t174), t189)
  formsubst_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, ∀ j : (Num) -> Term, (∀ x : Num, IN(x, FV(p)) → i(x) == j(x)) → formsubst(i, p) == formsubst(j, p)"), t190))
}

///|
let formsubst_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_EQ")

///|
/// `FORMSUBST_EQ`
pub fn formsubst_eq() -> @kernel.Thm {
  formsubst_eq_c.get()
}

///|
/// FORMSUBST_TRIV
fn step_72() -> Unit raise {
  let t195 = @meson.asm_meson_tac(@list.List([]))
  let t194 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), valmod_repeat()]))
  let t193 = @tactics.repeat_tac(@tactics.strip_tac)
  let t192 = @simp.rewrite_tac(@list.List([fvt(), @sets.in_sing(), fv(), @sets.in_delete()]))
  let t191 = @simp.simp_tac(@list.List([formsubst(), termsubst_triv()]))
  let t196 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induct()), t191), t192), t193), @class.cond_cases_tac), t194), t195)
  formsubst_triv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, formsubst(V, p) == p"), t196))
}

///|
let formsubst_triv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_TRIV")

///|
/// `FORMSUBST_TRIV`
pub fn formsubst_triv() -> @kernel.Thm {
  formsubst_triv_c.get()
}

///|
/// FORMSUBST_TRIVIAL
fn step_73() -> Unit raise {
  let t197 = @meson.meson_tac(@list.List([formsubst_eq(), formsubst_triv()]))
  formsubst_trivial_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Term, ∀ p : Form, (∀ x : Num, IN(x, FV(p)) → v(x) == V(x)) → formsubst(v, p) == p"), t197))
}

///|
let formsubst_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_TRIVIAL")

///|
/// `FORMSUBST_TRIVIAL`
pub fn formsubst_trivial() -> @kernel.Thm {
  formsubst_trivial_c.get()
}

///|
/// safe_for
fn step_74() -> Unit raise {
  safe_for_c.set(@pair.new_definition(@term_syntax.parse_term("(safe_for : (Num, (Num) -> Term) -> Bool)((x : Num), (v : (Num) -> Term)) == (∀ y : Num, IN(x, FVT(v(y))) → y == x)")))
}

///|
let safe_for_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("safe_for")

///|
/// `safe_for`
pub fn safe_for() -> @kernel.Thm {
  safe_for_c.get()
}

///|
/// SAFE_FOR_V
fn step_75() -> Unit raise {
  let t198 = @simp.simp_tac(@list.List([safe_for(), fvt(), @sets.in_sing()]))
  safe_for_v_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, safe_for(x, V)"), t198))
}

///|
let safe_for_v_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SAFE_FOR_V")

///|
/// `SAFE_FOR_V`
pub fn safe_for_v() -> @kernel.Thm {
  safe_for_v_c.get()
}

///|
/// SAFE_FOR_VALMOD
fn step_76() -> Unit raise {
  let t199 = @meson.meson_tac(@list.List([]))
  let t200 = @tactics.then_tac(@simp.rewrite_tac(@list.List([safe_for(), valmod_v1()])), t199)
  safe_for_valmod_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Term, ∀ x : Num, ∀ y : Num, ∀ t : Term, safe_for(x, v) && (IN(x, FVT(t)) → y == x) → safe_for(x, op_bar_minus_gt(y, t, v))"), t200))
}

///|
let safe_for_valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SAFE_FOR_VALMOD")

///|
/// `SAFE_FOR_VALMOD`
pub fn safe_for_valmod() -> @kernel.Thm {
  safe_for_valmod_c.get()
}

///|
/// SAFE_FOR_ASSIGN
fn step_77() -> Unit raise {
  let t201 = @meson.meson_tac(@list.List([fvt(), @sets.in_sing()]))
  let t202 = @tactics.then_tac(@simp.rewrite_tac(@list.List([safe_for(), assign_v1()])), t201)
  safe_for_assign_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ t : Term, safe_for(x, op_bar_eq_gt(y, t)) == (IN(x, FVT(t)) → y == x)"), t202))
}

///|
let safe_for_assign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SAFE_FOR_ASSIGN")

///|
/// `SAFE_FOR_ASSIGN`
pub fn safe_for_assign() -> @kernel.Thm {
  safe_for_assign_c.get()
}

///|
/// FORMSUBST_SAFE_FOR
fn step_78() -> Unit raise {
  let t205 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t204 = @simp.rewrite_tac(@list.List([]))
  let t203 = @tactics.repeat_tac(@tactics.strip_tac)
  let t206 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([safe_for(), formsubst(), @pair.let_def(), @pair.let_end_def(), fv()])), t203), @class.cond_cases_tac), t204), t205)
  formsubst_safe_for_c.set(@tactics.prove(@term_syntax.parse_term("(∀ v : (Num) -> Term, ∀ x : Num, ∀ p : Form, safe_for(x, v) → formsubst(v, op_bang_bang(x, p)) == op_bang_bang(x, formsubst(op_bar_minus_gt(x, V(x), v), p))) && (∀ v : (Num) -> Term, ∀ x : Num, ∀ p : Form, safe_for(x, v) → formsubst(v, op_q_q(x, p)) == op_q_q(x, formsubst(op_bar_minus_gt(x, V(x), v), p)))"), t206))
}

///|
let formsubst_safe_for_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_SAFE_FOR")

///|
/// `FORMSUBST_SAFE_FOR`
pub fn formsubst_safe_for() -> @kernel.Thm {
  formsubst_safe_for_c.get()
}

///|
/// qsubst
fn step_79() -> Unit raise {
  qsubst_c.set(@pair.new_definition(@term_syntax.parse_term("(qsubst : ((Num, Term), Form) -> Form)(((x : Num), (t : Term)), (p : Form)) == op_q_q(x, op_amp_amp(op_eq_eq_eq(V(x), t), p))")))
}

///|
let qsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qsubst")

///|
/// `qsubst`
pub fn qsubst() -> @kernel.Thm {
  qsubst_c.get()
}

///|
/// FV_QSUBST
fn step_80() -> Unit raise {
  let t207 = @sets.set_tac(@list.List([]))
  let t208 = @tactics.then_tac(@simp.rewrite_tac(@list.List([qsubst(), fv(), fvt()])), t207)
  fv_qsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ n : _, ∀ p : Form, FV(qsubst((x, (t : Term)), p)) == DELETE(UNION(FV(p), FVT(t)), x)"), t208))
}

///|
let fv_qsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_QSUBST")

///|
/// `FV_QSUBST`
pub fn fv_qsubst() -> @kernel.Thm {
  fv_qsubst_c.get()
}

///|
/// HOLDS_QSUBST
fn step_81() -> Unit raise {
  let t214 = @simp.asm_rewrite_tac(@list.List([holds(), qsubst(), termval(), valmod_basic(), @theorems.unwind_thm2()]))
  let t213 = @meson.asm_meson_tac(@list.List([termval_valuation()]))
  let t215 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([valmod()])), t213), t214])
  let t212 = @tactics.subgoal_then(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ z : Num, termval(op_bar_minus_gt((x : Num), z, v), (t : Term)) == termval(v, t)"), fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s210 = @tactics.assume_tac(x209)
    fn(x211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s210(x211)
    }
  })
  let t216 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t212), t215)
  holds_qsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : _, ∀ t : Term, ∀ p : Form, ∀ v : (Num) -> Num, !IN((x : Num), FVT(t)) → holds(v, qsubst((x, t), p)) == holds(op_bar_minus_gt(x, termval(v, t), v), p)"), t216))
}

///|
let holds_qsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_QSUBST")

///|
/// `HOLDS_QSUBST`
pub fn holds_qsubst() -> @kernel.Thm {
  holds_qsubst_c.get()
}

///|
/// numeral
fn step_82() -> Unit raise {
  let t217 = @term_syntax.parse_term("(numeral : (Num) -> Term)(0) == Z && (∀ n : Num, numeral(SUC(n)) == Suc(numeral(n)))")
  numeral_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t217))
}

///|
let numeral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("numeral")

///|
/// `numeral`
pub fn numeral() -> @kernel.Thm {
  numeral_c.get()
}

///|
/// TERMVAL_NUMERAL
fn step_83() -> Unit raise {
  let t218 = @simp.asm_rewrite_tac(@list.List([termval(), numeral()]))
  let t219 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t218)
  termval_numeral_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ n : Num, termval(v, numeral(n)) == n"), t219))
}

///|
let termval_numeral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMVAL_NUMERAL")

///|
/// `TERMVAL_NUMERAL`
pub fn termval_numeral() -> @kernel.Thm {
  termval_numeral_c.get()
}

///|
/// FVT_NUMERAL
fn step_84() -> Unit raise {
  let t220 = @tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([fvt(), numeral()])))
  fvt_numeral_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, FVT(numeral(n)) == {}"), t220))
}

///|
let fvt_numeral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FVT_NUMERAL")

///|
/// `FVT_NUMERAL`
pub fn fvt_numeral() -> @kernel.Thm {
  fvt_numeral_c.get()
}

///|
/// closed
fn step_85() -> Unit raise {
  closed_c.set(@pair.new_definition(@term_syntax.parse_term("(closed : (Form) -> Bool)((p : Form)) == (FV(p) == {})")))
}

///|
let closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("closed")

///|
/// `closed`
pub fn closed() -> @kernel.Thm {
  closed_c.get()
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
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
}
