// Translated from upstream Arithmetic/tarski.ml; edit this file directly.

///|
/// Arithmetic/tarski.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// number
fn step_2() -> Unit raise {
  number_c.set(@pair.new_definition(@term_syntax.parse_term("(number : (Num) -> Num)((x : Num)) == 2 * DIV(x, 2) + (1 - MOD(x, 2))")))
}

///|
let number_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("number")

///|
/// `number`
pub fn number() -> @kernel.Thm {
  number_c.get()
}

///|
/// denumber
fn step_3() -> Unit raise {
  denumber_c.set(@pair.new_definition(@term_syntax.parse_term("(denumber : (Num) -> Num) == number")))
}

///|
let denumber_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("denumber")

///|
/// `denumber`
pub fn denumber() -> @kernel.Thm {
  denumber_c.get()
}

///|
/// NUMBER_DENUMBER
fn step_4() -> Unit raise {
  let t2 = @int.arith_rule(@term_syntax.parse_term("(x : Num) < 2 → 1 - (1 - x) == x"))
  let t3 = @int.arith_rule(@term_syntax.parse_term("1 - (m : Num) < 2"))
  let t4 = @equal.gsym(@arith.division())
  let t5 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) < 2 → DIV(2 * (y : Num) + x, 2) == y")), @arith.mod_mult_add(), @arith.mod_lt(), t4, @calc_num.arith_eq(), t3, t2]))
  let t1 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t6 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([number(), denumber()])), t1), t5)
  number_denumber_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : Num, denumber(number(s)) == s) && (∀ n : Num, number(denumber(n)) == n)"), t6))
}

///|
let number_denumber_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMBER_DENUMBER")

///|
/// `NUMBER_DENUMBER`
pub fn number_denumber() -> @kernel.Thm {
  number_denumber_c.get()
}

///|
/// NUMBER_INJ
fn step_5() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([number_denumber()]))
  number_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, (number(x) == number(y)) == (x == y)"), t7))
}

///|
let number_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMBER_INJ")

///|
/// `NUMBER_INJ`
pub fn number_inj() -> @kernel.Thm {
  number_inj_c.get()
}

///|
/// NUMBER_SURJ
fn step_6() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([number_denumber()]))
  number_surj_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∃ x : Num, number(x) == y"), t8))
}

///|
let number_surj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMBER_SURJ")

///|
/// `NUMBER_SURJ`
pub fn number_surj() -> @kernel.Thm {
  number_surj_c.get()
}

///|
/// gterm
fn step_7() -> Unit raise {
  let t9 = @term_syntax.parse_term("(gterm : (Term) -> Num)(V((x : Num))) == NPAIR(0, number(x)) && gterm(Z) == NPAIR(1, 0) && gterm(Suc((t : Term))) == NPAIR(2, gterm(t)) && gterm(op_plus_plus((s : Term), t)) == NPAIR(3, NPAIR(gterm(s), gterm(t))) && gterm(op_star_star(s, t)) == NPAIR(4, NPAIR(gterm(s), gterm(t)))")
  gterm_c.set(@recursion.new_recursive_definition(@fol.term_recursion())(t9))
}

///|
let gterm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gterm")

///|
/// `gterm`
pub fn gterm() -> @kernel.Thm {
  gterm_c.get()
}

///|
/// gform
fn step_8() -> Unit raise {
  let t10 = @term_syntax.parse_term("(gform : (Form) -> Num)(False) == NPAIR(0, 0) && gform(True) == NPAIR(0, 1) && gform(op_eq_eq_eq((s : Term), (t : Term))) == NPAIR(1, NPAIR(gterm(s), gterm(t))) && gform(op_lt_lt(s, t)) == NPAIR(2, NPAIR(gterm(s), gterm(t))) && gform(op_lt_lt_eq(s, t)) == NPAIR(3, NPAIR(gterm(s), gterm(t))) && gform(Not((p : Form))) == NPAIR(4, gform(p)) && gform(op_amp_amp(p, (q : Form))) == NPAIR(5, NPAIR(gform(p), gform(q))) && gform(op_bar_bar(p, q)) == NPAIR(6, NPAIR(gform(p), gform(q))) && gform(op_minus_minus_gt(p, q)) == NPAIR(7, NPAIR(gform(p), gform(q))) && gform(op_lt_minus_gt(p, q)) == NPAIR(8, NPAIR(gform(p), gform(q))) && gform(op_bang_bang((x : Num), p)) == NPAIR(9, NPAIR(number(x), gform(p))) && gform(op_q_q(x, p)) == NPAIR(10, NPAIR(number(x), gform(p)))")
  gform_c.set(@recursion.new_recursive_definition(@fol.form_recursion())(t10))
}

///|
let gform_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gform")

///|
/// `gform`
pub fn gform() -> @kernel.Thm {
  gform_c.get()
}

///|
/// GTERM_INJ
fn step_9() -> Unit raise {
  let t16 = @simp.asm_rewrite_tac(@list.List([@fol.term_distinct(), @fol.term_inj(), gterm(), @definability.npair_inj(), number_inj(), @calc_num.arith_eq()]))
  let t15 = @tactics.match_mp_tac(@fol.term_induct())
  let t12 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac)
  let t13 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac)
  let t14 = @list.List([@tactics.all_tac, @tactics.gen_tac, @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t13, t12])
  let t11 = @tactics.repeat_tac(@tactics.conj_tac)
  let t17 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@fol.term_induct()), t11), t14), t15), t16)
  gterm_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, (gterm(s) == gterm(t)) == (s == t)"), t17))
}

///|
let gterm_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GTERM_INJ")

///|
/// `GTERM_INJ`
pub fn gterm_inj() -> @kernel.Thm {
  gterm_inj_c.get()
}

///|
/// GFORM_INJ
fn step_10() -> Unit raise {
  let t31 = @simp.rewrite_tac(@list.List([gterm_inj(), number_inj()]))
  let t30 = @simp.asm_rewrite_tac(@list.List([@fol.form_distinct(), @fol.form_inj(), gform(), @definability.npair_inj(), @calc_num.arith_eq()]))
  let t29 = @tactics.match_mp_tac(@fol.form_induct())
  let t19 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac)
  let t20 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac)
  let t21 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac)
  let t22 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac)
  let t23 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac)
  let t24 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac)
  let t25 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac)
  let t26 = @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac)
  let t27 = @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac)
  let t28 = @list.List([@tactics.all_tac, @tactics.all_tac, @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t27, t26, t25, t24, t23, t22, t21, t20, t19])
  let t18 = @tactics.repeat_tac(@tactics.conj_tac)
  let t32 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@fol.form_induct()), t18), t28), t29), t30), t31)
  gform_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, (gform(p) == gform(q)) == (p == q)"), t32))
}

///|
let gform_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GFORM_INJ")

///|
/// `GFORM_INJ`
pub fn gform_inj() -> @kernel.Thm {
  gform_inj_c.get()
}

///|
/// GTERM_CASES
fn step_11() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([]))
  let t33 = @simp.asm_rewrite_tac(@list.List([gterm(), @definability.npair_inj(), @calc_num.arith_eq(), number_inj(), @fol.term_distinct(), @fol.term_inj()]))
  let t35 = @tactics.then_tac(@tactics.then_tac(@tactics.struct_cases_tac(@bool.spec(@term_syntax.parse_term("(u : Term)"), @fol.term_cases())), t33), t34)
  gterm_cases_c.set(@tactics.prove(@term_syntax.parse_term("(gterm((u : Term)) == NPAIR(0, number((x : Num)))) == (u == V(x)) && (gterm(u) == NPAIR(1, 0)) == (u == Z) && (gterm(u) == NPAIR(2, (n : Num))) == (∃ t : Term, u == Suc(t) && gterm(t) == n) && (gterm(u) == NPAIR(3, NPAIR((m : Num), n))) == (∃ s : Term, ∃ t : Term, u == op_plus_plus(s, t) && gterm(s) == m && gterm(t) == n) && (gterm(u) == NPAIR(4, NPAIR(m, n))) == (∃ s : Term, ∃ t : Term, u == op_star_star(s, t) && gterm(s) == m && gterm(t) == n)"), t35))
}

///|
let gterm_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GTERM_CASES")

///|
/// `GTERM_CASES`
pub fn gterm_cases() -> @kernel.Thm {
  gterm_cases_c.get()
}

///|
/// GFORM_CASES
fn step_12() -> Unit raise {
  let t37 = @meson.meson_tac(@list.List([]))
  let t36 = @simp.asm_rewrite_tac(@list.List([gform(), @definability.npair_inj(), @calc_num.arith_eq(), number_inj(), @fol.form_distinct(), @fol.form_inj()]))
  let t38 = @tactics.then_tac(@tactics.then_tac(@tactics.struct_cases_tac(@bool.spec(@term_syntax.parse_term("(r : Form)"), @fol.form_cases())), t36), t37)
  gform_cases_c.set(@tactics.prove(@term_syntax.parse_term("(gform((r : Form)) == NPAIR(0, 0)) == (r == False) && (gform(r) == NPAIR(0, 1)) == (r == True) && (gform(r) == NPAIR(1, NPAIR((m : Num), (n : Num)))) == (∃ s : Term, ∃ t : Term, r == op_eq_eq_eq(s, t) && gterm(s) == m && gterm(t) == n) && (gform(r) == NPAIR(2, NPAIR(m, n))) == (∃ s : Term, ∃ t : Term, r == op_lt_lt(s, t) && gterm(s) == m && gterm(t) == n) && (gform(r) == NPAIR(3, NPAIR(m, n))) == (∃ s : Term, ∃ t : Term, r == op_lt_lt_eq(s, t) && gterm(s) == m && gterm(t) == n) && (gform(r) == NPAIR(4, n)) == (∃ p : Form, r == Not(p) && gform(p) == n) && (gform(r) == NPAIR(5, NPAIR(m, n))) == (∃ p : Form, ∃ q : Form, r == op_amp_amp(p, q) && gform(p) == m && gform(q) == n) && (gform(r) == NPAIR(6, NPAIR(m, n))) == (∃ p : Form, ∃ q : Form, r == op_bar_bar(p, q) && gform(p) == m && gform(q) == n) && (gform(r) == NPAIR(7, NPAIR(m, n))) == (∃ p : Form, ∃ q : Form, r == op_minus_minus_gt(p, q) && gform(p) == m && gform(q) == n) && (gform(r) == NPAIR(8, NPAIR(m, n))) == (∃ p : Form, ∃ q : Form, r == op_lt_minus_gt(p, q) && gform(p) == m && gform(q) == n) && (gform(r) == NPAIR(9, NPAIR(number((x : Num)), n))) == (∃ p : Form, r == op_bang_bang(x, p) && gform(p) == n) && (gform(r) == NPAIR(10, NPAIR(number(x), n))) == (∃ p : Form, r == op_q_q(x, p) && gform(p) == n)"), t38))
}

///|
let gform_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GFORM_CASES")

///|
/// `GFORM_CASES`
pub fn gform_cases() -> @kernel.Thm {
  gform_cases_c.get()
}

///|
/// gnumeral
fn step_13() -> Unit raise {
  gnumeral_c.set(@pair.new_definition(@term_syntax.parse_term("(gnumeral : (Num, Num) -> Bool)((m : Num), (n : Num)) == (gterm(numeral(m)) == n)")))
}

///|
let gnumeral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gnumeral")

///|
/// `gnumeral`
pub fn gnumeral() -> @kernel.Thm {
  gnumeral_c.get()
}

///|
/// arith_gnumeral1
fn step_14() -> Unit raise {
  arith_gnumeral1_c.set(@pair.new_definition(@term_syntax.parse_term("(arith_gnumeral1 : (Term, Term) -> Form)((a : Term), (b : Term)) == formsubst(op_bar_minus_gt(3, a, op_bar_minus_gt(4, b, V)), op_q_q(0, op_q_q(1, op_amp_amp(op_eq_eq_eq(V(3), arith_pair(V(0), V(1))), op_eq_eq_eq(V(4), arith_pair(Suc(V(0)), arith_pair(numeral(2), V(1))))))))")))
}

///|
let arith_gnumeral1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_gnumeral1")

///|
/// `arith_gnumeral1`
pub fn arith_gnumeral1() -> @kernel.Thm {
  arith_gnumeral1_c.get()
}

///|
/// ARITH_GNUMERAL1
fn step_15() -> Unit raise {
  let t39 = @simp.rewrite_tac(@list.List([@fol.termval(), @calc_num.arith_eq(), @trivia.o_thm(), @fol.valmod(), @definability.arith_pair_v1(), @fol.termval_numeral()]))
  let t40 = @tactics.then_tac(@simp.rewrite_tac(@list.List([arith_gnumeral1(), @fol.holds(), @fol.holds_formsubst()])), t39)
  arith_gnumeral1_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ a : Term, ∀ b : Term, holds(v, arith_gnumeral1(a, b)) == (∃ x : Num, ∃ y : Num, termval(v, a) == NPAIR(x, y) && termval(v, b) == NPAIR(SUC(x), NPAIR(2, y)))"), t40))
}

///|
let arith_gnumeral1_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_GNUMERAL1")

///|
/// `ARITH_GNUMERAL1`
pub fn arith_gnumeral1_v1() -> @kernel.Thm {
  arith_gnumeral1_v1_c.get()
}

///|
/// FV_GNUMERAL1
fn step_16() -> Unit raise {
  let t41 = @definability.fv_tac(@list.List([@definability.fvt_pair(), @fol.fvt_numeral()]))
  let t42 = @tactics.then_tac(@simp.rewrite_tac(@list.List([arith_gnumeral1()])), t41)
  fv_gnumeral1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, FV(arith_gnumeral1(s, t)) == UNION(FVT(s), FVT(t))"), t42))
}

///|
let fv_gnumeral1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_GNUMERAL1")

///|
/// `FV_GNUMERAL1`
pub fn fv_gnumeral1() -> @kernel.Thm {
  fv_gnumeral1_c.get()
}

///|
/// arith_gnumeral1'
fn step_17() -> Unit raise {
  arith_gnumeral1_p_c.set(@pair.new_definition(@term_syntax.parse_term("(arith_gnumeral1' : (Term, Term) -> Form)((x : Term), (y : Term)) == arith_rtc(arith_gnumeral1, x, y)")))
}

///|
let arith_gnumeral1_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_gnumeral1'")

///|
/// `arith_gnumeral1'`
pub fn arith_gnumeral1_p() -> @kernel.Thm {
  arith_gnumeral1_p_c.get()
}

///|
/// ARITH_GNUMERAL1'
fn step_18() -> Unit raise {
  let t44 = @simp.rewrite_tac(@list.List([arith_gnumeral1_v1()]))
  let t43 = @tactics.match_mp_tac(@definability.arith_rtc_v1())
  let t45 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([arith_gnumeral1_p()])), t43), t44)
  arith_gnumeral1_p_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ s : Term, ∀ t : Term, holds(v, arith_gnumeral1'(s, t)) == RTC((a : Num) => (b : Num) => ∃ x : Num, ∃ y : Num, a == NPAIR(x, y) && b == NPAIR(SUC(x), NPAIR(2, y)), termval(v, s), termval(v, t))"), t45))
}

///|
let arith_gnumeral1_p_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_GNUMERAL1'")

///|
/// `ARITH_GNUMERAL1'`
pub fn arith_gnumeral1_p_v1() -> @kernel.Thm {
  arith_gnumeral1_p_v1_c.get()
}

///|
/// FV_GNUMERAL1'
fn step_19() -> Unit raise {
  let t46 = @simp.simp_tac(@list.List([arith_gnumeral1_p(), @definability.fv_rtc(), fv_gnumeral1()]))
  fv_gnumeral1_p_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, FV(arith_gnumeral1'(s, t)) == UNION(FVT(s), FVT(t))"), t46))
}

///|
let fv_gnumeral1_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_GNUMERAL1'")

///|
/// `FV_GNUMERAL1'`
pub fn fv_gnumeral1_p() -> @kernel.Thm {
  fv_gnumeral1_p_c.get()
}

///|
/// arith_gnumeral
fn step_20() -> Unit raise {
  arith_gnumeral_c.set(@pair.new_definition(@term_syntax.parse_term("(arith_gnumeral : (Term, Term) -> Form)((n : Term), (p : Term)) == formsubst(op_bar_minus_gt(0, n, op_bar_minus_gt(1, p, V)), arith_gnumeral1'(arith_pair(Z, numeral(3)), arith_pair(V(0), V(1))))")))
}

///|
let arith_gnumeral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_gnumeral")

///|
/// `arith_gnumeral`
pub fn arith_gnumeral() -> @kernel.Thm {
  arith_gnumeral_c.get()
}

///|
/// ARITH_GNUMERAL
fn step_21() -> Unit raise {
  let t55 = @simp.simp_tac(@list.List([gnumeral(), @trivia.o_thm()]))
  let t54 = @simp.rewrite_tac(@list.List([@definability.npair(), @calc_num.arith()]))
  let t56 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([gterm(), @fol.numeral(), @trivia.o_thm()])), t54), t55])
  let t50 = @term_syntax.parse_term("(f : (Num, Num) -> Num)")
  let t51 = (@term_syntax.parse_term("(a : Num) => (b : Num) => NPAIR(2, a)"), t50)
  let t49 = @term_syntax.parse_term("(e : Num)")
  let t52 = (@term_syntax.parse_term("3"), t49)
  let t48 = @term_syntax.parse_term("(fn_ : (Num) -> Num)")
  let t53 = @tactics.mp_tac(@kernel.inst_rule(@list.List([(@term_syntax.parse_term("o(gterm, numeral)"), t48), t52, t51]), @definability.primrec_sigma()))
  let t47 = @simp.rewrite_tac(@list.List([@fol.termval(), @calc_num.arith_eq(), @trivia.o_thm(), @fol.valmod()]))
  let t57 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([arith_gnumeral(), @fol.holds(), @fol.holds_formsubst(), arith_gnumeral1_p_v1(), @definability.arith_pair_v1(), @fol.termval_numeral()])), t47), t53), @tactics.ants_tac), t56)
  arith_gnumeral_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ s : Term, ∀ t : Term, holds(v, arith_gnumeral(s, t)) == gnumeral(termval(v, s), termval(v, t))"), t57))
}

///|
let arith_gnumeral_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_GNUMERAL")

///|
/// `ARITH_GNUMERAL`
pub fn arith_gnumeral_v1() -> @kernel.Thm {
  arith_gnumeral_v1_c.get()
}

///|
/// FV_GNUMERAL
fn step_22() -> Unit raise {
  let t58 = @definability.fv_tac(@list.List([fv_gnumeral1_p(), @definability.fvt_pair(), @fol.fvt_numeral()]))
  let t59 = @tactics.then_tac(@simp.rewrite_tac(@list.List([arith_gnumeral()])), t58)
  fv_gnumeral_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, FV(arith_gnumeral(s, t)) == UNION(FVT(s), FVT(t))"), t59))
}

///|
let fv_gnumeral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_GNUMERAL")

///|
/// `FV_GNUMERAL`
pub fn fv_gnumeral() -> @kernel.Thm {
  fv_gnumeral_c.get()
}

///|
/// qdiag
fn step_23() -> Unit raise {
  qdiag_c.set(@pair.new_definition(@term_syntax.parse_term("(qdiag : (Num, Form) -> Form)((x : Num), (q : Form)) == qsubst((x, numeral(gform(q))), q)")))
}

///|
let qdiag_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qdiag")

///|
/// `qdiag`
pub fn qdiag() -> @kernel.Thm {
  qdiag_c.get()
}

///|
/// arith_qdiag
fn step_24() -> Unit raise {
  arith_qdiag_c.set(@pair.new_definition(@term_syntax.parse_term("(arith_qdiag : (Num, Term, Term) -> Form)((x : Num), (s : Term), (t : Term)) == formsubst(op_bar_minus_gt(1, s, op_bar_minus_gt(2, t, V)), op_q_q(3, op_amp_amp(arith_gnumeral(V(1), V(3)), op_eq_eq_eq(arith_pair(numeral(10), arith_pair(numeral(number(x)), arith_pair(numeral(5), arith_pair(arith_pair(numeral(1), arith_pair(arith_pair(numeral(0), numeral(number(x))), V(3))), V(1))))), V(2)))))")))
}

///|
let arith_qdiag_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_qdiag")

///|
/// `arith_qdiag`
pub fn arith_qdiag() -> @kernel.Thm {
  arith_qdiag_c.get()
}

///|
/// QDIAG_FV
fn step_25() -> Unit raise {
  let t60 = @simp.rewrite_tac(@list.List([qdiag(), @fol.fv_qsubst(), @fol.fvt_numeral(), @sets.union_empty()]))
  qdiag_fv_c.set(@tactics.prove(@term_syntax.parse_term("FV(qdiag((x : Num), (q : Form))) == DELETE(FV(q), x)"), t60))
}

///|
let qdiag_fv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QDIAG_FV")

///|
/// `QDIAG_FV`
pub fn qdiag_fv() -> @kernel.Thm {
  qdiag_fv_c.get()
}

///|
/// HOLDS_QDIAG
fn step_26() -> Unit raise {
  let t61 = @simp.simp_tac(@list.List([qdiag(), @fol.holds_qsubst(), @fol.fvt_numeral(), @sets.not_in_empty(), @fol.termval_numeral()]))
  holds_qdiag_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ x : Num, ∀ q : Form, holds(v, qdiag(x, q)) == holds(op_bar_minus_gt(x, gform(q), v), q)"), t61))
}

///|
let holds_qdiag_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_QDIAG")

///|
/// `HOLDS_QDIAG`
pub fn holds_qdiag() -> @kernel.Thm {
  holds_qdiag_c.get()
}

///|
/// ARITH_QDIAG
fn step_27() -> Unit raise {
  let t65 = @meson.meson_tac(@list.List([]))
  let t64 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def(), @fol.valmod(), @calc_num.arith_eq(), @fol.termval()]))
  let t63 = @simp.asm_rewrite_tac(@list.List([@fol.holds_formsubst(), @fol.holds(), @fol.termval(), @fol.termval_numeral(), gnumeral(), arith_gnumeral_v1(), @definability.arith_pair_v1()]))
  let t62 = @simp.rewrite_tac(@list.List([qdiag(), @fol.qsubst(), arith_qdiag(), gform(), gterm()]))
  let t66 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t62), t63), t64), t65)
  arith_qdiag_v1_c.set(@tactics.prove(@term_syntax.parse_term("termval((v : (Num) -> Num), (s : Term)) == gform((p : Form)) → holds(v, arith_qdiag((x : Num), s, (t : Term))) == (termval(v, t) == gform(qdiag(x, p)))"), t66))
}

///|
let arith_qdiag_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_QDIAG")

///|
/// `ARITH_QDIAG`
pub fn arith_qdiag_v1() -> @kernel.Thm {
  arith_qdiag_v1_c.get()
}

///|
/// FV_QDIAG
fn step_28() -> Unit raise {
  let t71 = @simp.rewrite_tac(@list.List([@fol.valmod(), @calc_num.arith_eq(), @theorems.disj_aci()]))
  let t70 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @equal.gsym(@theorems.conj_assoc()), @theorems.unwind_thm2(), @calc_num.arith_eq()]))
  let t69 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))]))
  let t68 = @simp.rewrite_tac(@list.List([@theorems.disj_aci(), @sets.in_delete(), @sets.in_union(), @sets.in_sing()]))
  let t67 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t72 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([arith_qdiag(), @fol.formsubst_fv(), @fol.fv(), fv_gnumeral(), @definability.fvt_pair(), @sets.union_empty(), @fol.fvt_numeral(), @fol.fvt(), @fol.termsubst_fvt()])), t67), t68), t69), t70), t71)
  fv_qdiag_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ s : Term, ∀ t : Term, FV(arith_qdiag(x, s, t)) == UNION(FVT(s), FVT(t))"), t72))
}

///|
let fv_qdiag_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_QDIAG")

///|
/// `FV_QDIAG`
pub fn fv_qdiag() -> @kernel.Thm {
  fv_qdiag_c.get()
}

///|
/// diagonalize
fn step_29() -> Unit raise {
  diagonalize_c.set(@pair.new_definition(@term_syntax.parse_term("(diagonalize : (Num, Form) -> Form)((x : Num), (q : Form)) == LET((y : Num) => LET_END(op_q_q(y, op_amp_amp(arith_qdiag(x, V(x), V(y)), formsubst(op_bar_minus_gt(x, V(y), V), q)))), VARIANT(INSERT(x, FV(q))))")))
}

///|
let diagonalize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("diagonalize")

///|
/// `diagonalize`
pub fn diagonalize() -> @kernel.Thm {
  diagonalize_c.get()
}

///|
/// FV_DIAGONALIZE
fn step_30() -> Unit raise {
  let t83 = @meson.asm_meson_tac(@list.List([]))
  let t82 = @simp.rewrite_tac(@list.List([@fol.valmod(), @class.cond_rand(), @fol.fvt(), @sets.in_sing(), @class.cond_expand()]))
  let t81 = @simp.asm_rewrite_tac(@list.List([]))
  let t80 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Num) == (y : Num)"))
  let t79 = @simp.asm_rewrite_tac(@list.List([]))
  let t78 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Num) == (x : Num)"))
  let t77 = @list.List([@meson.asm_meson_tac(@list.List([@fol.variant_finite(), @sets.finite_insert(), @fol.fv_finite(), @sets.in_insert()])), @tactics.all_tac])
  let t76 = @tactics.subgoal_then(@term_syntax.parse_term("!((y : Num) == (x : Num)) && (∀ z : Num, IN(z, FV((q : Form))) → !(y == z))"), @tactics.strip_assume_tac)
  let t75 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Num)"))
  let t74 = @simp.rewrite_tac(@list.List([@fol.fv(), fv_qdiag(), @fol.formsubst_fv(), @sets.extension(), @sets.in_insert(), @sets.in_delete(), @sets.in_union(), @sets.in_elim_thm(), @fol.fvt(), @sets.not_in_empty()]))
  let t73 = @simp.rewrite_tac(@list.List([diagonalize()]))
  let t84 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t73), @pair.let_tac), t74), t75), t76), t77), t78), t79), t80), t81), t82), t83)
  fv_diagonalize_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ q : Form, FV(diagonalize(x, q)) == INSERT(x, FV(q))"), t84))
}

///|
let fv_diagonalize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_DIAGONALIZE")

///|
/// `FV_DIAGONALIZE`
pub fn fv_diagonalize() -> @kernel.Thm {
  fv_diagonalize_c.get()
}

///|
/// ARITH_DIAGONALIZE
fn step_31() -> Unit raise {
  let t102 = @meson.asm_meson_tac(@list.List([@fol.variant_finite(), @sets.finite_insert(), @fol.fv_finite(), @sets.in_insert()]))
  let t101 = @simp.asm_rewrite_tac(@list.List([]))
  let t100 = @simp.rewrite_tac(@list.List([@fol.termval()]))
  let t99 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @fol.termval(), @fol.valmod()]))
  let t98 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Num)"))
  let t97 = @tactics.match_mp_tac(@fol.holds_valuation())
  let t96 = @simp.rewrite_tac(@list.List([@fol.holds_formsubst(), @fol.termval(), @fol.valmod_basic(), @theorems.unwind_thm2()]))
  let t94 = @meson.asm_meson_tac(@list.List([@fol.variant_finite(), @sets.finite_insert(), @fol.fv_finite(), @sets.in_insert()]))
  let t93 = @tactics.subgoal_then(@term_syntax.parse_term("!((x : Num) == (y : Num))"), fn(x91 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x91
    @simp.asm_rewrite_tac(@list.List([th_1]))
  })
  let t90 = @simp.rewrite_tac(@list.List([@fol.termval(), @fol.valmod()]))
  let t95 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(arith_qdiag_v1())), t90), t93), t94), @tactics.all_tac])
  let t89 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : Num, holds(op_bar_minus_gt((y : Num), a, (v : (Num) -> Num)), arith_qdiag((x : Num), V(x), V(y))) == (termval(op_bar_minus_gt(y, a, v), V(y)) == gform(qdiag(x, (p : Form))))"), fn(x87 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x87
    @simp.rewrite_tac(@list.List([th]))
  })
  let t86 = @simp.rewrite_tac(@list.List([@fol.holds()]))
  let t85 = @simp.rewrite_tac(@list.List([diagonalize()]))
  let t103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t85), @pair.let_tac), t86), t89), t95), t96), t97), t98), @tactics.disch_tac), t99), @class.cond_cases_tac), t100), @class.cond_cases_tac), t101), t102)
  arith_diagonalize_c.set(@tactics.prove(@term_syntax.parse_term("(v : (Num) -> Num)((x : Num)) == gform((p : Form)) → (∀ q : Form, holds(v, diagonalize(x, q)) == holds(op_bar_minus_gt(x, gform(qdiag(x, p)), v), q))"), t103))
}

///|
let arith_diagonalize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_DIAGONALIZE")

///|
/// `ARITH_DIAGONALIZE`
pub fn arith_diagonalize() -> @kernel.Thm {
  arith_diagonalize_c.get()
}

///|
/// fixpoint
fn step_32() -> Unit raise {
  fixpoint_c.set(@pair.new_definition(@term_syntax.parse_term("(fixpoint : (Num, Form) -> Form)((x : Num), (q : Form)) == qdiag(x, diagonalize(x, q))")))
}

///|
let fixpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fixpoint")

///|
/// `fixpoint`
pub fn fixpoint() -> @kernel.Thm {
  fixpoint_c.get()
}

///|
/// FV_FIXPOINT
fn step_33() -> Unit raise {
  let t104 = @sets.set_tac(@list.List([]))
  let t105 = @tactics.then_tac(@simp.rewrite_tac(@list.List([fixpoint(), fv_qdiag(), qdiag_fv(), fv_diagonalize(), @fol.fvt_numeral()])), t104)
  fv_fixpoint_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ p : Form, FV(fixpoint(x, p)) == DELETE(FV(p), x)"), t105))
}

///|
let fv_fixpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_FIXPOINT")

///|
/// `FV_FIXPOINT`
pub fn fv_fixpoint() -> @kernel.Thm {
  fv_fixpoint_c.get()
}

///|
/// HOLDS_FIXPOINT
fn step_34() -> Unit raise {
  let t115 = @simp.rewrite_tac(@list.List([@fol.valmod_valmod_basic()]))
  let t114 = @tactics.disch_then(fn(x112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x112
    @simp.rewrite_tac(@list.List([@drule.match_mp(arith_diagonalize())(th)]))
  })
  let t111 = @list.List([@simp.rewrite_tac(@list.List([@fol.valmod_basic()])), @tactics.all_tac])
  let t110 = @tactics.subgoal_then(@term_syntax.parse_term("op_bar_minus_gt((x : Num), gform(diagonalize(x, (p : Form))), (v : (Num) -> Num), x) == gform(diagonalize(x, p))"), fn(x107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s108 = @tactics.mp_tac(x107)
    fn(x109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s108(x109)
    }
  })
  let t106 = @simp.simp_tac(@list.List([fixpoint(), @fol.holds(), holds_qdiag()]))
  let t116 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t106), t110), t111), t114), t115)
  holds_fixpoint_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ p : Form, ∀ v : (Num) -> Num, holds(v, fixpoint(x, p)) == holds(op_bar_minus_gt(x, gform(fixpoint(x, p)), v), p)"), t116))
}

///|
let holds_fixpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_FIXPOINT")

///|
/// `HOLDS_FIXPOINT`
pub fn holds_fixpoint() -> @kernel.Thm {
  holds_fixpoint_c.get()
}

///|
/// HOLDS_IFF_FIXPOINT
fn step_35() -> Unit raise {
  let t117 = @simp.simp_tac(@list.List([@fol.holds(), holds_fixpoint(), @fol.holds_qsubst(), @fol.fvt_numeral(), @sets.not_in_empty(), @fol.termval_numeral()]))
  holds_iff_fixpoint_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ p : Form, ∀ v : (Num) -> Num, holds(v, op_lt_minus_gt(fixpoint(x, p), qsubst((x, numeral(gform(fixpoint(x, p)))), p)))"), t117))
}

///|
let holds_iff_fixpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_IFF_FIXPOINT")

///|
/// `HOLDS_IFF_FIXPOINT`
pub fn holds_iff_fixpoint() -> @kernel.Thm {
  holds_iff_fixpoint_c.get()
}

///|
/// CARNAP
fn step_36() -> Unit raise {
  let t119 = @simp.rewrite_tac(@list.List([@fol.arithtrue(), holds_iff_fixpoint(), fv_fixpoint()]))
  let t118 = @tactics.exists_tac(@term_syntax.parse_term("fixpoint((x : Num), (q : Form))"))
  let t120 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t118), t119)
  carnap_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ q : Form, ∃ p : Form, FV(p) == DELETE(FV(q), x) && arithtrue(op_lt_minus_gt(p, qsubst((x, numeral(gform(p))), q)))"), t120))
}

///|
let carnap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARNAP")

///|
/// `CARNAP`
pub fn carnap() -> @kernel.Thm {
  carnap_c.get()
}

///|
/// definable_by
fn step_37() -> Unit raise {
  definable_by_c.set(@pair.new_definition(@term_syntax.parse_term("(definable_by : ((Form) -> Bool, (Num) -> Bool) -> Bool)((P : (Form) -> Bool), (s : (Num) -> Bool)) == (∃ p : Form, ∃ x : Num, P(p) && (∀ v : (Num) -> Num, holds(v, p) == IN(v(x), s)))")))
}

///|
let definable_by_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("definable_by")

///|
/// `definable_by`
pub fn definable_by() -> @kernel.Thm {
  definable_by_c.get()
}

///|
/// definable
fn step_38() -> Unit raise {
  definable_c.set(@pair.new_definition(@term_syntax.parse_term("(definable : ((Num) -> Bool) -> Bool)((s : (Num) -> Bool)) == (∃ p : Form, ∃ x : Num, ∀ v : (Num) -> Num, holds(v, p) == IN(v(x), s))")))
}

///|
let definable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("definable")

///|
/// `definable`
pub fn definable() -> @kernel.Thm {
  definable_c.get()
}

///|
/// TARSKI_THEOREM
fn step_39() -> Unit raise {
  let t134 = @meson.meson_tac(@list.List([]))
  let t133 = @simp.rewrite_tac(@list.List([@fol.arithtrue(), gform_inj()]))
  let t132 = @simp.rewrite_tac(@list.List([@fol.valmod_basic(), @fol.termval_numeral()]))
  let t131 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t130 = @simp.simp_tac(@list.List([@fol.arithtrue(), @fol.holds(), @fol.holds_qsubst(), @fol.fvt_numeral(), @sets.not_in_empty()]))
  let t129 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s126 = @tactics.mp_tac(x125)
      fn(x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s126(x127)
      }
    })(@bool.conjunct2(x128))
  }))
  let t123 = @term_syntax.parse_term("Not((p : Form))")
  let t124 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t123]), carnap()))
  let t121 = @term_syntax.parse_term("(x : Num)")
  let t122 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Form)"), t121]))
  let t135 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([definable(), @sets.in_elim_thm(), @class.not_exists_thm()])), t122), @tactics.disch_tac), t124), t129), t130), t131), t132), t133), t134)
  tarski_theorem_c.set(@tactics.prove(@term_syntax.parse_term("!definable({gform((p : Form)) | arithtrue(p)})"), t135))
}

///|
let tarski_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_THEOREM")

///|
/// `TARSKI_THEOREM`
pub fn tarski_theorem() -> @kernel.Thm {
  tarski_theorem_c.get()
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
