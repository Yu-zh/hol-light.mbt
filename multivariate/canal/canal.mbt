// Translated from upstream Multivariate/canal.ml; edit this file directly.

///|
/// Multivariate/canal.ml:14
fn step_1() -> Unit raise {
  @complexes.prioritize_complex(())
}

///|
/// CLOSED_HALFSPACE_RE_GE
fn step_2() -> Unit raise {
  let t5 = @simp.rewrite_tac(@list.List([@complexes.re_cx(), @complexes.im_cx(), @sets.in_elim_thm()]))
  let t3 = @equal.gsym(@complexes.im_def())
  let t4 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t3]))
  let t2 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1 = @term_syntax.parse_term("(b : Real)")
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx(real_of_num(1))"), t1]), @topology.closed_halfspace_ge()))), t2), @tactics.ap_term_tac), t4), t5), @calc_rat.real_arith_tac)
  closed_halfspace_re_ge_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, closed({(z : Cart[Real, 2]) | Re(z) >= b})"), t6))
}

///|
let closed_halfspace_re_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_HALFSPACE_RE_GE")

///|
/// `CLOSED_HALFSPACE_RE_GE`
pub fn closed_halfspace_re_ge() -> @kernel.Thm {
  closed_halfspace_re_ge_c.get()
}

///|
/// CLOSED_HALFSPACE_RE_LE
fn step_3() -> Unit raise {
  let t11 = @simp.rewrite_tac(@list.List([@complexes.re_cx(), @complexes.im_cx(), @sets.in_elim_thm()]))
  let t9 = @equal.gsym(@complexes.im_def())
  let t10 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t9]))
  let t8 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t7 = @term_syntax.parse_term("(b : Real)")
  let t12 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx(real_of_num(1))"), t7]), @topology.closed_halfspace_le()))), t8), @tactics.ap_term_tac), t10), t11), @calc_rat.real_arith_tac)
  closed_halfspace_re_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, closed({(z : Cart[Real, 2]) | Re(z) <= b})"), t12))
}

///|
let closed_halfspace_re_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_HALFSPACE_RE_LE")

///|
/// `CLOSED_HALFSPACE_RE_LE`
pub fn closed_halfspace_re_le() -> @kernel.Thm {
  closed_halfspace_re_le_c.get()
}

///|
/// CLOSED_HALFSPACE_RE_EQ
fn step_4() -> Unit raise {
  let t14 = @simp.simp_tac(@list.List([@topology.closed_inter(), closed_halfspace_re_ge(), closed_halfspace_re_le()]))
  let t13 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))]))
  let t15 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == (y : Real)) == (x >= y && x <= y)"))]))), t13), t14)
  closed_halfspace_re_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, closed({(z : Cart[Real, 2]) | Re(z) == b})"), t15))
}

///|
let closed_halfspace_re_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_HALFSPACE_RE_EQ")

///|
/// `CLOSED_HALFSPACE_RE_EQ`
pub fn closed_halfspace_re_eq() -> @kernel.Thm {
  closed_halfspace_re_eq_c.get()
}

///|
/// OPEN_HALFSPACE_RE_GT
fn step_5() -> Unit raise {
  let t16 = @sets.set_rule(@term_syntax.parse_term("DIFF(UNIV, {(x : _) | !(p : (_) -> Bool)(x)}) == {(x : _) | p(x)}"))
  let t17 = @simp.rewrite_tac(@list.List([@topology.open_closed(), closed_halfspace_re_le(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) > (y : Real)) == !(x <= y)")), t16]))
  open_halfspace_re_gt_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, open({(z : Cart[Real, 2]) | Re(z) > b})"), t17))
}

///|
let open_halfspace_re_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_HALFSPACE_RE_GT")

///|
/// `OPEN_HALFSPACE_RE_GT`
pub fn open_halfspace_re_gt() -> @kernel.Thm {
  open_halfspace_re_gt_c.get()
}

///|
/// OPEN_HALFSPACE_RE_LT
fn step_6() -> Unit raise {
  let t18 = @sets.set_rule(@term_syntax.parse_term("DIFF(UNIV, {(x : _) | !(p : (_) -> Bool)(x)}) == {(x : _) | p(x)}"))
  let t19 = @simp.rewrite_tac(@list.List([@topology.open_closed(), closed_halfspace_re_ge(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) < (y : Real)) == !(x >= y)")), t18]))
  open_halfspace_re_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, open({(z : Cart[Real, 2]) | Re(z) < b})"), t19))
}

///|
let open_halfspace_re_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_HALFSPACE_RE_LT")

///|
/// `OPEN_HALFSPACE_RE_LT`
pub fn open_halfspace_re_lt() -> @kernel.Thm {
  open_halfspace_re_lt_c.get()
}

///|
/// CLOSED_HALFSPACE_IM_GE
fn step_7() -> Unit raise {
  let t24 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t22 = @equal.gsym(@complexes.im_def())
  let t23 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t22]))
  let t21 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t20 = @term_syntax.parse_term("(b : Real)")
  let t25 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("ii"), t20]), @topology.closed_halfspace_ge()))), t21), @tactics.ap_term_tac), t23), t24), @calc_rat.real_arith_tac)
  closed_halfspace_im_ge_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, closed({(z : Cart[Real, 2]) | Im(z) >= b})"), t25))
}

///|
let closed_halfspace_im_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_HALFSPACE_IM_GE")

///|
/// `CLOSED_HALFSPACE_IM_GE`
pub fn closed_halfspace_im_ge() -> @kernel.Thm {
  closed_halfspace_im_ge_c.get()
}

///|
/// CLOSED_HALFSPACE_IM_LE
fn step_8() -> Unit raise {
  let t30 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t28 = @equal.gsym(@complexes.im_def())
  let t29 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t28]))
  let t27 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t26 = @term_syntax.parse_term("(b : Real)")
  let t31 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("ii"), t26]), @topology.closed_halfspace_le()))), t27), @tactics.ap_term_tac), t29), t30), @calc_rat.real_arith_tac)
  closed_halfspace_im_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, closed({(z : Cart[Real, 2]) | Im(z) <= b})"), t31))
}

///|
let closed_halfspace_im_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_HALFSPACE_IM_LE")

///|
/// `CLOSED_HALFSPACE_IM_LE`
pub fn closed_halfspace_im_le() -> @kernel.Thm {
  closed_halfspace_im_le_c.get()
}

///|
/// CLOSED_HALFSPACE_IM_EQ
fn step_9() -> Unit raise {
  let t33 = @simp.simp_tac(@list.List([@topology.closed_inter(), closed_halfspace_im_ge(), closed_halfspace_im_le()]))
  let t32 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))]))
  let t34 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == (y : Real)) == (x >= y && x <= y)"))]))), t32), t33)
  closed_halfspace_im_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, closed({(z : Cart[Real, 2]) | Im(z) == b})"), t34))
}

///|
let closed_halfspace_im_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_HALFSPACE_IM_EQ")

///|
/// `CLOSED_HALFSPACE_IM_EQ`
pub fn closed_halfspace_im_eq() -> @kernel.Thm {
  closed_halfspace_im_eq_c.get()
}

///|
/// OPEN_HALFSPACE_IM_GT
fn step_10() -> Unit raise {
  let t35 = @sets.set_rule(@term_syntax.parse_term("DIFF(UNIV, {(x : _) | !(p : (_) -> Bool)(x)}) == {(x : _) | p(x)}"))
  let t36 = @simp.rewrite_tac(@list.List([@topology.open_closed(), closed_halfspace_im_le(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) > (y : Real)) == !(x <= y)")), t35]))
  open_halfspace_im_gt_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, open({(z : Cart[Real, 2]) | Im(z) > b})"), t36))
}

///|
let open_halfspace_im_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_HALFSPACE_IM_GT")

///|
/// `OPEN_HALFSPACE_IM_GT`
pub fn open_halfspace_im_gt() -> @kernel.Thm {
  open_halfspace_im_gt_c.get()
}

///|
/// OPEN_HALFSPACE_IM_LT
fn step_11() -> Unit raise {
  let t37 = @sets.set_rule(@term_syntax.parse_term("DIFF(UNIV, {(x : _) | !(p : (_) -> Bool)(x)}) == {(x : _) | p(x)}"))
  let t38 = @simp.rewrite_tac(@list.List([@topology.open_closed(), closed_halfspace_im_ge(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) < (y : Real)) == !(x >= y)")), t37]))
  open_halfspace_im_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, open({(z : Cart[Real, 2]) | Im(z) < b})"), t38))
}

///|
let open_halfspace_im_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPEN_HALFSPACE_IM_LT")

///|
/// `OPEN_HALFSPACE_IM_LT`
pub fn open_halfspace_im_lt() -> @kernel.Thm {
  open_halfspace_im_lt_c.get()
}

///|
/// CONVEX_HALFSPACE_RE_GE
fn step_12() -> Unit raise {
  let t43 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t41 = @equal.gsym(@complexes.im_def())
  let t42 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t41]))
  let t40 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t39 = @term_syntax.parse_term("(b : Real)")
  let t44 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx(real_of_num(1))"), t39]), @convex.convex_halfspace_ge()))), t40), @tactics.ap_term_tac), t42), t43), @calc_rat.real_arith_tac)
  convex_halfspace_re_ge_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | Re(z) >= b})"), t44))
}

///|
let convex_halfspace_re_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_RE_GE")

///|
/// `CONVEX_HALFSPACE_RE_GE`
pub fn convex_halfspace_re_ge() -> @kernel.Thm {
  convex_halfspace_re_ge_c.get()
}

///|
/// CONVEX_HALFSPACE_RE_GT
fn step_13() -> Unit raise {
  let t49 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t47 = @equal.gsym(@complexes.im_def())
  let t48 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t47]))
  let t46 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t45 = @term_syntax.parse_term("(b : Real)")
  let t50 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx(real_of_num(1))"), t45]), @convex.convex_halfspace_gt()))), t46), @tactics.ap_term_tac), t48), t49), @calc_rat.real_arith_tac)
  convex_halfspace_re_gt_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | Re(z) > b})"), t50))
}

///|
let convex_halfspace_re_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_RE_GT")

///|
/// `CONVEX_HALFSPACE_RE_GT`
pub fn convex_halfspace_re_gt() -> @kernel.Thm {
  convex_halfspace_re_gt_c.get()
}

///|
/// CONVEX_HALFSPACE_RE_LE
fn step_14() -> Unit raise {
  let t55 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t53 = @equal.gsym(@complexes.im_def())
  let t54 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t53]))
  let t52 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t51 = @term_syntax.parse_term("(b : Real)")
  let t56 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx(real_of_num(1))"), t51]), @convex.convex_halfspace_le()))), t52), @tactics.ap_term_tac), t54), t55), @calc_rat.real_arith_tac)
  convex_halfspace_re_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | Re(z) <= b})"), t56))
}

///|
let convex_halfspace_re_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_RE_LE")

///|
/// `CONVEX_HALFSPACE_RE_LE`
pub fn convex_halfspace_re_le() -> @kernel.Thm {
  convex_halfspace_re_le_c.get()
}

///|
/// CONVEX_HALFSPACE_RE_LT
fn step_15() -> Unit raise {
  let t61 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t59 = @equal.gsym(@complexes.im_def())
  let t60 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t59]))
  let t58 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t57 = @term_syntax.parse_term("(b : Real)")
  let t62 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx(real_of_num(1))"), t57]), @convex.convex_halfspace_lt()))), t58), @tactics.ap_term_tac), t60), t61), @calc_rat.real_arith_tac)
  convex_halfspace_re_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | Re(z) < b})"), t62))
}

///|
let convex_halfspace_re_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_RE_LT")

///|
/// `CONVEX_HALFSPACE_RE_LT`
pub fn convex_halfspace_re_lt() -> @kernel.Thm {
  convex_halfspace_re_lt_c.get()
}

///|
/// CONVEX_HALFSPACE_IM_GE
fn step_16() -> Unit raise {
  let t67 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t65 = @equal.gsym(@complexes.im_def())
  let t66 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t65]))
  let t64 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t63 = @term_syntax.parse_term("(b : Real)")
  let t68 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("ii"), t63]), @convex.convex_halfspace_ge()))), t64), @tactics.ap_term_tac), t66), t67), @calc_rat.real_arith_tac)
  convex_halfspace_im_ge_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | Im(z) >= b})"), t68))
}

///|
let convex_halfspace_im_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_IM_GE")

///|
/// `CONVEX_HALFSPACE_IM_GE`
pub fn convex_halfspace_im_ge() -> @kernel.Thm {
  convex_halfspace_im_ge_c.get()
}

///|
/// CONVEX_HALFSPACE_IM_GT
fn step_17() -> Unit raise {
  let t73 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t71 = @equal.gsym(@complexes.im_def())
  let t72 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t71]))
  let t70 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t69 = @term_syntax.parse_term("(b : Real)")
  let t74 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("ii"), t69]), @convex.convex_halfspace_gt()))), t70), @tactics.ap_term_tac), t72), t73), @calc_rat.real_arith_tac)
  convex_halfspace_im_gt_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | Im(z) > b})"), t74))
}

///|
let convex_halfspace_im_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_IM_GT")

///|
/// `CONVEX_HALFSPACE_IM_GT`
pub fn convex_halfspace_im_gt() -> @kernel.Thm {
  convex_halfspace_im_gt_c.get()
}

///|
/// CONVEX_HALFSPACE_IM_LE
fn step_18() -> Unit raise {
  let t79 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t77 = @equal.gsym(@complexes.im_def())
  let t78 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t77]))
  let t76 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t75 = @term_syntax.parse_term("(b : Real)")
  let t80 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("ii"), t75]), @convex.convex_halfspace_le()))), t76), @tactics.ap_term_tac), t78), t79), @calc_rat.real_arith_tac)
  convex_halfspace_im_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | Im(z) <= b})"), t80))
}

///|
let convex_halfspace_im_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_IM_LE")

///|
/// `CONVEX_HALFSPACE_IM_LE`
pub fn convex_halfspace_im_le() -> @kernel.Thm {
  convex_halfspace_im_le_c.get()
}

///|
/// CONVEX_HALFSPACE_IM_LT
fn step_19() -> Unit raise {
  let t85 = @simp.rewrite_tac(@list.List([@complexes.ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re(), @complexes.im(), @sets.in_elim_thm()]))
  let t83 = @equal.gsym(@complexes.im_def())
  let t84 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @equal.gsym(@complexes.re_def()), t83]))
  let t82 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t81 = @term_syntax.parse_term("(b : Real)")
  let t86 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("ii"), t81]), @convex.convex_halfspace_lt()))), t82), @tactics.ap_term_tac), t84), t85), @calc_rat.real_arith_tac)
  convex_halfspace_im_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | Im(z) < b})"), t86))
}

///|
let convex_halfspace_im_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_IM_LT")

///|
/// `CONVEX_HALFSPACE_IM_LT`
pub fn convex_halfspace_im_lt() -> @kernel.Thm {
  convex_halfspace_im_lt_c.get()
}

///|
/// CONVEX_HALFSPACE_RE_SGN
fn step_20() -> Unit raise {
  let t87 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @convex.convex_halfspace_component_sgn()]))
  convex_halfspace_re_sgn_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | real_sgn(Re(z)) == b})"), t87))
}

///|
let convex_halfspace_re_sgn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_RE_SGN")

///|
/// `CONVEX_HALFSPACE_RE_SGN`
pub fn convex_halfspace_re_sgn() -> @kernel.Thm {
  convex_halfspace_re_sgn_c.get()
}

///|
/// CONVEX_HALFSPACE_IM_SGN
fn step_21() -> Unit raise {
  let t88 = @simp.rewrite_tac(@list.List([@complexes.im_def(), @convex.convex_halfspace_component_sgn()]))
  convex_halfspace_im_sgn_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Real, convex({(z : Cart[Real, 2]) | real_sgn(Im(z)) == b})"), t88))
}

///|
let convex_halfspace_im_sgn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVEX_HALFSPACE_IM_SGN")

///|
/// `CONVEX_HALFSPACE_IM_SGN`
pub fn convex_halfspace_im_sgn() -> @kernel.Thm {
  convex_halfspace_im_sgn_c.get()
}

///|
/// COMPLEX_IN_BALL_0
fn step_22() -> Unit raise {
  let t89 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @topology.in_ball_0()]))
  complex_in_ball_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Real, 2], ∀ r : Real, IN(v, ball((Cx(real_of_num(0)), r))) == (norm(v) < r)"), t89))
}

///|
let complex_in_ball_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_IN_BALL_0")

///|
/// `COMPLEX_IN_BALL_0`
pub fn complex_in_ball_0() -> @kernel.Thm {
  complex_in_ball_0_c.get()
}

///|
/// COMPLEX_IN_CBALL_0
fn step_23() -> Unit raise {
  let t90 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @topology.in_cball_0()]))
  complex_in_cball_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Real, 2], ∀ r : Real, IN(v, cball((Cx(real_of_num(0)), r))) == (norm(v) <= r)"), t90))
}

///|
let complex_in_cball_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_IN_CBALL_0")

///|
/// `COMPLEX_IN_CBALL_0`
pub fn complex_in_cball_0() -> @kernel.Thm {
  complex_in_cball_0_c.get()
}

///|
/// COMPLEX_IN_SPHERE_0
fn step_24() -> Unit raise {
  let t91 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @topology.in_sphere_0()]))
  complex_in_sphere_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Real, 2], ∀ r : Real, IN(v, sphere((Cx(real_of_num(0)), r))) == (norm(v) == r)"), t91))
}

///|
let complex_in_sphere_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_IN_SPHERE_0")

///|
/// `COMPLEX_IN_SPHERE_0`
pub fn complex_in_sphere_0() -> @kernel.Thm {
  complex_in_sphere_0_c.get()
}

///|
/// IN_BALL_RE
fn step_25() -> Unit raise {
  let t94 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t93 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2]) - (x : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t92 = @simp.rewrite_tac(@list.List([@topology.in_ball(), @vectors.dist()]))
  let t95 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t92), t93), t94), @calc_rat.real_arith_tac)
  in_ball_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ e : Real, IN(x, ball((z, e))) → abs(Re(x) - Re(z)) < e"), t95))
}

///|
let in_ball_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_BALL_RE")

///|
/// `IN_BALL_RE`
pub fn in_ball_re() -> @kernel.Thm {
  in_ball_re_c.get()
}

///|
/// IN_BALL_IM
fn step_26() -> Unit raise {
  let t98 = @simp.rewrite_tac(@list.List([@complexes.im_sub()]))
  let t97 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2]) - (x : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t96 = @simp.rewrite_tac(@list.List([@topology.in_ball(), @vectors.dist()]))
  let t99 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t96), t97), t98), @calc_rat.real_arith_tac)
  in_ball_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ e : Real, IN(x, ball((z, e))) → abs(Im(x) - Im(z)) < e"), t99))
}

///|
let in_ball_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_BALL_IM")

///|
/// `IN_BALL_IM`
pub fn in_ball_im() -> @kernel.Thm {
  in_ball_im_c.get()
}

///|
/// IN_CBALL_RE
fn step_27() -> Unit raise {
  let t102 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t101 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2]) - (x : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t100 = @simp.rewrite_tac(@list.List([@topology.in_cball(), @vectors.dist()]))
  let t103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t100), t101), t102), @calc_rat.real_arith_tac)
  in_cball_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ e : Real, IN(x, cball((z, e))) → abs(Re(x) - Re(z)) <= e"), t103))
}

///|
let in_cball_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CBALL_RE")

///|
/// `IN_CBALL_RE`
pub fn in_cball_re() -> @kernel.Thm {
  in_cball_re_c.get()
}

///|
/// IN_CBALL_IM
fn step_28() -> Unit raise {
  let t106 = @simp.rewrite_tac(@list.List([@complexes.im_sub()]))
  let t105 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2]) - (x : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t104 = @simp.rewrite_tac(@list.List([@topology.in_cball(), @vectors.dist()]))
  let t107 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t104), t105), t106), @calc_rat.real_arith_tac)
  in_cball_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ e : Real, IN(x, cball((z, e))) → abs(Im(x) - Im(z)) <= e"), t107))
}

///|
let in_cball_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CBALL_IM")

///|
/// `IN_CBALL_IM`
pub fn in_cball_im() -> @kernel.Thm {
  in_cball_im_c.get()
}

///|
/// CLOSED_REAL_SET
fn step_29() -> Unit raise {
  let t108 = @simp.rewrite_tac(@list.List([closed_halfspace_im_eq(), @complexes.real()]))
  closed_real_set_c.set(@tactics.prove(@term_syntax.parse_term("closed({(z : Cart[Real, 2]) | real(z)})"), t108))
}

///|
let closed_real_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_REAL_SET")

///|
/// `CLOSED_REAL_SET`
pub fn closed_real_set() -> @kernel.Thm {
  closed_real_set_c.get()
}

///|
/// CLOSED_REAL
fn step_30() -> Unit raise {
  let t112 = @simp.rewrite_tac(@list.List([closed_real_set()]))
  let t113 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x109 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s110 = @equal.rand_conv(x109)
    fn(x111 : @kernel.Term) -> @kernel.Thm raise {
      s110(x111)
    }
  }, @list.List([@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == {(x : _) | s(x)}"))])), t112)
  closed_real_c.set(@tactics.prove(@term_syntax.parse_term("closed(real)"), t113))
}

///|
let closed_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLOSED_REAL")

///|
/// `CLOSED_REAL`
pub fn closed_real() -> @kernel.Thm {
  closed_real_c.get()
}

///|
/// UNBOUNDED_REAL
fn step_31() -> Unit raise {
  let t114 = @meson.meson_tac(@list.List([@complexes.complex_norm_cx(), @calc_rat.real_arith(@term_syntax.parse_term("!(abs(abs((B : Real)) + real_of_num(1)) <= B)"))]))
  let t115 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.bounded(), @sets.in_(), @complexes.real_exists(), @theorems.left_imp_exists_thm()])), t114)
  unbounded_real_c.set(@tactics.prove(@term_syntax.parse_term("!bounded(real)"), t115))
}

///|
let unbounded_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNBOUNDED_REAL")

///|
/// `UNBOUNDED_REAL`
pub fn unbounded_real() -> @kernel.Thm {
  unbounded_real_c.get()
}

///|
/// CONNECTED_REAL
fn step_32() -> Unit raise {
  let t116 = @simp.simp_tac(@list.List([@complexes.convex_real(), @convex.convex_connected()]))
  connected_real_c.set(@tactics.prove(@term_syntax.parse_term("connected(real)"), t116))
}

///|
let connected_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONNECTED_REAL")

///|
/// `CONNECTED_REAL`
pub fn connected_real() -> @kernel.Thm {
  connected_real_c.get()
}

///|
/// PATH_CONNECTED_REAL
fn step_33() -> Unit raise {
  let t117 = @simp.simp_tac(@list.List([@complexes.convex_real(), @paths.convex_imp_path_connected()]))
  path_connected_real_c.set(@tactics.prove(@term_syntax.parse_term("path_connected(real)"), t117))
}

///|
let path_connected_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATH_CONNECTED_REAL")

///|
/// `PATH_CONNECTED_REAL`
pub fn path_connected_real() -> @kernel.Thm {
  path_connected_real_c.get()
}

///|
/// TRIVIAL_LIMIT_WITHIN_REAL
fn step_34() -> Unit raise {
  let t124 = @meson.meson_tac(@list.List([unbounded_real(), @topology.bounded_sing()]))
  let t123 = @simp.rewrite_tac(@list.List([connected_real(), closed_real()]))
  let t122 = @tactics.match_mp_tac(@topology.connected_imp_perfect_closed())
  let t121 = @simp.gen_rewrite_tac(fn(x118 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s119 = @equal.rand_conv(x118)
    fn(x120 : @kernel.Term) -> @kernel.Thm raise {
      s119(x120)
    }
  }, @list.List([@equal.gsym(@sets.in_())]))
  let t125 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@topology.trivial_limit_within()]))), @tactics.ap_term_tac), t121), t122), t123), t124)
  trivial_limit_within_real_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], trivial_limit(within(at(z), real)) == !real(z)"), t125))
}

///|
let trivial_limit_within_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIVIAL_LIMIT_WITHIN_REAL")

///|
/// `TRIVIAL_LIMIT_WITHIN_REAL`
pub fn trivial_limit_within_real() -> @kernel.Thm {
  trivial_limit_within_real_c.get()
}

///|
/// UNIFORM_LIM_COMPLEX_MUL
fn step_35() -> Unit raise {
  let t132 = @simp.rewrite_tac(@list.List([@topology.uniform_lim_bilinear()]))
  let t131 = @tactics.disch_then(fn(x130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s127 = @tactics.mp_tac(x126)
      fn(x128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s127(x128)
      }
    })(((x129 : @kernel.Thm) => @bool.conj(@complexes.bilinear_complex_mul(), x129))(x130))
  })
  let t133 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t131), t132)
  uniform_lim_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ P : (B) -> Bool, ∀ f : (B, A) -> Cart[Real, 2], ∀ g : (B, A) -> Cart[Real, 2], ∀ l : (B) -> Cart[Real, 2], ∀ m : (B) -> Cart[Real, 2], ∀ b1 : Real, ∀ b2 : Real, eventually((x : A) => ∀ n : B, P(n) → norm(l(n)) <= b1, net) && eventually((x : A) => ∀ n : B, P(n) → norm(m(n)) <= b2, net) && (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(f(n, x) - l(n)) < e, net)) && (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(g(n, x) - m(n)) < e, net)) → (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(f(n, x) * g(n, x) - l(n) * m(n)) < e, net))"), t133))
}

///|
let uniform_lim_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFORM_LIM_COMPLEX_MUL")

///|
/// `UNIFORM_LIM_COMPLEX_MUL`
pub fn uniform_lim_complex_mul() -> @kernel.Thm {
  uniform_lim_complex_mul_c.get()
}

///|
/// UNIFORM_LIM_COMPLEX_INV
fn step_36() -> Unit raise {
  let t181 = @simp.asm_simp_tac(@list.List([@misc.real_half(), @real.real_pow_lt(), @real.real_lt_mul()]))
  let t182 = @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t181)
  let t180 = @meson.asm_meson_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("(b : Real) <= norm((l : Cart[Real, 2])) && norm((f : Cart[Real, 2]) - l) < b / real_of_num(2) → b / real_of_num(2) <= norm(f)"))]))
  let t179 = @simp.rewrite_tac(@list.List([]))
  let t178 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t177 = @tactics.first_x_assum(fn(x170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x170
    let t176 = @simp.gen_rewrite_tac(fn(x173 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s174 = @equal.land_conv(x173)
      fn(x175 : @kernel.Term) -> @kernel.Thm raise {
        s174(x175)
      }
    }, @list.List([@equal.gsym(@metric.eventually_and())]))
    let t172 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(th), t172), t176)
  })
  let t169 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t166 = @term_syntax.parse_term("(b : Real) / real_of_num(2)")
  let t183 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s164 = @tactics.mp_tac(x163)
      fn(x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s164(x165)
      }
    })(((x167 : @kernel.Thm) => @bool.spec(t166, x167))(x168))
  }), t169), t177), t178), t179), t180), t182])
  let t184 = @tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@metric.eventually_and()])), @tactics.conj_tac), t183)
  let t162 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t161 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t160 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq(), @calc_rat.real_arith(@term_syntax.parse_term("pow((b : Real), 2) / real_of_num(2) == b / real_of_num(2) * b"))]))
  let t157 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realarith.real_lte_trans()))
  let t159 = @tactics.first_x_assum(fn(x158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t157(x158))
  })
  let t156 = @simp.once_rewrite_tac(@list.List([@vectors.norm_sub()]))
  let t155 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_div(), @real.real_lt_ldiv_eq(), @complexes.complex_norm_nz(), @complexes.complex_entire()]))
  let t154 = @simp.asm_simp_tac(@list.List([@complexes.complex_field(@term_syntax.parse_term("!((x : Cart[Real, 2]) == Cx(real_of_num(0))) && !((y : Cart[Real, 2]) == Cx(real_of_num(0))) → inv(x) - inv(y) == (y - x) / (x * y)"))]))
  let t152 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.complex_norm_cx()])))
  let t153 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.disch_then(fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s150 = @tactics.subst_all_tac(x149)
    fn(x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s150(x151)
    }
  })), t152), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t148 = @tactics.subgoal_then(@term_syntax.parse_term("!((f : (B, A) -> Cart[Real, 2])((n : B), (x : A)) == Cx(real_of_num(0))) && !((l : (B) -> Cart[Real, 2])(n) == Cx(real_of_num(0)))"), @tactics.strip_assume_tac)
  let t147 = @tactics.repeat_tac(@tactics.disch_tac)
  let t145 = @simp.asm_rewrite_tac(@list.List([]))
  let t142 = @term_syntax.parse_term("(n : B)")
  let t146 = @tactics.repeat_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x144 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s140 = @tactics.mp_tac(x139)
      fn(x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s140(x141)
      }
    })(((x143 : @kernel.Thm) => @bool.spec(t142, x143))(x144))
  }), t145))
  let t138 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : B)"))
  let t185 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : A)")), @tactics.strip_tac), t138), @tactics.disch_tac), t146), t147), t148), t153), t154), t155), t156), t159), t160), t161), t162), @calc_rat.asm_real_arith_tac), t184])
  let t137 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t136 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) && (r : Bool)) == ((p → q) && (p → r))"))]))
  let t135 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => ∀ n : B, (P : (B) -> Bool)(n) → (b : Real) <= norm((l : (B) -> Cart[Real, 2])(n)) && b / real_of_num(2) <= norm((f : (B, A) -> Cart[Real, 2])(n, x)) && norm(f(n, x) - l(n)) < (e : Real) * (pow(b, 2) / real_of_num(2))"))
  let t134 = @tactics.match_mp_tac(@metric.eventually_mono())
  let t186 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t134), t135), t136), t137), @tactics.conj_tac), t185)
  uniform_lim_complex_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ P : (B) -> Bool, ∀ f : (B, A) -> Cart[Real, 2], ∀ l : (B) -> Cart[Real, 2], ∀ b : Real, (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(f(n, x) - l(n)) < e, net)) && real_of_num(0) < b && eventually((x : A) => ∀ n : B, P(n) → b <= norm(l(n)), net) → (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(inv(f(n, x)) - inv(l(n))) < e, net))"), t186))
}

///|
let uniform_lim_complex_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFORM_LIM_COMPLEX_INV")

///|
/// `UNIFORM_LIM_COMPLEX_INV`
pub fn uniform_lim_complex_inv() -> @kernel.Thm {
  uniform_lim_complex_inv_c.get()
}

///|
/// UNIFORM_LIM_COMPLEX_DIV
fn step_37() -> Unit raise {
  let t212 = @simp.asm_rewrite_tac(@list.List([]))
  let t211 = @tactics.exists_tac(@term_syntax.parse_term("(b2 : Real)"))
  let t213 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(uniform_lim_complex_inv()), t211), t212)
  let t210 = @simp.asm_simp_tac(@list.List([]))
  let t209 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t208 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv()]))
  let t207 = @tactics.repeat_tac(@tactics.strip_tac)
  let t206 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t205 = @simp.rewrite_tac(@list.List([]))
  let t204 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t202 = @tactics.conjuncts_then2(fn(x195 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s196 = @tactics.assume_tac(x195)
    fn(x197 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s196(x197)
    }
  }, fn(x201 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s199 = @tactics.mp_tac(x198)
      fn(x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s199(x200)
      }
    })(@bool.conjunct1(x201))
  })
  let t214 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t202(@bool.conjunct2(x203))
  }), t204), @tactics.gen_tac), t205), t206), t207), t208), t209), t210), t213])
  let t194 = @simp.asm_rewrite_tac(@list.List([]))
  let t192 = @term_syntax.parse_term("inv((b2 : Real))")
  let t193 = @tactics.map_every(fn(x189 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s190 = @tactics.exists_tac(x189)
    fn(x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s190(x191)
    }
  }, @list.List([@term_syntax.parse_term("(b1 : Real)"), t192]))
  let t188 = @tactics.match_mp_tac(uniform_lim_complex_mul())
  let t187 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t215 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t187), t188), t193), t194), @tactics.conj_tac), t214)
  uniform_lim_complex_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ P : (B) -> Bool, ∀ f : (B, A) -> Cart[Real, 2], ∀ g : (B, A) -> Cart[Real, 2], ∀ l : (B) -> Cart[Real, 2], ∀ m : (B) -> Cart[Real, 2], ∀ b1 : Real, ∀ b2 : Real, eventually((x : A) => ∀ n : B, P(n) → norm(l(n)) <= b1, net) && real_of_num(0) < b2 && eventually((x : A) => ∀ n : B, P(n) → b2 <= norm(m(n)), net) && (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(f(n, x) - l(n)) < e, net)) && (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(g(n, x) - m(n)) < e, net)) → (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(f(n, x) / g(n, x) - l(n) / m(n)) < e, net))"), t215))
}

///|
let uniform_lim_complex_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFORM_LIM_COMPLEX_DIV")

///|
/// `UNIFORM_LIM_COMPLEX_DIV`
pub fn uniform_lim_complex_div() -> @kernel.Thm {
  uniform_lim_complex_div_c.get()
}

///|
/// LIM_COMPLEX_MUL
fn step_38() -> Unit raise {
  let t216 = @simp.simp_tac(@list.List([@topology.lim_bilinear(), @complexes.bilinear_complex_mul()]))
  lim_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ g : (A) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ m : Cart[Real, 2], op_minus_minus_gt(f, l, net) && op_minus_minus_gt(g, m, net) → op_minus_minus_gt((x : A) => f(x) * g(x), l * m, net)"), t216))
}

///|
let lim_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_COMPLEX_MUL")

///|
/// `LIM_COMPLEX_MUL`
pub fn lim_complex_mul() -> @kernel.Thm {
  lim_complex_mul_c.get()
}

///|
/// LIM_COMPLEX_INV
fn step_39() -> Unit raise {
  let t223 = @equal.gsym(@topology.tendsto())
  let t224 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.dist()), t223, @complexes.complex_norm_nz()]))
  let t222 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_refl(), @metric.eventually_true()]))
  let t217 = @term_syntax.parse_term("norm((l : Cart[Real, 2]))")
  let t218 = @term_syntax.parse_term("(n : X) => (l : Cart[Real, 2])")
  let t219 = @term_syntax.parse_term("(n : X) => (f : (A) -> Cart[Real, 2])")
  let t220 = @term_syntax.parse_term("(x : X) => true")
  let t221 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t220, t219, t218, t217]), uniform_lim_complex_inv()))
  let t225 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t221), t222), t224)
  lim_complex_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ g : _, ∀ l : Cart[Real, 2], ∀ m : _, op_minus_minus_gt(f, l, net) && !(l == Cx(real_of_num(0))) → op_minus_minus_gt((x : A) => inv(f(x)), inv(l), net)"), t225))
}

///|
let lim_complex_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_COMPLEX_INV")

///|
/// `LIM_COMPLEX_INV`
pub fn lim_complex_inv() -> @kernel.Thm {
  lim_complex_inv_c.get()
}

///|
/// LIM_COMPLEX_DIV
fn step_40() -> Unit raise {
  let t228 = @simp.asm_simp_tac(@list.List([lim_complex_inv()]))
  let t227 = @tactics.match_mp_tac(lim_complex_mul())
  let t226 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t229 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t226), t227), t228)
  lim_complex_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ g : (A) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ m : Cart[Real, 2], op_minus_minus_gt(f, l, net) && op_minus_minus_gt(g, m, net) && !(m == Cx(real_of_num(0))) → op_minus_minus_gt((x : A) => f(x) / g(x), l / m, net)"), t229))
}

///|
let lim_complex_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_COMPLEX_DIV")

///|
/// `LIM_COMPLEX_DIV`
pub fn lim_complex_div() -> @kernel.Thm {
  lim_complex_div_c.get()
}

///|
/// LIM_COMPLEX_POW
fn step_41() -> Unit raise {
  let t231 = @simp.asm_simp_tac(@list.List([lim_complex_mul(), @complexes.complex_pow(), @topology.lim_const()]))
  let t230 = @tactics.repeat_tac(@tactics.gen_tac)
  let t232 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), t230), @tactics.disch_tac), @nums.induct_tac), t231)
  lim_complex_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ n : Num, op_minus_minus_gt(f, l, net) → op_minus_minus_gt((x : A) => pow(f(x), n), pow(l, n), net)"), t232))
}

///|
let lim_complex_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_COMPLEX_POW")

///|
/// `LIM_COMPLEX_POW`
pub fn lim_complex_pow() -> @kernel.Thm {
  lim_complex_pow_c.get()
}

///|
/// LIM_COMPLEX_LMUL
fn step_42() -> Unit raise {
  let t233 = @simp.simp_tac(@list.List([lim_complex_mul(), @topology.lim_const()]))
  lim_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ c : Cart[Real, 2], op_minus_minus_gt(f, l, (net : Net[_])) → op_minus_minus_gt((x : _) => c * f(x), c * l, net)"), t233))
}

///|
let lim_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_COMPLEX_LMUL")

///|
/// `LIM_COMPLEX_LMUL`
pub fn lim_complex_lmul() -> @kernel.Thm {
  lim_complex_lmul_c.get()
}

///|
/// LIM_COMPLEX_RMUL
fn step_43() -> Unit raise {
  let t234 = @simp.simp_tac(@list.List([lim_complex_mul(), @topology.lim_const()]))
  lim_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ c : Cart[Real, 2], op_minus_minus_gt(f, l, (net : Net[_])) → op_minus_minus_gt((x : _) => f(x) * c, l * c, net)"), t234))
}

///|
let lim_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_COMPLEX_RMUL")

///|
/// `LIM_COMPLEX_RMUL`
pub fn lim_complex_rmul() -> @kernel.Thm {
  lim_complex_rmul_c.get()
}

///|
/// LIM_CX_LIFT
fn step_44() -> Unit raise {
  let t235 = @simp.rewrite_tac(@list.List([@topology.tendsto(), @vectors.dist_lift(), @complexes.dist_cx()]))
  lim_cx_lift_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Real, ∀ l : Real, op_minus_minus_gt((x : _) => Cx(f(x)), Cx(l), net) == op_minus_minus_gt((x : _) => lift(f(x)), lift(l), net)"), t235))
}

///|
let lim_cx_lift_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_CX_LIFT")

///|
/// `LIM_CX_LIFT`
pub fn lim_cx_lift() -> @kernel.Thm {
  lim_cx_lift_c.get()
}

///|
/// SERIES_CX_LIFT
fn step_45() -> Unit raise {
  let t236 = @equal.gsym(@vectors.lift_sum())
  let t237 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@trivia.o_def()]))(t236)]))
  let t238 = @tactics.then_tac(@simp.simp_tac(@list.List([@topology.sums(), lim_cx_lift(), @complexes.vsum_cx(), @sets.finite_inter(), @iterate.finite_numseg()])), t237)
  series_cx_lift_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ s : (Num) -> Bool, ∀ x : Real, sums((x : Num) => Cx(f(x)), Cx(x), s) == sums((x : Num) => lift(f(x)), lift(x), s)"), t238))
}

///|
let series_cx_lift_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_CX_LIFT")

///|
/// `SERIES_CX_LIFT`
pub fn series_cx_lift() -> @kernel.Thm {
  series_cx_lift_c.get()
}

///|
/// LIM_INFINITY_POSINFINITY_CX
fn step_46() -> Unit raise {
  let t239 = @meson.meson_tac(@list.List([@complexes.complex_norm_cx(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) >= (b : Real) → abs(x) >= b"))]))
  let t240 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.lim_at_infinity(), @topology.lim_at_posinfinity(), @trivia.o_thm()])), t239)
  lim_infinity_posinfinity_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, N], ∀ l : Cart[Real, N], op_minus_minus_gt(f, l, at_infinity) → op_minus_minus_gt(o(f, Cx), l, at_posinfinity)"), t240))
}

///|
let lim_infinity_posinfinity_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_INFINITY_POSINFINITY_CX")

///|
/// `LIM_INFINITY_POSINFINITY_CX`
pub fn lim_infinity_posinfinity_cx() -> @kernel.Thm {
  lim_infinity_posinfinity_cx_c.get()
}

///|
/// LIM_NULL_COMPLEX
fn step_47() -> Unit raise {
  let t241 = @equal.gsym(@topology.lim_null())
  let t242 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), t241]))
  lim_null_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], op_minus_minus_gt(f, (l : Cart[Real, 2]), net) == op_minus_minus_gt((x : _) => f(x) - l, Cx(real_of_num(0)), net)"), t242))
}

///|
let lim_null_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX")

///|
/// `LIM_NULL_COMPLEX`
pub fn lim_null_complex() -> @kernel.Thm {
  lim_null_complex_c.get()
}

///|
/// LIM_NULL_COMPLEX_NORM
fn step_48() -> Unit raise {
  let t244 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @vectors.real_abs_norm()]))
  let t243 = @simp.once_rewrite_tac(@list.List([@topology.lim_null_norm()]))
  let t245 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())])), t243), t244)
  lim_null_complex_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], op_minus_minus_gt(f, Cx(real_of_num(0)), net) == op_minus_minus_gt((x : _) => Cx(norm(f(x))), Cx(real_of_num(0)), net)"), t245))
}

///|
let lim_null_complex_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_NORM")

///|
/// `LIM_NULL_COMPLEX_NORM`
pub fn lim_null_complex_norm() -> @kernel.Thm {
  lim_null_complex_norm_c.get()
}

///|
/// LIM_NULL_COMPLEX_NEG
fn step_49() -> Unit raise {
  let t252 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_0()]))
  let t249 = @drule.match_mp(@topology.lim_neg())
  let t251 = @tactics.disch_then(fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s247 = @tactics.mp_tac(x246)
      fn(x248 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s247(x248)
      }
    })(t249(x250))
  })
  let t253 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t251), t252)
  lim_null_complex_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], op_minus_minus_gt(f, Cx(real_of_num(0)), net) → op_minus_minus_gt((x : _) => -f(x), Cx(real_of_num(0)), net)"), t253))
}

///|
let lim_null_complex_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_NEG")

///|
/// `LIM_NULL_COMPLEX_NEG`
pub fn lim_null_complex_neg() -> @kernel.Thm {
  lim_null_complex_neg_c.get()
}

///|
/// LIM_NULL_COMPLEX_ADD
fn step_50() -> Unit raise {
  let t260 = @simp.rewrite_tac(@list.List([@complexes.complex_add_lid()]))
  let t257 = @drule.match_mp(@topology.lim_add())
  let t259 = @tactics.disch_then(fn(x258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s255 = @tactics.mp_tac(x254)
      fn(x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s255(x256)
      }
    })(t257(x258))
  })
  let t261 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t259), t260)
  lim_null_complex_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], op_minus_minus_gt(f, Cx(real_of_num(0)), net) && op_minus_minus_gt(g, Cx(real_of_num(0)), net) → op_minus_minus_gt((x : _) => f(x) + g(x), Cx(real_of_num(0)), net)"), t261))
}

///|
let lim_null_complex_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_ADD")

///|
/// `LIM_NULL_COMPLEX_ADD`
pub fn lim_null_complex_add() -> @kernel.Thm {
  lim_null_complex_add_c.get()
}

///|
/// LIM_NULL_COMPLEX_SUB
fn step_51() -> Unit raise {
  let t268 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_refl()]))
  let t265 = @drule.match_mp(@topology.lim_sub())
  let t267 = @tactics.disch_then(fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s263 = @tactics.mp_tac(x262)
      fn(x264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s263(x264)
      }
    })(t265(x266))
  })
  let t269 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t267), t268)
  lim_null_complex_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], op_minus_minus_gt(f, Cx(real_of_num(0)), net) && op_minus_minus_gt(g, Cx(real_of_num(0)), net) → op_minus_minus_gt((x : _) => f(x) - g(x), Cx(real_of_num(0)), net)"), t269))
}

///|
let lim_null_complex_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_SUB")

///|
/// `LIM_NULL_COMPLEX_SUB`
pub fn lim_null_complex_sub() -> @kernel.Thm {
  lim_null_complex_sub_c.get()
}

///|
/// LIM_NULL_COMPLEX_MUL
fn step_52() -> Unit raise {
  let t276 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero()]))
  let t273 = @drule.match_mp(lim_complex_mul())
  let t275 = @tactics.disch_then(fn(x274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s271 = @tactics.mp_tac(x270)
      fn(x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s271(x272)
      }
    })(t273(x274))
  })
  let t277 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t275), t276)
  lim_null_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], op_minus_minus_gt(f, Cx(real_of_num(0)), net) && op_minus_minus_gt(g, Cx(real_of_num(0)), net) → op_minus_minus_gt((x : _) => f(x) * g(x), Cx(real_of_num(0)), net)"), t277))
}

///|
let lim_null_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_MUL")

///|
/// `LIM_NULL_COMPLEX_MUL`
pub fn lim_null_complex_mul() -> @kernel.Thm {
  lim_null_complex_mul_c.get()
}

///|
/// LIM_NULL_COMPLEX_LMUL
fn step_53() -> Unit raise {
  let t279 = @simp.asm_simp_tac(@list.List([lim_complex_lmul()]))
  let t278 = @tactics.subst1_tac(@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(0)) == (c : Cart[Real, 2]) * Cx(real_of_num(0))")))
  let t280 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t278), t279)
  lim_null_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ c : Cart[Real, 2], op_minus_minus_gt(f, Cx(real_of_num(0)), net) → op_minus_minus_gt((x : _) => c * f(x), Cx(real_of_num(0)), net)"), t280))
}

///|
let lim_null_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_LMUL")

///|
/// `LIM_NULL_COMPLEX_LMUL`
pub fn lim_null_complex_lmul() -> @kernel.Thm {
  lim_null_complex_lmul_c.get()
}

///|
/// LIM_NULL_COMPLEX_RMUL
fn step_54() -> Unit raise {
  let t282 = @simp.asm_simp_tac(@list.List([lim_complex_rmul()]))
  let t281 = @tactics.subst1_tac(@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(0)) == Cx(real_of_num(0)) * (c : Cart[Real, 2])")))
  let t283 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t281), t282)
  lim_null_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ c : Cart[Real, 2], op_minus_minus_gt(f, Cx(real_of_num(0)), net) → op_minus_minus_gt((x : _) => f(x) * c, Cx(real_of_num(0)), net)"), t283))
}

///|
let lim_null_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_RMUL")

///|
/// `LIM_NULL_COMPLEX_RMUL`
pub fn lim_null_complex_rmul() -> @kernel.Thm {
  lim_null_complex_rmul_c.get()
}

///|
/// LIM_NULL_COMPLEX_POW
fn step_55() -> Unit raise {
  let t293 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_pow_zero()]))
  let t290 = @drule.match_mp(lim_complex_pow())
  let t287 = @term_syntax.parse_term("(n : Num)")
  let t292 = @tactics.first_x_assum(fn(x291 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s285 = @tactics.mp_tac(x284)
        fn(x286 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s285(x286)
        }
      })(((x288 : @kernel.Thm) => @bool.spec(t287, x288))(x289))
    })(t290(x291))
  })
  let t294 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t292), t293)
  lim_null_complex_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ n : Num, op_minus_minus_gt(f, Cx(real_of_num(0)), net) && !(n == 0) → op_minus_minus_gt((x : _) => pow(f(x), n), Cx(real_of_num(0)), net)"), t294))
}

///|
let lim_null_complex_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_POW")

///|
/// `LIM_NULL_COMPLEX_POW`
pub fn lim_null_complex_pow() -> @kernel.Thm {
  lim_null_complex_pow_c.get()
}

///|
/// SUMS_COMPLEX_0
fn step_56() -> Unit raise {
  let t295 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @topology.sums_0()]))
  sums_complex_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ s : (Num) -> Bool, (∀ n : Num, IN(n, s) → f(n) == Cx(real_of_num(0))) → sums(f, Cx(real_of_num(0)), s)"), t295))
}

///|
let sums_complex_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMS_COMPLEX_0")

///|
/// `SUMS_COMPLEX_0`
pub fn sums_complex_0() -> @kernel.Thm {
  sums_complex_0_c.get()
}

///|
/// LIM_NULL_COMPLEX_RMUL_BOUNDED
fn step_57() -> Unit raise {
  let t301 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def(), @vectors.norm_lift(), @vectors.real_abs_norm(), @vectors.norm_eq_0()]))
  let t300 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real)"))
  let t299 = @tactics.match_mp_tac(@topology.lim_null_vmul_bounded())
  let t298 = @tactics.repeat_tac(@tactics.strip_tac)
  let t297 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul(), @complexes.complex_norm_mul()]))
  let t296 = @simp.once_rewrite_tac(@list.List([@topology.lim_null_norm()]))
  let t302 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())])), t296), t297), t298), t299), t300), t301)
  lim_null_complex_rmul_bounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], ∀ B : Real, op_minus_minus_gt(f, Cx(real_of_num(0)), net) && eventually((a : _) => f(a) == Cx(real_of_num(0)) || norm(g(a)) <= B, net) → op_minus_minus_gt((z : _) => f(z) * g(z), Cx(real_of_num(0)), net)"), t302))
}

///|
let lim_null_complex_rmul_bounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_RMUL_BOUNDED")

///|
/// `LIM_NULL_COMPLEX_RMUL_BOUNDED`
pub fn lim_null_complex_rmul_bounded() -> @kernel.Thm {
  lim_null_complex_rmul_bounded_c.get()
}

///|
/// LIM_NULL_COMPLEX_LMUL_BOUNDED
fn step_58() -> Unit raise {
  let t305 = @meson.asm_meson_tac(@list.List([]))
  let t304 = @tactics.match_mp_tac(lim_null_complex_rmul_bounded())
  let t303 = @tactics.repeat_tac(@tactics.strip_tac)
  let t306 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.disj_sym(), @complexes.complex_mul_sym()])), t303), t304), t305)
  lim_null_complex_lmul_bounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], ∀ B : Real, eventually((a : _) => norm(f(a)) <= B || g(a) == Cx(real_of_num(0)), net) && op_minus_minus_gt(g, Cx(real_of_num(0)), net) → op_minus_minus_gt((z : _) => f(z) * g(z), Cx(real_of_num(0)), net)"), t306))
}

///|
let lim_null_complex_lmul_bounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPLEX_LMUL_BOUNDED")

///|
/// `LIM_NULL_COMPLEX_LMUL_BOUNDED`
pub fn lim_null_complex_lmul_bounded() -> @kernel.Thm {
  lim_null_complex_lmul_bounded_c.get()
}

///|
/// LIM_RE_UBOUND
fn step_59() -> Unit raise {
  let t313 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t308 = @term_syntax.parse_term("1")
  let t309 = @term_syntax.parse_term("(b : Real)")
  let t310 = @term_syntax.parse_term("(l : Cart[Real, 2])")
  let t311 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 2])")
  let t312 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t311, t310, t309, t308]), @topology.lim_component_ubound()))
  let t307 = @tactics.repeat_tac(@tactics.strip_tac)
  let t314 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re_def()])), t307), t312), t313)
  lim_re_ubound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => Re(f(x)) <= b, net) → Re(l) <= b"), t314))
}

///|
let lim_re_ubound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_RE_UBOUND")

///|
/// `LIM_RE_UBOUND`
pub fn lim_re_ubound() -> @kernel.Thm {
  lim_re_ubound_c.get()
}

///|
/// LIM_RE_LBOUND
fn step_60() -> Unit raise {
  let t321 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t316 = @term_syntax.parse_term("1")
  let t317 = @term_syntax.parse_term("(b : Real)")
  let t318 = @term_syntax.parse_term("(l : Cart[Real, 2])")
  let t319 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 2])")
  let t320 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t319, t318, t317, t316]), @topology.lim_component_lbound()))
  let t315 = @tactics.repeat_tac(@tactics.strip_tac)
  let t322 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re_def()])), t315), t320), t321)
  lim_re_lbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => b <= Re(f(x)), net) → b <= Re(l)"), t322))
}

///|
let lim_re_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_RE_LBOUND")

///|
/// `LIM_RE_LBOUND`
pub fn lim_re_lbound() -> @kernel.Thm {
  lim_re_lbound_c.get()
}

///|
/// LIM_IM_UBOUND
fn step_61() -> Unit raise {
  let t329 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t324 = @term_syntax.parse_term("2")
  let t325 = @term_syntax.parse_term("(b : Real)")
  let t326 = @term_syntax.parse_term("(l : Cart[Real, 2])")
  let t327 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 2])")
  let t328 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t327, t326, t325, t324]), @topology.lim_component_ubound()))
  let t323 = @tactics.repeat_tac(@tactics.strip_tac)
  let t330 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.im_def()])), t323), t328), t329)
  lim_im_ubound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => Im(f(x)) <= b, net) → Im(l) <= b"), t330))
}

///|
let lim_im_ubound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_IM_UBOUND")

///|
/// `LIM_IM_UBOUND`
pub fn lim_im_ubound() -> @kernel.Thm {
  lim_im_ubound_c.get()
}

///|
/// LIM_IM_LBOUND
fn step_62() -> Unit raise {
  let t337 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t332 = @term_syntax.parse_term("2")
  let t333 = @term_syntax.parse_term("(b : Real)")
  let t334 = @term_syntax.parse_term("(l : Cart[Real, 2])")
  let t335 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 2])")
  let t336 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t335, t334, t333, t332]), @topology.lim_component_lbound()))
  let t331 = @tactics.repeat_tac(@tactics.strip_tac)
  let t338 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.im_def()])), t331), t336), t337)
  lim_im_lbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => b <= Im(f(x)), net) → b <= Im(l)"), t338))
}

///|
let lim_im_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_IM_LBOUND")

///|
/// `LIM_IM_LBOUND`
pub fn lim_im_lbound() -> @kernel.Thm {
  lim_im_lbound_c.get()
}

///|
/// LIM_COMPLEX_INV_NONDEGENERATE
fn step_63() -> Unit raise {
  let t524 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.complex_norm_0()])))
  let t523 = @tactics.disch_then(fn(x522 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x519 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s520 = @tactics.subst_all_tac(x519)
      fn(x521 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s520(x521)
      }
    })(@bool.conjunct2(x522))
  })
  let t518 = @simp.asm_rewrite_tac(@list.List([]))
  let t517 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t516 = @simp.once_rewrite_tac(@list.List([@vectors.norm_sub()]))
  let t515 = @simp.asm_rewrite_tac(@list.List([]))
  let t511 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t514 = @tactics.first_x_assum(fn(x513 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s509 = @tactics.mp_tac(x508)
      fn(x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s509(x510)
      }
    })(((x512 : @kernel.Thm) => @bool.spec(t511, x512))(x513))
  })
  let t507 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Cart[Real, N])"))(fn(x506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x506))
  }))
  let t525 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_image(), @trivia.o_thm(), @vectors.lift_eq(), @topology.in_ball(), @sets.in_delete(), @vectors.dist()])), t507), t514), t515), t516), t517), t518), t523), t524), @calc_rat.asm_real_arith_tac)
  let t505 = @meson.asm_meson_tac(@list.List([@vectors.norm_sub()]))
  let t526 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) >= real_of_num(1) → real_of_num(1) / real_of_num(2) <= x"))), t505), t525])
  let t504 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t503 = @simp.asm_rewrite_tac(@list.List([@vectors.lift_drop(), @class.not_imp()]))
  let t499 = @term_syntax.parse_term("lift(real_of_num(1) / real_of_num(2))")
  let t502 = @tactics.disch_then(fn(x501 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s497 = @tactics.mp_tac(x496)
      fn(x498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s497(x498)
      }
    })(((x500 : @kernel.Thm) => @bool.spec(t499, x500))(x501))
  })
  let t495 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm(), @vectors.lift_drop(), @complexes.complex_norm_0()]))
  let t491 = @term_syntax.parse_term("(z : Cart[Real, N])")
  let t494 = @tactics.disch_then(fn(x493 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x488 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s489 = @tactics.mp_tac(x488)
      fn(x490 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s489(x490)
      }
    })(((x492 : @kernel.Thm) => @bool.spec(t491, x492))(x493))
  })
  let t487 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.norm_sub()])), @tactics.all_tac])
  let t483 = @term_syntax.parse_term("(w : Cart[Real, N])")
  let t486 = @tactics.disch_then(fn(x485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x480 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s481 = @tactics.mp_tac(x480)
      fn(x482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s481(x482)
      }
    })(((x484 : @kernel.Thm) => @bool.spec(t483, x484))(x485))
  })
  let t479 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @sets.in_delete(), @topology.in_ball(), @vectors.dist()]))
  let t478 = @simp.rewrite_tac(@list.List([@topology.is_interval_1(), @theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t476 = @simp.rewrite_tac(@list.List([@equal.gsym(@convex.is_interval_connected_1())]))
  let t475 = @meson.asm_meson_tac(@list.List([@vectors.norm_sub()]))
  let t474 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_delete(), @topology.in_ball(), @vectors.dist()]))
  let t471 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.continuous_on_subset()))
  let t473 = @tactics.first_x_assum(fn(x472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t471(x472))
  })
  let t470 = @tactics.match_mp_tac(@topology.continuous_on_lift_norm_compose())
  let t469 = @simp.asm_simp_tac(@list.List([@paths.connected_punctured_ball(), @trivia.o_def()]))
  let t477 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.connected_continuous_image()), t469), t470), t473), t474), t475), t476])
  let t468 = @tactics.subgoal_then(@term_syntax.parse_term("connected(IMAGE(o(lift, o(norm, (f : (Cart[Real, N]) -> Cart[Real, 2]))), DELETE(ball(((a : Cart[Real, N]), (e : Real))), a)))"), fn(x465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s466 = @tactics.mp_tac(x465)
    fn(x467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s466(x467)
    }
  })
  let t464 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w : Cart[Real, N])"))(@tactics.strip_assume_tac))
  let t463 = @simp.asm_rewrite_tac(@list.List([]))
  let t459 = @term_syntax.parse_term("(e : Real)")
  let t462 = @tactics.first_x_assum(fn(x461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x456 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s457 = @tactics.mp_tac(x456)
      fn(x458 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s457(x458)
      }
    })(((x460 : @kernel.Thm) => @bool.spec(t459, x460))(x461))
  })
  let t455 = @simp.asm_rewrite_tac(@list.List([]))
  let t454 = @class.asm_cases_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, 2])((z : Cart[Real, N])) == Cx(real_of_num(0))"))
  let t453 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, N])"))
  let t452 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.norm_sub()])), @tactics.disj1_tac])
  let t451 = @simp.asm_rewrite_tac(@list.List([@topology.open_ball(), @sets.subset(), @sets.in_delete(), @topology.in_ball(), @vectors.dist()]))
  let t450 = @tactics.exists_tac(@term_syntax.parse_term("ball(((a : Cart[Real, N]), (e : Real)))"))
  let t448 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_lt(), @complexes.complex_inv_eq_0(), @complexes.complex_vec_0()]))
  let t447 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_norm_inv()), @realarith.real_lt_imp_le()]))
  let t446 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t445 = @simp.gen_rewrite_tac(fn(x442 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s443 = @equal.rand_conv(x442)
    fn(x444 : @kernel.Term) -> @kernel.Thm raise {
      s443(x444)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t441 = @simp.rewrite_tac(@list.List([@realax.real_ge()]))
  let t440 = @tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) == inv(real_of_num(1))")))
  let t439 = @tactics.repeat_tac(@tactics.disch_tac)
  let t438 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t434 = @term_syntax.parse_term("(z : Cart[Real, N])")
  let t437 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x436 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x431 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s432 = @tactics.mp_tac(x431)
      fn(x433 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s432(x433)
      }
    })(((x435 : @kernel.Thm) => @bool.spec(t434, x435))(x436))
  }))
  let t430 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool)) == (!p → q)"))]))
  let t429 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, N])"))
  let t428 = @simp.asm_simp_tac(@list.List([@real.real_lt_min()]))
  let t427 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), (e : Real))"))
  let t426 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e : Real)"))(@tactics.strip_assume_tac))
  let t425 = @simp.asm_rewrite_tac(@list.List([@vectors.dist()]))
  let t421 = @term_syntax.parse_term("(a : Cart[Real, N])")
  let t424 = @tactics.disch_then(fn(x423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s419 = @tactics.mp_tac(x418)
      fn(x420 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s419(x420)
      }
    })(((x422 : @kernel.Thm) => @bool.spec(t421, x422))(x423))
  })
  let t415 = @simp.gen_rewrite_rule(fn(x414 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x414
  }, @list.List([@topology.open_def()]))
  let t417 = @tactics.first_x_assum(fn(x416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s412 = @tactics.mp_tac(x411)
      fn(x413 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s412(x413)
      }
    })(t415(x416))
  })
  let t410 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t409 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @vectors.vector_sub_eq(), @vectors.dist(), @complexes.complex_sub_rzero()]))
  let t408 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t404 = @term_syntax.parse_term("real_of_num(1)")
  let t407 = @tactics.disch_then(fn(x406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x401 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s402 = @tactics.mp_tac(x401)
      fn(x403 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s402(x403)
      }
    })(((x405 : @kernel.Thm) => @bool.spec(t404, x405))(x406))
  })
  let t399 = @simp.gen_rewrite_rule(fn(x398 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x398
  }, @list.List([@topology.lim_at()]))
  let t449 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s396 = @tactics.mp_tac(x395)
      fn(x397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s396(x397)
      }
    })(t399(x400))
  }), t407), t408), t409), t410), t417), t424), t425), t426), t427), t428), t429), @tactics.disch_tac), t430), @tactics.strip_tac), t437), t438), t439), t440), t441), t445), t446), t447), t448), @tactics.all_tac])
  let t394 = @tactics.subgoal_then(@term_syntax.parse_term("∃ e : Real, real_of_num(0) < e && (∀ z : Cart[Real, N], norm(z - (a : Cart[Real, N])) < e && !(z == a) → IN(z, (s : (Cart[Real, N]) -> Bool)) && ((f : (Cart[Real, N]) -> Cart[Real, 2])(z) == Cx(real_of_num(0)) || norm(f(z)) >= real_of_num(1)))"), @tactics.strip_assume_tac)
  let t392 = @simp.rewrite_tac(@list.List([]))
  let t391 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_lzero(), @vectors.norm_neg(), @realarith.real_lt_refl()]))
  let t390 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_lt(), @trivia.o_thm(), @vectors.vector_sub_eq(), @complexes.complex_inv_0()]))
  let t386 = @term_syntax.parse_term("(z : Cart[Real, N])")
  let t389 = @tactics.first_x_assum(fn(x388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s384 = @tactics.mp_tac(x383)
      fn(x385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s384(x385)
      }
    })(((x387 : @kernel.Thm) => @bool.spec(t386, x387))(x388))
  })
  let t382 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Cart[Real, N])"))(@tactics.strip_assume_tac))
  let t381 = @simp.asm_rewrite_tac(@list.List([]))
  let t377 = @term_syntax.parse_term("(d : Real)")
  let t380 = @tactics.first_x_assum(fn(x379 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s375 = @tactics.mp_tac(x374)
      fn(x376 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s375(x376)
      }
    })(((x378 : @kernel.Thm) => @bool.spec(t377, x378))(x379))
  })
  let t373 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t372 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_nz(), @vectors.dist()]))
  let t368 = @term_syntax.parse_term("norm((l : Cart[Real, 2]))")
  let t371 = @tactics.disch_then(fn(x370 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s366 = @tactics.mp_tac(x365)
      fn(x367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s366(x367)
      }
    })(((x369 : @kernel.Thm) => @bool.spec(t368, x369))(x370))
  })
  let t364 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t362 = @simp.gen_rewrite_rule(fn(x361 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x361
  }, @list.List([@topology.lim_at()]))
  let t393 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x363 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s359 = @tactics.mp_tac(x358)
      fn(x360 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s359(x360)
      }
    })(t362(x363))
  }), t364), @tactics.disch_tac), t371), t372), t373), t380), t381), t382), t389), t390), t391), t392])
  let t357 = @tactics.subgoal_then(@term_syntax.parse_term("(l : Cart[Real, 2]) == Cx(real_of_num(0))"), fn(x354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s355 = @tactics.subst_all_tac(x354)
    fn(x356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s355(x356)
    }
  })
  let t352 = @meson.asm_meson_tac(@list.List([@vectors.norm_sub()]))
  let t351 = @simp.rewrite_tac(@list.List([@sets.in_delete(), @sets.in_inter(), @topology.in_ball(), @vectors.dist()]))
  let t350 = @simp.asm_simp_tac(@list.List([@sets.inter_subset(), @topology.open_inter(), @topology.open_ball()]))
  let t349 = @tactics.exists_tac(@term_syntax.parse_term("INTER((s : (Cart[Real, N]) -> Bool), ball(((a : Cart[Real, N]), (e : Real))))"))
  let t348 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t347 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool)) == (a → !b)"))]))
  let t346 = @simp.rewrite_tac(@list.List([@class.not_imp(), @class.not_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t344 = @simp.gen_rewrite_rule(fn(x343 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x343
  }, @list.List([@class.not_forall_thm()]))
  let t353 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x345 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s341 = @tactics.mp_tac(x340)
      fn(x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s341(x342)
      }
    })(t344(x345))
  }), t346), t347), t348), @tactics.strip_tac), t349), t350), @tactics.disj2_tac), t351), t352)])
  let t339 = @class.asm_cases_tac(@term_syntax.parse_term("∀ e : Real, real_of_num(0) < e → (∃ z : Cart[Real, N], norm(z - (a : Cart[Real, N])) < e && !(z == a) && (f : (Cart[Real, N]) -> Cart[Real, 2])(z) == Cx(real_of_num(0)))"))
  let t527 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t339), t353), t357), t393), t394), t449), t450), t451), @tactics.conj_tac), t452), t453), @tactics.strip_tac), t454), t455), t462), t463), t464), t468), t477), t478), t479), t486), @tactics.ants_tac), t487), t494), t495), t502), t503), t504), @tactics.conj_tac), t526)
  lim_complex_inv_nondegenerate_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, ∀ a : Cart[Real, N], ∀ l : Cart[Real, 2], 2 <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(a, s) && (open : ((Cart[Real, N]) -> Bool) -> Bool)(s) && (continuous_on : ((Cart[Real, N]) -> Cart[Real, 2], (Cart[Real, N]) -> Bool) -> Bool)(f, (DELETE : ((Cart[Real, N]) -> Bool, Cart[Real, N], Cart[Real, N]) -> Bool)(s, a)) && (op_minus_minus_gt : ((Cart[Real, N]) -> Cart[Real, 2], Cart[Real, 2], Net[Cart[Real, N]]) -> Bool)((o : ((Cart[Real, 2]) -> Cart[Real, 2], (Cart[Real, N]) -> Cart[Real, 2], Cart[Real, N]) -> Cart[Real, 2])(inv, f), l, (at : (Cart[Real, N]) -> Net[Cart[Real, N]])(a)) → (∃ t : (Cart[Real, N]) -> Bool, (open : ((Cart[Real, N]) -> Bool) -> Bool)(t) && (SUBSET : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(t, s) && ((∀ x : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (DELETE : ((Cart[Real, N]) -> Bool, Cart[Real, N], Cart[Real, N]) -> Bool)(t, a)) → f(x) == Cx(real_of_num(0))) && l == Cx(real_of_num(0)) || (∀ x : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (DELETE : ((Cart[Real, N]) -> Bool, Cart[Real, N], Cart[Real, N]) -> Bool)(t, a)) → !(f(x) == Cx(real_of_num(0))))))"), t527))
}

///|
let lim_complex_inv_nondegenerate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_COMPLEX_INV_NONDEGENERATE")

///|
/// `LIM_COMPLEX_INV_NONDEGENERATE`
pub fn lim_complex_inv_nondegenerate() -> @kernel.Thm {
  lim_complex_inv_nondegenerate_c.get()
}

///|
/// SERIES_COMPLEX_LMUL
fn step_64() -> Unit raise {
  let t534 = @simp.rewrite_tac(@list.List([@complexes.linear_complex_mul()]))
  let t533 = @simp.gen_rewrite_tac(fn(x530 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s531 = @equal.rand_conv(x530)
    fn(x532 : @kernel.Term) -> @kernel.Thm raise {
      s531(x532)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t529 = @simp.asm_rewrite_tac(@list.List([]))
  let t528 = @tactics.match_mp_tac(@topology.series_linear())
  let t535 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t528), t529), t533), t534)
  series_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Num) -> Bool, sums(f, l, s) → sums((x : Num) => c * f(x), c * l, s)"), t535))
}

///|
let series_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_COMPLEX_LMUL")

///|
/// `SERIES_COMPLEX_LMUL`
pub fn series_complex_lmul() -> @kernel.Thm {
  series_complex_lmul_c.get()
}

///|
/// SERIES_COMPLEX_RMUL
fn step_65() -> Unit raise {
  let t536 = @simp.rewrite_tac(@list.List([series_complex_lmul()]))
  let t537 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t536)
  series_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Num) -> Bool, sums(f, l, s) → sums((x : Num) => f(x) * c, l * c, s)"), t537))
}

///|
let series_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_COMPLEX_RMUL")

///|
/// `SERIES_COMPLEX_RMUL`
pub fn series_complex_rmul() -> @kernel.Thm {
  series_complex_rmul_c.get()
}

///|
/// SERIES_COMPLEX_DIV
fn step_66() -> Unit raise {
  let t538 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), series_complex_rmul()]))
  series_complex_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Num) -> Bool, sums(f, l, s) → sums((x : Num) => f(x) / c, l / c, s)"), t538))
}

///|
let series_complex_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_COMPLEX_DIV")

///|
/// `SERIES_COMPLEX_DIV`
pub fn series_complex_div() -> @kernel.Thm {
  series_complex_div_c.get()
}

///|
/// SUMMABLE_COMPLEX_LMUL
fn step_67() -> Unit raise {
  let t539 = @meson.meson_tac(@list.List([series_complex_lmul()]))
  let t540 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.summable()])), t539)
  summable_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Num) -> Bool, summable(s, f) → summable(s, (x : Num) => c * f(x))"), t540))
}

///|
let summable_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_COMPLEX_LMUL")

///|
/// `SUMMABLE_COMPLEX_LMUL`
pub fn summable_complex_lmul() -> @kernel.Thm {
  summable_complex_lmul_c.get()
}

///|
/// SUMMABLE_COMPLEX_RMUL
fn step_68() -> Unit raise {
  let t541 = @meson.meson_tac(@list.List([series_complex_rmul()]))
  let t542 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.summable()])), t541)
  summable_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Num) -> Bool, summable(s, f) → summable(s, (x : Num) => f(x) * c)"), t542))
}

///|
let summable_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_COMPLEX_RMUL")

///|
/// `SUMMABLE_COMPLEX_RMUL`
pub fn summable_complex_rmul() -> @kernel.Thm {
  summable_complex_rmul_c.get()
}

///|
/// SUMMABLE_COMPLEX_DIV
fn step_69() -> Unit raise {
  let t543 = @meson.meson_tac(@list.List([series_complex_div()]))
  let t544 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.summable()])), t543)
  summable_complex_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Num) -> Bool, summable(s, f) → summable(s, (x : Num) => f(x) / c)"), t544))
}

///|
let summable_complex_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_COMPLEX_DIV")

///|
/// `SUMMABLE_COMPLEX_DIV`
pub fn summable_complex_div() -> @kernel.Thm {
  summable_complex_div_c.get()
}

///|
/// SERIES_COMPLEX_MUL
fn step_70() -> Unit raise {
  let t545 = @simp.rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t546 = @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("complex_mul"), @topology.series_bilinear())), t545)
  series_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Cart[Real, 2], ∀ y : (Num) -> Cart[Real, 2], ∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], sums(x, a, from(0)) && sums(y, b, from(0)) && (summable(from(0), (n : Num) => lift(norm(x(n)))) || summable(from(0), (n : Num) => lift(norm(y(n))))) → sums((n : Num) => vsum(op_dot_dot(0, n), (i : Num) => x(i) * y(n - i)), a * b, from(0))"), t546))
}

///|
let series_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_COMPLEX_MUL")

///|
/// `SERIES_COMPLEX_MUL`
pub fn series_complex_mul() -> @kernel.Thm {
  series_complex_mul_c.get()
}

///|
/// SERIES_COMPLEX_MUL_UNIQUE
fn step_71() -> Unit raise {
  let t547 = @simp.rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t548 = @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("complex_mul"), @topology.series_bilinear_unique())), t547)
  series_complex_mul_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Cart[Real, 2], ∀ y : (Num) -> Cart[Real, 2], ∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], sums(x, a, from(0)) && sums(y, b, from(0)) && sums((n : Num) => vsum(op_dot_dot(0, n), (i : Num) => x(i) * y(n - i)), c, from(0)) → a * b == c"), t548))
}

///|
let series_complex_mul_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_COMPLEX_MUL_UNIQUE")

///|
/// `SERIES_COMPLEX_MUL_UNIQUE`
pub fn series_complex_mul_unique() -> @kernel.Thm {
  series_complex_mul_unique_c.get()
}

///|
/// SUMMABLE_COMPLEX_MUL_LEFT
fn step_72() -> Unit raise {
  let t549 = @simp.rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t550 = @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("complex_mul"), @topology.summable_bilinear_left())), t549)
  summable_complex_mul_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Cart[Real, 2], ∀ y : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, ∀ p : Num, summable(from(m), (n : Num) => lift(norm(x(n)))) && summable(from(n), y) → summable(from(p), (n : Num) => vsum(op_dot_dot(0, n), (i : Num) => x(i) * y(n - i)))"), t550))
}

///|
let summable_complex_mul_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_COMPLEX_MUL_LEFT")

///|
/// `SUMMABLE_COMPLEX_MUL_LEFT`
pub fn summable_complex_mul_left() -> @kernel.Thm {
  summable_complex_mul_left_c.get()
}

///|
/// SUMMABLE_COMPLEX_MUL_RIGHT
fn step_73() -> Unit raise {
  let t551 = @simp.rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t552 = @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("complex_mul"), @topology.summable_bilinear_right())), t551)
  summable_complex_mul_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Cart[Real, 2], ∀ y : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, ∀ p : Num, summable(from(m), x) && summable(from(n), (n : Num) => lift(norm(y(n)))) → summable(from(p), (n : Num) => vsum(op_dot_dot(0, n), (i : Num) => x(i) * y(n - i)))"), t552))
}

///|
let summable_complex_mul_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_COMPLEX_MUL_RIGHT")

///|
/// `SUMMABLE_COMPLEX_MUL_RIGHT`
pub fn summable_complex_mul_right() -> @kernel.Thm {
  summable_complex_mul_right_c.get()
}

///|
/// CONTINUOUS_COMPLEX_MUL
fn step_74() -> Unit raise {
  let t553 = @simp.simp_tac(@list.List([@topology.continuous(), lim_complex_mul()]))
  continuous_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], continuous(f, net) && continuous(g, net) → continuous((x : _) => f(x) * g(x), net)"), t553))
}

///|
let continuous_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_MUL")

///|
/// `CONTINUOUS_COMPLEX_MUL`
pub fn continuous_complex_mul() -> @kernel.Thm {
  continuous_complex_mul_c.get()
}

///|
/// CONTINUOUS_COMPLEX_LMUL
fn step_75() -> Unit raise {
  let t554 = @simp.simp_tac(@list.List([continuous_complex_mul(), @topology.continuous_const()]))
  continuous_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ f : (_) -> Cart[Real, 2], ∀ net : Net[_], continuous(f, net) → continuous((x : _) => c * f(x), net)"), t554))
}

///|
let continuous_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_LMUL")

///|
/// `CONTINUOUS_COMPLEX_LMUL`
pub fn continuous_complex_lmul() -> @kernel.Thm {
  continuous_complex_lmul_c.get()
}

///|
/// CONTINUOUS_COMPLEX_RMUL
fn step_76() -> Unit raise {
  let t555 = @simp.simp_tac(@list.List([continuous_complex_mul(), @topology.continuous_const()]))
  continuous_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ f : (_) -> Cart[Real, 2], ∀ net : Net[_], continuous(f, net) → continuous((x : _) => f(x) * c, net)"), t555))
}

///|
let continuous_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_RMUL")

///|
/// `CONTINUOUS_COMPLEX_RMUL`
pub fn continuous_complex_rmul() -> @kernel.Thm {
  continuous_complex_rmul_c.get()
}

///|
/// CONTINUOUS_COMPLEX_INV
fn step_77() -> Unit raise {
  let t556 = @simp.simp_tac(@list.List([@topology.continuous(), lim_complex_inv()]))
  continuous_complex_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], continuous(f, net) && !(f(netlimit(net)) == Cx(real_of_num(0))) → continuous((x : _) => inv(f(x)), net)"), t556))
}

///|
let continuous_complex_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_INV")

///|
/// `CONTINUOUS_COMPLEX_INV`
pub fn continuous_complex_inv() -> @kernel.Thm {
  continuous_complex_inv_c.get()
}

///|
/// CONTINUOUS_COMPLEX_DIV
fn step_78() -> Unit raise {
  let t557 = @simp.simp_tac(@list.List([@topology.continuous(), lim_complex_div()]))
  continuous_complex_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ g : (_) -> Cart[Real, 2], continuous(f, net) && continuous(g, net) && !(g(netlimit(net)) == Cx(real_of_num(0))) → continuous((x : _) => f(x) / g(x), net)"), t557))
}

///|
let continuous_complex_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_DIV")

///|
/// `CONTINUOUS_COMPLEX_DIV`
pub fn continuous_complex_div() -> @kernel.Thm {
  continuous_complex_div_c.get()
}

///|
/// CONTINUOUS_COMPLEX_POW
fn step_79() -> Unit raise {
  let t558 = @simp.simp_tac(@list.List([@topology.continuous(), lim_complex_pow()]))
  continuous_complex_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ n : Num, continuous(f, net) → continuous((x : _) => pow(f(x), n), net)"), t558))
}

///|
let continuous_complex_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_POW")

///|
/// `CONTINUOUS_COMPLEX_POW`
pub fn continuous_complex_pow() -> @kernel.Thm {
  continuous_complex_pow_c.get()
}

///|
/// CONTINUOUS_CPRODUCT
fn step_80() -> Unit raise {
  let t561 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses(), @topology.continuous_const(), @sets.forall_in_insert(), @class.eta_ax(), continuous_complex_mul()]))
  let t560 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t559 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t562 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t559), t560), t561)
  continuous_cproduct_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[Cart[Real, N]], ∀ f : (A, Cart[Real, N]) -> Cart[Real, 2], ∀ k : (A) -> Bool, FINITE(k) && (∀ i : A, IN(i, k) → continuous(f(i), net)) → continuous((z : Cart[Real, N]) => cproduct(k, (i : A) => f(i, z)), net)"), t562))
}

///|
let continuous_cproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_CPRODUCT")

///|
/// `CONTINUOUS_CPRODUCT`
pub fn continuous_cproduct() -> @kernel.Thm {
  continuous_cproduct_c.get()
}

///|
/// CONTINUOUS_COMPLEX_INV_WITHIN
fn step_81() -> Unit raise {
  let t563 = @meson.meson_tac(@list.List([continuous_complex_inv(), @topology.continuous_trivial_limit(), @topology.netlimit_within()]))
  continuous_complex_inv_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ s : (Cart[Real, _]) -> Bool, ∀ a : Cart[Real, _], continuous(f, within(at(a), s)) && !(f(a) == Cx(real_of_num(0))) → continuous((x : Cart[Real, _]) => inv(f(x)), within(at(a), s))"), t563))
}

///|
let continuous_complex_inv_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_INV_WITHIN")

///|
/// `CONTINUOUS_COMPLEX_INV_WITHIN`
pub fn continuous_complex_inv_within() -> @kernel.Thm {
  continuous_complex_inv_within_c.get()
}

///|
/// CONTINUOUS_COMPLEX_INV_AT
fn step_82() -> Unit raise {
  let t564 = @simp.simp_tac(@list.List([continuous_complex_inv(), @topology.netlimit_at()]))
  continuous_complex_inv_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ a : Cart[Real, _], continuous(f, at(a)) && !(f(a) == Cx(real_of_num(0))) → continuous((x : Cart[Real, _]) => inv(f(x)), at(a))"), t564))
}

///|
let continuous_complex_inv_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_INV_AT")

///|
/// `CONTINUOUS_COMPLEX_INV_AT`
pub fn continuous_complex_inv_at() -> @kernel.Thm {
  continuous_complex_inv_at_c.get()
}

///|
/// CONTINUOUS_COMPLEX_DIV_WITHIN
fn step_83() -> Unit raise {
  let t565 = @meson.meson_tac(@list.List([continuous_complex_div(), @topology.continuous_trivial_limit(), @topology.netlimit_within()]))
  continuous_complex_div_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ g : (Cart[Real, _]) -> Cart[Real, 2], ∀ s : (Cart[Real, _]) -> Bool, ∀ a : Cart[Real, _], continuous(f, within(at(a), s)) && continuous(g, within(at(a), s)) && !(g(a) == Cx(real_of_num(0))) → continuous((x : Cart[Real, _]) => f(x) / g(x), within(at(a), s))"), t565))
}

///|
let continuous_complex_div_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_DIV_WITHIN")

///|
/// `CONTINUOUS_COMPLEX_DIV_WITHIN`
pub fn continuous_complex_div_within() -> @kernel.Thm {
  continuous_complex_div_within_c.get()
}

///|
/// CONTINUOUS_COMPLEX_DIV_AT
fn step_84() -> Unit raise {
  let t566 = @simp.simp_tac(@list.List([continuous_complex_div(), @topology.netlimit_at()]))
  continuous_complex_div_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ g : (Cart[Real, _]) -> Cart[Real, 2], ∀ a : Cart[Real, _], continuous(f, at(a)) && continuous(g, at(a)) && !(g(a) == Cx(real_of_num(0))) → continuous((x : Cart[Real, _]) => f(x) / g(x), at(a))"), t566))
}

///|
let continuous_complex_div_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_COMPLEX_DIV_AT")

///|
/// `CONTINUOUS_COMPLEX_DIV_AT`
pub fn continuous_complex_div_at() -> @kernel.Thm {
  continuous_complex_div_at_c.get()
}

///|
/// CONTINUOUS_ON_COMPLEX_MUL
fn step_85() -> Unit raise {
  let t567 = @simp.simp_tac(@list.List([continuous_complex_mul()]))
  let t568 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within()])), t567)
  continuous_on_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ g : (Cart[Real, _]) -> Cart[Real, 2], ∀ s : (Cart[Real, _]) -> Bool, continuous_on(f, s) && continuous_on(g, s) → continuous_on((x : Cart[Real, _]) => f(x) * g(x), s)"), t568))
}

///|
let continuous_on_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_COMPLEX_MUL")

///|
/// `CONTINUOUS_ON_COMPLEX_MUL`
pub fn continuous_on_complex_mul() -> @kernel.Thm {
  continuous_on_complex_mul_c.get()
}

///|
/// CONTINUOUS_ON_COMPLEX_LMUL
fn step_86() -> Unit raise {
  let t569 = @simp.simp_tac(@list.List([lim_complex_mul(), @topology.lim_const()]))
  let t570 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_on_v1()])), t569)
  continuous_on_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, continuous_on(f, s) → continuous_on((x : Cart[Real, N]) => (c : Cart[Real, 2]) * f(x), s)"), t570))
}

///|
let continuous_on_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_COMPLEX_LMUL")

///|
/// `CONTINUOUS_ON_COMPLEX_LMUL`
pub fn continuous_on_complex_lmul() -> @kernel.Thm {
  continuous_on_complex_lmul_c.get()
}

///|
/// CONTINUOUS_ON_COMPLEX_RMUL
fn step_87() -> Unit raise {
  let t571 = @simp.simp_tac(@list.List([lim_complex_mul(), @topology.lim_const()]))
  let t572 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_on_v1()])), t571)
  continuous_on_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, continuous_on(f, s) → continuous_on((x : Cart[Real, N]) => f(x) * (c : Cart[Real, 2]), s)"), t572))
}

///|
let continuous_on_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_COMPLEX_RMUL")

///|
/// `CONTINUOUS_ON_COMPLEX_RMUL`
pub fn continuous_on_complex_rmul() -> @kernel.Thm {
  continuous_on_complex_rmul_c.get()
}

///|
/// CONTINUOUS_ON_COMPLEX_INV
fn step_88() -> Unit raise {
  let t573 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_complex_inv_within()]))
  continuous_on_complex_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], continuous_on(f, (s : (Cart[Real, N]) -> Bool)) && (∀ x : Cart[Real, N], IN(x, s) → !(f(x) == Cx(real_of_num(0)))) → continuous_on((x : Cart[Real, N]) => inv(f(x)), s)"), t573))
}

///|
let continuous_on_complex_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_COMPLEX_INV")

///|
/// `CONTINUOUS_ON_COMPLEX_INV`
pub fn continuous_on_complex_inv() -> @kernel.Thm {
  continuous_on_complex_inv_c.get()
}

///|
/// CONTINUOUS_ON_COMPLEX_DIV
fn step_89() -> Unit raise {
  let t574 = @simp.simp_tac(@list.List([continuous_complex_div_within()]))
  let t575 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within()])), t574)
  continuous_on_complex_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ g : (Cart[Real, _]) -> Cart[Real, 2], ∀ s : (Cart[Real, _]) -> Bool, continuous_on(f, s) && continuous_on(g, s) && (∀ x : Cart[Real, _], IN(x, s) → !(g(x) == Cx(real_of_num(0)))) → continuous_on((x : Cart[Real, _]) => f(x) / g(x), s)"), t575))
}

///|
let continuous_on_complex_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_COMPLEX_DIV")

///|
/// `CONTINUOUS_ON_COMPLEX_DIV`
pub fn continuous_on_complex_div() -> @kernel.Thm {
  continuous_on_complex_div_c.get()
}

///|
/// CONTINUOUS_ON_COMPLEX_POW
fn step_90() -> Unit raise {
  let t576 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_complex_pow()]))
  continuous_on_complex_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ n : Num, ∀ s : (Cart[Real, _]) -> Bool, continuous_on(f, s) → continuous_on((x : Cart[Real, _]) => pow(f(x), n), s)"), t576))
}

///|
let continuous_on_complex_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_COMPLEX_POW")

///|
/// `CONTINUOUS_ON_COMPLEX_POW`
pub fn continuous_on_complex_pow() -> @kernel.Thm {
  continuous_on_complex_pow_c.get()
}

///|
/// CONTINUOUS_ON_CPRODUCT
fn step_91() -> Unit raise {
  let t577 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_cproduct()]))
  continuous_on_cproduct_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, Cart[Real, _]) -> Cart[Real, 2], ∀ k : (A) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, FINITE(k) && (∀ i : A, IN(i, k) → continuous_on(f(i), s)) → continuous_on((z : Cart[Real, _]) => cproduct(k, (i : A) => f(i, z)), s)"), t577))
}

///|
let continuous_on_cproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CPRODUCT")

///|
/// `CONTINUOUS_ON_CPRODUCT`
pub fn continuous_on_cproduct() -> @kernel.Thm {
  continuous_on_cproduct_c.get()
}

///|
/// UNIFORMLY_CONTINUOUS_ON_COMPLEX_MUL
fn step_92() -> Unit raise {
  let t582 = @simp.asm_rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t578 = @term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)")
  let t579 = @term_syntax.parse_term("complex_mul")
  let t580 = @term_syntax.parse_term("(g : (Cart[Real, N]) -> Cart[Real, 2])")
  let t581 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, 2])"), t580, t579, t578]), @topology.bilinear_uniformly_continuous_on_compose()))
  let t583 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t581), t582)
  uniformly_continuous_on_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ g : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, uniformly_continuous_on(f, s) && uniformly_continuous_on(g, s) && bounded(IMAGE(f, s)) && bounded(IMAGE(g, s)) → uniformly_continuous_on((x : Cart[Real, N]) => f(x) * g(x), s)"), t583))
}

///|
let uniformly_continuous_on_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFORMLY_CONTINUOUS_ON_COMPLEX_MUL")

///|
/// `UNIFORMLY_CONTINUOUS_ON_COMPLEX_MUL`
pub fn uniformly_continuous_on_complex_mul() -> @kernel.Thm {
  uniformly_continuous_on_complex_mul_c.get()
}

///|
/// UNIFORMLY_CONTINUOUS_ON_COMPLEX_LMUL
fn step_93() -> Unit raise {
  let t593 = @simp.asm_simp_tac(@list.List([@trivia.o_def(), @complexes.linear_complex_mul(), @topology.linear_uniformly_continuous_on()]))
  let t590 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.uniformly_continuous_on_compose()))
  let t587 = @term_syntax.parse_term("(x : Cart[Real, 2]) => (c : Cart[Real, 2]) * x")
  let t592 = @tactics.disch_then(fn(x591 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x584 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s585 = @tactics.mp_tac(x584)
        fn(x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s585(x586)
        }
      })(((x588 : @kernel.Thm) => @bool.ispec(t587, x588))(x589))
    })(t590(x591))
  })
  let t594 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t592), t593)
  uniformly_continuous_on_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, uniformly_continuous_on(f, s) → uniformly_continuous_on((x : Cart[Real, N]) => c * f(x), s)"), t594))
}

///|
let uniformly_continuous_on_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFORMLY_CONTINUOUS_ON_COMPLEX_LMUL")

///|
/// `UNIFORMLY_CONTINUOUS_ON_COMPLEX_LMUL`
pub fn uniformly_continuous_on_complex_lmul() -> @kernel.Thm {
  uniformly_continuous_on_complex_lmul_c.get()
}

///|
/// UNIFORMLY_CONTINUOUS_ON_COMPLEX_RMUL
fn step_94() -> Unit raise {
  let t595 = @simp.rewrite_tac(@list.List([uniformly_continuous_on_complex_lmul()]))
  let t596 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t595)
  uniformly_continuous_on_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, uniformly_continuous_on(f, s) → uniformly_continuous_on((x : Cart[Real, N]) => f(x) * c, s)"), t596))
}

///|
let uniformly_continuous_on_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFORMLY_CONTINUOUS_ON_COMPLEX_RMUL")

///|
/// `UNIFORMLY_CONTINUOUS_ON_COMPLEX_RMUL`
pub fn uniformly_continuous_on_complex_rmul() -> @kernel.Thm {
  uniformly_continuous_on_complex_rmul_c.get()
}

///|
/// CONTINUOUS_TAC
fn step_95() -> Unit raise {
  let t597 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let eta_thm = @tactics.prove(@term_syntax.parse_term("continuous((f : (_) -> Cart[Real, _]), (net : Net[_])) == continuous((x : _) => f(x), net)"), t597)
  let t605 = @simp.gen_rewrite_rule(fn(x604 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x598 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s599 = @equal.land_conv(x598)
      fn(x600 : @kernel.Term) -> @kernel.Thm raise {
        s599(x600)
      }
    })((fn(x601 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s602 = @equal.once_depth_conv(x601)
      fn(x603 : @kernel.Term) -> @kernel.Thm raise {
        s602(x603)
      }
    })(x604))
  }, @list.List([eta_thm]))
  let eta_tweak : (@kernel.Thm) -> @kernel.Thm raise = fn(x606 : @kernel.Thm) -> @kernel.Thm raise {
    t605(@bool.spec_all(x606))
  }
  let t608 = @tactics.match_accept_tac(@topology.continuous_within_id())
  let t607 = @tactics.match_accept_tac(@topology.continuous_at_id())
  let tac_base : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.orelse_tac(@tactics.orelse_tac(@tactics.match_accept_tac(@topology.continuous_const()), t607), t608)
  let t610 = @tactics.match_mp_tac(eta_tweak(continuous_complex_pow()))
  let t609 = @tactics.match_mp_tac(eta_tweak(@topology.continuous_neg()))
  let tac_1 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.orelse_tac(@tactics.orelse_tac(@tactics.match_mp_tac(eta_tweak(@topology.continuous_cmul())), t609), t610)
  let t612 = @tactics.match_mp_tac(eta_tweak(continuous_complex_mul()))
  let t611 = @tactics.match_mp_tac(eta_tweak(@topology.continuous_sub()))
  let tac_2 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.orelse_tac(@tactics.orelse_tac(@tactics.match_mp_tac(eta_tweak(@topology.continuous_add())), t611), t612)
  let tac_1_p : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.match_mp_tac(eta_tweak(continuous_complex_inv()))
  let tac_2_p : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.match_mp_tac(eta_tweak(continuous_complex_div()))
  fn continuous_tac_1(x613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
    let gl = x613
    let t617 = @list.List([continuous_tac_1, continuous_tac_1, @simp.rewrite_tac(@list.List([@topology.netlimit_at(), @topology.netlimit_within()]))])
    let t618 = @tactics.thenl(@tactics.then_tac(tac_2_p, @tactics.repeat_tac(@tactics.conj_tac)), t617)
    let t615 = @list.List([continuous_tac_1, @simp.rewrite_tac(@list.List([@topology.netlimit_at(), @topology.netlimit_within()]))])
    let t616 = @tactics.thenl(@tactics.then_tac(tac_1_p, @tactics.conj_tac), t615)
    let t614 = @tactics.then_tac(@tactics.then_tac(tac_2, @tactics.conj_tac), continuous_tac_1)
    @tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(tac_base, @tactics.then_tac(tac_1, continuous_tac_1)), t614), t616), t618), @tactics.all_tac)(gl)
  }
  continuous_tac_c.set(continuous_tac_1)
}

///|
let continuous_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("CONTINUOUS_TAC")

///|
/// `CONTINUOUS_TAC`
pub fn continuous_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (continuous_tac_c.get())(x)
}

///|
/// LIM_TAC
fn step_96() -> Unit raise {
  let t619 = @list.List([continuous_tac, @simp.rewrite_tac(@list.List([@topology.netlimit_at(), @topology.netlimit_within()]))])
  lim_tac_c.set(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.lim_continuous()), @tactics.conj_tac), t619))
}

///|
let lim_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("LIM_TAC")

///|
/// `LIM_TAC`
pub fn lim_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (lim_tac_c.get())(x)
}

///|
/// CONTINUOUS_AT_CX_NORM
fn step_97() -> Unit raise {
  let t620 = @meson.meson_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("norm((a : Cart[Real, N]) - (b : Cart[Real, N])) < (d : Real) → abs(norm(a) - norm(b)) < d"))]))
  let t621 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_at_v1(), @vectors.dist(), @equal.gsym(@complexes.cx_sub()), @complexes.complex_norm_cx()])), t620)
  continuous_at_cx_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, N], continuous((z : Cart[Real, N]) => Cx(norm(z)), at(z))"), t621))
}

///|
let continuous_at_cx_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_CX_NORM")

///|
/// `CONTINUOUS_AT_CX_NORM`
pub fn continuous_at_cx_norm() -> @kernel.Thm {
  continuous_at_cx_norm_c.get()
}

///|
/// CONTINUOUS_WITHIN_CX_NORM
fn step_98() -> Unit raise {
  let t622 = @simp.simp_tac(@list.List([continuous_at_cx_norm(), @topology.continuous_at_within()]))
  continuous_within_cx_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, continuous((z : Cart[Real, N]) => Cx(norm(z)), within(at(z), s))"), t622))
}

///|
let continuous_within_cx_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_WITHIN_CX_NORM")

///|
/// `CONTINUOUS_WITHIN_CX_NORM`
pub fn continuous_within_cx_norm() -> @kernel.Thm {
  continuous_within_cx_norm_c.get()
}

///|
/// CONTINUOUS_ON_CX_NORM
fn step_99() -> Unit raise {
  let t623 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_within_cx_norm()]))
  continuous_on_cx_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, continuous_on((z : Cart[Real, _]) => Cx(norm(z)), s)"), t623))
}

///|
let continuous_on_cx_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CX_NORM")

///|
/// `CONTINUOUS_ON_CX_NORM`
pub fn continuous_on_cx_norm() -> @kernel.Thm {
  continuous_on_cx_norm_c.get()
}

///|
/// CONTINUOUS_AT_CX_DOT
fn step_100() -> Unit raise {
  let t625 = @simp.rewrite_tac(@list.List([@vectors.linear(), @vectors.dot_radd(), @vectors.dot_rmul(), @complexes.cx_add(), @complexes.complex_cmul(), @complexes.cx_mul()]))
  let t624 = @tactics.match_mp_tac(@topology.linear_continuous_at())
  let t626 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t624), t625)
  continuous_at_cx_dot_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, N], ∀ z : Cart[Real, N], continuous((z : Cart[Real, N]) => Cx(dot(c, z)), at(z))"), t626))
}

///|
let continuous_at_cx_dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_CX_DOT")

///|
/// `CONTINUOUS_AT_CX_DOT`
pub fn continuous_at_cx_dot() -> @kernel.Thm {
  continuous_at_cx_dot_c.get()
}

///|
/// CONTINUOUS_WITHIN_CX_DOT
fn step_101() -> Unit raise {
  let t627 = @simp.simp_tac(@list.List([continuous_at_cx_dot(), @topology.continuous_at_within()]))
  continuous_within_cx_dot_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, N], ∀ z : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, continuous((z : Cart[Real, N]) => Cx(dot(c, z)), within(at(z), s))"), t627))
}

///|
let continuous_within_cx_dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_WITHIN_CX_DOT")

///|
/// `CONTINUOUS_WITHIN_CX_DOT`
pub fn continuous_within_cx_dot() -> @kernel.Thm {
  continuous_within_cx_dot_c.get()
}

///|
/// CONTINUOUS_ON_CX_DOT
fn step_102() -> Unit raise {
  let t628 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_within_cx_dot()]))
  continuous_on_cx_dot_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ c : Cart[Real, N], continuous_on((z : Cart[Real, N]) => Cx(dot(c, z)), s)"), t628))
}

///|
let continuous_on_cx_dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CX_DOT")

///|
/// `CONTINUOUS_ON_CX_DOT`
pub fn continuous_on_cx_dot() -> @kernel.Thm {
  continuous_on_cx_dot_c.get()
}

///|
/// CONTINUOUS_CX_DROP
fn step_103() -> Unit raise {
  let t631 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.norm_1())]))
  let t629 = @equal.gsym(@vectors.drop_sub())
  let t630 = @simp.rewrite_tac(@list.List([@vectors.dist(), @equal.gsym(@complexes.cx_sub()), @complexes.complex_norm_cx(), t629]))
  let t632 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous(), @topology.tendsto()])), t630), t631)
  continuous_cx_drop_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, Unit], continuous(f, net) → continuous((x : _) => Cx(drop(f(x))), net)"), t632))
}

///|
let continuous_cx_drop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_CX_DROP")

///|
/// `CONTINUOUS_CX_DROP`
pub fn continuous_cx_drop() -> @kernel.Thm {
  continuous_cx_drop_c.get()
}

///|
/// CONTINUOUS_ON_CX_DROP
fn step_104() -> Unit raise {
  let t633 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_cx_drop()]))
  continuous_on_cx_drop_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, Unit], ∀ s : (Cart[Real, _]) -> Bool, continuous_on(f, s) → continuous_on((x : Cart[Real, _]) => Cx(drop(f(x))), s)"), t633))
}

///|
let continuous_on_cx_drop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CX_DROP")

///|
/// `CONTINUOUS_ON_CX_DROP`
pub fn continuous_on_cx_drop() -> @kernel.Thm {
  continuous_on_cx_drop_c.get()
}

///|
/// CONTINUOUS_CX_LIFT
fn step_105() -> Unit raise {
  let t635 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @vectors.norm_lift()]))
  let t634 = @equal.gsym(@vectors.lift_sub())
  let t636 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous(), @topology.tendsto(), @vectors.dist(), @equal.gsym(@complexes.cx_sub()), t634])), t635)
  continuous_cx_lift_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> Real, continuous((x : _) => Cx(f(x)), (net : Net[_])) == continuous((x : _) => lift(f(x)), net)"), t636))
}

///|
let continuous_cx_lift_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_CX_LIFT")

///|
/// `CONTINUOUS_CX_LIFT`
pub fn continuous_cx_lift() -> @kernel.Thm {
  continuous_cx_lift_c.get()
}

///|
/// CONTINUOUS_ON_CX_LIFT
fn step_106() -> Unit raise {
  let t637 = @simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_cx_lift()]))
  continuous_on_cx_lift_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Real, ∀ s : (Cart[Real, _]) -> Bool, continuous_on((x : Cart[Real, _]) => Cx(f(x)), s) == continuous_on((x : Cart[Real, _]) => lift(f(x)), s)"), t637))
}

///|
let continuous_on_cx_lift_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CX_LIFT")

///|
/// `CONTINUOUS_ON_CX_LIFT`
pub fn continuous_on_cx_lift() -> @kernel.Thm {
  continuous_on_cx_lift_c.get()
}

///|
/// LINEAR_CX_RE
fn step_107() -> Unit raise {
  let t638 = @simp.simp_tac(@list.List([@vectors.linear(), @trivia.o_thm(), @complexes.complex_cmul(), @complexes.re_add(), @complexes.re_mul_cx(), @complexes.cx_mul(), @complexes.cx_add()]))
  linear_cx_re_c.set(@tactics.prove(@term_syntax.parse_term("linear(o(Cx, Re))"), t638))
}

///|
let linear_cx_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_CX_RE")

///|
/// `LINEAR_CX_RE`
pub fn linear_cx_re() -> @kernel.Thm {
  linear_cx_re_c.get()
}

///|
/// CONTINUOUS_AT_CX_RE
fn step_108() -> Unit raise {
  let t639 = @simp.simp_tac(@list.List([@topology.linear_continuous_at(), linear_cx_re()]))
  continuous_at_cx_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], continuous(o(Cx, Re), at(z))"), t639))
}

///|
let continuous_at_cx_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_CX_RE")

///|
/// `CONTINUOUS_AT_CX_RE`
pub fn continuous_at_cx_re() -> @kernel.Thm {
  continuous_at_cx_re_c.get()
}

///|
/// CONTINUOUS_ON_CX_RE
fn step_109() -> Unit raise {
  let t640 = @simp.simp_tac(@list.List([@topology.linear_continuous_on(), linear_cx_re()]))
  continuous_on_cx_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, continuous_on(o(Cx, Re), s)"), t640))
}

///|
let continuous_on_cx_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CX_RE")

///|
/// `CONTINUOUS_ON_CX_RE`
pub fn continuous_on_cx_re() -> @kernel.Thm {
  continuous_on_cx_re_c.get()
}

///|
/// LINEAR_CX_IM
fn step_110() -> Unit raise {
  let t641 = @simp.simp_tac(@list.List([@vectors.linear(), @trivia.o_thm(), @complexes.complex_cmul(), @complexes.im_add(), @complexes.im_mul_cx(), @complexes.cx_mul(), @complexes.cx_add()]))
  linear_cx_im_c.set(@tactics.prove(@term_syntax.parse_term("linear(o(Cx, Im))"), t641))
}

///|
let linear_cx_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_CX_IM")

///|
/// `LINEAR_CX_IM`
pub fn linear_cx_im() -> @kernel.Thm {
  linear_cx_im_c.get()
}

///|
/// CONTINUOUS_AT_CX_IM
fn step_111() -> Unit raise {
  let t642 = @simp.simp_tac(@list.List([@topology.linear_continuous_at(), linear_cx_im()]))
  continuous_at_cx_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], continuous(o(Cx, Im), at(z))"), t642))
}

///|
let continuous_at_cx_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_CX_IM")

///|
/// `CONTINUOUS_AT_CX_IM`
pub fn continuous_at_cx_im() -> @kernel.Thm {
  continuous_at_cx_im_c.get()
}

///|
/// CONTINUOUS_ON_CX_IM
fn step_112() -> Unit raise {
  let t643 = @simp.simp_tac(@list.List([@topology.linear_continuous_on(), linear_cx_im()]))
  continuous_on_cx_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, continuous_on(o(Cx, Im), s)"), t643))
}

///|
let continuous_on_cx_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CX_IM")

///|
/// `CONTINUOUS_ON_CX_IM`
pub fn continuous_on_cx_im() -> @kernel.Thm {
  continuous_on_cx_im_c.get()
}

///|
/// Multivariate/canal.ml:935
fn step_113() -> Unit raise {
  @printer.parse_as_infix("has_complex_derivative", (12L, "right"))
}

///|
/// Multivariate/canal.ml:936
fn step_114() -> Unit raise {
  @printer.parse_as_infix("complex_differentiable", (12L, "right"))
}

///|
/// Multivariate/canal.ml:937
fn step_115() -> Unit raise {
  @printer.parse_as_infix("holomorphic_on", (12L, "right"))
}

///|
/// has_complex_derivative
fn step_116() -> Unit raise {
  has_complex_derivative_c.set(@pair.new_definition(@term_syntax.parse_term("(has_complex_derivative : ((Cart[Real, 2]) -> Cart[Real, 2], Cart[Real, 2], Net[Cart[Real, 2]]) -> Bool)((f : (Cart[Real, 2]) -> Cart[Real, 2]), (f' : Cart[Real, 2]), (net : Net[Cart[Real, 2]])) == has_derivative(f, (x : Cart[Real, 2]) => f' * x, net)")))
}

///|
let has_complex_derivative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("has_complex_derivative")

///|
/// `has_complex_derivative`
pub fn has_complex_derivative() -> @kernel.Thm {
  has_complex_derivative_c.get()
}

///|
/// complex_differentiable
fn step_117() -> Unit raise {
  complex_differentiable_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_differentiable : ((Cart[Real, 2]) -> Cart[Real, 2], Net[Cart[Real, 2]]) -> Bool)((f : (Cart[Real, 2]) -> Cart[Real, 2]), (net : Net[Cart[Real, 2]])) == (∃ f' : Cart[Real, 2], has_complex_derivative(f, f', net))")))
}

///|
let complex_differentiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_differentiable")

///|
/// `complex_differentiable`
pub fn complex_differentiable() -> @kernel.Thm {
  complex_differentiable_c.get()
}

///|
/// complex_derivative
fn step_118() -> Unit raise {
  complex_derivative_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_derivative : ((Cart[Real, 2]) -> Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])((f : (Cart[Real, 2]) -> Cart[Real, 2]), (x : Cart[Real, 2])) == select((f' : Cart[Real, 2]) => has_complex_derivative(f, f', at(x)))")))
}

///|
let complex_derivative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_derivative")

///|
/// `complex_derivative`
pub fn complex_derivative() -> @kernel.Thm {
  complex_derivative_c.get()
}

///|
/// higher_complex_derivative
fn step_119() -> Unit raise {
  higher_complex_derivative_c.set(@define.define_(@term_syntax.parse_term("(higher_complex_derivative : (Num, (Cart[Real, 2]) -> Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])(0, (f : (Cart[Real, 2]) -> Cart[Real, 2])) == f && (∀ n : Num, higher_complex_derivative(SUC(n), f) == complex_derivative(higher_complex_derivative(n, f)))")))
}

///|
let higher_complex_derivative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("higher_complex_derivative")

///|
/// `higher_complex_derivative`
pub fn higher_complex_derivative() -> @kernel.Thm {
  higher_complex_derivative_c.get()
}

///|
/// holomorphic_on
fn step_120() -> Unit raise {
  holomorphic_on_c.set(@pair.new_definition(@term_syntax.parse_term("(holomorphic_on : ((Cart[Real, 2]) -> Cart[Real, 2], (Cart[Real, 2]) -> Bool) -> Bool)((f : (Cart[Real, 2]) -> Cart[Real, 2]), (s : (Cart[Real, 2]) -> Bool)) == (∀ x : Cart[Real, 2], IN(x, s) → (∃ f' : Cart[Real, 2], has_complex_derivative(f, f', within(at(x), s))))")))
}

///|
let holomorphic_on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("holomorphic_on")

///|
/// `holomorphic_on`
pub fn holomorphic_on() -> @kernel.Thm {
  holomorphic_on_c.get()
}

///|
/// HOLOMORPHIC_ON_EMPTY
fn step_121() -> Unit raise {
  let t644 = @simp.rewrite_tac(@list.List([holomorphic_on(), @sets.not_in_empty()]))
  holomorphic_on_empty_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], holomorphic_on(f, {})"), t644))
}

///|
let holomorphic_on_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_EMPTY")

///|
/// `HOLOMORPHIC_ON_EMPTY`
pub fn holomorphic_on_empty() -> @kernel.Thm {
  holomorphic_on_empty_c.get()
}

///|
/// HOLOMORPHIC_ON_DIFFERENTIABLE
fn step_122() -> Unit raise {
  let t645 = @simp.rewrite_tac(@list.List([holomorphic_on(), complex_differentiable()]))
  holomorphic_on_differentiable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) == (∀ x : Cart[Real, 2], IN(x, s) → complex_differentiable(f, within(at(x), s)))"), t645))
}

///|
let holomorphic_on_differentiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_DIFFERENTIABLE")

///|
/// `HOLOMORPHIC_ON_DIFFERENTIABLE`
pub fn holomorphic_on_differentiable() -> @kernel.Thm {
  holomorphic_on_differentiable_c.get()
}

///|
/// HOLOMORPHIC_ON_OPEN
fn step_123() -> Unit raise {
  let t647 = @simp.simp_tac(@list.List([@topology.lim_within_open()]))
  let t646 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_at(), @derivatives.has_derivative_within()]))
  let t648 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([holomorphic_on(), has_complex_derivative()])), t646), t647)
  holomorphic_on_open_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, open(s) → holomorphic_on(f, s) == (∀ x : Cart[Real, 2], IN(x, s) → (∃ f' : Cart[Real, 2], has_complex_derivative(f, f', at(x))))"), t648))
}

///|
let holomorphic_on_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_OPEN")

///|
/// `HOLOMORPHIC_ON_OPEN`
pub fn holomorphic_on_open() -> @kernel.Thm {
  holomorphic_on_open_c.get()
}

///|
/// HOLOMORPHIC_ON_IMP_DIFFERENTIABLE_WITHIN
fn step_124() -> Unit raise {
  let t649 = @meson.meson_tac(@list.List([holomorphic_on_differentiable()]))
  holomorphic_on_imp_differentiable_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ x : Cart[Real, 2], holomorphic_on(f, s) && IN(x, s) → complex_differentiable(f, within(at(x), s))"), t649))
}

///|
let holomorphic_on_imp_differentiable_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_IMP_DIFFERENTIABLE_WITHIN")

///|
/// `HOLOMORPHIC_ON_IMP_DIFFERENTIABLE_WITHIN`
pub fn holomorphic_on_imp_differentiable_within() -> @kernel.Thm {
  holomorphic_on_imp_differentiable_within_c.get()
}

///|
/// HOLOMORPHIC_ON_IMP_DIFFERENTIABLE_AT
fn step_125() -> Unit raise {
  let t650 = @meson.meson_tac(@list.List([holomorphic_on_open(), complex_differentiable()]))
  holomorphic_on_imp_differentiable_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ x : Cart[Real, 2], holomorphic_on(f, s) && open(s) && IN(x, s) → complex_differentiable(f, at(x))"), t650))
}

///|
let holomorphic_on_imp_differentiable_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_IMP_DIFFERENTIABLE_AT")

///|
/// `HOLOMORPHIC_ON_IMP_DIFFERENTIABLE_AT`
pub fn holomorphic_on_imp_differentiable_at() -> @kernel.Thm {
  holomorphic_on_imp_differentiable_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_IMP_CONTINUOUS_AT
fn step_126() -> Unit raise {
  let t651 = @meson.meson_tac(@list.List([@derivatives.differentiable(), @derivatives.differentiable_imp_continuous_at()]))
  let t652 = @tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative()])), t651)
  has_complex_derivative_imp_continuous_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) → continuous(f, at(x))"), t652))
}

///|
let has_complex_derivative_imp_continuous_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_IMP_CONTINUOUS_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_IMP_CONTINUOUS_AT`
pub fn has_complex_derivative_imp_continuous_at() -> @kernel.Thm {
  has_complex_derivative_imp_continuous_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_IMP_CONTINUOUS_WITHIN
fn step_127() -> Unit raise {
  let t653 = @meson.meson_tac(@list.List([@derivatives.differentiable(), @derivatives.differentiable_imp_continuous_within()]))
  let t654 = @tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative()])), t653)
  has_complex_derivative_imp_continuous_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', within(at(x), s)) → continuous(f, within(at(x), s))"), t654))
}

///|
let has_complex_derivative_imp_continuous_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_IMP_CONTINUOUS_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_IMP_CONTINUOUS_WITHIN`
pub fn has_complex_derivative_imp_continuous_within() -> @kernel.Thm {
  has_complex_derivative_imp_continuous_within_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_IMP_DIFFERENTIABLE
fn step_128() -> Unit raise {
  let t655 = @meson.meson_tac(@list.List([]))
  let t656 = @tactics.then_tac(@simp.simp_tac(@list.List([complex_differentiable(), @derivatives.differentiable(), has_complex_derivative()])), t655)
  complex_differentiable_imp_differentiable_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[Cart[Real, 2]], ∀ f : (Cart[Real, 2]) -> Cart[Real, 2], complex_differentiable(f, net) → differentiable(f, net)"), t656))
}

///|
let complex_differentiable_imp_differentiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_IMP_DIFFERENTIABLE")

///|
/// `COMPLEX_DIFFERENTIABLE_IMP_DIFFERENTIABLE`
pub fn complex_differentiable_imp_differentiable() -> @kernel.Thm {
  complex_differentiable_imp_differentiable_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_IMP_CONTINUOUS_AT
fn step_129() -> Unit raise {
  let t657 = @meson.meson_tac(@list.List([has_complex_derivative_imp_continuous_at(), complex_differentiable()]))
  complex_differentiable_imp_continuous_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], complex_differentiable(f, at(x)) → continuous(f, at(x))"), t657))
}

///|
let complex_differentiable_imp_continuous_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_IMP_CONTINUOUS_AT")

///|
/// `COMPLEX_DIFFERENTIABLE_IMP_CONTINUOUS_AT`
pub fn complex_differentiable_imp_continuous_at() -> @kernel.Thm {
  complex_differentiable_imp_continuous_at_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_IMP_CONTINUOUS_WITHIN
fn step_130() -> Unit raise {
  let t658 = @meson.meson_tac(@list.List([complex_differentiable_imp_differentiable(), @derivatives.differentiable_imp_continuous_within()]))
  complex_differentiable_imp_continuous_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, complex_differentiable(f, within(at(x), s)) → continuous(f, within(at(x), s))"), t658))
}

///|
let complex_differentiable_imp_continuous_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_IMP_CONTINUOUS_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_IMP_CONTINUOUS_WITHIN`
pub fn complex_differentiable_imp_continuous_within() -> @kernel.Thm {
  complex_differentiable_imp_continuous_within_c.get()
}

///|
/// HOLOMORPHIC_ON_IMP_CONTINUOUS_ON
fn step_131() -> Unit raise {
  let t660 = @meson.meson_tac(@list.List([@derivatives.differentiable_imp_continuous_within(), @derivatives.differentiable()]))
  let t659 = @simp.rewrite_tac(@list.List([has_complex_derivative()]))
  let t661 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([holomorphic_on(), @topology.continuous_on_eq_continuous_within()])), t659), t660)
  holomorphic_on_imp_continuous_on_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) → continuous_on(f, s)"), t661))
}

///|
let holomorphic_on_imp_continuous_on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_IMP_CONTINUOUS_ON")

///|
/// `HOLOMORPHIC_ON_IMP_CONTINUOUS_ON`
pub fn holomorphic_on_imp_continuous_on() -> @kernel.Thm {
  holomorphic_on_imp_continuous_on_c.get()
}

///|
/// HOLOMORPHIC_ON_SUBSET
fn step_132() -> Unit raise {
  let t662 = @meson.meson_tac(@list.List([@sets.subset(), @derivatives.has_derivative_within_subset()]))
  let t663 = @tactics.then_tac(@simp.rewrite_tac(@list.List([holomorphic_on(), has_complex_derivative()])), t662)
  holomorphic_on_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ t : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) && SUBSET(t, s) → holomorphic_on(f, t)"), t663))
}

///|
let holomorphic_on_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_SUBSET")

///|
/// `HOLOMORPHIC_ON_SUBSET`
pub fn holomorphic_on_subset() -> @kernel.Thm {
  holomorphic_on_subset_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_WITHIN_SUBSET
fn step_133() -> Unit raise {
  let t664 = @simp.rewrite_tac(@list.List([has_complex_derivative(), @derivatives.has_derivative_within_subset()]))
  has_complex_derivative_within_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ t : (Cart[Real, 2]) -> Bool, ∀ x : Cart[Real, 2], has_complex_derivative(f, (f' : Cart[Real, 2]), within(at(x), s)) && SUBSET(t, s) → has_complex_derivative(f, f', within(at(x), t))"), t664))
}

///|
let has_complex_derivative_within_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_WITHIN_SUBSET")

///|
/// `HAS_COMPLEX_DERIVATIVE_WITHIN_SUBSET`
pub fn has_complex_derivative_within_subset() -> @kernel.Thm {
  has_complex_derivative_within_subset_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_WITHIN_SUBSET
fn step_134() -> Unit raise {
  let t665 = @meson.meson_tac(@list.List([has_complex_derivative_within_subset()]))
  let t666 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t665)
  complex_differentiable_within_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ t : (Cart[Real, 2]) -> Bool, complex_differentiable(f, within(at((x : Cart[Real, 2])), s)) && SUBSET(t, s) → complex_differentiable(f, within(at(x), t))"), t666))
}

///|
let complex_differentiable_within_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_WITHIN_SUBSET")

///|
/// `COMPLEX_DIFFERENTIABLE_WITHIN_SUBSET`
pub fn complex_differentiable_within_subset() -> @kernel.Thm {
  complex_differentiable_within_subset_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_AT_WITHIN
fn step_135() -> Unit raise {
  let t667 = @simp.rewrite_tac(@list.List([has_complex_derivative(), @derivatives.has_derivative_at_within()]))
  has_complex_derivative_at_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', at(x)) → has_complex_derivative(f, f', within(at(x), s))"), t667))
}

///|
let has_complex_derivative_at_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_AT_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_AT_WITHIN`
pub fn has_complex_derivative_at_within() -> @kernel.Thm {
  has_complex_derivative_at_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_WITHIN_OPEN
fn step_136() -> Unit raise {
  let t668 = @simp.rewrite_tac(@list.List([has_complex_derivative(), @derivatives.has_derivative_within_open()]))
  has_complex_derivative_within_open_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ a : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, IN(a, s) && open(s) → has_complex_derivative(f, f', within(at(a), s)) == has_complex_derivative(f, f', at(a))"), t668))
}

///|
let has_complex_derivative_within_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_WITHIN_OPEN")

///|
/// `HAS_COMPLEX_DERIVATIVE_WITHIN_OPEN`
pub fn has_complex_derivative_within_open() -> @kernel.Thm {
  has_complex_derivative_within_open_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_AT_WITHIN
fn step_137() -> Unit raise {
  let t669 = @meson.meson_tac(@list.List([has_complex_derivative_at_within()]))
  let t670 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t669)
  complex_differentiable_at_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) → complex_differentiable(f, within(at(z), s))"), t670))
}

///|
let complex_differentiable_at_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_AT_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_AT_WITHIN`
pub fn complex_differentiable_at_within() -> @kernel.Thm {
  complex_differentiable_at_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_TRANSFORM_WITHIN
fn step_138() -> Unit raise {
  let t671 = @meson.meson_tac(@list.List([@derivatives.has_derivative_transform_within()]))
  let t672 = @tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative()])), t671)
  has_complex_derivative_transform_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ d : Real, real_of_num(0) < d && IN(x, s) && (∀ x' : Cart[Real, 2], IN(x', s) && distance((x', x)) < d → f(x') == g(x')) && has_complex_derivative(f, f', within(at(x), s)) → has_complex_derivative(g, f', within(at(x), s))"), t672))
}

///|
let has_complex_derivative_transform_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_TRANSFORM_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_TRANSFORM_WITHIN`
pub fn has_complex_derivative_transform_within() -> @kernel.Thm {
  has_complex_derivative_transform_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_TRANSFORM_WITHIN_OPEN
fn step_139() -> Unit raise {
  let t673 = @meson.asm_meson_tac(@list.List([@derivatives.has_derivative_transform_within_open()]))
  let t674 = @tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative()])), t673)
  has_complex_derivative_transform_within_open_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ z : Cart[Real, 2], open(s) && IN(z, s) && (∀ w : Cart[Real, 2], IN(w, s) → f(w) == g(w)) && has_complex_derivative(f, f', at(z)) → has_complex_derivative(g, f', at(z))"), t674))
}

///|
let has_complex_derivative_transform_within_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_TRANSFORM_WITHIN_OPEN")

///|
/// `HAS_COMPLEX_DERIVATIVE_TRANSFORM_WITHIN_OPEN`
pub fn has_complex_derivative_transform_within_open() -> @kernel.Thm {
  has_complex_derivative_transform_within_open_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_TRANSFORM_AT
fn step_140() -> Unit raise {
  let t675 = @meson.meson_tac(@list.List([has_complex_derivative_transform_within(), @sets.in_univ()]))
  let t676 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.within_univ())])), t675)
  has_complex_derivative_transform_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ d : Real, real_of_num(0) < d && (∀ x' : Cart[Real, 2], distance((x', x)) < d → f(x') == g(x')) && has_complex_derivative(f, f', at(x)) → has_complex_derivative(g, f', at(x))"), t676))
}

///|
let has_complex_derivative_transform_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_TRANSFORM_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_TRANSFORM_AT`
pub fn has_complex_derivative_transform_at() -> @kernel.Thm {
  has_complex_derivative_transform_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_ZERO_CONSTANT
fn step_141() -> Unit raise {
  let t677 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @derivatives.has_derivative_zero_constant()]))
  let t678 = @tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative(), @complexes.complex_mul_lzero()])), t677)
  has_complex_derivative_zero_constant_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, convex(s) && (∀ x : Cart[Real, 2], IN(x, s) → has_complex_derivative(f, Cx(real_of_num(0)), within(at(x), s))) → (∃ c : Cart[Real, 2], ∀ x : Cart[Real, 2], IN(x, s) → f(x) == c)"), t678))
}

///|
let has_complex_derivative_zero_constant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_ZERO_CONSTANT")

///|
/// `HAS_COMPLEX_DERIVATIVE_ZERO_CONSTANT`
pub fn has_complex_derivative_zero_constant() -> @kernel.Thm {
  has_complex_derivative_zero_constant_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_ZERO_UNIQUE
fn step_142() -> Unit raise {
  let t679 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @derivatives.has_derivative_zero_unique()]))
  let t680 = @tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative(), @complexes.complex_mul_lzero()])), t679)
  has_complex_derivative_zero_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ c : Cart[Real, 2], ∀ a : Cart[Real, 2], convex(s) && IN(a, s) && f(a) == c && (∀ x : Cart[Real, 2], IN(x, s) → has_complex_derivative(f, Cx(real_of_num(0)), within(at(x), s))) → (∀ x : Cart[Real, 2], IN(x, s) → f(x) == c)"), t680))
}

///|
let has_complex_derivative_zero_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_ZERO_UNIQUE")

///|
/// `HAS_COMPLEX_DERIVATIVE_ZERO_UNIQUE`
pub fn has_complex_derivative_zero_unique() -> @kernel.Thm {
  has_complex_derivative_zero_unique_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_ZERO_CONNECTED_CONSTANT
fn step_143() -> Unit raise {
  let t681 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @derivatives.has_derivative_zero_connected_constant()]))
  let t682 = @tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative(), @complexes.complex_mul_lzero()])), t681)
  has_complex_derivative_zero_connected_constant_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, open(s) && connected(s) && (∀ x : Cart[Real, 2], IN(x, s) → has_complex_derivative(f, Cx(real_of_num(0)), at(x))) → (∃ c : Cart[Real, 2], ∀ x : Cart[Real, 2], IN(x, s) → f(x) == c)"), t682))
}

///|
let has_complex_derivative_zero_connected_constant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_ZERO_CONNECTED_CONSTANT")

///|
/// `HAS_COMPLEX_DERIVATIVE_ZERO_CONNECTED_CONSTANT`
pub fn has_complex_derivative_zero_connected_constant() -> @kernel.Thm {
  has_complex_derivative_zero_connected_constant_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_ZERO_CONNECTED_UNIQUE
fn step_144() -> Unit raise {
  let t683 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @derivatives.has_derivative_zero_connected_unique()]))
  let t684 = @tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative(), @complexes.complex_mul_lzero()])), t683)
  has_complex_derivative_zero_connected_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ c : Cart[Real, 2], ∀ a : Cart[Real, 2], open(s) && connected(s) && IN(a, s) && f(a) == c && (∀ x : Cart[Real, 2], IN(x, s) → has_complex_derivative(f, Cx(real_of_num(0)), at(x))) → (∀ x : Cart[Real, 2], IN(x, s) → f(x) == c)"), t684))
}

///|
let has_complex_derivative_zero_connected_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_ZERO_CONNECTED_UNIQUE")

///|
/// `HAS_COMPLEX_DERIVATIVE_ZERO_CONNECTED_UNIQUE`
pub fn has_complex_derivative_zero_connected_unique() -> @kernel.Thm {
  has_complex_derivative_zero_connected_unique_c.get()
}

///|
/// COMPLEX_DIFF_CHAIN_WITHIN
fn step_145() -> Unit raise {
  let t692 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @complexes.complex_mul_assoc()]))
  let t689 = @drule.match_mp(@derivatives.diff_chain_within())
  let t691 = @tactics.disch_then(fn(x690 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x686 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s687 = @tactics.mp_tac(x686)
      fn(x688 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s687(x688)
      }
    })(t689(x690))
  })
  let t685 = @simp.rewrite_tac(@list.List([has_complex_derivative()]))
  let t693 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t685), t691), t692)
  complex_diff_chain_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g' : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', within(at(x), s)) && has_complex_derivative(g, g', within(at(f(x)), IMAGE(f, s))) → has_complex_derivative(o(g, f), g' * f', within(at(x), s))"), t693))
}

///|
let complex_diff_chain_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFF_CHAIN_WITHIN")

///|
/// `COMPLEX_DIFF_CHAIN_WITHIN`
pub fn complex_diff_chain_within() -> @kernel.Thm {
  complex_diff_chain_within_c.get()
}

///|
/// COMPLEX_DIFF_CHAIN_AT
fn step_146() -> Unit raise {
  let t694 = @meson.asm_meson_tac(@list.List([complex_diff_chain_within(), @sets.subset_univ(), has_complex_derivative_within_subset()]))
  let t695 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.within_univ())])), t694)
  complex_diff_chain_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g' : Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) && has_complex_derivative(g, g', at(f(x))) → has_complex_derivative(o(g, f), g' * f', at(x))"), t695))
}

///|
let complex_diff_chain_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFF_CHAIN_AT")

///|
/// `COMPLEX_DIFF_CHAIN_AT`
pub fn complex_diff_chain_at() -> @kernel.Thm {
  complex_diff_chain_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_CHAIN
fn step_147() -> Unit raise {
  let t698 = @meson.asm_meson_tac(@list.List([complex_diff_chain_within(), complex_diff_chain_at(), has_complex_derivative_at_within()]))
  let t697 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t696 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_def())]))
  let t699 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t696), t697), t698)
  has_complex_derivative_chain_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Cart[Real, 2]) -> Bool, ∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], (∀ x : Cart[Real, 2], P(x) → has_complex_derivative(g, (g' : (Cart[Real, 2]) -> Cart[Real, 2])(x), at(x))) → (∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, (f' : Cart[Real, 2]), within(at(x), s)) && P(f(x)) → has_complex_derivative((x : Cart[Real, 2]) => g(f(x)), f' * g'(f(x)), within(at(x), s))) && (∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) && P(f(x)) → has_complex_derivative((x : Cart[Real, 2]) => g(f(x)), f' * g'(f(x)), at(x)))"), t699))
}

///|
let has_complex_derivative_chain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_CHAIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_CHAIN`
pub fn has_complex_derivative_chain() -> @kernel.Thm {
  has_complex_derivative_chain_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_CHAIN_UNIV
fn step_148() -> Unit raise {
  let t700 = @simp.simp_tac(@list.List([]))
  let t701 = @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Cart[Real, 2]) => true"), has_complex_derivative_chain())), t700)
  has_complex_derivative_chain_univ_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], (∀ x : Cart[Real, 2], has_complex_derivative(g, (g' : (Cart[Real, 2]) -> Cart[Real, 2])(x), at(x))) → (∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, (f' : Cart[Real, 2]), within(at(x), s)) → has_complex_derivative((x : Cart[Real, 2]) => g(f(x)), f' * g'(f(x)), within(at(x), s))) && (∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) → has_complex_derivative((x : Cart[Real, 2]) => g(f(x)), f' * g'(f(x)), at(x)))"), t701))
}

///|
let has_complex_derivative_chain_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_CHAIN_UNIV")

///|
/// `HAS_COMPLEX_DERIVATIVE_CHAIN_UNIV`
pub fn has_complex_derivative_chain_univ() -> @kernel.Thm {
  has_complex_derivative_chain_univ_c.get()
}

///|
/// COMPLEX_DERIVATIVE_UNIQUE_AT
fn step_149() -> Unit raise {
  let t718 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rid()]))
  let t714 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t717 = @tactics.disch_then(fn(x716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x709 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s710 = @tactics.mp_tac(x709)
      fn(x711 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s710(x711)
      }
    })((fn(x715 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x712 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        fn(x713 : @kernel.Term) -> @kernel.Thm raise {
          @equal.ap_thm(x712, x713)
        }
      })(x715)(t714)
    })(x716))
  })
  let t706 = @drule.match_mp(@derivatives.frechet_derivative_unique_at())
  let t708 = @tactics.disch_then(fn(x707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s704 = @tactics.mp_tac(x703)
      fn(x705 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s704(x705)
      }
    })(t706(x707))
  })
  let t702 = @simp.rewrite_tac(@list.List([has_complex_derivative()]))
  let t719 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t702), t708), t717), t718)
  complex_derivative_unique_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ f'' : Cart[Real, 2], has_complex_derivative(f, f', at(z)) && has_complex_derivative(f, f'', at(z)) → f' == f''"), t719))
}

///|
let complex_derivative_unique_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_UNIQUE_AT")

///|
/// `COMPLEX_DERIVATIVE_UNIQUE_AT`
pub fn complex_derivative_unique_at() -> @kernel.Thm {
  complex_derivative_unique_at_c.get()
}

///|
/// HIGHER_COMPLEX_DERIVATIVE_1
fn step_150() -> Unit raise {
  let t720 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), higher_complex_derivative()]))
  higher_complex_derivative_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], higher_complex_derivative(1, f, z) == complex_derivative(f, z)"), t720))
}

///|
let higher_complex_derivative_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HIGHER_COMPLEX_DERIVATIVE_1")

///|
/// `HIGHER_COMPLEX_DERIVATIVE_1`
pub fn higher_complex_derivative_1() -> @kernel.Thm {
  higher_complex_derivative_1_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_WITHIN
fn step_151() -> Unit raise {
  let t730 = @simp.rewrite_tac(@list.List([@real.real_abs_inv(), @complexes.complex_norm_mul(), @vectors.real_abs_norm(), @complexes.complex_norm_inv(), @vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, 2]) - ((b : Cart[Real, 2]) + (c : Cart[Real, 2])) == a - b - c"))]))
  let t729 = @simp.simp_tac(@list.List([@complexes.complex_field(@term_syntax.parse_term("!((x : Cart[Real, 2]) == (a : Cart[Real, 2])) → (y : Cart[Real, 2]) / (x - a) - (z : Cart[Real, 2]) == inv(x - a) * (y - z * (x - a))"))]))
  let t728 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t727 = @simp.rewrite_tac(@list.List([@topology.lim_within(), @vectors.dist(), @vectors.vector_sub_rzero(), @vectors.norm_mul()]))
  let t726 = @simp.gen_rewrite_tac(fn(x723 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s724 = @equal.rand_conv(x723)
    fn(x725 : @kernel.Term) -> @kernel.Thm raise {
      s724(x725)
    }
  }, @list.List([@topology.lim_null()]))
  let t722 = @simp.rewrite_tac(@list.List([@complexes.linear_complex_mul()]))
  let t721 = @tactics.repeat_tac(@tactics.gen_tac)
  let t731 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative(), @derivatives.has_derivative_within()])), t721), t722), t726), t727), t728), t729), t730)
  has_complex_derivative_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ a : Cart[Real, 2], has_complex_derivative(f, (f' : Cart[Real, 2]), within(at(a), s)) == op_minus_minus_gt((x : Cart[Real, 2]) => (f(x) - f(a)) / (x - a), f', within(at(a), s))"), t731))
}

///|
let has_complex_derivative_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_WITHIN`
pub fn has_complex_derivative_within() -> @kernel.Thm {
  has_complex_derivative_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_AT
fn step_152() -> Unit raise {
  let t732 = @simp.rewrite_tac(@list.List([has_complex_derivative_within()]))
  let t733 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.within_univ())])), t732)
  has_complex_derivative_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ a : Cart[Real, 2], has_complex_derivative(f, (f' : Cart[Real, 2]), at(a)) == op_minus_minus_gt((x : Cart[Real, 2]) => (f(x) - f(a)) / (x - a), f', at(a))"), t733))
}

///|
let has_complex_derivative_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_AT`
pub fn has_complex_derivative_at() -> @kernel.Thm {
  has_complex_derivative_at_c.get()
}

///|
/// HAS_DERIVATIVE_COMPLEX_CMUL
fn step_153() -> Unit raise {
  let t735 = @simp.rewrite_tac(@list.List([@complexes.linear_complex_mul()]))
  let t734 = @tactics.match_mp_tac(@derivatives.has_derivative_linear())
  let t736 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t734), t735)
  has_derivative_complex_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[Cart[Real, 2]], ∀ c : Cart[Real, 2], has_derivative((x : Cart[Real, 2]) => c * x, (x : Cart[Real, 2]) => c * x, net)"), t736))
}

///|
let has_derivative_complex_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_DERIVATIVE_COMPLEX_CMUL")

///|
/// `HAS_DERIVATIVE_COMPLEX_CMUL`
pub fn has_derivative_complex_cmul() -> @kernel.Thm {
  has_derivative_complex_cmul_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_LINEAR
fn step_154() -> Unit raise {
  let t740 = @tactics.conv_tac(@complexes.complex_ring)
  let t739 = @simp.rewrite_tac(@list.List([@vectors.linear(), @complexes.complex_cmul()]))
  let t738 = @tactics.match_mp_tac(@derivatives.has_derivative_linear())
  let t737 = @simp.rewrite_tac(@list.List([has_complex_derivative()]))
  let t741 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t737), t738), t739), t740)
  has_complex_derivative_linear_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[Cart[Real, 2]], ∀ c : Cart[Real, 2], has_complex_derivative((x : Cart[Real, 2]) => c * x, c, net)"), t741))
}

///|
let has_complex_derivative_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_LINEAR")

///|
/// `HAS_COMPLEX_DERIVATIVE_LINEAR`
pub fn has_complex_derivative_linear() -> @kernel.Thm {
  has_complex_derivative_linear_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_LMUL_WITHIN
fn step_155() -> Unit raise {
  let t751 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t748 = @drule.match_mp(complex_diff_chain_within())
  let t750 = @tactics.disch_then(fn(x749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x745 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s746 = @tactics.mp_tac(x745)
      fn(x747 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s746(x747)
      }
    })(t748(x749))
  })
  let t744 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) → (c : Bool)) == (b && a → c)"))]))
  let t742 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t743 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("within(at((f : (Cart[Real, 2]) -> Cart[Real, 2])((x : Cart[Real, 2]))), IMAGE(f, (s : (Cart[Real, 2]) -> Bool)))"), t742]), has_complex_derivative_linear()))
  let t752 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t743), t744), t750), t751)
  has_complex_derivative_lmul_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', within(at(x), s)) → has_complex_derivative((x : Cart[Real, 2]) => c * f(x), c * f', within(at(x), s))"), t752))
}

///|
let has_complex_derivative_lmul_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_LMUL_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_LMUL_WITHIN`
pub fn has_complex_derivative_lmul_within() -> @kernel.Thm {
  has_complex_derivative_lmul_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_LMUL_AT
fn step_156() -> Unit raise {
  let t753 = @simp.rewrite_tac(@list.List([has_complex_derivative_lmul_within()]))
  let t754 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.within_univ())])), t753)
  has_complex_derivative_lmul_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) → has_complex_derivative((x : Cart[Real, 2]) => c * f(x), c * f', at(x))"), t754))
}

///|
let has_complex_derivative_lmul_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_LMUL_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_LMUL_AT`
pub fn has_complex_derivative_lmul_at() -> @kernel.Thm {
  has_complex_derivative_lmul_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_RMUL_WITHIN
fn step_157() -> Unit raise {
  let t755 = @simp.rewrite_tac(@list.List([has_complex_derivative_lmul_within()]))
  let t756 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t755)
  has_complex_derivative_rmul_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', within(at(x), s)) → has_complex_derivative((x : Cart[Real, 2]) => f(x) * c, f' * c, within(at(x), s))"), t756))
}

///|
let has_complex_derivative_rmul_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_RMUL_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_RMUL_WITHIN`
pub fn has_complex_derivative_rmul_within() -> @kernel.Thm {
  has_complex_derivative_rmul_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_RMUL_AT
fn step_158() -> Unit raise {
  let t757 = @simp.rewrite_tac(@list.List([has_complex_derivative_lmul_at()]))
  let t758 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t757)
  has_complex_derivative_rmul_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) → has_complex_derivative((x : Cart[Real, 2]) => f(x) * c, f' * c, at(x))"), t758))
}

///|
let has_complex_derivative_rmul_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_RMUL_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_RMUL_AT`
pub fn has_complex_derivative_rmul_at() -> @kernel.Thm {
  has_complex_derivative_rmul_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_CDIV_WITHIN
fn step_159() -> Unit raise {
  let t759 = @simp.simp_tac(@list.List([@complexes.complex_div(), has_complex_derivative_rmul_within()]))
  has_complex_derivative_cdiv_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', within(at(x), s)) → has_complex_derivative((x : Cart[Real, 2]) => f(x) / c, f' / c, within(at(x), s))"), t759))
}

///|
let has_complex_derivative_cdiv_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_CDIV_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_CDIV_WITHIN`
pub fn has_complex_derivative_cdiv_within() -> @kernel.Thm {
  has_complex_derivative_cdiv_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_CDIV_AT
fn step_160() -> Unit raise {
  let t760 = @simp.simp_tac(@list.List([@complexes.complex_div(), has_complex_derivative_rmul_at()]))
  has_complex_derivative_cdiv_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) → has_complex_derivative((x : Cart[Real, 2]) => f(x) / c, f' / c, at(x))"), t760))
}

///|
let has_complex_derivative_cdiv_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_CDIV_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_CDIV_AT`
pub fn has_complex_derivative_cdiv_at() -> @kernel.Thm {
  has_complex_derivative_cdiv_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_ID
fn step_161() -> Unit raise {
  let t761 = @simp.rewrite_tac(@list.List([has_complex_derivative(), @derivatives.has_derivative_id(), @complexes.complex_mul_lid()]))
  has_complex_derivative_id_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[Cart[Real, 2]], has_complex_derivative((x : Cart[Real, 2]) => x, Cx(real_of_num(1)), net)"), t761))
}

///|
let has_complex_derivative_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_ID")

///|
/// `HAS_COMPLEX_DERIVATIVE_ID`
pub fn has_complex_derivative_id() -> @kernel.Thm {
  has_complex_derivative_id_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_CONST
fn step_162() -> Unit raise {
  let t762 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @derivatives.has_derivative_const()]))
  let t763 = @tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative(), @complexes.complex_mul_lzero()])), t762)
  has_complex_derivative_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ net : Net[Cart[Real, 2]], has_complex_derivative((x : Cart[Real, 2]) => c, Cx(real_of_num(0)), net)"), t763))
}

///|
let has_complex_derivative_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_CONST")

///|
/// `HAS_COMPLEX_DERIVATIVE_CONST`
pub fn has_complex_derivative_const() -> @kernel.Thm {
  has_complex_derivative_const_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_NEG
fn step_163() -> Unit raise {
  let t764 = @simp.simp_tac(@list.List([has_complex_derivative(), @complexes.complex_mul_lneg(), @derivatives.has_derivative_neg()]))
  has_complex_derivative_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ net : Net[Cart[Real, 2]], has_complex_derivative(f, f', net) → has_complex_derivative((x : Cart[Real, 2]) => -f(x), -f', net)"), t764))
}

///|
let has_complex_derivative_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_NEG")

///|
/// `HAS_COMPLEX_DERIVATIVE_NEG`
pub fn has_complex_derivative_neg() -> @kernel.Thm {
  has_complex_derivative_neg_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_ADD
fn step_164() -> Unit raise {
  let t765 = @simp.simp_tac(@list.List([has_complex_derivative(), @complexes.complex_add_rdistrib(), @derivatives.has_derivative_add()]))
  has_complex_derivative_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g' : Cart[Real, 2], ∀ net : Net[Cart[Real, 2]], has_complex_derivative(f, f', net) && has_complex_derivative(g, g', net) → has_complex_derivative((x : Cart[Real, 2]) => f(x) + g(x), f' + g', net)"), t765))
}

///|
let has_complex_derivative_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_ADD")

///|
/// `HAS_COMPLEX_DERIVATIVE_ADD`
pub fn has_complex_derivative_add() -> @kernel.Thm {
  has_complex_derivative_add_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_SUB
fn step_165() -> Unit raise {
  let t766 = @simp.simp_tac(@list.List([has_complex_derivative(), @complexes.complex_sub_rdistrib(), @derivatives.has_derivative_sub()]))
  has_complex_derivative_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g' : Cart[Real, 2], ∀ net : Net[Cart[Real, 2]], has_complex_derivative(f, f', net) && has_complex_derivative(g, g', net) → has_complex_derivative((x : Cart[Real, 2]) => f(x) - g(x), f' - g', net)"), t766))
}

///|
let has_complex_derivative_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_SUB")

///|
/// `HAS_COMPLEX_DERIVATIVE_SUB`
pub fn has_complex_derivative_sub() -> @kernel.Thm {
  has_complex_derivative_sub_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_MUL_WITHIN
fn step_166() -> Unit raise {
  let t785 = @tactics.conv_tac(@complexes.complex_ring)
  let t784 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t783 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t780 = @drule.match_mp(@derivatives.has_derivative_bilinear_within())
  let t782 = @tactics.disch_then(fn(x781 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x777 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s778 = @tactics.mp_tac(x777)
      fn(x779 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s778(x779)
      }
    })(t780(x781))
  })
  let t776 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t775 = @tactics.disch_then(fn(x774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s769 = @tactics.mp_tac(x768)
      fn(x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s769(x770)
      }
    })((fn(x773 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x771 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x772 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.conj(x771, x772)
        }
      })(x773)(@complexes.bilinear_complex_mul())
    })(x774))
  })
  let t767 = @simp.simp_tac(@list.List([has_complex_derivative()]))
  let t786 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t767), t775), t776), t782), t783), @tactics.ap_thm_tac), @tactics.ap_term_tac), t784), t785)
  has_complex_derivative_mul_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g' : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', within(at(x), s)) && has_complex_derivative(g, g', within(at(x), s)) → has_complex_derivative((x : Cart[Real, 2]) => f(x) * g(x), f(x) * g' + f' * g(x), within(at(x), s))"), t786))
}

///|
let has_complex_derivative_mul_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_MUL_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_MUL_WITHIN`
pub fn has_complex_derivative_mul_within() -> @kernel.Thm {
  has_complex_derivative_mul_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_MUL_AT
fn step_167() -> Unit raise {
  let t787 = @simp.rewrite_tac(@list.List([has_complex_derivative_mul_within()]))
  let t788 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.within_univ())])), t787)
  has_complex_derivative_mul_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g' : Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) && has_complex_derivative(g, g', at(x)) → has_complex_derivative((x : Cart[Real, 2]) => f(x) * g(x), f(x) * g' + f' * g(x), at(x))"), t788))
}

///|
let has_complex_derivative_mul_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_MUL_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_MUL_AT`
pub fn has_complex_derivative_mul_at() -> @kernel.Thm {
  has_complex_derivative_mul_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_POW_WITHIN
fn step_168() -> Unit raise {
  let t812 = @tactics.conv_tac(@complexes.complex_field)
  let t811 = @simp.rewrite_tac(@list.List([@arith.suc_sub1(), @complexes.complex_pow()]))
  let t810 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t809 = @simp.rewrite_tac(@list.List([@complexes.cx_add()]))
  let t807 = @term_syntax.parse_term("(n : Num)")
  let t808 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t807)
  let t806 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_ac(), @equal.gsym(@real.real_of_num_suc())]))
  let t805 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t804 = @simp.rewrite_tac(@list.List([@arith.suc_sub1()]))
  let t801 = @drule.match_mp(has_complex_derivative_mul_within())
  let t803 = @tactics.disch_then(fn(x802 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s799 = @tactics.mp_tac(x798)
      fn(x800 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s799(x800)
      }
    })(t801(x802))
  })
  let t797 = @tactics.pop_assum_list(fn(x796 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x792 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s793 = @tactics.mp_tac(x792)
      fn(x794 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s793(x794)
      }
    })(((x795 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x795))(x796))
  })
  let t791 = @simp.rewrite_tac(@list.List([has_complex_derivative_const(), @complexes.complex_mul_lzero()]))
  let t790 = @simp.rewrite_tac(@list.List([@complexes.complex_pow()]))
  let t789 = @tactics.repeat_tac(@tactics.gen_tac)
  let t813 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), t789), @tactics.disch_tac), @nums.induct_tac), t790), t791), t797), t803), t804), t805), @tactics.ap_thm_tac), @tactics.binop_tac), t806), t808), t809), @nums.induct_tac), t810), t811), t812)
  has_complex_derivative_pow_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ n : Num, has_complex_derivative(f, f', within(at(x), s)) → has_complex_derivative((x : Cart[Real, 2]) => pow(f(x), n), Cx(real_of_num(n)) * (pow(f(x), n - 1) * f'), within(at(x), s))"), t813))
}

///|
let has_complex_derivative_pow_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_POW_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_POW_WITHIN`
pub fn has_complex_derivative_pow_within() -> @kernel.Thm {
  has_complex_derivative_pow_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_POW_AT
fn step_169() -> Unit raise {
  let t814 = @simp.rewrite_tac(@list.List([has_complex_derivative_pow_within()]))
  let t815 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.within_univ())])), t814)
  has_complex_derivative_pow_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ n : Num, has_complex_derivative(f, f', at(x)) → has_complex_derivative((x : Cart[Real, 2]) => pow(f(x), n), Cx(real_of_num(n)) * (pow(f(x), n - 1) * f'), at(x))"), t815))
}

///|
let has_complex_derivative_pow_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_POW_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_POW_AT`
pub fn has_complex_derivative_pow_at() -> @kernel.Thm {
  has_complex_derivative_pow_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_INV_BASIC
fn step_170() -> Unit raise {
  let t848 = @tactics.conv_tac(@calc_rat.real_field)
  let t846 = @term_syntax.parse_term("(m : Real) == inv(pow(norm((x : Cart[Real, 2])), 2) * norm((x' : Cart[Real, 2])))")
  let t847 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(n : Real) == norm((x' : Cart[Real, 2]) - (x : Cart[Real, 2]))"), t846]))
  let t845 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("((p : Bool) → (x : Real) == (y : Real)) → (p → x < (e : Real)) == (p → y < e)")))
  let t844 = @tactics.replicate_tac(2, @tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac), @tactics.ap_term_tac))
  let t843 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @real.real_abs_inv(), @vectors.real_abs_norm()]))
  let t842 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_inv(), @complexes.complex_norm_pow()]))
  let t841 = @simp.rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_rzero()]))
  let t840 = @simp.rewrite_tac(@list.List([@topology.lim_at()]))
  let t839 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t837 = @tactics.conv_tac(@complexes.complex_field)
  let t838 = @list.List([@tactics.then_tac(@tactics.then_tac(lim_tac, @tactics.pop_assum(fn(x834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s835 = @tactics.mp_tac(x834)
    fn(x836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s835(x836)
    }
  })), t837), @tactics.all_tac])
  let t833 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_gt((y : Cart[Real, 2]) => inv(pow((x : Cart[Real, 2]), 2) * y) * (y - x), Cx(real_of_num(0)), at(x))"), fn(x830 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s831 = @tactics.mp_tac(x830)
    fn(x832 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s831(x832)
    }
  })
  let t828 = @tactics.conv_tac(@complexes.complex_field)
  let t829 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s826 = @tactics.mp_tac(x825)
    fn(x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s826(x827)
    }
  }), t828), @tactics.all_tac])
  let t824 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_cmul()]))
  let t822 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t823 = @tactics.map_every(fn(x819 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s820 = @tactics.exists_tac(x819)
    fn(x821 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s820(x821)
    }
  }, @list.List([@term_syntax.parse_term("(y : Cart[Real, 2]) => op_pct(inv(norm(y - (x : Cart[Real, 2]))), inv(pow(x, 2) * y)) * pow(y - x, 2)"), t822]))
  let t818 = @tactics.match_mp_tac(@topology.lim_transform_away_at())
  let t817 = @simp.rewrite_tac(@list.List([@complexes.linear_complex_mul(), @complexes.complex_vec_0()]))
  let t816 = @simp.rewrite_tac(@list.List([has_complex_derivative(), @derivatives.has_derivative_at()]))
  let t849 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t816), t817), t818), t823), t824), @tactics.conj_tac), t829), t833), t838), t839), t840), t841), t842), t843), t844), @tactics.ap_term_tac), @tactics.abs_tac), t845), t847), t848)
  has_complex_derivative_inv_basic_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], !(x == Cx(real_of_num(0))) → has_complex_derivative(inv, -inv(pow(x, 2)), at(x))"), t849))
}

///|
let has_complex_derivative_inv_basic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_INV_BASIC")

///|
/// `HAS_COMPLEX_DERIVATIVE_INV_BASIC`
pub fn has_complex_derivative_inv_basic() -> @kernel.Thm {
  has_complex_derivative_inv_basic_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_INV_WITHIN
fn step_171() -> Unit raise {
  let t855 = @simp.asm_simp_tac(@list.List([has_complex_derivative_inv_basic()]))
  let t854 = @tactics.match_mp_tac(has_complex_derivative_at_within())
  let t853 = @simp.asm_rewrite_tac(@list.List([]))
  let t852 = @tactics.match_mp_tac(complex_diff_chain_within())
  let t851 = @simp.asm_simp_tac(@list.List([@complexes.complex_field(@term_syntax.parse_term("!((g : Cart[Real, 2]) == Cx(real_of_num(0))) → -(f : Cart[Real, 2]) / pow(g, 2) == -inv(pow(g, 2)) * f"))]))
  let t850 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@trivia.o_def())]))
  let t856 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t850), t851), t852), t853), t854), t855)
  has_complex_derivative_inv_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', within(at(x), s)) && !(f(x) == Cx(real_of_num(0))) → has_complex_derivative((x : Cart[Real, 2]) => inv(f(x)), -f' / pow(f(x), 2), within(at(x), s))"), t856))
}

///|
let has_complex_derivative_inv_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_INV_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_INV_WITHIN`
pub fn has_complex_derivative_inv_within() -> @kernel.Thm {
  has_complex_derivative_inv_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_INV_AT
fn step_172() -> Unit raise {
  let t857 = @simp.rewrite_tac(@list.List([has_complex_derivative_inv_within()]))
  let t858 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.within_univ())])), t857)
  has_complex_derivative_inv_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) && !(f(x) == Cx(real_of_num(0))) → has_complex_derivative((x : Cart[Real, 2]) => inv(f(x)), -f' / pow(f(x), 2), at(x))"), t858))
}

///|
let has_complex_derivative_inv_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_INV_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_INV_AT`
pub fn has_complex_derivative_inv_at() -> @kernel.Thm {
  has_complex_derivative_inv_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_DIV_WITHIN
fn step_173() -> Unit raise {
  let t890 = @tactics.conv_tac(@complexes.complex_field)
  let t889 = @tactics.pop_assum(fn(x886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s887 = @tactics.mp_tac(x886)
    fn(x888 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s887(x888)
    }
  })
  let t885 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t884 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t881 = @drule.match_mp(has_complex_derivative_mul_within())
  let t883 = @tactics.disch_then(fn(x882 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x878 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s879 = @tactics.mp_tac(x878)
      fn(x880 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s879(x880)
      }
    })(t881(x882))
  })
  let t877 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t876 = @tactics.undisch_tac(@term_syntax.parse_term("has_complex_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), (f' : Cart[Real, 2]), within(at((x : Cart[Real, 2])), (s : (Cart[Real, 2]) -> Bool)))"))
  let t873 = @drule.match_mp(has_complex_derivative_inv_within())
  let t875 = @tactics.disch_then(fn(x874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s871 = @tactics.mp_tac(x870)
      fn(x872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s871(x872)
      }
    })(t873(x874))
  })
  let t869 = @tactics.disch_then(fn(x866 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x866
    let t868 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(@bool.conjunct2(th)), t868)
  })
  let t865 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s860 = @tactics.assume_tac(x859)
    fn(x861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s860(x861)
    }
  }, fn(x862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s863 = @tactics.mp_tac(x862)
    fn(x864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s863(x864)
    }
  }))
  let t891 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t865), t869), t875), t876), t877), t883), t884), t885), @tactics.ap_thm_tac), @tactics.ap_term_tac), t889), t890)
  has_complex_derivative_div_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g' : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', within(at(x), s)) && has_complex_derivative(g, g', within(at(x), s)) && !(g(x) == Cx(real_of_num(0))) → has_complex_derivative((x : Cart[Real, 2]) => f(x) / g(x), (f' * g(x) - f(x) * g') / pow(g(x), 2), within(at(x), s))"), t891))
}

///|
let has_complex_derivative_div_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_DIV_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_DIV_WITHIN`
pub fn has_complex_derivative_div_within() -> @kernel.Thm {
  has_complex_derivative_div_within_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_DIV_AT
fn step_174() -> Unit raise {
  let t892 = @simp.rewrite_tac(@list.List([has_complex_derivative_div_within()]))
  let t893 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.within_univ())])), t892)
  has_complex_derivative_div_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g' : Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) && has_complex_derivative(g, g', at(x)) && !(g(x) == Cx(real_of_num(0))) → has_complex_derivative((x : Cart[Real, 2]) => f(x) / g(x), (f' * g(x) - f(x) * g') / pow(g(x), 2), at(x))"), t893))
}

///|
let has_complex_derivative_div_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_DIV_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_DIV_AT`
pub fn has_complex_derivative_div_at() -> @kernel.Thm {
  has_complex_derivative_div_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_VSUM
fn step_175() -> Unit raise {
  let t901 = @simp.rewrite_tac(@list.List([]))
  let t898 = @drule.match_mp(@derivatives.has_derivative_vsum())
  let t900 = @tactics.disch_then(fn(x899 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s896 = @tactics.mp_tac(x895)
      fn(x897 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s896(x897)
      }
    })(t898(x899))
  })
  let t894 = @tactics.repeat_tac(@tactics.gen_tac)
  let t902 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@complexes.vsum_complex_rmul()), has_complex_derivative()])), t894), t900), t901)
  has_complex_derivative_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, Cart[Real, 2]) -> Cart[Real, 2], ∀ net : Net[Cart[Real, 2]], ∀ s : (_) -> Bool, FINITE(s) && (∀ a : _, IN(a, s) → has_complex_derivative(f(a), (f' : (_) -> Cart[Real, 2])(a), net)) → has_complex_derivative((x : Cart[Real, 2]) => vsum(s, (a : _) => f(a, x)), vsum(s, f'), net)"), t902))
}

///|
let has_complex_derivative_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_VSUM")

///|
/// `HAS_COMPLEX_DERIVATIVE_VSUM`
pub fn has_complex_derivative_vsum() -> @kernel.Thm {
  has_complex_derivative_vsum_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_LINEAR
fn step_176() -> Unit raise {
  let t903 = @meson.meson_tac(@list.List([has_complex_derivative_linear()]))
  let t904 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t903)
  complex_differentiable_linear_c.set(@tactics.prove(@term_syntax.parse_term("complex_differentiable((z : Cart[Real, 2]) => (c : Cart[Real, 2]) * z, (p : Net[Cart[Real, 2]]))"), t904))
}

///|
let complex_differentiable_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_LINEAR")

///|
/// `COMPLEX_DIFFERENTIABLE_LINEAR`
pub fn complex_differentiable_linear() -> @kernel.Thm {
  complex_differentiable_linear_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_CONST
fn step_177() -> Unit raise {
  let t905 = @meson.meson_tac(@list.List([has_complex_derivative_const()]))
  let t906 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t905)
  complex_differentiable_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ net : Net[Cart[Real, 2]], complex_differentiable((z : Cart[Real, 2]) => c, net)"), t906))
}

///|
let complex_differentiable_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_CONST")

///|
/// `COMPLEX_DIFFERENTIABLE_CONST`
pub fn complex_differentiable_const() -> @kernel.Thm {
  complex_differentiable_const_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_ID
fn step_178() -> Unit raise {
  let t907 = @meson.meson_tac(@list.List([has_complex_derivative_id()]))
  let t908 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t907)
  complex_differentiable_id_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[Cart[Real, 2]], complex_differentiable((z : Cart[Real, 2]) => z, net)"), t908))
}

///|
let complex_differentiable_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_ID")

///|
/// `COMPLEX_DIFFERENTIABLE_ID`
pub fn complex_differentiable_id() -> @kernel.Thm {
  complex_differentiable_id_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_NEG
fn step_179() -> Unit raise {
  let t909 = @meson.meson_tac(@list.List([has_complex_derivative_neg()]))
  let t910 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t909)
  complex_differentiable_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ net : Net[Cart[Real, 2]], complex_differentiable(f, net) → complex_differentiable((z : Cart[Real, 2]) => -f(z), net)"), t910))
}

///|
let complex_differentiable_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_NEG")

///|
/// `COMPLEX_DIFFERENTIABLE_NEG`
pub fn complex_differentiable_neg() -> @kernel.Thm {
  complex_differentiable_neg_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_ADD
fn step_180() -> Unit raise {
  let t911 = @meson.meson_tac(@list.List([has_complex_derivative_add()]))
  let t912 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t911)
  complex_differentiable_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ net : Net[Cart[Real, 2]], complex_differentiable(f, net) && complex_differentiable(g, net) → complex_differentiable((z : Cart[Real, 2]) => f(z) + g(z), net)"), t912))
}

///|
let complex_differentiable_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_ADD")

///|
/// `COMPLEX_DIFFERENTIABLE_ADD`
pub fn complex_differentiable_add() -> @kernel.Thm {
  complex_differentiable_add_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_SUB
fn step_181() -> Unit raise {
  let t913 = @meson.meson_tac(@list.List([has_complex_derivative_sub()]))
  let t914 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t913)
  complex_differentiable_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ net : Net[Cart[Real, 2]], complex_differentiable(f, net) && complex_differentiable(g, net) → complex_differentiable((z : Cart[Real, 2]) => f(z) - g(z), net)"), t914))
}

///|
let complex_differentiable_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_SUB")

///|
/// `COMPLEX_DIFFERENTIABLE_SUB`
pub fn complex_differentiable_sub() -> @kernel.Thm {
  complex_differentiable_sub_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_INV_WITHIN
fn step_182() -> Unit raise {
  let t915 = @meson.meson_tac(@list.List([has_complex_derivative_inv_within()]))
  let t916 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t915)
  complex_differentiable_inv_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, complex_differentiable(f, within(at(z), s)) && !(f(z) == Cx(real_of_num(0))) → complex_differentiable((z : Cart[Real, 2]) => inv(f(z)), within(at(z), s))"), t916))
}

///|
let complex_differentiable_inv_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_INV_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_INV_WITHIN`
pub fn complex_differentiable_inv_within() -> @kernel.Thm {
  complex_differentiable_inv_within_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_MUL_WITHIN
fn step_183() -> Unit raise {
  let t917 = @meson.meson_tac(@list.List([has_complex_derivative_mul_within()]))
  let t918 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t917)
  complex_differentiable_mul_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, complex_differentiable(f, within(at(z), s)) && complex_differentiable(g, within(at(z), s)) → complex_differentiable((z : Cart[Real, 2]) => f(z) * g(z), within(at(z), s))"), t918))
}

///|
let complex_differentiable_mul_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_MUL_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_MUL_WITHIN`
pub fn complex_differentiable_mul_within() -> @kernel.Thm {
  complex_differentiable_mul_within_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_DIV_WITHIN
fn step_184() -> Unit raise {
  let t919 = @meson.meson_tac(@list.List([has_complex_derivative_div_within()]))
  let t920 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t919)
  complex_differentiable_div_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, complex_differentiable(f, within(at(z), s)) && complex_differentiable(g, within(at(z), s)) && !(g(z) == Cx(real_of_num(0))) → complex_differentiable((z : Cart[Real, 2]) => f(z) / g(z), within(at(z), s))"), t920))
}

///|
let complex_differentiable_div_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_DIV_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_DIV_WITHIN`
pub fn complex_differentiable_div_within() -> @kernel.Thm {
  complex_differentiable_div_within_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_POW_WITHIN
fn step_185() -> Unit raise {
  let t921 = @meson.meson_tac(@list.List([has_complex_derivative_pow_within()]))
  let t922 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t921)
  complex_differentiable_pow_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ n : Num, ∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, complex_differentiable(f, within(at(z), s)) → complex_differentiable((z : Cart[Real, 2]) => pow(f(z), n), within(at(z), s))"), t922))
}

///|
let complex_differentiable_pow_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_POW_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_POW_WITHIN`
pub fn complex_differentiable_pow_within() -> @kernel.Thm {
  complex_differentiable_pow_within_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_CPRODUCT_WITHIN
fn step_186() -> Unit raise {
  let t924 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses(), complex_differentiable_const(), @sets.forall_in_insert(), @class.eta_ax(), complex_differentiable_mul_within()]))
  let t923 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t925 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))), t923), t924)
  complex_differentiable_cproduct_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, Cart[Real, 2]) -> Cart[Real, 2], ∀ k : (A) -> Bool, ∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, FINITE(k) && (∀ i : A, IN(i, k) → complex_differentiable(f(i), within(at(z), s))) → complex_differentiable((z : Cart[Real, 2]) => cproduct(k, (i : A) => f(i, z)), within(at(z), s))"), t925))
}

///|
let complex_differentiable_cproduct_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_CPRODUCT_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_CPRODUCT_WITHIN`
pub fn complex_differentiable_cproduct_within() -> @kernel.Thm {
  complex_differentiable_cproduct_within_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_TRANSFORM_WITHIN
fn step_187() -> Unit raise {
  let t926 = @meson.meson_tac(@list.List([has_complex_derivative_transform_within()]))
  let t927 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t926)
  complex_differentiable_transform_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ d : Real, real_of_num(0) < d && IN(x, s) && (∀ x' : Cart[Real, 2], IN(x', s) && distance((x', x)) < d → f(x') == g(x')) && complex_differentiable(f, within(at(x), s)) → complex_differentiable(g, within(at(x), s))"), t927))
}

///|
let complex_differentiable_transform_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_TRANSFORM_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_TRANSFORM_WITHIN`
pub fn complex_differentiable_transform_within() -> @kernel.Thm {
  complex_differentiable_transform_within_c.get()
}

///|
/// HOLOMORPHIC_TRANSFORM
fn step_188() -> Unit raise {
  let t947 = @simp.asm_simp_tac(@list.List([@real.real_lt_01()]))
  let t945 = @term_syntax.parse_term("real_of_num(1)")
  let t946 = @tactics.map_every(fn(x942 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s943 = @tactics.exists_tac(x942)
    fn(x944 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s943(x944)
    }
  }, @list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t945]))
  let t941 = @tactics.match_mp_tac(complex_differentiable_transform_within())
  let t940 = @simp.asm_rewrite_tac(@list.List([]))
  let t939 = @tactics.disch_then(fn(x937 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x937
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t936 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t935 = @simp.rewrite_tac(@list.List([holomorphic_on(), @equal.gsym(complex_differentiable())]))
  let t934 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s929 = @tactics.assume_tac(x928)
    fn(x930 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s929(x930)
    }
  }, fn(x931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s932 = @tactics.mp_tac(x931)
    fn(x933 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s932(x933)
    }
  }))
  let t948 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t934), t935), t936), @tactics.gen_tac), t939), t940), @tactics.disch_tac), t941), t946), t947)
  holomorphic_transform_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, (∀ x : Cart[Real, 2], IN(x, s) → f(x) == g(x)) && holomorphic_on(f, s) → holomorphic_on(g, s)"), t948))
}

///|
let holomorphic_transform_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_TRANSFORM")

///|
/// `HOLOMORPHIC_TRANSFORM`
pub fn holomorphic_transform() -> @kernel.Thm {
  holomorphic_transform_c.get()
}

///|
/// HOLOMORPHIC_EQ
fn step_189() -> Unit raise {
  let t949 = @meson.meson_tac(@list.List([holomorphic_transform()]))
  holomorphic_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, (∀ x : Cart[Real, 2], IN(x, s) → f(x) == g(x)) → holomorphic_on(f, s) == holomorphic_on(g, s)"), t949))
}

///|
let holomorphic_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_EQ")

///|
/// `HOLOMORPHIC_EQ`
pub fn holomorphic_eq() -> @kernel.Thm {
  holomorphic_eq_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_INV_AT
fn step_190() -> Unit raise {
  let t950 = @meson.meson_tac(@list.List([has_complex_derivative_inv_at()]))
  let t951 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t950)
  complex_differentiable_inv_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) && !(f(z) == Cx(real_of_num(0))) → complex_differentiable((z : Cart[Real, 2]) => inv(f(z)), at(z))"), t951))
}

///|
let complex_differentiable_inv_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_INV_AT")

///|
/// `COMPLEX_DIFFERENTIABLE_INV_AT`
pub fn complex_differentiable_inv_at() -> @kernel.Thm {
  complex_differentiable_inv_at_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_MUL_AT
fn step_191() -> Unit raise {
  let t952 = @meson.meson_tac(@list.List([has_complex_derivative_mul_at()]))
  let t953 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t952)
  complex_differentiable_mul_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) && complex_differentiable(g, at(z)) → complex_differentiable((z : Cart[Real, 2]) => f(z) * g(z), at(z))"), t953))
}

///|
let complex_differentiable_mul_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_MUL_AT")

///|
/// `COMPLEX_DIFFERENTIABLE_MUL_AT`
pub fn complex_differentiable_mul_at() -> @kernel.Thm {
  complex_differentiable_mul_at_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_DIV_AT
fn step_192() -> Unit raise {
  let t954 = @meson.meson_tac(@list.List([has_complex_derivative_div_at()]))
  let t955 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t954)
  complex_differentiable_div_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) && complex_differentiable(g, at(z)) && !(g(z) == Cx(real_of_num(0))) → complex_differentiable((z : Cart[Real, 2]) => f(z) / g(z), at(z))"), t955))
}

///|
let complex_differentiable_div_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_DIV_AT")

///|
/// `COMPLEX_DIFFERENTIABLE_DIV_AT`
pub fn complex_differentiable_div_at() -> @kernel.Thm {
  complex_differentiable_div_at_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_POW_AT
fn step_193() -> Unit raise {
  let t956 = @meson.meson_tac(@list.List([has_complex_derivative_pow_at()]))
  let t957 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t956)
  complex_differentiable_pow_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ n : Num, ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) → complex_differentiable((z : Cart[Real, 2]) => pow(f(z), n), at(z))"), t957))
}

///|
let complex_differentiable_pow_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_POW_AT")

///|
/// `COMPLEX_DIFFERENTIABLE_POW_AT`
pub fn complex_differentiable_pow_at() -> @kernel.Thm {
  complex_differentiable_pow_at_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_CPRODUCT_AT
fn step_194() -> Unit raise {
  let t959 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses(), complex_differentiable_const(), @sets.forall_in_insert(), @class.eta_ax(), complex_differentiable_mul_at()]))
  let t958 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t960 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))), t958), t959)
  complex_differentiable_cproduct_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, Cart[Real, 2]) -> Cart[Real, 2], ∀ k : (A) -> Bool, ∀ z : Cart[Real, 2], FINITE(k) && (∀ i : A, IN(i, k) → complex_differentiable(f(i), at(z))) → complex_differentiable((z : Cart[Real, 2]) => cproduct(k, (i : A) => f(i, z)), at(z))"), t960))
}

///|
let complex_differentiable_cproduct_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_CPRODUCT_AT")

///|
/// `COMPLEX_DIFFERENTIABLE_CPRODUCT_AT`
pub fn complex_differentiable_cproduct_at() -> @kernel.Thm {
  complex_differentiable_cproduct_at_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_TRANSFORM_AT
fn step_195() -> Unit raise {
  let t961 = @meson.meson_tac(@list.List([has_complex_derivative_transform_at()]))
  let t962 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t961)
  complex_differentiable_transform_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ d : Real, real_of_num(0) < d && (∀ x' : Cart[Real, 2], distance((x', x)) < d → f(x') == g(x')) && complex_differentiable(f, at(x)) → complex_differentiable(g, at(x))"), t962))
}

///|
let complex_differentiable_transform_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_TRANSFORM_AT")

///|
/// `COMPLEX_DIFFERENTIABLE_TRANSFORM_AT`
pub fn complex_differentiable_transform_at() -> @kernel.Thm {
  complex_differentiable_transform_at_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_COMPOSE_WITHIN
fn step_196() -> Unit raise {
  let t963 = @meson.meson_tac(@list.List([complex_diff_chain_within()]))
  let t964 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t963)
  complex_differentiable_compose_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, complex_differentiable(f, within(at(x), s)) && complex_differentiable(g, within(at(f(x)), IMAGE(f, s))) → complex_differentiable(o(g, f), within(at(x), s))"), t964))
}

///|
let complex_differentiable_compose_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_COMPOSE_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_COMPOSE_WITHIN`
pub fn complex_differentiable_compose_within() -> @kernel.Thm {
  complex_differentiable_compose_within_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_COMPOSE_AT
fn step_197() -> Unit raise {
  let t965 = @meson.meson_tac(@list.List([complex_diff_chain_at()]))
  let t966 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable()])), t965)
  complex_differentiable_compose_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], complex_differentiable(f, at(x)) && complex_differentiable(g, at(f(x))) → complex_differentiable(o(g, f), at(x))"), t966))
}

///|
let complex_differentiable_compose_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_COMPOSE_AT")

///|
/// `COMPLEX_DIFFERENTIABLE_COMPOSE_AT`
pub fn complex_differentiable_compose_at() -> @kernel.Thm {
  complex_differentiable_compose_at_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_WITHIN_OPEN
fn step_198() -> Unit raise {
  let t967 = @simp.simp_tac(@list.List([complex_differentiable(), has_complex_derivative_within_open()]))
  complex_differentiable_within_open_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ a : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, IN(a, s) && open(s) → complex_differentiable(f, within(at(a), s)) == complex_differentiable(f, at(a))"), t967))
}

///|
let complex_differentiable_within_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_WITHIN_OPEN")

///|
/// `COMPLEX_DIFFERENTIABLE_WITHIN_OPEN`
pub fn complex_differentiable_within_open() -> @kernel.Thm {
  complex_differentiable_within_open_c.get()
}

///|
/// HOLOMORPHIC_ON_LINEAR
fn step_199() -> Unit raise {
  let t968 = @meson.meson_tac(@list.List([has_complex_derivative_linear()]))
  let t969 = @tactics.then_tac(@simp.rewrite_tac(@list.List([holomorphic_on()])), t968)
  holomorphic_on_linear_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, ∀ c : Cart[Real, 2], holomorphic_on((w : Cart[Real, 2]) => c * w, s)"), t969))
}

///|
let holomorphic_on_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_LINEAR")

///|
/// `HOLOMORPHIC_ON_LINEAR`
pub fn holomorphic_on_linear() -> @kernel.Thm {
  holomorphic_on_linear_c.get()
}

///|
/// HOLOMORPHIC_ON_CONST
fn step_200() -> Unit raise {
  let t970 = @simp.rewrite_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_const()]))
  holomorphic_on_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on((z : Cart[Real, 2]) => c, s)"), t970))
}

///|
let holomorphic_on_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_CONST")

///|
/// `HOLOMORPHIC_ON_CONST`
pub fn holomorphic_on_const() -> @kernel.Thm {
  holomorphic_on_const_c.get()
}

///|
/// HOLOMORPHIC_ON_ID
fn step_201() -> Unit raise {
  let t971 = @simp.rewrite_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_id()]))
  holomorphic_on_id_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on((z : Cart[Real, 2]) => z, s)"), t971))
}

///|
let holomorphic_on_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_ID")

///|
/// `HOLOMORPHIC_ON_ID`
pub fn holomorphic_on_id() -> @kernel.Thm {
  holomorphic_on_id_c.get()
}

///|
/// HOLOMORPHIC_ON_COMPOSE
fn step_202() -> Unit raise {
  let t972 = @meson.meson_tac(@list.List([complex_differentiable_compose_within()]))
  let t973 = @tactics.then_tac(@simp.simp_tac(@list.List([holomorphic_on(), @equal.gsym(complex_differentiable()), @sets.forall_in_image()])), t972)
  holomorphic_on_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) && holomorphic_on(g, IMAGE(f, s)) → holomorphic_on(o(g, f), s)"), t973))
}

///|
let holomorphic_on_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_COMPOSE")

///|
/// `HOLOMORPHIC_ON_COMPOSE`
pub fn holomorphic_on_compose() -> @kernel.Thm {
  holomorphic_on_compose_c.get()
}

///|
/// HOLOMORPHIC_ON_NEG
fn step_203() -> Unit raise {
  let t974 = @simp.simp_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_neg()]))
  holomorphic_on_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) → holomorphic_on((z : Cart[Real, 2]) => -f(z), s)"), t974))
}

///|
let holomorphic_on_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_NEG")

///|
/// `HOLOMORPHIC_ON_NEG`
pub fn holomorphic_on_neg() -> @kernel.Thm {
  holomorphic_on_neg_c.get()
}

///|
/// HOLOMORPHIC_ON_ADD
fn step_204() -> Unit raise {
  let t975 = @simp.simp_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_add()]))
  holomorphic_on_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) && holomorphic_on(g, s) → holomorphic_on((z : Cart[Real, 2]) => f(z) + g(z), s)"), t975))
}

///|
let holomorphic_on_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_ADD")

///|
/// `HOLOMORPHIC_ON_ADD`
pub fn holomorphic_on_add() -> @kernel.Thm {
  holomorphic_on_add_c.get()
}

///|
/// HOLOMORPHIC_ON_SUB
fn step_205() -> Unit raise {
  let t976 = @simp.simp_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_sub()]))
  holomorphic_on_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) && holomorphic_on(g, s) → holomorphic_on((z : Cart[Real, 2]) => f(z) - g(z), s)"), t976))
}

///|
let holomorphic_on_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_SUB")

///|
/// `HOLOMORPHIC_ON_SUB`
pub fn holomorphic_on_sub() -> @kernel.Thm {
  holomorphic_on_sub_c.get()
}

///|
/// HOLOMORPHIC_ON_MUL
fn step_206() -> Unit raise {
  let t977 = @simp.simp_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_mul_within()]))
  holomorphic_on_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) && holomorphic_on(g, s) → holomorphic_on((z : Cart[Real, 2]) => f(z) * g(z), s)"), t977))
}

///|
let holomorphic_on_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_MUL")

///|
/// `HOLOMORPHIC_ON_MUL`
pub fn holomorphic_on_mul() -> @kernel.Thm {
  holomorphic_on_mul_c.get()
}

///|
/// HOLOMORPHIC_ON_LMUL
fn step_207() -> Unit raise {
  let t978 = @simp.simp_tac(@list.List([holomorphic_on_mul(), holomorphic_on_const()]))
  holomorphic_on_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) → holomorphic_on((x : Cart[Real, 2]) => c * f(x), s)"), t978))
}

///|
let holomorphic_on_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_LMUL")

///|
/// `HOLOMORPHIC_ON_LMUL`
pub fn holomorphic_on_lmul() -> @kernel.Thm {
  holomorphic_on_lmul_c.get()
}

///|
/// HOLOMORPHIC_ON_RMUL
fn step_208() -> Unit raise {
  let t979 = @simp.simp_tac(@list.List([holomorphic_on_mul(), holomorphic_on_const()]))
  holomorphic_on_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) → holomorphic_on((x : Cart[Real, 2]) => f(x) * c, s)"), t979))
}

///|
let holomorphic_on_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_RMUL")

///|
/// `HOLOMORPHIC_ON_RMUL`
pub fn holomorphic_on_rmul() -> @kernel.Thm {
  holomorphic_on_rmul_c.get()
}

///|
/// HOLOMORPHIC_ON_INV
fn step_209() -> Unit raise {
  let t980 = @simp.simp_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_inv_within()]))
  holomorphic_on_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) && (∀ z : Cart[Real, 2], IN(z, s) → !(f(z) == Cx(real_of_num(0)))) → holomorphic_on((z : Cart[Real, 2]) => inv(f(z)), s)"), t980))
}

///|
let holomorphic_on_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_INV")

///|
/// `HOLOMORPHIC_ON_INV`
pub fn holomorphic_on_inv() -> @kernel.Thm {
  holomorphic_on_inv_c.get()
}

///|
/// HOLOMORPHIC_ON_DIV
fn step_210() -> Unit raise {
  let t981 = @simp.simp_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_div_within()]))
  holomorphic_on_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) && holomorphic_on(g, s) && (∀ z : Cart[Real, 2], IN(z, s) → !(g(z) == Cx(real_of_num(0)))) → holomorphic_on((z : Cart[Real, 2]) => f(z) / g(z), s)"), t981))
}

///|
let holomorphic_on_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_DIV")

///|
/// `HOLOMORPHIC_ON_DIV`
pub fn holomorphic_on_div() -> @kernel.Thm {
  holomorphic_on_div_c.get()
}

///|
/// HOLOMORPHIC_ON_POW
fn step_211() -> Unit raise {
  let t982 = @simp.simp_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_pow_within()]))
  holomorphic_on_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ n : Num, holomorphic_on(f, s) → holomorphic_on((z : Cart[Real, 2]) => pow(f(z), n), s)"), t982))
}

///|
let holomorphic_on_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_POW")

///|
/// `HOLOMORPHIC_ON_POW`
pub fn holomorphic_on_pow() -> @kernel.Thm {
  holomorphic_on_pow_c.get()
}

///|
/// HOLOMORPHIC_ON_VSUM
fn step_212() -> Unit raise {
  let t989 = @simp.asm_simp_tac(@list.List([@class.eta_ax()]))
  let t988 = @tactics.match_mp_tac(holomorphic_on_add())
  let t987 = @tactics.repeat_tac(@tactics.strip_tac)
  let t986 = @simp.simp_tac(@list.List([holomorphic_on_const(), @sets.in_insert(), @sets.not_in_empty()]))
  let t985 = @simp.simp_tac(@list.List([@vectors.vsum_clauses()]))
  let t984 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t983 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t990 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t983), t984), t985), t986), t987), t988), t989)
  holomorphic_on_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ k : (_) -> Bool, FINITE(k) && (∀ a : _, IN(a, k) → holomorphic_on(f(a), s)) → holomorphic_on((x : Cart[Real, 2]) => vsum(k, (a : _) => f(a, x)), s)"), t990))
}

///|
let holomorphic_on_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_VSUM")

///|
/// `HOLOMORPHIC_ON_VSUM`
pub fn holomorphic_on_vsum() -> @kernel.Thm {
  holomorphic_on_vsum_c.get()
}

///|
/// HOLOMORPHIC_ON_CPRODUCT
fn step_213() -> Unit raise {
  let t991 = @simp.simp_tac(@list.List([holomorphic_on_differentiable(), complex_differentiable_cproduct_within()]))
  holomorphic_on_cproduct_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, Cart[Real, 2]) -> Cart[Real, 2], ∀ k : (A) -> Bool, ∀ s : (Cart[Real, 2]) -> Bool, FINITE(k) && (∀ i : A, IN(i, k) → holomorphic_on(f(i), s)) → holomorphic_on((z : Cart[Real, 2]) => cproduct(k, (i : A) => f(i, z)), s)"), t991))
}

///|
let holomorphic_on_cproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_CPRODUCT")

///|
/// `HOLOMORPHIC_ON_CPRODUCT`
pub fn holomorphic_on_cproduct() -> @kernel.Thm {
  holomorphic_on_cproduct_c.get()
}

///|
/// HOLOMORPHIC_ON_COMPOSE_GEN
fn step_214() -> Unit raise {
  let t997 = @meson.asm_meson_tac(@list.List([has_complex_derivative_within_subset(), complex_diff_chain_within()]))
  let t998 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t997])
  let t996 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(IMAGE((f : (Cart[Real, 2]) -> Cart[Real, 2]), (s : (Cart[Real, 2]) -> Bool)), (t : (Cart[Real, 2]) -> Bool))"), fn(x993 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s994 = @tactics.mp_tac(x993)
    fn(x995 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s994(x995)
    }
  })
  let t992 = @tactics.repeat_tac(@tactics.strip_tac)
  let t999 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([holomorphic_on()])), t992), t996), t998)
  holomorphic_on_compose_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ t : (Cart[Real, 2]) -> Bool, holomorphic_on(f, s) && holomorphic_on(g, t) && (∀ z : Cart[Real, 2], IN(z, s) → IN(f(z), t)) → holomorphic_on(o(g, f), s)"), t999))
}

///|
let holomorphic_on_compose_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_COMPOSE_GEN")

///|
/// `HOLOMORPHIC_ON_COMPOSE_GEN`
pub fn holomorphic_on_compose_gen() -> @kernel.Thm {
  holomorphic_on_compose_gen_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_DERIVATIVE
fn step_215() -> Unit raise {
  let t1000 = @meson.meson_tac(@list.List([complex_derivative_unique_at()]))
  let t1001 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_derivative()])), t1000)
  has_complex_derivative_derivative_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, f', at(x)) → complex_derivative(f, x) == f'"), t1001))
}

///|
let has_complex_derivative_derivative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_DERIVATIVE")

///|
/// `HAS_COMPLEX_DERIVATIVE_DERIVATIVE`
pub fn has_complex_derivative_derivative() -> @kernel.Thm {
  has_complex_derivative_derivative_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_DIFFERENTIABLE
fn step_216() -> Unit raise {
  let t1002 = @meson.meson_tac(@list.List([]))
  let t1003 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable(), complex_derivative()])), t1002)
  has_complex_derivative_differentiable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], has_complex_derivative(f, complex_derivative(f, x), at(x)) == complex_differentiable(f, at(x))"), t1003))
}

///|
let has_complex_derivative_differentiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_DIFFERENTIABLE")

///|
/// `HAS_COMPLEX_DERIVATIVE_DIFFERENTIABLE`
pub fn has_complex_derivative_differentiable() -> @kernel.Thm {
  has_complex_derivative_differentiable_c.get()
}

///|
/// COMPLEX_DERIVATIVE_CHAIN
fn step_217() -> Unit raise {
  let t1004 = @meson.meson_tac(@list.List([has_complex_derivative_derivative(), complex_diff_chain_at(), has_complex_derivative_differentiable()]))
  complex_derivative_chain_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) && complex_differentiable(g, at(f(z))) → complex_derivative(o(g, f), z) == complex_derivative(g, f(z)) * complex_derivative(f, z)"), t1004))
}

///|
let complex_derivative_chain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_CHAIN")

///|
/// `COMPLEX_DERIVATIVE_CHAIN`
pub fn complex_derivative_chain() -> @kernel.Thm {
  complex_derivative_chain_c.get()
}

///|
/// COMPLEX_DERIVATIVE_LINEAR
fn step_218() -> Unit raise {
  let t1007 = @simp.rewrite_tac(@list.List([has_complex_derivative_linear()]))
  let t1006 = @tactics.match_mp_tac(has_complex_derivative_derivative())
  let t1005 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1008 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t1005), t1006), t1007)
  complex_derivative_linear_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], complex_derivative((w : Cart[Real, 2]) => c * w) == ((z : Cart[Real, 2]) => c)"), t1008))
}

///|
let complex_derivative_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_LINEAR")

///|
/// `COMPLEX_DERIVATIVE_LINEAR`
pub fn complex_derivative_linear() -> @kernel.Thm {
  complex_derivative_linear_c.get()
}

///|
/// COMPLEX_DERIVATIVE_ID
fn step_219() -> Unit raise {
  let t1009 = @meson.meson_tac(@list.List([has_complex_derivative_derivative(), has_complex_derivative_id()]))
  let t1010 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t1009)
  complex_derivative_id_c.set(@tactics.prove(@term_syntax.parse_term("complex_derivative((w : Cart[Real, 2]) => w) == ((z : Cart[Real, 2]) => Cx(real_of_num(1)))"), t1010))
}

///|
let complex_derivative_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_ID")

///|
/// `COMPLEX_DERIVATIVE_ID`
pub fn complex_derivative_id() -> @kernel.Thm {
  complex_derivative_id_c.get()
}

///|
/// COMPLEX_DERIVATIVE_CONST
fn step_220() -> Unit raise {
  let t1011 = @meson.meson_tac(@list.List([has_complex_derivative_derivative(), has_complex_derivative_const()]))
  let t1012 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t1011)
  complex_derivative_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], complex_derivative((w : Cart[Real, 2]) => c) == ((z : Cart[Real, 2]) => Cx(real_of_num(0)))"), t1012))
}

///|
let complex_derivative_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_CONST")

///|
/// `COMPLEX_DERIVATIVE_CONST`
pub fn complex_derivative_const() -> @kernel.Thm {
  complex_derivative_const_c.get()
}

///|
/// COMPLEX_DERIVATIVE_ADD
fn step_221() -> Unit raise {
  let t1014 = @simp.asm_simp_tac(@list.List([has_complex_derivative_add(), has_complex_derivative_differentiable()]))
  let t1013 = @tactics.match_mp_tac(has_complex_derivative_derivative())
  let t1015 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1013), t1014)
  complex_derivative_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) && complex_differentiable(g, at(z)) → complex_derivative((w : Cart[Real, 2]) => f(w) + g(w), z) == complex_derivative(f, z) + complex_derivative(g, z)"), t1015))
}

///|
let complex_derivative_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_ADD")

///|
/// `COMPLEX_DERIVATIVE_ADD`
pub fn complex_derivative_add() -> @kernel.Thm {
  complex_derivative_add_c.get()
}

///|
/// COMPLEX_DERIVATIVE_SUB
fn step_222() -> Unit raise {
  let t1017 = @simp.asm_simp_tac(@list.List([has_complex_derivative_sub(), has_complex_derivative_differentiable()]))
  let t1016 = @tactics.match_mp_tac(has_complex_derivative_derivative())
  let t1018 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1016), t1017)
  complex_derivative_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) && complex_differentiable(g, at(z)) → complex_derivative((w : Cart[Real, 2]) => f(w) - g(w), z) == complex_derivative(f, z) - complex_derivative(g, z)"), t1018))
}

///|
let complex_derivative_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_SUB")

///|
/// `COMPLEX_DERIVATIVE_SUB`
pub fn complex_derivative_sub() -> @kernel.Thm {
  complex_derivative_sub_c.get()
}

///|
/// COMPLEX_DERIVATIVE_MUL
fn step_223() -> Unit raise {
  let t1020 = @simp.asm_simp_tac(@list.List([has_complex_derivative_mul_at(), has_complex_derivative_differentiable()]))
  let t1019 = @tactics.match_mp_tac(has_complex_derivative_derivative())
  let t1021 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1019), t1020)
  complex_derivative_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) && complex_differentiable(g, at(z)) → complex_derivative((w : Cart[Real, 2]) => f(w) * g(w), z) == f(z) * complex_derivative(g, z) + complex_derivative(f, z) * g(z)"), t1021))
}

///|
let complex_derivative_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_MUL")

///|
/// `COMPLEX_DERIVATIVE_MUL`
pub fn complex_derivative_mul() -> @kernel.Thm {
  complex_derivative_mul_c.get()
}

///|
/// COMPLEX_DERIVATIVE_LMUL
fn step_224() -> Unit raise {
  let t1023 = @simp.asm_simp_tac(@list.List([has_complex_derivative_lmul_at(), has_complex_derivative_differentiable()]))
  let t1022 = @tactics.match_mp_tac(has_complex_derivative_derivative())
  let t1024 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1022), t1023)
  complex_derivative_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) → complex_derivative((w : Cart[Real, 2]) => c * f(w), z) == c * complex_derivative(f, z)"), t1024))
}

///|
let complex_derivative_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_LMUL")

///|
/// `COMPLEX_DERIVATIVE_LMUL`
pub fn complex_derivative_lmul() -> @kernel.Thm {
  complex_derivative_lmul_c.get()
}

///|
/// COMPLEX_DERIVATIVE_RMUL
fn step_225() -> Unit raise {
  let t1026 = @simp.asm_simp_tac(@list.List([has_complex_derivative_rmul_at(), has_complex_derivative_differentiable()]))
  let t1025 = @tactics.match_mp_tac(has_complex_derivative_derivative())
  let t1027 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1025), t1026)
  complex_derivative_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) → complex_derivative((w : Cart[Real, 2]) => f(w) * c, z) == complex_derivative(f, z) * c"), t1027))
}

///|
let complex_derivative_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_RMUL")

///|
/// `COMPLEX_DERIVATIVE_RMUL`
pub fn complex_derivative_rmul() -> @kernel.Thm {
  complex_derivative_rmul_c.get()
}

///|
/// COMPLEX_DERIVATIVE_TRANSFORM_WITHIN_OPEN
fn step_226() -> Unit raise {
  let t1029 = @meson.asm_meson_tac(@list.List([has_complex_derivative_transform_within_open(), holomorphic_on_imp_differentiable_at(), has_complex_derivative_differentiable()]))
  let t1028 = @tactics.match_mp_tac(complex_derivative_unique_at())
  let t1030 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1028), t1029)
  complex_derivative_transform_within_open_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ z : Cart[Real, 2], open(s) && holomorphic_on(f, s) && holomorphic_on(g, s) && IN(z, s) && (∀ w : Cart[Real, 2], IN(w, s) → f(w) == g(w)) → complex_derivative(f, z) == complex_derivative(g, z)"), t1030))
}

///|
let complex_derivative_transform_within_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_TRANSFORM_WITHIN_OPEN")

///|
/// `COMPLEX_DERIVATIVE_TRANSFORM_WITHIN_OPEN`
pub fn complex_derivative_transform_within_open() -> @kernel.Thm {
  complex_derivative_transform_within_open_c.get()
}

///|
/// COMPLEX_DERIVATIVE_COMPOSE_LINEAR
fn step_227() -> Unit raise {
  let t1031 = @bool.specl(@list.List([@term_syntax.parse_term("(w : Cart[Real, 2]) => (c : Cart[Real, 2]) * w")]), complex_derivative_chain())
  let t1032 = @simp.simp_tac(@list.List([@complexes.complex_mul_sym(), @simp.rewrite_rule(@list.List([@trivia.o_def(), complex_differentiable_id(), complex_differentiable_linear(), complex_derivative_linear()]))(t1031)]))
  complex_derivative_compose_linear_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(c * z)) → complex_derivative((w : Cart[Real, 2]) => f(c * w), z) == c * complex_derivative(f, c * z)"), t1032))
}

///|
let complex_derivative_compose_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_COMPOSE_LINEAR")

///|
/// `COMPLEX_DERIVATIVE_COMPOSE_LINEAR`
pub fn complex_derivative_compose_linear() -> @kernel.Thm {
  complex_derivative_compose_linear_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_CARATHEODORY_AT
fn step_228() -> Unit raise {
  let t1049 = @simp.simp_tac(@list.List([@topology.lim_const(), @complexes.complex_vec_0(), @complexes.complex_field(@term_syntax.parse_term("!((w : Cart[Real, 2]) == (z : Cart[Real, 2])) → (x : Cart[Real, 2]) - x * (w - z) / (w - z) == Cx(real_of_num(0))"))]))
  let t1046 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.lim_transform()))
  let t1048 = @tactics.first_x_assum(fn(x1047 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1046(x1047))
  })
  let t1045 = @simp.asm_simp_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) + (a : Cart[Real, 2]) - (z + (b : Cart[Real, 2]) * ((w : Cart[Real, 2]) - w)) == a"))]))
  let t1044 = @tactics.first_x_assum(fn(x1041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1042 = @tactics.subst1_tac(x1041)
    fn(x1043 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1042(x1043)
    }
  })
  let t1050 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1038 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1039 = @tactics.subst_all_tac(x1038)
    fn(x1040 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1039(x1040)
    }
  }), t1044), t1045), t1048), t1049)
  let t1037 = @tactics.conv_tac(@complexes.complex_field)
  let t1036 = @simp.asm_simp_tac(@list.List([@class.fun_eq_thm(), @class.cond_rand(), @class.cond_rator(), @complexes.complex_sub_refl()]))
  let t1051 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) => if w == (z : Cart[Real, 2]) { (f' : Cart[Real, 2]) } else { ((f : (Cart[Real, 2]) -> Cart[Real, 2])(w) - f(z)) / (w - z) }")), t1036), t1037), t1050])
  let t1035 = @simp.asm_rewrite_tac(@list.List([]))
  let t1034 = @simp.simp_tac(@list.List([@equal.gsym(@class.fun_eq_thm()), has_complex_derivative_at(), @topology.continuous_at()]))
  let t1033 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((w' : Cart[Real, 2]) - (z' : Cart[Real, 2]) == (a : Cart[Real, 2])) == (w' == z' + a)"))]))
  let t1052 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1033), t1034), @tactics.eq_tac), @tactics.strip_tac), t1035), t1051)
  has_complex_derivative_caratheodory_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ z : Cart[Real, 2], has_complex_derivative(f, f', at(z)) == (∃ g : (Cart[Real, 2]) -> Cart[Real, 2], (∀ w : Cart[Real, 2], f(w) - f(z) == g(w) * (w - z)) && continuous(g, at(z)) && g(z) == f')"), t1052))
}

///|
let has_complex_derivative_caratheodory_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_CARATHEODORY_AT")

///|
/// `HAS_COMPLEX_DERIVATIVE_CARATHEODORY_AT`
pub fn has_complex_derivative_caratheodory_at() -> @kernel.Thm {
  has_complex_derivative_caratheodory_at_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_CARATHEODORY_WITHIN
fn step_229() -> Unit raise {
  let t1069 = @simp.simp_tac(@list.List([@topology.lim_const(), @complexes.complex_vec_0(), @complexes.complex_field(@term_syntax.parse_term("!((w : Cart[Real, 2]) == (z : Cart[Real, 2])) → (x : Cart[Real, 2]) - x * (w - z) / (w - z) == Cx(real_of_num(0))"))]))
  let t1066 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.lim_transform()))
  let t1068 = @tactics.first_x_assum(fn(x1067 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1066(x1067))
  })
  let t1065 = @simp.asm_simp_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) + (a : Cart[Real, 2]) - (z + (b : Cart[Real, 2]) * ((w : Cart[Real, 2]) - w)) == a"))]))
  let t1064 = @tactics.first_x_assum(fn(x1061 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1062 = @tactics.subst1_tac(x1061)
    fn(x1063 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1062(x1063)
    }
  })
  let t1070 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1058 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1059 = @tactics.subst_all_tac(x1058)
    fn(x1060 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1059(x1060)
    }
  }), t1064), t1065), t1068), t1069)
  let t1057 = @tactics.conv_tac(@complexes.complex_field)
  let t1056 = @simp.asm_simp_tac(@list.List([@class.fun_eq_thm(), @class.cond_rand(), @class.cond_rator(), @complexes.complex_sub_refl()]))
  let t1071 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) => if w == (z : Cart[Real, 2]) { (f' : Cart[Real, 2]) } else { ((f : (Cart[Real, 2]) -> Cart[Real, 2])(w) - f(z)) / (w - z) }")), t1056), t1057), t1070])
  let t1055 = @simp.asm_rewrite_tac(@list.List([]))
  let t1054 = @simp.simp_tac(@list.List([@equal.gsym(@class.fun_eq_thm()), has_complex_derivative_within(), @topology.continuous_within()]))
  let t1053 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((w' : Cart[Real, 2]) - (z' : Cart[Real, 2]) == (a : Cart[Real, 2])) == (w' == z' + a)"))]))
  let t1072 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1053), t1054), @tactics.eq_tac), @tactics.strip_tac), t1055), t1071)
  has_complex_derivative_caratheodory_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, has_complex_derivative(f, f', within(at(z), s)) == (∃ g : (Cart[Real, 2]) -> Cart[Real, 2], (∀ w : Cart[Real, 2], f(w) - f(z) == g(w) * (w - z)) && continuous(g, within(at(z), s)) && g(z) == f')"), t1072))
}

///|
let has_complex_derivative_caratheodory_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_CARATHEODORY_WITHIN")

///|
/// `HAS_COMPLEX_DERIVATIVE_CARATHEODORY_WITHIN`
pub fn has_complex_derivative_caratheodory_within() -> @kernel.Thm {
  has_complex_derivative_caratheodory_within_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_CARATHEODORY_AT
fn step_230() -> Unit raise {
  let t1073 = @meson.meson_tac(@list.List([]))
  let t1074 = @tactics.then_tac(@simp.simp_tac(@list.List([complex_differentiable(), has_complex_derivative_caratheodory_at()])), t1073)
  complex_differentiable_caratheodory_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) == (∃ g : (Cart[Real, 2]) -> Cart[Real, 2], (∀ w : Cart[Real, 2], f(w) - f(z) == g(w) * (w - z)) && continuous(g, at(z)))"), t1074))
}

///|
let complex_differentiable_caratheodory_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_CARATHEODORY_AT")

///|
/// `COMPLEX_DIFFERENTIABLE_CARATHEODORY_AT`
pub fn complex_differentiable_caratheodory_at() -> @kernel.Thm {
  complex_differentiable_caratheodory_at_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_CARATHEODORY_WITHIN
fn step_231() -> Unit raise {
  let t1075 = @meson.meson_tac(@list.List([]))
  let t1076 = @tactics.then_tac(@simp.simp_tac(@list.List([complex_differentiable(), has_complex_derivative_caratheodory_within()])), t1075)
  complex_differentiable_caratheodory_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, complex_differentiable(f, within(at(z), s)) == (∃ g : (Cart[Real, 2]) -> Cart[Real, 2], (∀ w : Cart[Real, 2], f(w) - f(z) == g(w) * (w - z)) && continuous(g, within(at(z), s)))"), t1076))
}

///|
let complex_differentiable_caratheodory_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_CARATHEODORY_WITHIN")

///|
/// `COMPLEX_DIFFERENTIABLE_CARATHEODORY_WITHIN`
pub fn complex_differentiable_caratheodory_within() -> @kernel.Thm {
  complex_differentiable_caratheodory_within_c.get()
}

///|
/// Multivariate/canal.ml:1835
fn step_232() -> Unit raise {
  @printer.parse_as_infix("analytic_on", (12L, "right"))
}

///|
/// analytic_on
fn step_233() -> Unit raise {
  analytic_on_c.set(@pair.new_definition(@term_syntax.parse_term("(analytic_on : ((Cart[Real, 2]) -> Cart[Real, 2], (Cart[Real, 2]) -> Bool) -> Bool)((f : (Cart[Real, 2]) -> Cart[Real, 2]), (s : (Cart[Real, 2]) -> Bool)) == (∀ x : Cart[Real, 2], IN(x, s) → (∃ e : Real, real_of_num(0) < e && holomorphic_on(f, ball((x, e)))))")))
}

///|
let analytic_on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("analytic_on")

///|
/// `analytic_on`
pub fn analytic_on() -> @kernel.Thm {
  analytic_on_c.get()
}

///|
/// ANALYTIC_IMP_HOLOMORPHIC
fn step_234() -> Unit raise {
  let t1078 = @meson.meson_tac(@list.List([has_complex_derivative_at_within(), @topology.centre_in_ball()]))
  let t1077 = @simp.simp_tac(@list.List([has_complex_derivative_within_open(), @topology.open_ball()]))
  let t1079 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_on(), holomorphic_on()])), t1077), t1078)
  analytic_imp_holomorphic_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) → holomorphic_on(f, s)"), t1079))
}

///|
let analytic_imp_holomorphic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_IMP_HOLOMORPHIC")

///|
/// `ANALYTIC_IMP_HOLOMORPHIC`
pub fn analytic_imp_holomorphic() -> @kernel.Thm {
  analytic_imp_holomorphic_c.get()
}

///|
/// ANALYTIC_ON_OPEN
fn step_235() -> Unit raise {
  let t1091 = @meson.meson_tac(@list.List([@topology.centre_in_ball()]))
  let t1090 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t1087 = @simp.gen_rewrite_rule(fn(x1086 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1086
  }, @list.List([@topology.open_contains_ball()]))
  let t1089 = @tactics.first_assum(fn(x1088 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1083 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1084 = @tactics.mp_tac(x1083)
      fn(x1085 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1084(x1085)
      }
    })(t1087(x1088))
  })
  let t1082 = @simp.asm_simp_tac(@list.List([has_complex_derivative_within_open(), @topology.open_ball()]))
  let t1081 = @simp.rewrite_tac(@list.List([analytic_on(), holomorphic_on()]))
  let t1080 = @simp.rewrite_tac(@list.List([analytic_imp_holomorphic()]))
  let t1092 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t1080), t1081), t1082), t1089), t1090), t1091)
  analytic_on_open_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, open(s) → analytic_on(f, s) == holomorphic_on(f, s)"), t1092))
}

///|
let analytic_on_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_OPEN")

///|
/// `ANALYTIC_ON_OPEN`
pub fn analytic_on_open() -> @kernel.Thm {
  analytic_on_open_c.get()
}

///|
/// ANALYTIC_ON_IMP_DIFFERENTIABLE_AT
fn step_236() -> Unit raise {
  let t1093 = @meson.meson_tac(@list.List([@topology.centre_in_ball()]))
  let t1094 = @tactics.then_tac(@simp.simp_tac(@list.List([analytic_on(), holomorphic_on_open(), @topology.open_ball(), complex_differentiable()])), t1093)
  analytic_on_imp_differentiable_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ x : Cart[Real, 2], analytic_on(f, s) && IN(x, s) → complex_differentiable(f, at(x))"), t1094))
}

///|
let analytic_on_imp_differentiable_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_IMP_DIFFERENTIABLE_AT")

///|
/// `ANALYTIC_ON_IMP_DIFFERENTIABLE_AT`
pub fn analytic_on_imp_differentiable_at() -> @kernel.Thm {
  analytic_on_imp_differentiable_at_c.get()
}

///|
/// ANALYTIC_ON_SUBSET
fn step_237() -> Unit raise {
  let t1095 = @meson.meson_tac(@list.List([]))
  let t1096 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_on(), @sets.subset()])), t1095)
  analytic_on_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ t : (Cart[Real, 2]) -> Bool, analytic_on(f, s) && SUBSET(t, s) → analytic_on(f, t)"), t1096))
}

///|
let analytic_on_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_SUBSET")

///|
/// `ANALYTIC_ON_SUBSET`
pub fn analytic_on_subset() -> @kernel.Thm {
  analytic_on_subset_c.get()
}

///|
/// ANALYTIC_ON_UNION
fn step_238() -> Unit raise {
  let t1097 = @meson.meson_tac(@list.List([]))
  let t1098 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_on(), @sets.in_union()])), t1097)
  analytic_on_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ t : (Cart[Real, 2]) -> Bool, analytic_on(f, UNION(s, t)) == (analytic_on(f, s) && analytic_on(f, t))"), t1098))
}

///|
let analytic_on_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_UNION")

///|
/// `ANALYTIC_ON_UNION`
pub fn analytic_on_union() -> @kernel.Thm {
  analytic_on_union_c.get()
}

///|
/// ANALYTIC_ON_UNIONS
fn step_239() -> Unit raise {
  let t1099 = @meson.meson_tac(@list.List([]))
  let t1100 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_on(), @sets.in_unions()])), t1099)
  analytic_on_unions_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : ((Cart[Real, 2]) -> Bool) -> Bool, analytic_on(f, UNIONS(s)) == (∀ t : (Cart[Real, 2]) -> Bool, IN(t, s) → analytic_on(f, t))"), t1100))
}

///|
let analytic_on_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_UNIONS")

///|
/// `ANALYTIC_ON_UNIONS`
pub fn analytic_on_unions() -> @kernel.Thm {
  analytic_on_unions_c.get()
}

///|
/// ANALYTIC_ON_HOLOMORPHIC
fn step_240() -> Unit raise {
  let t1107 = @meson.meson_tac(@list.List([analytic_on_open()]))
  let t1106 = @meson.meson_tac(@list.List([analytic_on_subset()]))
  let t1105 = @meson.asm_meson_tac(@list.List([analytic_on(), analytic_on_open(), @topology.open_ball(), @topology.centre_in_ball()]))
  let t1104 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_unions(), @sets.in_elim_thm()]))
  let t1103 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @topology.open_unions(), analytic_on_unions()]))
  let t1108 = @list.List([@tactics.thenl(@tactics.eq_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.exists_tac(@term_syntax.parse_term("UNIONS({(u : (Cart[Real, 2]) -> Bool) | open(u) && analytic_on((f : (Cart[Real, 2]) -> Cart[Real, 2]), u)})"))), t1103), t1104), t1105), t1106])), t1107])
  let t1102 = @tactics.exists_tac(@term_syntax.parse_term("∃ t : (Cart[Real, 2]) -> Bool, open(t) && SUBSET((s : (Cart[Real, 2]) -> Bool), t) && analytic_on((f : (Cart[Real, 2]) -> Cart[Real, 2]), t)"))
  let t1101 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1109 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1101), t1102), @tactics.conj_tac), t1108)
  analytic_on_holomorphic_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) == (∃ t : (Cart[Real, 2]) -> Bool, open(t) && SUBSET(s, t) && holomorphic_on(f, t))"), t1109))
}

///|
let analytic_on_holomorphic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_HOLOMORPHIC")

///|
/// `ANALYTIC_ON_HOLOMORPHIC`
pub fn analytic_on_holomorphic() -> @kernel.Thm {
  analytic_on_holomorphic_c.get()
}

///|
/// ANALYTIC_ON_LINEAR
fn step_241() -> Unit raise {
  let t1112 = @simp.rewrite_tac(@list.List([@topology.open_univ(), @sets.subset_univ()]))
  let t1111 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1110 = @simp.rewrite_tac(@list.List([analytic_on_holomorphic(), holomorphic_on_linear()]))
  let t1113 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1110), t1111), t1112)
  analytic_on_linear_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, ∀ c : Cart[Real, 2], analytic_on((w : Cart[Real, 2]) => c * w, s)"), t1113))
}

///|
let analytic_on_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_LINEAR")

///|
/// `ANALYTIC_ON_LINEAR`
pub fn analytic_on_linear() -> @kernel.Thm {
  analytic_on_linear_c.get()
}

///|
/// ANALYTIC_ON_CONST
fn step_242() -> Unit raise {
  let t1114 = @meson.meson_tac(@list.List([@real.real_lt_01()]))
  let t1115 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_on(), holomorphic_on_const()])), t1114)
  analytic_on_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on((z : Cart[Real, 2]) => c, s)"), t1115))
}

///|
let analytic_on_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_CONST")

///|
/// `ANALYTIC_ON_CONST`
pub fn analytic_on_const() -> @kernel.Thm {
  analytic_on_const_c.get()
}

///|
/// ANALYTIC_ON_ID
fn step_243() -> Unit raise {
  let t1116 = @meson.meson_tac(@list.List([@real.real_lt_01()]))
  let t1117 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_on(), holomorphic_on_id()])), t1116)
  analytic_on_id_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, analytic_on((z : Cart[Real, 2]) => z, s)"), t1117))
}

///|
let analytic_on_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_ID")

///|
/// `ANALYTIC_ON_ID`
pub fn analytic_on_id() -> @kernel.Thm {
  analytic_on_id_c.get()
}

///|
/// ANALYTIC_ON_COMPOSE
fn step_244() -> Unit raise {
  let t1178 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1177 = @simp.asm_rewrite_tac(@list.List([@topology.ball_min_inter(), @sets.inter_subset()]))
  let t1175 = @tactics.exists_tac(@term_syntax.parse_term("ball(((f : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])), (e : Real)))"))
  let t1176 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("ball(((z : Cart[Real, 2]), (d : Real)))")), t1175])
  let t1174 = @tactics.match_mp_tac(holomorphic_on_subset())
  let t1173 = @tactics.match_mp_tac(holomorphic_on_compose())
  let t1172 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t1171 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), (k : Real))"))
  let t1170 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Real)"))(@tactics.strip_assume_tac))
  let t1169 = @simp.asm_rewrite_tac(@list.List([]))
  let t1165 = @term_syntax.parse_term("(e : Real)")
  let t1168 = @tactics.disch_then(fn(x1167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1163 = @tactics.mp_tac(x1162)
      fn(x1164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1163(x1164)
      }
    })(((x1166 : @kernel.Thm) => @bool.spec(t1165, x1166))(x1167))
  })
  let t1161 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e : Real)"))(@tactics.strip_assume_tac))
  let t1160 = @simp.asm_rewrite_tac(@list.List([]))
  let t1156 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1159 = @tactics.first_x_assum(fn(x1158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1154 = @tactics.mp_tac(x1153)
      fn(x1155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1154(x1155)
      }
    })(((x1157 : @kernel.Thm) => @bool.spec(t1156, x1157))(x1158))
  })
  let t1152 = @simp.asm_rewrite_tac(@list.List([@topology.centre_in_ball(), @topology.continuous_at_ball()]))
  let t1148 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1151 = @tactics.disch_then(fn(x1150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1146 = @tactics.mp_tac(x1145)
      fn(x1147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1146(x1147)
      }
    })(((x1149 : @kernel.Thm) => @bool.spec(t1148, x1149))(x1150))
  })
  let t1144 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_at(), @topology.open_ball()]))
  let t1141 = @drule.match_mp(holomorphic_on_imp_continuous_on())
  let t1143 = @tactics.first_assum(fn(x1142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1139 = @tactics.mp_tac(x1138)
      fn(x1140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1139(x1140)
      }
    })(t1141(x1142))
  })
  let t1137 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t1136 = @simp.asm_rewrite_tac(@list.List([]))
  let t1132 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1135 = @tactics.remove_then("f", fn(x1134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1130 = @tactics.mp_tac(x1129)
      fn(x1131 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1130(x1131)
      }
    })(((x1133 : @kernel.Thm) => @bool.spec(t1132, x1133))(x1134))
  })
  let t1128 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1127 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1121 = ((x1119 : @kernel.Thm) => @tactics.label_tac("f", x1119))(x1120)
    fn(x1122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1121(x1122)
    }
  }, fn(x1124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1125 = ((x1123 : @kernel.Thm) => @tactics.label_tac("g", x1123))(x1124)
    fn(x1126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1125(x1126)
    }
  }))
  let t1118 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1179 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_on(), @sets.forall_in_image()])), t1118), t1127), t1128), @tactics.disch_tac), t1135), t1136), t1137), t1143), t1144), t1151), t1152), t1159), t1160), t1161), t1168), t1169), t1170), t1171), t1172), t1173), @tactics.conj_tac), t1174), t1176), t1177), t1178)
  analytic_on_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) && analytic_on(g, IMAGE(f, s)) → analytic_on(o(g, f), s)"), t1179))
}

///|
let analytic_on_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_COMPOSE")

///|
/// `ANALYTIC_ON_COMPOSE`
pub fn analytic_on_compose() -> @kernel.Thm {
  analytic_on_compose_c.get()
}

///|
/// ANALYTIC_ON_COMPOSE_GEN
fn step_245() -> Unit raise {
  let t1183 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1182 = @tactics.match_mp_tac(analytic_on_subset())
  let t1181 = @simp.asm_rewrite_tac(@list.List([]))
  let t1180 = @tactics.match_mp_tac(analytic_on_compose())
  let t1184 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1180), t1181), t1182), t1183)
  analytic_on_compose_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ t : (Cart[Real, 2]) -> Bool, analytic_on(f, s) && analytic_on(g, t) && (∀ z : Cart[Real, 2], IN(z, s) → IN(f(z), t)) → analytic_on(o(g, f), s)"), t1184))
}

///|
let analytic_on_compose_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_COMPOSE_GEN")

///|
/// `ANALYTIC_ON_COMPOSE_GEN`
pub fn analytic_on_compose_gen() -> @kernel.Thm {
  analytic_on_compose_gen_c.get()
}

///|
/// ANALYTIC_ON_NEG
fn step_246() -> Unit raise {
  let t1185 = @meson.meson_tac(@list.List([holomorphic_on_neg()]))
  let t1186 = @tactics.then_tac(@simp.simp_tac(@list.List([analytic_on()])), t1185)
  analytic_on_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) → analytic_on((z : Cart[Real, 2]) => -f(z), s)"), t1186))
}

///|
let analytic_on_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_NEG")

///|
/// `ANALYTIC_ON_NEG`
pub fn analytic_on_neg() -> @kernel.Thm {
  analytic_on_neg_c.get()
}

///|
/// ANALYTIC_ON_ADD
fn step_247() -> Unit raise {
  let t1202 = @meson.asm_meson_tac(@list.List([holomorphic_on_subset(), @sets.inter_subset()]))
  let t1201 = @tactics.match_mp_tac(holomorphic_on_add())
  let t1200 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min(), @topology.ball_min_inter(), @sets.in_inter()]))
  let t1199 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), (e : Real))"))
  let t1196 = @term_syntax.parse_term("(e : Real)")
  let t1194 = @term_syntax.parse_term("(d : Real)")
  let t1198 = @tactics.disch_then(@tactics.conjuncts_then2((x1195 : @kernel.Thm) => @tactics.x_choose_tac(t1194, x1195), (x1197 : @kernel.Thm) => @tactics.x_choose_tac(t1196, x1197)))
  let t1193 = @simp.asm_rewrite_tac(@list.List([]))
  let t1192 = @tactics.disch_then(fn(x1190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1190
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t1189 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1188 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t1187 = @simp.rewrite_tac(@list.List([analytic_on()]))
  let t1203 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1187), t1188), t1189), @tactics.gen_tac), t1192), t1193), t1198), t1199), t1200), t1201), t1202)
  analytic_on_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) && analytic_on(g, s) → analytic_on((z : Cart[Real, 2]) => f(z) + g(z), s)"), t1203))
}

///|
let analytic_on_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_ADD")

///|
/// `ANALYTIC_ON_ADD`
pub fn analytic_on_add() -> @kernel.Thm {
  analytic_on_add_c.get()
}

///|
/// ANALYTIC_ON_SUB
fn step_248() -> Unit raise {
  let t1204 = @simp.simp_tac(@list.List([@complexes.complex_sub(), analytic_on_add(), analytic_on_neg()]))
  analytic_on_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) && analytic_on(g, s) → analytic_on((z : Cart[Real, 2]) => f(z) - g(z), s)"), t1204))
}

///|
let analytic_on_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_SUB")

///|
/// `ANALYTIC_ON_SUB`
pub fn analytic_on_sub() -> @kernel.Thm {
  analytic_on_sub_c.get()
}

///|
/// ANALYTIC_ON_MUL
fn step_249() -> Unit raise {
  let t1220 = @meson.asm_meson_tac(@list.List([holomorphic_on_subset(), @sets.inter_subset()]))
  let t1219 = @tactics.match_mp_tac(holomorphic_on_mul())
  let t1218 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min(), @topology.ball_min_inter(), @sets.in_inter()]))
  let t1217 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), (e : Real))"))
  let t1214 = @term_syntax.parse_term("(e : Real)")
  let t1212 = @term_syntax.parse_term("(d : Real)")
  let t1216 = @tactics.disch_then(@tactics.conjuncts_then2((x1213 : @kernel.Thm) => @tactics.x_choose_tac(t1212, x1213), (x1215 : @kernel.Thm) => @tactics.x_choose_tac(t1214, x1215)))
  let t1211 = @simp.asm_rewrite_tac(@list.List([]))
  let t1210 = @tactics.disch_then(fn(x1208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1208
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t1207 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1206 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t1205 = @simp.rewrite_tac(@list.List([analytic_on()]))
  let t1221 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1205), t1206), t1207), @tactics.gen_tac), t1210), t1211), t1216), t1217), t1218), t1219), t1220)
  analytic_on_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) && analytic_on(g, s) → analytic_on((z : Cart[Real, 2]) => f(z) * g(z), s)"), t1221))
}

///|
let analytic_on_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_MUL")

///|
/// `ANALYTIC_ON_MUL`
pub fn analytic_on_mul() -> @kernel.Thm {
  analytic_on_mul_c.get()
}

///|
/// ANALYTIC_ON_INV
fn step_250() -> Unit raise {
  let t1251 = @meson.asm_meson_tac(@list.List([holomorphic_on_subset(), @sets.inter_subset()]))
  let t1250 = @simp.asm_simp_tac(@list.List([@topology.ball_min_inter(), @sets.in_inter()]))
  let t1249 = @tactics.match_mp_tac(holomorphic_on_inv())
  let t1248 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t1247 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), (e : Real))"))
  let t1246 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e : Real)"))(@tactics.strip_assume_tac))
  let t1252 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@topology.in_ball())])), t1246), t1247), t1248), t1249), t1250), t1251)
  let t1245 = @simp.asm_simp_tac(@list.List([holomorphic_on_imp_continuous_on(), @topology.centre_in_ball(), @topology.open_ball()]))
  let t1244 = @tactics.exists_tac(@term_syntax.parse_term("ball(((z : Cart[Real, 2]), (d : Real)))"))
  let t1253 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_open_avoid()), t1244), t1245), t1252])
  let t1243 = @tactics.subgoal_then(@term_syntax.parse_term("∃ e : Real, real_of_num(0) < e && (∀ y : Cart[Real, 2], distance(((z : Cart[Real, 2]), y)) < e → !((f : (Cart[Real, 2]) -> Cart[Real, 2])(y) == Cx(real_of_num(0))))"), fn(x1240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1241 = @tactics.mp_tac(x1240)
    fn(x1242 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1241(x1242)
    }
  })
  let t1239 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t1238 = @simp.asm_rewrite_tac(@list.List([]))
  let t1234 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1237 = @tactics.disch_then(fn(x1236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1232 = @tactics.mp_tac(x1231)
      fn(x1233 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1232(x1233)
      }
    })(((x1235 : @kernel.Thm) => @bool.spec(t1234, x1235))(x1236))
  })
  let t1228 = @simp.gen_rewrite_rule(fn(x1227 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1227
  }, @list.List([analytic_on()]))
  let t1230 = @tactics.first_assum(fn(x1229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1225 = @tactics.mp_tac(x1224)
      fn(x1226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1225(x1226)
      }
    })(t1228(x1229))
  })
  let t1223 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1222 = @simp.rewrite_tac(@list.List([analytic_on()]))
  let t1254 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1222), t1223), @tactics.disch_tac), t1230), t1237), t1238), t1239), t1243), t1253)
  analytic_on_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) && (∀ z : Cart[Real, 2], IN(z, s) → !(f(z) == Cx(real_of_num(0)))) → analytic_on((z : Cart[Real, 2]) => inv(f(z)), s)"), t1254))
}

///|
let analytic_on_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_INV")

///|
/// `ANALYTIC_ON_INV`
pub fn analytic_on_inv() -> @kernel.Thm {
  analytic_on_inv_c.get()
}

///|
/// ANALYTIC_ON_DIV
fn step_251() -> Unit raise {
  let t1255 = @simp.simp_tac(@list.List([@complexes.complex_div(), analytic_on_mul(), analytic_on_inv()]))
  analytic_on_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) && analytic_on(g, s) && (∀ z : Cart[Real, 2], IN(z, s) → !(g(z) == Cx(real_of_num(0)))) → analytic_on((z : Cart[Real, 2]) => f(z) / g(z), s)"), t1255))
}

///|
let analytic_on_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_DIV")

///|
/// `ANALYTIC_ON_DIV`
pub fn analytic_on_div() -> @kernel.Thm {
  analytic_on_div_c.get()
}

///|
/// ANALYTIC_ON_POW
fn step_252() -> Unit raise {
  let t1258 = @simp.asm_simp_tac(@list.List([analytic_on_const(), analytic_on_mul()]))
  let t1257 = @simp.rewrite_tac(@list.List([@complexes.complex_pow()]))
  let t1256 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1259 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), t1256), @tactics.disch_tac), @nums.induct_tac), t1257), t1258)
  analytic_on_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ n : Num, analytic_on(f, s) → analytic_on((z : Cart[Real, 2]) => pow(f(z), n), s)"), t1259))
}

///|
let analytic_on_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_POW")

///|
/// `ANALYTIC_ON_POW`
pub fn analytic_on_pow() -> @kernel.Thm {
  analytic_on_pow_c.get()
}

///|
/// ANALYTIC_ON_VSUM
fn step_253() -> Unit raise {
  let t1266 = @simp.asm_simp_tac(@list.List([@class.eta_ax()]))
  let t1265 = @tactics.match_mp_tac(analytic_on_add())
  let t1264 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1263 = @simp.simp_tac(@list.List([analytic_on_const(), @sets.in_insert(), @sets.not_in_empty()]))
  let t1262 = @simp.simp_tac(@list.List([@vectors.vsum_clauses()]))
  let t1261 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t1260 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t1267 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t1260), t1261), t1262), t1263), t1264), t1265), t1266)
  analytic_on_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ k : (_) -> Bool, FINITE(k) && (∀ a : _, IN(a, k) → analytic_on(f(a), s)) → analytic_on((x : Cart[Real, 2]) => vsum(k, (a : _) => f(a, x)), s)"), t1267))
}

///|
let analytic_on_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_VSUM")

///|
/// `ANALYTIC_ON_VSUM`
pub fn analytic_on_vsum() -> @kernel.Thm {
  analytic_on_vsum_c.get()
}

///|
/// ANALYTIC_AT_BALL
fn step_254() -> Unit raise {
  let t1268 = @meson.meson_tac(@list.List([]))
  let t1269 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_on(), @sets.in_sing()])), t1268)
  analytic_at_ball_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) == (∃ e : Real, real_of_num(0) < e && holomorphic_on(f, ball((z, e))))"), t1269))
}

///|
let analytic_at_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_AT_BALL")

///|
/// `ANALYTIC_AT_BALL`
pub fn analytic_at_ball() -> @kernel.Thm {
  analytic_at_ball_c.get()
}

///|
/// ANALYTIC_AT
fn step_255() -> Unit raise {
  let t1270 = @simp.rewrite_tac(@list.List([analytic_on_holomorphic(), @sets.sing_subset()]))
  analytic_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) == (∃ s : (Cart[Real, 2]) -> Bool, open(s) && IN(z, s) && holomorphic_on(f, s))"), t1270))
}

///|
let analytic_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_AT")

///|
/// `ANALYTIC_AT`
pub fn analytic_at() -> @kernel.Thm {
  analytic_at_c.get()
}

///|
/// ANALYTIC_ON_ANALYTIC_AT
fn step_256() -> Unit raise {
  let t1271 = @simp.rewrite_tac(@list.List([analytic_at_ball(), analytic_on()]))
  analytic_on_analytic_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, analytic_on(f, s) == (∀ z : Cart[Real, 2], IN(z, s) → analytic_on(f, {z}))"), t1271))
}

///|
let analytic_on_analytic_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ON_ANALYTIC_AT")

///|
/// `ANALYTIC_ON_ANALYTIC_AT`
pub fn analytic_on_analytic_at() -> @kernel.Thm {
  analytic_on_analytic_at_c.get()
}

///|
/// ANALYTIC_AT_TWO
fn step_257() -> Unit raise {
  let t1272 = @meson.meson_tac(@list.List([holomorphic_on_subset(), @topology.open_inter(), @sets.inter_subset(), @sets.in_inter()]))
  let t1273 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at()])), t1272)
  analytic_at_two_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], (analytic_on(f, {z}) && analytic_on(g, {z})) == (∃ s : (Cart[Real, 2]) -> Bool, open(s) && IN(z, s) && holomorphic_on(f, s) && holomorphic_on(g, s))"), t1273))
}

///|
let analytic_at_two_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_AT_TWO")

///|
/// `ANALYTIC_AT_TWO`
pub fn analytic_at_two() -> @kernel.Thm {
  analytic_at_two_c.get()
}

///|
/// ANALYTIC_AT_ADD
fn step_258() -> Unit raise {
  let t1275 = @meson.meson_tac(@list.List([holomorphic_on_add()]))
  let t1274 = @simp.rewrite_tac(@list.List([analytic_at()]))
  let t1276 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at_two()])), t1274), t1275)
  analytic_at_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) && analytic_on(g, {z}) → analytic_on((w : Cart[Real, 2]) => f(w) + g(w), {z})"), t1276))
}

///|
let analytic_at_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_AT_ADD")

///|
/// `ANALYTIC_AT_ADD`
pub fn analytic_at_add() -> @kernel.Thm {
  analytic_at_add_c.get()
}

///|
/// ANALYTIC_AT_SUB
fn step_259() -> Unit raise {
  let t1278 = @meson.meson_tac(@list.List([holomorphic_on_sub()]))
  let t1277 = @simp.rewrite_tac(@list.List([analytic_at()]))
  let t1279 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at_two()])), t1277), t1278)
  analytic_at_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) && analytic_on(g, {z}) → analytic_on((w : Cart[Real, 2]) => f(w) - g(w), {z})"), t1279))
}

///|
let analytic_at_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_AT_SUB")

///|
/// `ANALYTIC_AT_SUB`
pub fn analytic_at_sub() -> @kernel.Thm {
  analytic_at_sub_c.get()
}

///|
/// ANALYTIC_AT_MUL
fn step_260() -> Unit raise {
  let t1281 = @meson.meson_tac(@list.List([holomorphic_on_mul()]))
  let t1280 = @simp.rewrite_tac(@list.List([analytic_at()]))
  let t1282 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at_two()])), t1280), t1281)
  analytic_at_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) && analytic_on(g, {z}) → analytic_on((w : Cart[Real, 2]) => f(w) * g(w), {z})"), t1282))
}

///|
let analytic_at_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_AT_MUL")

///|
/// `ANALYTIC_AT_MUL`
pub fn analytic_at_mul() -> @kernel.Thm {
  analytic_at_mul_c.get()
}

///|
/// ANALYTIC_AT_POW
fn step_261() -> Unit raise {
  let t1283 = @meson.meson_tac(@list.List([holomorphic_on_pow()]))
  let t1284 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at()])), t1283)
  analytic_at_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ n : Num, ∀ z : Cart[Real, 2], analytic_on(f, {z}) → analytic_on((w : Cart[Real, 2]) => pow(f(w), n), {z})"), t1284))
}

///|
let analytic_at_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_AT_POW")

///|
/// `ANALYTIC_AT_POW`
pub fn analytic_at_pow() -> @kernel.Thm {
  analytic_at_pow_c.get()
}

///|
/// COMPLEX_DERIVATIVE_ADD_AT
fn step_262() -> Unit raise {
  let t1287 = @meson.asm_meson_tac(@list.List([holomorphic_on_imp_differentiable_at()]))
  let t1286 = @tactics.match_mp_tac(complex_derivative_add())
  let t1285 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1288 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at_two()])), t1285), t1286), t1287)
  complex_derivative_add_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) && analytic_on(g, {z}) → complex_derivative((w : Cart[Real, 2]) => f(w) + g(w), z) == complex_derivative(f, z) + complex_derivative(g, z)"), t1288))
}

///|
let complex_derivative_add_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_ADD_AT")

///|
/// `COMPLEX_DERIVATIVE_ADD_AT`
pub fn complex_derivative_add_at() -> @kernel.Thm {
  complex_derivative_add_at_c.get()
}

///|
/// COMPLEX_DERIVATIVE_SUB_AT
fn step_263() -> Unit raise {
  let t1291 = @meson.asm_meson_tac(@list.List([holomorphic_on_imp_differentiable_at()]))
  let t1290 = @tactics.match_mp_tac(complex_derivative_sub())
  let t1289 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1292 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at_two()])), t1289), t1290), t1291)
  complex_derivative_sub_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) && analytic_on(g, {z}) → complex_derivative((w : Cart[Real, 2]) => f(w) - g(w), z) == complex_derivative(f, z) - complex_derivative(g, z)"), t1292))
}

///|
let complex_derivative_sub_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_SUB_AT")

///|
/// `COMPLEX_DERIVATIVE_SUB_AT`
pub fn complex_derivative_sub_at() -> @kernel.Thm {
  complex_derivative_sub_at_c.get()
}

///|
/// COMPLEX_DERIVATIVE_MUL_AT
fn step_264() -> Unit raise {
  let t1295 = @meson.asm_meson_tac(@list.List([holomorphic_on_imp_differentiable_at()]))
  let t1294 = @tactics.match_mp_tac(complex_derivative_mul())
  let t1293 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1296 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at_two()])), t1293), t1294), t1295)
  complex_derivative_mul_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) && analytic_on(g, {z}) → complex_derivative((w : Cart[Real, 2]) => f(w) * g(w), z) == f(z) * complex_derivative(g, z) + complex_derivative(f, z) * g(z)"), t1296))
}

///|
let complex_derivative_mul_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_MUL_AT")

///|
/// `COMPLEX_DERIVATIVE_MUL_AT`
pub fn complex_derivative_mul_at() -> @kernel.Thm {
  complex_derivative_mul_at_c.get()
}

///|
/// COMPLEX_DERIVATIVE_LMUL_AT
fn step_265() -> Unit raise {
  let t1297 = @meson.meson_tac(@list.List([holomorphic_on_imp_differentiable_at(), complex_derivative_lmul()]))
  let t1298 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at()])), t1297)
  complex_derivative_lmul_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) → complex_derivative((w : Cart[Real, 2]) => c * f(w), z) == c * complex_derivative(f, z)"), t1298))
}

///|
let complex_derivative_lmul_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_LMUL_AT")

///|
/// `COMPLEX_DERIVATIVE_LMUL_AT`
pub fn complex_derivative_lmul_at() -> @kernel.Thm {
  complex_derivative_lmul_at_c.get()
}

///|
/// COMPLEX_DERIVATIVE_RMUL_AT
fn step_266() -> Unit raise {
  let t1299 = @meson.meson_tac(@list.List([holomorphic_on_imp_differentiable_at(), complex_derivative_rmul()]))
  let t1300 = @tactics.then_tac(@simp.rewrite_tac(@list.List([analytic_at()])), t1299)
  complex_derivative_rmul_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ z : Cart[Real, 2], analytic_on(f, {z}) → complex_derivative((w : Cart[Real, 2]) => f(w) * c, z) == complex_derivative(f, z) * c"), t1300))
}

///|
let complex_derivative_rmul_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_RMUL_AT")

///|
/// `COMPLEX_DERIVATIVE_RMUL_AT`
pub fn complex_derivative_rmul_at() -> @kernel.Thm {
  complex_derivative_rmul_at_c.get()
}

///|
/// HAS_VECTOR_DERIVATIVE_REAL_COMPLEX
fn step_267() -> Unit raise {
  let t1310 = @simp.rewrite_tac(@list.List([@vectors.linear(), @vectors.drop_add(), @vectors.drop_cmul(), @complexes.cx_add(), @complexes.cx_mul(), @complexes.complex_cmul()]))
  let t1309 = @tactics.match_mp_tac(@derivatives.has_derivative_linear())
  let t1308 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1307 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @complexes.complex_mul_sym(), @theorems.imp_conj()]))
  let t1302 = @term_syntax.parse_term("(a : Cart[Real, Unit])")
  let t1303 = @term_syntax.parse_term("(x : Cart[Real, 2]) => (f' : Cart[Real, 2]) * x")
  let t1304 = @term_syntax.parse_term("(x : Cart[Real, Unit]) => Cx(drop(x))")
  let t1305 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t1306 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, Unit]) => Cx(drop(x))"), t1305, t1304, t1303, t1302]), @derivatives.diff_chain_at()))
  let t1301 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul()]))
  let t1311 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative(), @derivatives.has_vector_derivative()])), t1301), t1306), t1307), t1308), t1309), t1310)
  has_vector_derivative_real_complex_c.set(@tactics.prove(@term_syntax.parse_term("has_complex_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), (f' : Cart[Real, 2]), at(Cx(drop((a : Cart[Real, Unit]))))) → has_vector_derivative((x : Cart[Real, Unit]) => f(Cx(drop(x))), f', at(a))"), t1311))
}

///|
let has_vector_derivative_real_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_VECTOR_DERIVATIVE_REAL_COMPLEX")

///|
/// `HAS_VECTOR_DERIVATIVE_REAL_COMPLEX`
pub fn has_vector_derivative_real_complex() -> @kernel.Thm {
  has_vector_derivative_real_complex_c.get()
}

///|
/// DIFFERENTIABLE_REAL_COMPLEX
fn step_268() -> Unit raise {
  let t1314 = @meson.asm_meson_tac(@list.List([has_vector_derivative_real_complex()]))
  let t1313 = @simp.rewrite_tac(@list.List([@derivatives.vector_derivative()]))
  let t1312 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1315 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_differentiable(), @derivatives.vector_derivative_works()])), t1312), t1313), t1314)
  differentiable_real_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ a : Cart[Real, Unit], complex_differentiable(f, at(Cx(drop(a)))) → differentiable((x : Cart[Real, Unit]) => f(Cx(drop(x))), at(a))"), t1315))
}

///|
let differentiable_real_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIFFERENTIABLE_REAL_COMPLEX")

///|
/// `DIFFERENTIABLE_REAL_COMPLEX`
pub fn differentiable_real_complex() -> @kernel.Thm {
  differentiable_real_complex_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_SEQUENCE
fn step_269() -> Unit raise {
  let t1322 = @meson.asm_meson_tac(@list.List([@real.real_le_rmul(), @vectors.norm_pos_le()]))
  let t1321 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_rdistrib()), @complexes.complex_norm_mul()]))
  let t1320 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t1319 = @simp.asm_simp_tac(@list.List([]))
  let t1318 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (x : Cart[Real, 2]) => (h : Cart[Real, 2]) => (f' : (Num, Cart[Real, 2]) -> Cart[Real, 2])(n, x) * h"))
  let t1317 = @tactics.match_mp_tac(@derivatives.has_derivative_sequence())
  let t1316 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1323 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative()])), t1316), t1317), t1318), t1319), @tactics.conj_tac), t1320), t1321), t1322)
  has_complex_derivative_sequence_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, ∀ f : (Num, Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : (Num, Cart[Real, 2]) -> Cart[Real, 2], ∀ g' : (Cart[Real, 2]) -> Cart[Real, 2], convex(s) && (∀ n : Num, ∀ x : Cart[Real, 2], IN(x, s) → has_complex_derivative(f(n), f'(n, x), within(at(x), s))) && (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, ∀ x : Cart[Real, 2], n >= N && IN(x, s) → norm(f'(n, x) - g'(x)) <= e)) && (∃ x : Cart[Real, 2], ∃ l : Cart[Real, 2], IN(x, s) && op_minus_minus_gt((n : Num) => f(n, x), l, sequentially)) → (∃ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], IN(x, s) → op_minus_minus_gt((n : Num) => f(n, x), g(x), sequentially) && has_complex_derivative(g, g'(x), within(at(x), s)))"), t1323))
}

///|
let has_complex_derivative_sequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_SEQUENCE")

///|
/// `HAS_COMPLEX_DERIVATIVE_SEQUENCE`
pub fn has_complex_derivative_sequence() -> @kernel.Thm {
  has_complex_derivative_sequence_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_SERIES
fn step_270() -> Unit raise {
  let t1330 = @meson.asm_meson_tac(@list.List([@real.real_le_rmul(), @vectors.norm_pos_le()]))
  let t1329 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.complex_sub_rdistrib()), @complexes.vsum_complex_rmul(), @iterate.finite_numseg(), @sets.finite_inter(), @complexes.complex_norm_mul()]))
  let t1328 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t1327 = @simp.asm_simp_tac(@list.List([]))
  let t1326 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (x : Cart[Real, 2]) => (h : Cart[Real, 2]) => (f' : (Num, Cart[Real, 2]) -> Cart[Real, 2])(n, x) * h"))
  let t1325 = @tactics.match_mp_tac(@derivatives.has_derivative_series())
  let t1324 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1331 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative()])), t1324), t1325), t1326), t1327), @tactics.conj_tac), t1328), t1329), t1330)
  has_complex_derivative_series_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, ∀ f : (Num, Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : (Num, Cart[Real, 2]) -> Cart[Real, 2], ∀ g' : (Cart[Real, 2]) -> Cart[Real, 2], ∀ k : (Num) -> Bool, convex(s) && (∀ n : Num, ∀ x : Cart[Real, 2], IN(x, s) → has_complex_derivative(f(n), f'(n, x), within(at(x), s))) && (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, ∀ x : Cart[Real, 2], n >= N && IN(x, s) → norm(vsum(INTER(k, op_dot_dot(0, n)), (i : Num) => f'(i, x)) - g'(x)) <= e)) && (∃ x : Cart[Real, 2], ∃ l : Cart[Real, 2], IN(x, s) && sums((n : Num) => f(n, x), l, k)) → (∃ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ x : Cart[Real, 2], IN(x, s) → sums((n : Num) => f(n, x), g(x), k) && has_complex_derivative(g, g'(x), within(at(x), s)))"), t1331))
}

///|
let has_complex_derivative_series_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_SERIES")

///|
/// `HAS_COMPLEX_DERIVATIVE_SERIES`
pub fn has_complex_derivative_series() -> @kernel.Thm {
  has_complex_derivative_series_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_BOUND
fn step_271() -> Unit raise {
  let t1342 = @meson.asm_meson_tac(@list.List([@real.real_le_rmul(), @vectors.norm_pos_le()]))
  let t1341 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t1340 = @tactics.disch_then(fn(x1339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(@bool.conjunct2(x1339))
  })
  let t1338 = @simp.rewrite_tac(@list.List([@complexes.linear_complex_mul()]))
  let t1337 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(h : Cart[Real, 2]) => (f' : (Cart[Real, 2]) -> Cart[Real, 2])((x : Cart[Real, 2])) * h"), @vectors.onorm_v1()))
  let t1336 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1335 = @simp.asm_simp_tac(@list.List([]))
  let t1334 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) => (h : Cart[Real, 2]) => (f' : (Cart[Real, 2]) -> Cart[Real, 2])(x) * h"))
  let t1333 = @tactics.match_mp_tac(@derivatives.differentiable_bound())
  let t1332 = @simp.rewrite_tac(@list.List([has_complex_derivative()]))
  let t1343 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1332), @tactics.strip_tac), t1333), t1334), t1335), t1336), t1337), t1338), t1340), @tactics.gen_tac), t1341), t1342)
  complex_differentiable_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ B : Real, convex(s) && (∀ x : Cart[Real, 2], IN(x, s) → has_complex_derivative(f, f'(x), within(at(x), s)) && norm(f'(x)) <= B) → (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], IN(x, s) && IN(y, s) → norm(f(x) - f(y)) <= B * norm(x - y))"), t1343))
}

///|
let complex_differentiable_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_BOUND")

///|
/// `COMPLEX_DIFFERENTIABLE_BOUND`
pub fn complex_differentiable_bound() -> @kernel.Thm {
  complex_differentiable_bound_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_INVERSE_BASIC
fn step_272() -> Unit raise {
  let t1354 = @tactics.conv_tac(@complexes.complex_field)
  let t1353 = @tactics.undisch_tac(@term_syntax.parse_term("!((f' : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t1352 = @simp.asm_rewrite_tac(@list.List([@complexes.linear_complex_mul(), @class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]))
  let t1349 = @term_syntax.parse_term("(t : (Cart[Real, 2]) -> Bool)")
  let t1350 = @term_syntax.parse_term("(x : Cart[Real, 2]) => (f' : Cart[Real, 2]) * x")
  let t1351 = @tactics.map_every(fn(x1346 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1347 = @tactics.exists_tac(x1346)
    fn(x1348 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1347(x1348)
    }
  }, @list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1350, t1349]))
  let t1345 = @tactics.match_mp_tac(@derivatives.has_derivative_inverse_basic())
  let t1344 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1355 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative()])), t1344), t1345), t1351), t1352), t1353), t1354)
  has_complex_derivative_inverse_basic_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ t : (Cart[Real, 2]) -> Bool, ∀ y : Cart[Real, 2], has_complex_derivative(f, f', at(g(y))) && !(f' == Cx(real_of_num(0))) && continuous(g, at(y)) && open(t) && IN(y, t) && (∀ z : Cart[Real, 2], IN(z, t) → f(g(z)) == z) → has_complex_derivative(g, inv(f'), at(y))"), t1355))
}

///|
let has_complex_derivative_inverse_basic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_INVERSE_BASIC")

///|
/// `HAS_COMPLEX_DERIVATIVE_INVERSE_BASIC`
pub fn has_complex_derivative_inverse_basic() -> @kernel.Thm {
  has_complex_derivative_inverse_basic_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_INVERSE_STRONG
fn step_273() -> Unit raise {
  let t1366 = @tactics.conv_tac(@complexes.complex_field)
  let t1365 = @tactics.undisch_tac(@term_syntax.parse_term("!((f' : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t1364 = @simp.asm_simp_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]))
  let t1363 = @simp.asm_rewrite_tac(@list.List([]))
  let t1361 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t1362 = @tactics.map_every(fn(x1358 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1359 = @tactics.exists_tac(x1358)
    fn(x1360 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1359(x1360)
    }
  }, @list.List([@term_syntax.parse_term("(x : Cart[Real, 2]) => (f' : Cart[Real, 2]) * x"), t1361]))
  let t1357 = @tactics.match_mp_tac(@derivatives.has_derivative_inverse_strong())
  let t1356 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1367 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative()])), t1356), t1357), t1362), t1363), t1364), t1365), t1366)
  has_complex_derivative_inverse_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ x : Cart[Real, 2], open(s) && IN(x, s) && continuous_on(f, s) && (∀ x : Cart[Real, 2], IN(x, s) → g(f(x)) == x) && has_complex_derivative(f, f', at(x)) && !(f' == Cx(real_of_num(0))) → has_complex_derivative(g, inv(f'), at(f(x)))"), t1367))
}

///|
let has_complex_derivative_inverse_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_INVERSE_STRONG")

///|
/// `HAS_COMPLEX_DERIVATIVE_INVERSE_STRONG`
pub fn has_complex_derivative_inverse_strong() -> @kernel.Thm {
  has_complex_derivative_inverse_strong_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_INVERSE_STRONG_X
fn step_274() -> Unit raise {
  let t1379 = @tactics.conv_tac(@complexes.complex_field)
  let t1378 = @tactics.undisch_tac(@term_syntax.parse_term("!((f' : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t1377 = @simp.asm_simp_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]))
  let t1376 = @simp.asm_rewrite_tac(@list.List([]))
  let t1373 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t1374 = @term_syntax.parse_term("(x : Cart[Real, 2]) => (f' : Cart[Real, 2]) * x")
  let t1375 = @tactics.map_every(fn(x1370 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1371 = @tactics.exists_tac(x1370)
    fn(x1372 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1371(x1372)
    }
  }, @list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1374, t1373]))
  let t1369 = @tactics.match_mp_tac(@derivatives.has_derivative_inverse_strong_x())
  let t1368 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1380 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([has_complex_derivative()])), t1368), t1369), t1375), t1376), t1377), t1378), t1379)
  has_complex_derivative_inverse_strong_x_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ y : Cart[Real, 2], open(s) && IN(g(y), s) && continuous_on(f, s) && (∀ x : Cart[Real, 2], IN(x, s) → g(f(x)) == x) && has_complex_derivative(f, f', at(g(y))) && !(f' == Cx(real_of_num(0))) && f(g(y)) == y → has_complex_derivative(g, inv(f'), at(y))"), t1380))
}

///|
let has_complex_derivative_inverse_strong_x_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_INVERSE_STRONG_X")

///|
/// `HAS_COMPLEX_DERIVATIVE_INVERSE_STRONG_X`
pub fn has_complex_derivative_inverse_strong_x() -> @kernel.Thm {
  has_complex_derivative_inverse_strong_x_c.get()
}

///|
/// CAUCHY_RIEMANN
fn step_275() -> Unit raise {
  let t1392 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_linear()]))
  let t1391 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@derivatives.has_derivative()])))
  let t1388 = @drule.match_mp(@derivatives.frechet_derivative_at())
  let t1390 = @tactics.first_assum(fn(x1389 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1384 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1385 = @tactics.subst1_tac(x1384)
        fn(x1386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1385(x1386)
        }
      })(@equal.sym(x1387))
    })(t1388(x1389))
  })
  let t1383 = @simp.rewrite_tac(@list.List([@derivatives.jacobian()]))
  let t1382 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ y : (Cart[Real, _]) -> Cart[Real, _], has_derivative((f : (Cart[Real, _]) -> Cart[Real, _]), y, at((z : Cart[Real, _]))) → (∃ x : _, y == (h : (_, Cart[Real, _]) -> Cart[Real, _])(x)) == (P : ((Cart[Real, _]) -> Cart[Real, _]) -> Bool)(f)) → (∃ x : _, has_derivative(f, h(x), at(z))) == ((∃ y : (Cart[Real, _]) -> Cart[Real, _], has_derivative(f, y, at(z))) && P(f))")))
  let t1381 = @simp.simp_tac(@list.List([complex_differentiable(), @derivatives.differentiable(), has_complex_derivative()]))
  let t1393 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1381), t1382), @tactics.gen_tac), @tactics.disch_tac), t1383), t1390), t1391), t1392)
  cauchy_riemann_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) == (differentiable(f, at(z)) && op_dollar(op_dollar(jacobian(f, at(z)), 1), 1) == op_dollar(op_dollar(jacobian(f, at(z)), 2), 2) && op_dollar(op_dollar(jacobian(f, at(z)), 1), 2) == -op_dollar(op_dollar(jacobian(f, at(z)), 2), 1))"), t1393))
}

///|
let cauchy_riemann_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_RIEMANN")

///|
/// `CAUCHY_RIEMANN`
pub fn cauchy_riemann() -> @kernel.Thm {
  cauchy_riemann_c.get()
}

///|
/// COMPLEX_DERIVATIVE_JACOBIAN
fn step_276() -> Unit raise {
  let t1415 = @equal.gsym(@complexes.im_def())
  let t1416 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t1415, @complexes.im(), @complexes.re(), @complexes.complex_mul()]))
  let t1414 = @simp.asm_simp_tac(@list.List([@cart.cart_eq(), @vectors.matrix_vector_mul(), @cart.dimindex_2(), @vectors.sum_2(), @calc_num.arith(), @vectors.forall_2(), @class.fun_eq_thm(), @cart.lambda_beta()]))
  let t1413 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1410 = @simp.gen_rewrite_rule(fn(x1409 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1409
  }, @list.List([@derivatives.jacobian_works()]))
  let t1412 = @tactics.first_x_assum(fn(x1411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1407 = @tactics.mp_tac(x1406)
      fn(x1408 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1407(x1408)
      }
    })(t1410(x1411))
  })
  let t1403 = @simp.gen_rewrite_rule(fn(x1402 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1402
  }, @list.List([cauchy_riemann()]))
  let t1405 = @tactics.first_assum(fn(x1404 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t1403(x1404))
  })
  let t1401 = @simp.rewrite_tac(@list.List([has_complex_derivative()]))
  let t1400 = @simp.asm_rewrite_tac(@list.List([has_complex_derivative_differentiable()]))
  let t1398 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1399 = @tactics.map_every(fn(x1395 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1396 = @tactics.exists_tac(x1395)
    fn(x1397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1396(x1397)
    }
  }, @list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1398]))
  let t1394 = @tactics.match_mp_tac(complex_derivative_unique_at())
  let t1417 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1394), t1399), t1400), t1401), t1405), t1412), t1413), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1414), t1416), @calc_rat.real_arith_tac)
  complex_derivative_jacobian_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) → complex_derivative(f, z) == complex((op_dollar(op_dollar(jacobian(f, at(z)), 1), 1), op_dollar(op_dollar(jacobian(f, at(z)), 2), 1)))"), t1417))
}

///|
let complex_derivative_jacobian_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_JACOBIAN")

///|
/// `COMPLEX_DERIVATIVE_JACOBIAN`
pub fn complex_derivative_jacobian() -> @kernel.Thm {
  complex_derivative_jacobian_c.get()
}

///|
/// JACOBIAN_COMPLEX_DERIVATIVE
fn step_277() -> Unit raise {
  let t1432 = @simp.simp_tac(@list.List([@vectors.norm_pow_2(), @vectors.dot_2(), @vectors.matrix(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith(), @complexes.complex(), @complexes.complex_mul(), @vectors.vector_2(), @complexes.im_def(), @complexes.re_def(), @vectors.basis_component()]))
  let t1429 = @drule.match_mp(@derivatives.has_frechet_derivative_unique_at())
  let t1431 = @tactics.first_assum(fn(x1430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1427 = @tactics.subst1_tac(x1426)
      fn(x1428 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1427(x1428)
      }
    })(t1429(x1430))
  })
  let t1425 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([has_complex_derivative()])))
  let t1424 = @simp.rewrite_tac(@list.List([@derivatives.jacobian()]))
  let t1421 = @calc_rat.real_arith(@term_syntax.parse_term("(y : Real) * y - -(x : Real) * x == x * x + y * y"))
  let t1422 = @equal.gsym(@vectors.norm_pow_2())
  let t1423 = @simp.asm_rewrite_tac(@list.List([@determinants.det_2(), @equal.gsym(@vectors.dot_2()), t1422, t1421]))
  let t1420 = @list.List([@meson.asm_meson_tac(@list.List([complex_differentiable()])), @tactics.strip_tac])
  let t1418 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1419 = @tactics.mp_tac(@bool.eq_imp_rule(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1418]), cauchy_riemann())).0)
  let t1433 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1419), @tactics.ants_tac), t1420), t1423), t1424), t1425), t1431), t1432), @calc_rat.real_arith_tac)
  jacobian_complex_derivative_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : Cart[Real, 2], ∀ z : Cart[Real, 2], has_complex_derivative(f, f', at(z)) → det(jacobian(f, at(z))) == pow(norm(f'), 2)"), t1433))
}

///|
let jacobian_complex_derivative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBIAN_COMPLEX_DERIVATIVE")

///|
/// `JACOBIAN_COMPLEX_DERIVATIVE`
pub fn jacobian_complex_derivative() -> @kernel.Thm {
  jacobian_complex_derivative_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_EQ_CONFORMAL
fn step_278() -> Unit raise {
  let t1484 = @simp.asm_rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()]))
  let t1481 = @drule.match_mp(@calc_rat.real_ring(@term_syntax.parse_term("pow((a : Real) * (x : Real), 2) + pow(a * (y : Real), 2) == real_of_num(1) → !(pow(x, 2) + pow(y, 2) == real_of_num(0))")))
  let t1483 = @tactics.first_x_assum(fn(x1482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1479 = @tactics.mp_tac(x1478)
      fn(x1480 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1479(x1480)
      }
    })(t1481(x1482))
  })
  let t1475 = @equal.gsym(@realarith.real_pow_2())
  let t1476 = @equal.gsym(@complexes.im_def())
  let t1477 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @equal.gsym(@complexes.re_def()), t1476, @complexes.re(), @complexes.im(), t1475]))
  let t1473 = @equal.gsym(@vectors.dot_eq_0())
  let t1474 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), t1473]))
  let t1472 = @simp.asm_simp_tac(@list.List([complex_derivative_jacobian()]))
  let t1471 = @list.List([@simp.asm_rewrite_tac(@list.List([cauchy_riemann()])), @tactics.disch_tac])
  let t1470 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t1469 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_rneg()), @real.real_eq_mul_lcancel()]))
  let t1467 = @tactics.conjuncts_then2(fn(x1461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1462 = @tactics.assume_tac(x1461)
    fn(x1463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1462(x1463)
    }
  }, fn(x1464 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1465 = @tactics.mp_tac(x1464)
    fn(x1466 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1465(x1466)
    }
  })
  let t1468 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : Real)"))(t1467))
  let t1460 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1454 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1455 = @tactics.assume_tac(x1454)
    fn(x1456 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1455(x1456)
    }
  }, fn(x1457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1458 = @tactics.mp_tac(x1457)
    fn(x1459 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1458(x1459)
    }
  }))
  let t1485 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@determinants.rotation_matrix_2(), @vectors.matrix_cmul_component()])), t1460), t1468), t1469), @tactics.strip_tac), t1470), @tactics.conj_tac), t1471), t1472), t1474), t1477), t1483), t1484)
  let t1453 = @simp.asm_simp_tac(@list.List([@real.sqrt_pow_2(), @realarith.real_le_add(), @real.real_le_pow_2()]))
  let t1452 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("pow((x : Real), 2) == (y : Real) && !(y == real_of_num(0)) → !(inv(x) == real_of_num(0)) && pow(inv(x), 2) * y == real_of_num(1)")))
  let t1451 = @tactics.exists_tac(@term_syntax.parse_term("inv(sqrt(pow(op_dollar(op_dollar(jacobian((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2]))), 2), 2), 2) + pow(op_dollar(op_dollar(jacobian(f, at(z)), 2), 1), 2)))"))
  let t1449 = @calc_rat.real_arith(@term_syntax.parse_term("pow((a : Real) * (x : Real), 2) == pow(a, 2) * pow(x, 2)"))
  let t1450 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rneg(), @equal.gsym(@realax.real_add_ldistrib()), t1449]))
  let t1448 = @simp.asm_rewrite_tac(@list.List([@vectors.matrix_cmul_component()]))
  let t1447 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([cauchy_riemann()])))
  let t1446 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def(), @determinants.rotation_matrix_2()]))
  let t1443 = @equal.gsym(@realarith.real_pow_2())
  let t1444 = @equal.gsym(@complexes.im_def())
  let t1445 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @equal.gsym(@complexes.re_def()), t1444, @complexes.re(), @complexes.im(), t1443]))
  let t1441 = @equal.gsym(@vectors.dot_eq_0())
  let t1442 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), t1441]))
  let t1440 = @simp.asm_simp_tac(@list.List([complex_differentiable_imp_differentiable(), complex_derivative_jacobian()]))
  let t1486 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x1434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1435 = @tactics.assume_tac(x1434)
    fn(x1436 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1435(x1436)
    }
  }, fn(x1437 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1438 = @tactics.mp_tac(x1437)
    fn(x1439 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1438(x1439)
    }
  })), t1440), t1442), t1445), t1446), t1447), t1448), @tactics.disch_tac), t1450), t1451), t1452), t1453), t1485])
  let t1487 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1486)
  complex_differentiable_eq_conformal_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], (complex_differentiable(f, at(z)) && !(complex_derivative(f, z) == Cx(real_of_num(0)))) == (differentiable(f, at(z)) && (∃ a : Real, !(a == real_of_num(0)) && rotation_matrix(op_pct_pct(a, jacobian(f, at(z))))))"), t1487))
}

///|
let complex_differentiable_eq_conformal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_EQ_CONFORMAL")

///|
/// `COMPLEX_DIFFERENTIABLE_EQ_CONFORMAL`
pub fn complex_differentiable_eq_conformal() -> @kernel.Thm {
  complex_differentiable_eq_conformal_c.get()
}

///|
/// HOLOMORPHIC_CONSTANT_RE
fn step_279() -> Unit raise {
  let t1533 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1532 = @simp.asm_rewrite_tac(@list.List([]))
  let t1528 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1531 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1530 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1525 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1526 = @tactics.mp_tac(x1525)
      fn(x1527 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1526(x1527)
      }
    })(((x1529 : @kernel.Thm) => @bool.spec(t1528, x1529))(x1530))
  }))
  let t1524 = @simp.simp_tac(@list.List([@vectors.dot_2(), @vectors.vec_component()]))
  let t1523 = @simp.simp_tac(@list.List([@vectors.matrix_vector_mul_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t1522 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())]))
  let t1521 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @vectors.forall_2(), @cart.dimindex_2(), @vectors.vec_component()]))
  let t1520 = @simp.rewrite_tac(@list.List([@vectors.forall_dot_eq_0()]))
  let t1519 = @simp.simp_tac(@list.List([@vectors.matrix_vector_mul_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t1518 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @complexes.re_def(), @complexes.cx_inj()]))
  let t1534 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_vec_0()])), t1518), t1519), t1520), t1521), t1522), t1523), t1524), @tactics.strip_tac), t1531), t1532), t1533)
  let t1515 = @simp.asm_simp_tac(@list.List([@derivatives.has_derivative_const(), @trivia.o_thm()]))
  let t1513 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t1514 = @tactics.map_every(fn(x1510 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1511 = @tactics.exists_tac(x1510)
    fn(x1512 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1511(x1512)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => Cx((c : Real))"), t1513]))
  let t1516 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_derivative_transform_within_open()), t1514), t1515)
  let t1509 = @simp.asm_simp_tac(@list.List([@derivatives.has_derivative_linear(), linear_cx_re()]))
  let t1517 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@derivatives.diff_chain_at()), t1509), t1516])
  let t1507 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1508 = @tactics.map_every(fn(x1504 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1505 = @tactics.exists_tac(x1504)
    fn(x1506 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1505(x1506)
    }
  }, @list.List([@term_syntax.parse_term("o(o(Cx, Re), (f : (Cart[Real, 2]) -> Cart[Real, 2]))"), t1507]))
  let t1535 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.frechet_derivative_unique_at()), t1508), @tactics.conj_tac), t1517), t1534])
  let t1503 = @tactics.subgoal_then(@term_syntax.parse_term("o(o(Cx, Re), (h : Cart[Real, 2]) => matrix_vector_mul(jacobian((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2]))), h)) == ((h : Cart[Real, 2]) => vec(0))"), fn(x1500 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1501 = @tactics.mp_tac(x1500)
    fn(x1502 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1501(x1502)
    }
  })
  let t1499 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, 2]) => matrix_vector_mul(jacobian((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2]))), h)) == ((h : Cart[Real, 2]) => vec(0))"), fn(x1497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1497
    @simp.asm_simp_tac(@list.List([@equal.gsym(th)]))
  })
  let t1496 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1495 = @simp.rewrite_tac(@list.List([cauchy_riemann(), @derivatives.jacobian_works()]))
  let t1494 = @list.List([@meson.asm_meson_tac(@list.List([holomorphic_on_imp_differentiable_at()])), @tactics.all_tac])
  let t1493 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], IN(z, (s : (Cart[Real, 2]) -> Bool)) → complex_differentiable((f : (Cart[Real, 2]) -> Cart[Real, 2]), at(z))"), fn(x1490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1491 = @tactics.mp_tac(x1490)
    fn(x1492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1491(x1492)
    }
  })
  let t1489 = @simp.asm_rewrite_tac(@list.List([]))
  let t1488 = @tactics.match_mp_tac(@derivatives.has_derivative_zero_connected_constant())
  let t1536 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1488), t1489), t1493), t1494), t1495), @tactics.strip_tac), t1496), @tactics.disch_tac), t1499), t1503), t1535)
  holomorphic_constant_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, open(s) && connected(s) && holomorphic_on(f, s) && (∃ c : Real, ∀ z : Cart[Real, 2], IN(z, s) → Re(f(z)) == c) → (∃ a : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(z, s) → f(z) == a)"), t1536))
}

///|
let holomorphic_constant_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_CONSTANT_RE")

///|
/// `HOLOMORPHIC_CONSTANT_RE`
pub fn holomorphic_constant_re() -> @kernel.Thm {
  holomorphic_constant_re_c.get()
}

///|
/// HOLOMORPHIC_CONSTANT_IM
fn step_280() -> Unit raise {
  let t1582 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1581 = @simp.asm_rewrite_tac(@list.List([]))
  let t1577 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1580 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1575 = @tactics.mp_tac(x1574)
      fn(x1576 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1575(x1576)
      }
    })(((x1578 : @kernel.Thm) => @bool.spec(t1577, x1578))(x1579))
  }))
  let t1573 = @simp.simp_tac(@list.List([@vectors.dot_2(), @vectors.vec_component()]))
  let t1572 = @simp.simp_tac(@list.List([@vectors.matrix_vector_mul_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t1571 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())]))
  let t1570 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @vectors.forall_2(), @cart.dimindex_2(), @vectors.vec_component()]))
  let t1569 = @simp.rewrite_tac(@list.List([@vectors.forall_dot_eq_0()]))
  let t1568 = @simp.simp_tac(@list.List([@vectors.matrix_vector_mul_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t1567 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @complexes.im_def(), @complexes.cx_inj()]))
  let t1583 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_vec_0()])), t1567), t1568), t1569), t1570), t1571), t1572), t1573), @tactics.strip_tac), t1580), t1581), t1582)
  let t1564 = @simp.asm_simp_tac(@list.List([@derivatives.has_derivative_const(), @trivia.o_thm()]))
  let t1562 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t1563 = @tactics.map_every(fn(x1559 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1560 = @tactics.exists_tac(x1559)
    fn(x1561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1560(x1561)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => Cx((c : Real))"), t1562]))
  let t1565 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_derivative_transform_within_open()), t1563), t1564)
  let t1558 = @simp.asm_simp_tac(@list.List([@derivatives.has_derivative_linear(), linear_cx_im()]))
  let t1566 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@derivatives.diff_chain_at()), t1558), t1565])
  let t1556 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1557 = @tactics.map_every(fn(x1553 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1554 = @tactics.exists_tac(x1553)
    fn(x1555 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1554(x1555)
    }
  }, @list.List([@term_syntax.parse_term("o(o(Cx, Im), (f : (Cart[Real, 2]) -> Cart[Real, 2]))"), t1556]))
  let t1584 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.frechet_derivative_unique_at()), t1557), @tactics.conj_tac), t1566), t1583])
  let t1552 = @tactics.subgoal_then(@term_syntax.parse_term("o(o(Cx, Im), (h : Cart[Real, 2]) => matrix_vector_mul(jacobian((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2]))), h)) == ((h : Cart[Real, 2]) => vec(0))"), fn(x1549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1550 = @tactics.mp_tac(x1549)
    fn(x1551 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1550(x1551)
    }
  })
  let t1548 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, 2]) => matrix_vector_mul(jacobian((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2]))), h)) == ((h : Cart[Real, 2]) => vec(0))"), fn(x1546 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1546
    @simp.asm_simp_tac(@list.List([@equal.gsym(th)]))
  })
  let t1545 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1544 = @simp.rewrite_tac(@list.List([cauchy_riemann(), @derivatives.jacobian_works()]))
  let t1543 = @list.List([@meson.asm_meson_tac(@list.List([holomorphic_on_imp_differentiable_at()])), @tactics.all_tac])
  let t1542 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], IN(z, (s : (Cart[Real, 2]) -> Bool)) → complex_differentiable((f : (Cart[Real, 2]) -> Cart[Real, 2]), at(z))"), fn(x1539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1540 = @tactics.mp_tac(x1539)
    fn(x1541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1540(x1541)
    }
  })
  let t1538 = @simp.asm_rewrite_tac(@list.List([]))
  let t1537 = @tactics.match_mp_tac(@derivatives.has_derivative_zero_connected_constant())
  let t1585 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1537), t1538), t1542), t1543), t1544), @tactics.strip_tac), t1545), @tactics.disch_tac), t1548), t1552), t1584)
  holomorphic_constant_im_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, open(s) && connected(s) && holomorphic_on(f, s) && (∃ c : Real, ∀ z : Cart[Real, 2], IN(z, s) → Im(f(z)) == c) → (∃ a : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(z, s) → f(z) == a)"), t1585))
}

///|
let holomorphic_constant_im_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_CONSTANT_IM")

///|
/// `HOLOMORPHIC_CONSTANT_IM`
pub fn holomorphic_constant_im() -> @kernel.Thm {
  holomorphic_constant_im_c.get()
}

///|
/// complex_differentiation_theorems
fn step_281() -> Unit raise {
  complex_differentiation_theorems_c.set(Ref::{ val: @list.List([]) })
}

///|
let complex_differentiation_theorems_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("complex_differentiation_theorems")

///|
/// `complex_differentiation_theorems`
pub fn complex_differentiation_theorems() -> Ref[@list.List[@kernel.Thm]] {
  complex_differentiation_theorems_c.get()
}

///|
/// add_complex_differentiation_theorems
fn step_282() -> Unit raise {
  let t1586 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let eta_thm = @tactics.prove(@term_syntax.parse_term("has_complex_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), (f' : Cart[Real, 2]), (net : Net[Cart[Real, 2]])) == has_complex_derivative((x : Cart[Real, 2]) => f(x), f', net)"), t1586)
  let t1594 = @simp.gen_rewrite_rule(fn(x1593 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1587 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1588 = @equal.land_conv(x1587)
      fn(x1589 : @kernel.Term) -> @kernel.Thm raise {
        s1588(x1589)
      }
    })((fn(x1590 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1591 = @equal.once_depth_conv(x1590)
      fn(x1592 : @kernel.Term) -> @kernel.Thm raise {
        s1591(x1592)
      }
    })(x1593))
  }, @list.List([eta_thm]))
  let t1595 = @simp.pure_rewrite_rule(@list.List([@theorems.imp_conj()]))
  let eta_tweak : (@kernel.Thm) -> @kernel.Thm raise = fn(x1597 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x1596 : @kernel.Thm) -> @kernel.Thm raise {
      t1595(t1594(x1596))
    })(@bool.spec_all(x1597))
  }
  add_complex_differentiation_theorems_c.set(fn(x1598 : @list.List[@kernel.Thm]) -> Unit raise {
    let l = x1598
    let t1599 = @lib.map(eta_tweak, l)
    {
      complex_differentiation_theorems().val = (complex_differentiation_theorems().val).concat(t1599)
      ()
    }
  })
}

///|
let add_complex_differentiation_theorems_c : @lib.Cell[(@list.List[@kernel.Thm]) -> Unit raise] = @lib.Cell::new("add_complex_differentiation_theorems")

///|
/// `add_complex_differentiation_theorems`
pub fn add_complex_differentiation_theorems(x : @list.List[@kernel.Thm]) -> Unit raise {
  (add_complex_differentiation_theorems_c.get())(x)
}

///|
/// Multivariate/canal.ml:2408
fn step_283() -> Unit raise {
  add_complex_differentiation_theorems(@list.List([has_complex_derivative_lmul_within(), has_complex_derivative_lmul_at(), has_complex_derivative_rmul_within(), has_complex_derivative_rmul_at(), has_complex_derivative_cdiv_within(), has_complex_derivative_cdiv_at(), has_complex_derivative_id(), has_complex_derivative_const(), has_complex_derivative_neg(), has_complex_derivative_add(), has_complex_derivative_sub(), has_complex_derivative_mul_within(), has_complex_derivative_mul_at(), has_complex_derivative_div_within(), has_complex_derivative_div_at(), has_complex_derivative_pow_within(), has_complex_derivative_pow_at(), has_complex_derivative_inv_within(), has_complex_derivative_inv_at()]))
}

///|
/// `GEN_COMPLEX_DIFF_CONV`
pub fn gen_complex_diff_conv(x1600 : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let ths = x1600
  let partfn : (@kernel.Term) -> @kernel.Term raise = fn(x1602 : @kernel.Term) -> @kernel.Term raise {
    let tm = x1602
    let (l, r) = @kernel.dest_comb(tm)
    @pair.mk_pair((@equal.lhand(l), r))
  }
  let t1603 = @term_syntax.parse_term("has_complex_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), (f' : Cart[Real, 2]), (net : Net[Cart[Real, 2]]))")
  let is_deriv : (@kernel.Term) -> Bool raise = (x1605 : @kernel.Term) => @lib.can((x1604 : @kernel.Term) => @drule.term_match(@list.List([]), t1603, x1604), x1605)
  let t1608 = @drule.match_mp(has_complex_derivative_chain_univ())
  let t1606 = @simp.rewrite_rule(@list.List([@theorems.forall_and_thm()]))
  let ths_p = @lib.unions(@lib.mapfilter(fn(x1609 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    (fn(x1607 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      @bool.conjuncts_rule(t1606(x1607))
    })(t1608(x1609))
  }, ths))
  let complex_diff_conv = (x1610 : @kernel.Term) => complex_diff_conv_l(partfn, ths_p, is_deriv, x1610)
  let complex_diff_elim = (x1619 : @kernel.Thm) => complex_diff_elim_l(partfn, ths_p, is_deriv, x1619)
  complex_diff_conv
}

///|
fn complex_diff_conv_l(partfn : (@kernel.Term) -> @kernel.Term raise, ths_p : @list.List[@kernel.Thm], is_deriv : (@kernel.Term) -> Bool raise, x1610 : @kernel.Term) -> @kernel.Thm raise {
  let complex_diff_elim = (x1619 : @kernel.Thm) => complex_diff_elim_l(partfn, ths_p, is_deriv, x1619)
  let tm_1 = x1610
  try {
    @lib.tryfind(fn(x1611 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x1611
      let t1612 = partfn(tm_1)
      @drule.part_match(partfn, th)(t1612)
    }, (complex_differentiation_theorems().val).concat(ths_p))
  } catch {
    Failure(_) => {
      let ith = @lib.tryfind(fn(x1613 : @kernel.Thm) -> @kernel.Thm raise {
        let th_1 = x1613
        let t1618 = partfn(tm_1)
        @drule.part_match(fn(x1617 : @kernel.Term) -> @kernel.Term raise {
          partfn(((x1616 : @kernel.Term) => @lib.repeat(fn(x1615 : @kernel.Term) -> @kernel.Term raise {
            (fn(x1614 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
              x1614.1
            })(@basics.dest_imp(x1615))
          }, x1616))(x1617))
        }, th_1)(t1618)
      }, (complex_differentiation_theorems().val).concat(ths_p))
      complex_diff_elim(ith)
    }
    e => raise e
  }
}

///|
fn complex_diff_elim_l(partfn : (@kernel.Term) -> @kernel.Term raise, ths_p : @list.List[@kernel.Thm], is_deriv : (@kernel.Term) -> Bool raise, x1619 : @kernel.Thm) -> @kernel.Thm raise {
  let complex_diff_conv = (x1610 : @kernel.Term) => complex_diff_conv_l(partfn, ths_p, is_deriv, x1610)
  let complex_diff_elim = (x1619 : @kernel.Thm) => complex_diff_elim_l(partfn, ths_p, is_deriv, x1619)
  let th_2 = x1619
  let tm_2 = @kernel.concl(th_2)
  if !@basics.is_imp(tm_2) {
    th_2
  } else {
    let t = @equal.lhand(tm_2)
    if !is_deriv(t) {
      @bool.undisch(th_2)
    } else {
      let t1620 = complex_diff_conv(t)
      complex_diff_elim(@drule.match_mp(th_2)(t1620))
    }
  }
}

///|
/// COMPLEX_DIFF_CONV
fn step_284() -> Unit raise {
  complex_diff_conv_c.set(gen_complex_diff_conv(@list.List([])))
}

///|
let complex_diff_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_DIFF_CONV")

///|
/// `COMPLEX_DIFF_CONV`
pub fn complex_diff_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (complex_diff_conv_c.get())(x)
}

///|
/// `GEN_COMPLEX_DIFF_TAC`
pub fn gen_complex_diff_tac(x1621 : @list.List[@kernel.Thm]) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  let ths = x1621
  let pth = @meson.meson(@list.List([]), @term_syntax.parse_term("has_complex_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), (f' : Cart[Real, 2]), (net : Net[Cart[Real, 2]])) → f' == (g' : Cart[Real, 2]) → has_complex_derivative(f, g', net)"))
  fn(x1628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1623 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x1623
      let t1625 = gen_complex_diff_conv(ths)(w)
      let th = @drule.match_mp(pth)(t1625)
      let t1627 = @bool.disch_all(th)
      @tactics.match_mp_tac(@lib.repeat(@simp.gen_rewrite_rule(fn(x1626 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x1626
      }, @list.List([@theorems.imp_imp()])), t1627))
    })(x1628)(x1628)
  }
}

///|
/// COMPLEX_DIFF_TAC
fn step_285() -> Unit raise {
  complex_diff_tac_c.set(gen_complex_diff_tac(@list.List([])))
}

///|
let complex_diff_tac_c : @lib.Cell[(@tactics.Goal) -> @tactics.Goalstate raise] = @lib.Cell::new("COMPLEX_DIFF_TAC")

///|
/// `COMPLEX_DIFF_TAC`
pub fn complex_diff_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (complex_diff_tac_c.get())(x)
}

///|
/// COMPLEX_DIFFERENTIABLE_TAC
fn step_286() -> Unit raise {
  let disch_first : (@kernel.Thm) -> @kernel.Thm raise = fn(x1629 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x1629
    @bool.disch(@lib.hd(@kernel.hyp(th)), th)
  }
  complex_differentiable_tac_c.set(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1630 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1630
  }, @list.List([complex_differentiable()])), fn(x1638 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1631 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x1631
      let th_1 = complex_diff_conv(@basics.dest_exists(w).1)
      let f_p = @kernel.rand(@kernel.rator(@kernel.concl(th_1)))
      let t1637 = if (@kernel.hyp(th_1) == @list.List([])) {
        @tactics.match_accept_tac(th_1)
      } else {
        let t1636 = disch_first(th_1)
        let t1634 = @simp.gen_rewrite_rule(fn(x1633 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x1633
        }, @list.List([@theorems.imp_imp()]))
        let th_p = @lib.repeat(fn(x1635 : @kernel.Thm) -> @kernel.Thm raise {
          t1634(disch_first(x1635))
        }, t1636)
        @tactics.match_mp_tac(th_p)
      }
      @tactics.then_tac(@tactics.exists_tac(f_p), t1637)
    })(x1638)(x1638)
  }))
}

///|
let complex_differentiable_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_TAC")

///|
/// `COMPLEX_DIFFERENTIABLE_TAC`
pub fn complex_differentiable_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (complex_differentiable_tac_c.get())(x)
}

///|
/// COMPLEX_TAYLOR
fn step_287() -> Unit raise {
  let t1644 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]))
  let t1643 = @simp.rewrite_tac(@list.List([@vectors.vsum_clauses_numseg(), @equal.gsym(@arith.add1())]))
  let t1642 = @simp.simp_tac(@list.List([@vectors.vsum_clauses_left(), @arith.le_0()]))
  let t1641 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.numseg_offset_image())]))
  let t1640 = @simp.asm_simp_tac(@list.List([@equal.gsym(@vectors.vsum_image()), @arith.eq_add_rcancel(), @iterate.finite_numseg()]))
  let t1639 = @term_syntax.parse_term("o((f : (Num) -> Cart[Real, N]), (i : Num) => i + 1)")
  let t1645 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@simp.rewrite_conv(@list.List([@trivia.o_def()]))(t1639))])), t1640), t1641), t1642), t1643), t1644), @vectors.vector_arith_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, N], vsum(op_dot_dot(0, (n : Num)), f) == f(0) - f(n + 1) + vsum(op_dot_dot(0, n), (i : Num) => f(i + 1))"), t1645)
  let t1727 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t1726 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_pow(), @complexes.complex_div(), @complexes.complex_mul_lzero(), @complexes.complex_mul_rzero(), @complexes.complex_sub_refl(), @complexes.complex_vec_0()]))
  let t1725 = @tactics.match_mp_tac(@vectors.vsum_eq_0())
  let t1724 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())]))
  let t1723 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("((x : Cart[Real, 2]) * Cx(real_of_num(1)) + (y : Cart[Real, 2]) == x) == (y == Cx(real_of_num(0)))"))]))
  let t1722 = @simp.simp_tac(@list.List([@vectors.vsum_clauses_left(), @arith.le_0(), @complexes.complex_pow(), @arith.fact(), @complexes.complex_div_1()]))
  let t1721 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_pow_add(), @realax.real_div(), @real.real_pow_1()])), @calc_rat.real_arith_tac)])
  let t1720 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1719 = @simp.asm_rewrite_tac(@list.List([@topology.ends_in_segment()]))
  let t1714 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1715 = @list.List([@term_syntax.parse_term("(z : Cart[Real, 2])"), t1714])
  let t1718 = @tactics.disch_then(fn(x1717 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1712 = @tactics.mp_tac(x1711)
      fn(x1713 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1712(x1713)
      }
    })(((x1716 : @kernel.Thm) => @bool.specl(t1715, x1716))(x1717))
  })
  let t1709 = @tactics.conv_tac(@complexes.complex_ring)
  let t1708 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_mul_rzero(), @complexes.complex_neg_0()]))
  let t1707 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_add_rid()]))
  let t1706 = @simp.rewrite_tac(@list.List([@complexes.complex_add_linv(), @equal.gsym(@complexes.complex_vec_0()), @vectors.vsum_0()]))
  let t1705 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lneg(), @complexes.complex_mul_rneg(), @complexes.complex_mul_lid()]))
  let t1704 = @simp.simp_tac(@list.List([@complexes.complex_mul_rinv(), @complexes.cx_inj(), @calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(1) == real_of_num(0))"))]))
  let t1703 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * (inv(a) * (c : Cart[Real, 2]))) == -(a * inv(a)) * (b * c)"))]))
  let t1702 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_mul(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t1700 = @equal.gsym(@realax.real_of_num_mul())
  let t1701 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), t1700, @complexes.cx_mul()]))
  let t1699 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.fact()]))
  let t1698 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t1696 = @equal.gsym(@complexes.complex_add_assoc())
  let t1697 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vsum_add_numseg()), t1696]))
  let t1695 = @simp.gen_rewrite_tac(fn(x1694 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1688 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1689 = @equal.land_conv(x1688)
      fn(x1690 : @kernel.Term) -> @kernel.Thm raise {
        s1689(x1690)
      }
    })((fn(x1691 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1692 = @equal.land_conv(x1691)
      fn(x1693 : @kernel.Term) -> @kernel.Thm raise {
        s1692(x1693)
      }
    })(x1694))
  }, @list.List([lemma]))
  let t1687 = @simp.rewrite_tac(@list.List([@vectors.vsum_add_numseg()]))
  let t1686 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1685 = @simp.asm_simp_tac(@list.List([]))
  let t1683 = @tactics.conv_tac(@complexes.complex_ring)
  let t1682 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t1681 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1673 = @simp.asm_simp_tac(@list.List([@class.eta_ax()]))
  let t1672 = @tactics.match_mp_tac(has_complex_derivative_mul_within())
  let t1671 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1670 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t1684 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(has_complex_derivative_vsum()), t1670), t1671), t1672), t1673), fn(x1680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1677 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s1675 = @tactics.mp_tac(x1674)
          fn(x1676 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s1675(x1676)
          }
        })(complex_diff_conv(x1677))
      })((fn(x1678 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1678.1
      })(x1679))
    })(x1680)(x1680)
  }), t1681), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1682), t1683), @tactics.all_tac])
  let t1669 = @tactics.subgoal_then(@term_syntax.parse_term("has_complex_derivative((u : Cart[Real, 2]) => vsum(op_dot_dot(0, (n : Num)), (i : Num) => (f : (Num, Cart[Real, 2]) -> Cart[Real, 2])(i, u) * (pow((z : Cart[Real, 2]) - u, i) / Cx(real_of_num(FACT(i))))), vsum(op_dot_dot(0, n), (i : Num) => f(i, (u : Cart[Real, 2])) * (-Cx(real_of_num(i)) * pow(z - u, i - 1) / Cx(real_of_num(FACT(i)))) + f(i + 1, u) * (pow(z - u, i) / Cx(real_of_num(FACT(i))))), within(at(u), (s : (Cart[Real, 2]) -> Bool)))"), fn(x1666 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1667 = @tactics.mp_tac(x1666)
    fn(x1668 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1667(x1668)
    }
  })
  let t1665 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@convex.convex_contains_segment()]))])
  let t1664 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)"))
  let t1663 = @tactics.match_mp_tac(has_complex_derivative_within_subset())
  let t1661 = @meson.asm_meson_tac(@list.List([@convex.segment_bound(), @vectors.norm_sub()]))
  let t1660 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t1659 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t1658 = @simp.asm_simp_tac(@list.List([@real.real_le_div2_eq(), @real.real_of_num_lt(), @arith.fact_lt()]))
  let t1657 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @vectors.norm_pos_le(), @realarith.real_pos(), @real.real_pow_le()]))
  let t1656 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1662 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_div(), @complexes.complex_norm_cx(), @complexes.complex_norm_pow(), @calc_int.real_abs_num()])), t1656), t1657), t1658), t1659), t1660), t1661)])
  let t1655 = @list.List([@meson.asm_meson_tac(@list.List([@convex.convex_contains_segment(), @sets.subset()])), @tactics.all_tac])
  let t1654 = @tactics.subgoal_then(@term_syntax.parse_term("IN((u : Cart[Real, 2]), (s : (Cart[Real, 2]) -> Bool))"), fn(x1651 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1652 = @tactics.assume_tac(x1651)
    fn(x1653 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1652(x1653)
    }
  })
  let t1650 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"))
  let t1710 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@convex.convex_segment()])), t1650), @tactics.disch_tac), t1654), t1655), @tactics.conj_tac), t1662), t1663), t1664), @tactics.conj_tac), t1665), t1669), t1684), t1685), t1686), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1687), t1695), t1697), t1698), t1699), t1701), t1702), t1703), t1704), t1705), t1706), t1707), t1708), t1709), @tactics.all_tac])
  let t1646 = @term_syntax.parse_term("(B : Real) * (pow(norm((z : Cart[Real, 2]) - (w : Cart[Real, 2])), (n : Num)) / real_of_num(FACT(n)))")
  let t1647 = @term_syntax.parse_term("segment([((w : Cart[Real, 2]), (z : Cart[Real, 2]))])")
  let t1648 = @term_syntax.parse_term("(w : Cart[Real, 2]) => (f : (Num, Cart[Real, 2]) -> Cart[Real, 2])((n : Num) + 1, w) * (pow((z : Cart[Real, 2]) - w, n) / Cx(real_of_num(FACT(n))))")
  let t1649 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(w : Cart[Real, 2]) => vsum(op_dot_dot(0, (n : Num)), (i : Num) => (f : (Num, Cart[Real, 2]) -> Cart[Real, 2])(i, w) * (pow((z : Cart[Real, 2]) - w, i) / Cx(real_of_num(FACT(i)))))"), t1648, t1647, t1646]), complex_differentiable_bound()))
  let t1728 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1649), @tactics.ants_tac), t1710), t1718), @tactics.ants_tac), t1719), t1720), @tactics.binop_tac), t1721), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1722), t1723), t1724), t1725), @nums.induct_tac), t1726), t1727), @int.arith_tac)
  complex_taylor_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, Cart[Real, 2]) -> Cart[Real, 2], ∀ n : Num, ∀ s : (Cart[Real, 2]) -> Bool, ∀ B : Real, convex(s) && (∀ i : Num, ∀ x : Cart[Real, 2], IN(x, s) && i <= n → has_complex_derivative(f(i), f(i + 1, x), within(at(x), s))) && (∀ x : Cart[Real, 2], IN(x, s) → norm(f(n + 1, x)) <= B) → (∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(w, s) && IN(z, s) → norm(f(0, z) - vsum(op_dot_dot(0, n), (i : Num) => f(i, w) * (pow(z - w, i) / Cx(real_of_num(FACT(i)))))) <= B * (pow(norm(z - w), n + 1) / real_of_num(FACT(n))))"), t1728))
}

///|
let complex_taylor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_TAYLOR")

///|
/// `COMPLEX_TAYLOR`
pub fn complex_taylor() -> @kernel.Thm {
  complex_taylor_c.get()
}

///|
/// COMPLEX_MVT
fn step_288() -> Unit raise {
  let t1735 = @simp.asm_simp_tac(@list.List([@complexes.complex_div_1(), @complexes.complex_mul_rid()]))
  let t1734 = @simp.rewrite_tac(@list.List([@complexes.complex_pow(), @real.real_pow_1(), @arith.fact(), @real.real_div_1()]))
  let t1733 = @simp.simp_tac(@list.List([@iterate.numseg_sing(), @vectors.vsum_sing(), @arith.le(), @calc_num.arith()]))
  let t1729 = @term_syntax.parse_term("(B : Real)")
  let t1730 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t1731 = @term_syntax.parse_term("0")
  let t1732 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) => if n == 0 { (f : (Cart[Real, 2]) -> Cart[Real, 2]) } else { (f' : (Cart[Real, 2]) -> Cart[Real, 2]) }"), t1731, t1730, t1729]), complex_taylor()))
  let t1736 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1732), t1733), t1734), t1735)
  complex_mvt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, ∀ B : Real, convex(s) && (∀ z : Cart[Real, 2], IN(z, s) → has_complex_derivative(f, f'(z), within(at(z), s))) && (∀ z : Cart[Real, 2], IN(z, s) → norm(f'(z)) <= B) → (∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(w, s) && IN(z, s) → norm(f(z) - f(w)) <= B * norm(z - w))"), t1736))
}

///|
let complex_mvt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MVT")

///|
/// `COMPLEX_MVT`
pub fn complex_mvt() -> @kernel.Thm {
  complex_mvt_c.get()
}

///|
/// COMPLEX_MVT_LINE
fn step_289() -> Unit raise {
  let t1783 = @simp.rewrite_tac(@list.List([@vectors.drop_vec()]))
  let t1780 = @simp.gen_rewrite_rule(fn(x1779 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1779
  }, @list.List([@topology.in_interval_1()]))
  let t1782 = @tactics.first_x_assum(fn(x1781 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1776 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1777 = @tactics.mp_tac(x1776)
      fn(x1778 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1777(x1778)
      }
    })(t1780(x1781))
  })
  let t1775 = @simp.asm_rewrite_tac(@list.List([]))
  let t1774 = @tactics.exists_tac(@term_syntax.parse_term("drop((t : Cart[Real, Unit]))"))
  let t1773 = @simp.asm_rewrite_tac(@list.List([@topology.segment(), @sets.in_elim_thm()]))
  let t1770 = @tactics.exists_tac(@term_syntax.parse_term("op_pct(real_of_num(1) - drop((t : Cart[Real, Unit])), (w : Cart[Real, 2])) + op_pct(drop(t), (z : Cart[Real, 2]))"))
  let t1769 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : Cart[Real, Unit])"))(@tactics.strip_assume_tac))
  let t1768 = @simp.rewrite_tac(@list.List([@vectors.vector_add_lid(), @vectors.vector_add_rid()]))
  let t1767 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lid(), @vectors.vector_mul_lzero()]))
  let t1766 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1771 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_thm(), @equal.gsym(@vectors.lift_sub()), @vectors.lift_eq(), @vectors.drop_vec(), @vectors.vector_sub_rzero()])), t1766), t1767), t1768), t1769), t1770)
  let t1765 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1764 = @simp.rewrite_tac(@list.List([@equal.gsym(has_complex_derivative())]))
  let t1762 = @simp.rewrite_tac(@list.List([@vectors.linear(), @vectors.drop_add(), @vectors.drop_cmul()]))
  let t1761 = @tactics.match_mp_tac(@derivatives.has_derivative_linear())
  let t1760 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_const()]))
  let t1759 = @tactics.match_mp_tac(@derivatives.has_derivative_add())
  let t1758 = @simp.gen_rewrite_tac(fn(x1757 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1753 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1747 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1748 = @equal.rator_conv(x1747)
        fn(x1749 : @kernel.Term) -> @kernel.Thm raise {
          s1748(x1749)
        }
      })((fn(x1750 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1751 = @equal.rand_conv(x1750)
        fn(x1752 : @kernel.Term) -> @kernel.Thm raise {
          s1751(x1752)
        }
      })(x1753))
    })((fn(x1754 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1755 = @equal.abs_conv(x1754)
      fn(x1756 : @kernel.Term) -> @kernel.Thm raise {
        s1755(x1756)
      }
    })(x1757))
  }, @list.List([@equal.gsym(@vectors.vector_add_lid())]))
  let t1763 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (t : Real), (w : Cart[Real, 2])) + op_pct(t, (z : Cart[Real, 2])) == w + op_pct(t, z - w)"))])), t1758), t1759), t1760), t1761), t1762), @tactics.conj_tac), @vectors.vector_arith_tac), @tactics.all_tac])
  let t1746 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t1744 = @simp.rewrite_tac(@list.List([@vectors.linear(), @vectors.lift_add(), @complexes.re_add(), @vectors.lift_cmul(), @complexes.re_cmul(), @trivia.o_def()]))
  let t1745 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_derivative_linear()), t1744)])
  let t1743 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t1742 = @tactics.match_mp_tac(@derivatives.has_derivative_at_within())
  let t1741 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t1772 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.drop_vec(), @realarith.real_pos()])), t1741), @tactics.strip_tac), t1742), t1743), @tactics.conj_tac), t1745), t1746), @tactics.conj_tac), t1763), t1764), t1765), t1771])
  let t1737 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(1)")
  let t1738 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t1739 = @term_syntax.parse_term("(u : Cart[Real, Unit]) => o(o(lift, Re), o((h : Cart[Real, 2]) => (f' : (Cart[Real, 2]) -> Cart[Real, 2])(op_pct(real_of_num(1) - drop(u), (w : Cart[Real, 2])) + op_pct(drop(u), (z : Cart[Real, 2]))) * h, (t : Cart[Real, Unit]) => op_pct(drop(t), z - w)))")
  let t1740 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("o(o(lift, Re), o((f : (Cart[Real, 2]) -> Cart[Real, 2]), (t : Cart[Real, Unit]) => op_pct(real_of_num(1) - drop(t), (w : Cart[Real, 2])) + op_pct(drop(t), (z : Cart[Real, 2]))))"), t1739, t1738, t1737]), @derivatives.mvt_very_simple()))
  let t1784 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1740), @tactics.ants_tac), t1772), t1773), t1774), t1775), t1782), t1783)
  complex_mvt_line_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], (∀ u : Cart[Real, 2], IN(u, segment([(w, z)])) → has_complex_derivative(f, f'(u), at(u))) → (∃ u : Cart[Real, 2], IN(u, segment([(w, z)])) && Re(f(z)) - Re(f(w)) == Re(f'(u) * (z - w)))"), t1784))
}

///|
let complex_mvt_line_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_MVT_LINE")

///|
/// `COMPLEX_MVT_LINE`
pub fn complex_mvt_line() -> @kernel.Thm {
  complex_mvt_line_c.get()
}

///|
/// COMPLEX_TAYLOR_MVT
fn step_290() -> Unit raise {
  let t1790 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]))
  let t1789 = @simp.rewrite_tac(@list.List([@vectors.vsum_clauses_numseg(), @equal.gsym(@arith.add1())]))
  let t1788 = @simp.simp_tac(@list.List([@vectors.vsum_clauses_left(), @arith.le_0()]))
  let t1787 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.numseg_offset_image())]))
  let t1786 = @simp.asm_simp_tac(@list.List([@equal.gsym(@vectors.vsum_image()), @arith.eq_add_rcancel(), @iterate.finite_numseg()]))
  let t1785 = @term_syntax.parse_term("o((f : (Num) -> Cart[Real, N]), (i : Num) => i + 1)")
  let t1791 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@simp.rewrite_conv(@list.List([@trivia.o_def()]))(t1785))])), t1786), t1787), t1788), t1789), t1790), @vectors.vector_arith_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, N], vsum(op_dot_dot(0, (n : Num)), f) == f(0) - f(n + 1) + vsum(op_dot_dot(0, n), (i : Num) => f(i + 1))"), t1791)
  let t1859 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_mul_rzero(), @complexes.re_cx()]))
  let t1858 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_refl(), @complexes.complex_pow(), @complexes.complex_div()]))
  let t1857 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1856 = @tactics.match_mp_tac(@iterate.sum_eq_0_numseg())
  let t1855 = @simp.simp_tac(@list.List([@complexes.re_vsum(), @iterate.finite_numseg()]))
  let t1854 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("Re((x : Cart[Real, 2])) == real_of_num(0) → (y : Real) == y + Re(x)")))
  let t1853 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rid(), @complexes.re_add()]))
  let t1852 = @simp.simp_tac(@list.List([@vectors.vsum_clauses_left(), @arith.le_0(), @complexes.complex_pow(), @arith.fact(), @complexes.complex_div_1()]))
  let t1851 = @tactics.disch_then(fn(x1850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1847 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1848 = @tactics.subst1_tac(x1847)
      fn(x1849 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1848(x1849)
      }
    })(@equal.sym(x1850))
  })
  let t1846 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_add_sym()]))(@real.real_eq_sub_radd())]))
  let t1845 = @simp.rewrite_tac(@list.List([@complexes.re_add()]))
  let t1844 = @tactics.match_mp_tac(@theorems.mono_and())
  let t1843 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"))
  let t1842 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1840 = @tactics.conv_tac(@complexes.complex_ring)
  let t1839 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_mul_rzero(), @complexes.complex_neg_0()]))
  let t1838 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_add_rid()]))
  let t1837 = @simp.rewrite_tac(@list.List([@complexes.complex_add_linv(), @equal.gsym(@complexes.complex_vec_0()), @vectors.vsum_0()]))
  let t1836 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lneg(), @complexes.complex_mul_rneg(), @complexes.complex_mul_lid()]))
  let t1835 = @simp.simp_tac(@list.List([@complexes.complex_mul_rinv(), @complexes.cx_inj(), @calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(1) == real_of_num(0))"))]))
  let t1834 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * (inv(a) * (c : Cart[Real, 2]))) == -(a * inv(a)) * (b * c)"))]))
  let t1833 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_mul(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t1831 = @equal.gsym(@realax.real_of_num_mul())
  let t1832 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), t1831, @complexes.cx_mul()]))
  let t1830 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.fact()]))
  let t1829 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t1827 = @equal.gsym(@complexes.complex_add_assoc())
  let t1828 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vsum_add_numseg()), t1827]))
  let t1826 = @simp.gen_rewrite_tac(fn(x1825 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1819 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1820 = @equal.land_conv(x1819)
      fn(x1821 : @kernel.Term) -> @kernel.Thm raise {
        s1820(x1821)
      }
    })((fn(x1822 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1823 = @equal.land_conv(x1822)
      fn(x1824 : @kernel.Term) -> @kernel.Thm raise {
        s1823(x1824)
      }
    })(x1825))
  }, @list.List([lemma]))
  let t1818 = @simp.rewrite_tac(@list.List([@vectors.vsum_add_numseg()]))
  let t1817 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1816 = @simp.asm_simp_tac(@list.List([]))
  let t1814 = @tactics.conv_tac(@complexes.complex_ring)
  let t1813 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t1812 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1804 = @simp.asm_simp_tac(@list.List([@class.eta_ax()]))
  let t1803 = @tactics.match_mp_tac(has_complex_derivative_mul_at())
  let t1802 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1801 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t1815 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(has_complex_derivative_vsum()), t1801), t1802), t1803), t1804), fn(x1811 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1810 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1808 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1805 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s1806 = @tactics.mp_tac(x1805)
          fn(x1807 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s1806(x1807)
          }
        })(complex_diff_conv(x1808))
      })((fn(x1809 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1809.1
      })(x1810))
    })(x1811)(x1811)
  }), t1812), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1813), t1814), @tactics.all_tac])
  let t1800 = @tactics.subgoal_then(@term_syntax.parse_term("has_complex_derivative((u : Cart[Real, 2]) => vsum(op_dot_dot(0, (n : Num)), (i : Num) => (f : (Num, Cart[Real, 2]) -> Cart[Real, 2])(i, u) * (pow((z : Cart[Real, 2]) - u, i) / Cx(real_of_num(FACT(i))))), vsum(op_dot_dot(0, n), (i : Num) => f(i, (u : Cart[Real, 2])) * (-Cx(real_of_num(i)) * pow(z - u, i - 1) / Cx(real_of_num(FACT(i)))) + f(i + 1, u) * (pow(z - u, i) / Cx(real_of_num(FACT(i))))), at(u))"), fn(x1797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1798 = @tactics.mp_tac(x1797)
    fn(x1799 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1798(x1799)
    }
  })
  let t1796 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"))
  let t1841 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@convex.convex_segment()])), t1796), @tactics.disch_tac), t1800), t1815), t1816), t1817), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1818), t1826), t1828), t1829), t1830), t1832), t1833), t1834), t1835), t1836), t1837), t1838), t1839), t1840), @tactics.all_tac])
  let t1792 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1793 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1794 = @term_syntax.parse_term("(w : Cart[Real, 2]) => (f : (Num, Cart[Real, 2]) -> Cart[Real, 2])((n : Num) + 1, w) * (pow((z : Cart[Real, 2]) - w, n) / Cx(real_of_num(FACT(n))))")
  let t1795 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(w : Cart[Real, 2]) => vsum(op_dot_dot(0, (n : Num)), (i : Num) => (f : (Num, Cart[Real, 2]) -> Cart[Real, 2])(i, w) * (pow((z : Cart[Real, 2]) - w, i) / Cx(real_of_num(FACT(i)))))"), t1794, t1793, t1792]), complex_mvt_line()))
  let t1860 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1795), @tactics.ants_tac), t1841), t1842), t1843), t1844), t1845), t1846), t1851), t1852), t1853), t1854), t1855), t1856), @nums.induct_tac), t1857), t1858), t1859)
  complex_taylor_mvt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ n : Num, (∀ i : Num, ∀ x : Cart[Real, 2], IN(x, segment([(w, z)])) && i <= n → has_complex_derivative(f(i), f(i + 1, x), at(x))) → (∃ u : Cart[Real, 2], IN(u, segment([(w, z)])) && Re(f(0, z)) == Re(vsum(op_dot_dot(0, n), (i : Num) => f(i, w) * (pow(z - w, i) / Cx(real_of_num(FACT(i))))) + f(n + 1, u) * (pow(z - u, n) / Cx(real_of_num(FACT(n)))) * (z - w)))"), t1860))
}

///|
let complex_taylor_mvt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_TAYLOR_MVT")

///|
/// `COMPLEX_TAYLOR_MVT`
pub fn complex_taylor_mvt() -> @kernel.Thm {
  complex_taylor_mvt_c.get()
}

///|
/// LIM_CNJ
fn step_291() -> Unit raise {
  let t1861 = @simp.rewrite_tac(@list.List([@topology.tendsto(), @vectors.dist(), @equal.gsym(@complexes.cnj_sub()), @complexes.complex_norm_cnj()]))
  lim_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_) -> Cart[Real, 2], ∀ l : Cart[Real, 2], op_minus_minus_gt((x : _) => cnj(f(x)), cnj(l), net) == op_minus_minus_gt(f, l, net)"), t1861))
}

///|
let lim_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_CNJ")

///|
/// `LIM_CNJ`
pub fn lim_cnj() -> @kernel.Thm {
  lim_cnj_c.get()
}

///|
/// SUMS_CNJ
fn step_292() -> Unit raise {
  let t1862 = @simp.simp_tac(@list.List([@topology.sums(), lim_cnj(), @equal.gsym(@complexes.cnj_vsum()), @misc.finite_inter_numseg()]))
  sums_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : (Num) -> Bool, ∀ f : (Num) -> Cart[Real, 2], ∀ l : Cart[Real, 2], sums((x : Num) => cnj(f(x)), cnj(l), net) == sums(f, l, net)"), t1862))
}

///|
let sums_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMS_CNJ")

///|
/// `SUMS_CNJ`
pub fn sums_cnj() -> @kernel.Thm {
  sums_cnj_c.get()
}

///|
/// CONTINUOUS_WITHIN_CNJ
fn step_293() -> Unit raise {
  let t1863 = @simp.simp_tac(@list.List([@topology.linear_continuous_within(), @complexes.linear_cnj()]))
  continuous_within_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, ∀ z : Cart[Real, 2], continuous(cnj, within(at(z), s))"), t1863))
}

///|
let continuous_within_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_WITHIN_CNJ")

///|
/// `CONTINUOUS_WITHIN_CNJ`
pub fn continuous_within_cnj() -> @kernel.Thm {
  continuous_within_cnj_c.get()
}

///|
/// CONTINUOUS_AT_CNJ
fn step_294() -> Unit raise {
  let t1864 = @simp.simp_tac(@list.List([@topology.linear_continuous_at(), @complexes.linear_cnj()]))
  continuous_at_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], continuous(cnj, at(z))"), t1864))
}

///|
let continuous_at_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_CNJ")

///|
/// `CONTINUOUS_AT_CNJ`
pub fn continuous_at_cnj() -> @kernel.Thm {
  continuous_at_cnj_c.get()
}

///|
/// CONTINUOUS_ON_CNJ
fn step_295() -> Unit raise {
  let t1865 = @simp.simp_tac(@list.List([@topology.linear_continuous_on(), @complexes.linear_cnj()]))
  continuous_on_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, continuous_on(cnj, s)"), t1865))
}

///|
let continuous_on_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CNJ")

///|
/// `CONTINUOUS_ON_CNJ`
pub fn continuous_on_cnj() -> @kernel.Thm {
  continuous_on_cnj_c.get()
}

///|
/// REAL_LIM
fn step_296() -> Unit raise {
  let t1869 = @meson.asm_meson_tac(@list.List([]))
  let t1868 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t1867 = @tactics.match_mp_tac(@topology.lim_component_eq())
  let t1866 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1870 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.im_def(), @complexes.real()])), t1866), t1867), t1868), t1869)
  real_lim_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ l : Cart[Real, 2], op_minus_minus_gt(f, l, net) && !trivial_limit(net) && eventually((a : A) => real(f(a)), net) → real(l)"), t1870))
}

///|
let real_lim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LIM")

///|
/// `REAL_LIM`
pub fn real_lim() -> @kernel.Thm {
  real_lim_c.get()
}

///|
/// REAL_LIM_SEQUENTIALLY
fn step_297() -> Unit raise {
  let t1873 = @meson.asm_meson_tac(@list.List([@arith.ge()]))
  let t1872 = @simp.rewrite_tac(@list.List([@metric.sequentially_v1(), @metric.eventually_sequentially(), @metric.trivial_limit_sequentially()]))
  let t1871 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), real_lim()))
  let t1874 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1871), t1872), t1873)
  real_lim_sequentially_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ l : Cart[Real, 2], op_minus_minus_gt(f, l, sequentially) && (∃ N : Num, ∀ n : Num, n >= N → real(f(n))) → real(l)"), t1874))
}

///|
let real_lim_sequentially_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LIM_SEQUENTIALLY")

///|
/// `REAL_LIM_SEQUENTIALLY`
pub fn real_lim_sequentially() -> @kernel.Thm {
  real_lim_sequentially_c.get()
}

///|
/// REAL_SERIES
fn step_298() -> Unit raise {
  let t1878 = @simp.asm_simp_tac(@list.List([@complexes.real_vsum(), @sets.finite_inter(), @iterate.finite_numseg()]))
  let t1877 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => vsum(INTER((s : (Num) -> Bool), op_dot_dot(0, n)), (f : (Num) -> Cart[Real, 2]))"))
  let t1876 = @tactics.match_mp_tac(real_lim_sequentially())
  let t1875 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1879 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.sums()])), t1875), t1876), t1877), t1878)
  real_series_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ l : Cart[Real, 2], ∀ s : (Num) -> Bool, sums(f, l, s) && (∀ n : Num, real(f(n))) → real(l)"), t1879))
}

///|
let real_series_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SERIES")

///|
/// `REAL_SERIES`
pub fn real_series() -> @kernel.Thm {
  real_series_c.get()
}

///|
/// LIM_NULL_COMPARISON_COMPLEX
fn step_299() -> Unit raise {
  let t1883 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm(), @equal.gsym(@topology.lim_null_norm())]))
  let t1882 = @tactics.exists_tac(@term_syntax.parse_term("o(norm, (g : (A) -> Cart[Real, 2]))"))
  let t1881 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("(net : Net[A])"), @topology.lim_null_comparison()))
  let t1880 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1884 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())])), t1880), t1881), t1882), t1883)
  lim_null_comparison_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ g : (A) -> Cart[Real, 2], eventually((x : A) => norm(f(x)) <= norm(g(x)), net) && op_minus_minus_gt(g, Cx(real_of_num(0)), net) → op_minus_minus_gt(f, Cx(real_of_num(0)), net)"), t1884))
}

///|
let lim_null_comparison_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPARISON_COMPLEX")

///|
/// `LIM_NULL_COMPARISON_COMPLEX`
pub fn lim_null_comparison_complex() -> @kernel.Thm {
  lim_null_comparison_complex_c.get()
}

///|
/// LIM_NULL_COMPARISON_COMPLEX_RE
fn step_300() -> Unit raise {
  let t1892 = @meson.meson_tac(@list.List([@complexes.complex_norm_ge_re_im(), @real.real_abs_le(), @realax.real_le_trans()]))
  let t1891 = @simp.rewrite_tac(@list.List([]))
  let t1888 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@metric.eventually_mono()))
  let t1890 = @tactics.first_assum(fn(x1889 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1888(x1889))
  })
  let t1887 = @simp.asm_rewrite_tac(@list.List([]))
  let t1886 = @tactics.exists_tac(@term_syntax.parse_term("(g : (A) -> Cart[Real, 2])"))
  let t1885 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("(net : Net[A])"), lim_null_comparison_complex()))
  let t1893 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1885), t1886), t1887), t1890), t1891), t1892)
  lim_null_comparison_complex_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 2], ∀ g : (A) -> Cart[Real, 2], eventually((x : A) => norm(f(x)) <= Re(g(x)), net) && op_minus_minus_gt(g, Cx(real_of_num(0)), net) → op_minus_minus_gt(f, Cx(real_of_num(0)), net)"), t1893))
}

///|
let lim_null_comparison_complex_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_COMPARISON_COMPLEX_RE")

///|
/// `LIM_NULL_COMPARISON_COMPLEX_RE`
pub fn lim_null_comparison_complex_re() -> @kernel.Thm {
  lim_null_comparison_complex_re_c.get()
}

///|
/// SERIES_COMPARISON_COMPLEX
fn step_301() -> Unit raise {
  let t1909 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t1908 = @tactics.match_mp_tac(@topology.series_component())
  let t1907 = @simp.rewrite_tac(@list.List([@complexes.re_def()]))
  let t1906 = @simp.asm_simp_tac(@list.List([@complexes.real_norm_pos(), @trivia.o_def()]))
  let t1905 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => lift(Re((g : (Num) -> Cart[Real, 2])(i)))"))
  let t1904 = @tactics.match_mp_tac(@topology.sums_eq())
  let t1903 = @tactics.exists_tac(@term_syntax.parse_term("lift(Re((l : Cart[Real, 2])))"))
  let t1902 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(l : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t1901 = @simp.asm_rewrite_tac(@list.List([]))
  let t1900 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => norm((g : (Num) -> Cart[Real, 2])(n))"))
  let t1899 = @tactics.match_mp_tac(@topology.series_comparison())
  let t1898 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x1895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1896 = @tactics.assume_tac(x1895)
    fn(x1897 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1896(x1897)
    }
  }))
  let t1894 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t1910 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1894), t1898), t1899), t1900), t1901), t1902), t1903), t1904), t1905), t1906), t1907), t1908), t1909)
  series_comparison_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, N], ∀ g : (Num) -> Cart[Real, 2], ∀ s : (Num) -> Bool, summable(s, g) && (∀ n : Num, IN(n, s) → real(g(n)) && real_of_num(0) <= Re(g(n))) && (∃ N : Num, ∀ n : Num, n >= N && IN(n, s) → norm(f(n)) <= norm(g(n))) → summable(s, f)"), t1910))
}

///|
let series_comparison_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_COMPARISON_COMPLEX")

///|
/// `SERIES_COMPARISON_COMPLEX`
pub fn series_comparison_complex() -> @kernel.Thm {
  series_comparison_complex_c.get()
}

///|
/// SERIES_COMPARISON_UNIFORM_COMPLEX
fn step_302() -> Unit raise {
  let t1926 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t1925 = @tactics.match_mp_tac(@topology.series_component())
  let t1924 = @simp.rewrite_tac(@list.List([@complexes.re_def()]))
  let t1923 = @simp.asm_simp_tac(@list.List([@complexes.real_norm_pos(), @trivia.o_def()]))
  let t1922 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => lift(Re((g : (Num) -> Cart[Real, 2])(i)))"))
  let t1921 = @tactics.match_mp_tac(@topology.sums_eq())
  let t1920 = @tactics.exists_tac(@term_syntax.parse_term("lift(Re((l : Cart[Real, 2])))"))
  let t1919 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(l : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t1918 = @simp.asm_rewrite_tac(@list.List([]))
  let t1917 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => norm((g : (Num) -> Cart[Real, 2])(n))"))
  let t1916 = @tactics.match_mp_tac(@topology.series_comparison_uniform())
  let t1915 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x1912 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1913 = @tactics.assume_tac(x1912)
    fn(x1914 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1913(x1914)
    }
  }))
  let t1911 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t1927 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1911), t1915), t1916), t1917), t1918), t1919), t1920), t1921), t1922), t1923), t1924), t1925), t1926)
  series_comparison_uniform_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, Num) -> Cart[Real, N], ∀ g : (Num) -> Cart[Real, 2], ∀ P : (A) -> Bool, ∀ s : (Num) -> Bool, summable(s, g) && (∀ n : Num, IN(n, s) → real(g(n)) && real_of_num(0) <= Re(g(n))) && (∃ N : Num, ∀ n : Num, ∀ x : A, N <= n && IN(n, s) && P(x) → norm(f(x, n)) <= norm(g(n))) → (∃ l : (A) -> Cart[Real, N], ∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, ∀ x : A, N <= n && P(x) → distance((vsum(INTER(s, op_dot_dot(0, n)), f(x)), l(x))) < e))"), t1927))
}

///|
let series_comparison_uniform_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_COMPARISON_UNIFORM_COMPLEX")

///|
/// `SERIES_COMPARISON_UNIFORM_COMPLEX`
pub fn series_comparison_uniform_complex() -> @kernel.Thm {
  series_comparison_uniform_complex_c.get()
}

///|
/// SUMMABLE_SUBSET_COMPLEX
fn step_303() -> Unit raise {
  let t1934 = @meson.meson_tac(@list.List([@realax.real_le_refl(), @vectors.norm_0(), @vectors.norm_pos_le()]))
  let t1933 = @simp.asm_rewrite_tac(@list.List([]))
  let t1932 = @tactics.exists_tac(@term_syntax.parse_term("(x : (Num) -> Cart[Real, 2])"))
  let t1931 = @tactics.match_mp_tac(series_comparison_complex())
  let t1930 = @simp.asm_rewrite_tac(@list.List([]))
  let t1929 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Num) -> Bool)"))
  let t1928 = @tactics.match_mp_tac(@topology.summable_subset())
  let t1935 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1928), t1929), t1930), t1931), t1932), t1933), t1934)
  summable_subset_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Cart[Real, 2], ∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (∀ n : Num, IN(n, s) → real(x(n)) && real_of_num(0) <= Re(x(n))) && summable(s, x) && SUBSET(t, s) → summable(t, x)"), t1935))
}

///|
let summable_subset_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_SUBSET_COMPLEX")

///|
/// `SUMMABLE_SUBSET_COMPLEX`
pub fn summable_subset_complex() -> @kernel.Thm {
  summable_subset_complex_c.get()
}

///|
/// SERIES_ABSCONV_IMP_CONV
fn step_304() -> Unit raise {
  let t1939 = @simp.rewrite_tac(@list.List([@vectors.real_abs_norm(), @realax.real_le_refl()]))
  let t1938 = @simp.asm_rewrite_tac(@list.List([@complexes.real_cx(), @complexes.re_cx(), @vectors.norm_pos_le(), @complexes.complex_norm_cx()]))
  let t1937 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => Cx(norm((x : (Num) -> Cart[Real, N])(n)))"))
  let t1936 = @tactics.match_mp_tac(series_comparison_complex())
  let t1940 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1936), t1937), t1938), t1939)
  series_absconv_imp_conv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Cart[Real, N], ∀ k : (Num) -> Bool, summable(k, (n : Num) => Cx(norm(x(n)))) → summable(k, x)"), t1940))
}

///|
let series_absconv_imp_conv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_ABSCONV_IMP_CONV")

///|
/// `SERIES_ABSCONV_IMP_CONV`
pub fn series_absconv_imp_conv() -> @kernel.Thm {
  series_absconv_imp_conv_c.get()
}

///|
/// SUMS_GP
fn step_305() -> Unit raise {
  let t1974 = @tactics.undisch_tac(@term_syntax.parse_term("(n : Num) <= (m : Num)"))
  let t1973 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @realarith.real_lt_imp_le()]))
  let t1972 = @tactics.match_mp_tac(@real.real_pow_mono_inv())
  let t1971 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_pow()]))
  let t1968 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) → (y : Real) <= x → y < e")))
  let t1970 = @tactics.first_x_assum(fn(x1969 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1968(x1969))
  })
  let t1967 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1966 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1965 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1964 = @simp.asm_rewrite_tac(@list.List([]))
  let t1962 = @term_syntax.parse_term("(e : Real)")
  let t1963 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("norm((z : Cart[Real, 2]))"), t1962]), @real.real_arch_pow_inv()))
  let t1961 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1960 = @simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((x : Cart[Real, _]), vec(0))) == norm(x)"))]))
  let t1959 = @simp.rewrite_tac(@list.List([@topology.lim_sequentially(), @equal.gsym(@complexes.complex_vec_0())]))
  let t1958 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t1957 = @tactics.match_mp_tac(@topology.lim_sub())
  let t1956 = @simp.gen_rewrite_tac(fn(x1955 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1949 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1950 = @equal.rator_conv(x1949)
      fn(x1951 : @kernel.Term) -> @kernel.Thm raise {
        s1950(x1951)
      }
    })((fn(x1952 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1953 = @equal.rand_conv(x1952)
      fn(x1954 : @kernel.Term) -> @kernel.Thm raise {
        s1953(x1954)
      }
    })(x1955))
  }, @list.List([@equal.gsym(@complexes.complex_sub_rzero())]))
  let t1948 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_0(), @topology.lim_const()]))
  let t1975 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lim_complex_div()), t1948), t1956), t1957), t1958), t1959), t1960), t1961), @tactics.disch_tac), t1963), t1964), t1965), t1966), @tactics.disch_tac), t1967), @tactics.disch_tac), t1970), t1971), t1972), t1973), t1974), @int.arith_tac)
  let t1947 = @simp.simp_tac(@list.List([@equal.gsym(@arith.not_le())]))
  let t1946 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t1976 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@metric.eventually_sequentially()])), t1946), t1947), t1975])
  let t1945 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => (pow((z : Cart[Real, 2]), (n : Num)) - pow(z, SUC(m))) / (Cx(real_of_num(1)) - z)"))
  let t1944 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t1943 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_norm_num(), @realarith.real_lt_refl()])), @tactics.all_tac])
  let t1942 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(1))"))
  let t1941 = @simp.rewrite_tac(@list.List([@topology.series_from(), @complexes.vsum_gp()]))
  let t1977 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1941), t1942), t1943), t1944), t1945), @tactics.conj_tac), t1976)
  sums_gp_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ z : Cart[Real, 2], norm(z) < real_of_num(1) → sums((k : Num) => pow(z, k), pow(z, n) / (Cx(real_of_num(1)) - z), from(n))"), t1977))
}

///|
let sums_gp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMS_GP")

///|
/// `SUMS_GP`
pub fn sums_gp() -> @kernel.Thm {
  sums_gp_c.get()
}

///|
/// SUMMABLE_GP
fn step_306() -> Unit raise {
  let t1984 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_pow(), @complexes.complex_norm_mul(), @realax.real_le_refl()]))
  let t1982 = @term_syntax.parse_term("0")
  let t1983 = @tactics.map_every(fn(x1979 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1980 = @tactics.exists_tac(x1979)
    fn(x1981 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1980(x1981)
    }
  }, @list.List([@term_syntax.parse_term("norm((z : Cart[Real, 2]))"), t1982]))
  let t1978 = @tactics.match_mp_tac(@topology.summable_ratio())
  let t1985 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1978), t1983), t1984)
  summable_gp_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ k : (Num) -> Bool, norm(z) < real_of_num(1) → summable(k, (n : Num) => pow(z, n))"), t1985))
}

///|
let summable_gp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_GP")

///|
/// `SUMMABLE_GP`
pub fn summable_gp() -> @kernel.Thm {
  summable_gp_c.get()
}

///|
/// SERIES_DIRICHLET_COMPLEX_GEN
fn step_307() -> Unit raise {
  let t2005 = @simp.simp_tac(@list.List([@equal.gsym(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@vectors.lift_sum())), @iterate.finite_numseg(), @sets.finite_inter(), @complexes.vsum_cx(), @vectors.norm_lift(), @complexes.complex_norm_cx()]))
  let t2004 = @simp.rewrite_tac(@list.List([@topology.summable(), @topology.series_cauchy()]))
  let t2001 = @simp.gen_rewrite_rule(fn(x2000 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2000
  }, @list.List([@topology.summable()]))
  let t2003 = @tactics.first_x_assum(fn(x2002 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1998 = @tactics.mp_tac(x1997)
      fn(x1999 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1998(x1999)
      }
    })(t2001(x2002))
  })
  let t1996 = @simp.asm_rewrite_tac(@list.List([]))
  let t1995 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t1994 = @simp.asm_rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t1991 = @term_syntax.parse_term("(l : Cart[Real, 2])")
  let t1992 = @term_syntax.parse_term("(p : Num)")
  let t1993 = @tactics.map_every(fn(x1988 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1989 = @tactics.exists_tac(x1988)
    fn(x1990 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1989(x1990)
    }
  }, @list.List([@term_syntax.parse_term("(m : Num)"), t1992, t1991]))
  let t1987 = @tactics.match_mp_tac(@topology.series_dirichlet_bilinear())
  let t1986 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t2006 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1986), t1987), t1993), t1994), t1995), t1996), t2003), t2004), t2005)
  series_dirichlet_complex_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ g : (Num) -> Cart[Real, 2], ∀ k : Num, ∀ m : Num, ∀ p : Num, ∀ l : Cart[Real, 2], bounded({vsum(op_dot_dot(m, (n : Num)), f) | IN(n, UNIV)}) && summable(from(p), (n : Num) => Cx(norm(g(n + 1) - g(n)))) && op_minus_minus_gt((n : Num) => vsum(op_dot_dot(1, n), f) * g(n + 1), l, sequentially) → summable(from(k), (n : Num) => f(n) * g(n))"), t2006))
}

///|
let series_dirichlet_complex_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_DIRICHLET_COMPLEX_GEN")

///|
/// `SERIES_DIRICHLET_COMPLEX_GEN`
pub fn series_dirichlet_complex_gen() -> @kernel.Thm {
  series_dirichlet_complex_gen_c.get()
}

///|
/// SERIES_DIRICHLET_COMPLEX
fn step_308() -> Unit raise {
  let t2023 = @meson.asm_meson_tac(@list.List([@complexes.real_v1(), @complexes.complex_mul_sym()]))
  let t2022 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul(), @class.fun_eq_thm()]))
  let t2024 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_imp()), @tactics.ap_term_tac), t2022), t2023)
  let t2021 = @meson.meson_tac(@list.List([@complexes.complex_norm_ge_re_im(), @realarith.real_let_trans()]))
  let t2020 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_rzero(), @vectors.norm_lift()]))
  let t2019 = @simp.rewrite_tac(@list.List([@topology.lim_sequentially(), @trivia.o_thm(), @vectors.dist(), @vectors.vector_sub_rzero()]))
  let t2017 = @simp.gen_rewrite_rule(fn(x2016 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2016
  }, @list.List([@topology.lim_sequentially()]))
  let t2025 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2018 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2013 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2014 = @tactics.mp_tac(x2013)
      fn(x2015 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2014(x2015)
      }
    })(t2017(x2018))
  }), t2019), t2020), t2021), t2024])
  let t2012 = @simp.asm_rewrite_tac(@list.List([]))
  let t2007 = @term_syntax.parse_term("(m : Num)")
  let t2008 = @term_syntax.parse_term("(k : Num)")
  let t2009 = @term_syntax.parse_term("(N : Num)")
  let t2010 = @term_syntax.parse_term("(n : Num) => Re((g : (Num) -> Cart[Real, 2])(n))")
  let t2011 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t2010, t2009, t2008, t2007]), @topology.series_dirichlet()))
  let t2026 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2011), t2012), @tactics.ants_tac), t2025)
  series_dirichlet_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ g : (Num) -> Cart[Real, 2], ∀ N : Num, ∀ k : Num, ∀ m : Num, bounded({vsum(op_dot_dot(m, (n : Num)), f) | IN(n, UNIV)}) && (∀ n : Num, real(g(n))) && (∀ n : Num, N <= n → Re(g(n + 1)) <= Re(g(n))) && op_minus_minus_gt(g, Cx(real_of_num(0)), sequentially) → summable(from(k), (n : Num) => f(n) * g(n))"), t2026))
}

///|
let series_dirichlet_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_DIRICHLET_COMPLEX")

///|
/// `SERIES_DIRICHLET_COMPLEX`
pub fn series_dirichlet_complex() -> @kernel.Thm {
  series_dirichlet_complex_c.get()
}

///|
/// SERIES_DIRICHLET_COMPLEX_VERY_EXPLICIT
fn step_309() -> Unit raise {
  let t2068 = @simp.asm_simp_tac(@list.List([@complexes.real_norm(), @realax.real_abs()]))
  let t2067 = @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) <= (m : Num) && p <= m + 1 && p <= (n : Num) && p <= n + 1"), @tactics.strip_assume_tac)
  let t2066 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t2065 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2063 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @arith.le_refl()]))
  let t2064 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t2063), @tactics.all_tac])))
  let t2062 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(w : Real) * (n1 : Real) <= w * (B : Real) && (z : Real) * (n2 : Real) <= z * B && real_of_num(0) <= B * (real_of_num(2) * (y : Real) - ((x : Real) + (w + z))) → x * B <= real_of_num(2) * (B * y) - w * n1 - z * n2")))
  let t2061 = @simp.asm_rewrite_tac(@list.List([@iterate.sum_diffs(), @complexes.complex_norm_mul()]))
  let t2059 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real) - (y : Real)) == y - x) == (x <= y)"))]))
  let t2058 = @simp.asm_simp_tac(@list.List([@complexes.real_norm(), @complexes.real_sub(), @complexes.re_sub()]))
  let t2057 = @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) <= (i : Num) && p <= i + 1"), fn(x2054 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2055 = @tactics.assume_tac(x2054)
    fn(x2056 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2055(x2056)
    }
  })
  let t2053 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t2052 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t2051 = @tactics.match_mp_tac(@real.real_eq_imp_le())
  let t2060 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@iterate.sum_rmul(), @real.real_le_rmul_eq()])), t2051), t2052), t2053), @tactics.strip_tac), t2057), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t2058), t2059), @tactics.all_tac])
  let t2050 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot((m : Num), (n : Num)), (k : Num) => Re((g : (Num) -> Cart[Real, 2])(k)) - Re(g(k + 1))) * (B : Real)"))
  let t2049 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2047 = @simp.asm_simp_tac(@list.List([@realax.real_le_refl(), @arith.le_refl(), @vectors.norm_pos_le()]))
  let t2046 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2045 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2044 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t2043 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @iterate.finite_numseg()]))
  let t2048 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_norm_le()), t2043), t2044), @tactics.strip_tac), t2045), t2046), t2047), @tactics.all_tac])
  let t2042 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot((m : Num), (n : Num)), (k : Num) => norm((g : (Num) -> Cart[Real, 2])(k + 1) - g(k)) * (B : Real))"))
  let t2041 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2040 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((c : Cart[Real, 2])) <= (e : Real) - norm((a : Cart[Real, 2])) - norm((b : Cart[Real, 2])) → norm(a - b - c) <= e")))
  let t2039 = @simp.asm_simp_tac(@list.List([@vectors.norm_0(), @realax.real_le_mul(), @realarith.real_pos(), @realarith.real_lt_imp_le(), @vectors.norm_pos_le()]))
  let t2038 = @simp.rewrite_tac(@list.List([@drule.match_mp(@vectors.bilinear_vsum_partial_pre())(@complexes.bilinear_complex_mul())]))
  let t2037 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t2035 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @iterate.finite_numseg(), @iterate.in_numseg()]))
  let t2034 = @tactics.subgoal_then(@term_syntax.parse_term("(p : Num) <= (k : Num)"), fn(x2032 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2032
    @simp.simp_tac(@list.List([@equal.gsym(@drule.match_mp(@iterate.numseg_rrec())(th))]))
  })
  let t2031 = @simp.rewrite_tac(@list.List([]))
  let t2030 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t2029 = @tactics.match_mp_tac(@vectors.vsum_eq_numseg())
  let t2036 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_imp_le()), @tactics.ap_term_tac), t2029), t2030), @tactics.strip_tac), t2031), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2034), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t2035), @class.cond_cases_tac), @list.List([@int.asm_arith_tac, @vectors.vector_arith_tac])), @tactics.all_tac])
  let t2028 = @tactics.exists_tac(@term_syntax.parse_term("norm(vsum(op_dot_dot((m : Num), (n : Num)), (k : Num) => (vsum(op_dot_dot((p : Num), k), (f : (Num) -> Cart[Real, 2])) - vsum(op_dot_dot(p, k - 1), f)) * (g : (Num) -> Cart[Real, 2])(k)))"))
  let t2027 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2069 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2027), t2028), @tactics.conj_tac), t2036), t2037), t2038), @class.cond_cases_tac), t2039), t2040), t2041), t2042), @tactics.conj_tac), t2048), t2049), t2050), @tactics.conj_tac), t2060), t2061), t2062), t2064), t2065), t2066), t2067), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t2068), @calc_rat.real_arith_tac)
  series_dirichlet_complex_very_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ g : (Num) -> Cart[Real, 2], ∀ B : Real, ∀ p : Num, real_of_num(0) < B && 1 <= p && (∀ m : Num, ∀ n : Num, p <= m → norm(vsum(op_dot_dot(m, n), f)) <= B) && (∀ n : Num, p <= n → real(g(n)) && real_of_num(0) <= Re(g(n))) && (∀ n : Num, p <= n → Re(g(n + 1)) <= Re(g(n))) → (∀ m : Num, ∀ n : Num, p <= m → norm(vsum(op_dot_dot(m, n), (k : Num) => f(k) * g(k))) <= real_of_num(2) * (B * norm(g(m))))"), t2069))
}

///|
let series_dirichlet_complex_very_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_DIRICHLET_COMPLEX_VERY_EXPLICIT")

///|
/// `SERIES_DIRICHLET_COMPLEX_VERY_EXPLICIT`
pub fn series_dirichlet_complex_very_explicit() -> @kernel.Thm {
  series_dirichlet_complex_very_explicit_c.get()
}

///|
/// SERIES_DIRICHLET_COMPLEX_EXPLICIT
fn step_310() -> Unit raise {
  let t2083 = @simp.asm_simp_tac(@list.List([]))
  let t2082 = @tactics.match_mp_tac(series_dirichlet_complex_very_explicit())
  let t2081 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), @real.real_lt_mul(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t2080 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * (B : Real)"))
  let t2079 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : Real)"))
  let t2078 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ a : _, ∀ b : _, x == (f : (_, _) -> _)(a, b) → (p : (_, _) -> Bool)(a, b)) == (∀ a : _, ∀ b : _, p(a, b))"))]))
  let t2077 = @simp.simp_tac(@list.List([@topology.bounded_pos(), @sets.in_elim_thm(), @sets.in_univ(), @theorems.left_imp_exists_thm()]))
  let t2074 = @drule.match_mp(@topology.bounded_partial_sums())
  let t2076 = @tactics.first_x_assum(fn(x2075 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2071 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2072 = @tactics.mp_tac(x2071)
      fn(x2073 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2072(x2073)
      }
    })(t2074(x2075))
  })
  let t2070 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2084 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.forall_and_thm()])), t2070), t2076), t2077), t2078), t2079), @tactics.strip_tac), t2080), t2081), t2082), t2083)
  series_dirichlet_complex_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ g : (Num) -> Cart[Real, 2], ∀ p : Num, ∀ q : Num, 1 <= p && bounded({vsum(op_dot_dot(q, (n : Num)), f) | IN(n, UNIV)}) && (∀ n : Num, p <= n → real(g(n)) && real_of_num(0) <= Re(g(n))) && (∀ n : Num, p <= n → Re(g(n + 1)) <= Re(g(n))) → (∃ B : Real, real_of_num(0) < B && (∀ m : Num, ∀ n : Num, p <= m → norm(vsum(op_dot_dot(m, n), (k : Num) => f(k) * g(k))) <= B * norm(g(m))))"), t2084))
}

///|
let series_dirichlet_complex_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_DIRICHLET_COMPLEX_EXPLICIT")

///|
/// `SERIES_DIRICHLET_COMPLEX_EXPLICIT`
pub fn series_dirichlet_complex_explicit() -> @kernel.Thm {
  series_dirichlet_complex_explicit_c.get()
}

///|
/// HAS_INTEGRAL_COMPLEX_LMUL
fn step_311() -> Unit raise {
  let t2087 = @tactics.conv_tac(@complexes.complex_ring)
  let t2086 = @simp.asm_rewrite_tac(@list.List([@vectors.linear(), @complexes.complex_cmul()]))
  let t2085 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@integration.has_integral_linear()))
  let t2088 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2085), t2086), t2087)
  has_integral_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ i : (Cart[Real, _]) -> Bool, ∀ c : Cart[Real, 2], has_integral(f, y, i) → has_integral((x : Cart[Real, _]) => c * f(x), c * y, i)"), t2088))
}

///|
let has_integral_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_INTEGRAL_COMPLEX_LMUL")

///|
/// `HAS_INTEGRAL_COMPLEX_LMUL`
pub fn has_integral_complex_lmul() -> @kernel.Thm {
  has_integral_complex_lmul_c.get()
}

///|
/// HAS_INTEGRAL_COMPLEX_RMUL
fn step_312() -> Unit raise {
  let t2089 = @simp.rewrite_tac(@list.List([has_integral_complex_lmul()]))
  let t2090 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t2089)
  has_integral_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ i : (Cart[Real, _]) -> Bool, ∀ c : Cart[Real, 2], has_integral(f, y, i) → has_integral((x : Cart[Real, _]) => f(x) * c, y * c, i)"), t2090))
}

///|
let has_integral_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_INTEGRAL_COMPLEX_RMUL")

///|
/// `HAS_INTEGRAL_COMPLEX_RMUL`
pub fn has_integral_complex_rmul() -> @kernel.Thm {
  has_integral_complex_rmul_c.get()
}

///|
/// HAS_INTEGRAL_COMPLEX_0
fn step_313() -> Unit raise {
  let t2091 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @integration.has_integral_0()]))
  has_integral_complex_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, has_integral((x : Cart[Real, _]) => Cx(real_of_num(0)), Cx(real_of_num(0)), s)"), t2091))
}

///|
let has_integral_complex_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_INTEGRAL_COMPLEX_0")

///|
/// `HAS_INTEGRAL_COMPLEX_0`
pub fn has_integral_complex_0() -> @kernel.Thm {
  has_integral_complex_0_c.get()
}

///|
/// INTEGRABLE_COMPLEX_LMUL
fn step_314() -> Unit raise {
  let t2092 = @meson.meson_tac(@list.List([has_integral_complex_lmul()]))
  let t2093 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.integrable_on()])), t2092)
  integrable_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, ∀ c : Cart[Real, 2], integrable_on(f, s) → integrable_on((x : Cart[Real, N]) => c * f(x), s)"), t2093))
}

///|
let integrable_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRABLE_COMPLEX_LMUL")

///|
/// `INTEGRABLE_COMPLEX_LMUL`
pub fn integrable_complex_lmul() -> @kernel.Thm {
  integrable_complex_lmul_c.get()
}

///|
/// INTEGRABLE_COMPLEX_RMUL
fn step_315() -> Unit raise {
  let t2094 = @simp.rewrite_tac(@list.List([integrable_complex_lmul()]))
  let t2095 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t2094)
  integrable_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, ∀ c : Cart[Real, 2], integrable_on(f, s) → integrable_on((x : Cart[Real, N]) => f(x) * c, s)"), t2095))
}

///|
let integrable_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRABLE_COMPLEX_RMUL")

///|
/// `INTEGRABLE_COMPLEX_RMUL`
pub fn integrable_complex_rmul() -> @kernel.Thm {
  integrable_complex_rmul_c.get()
}

///|
/// INTEGRABLE_COMPLEX_0
fn step_316() -> Unit raise {
  let t2096 = @meson.meson_tac(@list.List([has_integral_complex_0()]))
  let t2097 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.integrable_on()])), t2096)
  integrable_complex_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, integrable_on((x : Cart[Real, _]) => Cx(real_of_num(0)), s)"), t2097))
}

///|
let integrable_complex_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRABLE_COMPLEX_0")

///|
/// `INTEGRABLE_COMPLEX_0`
pub fn integrable_complex_0() -> @kernel.Thm {
  integrable_complex_0_c.get()
}

///|
/// INTEGRABLE_COMPLEX_LMUL_EQ
fn step_317() -> Unit raise {
  let t2111 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_assoc(), @complexes.complex_mul_lid(), @complexes.complex_mul_linv(), @class.eta_ax()]))
  let t2108 = @drule.match_mp(integrable_complex_lmul())
  let t2105 = @term_syntax.parse_term("inv((c : Cart[Real, 2]))")
  let t2110 = @tactics.first_x_assum(fn(x2109 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2103 = @tactics.mp_tac(x2102)
        fn(x2104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2103(x2104)
        }
      })(((x2106 : @kernel.Thm) => @bool.spec(t2105, x2106))(x2107))
    })(t2108(x2109))
  })
  let t2101 = @simp.asm_rewrite_tac(@list.List([]))
  let t2100 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t2099 = @simp.rewrite_tac(@list.List([integrable_complex_0()]))
  let t2098 = @simp.asm_simp_tac(@list.List([integrable_complex_lmul(), @complexes.complex_mul_lzero()]))
  let t2112 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.orelse_tac(@tactics.strip_tac, @tactics.eq_tac)), t2098), t2099), t2100), t2101), t2110), t2111)
  integrable_complex_lmul_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, ∀ c : Cart[Real, 2], integrable_on((x : Cart[Real, N]) => c * f(x), s) == (c == Cx(real_of_num(0)) || integrable_on(f, s))"), t2112))
}

///|
let integrable_complex_lmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRABLE_COMPLEX_LMUL_EQ")

///|
/// `INTEGRABLE_COMPLEX_LMUL_EQ`
pub fn integrable_complex_lmul_eq() -> @kernel.Thm {
  integrable_complex_lmul_eq_c.get()
}

///|
/// INTEGRABLE_COMPLEX_RMUL_EQ
fn step_318() -> Unit raise {
  let t2113 = @simp.rewrite_tac(@list.List([integrable_complex_lmul_eq()]))
  let t2114 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t2113)
  integrable_complex_rmul_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, ∀ c : Cart[Real, 2], integrable_on((x : Cart[Real, N]) => f(x) * c, s) == (c == Cx(real_of_num(0)) || integrable_on(f, s))"), t2114))
}

///|
let integrable_complex_rmul_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRABLE_COMPLEX_RMUL_EQ")

///|
/// `INTEGRABLE_COMPLEX_RMUL_EQ`
pub fn integrable_complex_rmul_eq() -> @kernel.Thm {
  integrable_complex_rmul_eq_c.get()
}

///|
/// INTEGRAL_COMPLEX_LMUL
fn step_319() -> Unit raise {
  let t2117 = @simp.asm_simp_tac(@list.List([@integration.integrable_integral()]))
  let t2116 = @tactics.match_mp_tac(has_integral_complex_lmul())
  let t2115 = @tactics.match_mp_tac(@integration.integral_unique())
  let t2118 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2115), t2116), t2117)
  integral_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, ∀ c : Cart[Real, 2], integrable_on(f, s) → integral(s, (x : Cart[Real, N]) => c * f(x)) == c * integral(s, f)"), t2118))
}

///|
let integral_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_COMPLEX_LMUL")

///|
/// `INTEGRAL_COMPLEX_LMUL`
pub fn integral_complex_lmul() -> @kernel.Thm {
  integral_complex_lmul_c.get()
}

///|
/// INTEGRAL_COMPLEX_RMUL
fn step_320() -> Unit raise {
  let t2119 = @simp.rewrite_tac(@list.List([integral_complex_lmul()]))
  let t2120 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t2119)
  integral_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, ∀ c : Cart[Real, 2], integrable_on(f, s) → integral(s, (x : Cart[Real, N]) => f(x) * c) == integral(s, f) * c"), t2120))
}

///|
let integral_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_COMPLEX_RMUL")

///|
/// `INTEGRAL_COMPLEX_RMUL`
pub fn integral_complex_rmul() -> @kernel.Thm {
  integral_complex_rmul_c.get()
}

///|
/// ABSOLUTELY_INTEGRABLE_COMPLEX_LMUL
fn step_321() -> Unit raise {
  let t2121 = @simp.simp_tac(@list.List([@complexes.complex_norm_mul(), @vectors.lift_cmul(), @integration.integrable_cmul()]))
  let t2122 = @tactics.then_tac(@simp.simp_tac(@list.List([@integration.absolutely_integrable_on(), integrable_complex_lmul()])), t2121)
  absolutely_integrable_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ s : (Cart[Real, _]) -> Bool, ∀ c : Cart[Real, 2], absolutely_integrable_on(f, s) → absolutely_integrable_on((x : Cart[Real, _]) => c * f(x), s)"), t2122))
}

///|
let absolutely_integrable_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_INTEGRABLE_COMPLEX_LMUL")

///|
/// `ABSOLUTELY_INTEGRABLE_COMPLEX_LMUL`
pub fn absolutely_integrable_complex_lmul() -> @kernel.Thm {
  absolutely_integrable_complex_lmul_c.get()
}

///|
/// ABSOLUTELY_INTEGRABLE_COMPLEX_RMUL
fn step_322() -> Unit raise {
  let t2123 = @simp.rewrite_tac(@list.List([absolutely_integrable_complex_lmul()]))
  let t2124 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t2123)
  absolutely_integrable_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, 2], ∀ s : (Cart[Real, _]) -> Bool, ∀ c : Cart[Real, 2], absolutely_integrable_on(f, s) → absolutely_integrable_on((x : Cart[Real, _]) => f(x) * c, s)"), t2124))
}

///|
let absolutely_integrable_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_INTEGRABLE_COMPLEX_RMUL")

///|
/// `ABSOLUTELY_INTEGRABLE_COMPLEX_RMUL`
pub fn absolutely_integrable_complex_rmul() -> @kernel.Thm {
  absolutely_integrable_complex_rmul_c.get()
}

///|
/// REAL_COMPLEX_INTEGRAL
fn step_323() -> Unit raise {
  let t2129 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.lift_num()), @vectors.lift_eq()]))
  let t2128 = @tactics.match_mp_tac(@integration.integral_eq_0())
  let t2127 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_eq()), @vectors.lift_drop(), @vectors.lift_num()]))
  let t2126 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2125 = @simp.simp_tac(@list.List([@integration.integral_component()]))
  let t2130 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.real(), @complexes.im_def()])), t2125), t2126), t2127), t2128), t2129)
  real_complex_integral_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, integrable_on(f, s) && (∀ x : Cart[Real, N], IN(x, s) → real(f(x))) → real(integral(s, f))"), t2130))
}

///|
let real_complex_integral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_COMPLEX_INTEGRAL")

///|
/// `REAL_COMPLEX_INTEGRAL`
pub fn real_complex_integral() -> @kernel.Thm {
  real_complex_integral_c.get()
}

///|
/// INTEGRABLE_BOUNDED_VARIATION_COMPLEX_LMUL
fn step_324() -> Unit raise {
  let t2132 = @simp.asm_rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t2131 = @tactics.match_mp_tac(@integration.integrable_bounded_variation_bilinear_lmul())
  let t2133 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2131), t2132)
  integrable_bounded_variation_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ a : Cart[Real, Unit], ∀ b : Cart[Real, Unit], integrable_on(f, interval([(a, b)])) && has_bounded_variation_on(g, interval([(a, b)])) → integrable_on((x : Cart[Real, Unit]) => g(x) * f(x), interval([(a, b)]))"), t2133))
}

///|
let integrable_bounded_variation_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRABLE_BOUNDED_VARIATION_COMPLEX_LMUL")

///|
/// `INTEGRABLE_BOUNDED_VARIATION_COMPLEX_LMUL`
pub fn integrable_bounded_variation_complex_lmul() -> @kernel.Thm {
  integrable_bounded_variation_complex_lmul_c.get()
}

///|
/// INTEGRABLE_BOUNDED_VARIATION_COMPLEX_RMUL
fn step_325() -> Unit raise {
  let t2134 = @simp.rewrite_tac(@list.List([integrable_bounded_variation_complex_lmul()]))
  let t2135 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()])), t2134)
  integrable_bounded_variation_complex_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ a : Cart[Real, Unit], ∀ b : Cart[Real, Unit], integrable_on(f, interval([(a, b)])) && has_bounded_variation_on(g, interval([(a, b)])) → integrable_on((x : Cart[Real, Unit]) => f(x) * g(x), interval([(a, b)]))"), t2135))
}

///|
let integrable_bounded_variation_complex_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRABLE_BOUNDED_VARIATION_COMPLEX_RMUL")

///|
/// `INTEGRABLE_BOUNDED_VARIATION_COMPLEX_RMUL`
pub fn integrable_bounded_variation_complex_rmul() -> @kernel.Thm {
  integrable_bounded_variation_complex_rmul_c.get()
}

///|
/// HAS_BOUNDED_VARIATION_ON_COMPLEX_MUL
fn step_326() -> Unit raise {
  let t2156 = @simp.asm_rewrite_tac(@list.List([]))
  let t2155 = @tactics.match_mp_tac(@integration.has_bounded_variation_on_mul())
  let t2154 = @simp.gen_rewrite_tac(fn(x2153 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2149 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2143 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2144 = @equal.land_conv(x2143)
        fn(x2145 : @kernel.Term) -> @kernel.Thm raise {
          s2144(x2145)
        }
      })((fn(x2146 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2147 = @equal.binder_conv(x2146)
        fn(x2148 : @kernel.Term) -> @kernel.Thm raise {
          s2147(x2148)
        }
      })(x2149))
    })((fn(x2150 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2151 = @equal.land_conv(x2150)
      fn(x2152 : @kernel.Term) -> @kernel.Thm raise {
        s2151(x2152)
      }
    })(x2153))
  }, @list.List([@equal.gsym(@vectors.lift_drop())]))
  let t2141 = @tactics.match_mp_tac(@integration.has_bounded_variation_on_add())
  let t2142 = @list.List([@tactics.match_mp_tac(@integration.has_bounded_variation_on_sub()), t2141])
  let t2140 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2139 = @simp.simp_tac(@list.List([@complexes.re(), @complexes.im(), @vectors.lift_add(), @vectors.lift_sub(), @vectors.lift_cmul()]))
  let t2137 = @equal.gsym(@complexes.re_def())
  let t2138 = @simp.rewrite_tac(@list.List([@complexes.complex_mul(), @cart.dimindex_2(), @vectors.forall_2(), @equal.gsym(@complexes.im_def()), t2137]))
  let t2136 = @simp.once_rewrite_tac(@list.List([@integration.has_bounded_variation_on_componentwise()]))
  let t2157 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2136), t2138), t2139), t2140), t2142), @tactics.conj_tac), t2154), t2155), t2156)
  has_bounded_variation_on_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ s : (Cart[Real, Unit]) -> Bool, has_bounded_variation_on(f, s) && has_bounded_variation_on(g, s) && is_interval(s) → has_bounded_variation_on((x : Cart[Real, Unit]) => f(x) * g(x), s)"), t2157))
}

///|
let has_bounded_variation_on_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_BOUNDED_VARIATION_ON_COMPLEX_MUL")

///|
/// `HAS_BOUNDED_VARIATION_ON_COMPLEX_MUL`
pub fn has_bounded_variation_on_complex_mul() -> @kernel.Thm {
  has_bounded_variation_on_complex_mul_c.get()
}

///|
/// HAS_BOUNDED_VARIATION_ON_COMPLEX_INV
fn step_327() -> Unit raise {
  let t2207 = @meson.asm_meson_tac(@list.List([@sets.subset(), @complexes.complex_norm_0(), @vectors.ends_in_interval()]))
  let t2206 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@integration.division_of(), @equal.gsym(@realarith.real_not_lt())])))
  let t2205 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2204 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t2203 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2202 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_mul(), @realarith.real_pow_2(), @real.real_lt_mul()]))
  let t2201 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2200 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2199 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t2198 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @realax.real_div()]))
  let t2197 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_rdiv_eq()), @real.real_pow_lt(), @complexes.complex_norm_div()]))
  let t2195 = @simp.asm_simp_tac(@list.List([@complexes.complex_field(@term_syntax.parse_term("!((w : Cart[Real, 2]) == Cx(real_of_num(0))) && !((z : Cart[Real, 2]) == Cx(real_of_num(0))) → inv(w) - inv(z) == -(w - z) / (z * w)"))]))
  let t2194 = @meson.asm_meson_tac(@list.List([@sets.subset(), @complexes.complex_norm_0(), @vectors.ends_in_interval()]))
  let t2196 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@integration.division_of(), @equal.gsym(@realarith.real_not_lt())]))), t2194), t2195])
  let t2193 = @tactics.subgoal_then(@term_syntax.parse_term("!((f : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])) == Cx(real_of_num(0))) && !(f((b : Cart[Real, Unit])) == Cx(real_of_num(0)))"), @tactics.strip_assume_tac)
  let t2191 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2192 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, Unit])"), t2191]))
  let t2190 = @simp.asm_simp_tac(@list.List([@integration.interval_lowerbound_nonempty(), @integration.interval_upperbound_nonempty()]))
  let t2189 = @tactics.first_assum(fn(x2187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2187
    @simp.rewrite_tac(@list.List([@drule.match_mp(@integration.forall_in_division_nonempty())(th)]))
  })
  let t2186 = @simp.asm_rewrite_tac(@list.List([]))
  let t2185 = @tactics.match_mp_tac(@iterate.sum_le())
  let t2184 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realax.real_le_trans()))
  let t2183 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_pow_lt(), @equal.gsym(@iterate.sum_rmul())]))
  let t2180 = @drule.match_mp(@integration.division_of_finite())
  let t2182 = @tactics.first_assum(fn(x2181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2178 = @tactics.assume_tac(x2177)
      fn(x2179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2178(x2179)
      }
    })(t2180(x2181))
  })
  let t2176 = @simp.asm_rewrite_tac(@list.List([]))
  let t2171 = @term_syntax.parse_term("(t : (Cart[Real, Unit]) -> Bool)")
  let t2172 = @list.List([@term_syntax.parse_term("(d : ((Cart[Real, Unit]) -> Bool) -> Bool)"), t2171])
  let t2175 = @tactics.first_x_assum(fn(x2174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2169 = @tactics.mp_tac(x2168)
      fn(x2170 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2169(x2170)
      }
    })(((x2173 : @kernel.Thm) => @bool.specl(t2172, x2173))(x2174))
  })
  let t2166 = @term_syntax.parse_term("(t : (Cart[Real, Unit]) -> Bool)")
  let t2167 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(d : ((Cart[Real, Unit]) -> Bool) -> Bool)"), t2166]))
  let t2165 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_pow_lt()]))
  let t2164 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real) / pow((e : Real), 2)"))
  let t2163 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t2162 = @simp.rewrite_tac(@list.List([@integration.has_bounded_variation_on(), @integration.has_bounded_setvariation_on_v1()]))
  let t2161 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2159 = @tactics.mp_tac(x2158)
    fn(x2160 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2159(x2160)
    }
  }, @tactics.strip_assume_tac))
  let t2208 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2161), t2162), t2163), t2164), t2165), t2167), @tactics.strip_tac), t2175), t2176), t2182), t2183), t2184), t2185), t2186), t2189), t2190), t2192), @tactics.strip_tac), t2193), t2196), t2197), t2198), t2199), t2200), t2201), t2202), t2203), t2204), @tactics.conj_tac), t2205), t2206), t2207)
  has_bounded_variation_on_complex_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ s : (Cart[Real, Unit]) -> Bool, ∀ e : Real, has_bounded_variation_on(f, s) && real_of_num(0) < e && (∀ x : Cart[Real, Unit], IN(x, s) → e <= norm(f(x))) → has_bounded_variation_on((x : Cart[Real, Unit]) => inv(f(x)), s)"), t2208))
}

///|
let has_bounded_variation_on_complex_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_BOUNDED_VARIATION_ON_COMPLEX_INV")

///|
/// `HAS_BOUNDED_VARIATION_ON_COMPLEX_INV`
pub fn has_bounded_variation_on_complex_inv() -> @kernel.Thm {
  has_bounded_variation_on_complex_inv_c.get()
}

///|
/// ABEL_LEMMA
fn step_328() -> Unit raise {
  let t2259 = @simp.asm_simp_tac(@list.List([@real.real_le_rmul(), @real.real_pow_le(), @realarith.real_lt_imp_le()]))
  let t2258 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) == a * c * b"))]))
  let t2257 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_rdiv_eq(), @real.real_pow_lt()]))
  let t2256 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc()]))
  let t2255 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @realarith.real_lt_imp_le(), @real.real_pow_div()]))
  let t2254 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_pow(), @vectors.real_abs_norm(), @real.real_abs_div()]))
  let t2253 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2252 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t2260 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t2252), t2253), t2254), t2255), t2256), t2257), t2258), t2259)
  let t2251 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @real.real_pow_le(), @realarith.real_lt_imp_le()]))
  let t2250 = @simp.asm_rewrite_tac(@list.List([]))
  let t2249 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2248 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2261 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.real_cx(), @complexes.re_cx()])), t2248), t2249), t2250), t2251)
  let t2247 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq(), @realax.real_mul_lid()]))
  let t2246 = @simp.asm_simp_tac(@list.List([@real.real_abs_div(), @realax.real_abs(), @realarith.real_lt_imp_le()]))
  let t2245 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t2244 = @tactics.match_mp_tac(summable_gp())
  let t2243 = @tactics.match_mp_tac(summable_complex_lmul())
  let t2262 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_mul(), @complexes.cx_pow()])), t2243), t2244), t2245), t2246), t2247), t2261, t2260])
  let t2242 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2241 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => Cx((M : Real) * pow((r : Real) / (r0 : Real), n))"))
  let t2240 = @tactics.match_mp_tac(series_comparison_complex())
  let t2238 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @real.real_pow_le(), @realarith.real_lt_imp_le()]))
  let t2237 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2236 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → x <= (y : Real) → real_of_num(0) <= y")))
  let t2235 = @simp.asm_rewrite_tac(@list.List([]))
  let t2231 = @term_syntax.parse_term("(i : Num)")
  let t2234 = @tactics.first_x_assum(fn(x2233 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2229 = @tactics.mp_tac(x2228)
      fn(x2230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2229(x2230)
      }
    })(((x2232 : @kernel.Thm) => @bool.spec(t2231, x2232))(x2233))
  })
  let t2225 = @term_syntax.parse_term("(i : Num)")
  let t2227 = @tactics.disch_then((x2226 : @kernel.Thm) => @tactics.x_choose_tac(t2225, x2226))
  let t2223 = @simp.gen_rewrite_rule(fn(x2222 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2222
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t2239 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2220 = @tactics.mp_tac(x2219)
      fn(x2221 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2220(x2221)
      }
    })(t2223(x2224))
  }), t2227), t2234), t2235), t2236), t2237), t2238), @tactics.all_tac])
  let t2218 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (M : Real)"), fn(x2215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2216 = @tactics.assume_tac(x2215)
    fn(x2217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2216(x2217)
    }
  })
  let t2214 = @simp.asm_rewrite_tac(@list.List([@topology.summable_trivial()]))
  let t2213 = @class.asm_cases_tac(@term_syntax.parse_term("(k : (Num) -> Bool) == {}"))
  let t2212 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (r0 : Real)"), fn(x2209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2210 = @tactics.assume_tac(x2209)
    fn(x2211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2210(x2211)
    }
  })
  let t2263 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2212), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2213), t2214), t2218), t2239), t2240), t2241), t2242), t2262)
  abel_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, _], ∀ M : Real, ∀ r : Real, ∀ r0 : Real, real_of_num(0) <= r && r < r0 && (∀ n : Num, IN(n, (k : (Num) -> Bool)) → norm(a(n)) * pow(r0, n) <= M) → summable(k, (n : Num) => Cx(norm(a(n)) * pow(r, n)))"), t2263))
}

///|
let abel_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABEL_LEMMA")

///|
/// `ABEL_LEMMA`
pub fn abel_lemma() -> @kernel.Thm {
  abel_lemma_c.get()
}

///|
/// POWER_SERIES_CONV_IMP_ABSCONV
fn step_329() -> Unit raise {
  let t2277 = @equal.gsym(@complexes.complex_norm_mul())
  let t2278 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_norm_pow()), t2277]))
  let t2276 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2275 = @tactics.exists_tac(@term_syntax.parse_term("norm((z : Cart[Real, 2]))"))
  let t2274 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : Real)"))
  let t2273 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2272 = @simp.rewrite_tac(@list.List([@topology.bounded_pos(), @sets.forall_in_image()]))
  let t2269 = @drule.match_mp(@topology.summable_imp_bounded())
  let t2271 = @tactics.first_assum(fn(x2270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2267 = @tactics.mp_tac(x2266)
      fn(x2268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2267(x2268)
      }
    })(t2269(x2270))
  })
  let t2265 = @tactics.match_mp_tac(abel_lemma())
  let t2264 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_pow()]))
  let t2279 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2264), t2265), t2271), t2272), t2273), t2274), @tactics.strip_tac), t2275), t2276), t2278)
  power_series_conv_imp_absconv_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, 2], ∀ k : (Num) -> Bool, ∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], summable(k, (n : Num) => a(n) * pow(z, n)) && norm(w) < norm(z) → summable(k, (n : Num) => Cx(norm(a(n) * pow(w, n))))"), t2279))
}

///|
let power_series_conv_imp_absconv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWER_SERIES_CONV_IMP_ABSCONV")

///|
/// `POWER_SERIES_CONV_IMP_ABSCONV`
pub fn power_series_conv_imp_absconv() -> @kernel.Thm {
  power_series_conv_imp_absconv_c.get()
}

///|
/// POWER_SERIES_CONV_IMP_ABSCONV_WEAK
fn step_330() -> Unit raise {
  let t2286 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_cx(), @vectors.real_abs_norm(), @real.real_abs_mul(), @realax.real_le_refl()]))
  let t2285 = @simp.rewrite_tac(@list.List([@complexes.real_cx(), @complexes.re_cx(), @vectors.norm_pos_le()]))
  let t2283 = @simp.asm_rewrite_tac(@list.List([]))
  let t2282 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2284 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(power_series_conv_imp_absconv()), t2282), t2283), @tactics.all_tac])
  let t2281 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => Cx(norm((a : (Num) -> Cart[Real, 2])(n) * pow((w : Cart[Real, 2]), n)))"))
  let t2280 = @tactics.match_mp_tac(series_comparison_complex())
  let t2287 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2280), t2281), @tactics.conj_tac), t2284), t2285), t2286)
  power_series_conv_imp_absconv_weak_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, 2], ∀ k : (Num) -> Bool, ∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], summable(k, (n : Num) => a(n) * pow(z, n)) && norm(w) < norm(z) → summable(k, (n : Num) => Cx(norm(a(n))) * pow(w, n))"), t2287))
}

///|
let power_series_conv_imp_absconv_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWER_SERIES_CONV_IMP_ABSCONV_WEAK")

///|
/// `POWER_SERIES_CONV_IMP_ABSCONV_WEAK`
pub fn power_series_conv_imp_absconv_weak() -> @kernel.Thm {
  power_series_conv_imp_absconv_weak_c.get()
}

///|
/// POWER_SERIES_RADIUS_OF_CONVERGENCE
fn step_331() -> Unit raise {
  let t2290 = @meson.asm_meson_tac(@list.List([power_series_conv_imp_absconv()]))
  let t2289 = @simp.rewrite_tac(@list.List([]))
  let t2288 = @tactics.match_mp_tac(series_absconv_imp_conv())
  let t2291 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2288), t2289), t2290)
  power_series_radius_of_convergence_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, 2], ∀ k : (Num) -> Bool, ∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], summable(k, (n : Num) => a(n) * pow(z, n)) && norm(w) < norm(z) → summable(k, (n : Num) => a(n) * pow(w, n))"), t2291))
}

///|
let power_series_radius_of_convergence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWER_SERIES_RADIUS_OF_CONVERGENCE")

///|
/// `POWER_SERIES_RADIUS_OF_CONVERGENCE`
pub fn power_series_radius_of_convergence() -> @kernel.Thm {
  power_series_radius_of_convergence_c.get()
}

///|
/// SUM_INTEGRAL_UBOUND_INCREASING
fn step_332() -> Unit raise {
  let t2343 = @simp.gen_rewrite_rule(fn(x2342 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2342
  }, @list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t2345 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x2344 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2340 = @tactics.mp_tac(x2339)
      fn(x2341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2340(x2341)
      }
    })(t2343(x2344))
  }))
  let t2336 = @simp.gen_rewrite_rule(fn(x2335 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2335
  }, @list.List([@complexes.in_segment_cx()]))
  let t2338 = @tactics.first_x_assum(fn(x2337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2333 = @tactics.mp_tac(x2332)
      fn(x2334 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2333(x2334)
      }
    })(t2336(x2337))
  })
  let t2331 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2330 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.real_segment(), @complexes.real_cx(), @complexes.real_v1()])), @tactics.all_tac])
  let t2328 = @tactics.choose_then(fn(x2325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2326 = @tactics.subst_all_tac(x2325)
    fn(x2327 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2326(x2327)
    }
  })
  let t2329 = @tactics.subgoal_then(@term_syntax.parse_term("∃ y : Real, (u : Cart[Real, 2]) == Cx(y)"), t2328)
  let t2324 = @simp.rewrite_tac(@list.List([@complexes.cx_add(), @complexes.complex_ring(@term_syntax.parse_term("(y : Cart[Real, 2]) * ((x : Cart[Real, 2]) + Cx(real_of_num(1)) - x) == y"))]))
  let t2322 = @tactics.conjuncts_then2(fn(x2316 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2317 = @tactics.assume_tac(x2316)
    fn(x2318 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2317(x2318)
    }
  }, fn(x2319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2320 = @tactics.subst1_tac(x2319)
    fn(x2321 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2320(x2321)
    }
  })
  let t2323 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Cart[Real, 2])"))(t2322))
  let t2346 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t2323), t2324), t2329), t2330), t2331), t2338), t2345), @calc_rat.real_arith_tac)
  let t2315 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_le()]))
  let t2314 = @simp.asm_rewrite_tac(@list.List([@complexes.in_segment_cx()]))
  let t2313 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2312 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_insert(), @sets.not_in_empty(), @equal.gsym(@convex.segment_convex_hull())]))
  let t2311 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t2310 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2309 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t2307 = @term_syntax.parse_term("(u : Cart[Real, 2])")
  let t2308 = @tactics.spec_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"), t2307)
  let t2306 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t2305 = @tactics.undisch_tac(@term_syntax.parse_term("IN((u : Cart[Real, 2]), segment([(Cx(real_of_num((r : Num))), Cx(real_of_num(r) + real_of_num(1)))]))"))
  let t2304 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2347 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, 2])")), @tactics.strip_tac), t2304), t2305), t2306), t2308), t2309), t2310), t2311), t2312), t2313), t2314), t2315), @int.asm_arith_tac), t2346])
  let t2300 = @term_syntax.parse_term("Cx(real_of_num((r : Num)) + real_of_num(1))")
  let t2301 = @term_syntax.parse_term("Cx(real_of_num((r : Num)))")
  let t2302 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t2303 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])"), t2302, t2301, t2300]), complex_mvt_line()))
  let t2299 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t2298 = @simp.rewrite_tac(@list.List([@realarith.real_neg_sub()]))
  let t2297 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t2296 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_neg())]))
  let t2294 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t2295 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@iterate.sum_diffs(), @complexes.re_sub(), @realarith.real_neg_sub(), @realax.real_of_num_add()])), t2294)])
  let t2293 = @tactics.exists_tac(@term_syntax.parse_term("-sum(op_dot_dot((m : Num), (n : Num)), (k : Num) => Re((g : (Cart[Real, 2]) -> Cart[Real, 2])(Cx(real_of_num(k)))) - Re(g(Cx(real_of_num(k + 1)))))"))
  let t2292 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2348 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2292), t2293), @tactics.conj_tac), t2295), t2296), t2297), t2298), t2299), @tactics.strip_tac), t2303), @tactics.ants_tac), t2347)
  sum_integral_ubound_increasing_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, m <= n && (∀ x : Cart[Real, 2], IN(x, segment([(Cx(real_of_num(m)), Cx(real_of_num(n) + real_of_num(1)))])) → has_complex_derivative(g, f(x), at(x))) && (∀ x : Real, ∀ y : Real, real_of_num(m) <= x && x <= y && y <= real_of_num(n) + real_of_num(1) → Re(f(Cx(x))) <= Re(f(Cx(y)))) → sum(op_dot_dot(m, n), (k : Num) => Re(f(Cx(real_of_num(k))))) <= Re(g(Cx(real_of_num(n) + real_of_num(1))) - g(Cx(real_of_num(m))))"), t2348))
}

///|
let sum_integral_ubound_increasing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_INTEGRAL_UBOUND_INCREASING")

///|
/// `SUM_INTEGRAL_UBOUND_INCREASING`
pub fn sum_integral_ubound_increasing() -> @kernel.Thm {
  sum_integral_ubound_increasing_c.get()
}

///|
/// SUM_INTEGRAL_UBOUND_DECREASING
fn step_333() -> Unit raise {
  let t2408 = @simp.gen_rewrite_rule(fn(x2407 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2407
  }, @list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t2410 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x2409 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2404 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2405 = @tactics.mp_tac(x2404)
      fn(x2406 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2405(x2406)
      }
    })(t2408(x2409))
  }))
  let t2401 = @simp.gen_rewrite_rule(fn(x2400 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2400
  }, @list.List([@complexes.in_segment_cx()]))
  let t2403 = @tactics.first_x_assum(fn(x2402 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2397 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2398 = @tactics.mp_tac(x2397)
      fn(x2399 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2398(x2399)
      }
    })(t2401(x2402))
  })
  let t2396 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2395 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.real_segment(), @complexes.real_cx(), @complexes.real_v1()])), @tactics.all_tac])
  let t2393 = @tactics.choose_then(fn(x2390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2391 = @tactics.subst_all_tac(x2390)
    fn(x2392 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2391(x2392)
    }
  })
  let t2394 = @tactics.subgoal_then(@term_syntax.parse_term("∃ y : Real, (u : Cart[Real, 2]) == Cx(y)"), t2393)
  let t2389 = @simp.rewrite_tac(@list.List([@complexes.cx_sub(), @complexes.complex_ring(@term_syntax.parse_term("(y : Cart[Real, 2]) * ((x : Cart[Real, 2]) - (x - Cx(real_of_num(1)))) == y"))]))
  let t2387 = @tactics.conjuncts_then2(fn(x2381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2382 = @tactics.assume_tac(x2381)
    fn(x2383 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2382(x2383)
    }
  }, fn(x2384 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2385 = @tactics.subst1_tac(x2384)
    fn(x2386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2385(x2386)
    }
  })
  let t2388 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Cart[Real, 2])"))(t2387))
  let t2411 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t2388), t2389), t2394), t2395), t2396), t2403), t2410), @calc_rat.real_arith_tac)
  let t2380 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t2379 = @tactics.repeat_tac(@tactics.pop_assum(fn(x2376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2377 = @tactics.mp_tac(x2376)
    fn(x2378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2377(x2378)
    }
  }))
  let t2375 = @simp.asm_rewrite_tac(@list.List([@complexes.in_segment_cx()]))
  let t2374 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2373 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_insert(), @sets.not_in_empty(), @equal.gsym(@convex.segment_convex_hull())]))
  let t2372 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t2371 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2370 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t2368 = @term_syntax.parse_term("(u : Cart[Real, 2])")
  let t2369 = @tactics.spec_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"), t2368)
  let t2367 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t2366 = @tactics.undisch_tac(@term_syntax.parse_term("IN((u : Cart[Real, 2]), segment([(Cx(real_of_num((r : Num)) - real_of_num(1)), Cx(real_of_num(r)))]))"))
  let t2365 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2412 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, 2])")), @tactics.strip_tac), t2365), t2366), t2367), t2369), t2370), t2371), t2372), t2373), t2374), t2375), t2379), t2380), @calc_rat.real_arith_tac), t2411])
  let t2361 = @term_syntax.parse_term("Cx(real_of_num((r : Num)))")
  let t2362 = @term_syntax.parse_term("Cx(real_of_num((r : Num)) - real_of_num(1))")
  let t2363 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t2364 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])"), t2363, t2362, t2361]), complex_mvt_line()))
  let t2359 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) - real_of_num(1) == x"))
  let t2360 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t2359]))
  let t2358 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t2357 = @simp.rewrite_tac(@list.List([@realarith.real_neg_sub()]))
  let t2356 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t2355 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_neg())]))
  let t2353 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) - real_of_num(1) == x")), @realax.real_le_refl()]))
  let t2351 = @equal.gsym(@real.real_of_num_sub())
  let t2352 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t2351]))
  let t2354 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@iterate.sum_diffs(), @realarith.real_neg_sub()])), t2352), t2353)])
  let t2350 = @tactics.exists_tac(@term_syntax.parse_term("-sum(op_dot_dot((m : Num), (n : Num)), (k : Num) => Re((g : (Cart[Real, 2]) -> Cart[Real, 2])(Cx(real_of_num(k) - real_of_num(1)))) - Re(g(Cx(real_of_num(k + 1) - real_of_num(1)))))"))
  let t2349 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2413 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2349), t2350), @tactics.conj_tac), t2354), t2355), t2356), t2357), t2358), @tactics.strip_tac), t2360), t2364), @tactics.ants_tac), t2412)
  sum_integral_ubound_decreasing_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, m <= n && (∀ x : Cart[Real, 2], IN(x, segment([(Cx(real_of_num(m) - real_of_num(1)), Cx(real_of_num(n)))])) → has_complex_derivative(g, f(x), at(x))) && (∀ x : Real, ∀ y : Real, real_of_num(m) - real_of_num(1) <= x && x <= y && y <= real_of_num(n) → Re(f(Cx(y))) <= Re(f(Cx(x)))) → sum(op_dot_dot(m, n), (k : Num) => Re(f(Cx(real_of_num(k))))) <= Re(g(Cx(real_of_num(n))) - g(Cx(real_of_num(m) - real_of_num(1))))"), t2413))
}

///|
let sum_integral_ubound_decreasing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_INTEGRAL_UBOUND_DECREASING")

///|
/// `SUM_INTEGRAL_UBOUND_DECREASING`
pub fn sum_integral_ubound_decreasing() -> @kernel.Thm {
  sum_integral_ubound_decreasing_c.get()
}

///|
/// SUM_INTEGRAL_LBOUND_INCREASING
fn step_334() -> Unit raise {
  let t2419 = @simp.asm_simp_tac(@list.List([has_complex_derivative_neg()]))
  let t2418 = @simp.rewrite_tac(@list.List([@complexes.re_neg(), @complexes.re_sub(), @iterate.sum_neg(), @calc_int.real_le_neg2(), @calc_rat.real_arith(@term_syntax.parse_term("-(x : Real) - -(y : Real) == -(x - y)"))]))
  let t2414 = @term_syntax.parse_term("(n : Num)")
  let t2415 = @term_syntax.parse_term("(m : Num)")
  let t2416 = @term_syntax.parse_term("(z : Cart[Real, 2]) => -(g : (Cart[Real, 2]) -> Cart[Real, 2])(z)")
  let t2417 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => -(f : (Cart[Real, 2]) -> Cart[Real, 2])(z)"), t2416, t2415, t2414]), sum_integral_ubound_decreasing()))
  let t2420 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2417), t2418), t2419)
  sum_integral_lbound_increasing_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, m <= n && (∀ x : Cart[Real, 2], IN(x, segment([(Cx(real_of_num(m) - real_of_num(1)), Cx(real_of_num(n)))])) → has_complex_derivative(g, f(x), at(x))) && (∀ x : Real, ∀ y : Real, real_of_num(m) - real_of_num(1) <= x && x <= y && y <= real_of_num(n) → Re(f(Cx(x))) <= Re(f(Cx(y)))) → Re(g(Cx(real_of_num(n))) - g(Cx(real_of_num(m) - real_of_num(1)))) <= sum(op_dot_dot(m, n), (k : Num) => Re(f(Cx(real_of_num(k)))))"), t2420))
}

///|
let sum_integral_lbound_increasing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_INTEGRAL_LBOUND_INCREASING")

///|
/// `SUM_INTEGRAL_LBOUND_INCREASING`
pub fn sum_integral_lbound_increasing() -> @kernel.Thm {
  sum_integral_lbound_increasing_c.get()
}

///|
/// SUM_INTEGRAL_LBOUND_DECREASING
fn step_335() -> Unit raise {
  let t2426 = @simp.asm_simp_tac(@list.List([has_complex_derivative_neg()]))
  let t2425 = @simp.rewrite_tac(@list.List([@complexes.re_neg(), @complexes.re_sub(), @iterate.sum_neg(), @calc_int.real_le_neg2(), @calc_rat.real_arith(@term_syntax.parse_term("-(x : Real) - -(y : Real) == -(x - y)"))]))
  let t2421 = @term_syntax.parse_term("(n : Num)")
  let t2422 = @term_syntax.parse_term("(m : Num)")
  let t2423 = @term_syntax.parse_term("(z : Cart[Real, 2]) => -(g : (Cart[Real, 2]) -> Cart[Real, 2])(z)")
  let t2424 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => -(f : (Cart[Real, 2]) -> Cart[Real, 2])(z)"), t2423, t2422, t2421]), sum_integral_ubound_increasing()))
  let t2427 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2424), t2425), t2426)
  sum_integral_lbound_decreasing_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, m <= n && (∀ x : Cart[Real, 2], IN(x, segment([(Cx(real_of_num(m)), Cx(real_of_num(n) + real_of_num(1)))])) → has_complex_derivative(g, f(x), at(x))) && (∀ x : Real, ∀ y : Real, real_of_num(m) <= x && x <= y && y <= real_of_num(n) + real_of_num(1) → Re(f(Cx(y))) <= Re(f(Cx(x)))) → Re(g(Cx(real_of_num(n) + real_of_num(1))) - g(Cx(real_of_num(m)))) <= sum(op_dot_dot(m, n), (k : Num) => Re(f(Cx(real_of_num(k)))))"), t2427))
}

///|
let sum_integral_lbound_decreasing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_INTEGRAL_LBOUND_DECREASING")

///|
/// `SUM_INTEGRAL_LBOUND_DECREASING`
pub fn sum_integral_lbound_decreasing() -> @kernel.Thm {
  sum_integral_lbound_decreasing_c.get()
}

///|
/// SUM_INTEGRAL_BOUNDS_INCREASING
fn step_336() -> Unit raise {
  let t2434 = @simp.rewrite_tac(@list.List([@complexes.in_segment_cx_gen()]))
  let t2433 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.in_segment_cx_gen(), @equal.gsym(@realax.real_of_num_le())])))
  let t2432 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2431 = @simp.asm_rewrite_tac(@list.List([]))
  let t2430 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2428 = @tactics.match_mp_tac(sum_integral_ubound_increasing())
  let t2429 = @list.List([@tactics.match_mp_tac(sum_integral_lbound_increasing()), t2428])
  let t2435 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t2429), t2430), t2431), t2432), t2433), t2434), @calc_rat.asm_real_arith_tac)
  sum_integral_bounds_increasing_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, m <= n && (∀ x : Cart[Real, 2], IN(x, segment([(Cx(real_of_num(m) - real_of_num(1)), Cx(real_of_num(n) + real_of_num(1)))])) → has_complex_derivative(g, f(x), at(x))) && (∀ x : Real, ∀ y : Real, real_of_num(m) - real_of_num(1) <= x && x <= y && y <= real_of_num(n) + real_of_num(1) → Re(f(Cx(x))) <= Re(f(Cx(y)))) → Re(g(Cx(real_of_num(n))) - g(Cx(real_of_num(m) - real_of_num(1)))) <= sum(op_dot_dot(m, n), (k : Num) => Re(f(Cx(real_of_num(k))))) && sum(op_dot_dot(m, n), (k : Num) => Re(f(Cx(real_of_num(k))))) <= Re(g(Cx(real_of_num(n) + real_of_num(1))) - g(Cx(real_of_num(m))))"), t2435))
}

///|
let sum_integral_bounds_increasing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_INTEGRAL_BOUNDS_INCREASING")

///|
/// `SUM_INTEGRAL_BOUNDS_INCREASING`
pub fn sum_integral_bounds_increasing() -> @kernel.Thm {
  sum_integral_bounds_increasing_c.get()
}

///|
/// SUM_INTEGRAL_BOUNDS_DECREASING
fn step_337() -> Unit raise {
  let t2442 = @simp.rewrite_tac(@list.List([@complexes.in_segment_cx_gen()]))
  let t2441 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.in_segment_cx_gen(), @equal.gsym(@realax.real_of_num_le())])))
  let t2440 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2439 = @simp.asm_rewrite_tac(@list.List([]))
  let t2438 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2436 = @tactics.match_mp_tac(sum_integral_ubound_decreasing())
  let t2437 = @list.List([@tactics.match_mp_tac(sum_integral_lbound_decreasing()), t2436])
  let t2443 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t2437), t2438), t2439), t2440), t2441), t2442), @calc_rat.asm_real_arith_tac)
  sum_integral_bounds_decreasing_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, m <= n && (∀ x : Cart[Real, 2], IN(x, segment([(Cx(real_of_num(m) - real_of_num(1)), Cx(real_of_num(n) + real_of_num(1)))])) → has_complex_derivative(g, f(x), at(x))) && (∀ x : Real, ∀ y : Real, real_of_num(m) - real_of_num(1) <= x && x <= y && y <= real_of_num(n) + real_of_num(1) → Re(f(Cx(y))) <= Re(f(Cx(x)))) → Re(g(Cx(real_of_num(n) + real_of_num(1))) - g(Cx(real_of_num(m)))) <= sum(op_dot_dot(m, n), (k : Num) => Re(f(Cx(real_of_num(k))))) && sum(op_dot_dot(m, n), (k : Num) => Re(f(Cx(real_of_num(k))))) <= Re(g(Cx(real_of_num(n))) - g(Cx(real_of_num(m) - real_of_num(1))))"), t2443))
}

///|
let sum_integral_bounds_decreasing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_INTEGRAL_BOUNDS_DECREASING")

///|
/// `SUM_INTEGRAL_BOUNDS_DECREASING`
pub fn sum_integral_bounds_decreasing() -> @kernel.Thm {
  sum_integral_bounds_decreasing_c.get()
}

///|
/// LIM_INFINITY_SEQUENTIALLY_COMPLEX
fn step_338() -> Unit raise {
  let t2467 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t2466 = @tactics.repeat_tac(@tactics.pop_assum(fn(x2463 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2464 = @tactics.mp_tac(x2463)
    fn(x2465 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2464(x2465)
    }
  }))
  let t2462 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t2461 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2460 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2459 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t2458 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2457 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(B : Real)"), @real.real_arch_simple()))
  let t2454 = @term_syntax.parse_term("(B : Real)")
  let t2456 = @tactics.disch_then((x2455 : @kernel.Thm) => @tactics.x_choose_tac(t2454, x2455))
  let t2453 = @simp.asm_rewrite_tac(@list.List([]))
  let t2449 = @term_syntax.parse_term("(e : Real)")
  let t2452 = @tactics.first_x_assum(fn(x2451 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2447 = @tactics.mp_tac(x2446)
      fn(x2448 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2447(x2448)
      }
    })(((x2450 : @kernel.Thm) => @bool.spec(t2449, x2450))(x2451))
  })
  let t2445 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t2444 = @simp.rewrite_tac(@list.List([@topology.lim_at_infinity(), @topology.lim_sequentially()]))
  let t2468 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2444), @tactics.disch_tac), t2445), @tactics.disch_tac), t2452), t2453), t2456), t2457), t2458), t2459), t2460), t2461), t2462), t2466), t2467), @calc_rat.real_arith_tac)
  lim_infinity_sequentially_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, _], ∀ l : Cart[Real, _], op_minus_minus_gt(f, l, at_infinity) → op_minus_minus_gt((n : Num) => f(Cx(real_of_num(n))), l, sequentially)"), t2468))
}

///|
let lim_infinity_sequentially_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_INFINITY_SEQUENTIALLY_COMPLEX")

///|
/// `LIM_INFINITY_SEQUENTIALLY_COMPLEX`
pub fn lim_infinity_sequentially_complex() -> @kernel.Thm {
  lim_infinity_sequentially_complex_c.get()
}

///|
/// LIM_AT_INFINITY_COMPLEX_0
fn step_339() -> Unit raise {
  let t2501 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_inv_eq()]))
  let t2500 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2499 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv()]))
  let t2502 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2496 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2497 = @equal.rand_conv(x2496)
    fn(x2498 : @kernel.Term) -> @kernel.Thm raise {
      s2497(x2498)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())])), t2499), t2500), t2501)
  let t2495 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_inv_eq()]))
  let t2493 = @term_syntax.parse_term("inv((b : Real))")
  let t2494 = @tactics.trans_tac(@realarith.real_lte_trans())(t2493)
  let t2503 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_norm_nz())])), t2494), t2495), t2502])
  let t2504 = @tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@complexes.complex_inv_eq_0()])), @tactics.conj_tac), t2503)
  let t2492 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_nz()]))
  let t2491 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2490 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv()]))
  let t2505 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2487 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2488 = @equal.land_conv(x2487)
    fn(x2489 : @kernel.Term) -> @kernel.Thm raise {
      s2488(x2489)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())])), t2490), t2491), t2492), t2504])
  let t2486 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2485 = @list.List([@tactics.all_tac, @tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), @complexes.complex_inv_inv())))])
  let t2484 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2483 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_inv_eq()]))
  let t2482 = @tactics.exists_tac(@term_syntax.parse_term("inv((b : Real))"))
  let t2481 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Real)"))(@tactics.strip_assume_tac))
  let t2480 = @simp.asm_rewrite_tac(@list.List([@realax.real_ge()]))
  let t2476 = @term_syntax.parse_term("(e : Real)")
  let t2479 = @tactics.first_x_assum(fn(x2478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2474 = @tactics.mp_tac(x2473)
      fn(x2475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2474(x2475)
      }
    })(((x2477 : @kernel.Thm) => @bool.spec(t2476, x2477))(x2478))
  })
  let t2472 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t2471 = @simp.rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_rzero()]))
  let t2470 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist_nz()), @realax.real_ge()]))
  let t2469 = @simp.rewrite_tac(@list.List([@topology.lim_at_le(), @topology.lim_at_infinity_pos(), @trivia.o_def()]))
  let t2506 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2469), t2470), t2471), @tactics.eq_tac), @tactics.disch_tac), t2472), @tactics.disch_tac), t2479), t2480), t2481), t2482), t2483), t2484), @tactics.strip_tac), t2485), t2486), t2505)
  lim_at_infinity_complex_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, N], ∀ l : Cart[Real, N], op_minus_minus_gt(f, l, at_infinity) == op_minus_minus_gt(o(f, inv), l, at(Cx(real_of_num(0))))"), t2506))
}

///|
let lim_at_infinity_complex_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_AT_INFINITY_COMPLEX_0")

///|
/// `LIM_AT_INFINITY_COMPLEX_0`
pub fn lim_at_infinity_complex_0() -> @kernel.Thm {
  lim_at_infinity_complex_0_c.get()
}

///|
/// LIM_ZERO_INFINITY_COMPLEX
fn step_340() -> Unit raise {
  let t2507 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid()]))
  let t2508 = @tactics.then_tac(@simp.rewrite_tac(@list.List([lim_at_infinity_complex_0(), @trivia.o_def(), @complexes.complex_div()])), t2507)
  lim_zero_infinity_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, N], ∀ l : Cart[Real, N], op_minus_minus_gt((x : Cart[Real, 2]) => f(Cx(real_of_num(1)) / x), l, at(Cx(real_of_num(0)))) → op_minus_minus_gt(f, l, at_infinity)"), t2508))
}

///|
let lim_zero_infinity_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_ZERO_INFINITY_COMPLEX")

///|
/// `LIM_ZERO_INFINITY_COMPLEX`
pub fn lim_zero_infinity_complex() -> @kernel.Thm {
  lim_zero_infinity_complex_c.get()
}

///|
/// LIM_COMPLEX_REAL
fn step_341() -> Unit raise {
  let t2560 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_ge_re_im()]))
  let t2559 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) → y < (e : Real) → x < e")))
  let t2558 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_sub())]))
  let t2557 = @tactics.disch_then(fn(x2556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2553 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2554 = @tactics.subst1_tac(x2553)
      fn(x2555 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2554(x2555)
      }
    })(@equal.sym(x2556))
  })
  let t2552 = @simp.asm_rewrite_tac(@list.List([]))
  let t2548 = @term_syntax.parse_term("(n : Num)")
  let t2551 = @tactics.first_x_assum(fn(x2550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2546 = @tactics.mp_tac(x2545)
      fn(x2547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2546(x2547)
      }
    })(((x2549 : @kernel.Thm) => @bool.spec(t2548, x2549))(x2550))
  })
  let t2541 = @term_syntax.parse_term("(n : Num)")
  let t2544 = @tactics.undisch_then(@term_syntax.parse_term("∀ n : Num, (N0 : Num) <= n → norm((g : (Num) -> Cart[Real, 2])(n) - (m : Cart[Real, 2])) < (e : Real)"), fn(x2543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2539 = @tactics.mp_tac(x2538)
      fn(x2540 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2539(x2540)
      }
    })(((x2542 : @kernel.Thm) => @bool.spec(t2541, x2542))(x2543))
  })
  let t2535 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(N0 : Num) + (N1 : Num) <= (n : Num) → N0 <= n && N1 <= n")))
  let t2537 = @tactics.disch_then(fn(x2536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t2535(x2536))
  })
  let t2534 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2533 = @tactics.exists_tac(@term_syntax.parse_term("(N0 : Num) + (N1 : Num)"))
  let t2530 = @term_syntax.parse_term("(N0 : Num)")
  let t2532 = @tactics.disch_then((x2531 : @kernel.Thm) => @tactics.x_choose_tac(t2530, x2531))
  let t2529 = @simp.asm_rewrite_tac(@list.List([@vectors.dist()]))
  let t2525 = @term_syntax.parse_term("(e : Real)")
  let t2528 = @tactics.first_x_assum(fn(x2527 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2522 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2523 = @tactics.mp_tac(x2522)
      fn(x2524 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2523(x2524)
      }
    })(((x2526 : @kernel.Thm) => @bool.spec(t2525, x2526))(x2527))
  })
  let t2521 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t2519 = @tactics.conjuncts_then2(fn(x2515 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2512 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2513 = @tactics.subst1_tac(x2512)
      fn(x2514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2513(x2514)
      }
    })(@equal.sym(x2515))
  }, fn(x2516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2517 = @tactics.assume_tac(x2516)
    fn(x2518 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2517(x2518)
    }
  })
  let t2510 = @term_syntax.parse_term("(N1 : Num)")
  let t2520 = @tactics.disch_then(@tactics.conjuncts_then2((x2511 : @kernel.Thm) => @tactics.x_choose_tac(t2510, x2511), t2519))
  let t2509 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially(), @topology.lim_sequentially()]))
  let t2561 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2509), t2520), t2521), @tactics.disch_tac), t2528), t2529), t2532), t2533), t2534), t2537), t2544), t2551), t2552), t2557), t2558), t2559), t2560)
  lim_complex_real_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Cart[Real, 2], ∀ l : Real, ∀ m : Cart[Real, 2], eventually((n : Num) => Re(g(n)) == f(n), sequentially) && Re(m) == l && op_minus_minus_gt(g, m, sequentially) → (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, N <= n → abs(f(n) - l) < e))"), t2561))
}

///|
let lim_complex_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_COMPLEX_REAL")

///|
/// `LIM_COMPLEX_REAL`
pub fn lim_complex_real() -> @kernel.Thm {
  lim_complex_real_c.get()
}

///|
/// LIM_COMPLEX_REAL_0
fn step_342() -> Unit raise {
  let t2571 = @simp.rewrite_tac(@list.List([@complexes.re_cx(), @real.real_sub_rzero()]))
  let t2566 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t2567 = @list.List([@term_syntax.parse_term("real_of_num(0)"), t2566])
  let t2570 = @tactics.disch_then(fn(x2569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2564 = @tactics.mp_tac(x2563)
      fn(x2565 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2564(x2565)
      }
    })(((x2568 : @kernel.Thm) => @bool.specl(t2567, x2568))(x2569))
  })
  let t2562 = @tactics.replicate_tac(2, @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t2572 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(lim_complex_real()), t2562), t2570), t2571)
  lim_complex_real_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Cart[Real, 2], eventually((n : Num) => Re(g(n)) == f(n), sequentially) && op_minus_minus_gt(g, Cx(real_of_num(0)), sequentially) → (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, N <= n → abs(f(n)) < e))"), t2572))
}

///|
let lim_complex_real_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_COMPLEX_REAL_0")

///|
/// `LIM_COMPLEX_REAL_0`
pub fn lim_complex_real_0() -> @kernel.Thm {
  lim_complex_real_0_c.get()
}

///|
/// POWER_SERIES_UNIFORM_CONVERGENCE_STOLZ_1
fn step_343() -> Unit raise {
  let t2577 = @meson.asm_meson_tac(@list.List([@real.real_sub_refl(), @calc_int.real_mul_rzero(), @vectors.norm_le_0(), @vectors.vector_sub_eq()]))
  let t2578 = @tactics.then_tac(@tactics.disch_then(fn(x2574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2575 = @tactics.subst_all_tac(x2574)
    fn(x2576 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2575(x2576)
    }
  }), t2577)
  let t2579 = @list.List([@meson.asm_meson_tac(@list.List([@real.real_le_mul_eq(), @realarith.real_sub_le(), @vectors.norm_pos_le(), @realax.real_le_trans()])), t2578])
  let t2573 = @simp.rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t2580 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2573), @tactics.conj_tac), t2579)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ M : Real, ∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], real_of_num(0) < M && norm(w - z) <= M * (norm(w) - norm(z)) && !(z == w) → norm(z) < norm(w)"), t2580)
  let t2596 = @tactics.conv_tac(@complexes.complex_ring)
  let t2595 = @simp.asm_rewrite_tac(@list.List([@vectors.vsum_sing_numseg(), @complexes.complex_pow()]))
  let t2594 = @simp.simp_tac(@list.List([@arith.suc_sub1(), @vectors.vsum_clauses_numseg(), @arith.lt_imp_le()]))
  let t2593 = @tactics.pop_assum(fn(x2592 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2591 = @simp.rewrite_tac(@list.List([@bool.conjunct1(@arith.lt())]))
  let t2589 = @term_syntax.parse_term("(n : Num)")
  let t2590 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t2589)
  let t2586 = @tactics.pop_assum(fn(x2585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2584 = @tactics.undisch_tac(@term_syntax.parse_term("(m : Num) < (n : Num)"))
  let t2587 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([])), t2584), t2586)
  let t2583 = @tactics.conv_tac(@complexes.complex_ring)
  let t2588 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vsum_sing_numseg(), @complexes.complex_pow()])), t2583), t2587])
  let t2582 = @simp.simp_tac(@list.List([@vectors.vsum_clauses_numseg(), @arith.lt(), @arith.lt_imp_le()]))
  let t2581 = @simp.rewrite_tac(@list.List([@nums.not_suc(), @arith.suc_sub1()]))
  let t2597 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t2581), t2582), @tactics.strip_tac), t2588), t2590), @nums.induct_tac), t2591), t2593), t2594), t2595), t2596)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → vsum(op_dot_dot(m, n), (i : Num) => (a : (Num) -> Cart[Real, 2])(i) * pow((z : Cart[Real, 2]), i)) == (Cx(real_of_num(1)) - z) * vsum(op_dot_dot(m, n - 1), (i : Num) => vsum(op_dot_dot(m, i), a) * pow(z, i)) + vsum(op_dot_dot(m, n), a) * pow(z, n)"), t2597)
  let t2774 = @simp.rewrite_tac(@list.List([@topology.sums(), @sets.inter_univ()]))
  let t2775 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@topology.sums_infsum())])), t2774)
  let t2773 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_abs_num(), @complexes.complex_mul_rid(), @class.eta_ax()]))
  let t2772 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_one(), @complexes.complex_norm_cx()]))
  let t2771 = @tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(1))"))
  let t2770 = @tactics.match_mp_tac(power_series_conv_imp_absconv())
  let t2769 = @simp.rewrite_tac(@list.List([]))
  let t2776 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(series_absconv_imp_conv()), t2769), t2770), t2771), t2772), t2773), t2775])
  let t2768 = @tactics.subgoal_then(@term_syntax.parse_term("summable(UNIV, (i : Num) => (a : (Num) -> Cart[Real, 2])(i) * pow((z : Cart[Real, 2]), i))"), fn(x2765 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2766 = @tactics.mp_tac(x2765)
    fn(x2767 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2766(x2767)
    }
  })
  let t2764 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t2761 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t2762 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t2763 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(M : Real)"), t2762, t2761]), lemma))
  let t2760 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t2777 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t2760), @tactics.strip_tac), t2763), t2764), @tactics.disch_tac), t2768), t2776)
  let t2755 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2756 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_1_lt()), t2755), @int.asm_arith_tac)
  let t2754 = @list.List([@int.asm_arith_tac, @simp.rewrite_tac(@list.List([@vectors.vsum_sing_numseg()]))])
  let t2753 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) + 1 == (n : Num)"), fn(x2750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2751 = @tactics.subst1_tac(x2750)
    fn(x2752 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2751(x2752)
    }
  })
  let t2746 = @term_syntax.parse_term("(n : Num)")
  let t2747 = @list.List([@term_syntax.parse_term("(m : Num)"), t2746])
  let t2757 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x2749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2743 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2744 = @tactics.mp_tac(x2743)
      fn(x2745 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2744(x2745)
      }
    })(((x2748 : @kernel.Thm) => @bool.specl(t2747, x2748))(x2749))
  }), t2753), @list.List([@int.asm_arith_tac, @tactics.all_tac])), @tactics.ants_tac), t2754), @calc_rat.asm_real_arith_tac), t2756])
  let t2742 = @simp.simp_tac(@list.List([@vectors.norm_pos_le(), @real.real_pow_le()]))
  let t2741 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t2740 = @simp.gen_rewrite_tac(fn(x2737 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2738 = @equal.rand_conv(x2737)
    fn(x2739 : @kernel.Term) -> @kernel.Thm raise {
      s2738(x2739)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t2736 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_pow()]))
  let t2735 = @simp.rewrite_tac(@list.List([@vectors.vsum_sing_numseg()]))
  let t2734 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) + 1 == (n : Num)"), fn(x2731 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2732 = @tactics.subst1_tac(x2731)
    fn(x2733 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2732(x2733)
    }
  })
  let t2730 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@iterate.numseg_empty()])))
  let t2729 = @list.List([@simp.asm_rewrite_tac(@list.List([@vectors.vsum_clauses(), @vectors.norm_0()])), @tactics.all_tac])
  let t2758 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("op_dot_dot((m : Num) + 1, (n : Num)) == {}")), t2729), t2730), t2734), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t2735), t2736), t2740), t2741), t2742), @tactics.conj_tac), t2757)
  let t2724 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2725 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_1_lt()), t2724), @int.asm_arith_tac)
  let t2723 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2726 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) / real_of_num(2) && x < e / real_of_num(2) / (M : Real) → x < e / real_of_num(2)"))), t2723), @int.asm_arith_tac), t2725])
  let t2722 = @simp.simp_tac(@list.List([@vectors.norm_pos_le(), @real.real_pow_le()]))
  let t2721 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t2727 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2718 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2719 = @equal.rand_conv(x2718)
    fn(x2720 : @kernel.Term) -> @kernel.Thm raise {
      s2719(x2720)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())])), t2721), t2722), @tactics.conj_tac), t2726)
  let t2715 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2714 = @tactics.match_mp_tac(@real.real_pow_1_lt())
  let t2713 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @vectors.norm_pos_le()]))
  let t2712 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && (x : Real) < real_of_num(1) → x - y < real_of_num(1)")))
  let t2711 = @simp.asm_simp_tac(@list.List([@real.real_lt_div2_eq(), @realarith.real_sub_lt()]))
  let t2709 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("(norm((x : Cart[Real, 2]) - (y : Cart[Real, 2])) <= real_of_num(0)) == (x == y)"))]))
  let t2708 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @calc_int.real_mul_rzero()]))
  let t2710 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("norm(Cx(real_of_num(1)) - (z : Cart[Real, 2])) <= (M : Real) * (real_of_num(1) - norm(z))")), t2708), t2709), @tactics.all_tac])
  let t2707 = @simp.rewrite_tac(@list.List([@misc.sum_gp()]))
  let t2706 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_rdiv_eq()), @realarith.real_sub_lt()]))
  let t2705 = @simp.asm_simp_tac(@list.List([@real.real_div_refl(), @real.real_lt_imp_nz(), @realax.real_mul_lid()]))
  let t2704 = @simp.asm_simp_tac(@list.List([@real.real_lt_lmul_eq()]))
  let t2703 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((M : Real) * (z1 : Real) * ((e : Real) / real_of_num(2) / M * (s : Real)) < e / real_of_num(2)) == (e * (M / M * (s * z1)) < e * real_of_num(1))"))]))
  let t2716 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_lmul()])), t2703), t2704), t2705), t2706), t2707), @class.cond_cases_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), @class.cond_cases_tac), t2710), t2711), t2712), t2713), t2714), t2715), @int.arith_tac)
  let t2702 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2701 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) / real_of_num(2) && x < e / real_of_num(2) / (M : Real) → x <= e / real_of_num(2) / M")))
  let t2700 = @simp.simp_tac(@list.List([@real.real_pow_le(), @vectors.norm_pos_le()]))
  let t2699 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t2698 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_pow()]))
  let t2697 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t2696 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t2695 = @tactics.match_mp_tac(@vectors.vsum_norm_le())
  let t2694 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2717 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_mul2()), t2694), t2695), t2696), t2697), @tactics.strip_tac), t2698), t2699), t2700), t2701), t2702), @int.asm_arith_tac), t2716])
  let t2693 = @tactics.exists_tac(@term_syntax.parse_term("(M : Real) * (real_of_num(1) - norm((z : Cart[Real, 2]))) * sum(op_dot_dot((m : Num) + 1, (n : Num) - 1), (i : Num) => (e : Real) / real_of_num(2) / M * pow(norm(z), i))"))
  let t2728 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_let_trans()), t2693), @tactics.conj_tac), t2717), t2727])
  let t2692 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_pow()]))
  let t2691 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((a : Cart[Real, 2])) < (e : Real) / real_of_num(2) && norm((b : Cart[Real, 2])) < e / real_of_num(2) → norm(a + b) < e")))
  let t2759 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([lemma1])), t2691), t2692), @tactics.conj_tac), t2728), t2758])
  let t2690 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) + 1 < (n : Num)"))
  let t2688 = @term_syntax.parse_term("(n : Num)")
  let t2689 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(m : Num)"), t2688]))
  let t2686 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2685 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_rneg()), @realarith.real_neg_sub()]))
  let t2682 = @drule.match_mp(@vectors.norm_arith(@term_syntax.parse_term("norm((a : Cart[Real, 2]) - (b : Cart[Real, 2])) <= (M : Real) → real_of_num(0) <= -M → b == a")))
  let t2684 = @tactics.first_x_assum(fn(x2683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2682(x2683))
  })
  let t2681 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t2680 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t2687 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(1)))")), t2680), t2681), @tactics.disch_tac), t2684), t2685), t2686), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2679 = @tactics.subgoal_then(@term_syntax.parse_term("norm((z : Cart[Real, 2])) < real_of_num(1)"), fn(x2676 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2677 = @tactics.assume_tac(x2676)
    fn(x2678 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2677(x2678)
    }
  })
  let t2675 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t2674 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2673 = @simp.rewrite_tac(@list.List([@real.real_lt_min()]))
  let t2672 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t2671 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2669 = @tactics.match_mp_tac(@vectors.vsum_combine_r())
  let t2668 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("(a : Cart[Real, 2]) + (c : Cart[Real, 2]) == (b : Cart[Real, 2]) → distance((a, b)) == norm(c)")))
  let t2670 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2668), t2669), @int.asm_arith_tac), @tactics.all_tac])
  let t2667 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, m <= n → distance((vsum(op_dot_dot(0, m), f), vsum(op_dot_dot(0, n), f))) == norm(vsum(op_dot_dot(m + 1, n), f))"), fn(x2665 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2665
    @simp.simp_tac(@list.List([th]))
  })
  let t2664 = @simp.once_rewrite_tac(@list.List([@topology.sequence_cauchy_wlog()]))
  let t2663 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_lt_min())]))
  let t2662 = @simp.asm_simp_tac(@list.List([@real.real_lt_min(), @real.real_lt_div(), @misc.real_half(), @arith.ge(), @sets.inter_univ()]))
  let t2658 = @term_syntax.parse_term("min((e : Real) / real_of_num(2), e / real_of_num(2) / (M : Real))")
  let t2661 = @tactics.disch_then(fn(x2660 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2655 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2656 = @tactics.mp_tac(x2655)
      fn(x2657 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2656(x2657)
      }
    })(((x2659 : @kernel.Thm) => @bool.spec(t2658, x2659))(x2660))
  })
  let t2654 = @simp.rewrite_tac(@list.List([@topology.cauchy(), @equal.gsym(@vectors.dist())]))
  let t2651 = @drule.match_mp(@topology.convergent_imp_cauchy())
  let t2653 = @tactics.disch_then(fn(x2652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2649 = @tactics.mp_tac(x2648)
      fn(x2650 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2649(x2650)
      }
    })(t2651(x2652))
  })
  let t2647 = @simp.rewrite_tac(@list.List([@topology.sums()]))
  let t2644 = @simp.gen_rewrite_rule(fn(x2643 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2643
  }, @list.List([@equal.gsym(@topology.sums_infsum())]))
  let t2646 = @tactics.first_x_assum(fn(x2645 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2640 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2641 = @tactics.mp_tac(x2640)
      fn(x2642 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2641(x2642)
      }
    })(t2644(x2645))
  })
  let t2639 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ m : _, ∀ n : _, ∀ z : _, (P : (_) -> Bool)(m) && P(n) && (Q : (_) -> Bool)(z) → (R : (_, _, _) -> Bool)(m, n, z)) == (∀ z : _, Q(z) → (∀ m : _, ∀ n : _, P(m) && P(n) → R(m, n, z)))"))]))
  let t2778 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)")), @tactics.disch_tac), t2639), t2646), t2647), t2653), t2654), t2661), t2662), t2663), t2664), t2667), t2670), t2671), t2672), t2673), @tactics.strip_tac), t2674), t2675), @tactics.strip_tac), t2679), t2687), t2689), @tactics.strip_tac), t2690), t2759), t2777])
  let t2638 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.lim_sequentially())]))
  let t2637 = @tactics.match_mp_tac(@topology.uniformly_cauchy_imp_uniformly_convergent())
  let t2635 = @term_syntax.parse_term("(e : Real)")
  let t2636 = @tactics.spec_tac(@term_syntax.parse_term("(e : Real)"), t2635)
  let t2634 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t2633 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp(), @equal.gsym(@vectors.dist())]))
  let t2632 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @metric.eventually_sequentially()]))
  let t2630 = @simp.rewrite_tac(@list.List([@topology.sums(), @sets.inter_univ()]))
  let t2627 = @simp.gen_rewrite_rule(fn(x2626 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2626
  }, @list.List([@equal.gsym(@topology.sums_infsum())]))
  let t2629 = @tactics.first_x_assum(fn(x2628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2624 = @tactics.mp_tac(x2623)
      fn(x2625 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2624(x2625)
      }
    })(t2627(x2628))
  })
  let t2621 = @equal.gsym(@vectors.dist())
  let t2622 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.tendsto()), @complexes.complex_pow_one(), @complexes.complex_mul_rid(), t2621, @class.eta_ax()]))
  let t2619 = @term_syntax.parse_term("(e : Real)")
  let t2620 = @tactics.spec_tac(@term_syntax.parse_term("(e : Real)"), t2619)
  let t2618 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t2631 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num(), @complexes.complex_sub_refl(), @real.real_sub_refl(), @calc_int.real_mul_rzero(), @realax.real_le_refl()])), t2618), t2620), t2622), t2629), t2630), @tactics.all_tac])
  let t2617 = @simp.rewrite_tac(@list.List([@metric.eventually_and()]))
  let t2616 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ z : Cart[Real, 2], (P : (Cart[Real, 2]) -> Bool)(z)) == (P(Cx(real_of_num(1))) && (∀ z : Cart[Real, 2], !(z == Cx(real_of_num(1))) → P(z)))"))]))
  let t2615 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2613 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(i : _) | IN(i, (t : (_) -> Bool)) && IN(i, (s : (_) -> Bool))} == INTER(s, t)"))]))
  let t2611 = @equal.gsym(@vectors.vsum_restrict_set())
  let t2612 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), t2611, @topology.infsum_restrict(), @topology.summable_restrict()]))
  let t2610 = @simp.rewrite_tac(@list.List([@class.cond_rand(), @class.cond_rator(), @complexes.complex_mul_lzero()]))
  let t2604 = @term_syntax.parse_term("(e : Real)")
  let t2605 = @term_syntax.parse_term("(i : Num) => if IN(i, (s : (Num) -> Bool)) { (a : (Num) -> Cart[Real, 2])(i) } else { Cx(real_of_num(0)) }")
  let t2606 = @list.List([@term_syntax.parse_term("(M : Real)"), t2605, t2604])
  let t2609 = @tactics.first_assum(fn(x2608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2602 = @tactics.mp_tac(x2601)
      fn(x2603 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2602(x2603)
      }
    })(((x2607 : @kernel.Thm) => @bool.ispecl(t2606, x2607))(x2608))
  })
  let t2614 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2609), t2610), t2612), t2613)])
  let t2779 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ M : Real, ∀ a : (Num) -> Cart[Real, 2], ∀ e : Real, summable(UNIV, a) && real_of_num(0) < M && real_of_num(0) < e → eventually((n : Num) => ∀ z : Cart[Real, 2], norm(Cx(real_of_num(1)) - z) <= M * (real_of_num(1) - norm(z)) → norm(vsum(op_dot_dot(0, n), (i : Num) => a(i) * pow(z, i)) - infsum(UNIV, (i : Num) => a(i) * pow(z, i))) < e, sequentially)"), fn(x2598 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2599 = @tactics.assume_tac(x2598)
    fn(x2600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2599(x2600)
    }
  }), t2614), t2615), t2616), t2617), @tactics.conj_tac), t2631), t2632), t2633), t2634), t2636), t2637), t2638), @tactics.conj_tac), t2778)
  power_series_uniform_convergence_stolz_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : Real, ∀ a : (Num) -> Cart[Real, 2], ∀ s : (Num) -> Bool, ∀ e : Real, summable(s, a) && real_of_num(0) < M && real_of_num(0) < e → eventually((n : Num) => ∀ z : Cart[Real, 2], norm(Cx(real_of_num(1)) - z) <= M * (real_of_num(1) - norm(z)) → norm(vsum(INTER(s, op_dot_dot(0, n)), (i : Num) => a(i) * pow(z, i)) - infsum(s, (i : Num) => a(i) * pow(z, i))) < e, sequentially)"), t2779))
}

///|
let power_series_uniform_convergence_stolz_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWER_SERIES_UNIFORM_CONVERGENCE_STOLZ_1")

///|
/// `POWER_SERIES_UNIFORM_CONVERGENCE_STOLZ_1`
pub fn power_series_uniform_convergence_stolz_1() -> @kernel.Thm {
  power_series_uniform_convergence_stolz_1_c.get()
}

///|
/// POWER_SERIES_UNIFORM_CONVERGENCE_STOLZ
fn step_344() -> Unit raise {
  let t2825 = @simp.asm_simp_tac(@list.List([@complexes.complex_div_rmul()]))
  let t2824 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_norm_mul()), @realax.real_mul_lid()]))
  let t2823 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), @real.real_sub_rdistrib()]))
  let t2822 = @simp.asm_simp_tac(@list.List([@complexes.complex_field(@term_syntax.parse_term("!((w : Cart[Real, 2]) == Cx(real_of_num(0))) → (Cx(real_of_num(1)) - (z : Cart[Real, 2]) / w) * w == w - z"))]))
  let t2821 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_nz(), @equal.gsym(@complexes.complex_norm_mul())]))
  let t2820 = @tactics.exists_tac(@term_syntax.parse_term("norm((w : Cart[Real, 2]))"))
  let t2819 = @tactics.match_mp_tac(@real.real_le_rcancel_imp())
  let t2818 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2817 = @simp.asm_simp_tac(@list.List([@complexes.complex_div_lmul()]))
  let t2815 = @equal.gsym(@complexes.complex_pow_mul())
  let t2816 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc()), t2815]))
  let t2811 = @term_syntax.parse_term("(z : Cart[Real, 2]) / (w : Cart[Real, 2])")
  let t2814 = @tactics.first_x_assum(fn(x2813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2808 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2809 = @tactics.mp_tac(x2808)
      fn(x2810 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2809(x2810)
      }
    })(((x2812 : @kernel.Thm) => @bool.spec(t2811, x2812))(x2813))
  })
  let t2807 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2806 = @simp.rewrite_tac(@list.List([]))
  let t2805 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2804 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t2802 = @drule.match_mp(power_series_uniform_convergence_stolz_1())
  let t2826 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x2803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2799 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2800 = @tactics.mp_tac(x2799)
      fn(x2801 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2800(x2801)
      }
    })(t2802(x2803))
  }), t2804), t2805), t2806), @tactics.disch_tac), t2807), @tactics.strip_tac), t2814), t2816), t2817), t2818), t2819), t2820), t2821), t2822), t2823), t2824), t2825)
  let t2798 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @arith.le_0(), @iterate.in_numseg()]))
  let t2797 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @vectors.vsum_delta()]))
  let t2796 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t2795 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t2794 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t2793 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t2792 = @simp.rewrite_tac(@list.List([@topology.sums()]))
  let t2791 = @tactics.match_mp_tac(@topology.infsum_unique())
  let t2790 = @simp.asm_rewrite_tac(@list.List([]))
  let t2789 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("(x : Cart[Real, 2]) == (y : Cart[Real, 2]) && real_of_num(0) < (e : Real) → norm(y - x) < e")))
  let t2788 = @simp.rewrite_tac(@list.List([@class.cond_rator(), @class.cond_rand(), @complexes.complex_mul_rzero(), @complexes.complex_mul_rid()]))
  let t2787 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_pow_zero()]))
  let t2786 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2785 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t2784 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially(), @theorems.forall_unwind_thm2()]))
  let t2783 = @simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("(real_of_num(0) <= -norm((z : Cart[Real, _]))) == (z == vec(0))"))]))
  let t2782 = @simp.asm_simp_tac(@list.List([@real.real_le_mul_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (M : Real) → real_of_num(0) < real_of_num(1) + M"))]))
  let t2781 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @calc_rat.real_arith(@term_syntax.parse_term("((n : Real) <= (M : Real) * -n) == (real_of_num(0) <= -n * (real_of_num(1) + M))"))]))
  let t2827 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_lzero(), @real.real_sub_lzero(), @complexes.complex_norm_0()])), t2781), t2782), t2783), t2784), t2785), t2786), @tactics.disch_tac), t2787), t2788), t2789), t2790), t2791), t2792), t2793), t2794), t2795), t2796), @tactics.disch_tac), t2797), t2798), t2826])
  let t2780 = @class.asm_cases_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t2828 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t2780), t2827)
  power_series_uniform_convergence_stolz_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : Real, ∀ a : (Num) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ s : (Num) -> Bool, ∀ e : Real, summable(s, (i : Num) => a(i) * pow(w, i)) && real_of_num(0) < M && real_of_num(0) < e → eventually((n : Num) => ∀ z : Cart[Real, 2], norm(w - z) <= M * (norm(w) - norm(z)) → norm(vsum(INTER(s, op_dot_dot(0, n)), (i : Num) => a(i) * pow(z, i)) - infsum(s, (i : Num) => a(i) * pow(z, i))) < e, sequentially)"), t2828))
}

///|
let power_series_uniform_convergence_stolz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWER_SERIES_UNIFORM_CONVERGENCE_STOLZ")

///|
/// `POWER_SERIES_UNIFORM_CONVERGENCE_STOLZ`
pub fn power_series_uniform_convergence_stolz() -> @kernel.Thm {
  power_series_uniform_convergence_stolz_c.get()
}

///|
/// ABEL_POWER_SERIES_CONTINUOUS
fn step_345() -> Unit raise {
  let t2836 = @simp.simp_tac(@list.List([continuous_on_complex_mul(), continuous_on_complex_pow(), @topology.continuous_on_id(), @topology.continuous_on_const(), @sets.finite_inter(), @iterate.finite_numseg()]))
  let t2835 = @tactics.match_mp_tac(@topology.continuous_on_vsum())
  let t2834 = @simp.rewrite_tac(@list.List([]))
  let t2833 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2832 = @tactics.match_mp_tac(@metric.always_eventually())
  let t2831 = @simp.asm_simp_tac(@list.List([power_series_uniform_convergence_stolz(), @sets.in_elim_thm(), @metric.trivial_limit_sequentially()]))
  let t2830 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (z : Cart[Real, 2]) => vsum(INTER((s : (Num) -> Bool), op_dot_dot(0, n)), (i : Num) => (a : (Num) -> Cart[Real, 2])(i) * pow(z, i))"))
  let t2829 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.continuous_uniform_limit()))
  let t2837 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2829), t2830), t2831), t2832), t2833), t2834), t2835), t2836)
  abel_power_series_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : Real, ∀ s : (Num) -> Bool, ∀ a : (Num) -> Cart[Real, 2], ∀ w : Cart[Real, 2], summable(s, (i : Num) => a(i) * pow(w, i)) && real_of_num(0) < M → continuous_on((z : Cart[Real, 2]) => infsum(s, (i : Num) => a(i) * pow(z, i)), {(z : Cart[Real, 2]) | norm(w - z) <= M * (norm(w) - norm(z))})"), t2837))
}

///|
let abel_power_series_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABEL_POWER_SERIES_CONTINUOUS")

///|
/// `ABEL_POWER_SERIES_CONTINUOUS`
pub fn abel_power_series_continuous() -> @kernel.Thm {
  abel_power_series_continuous_c.get()
}

///|
/// ABEL_POWER_SERIES_CONTINUOUS_1
fn step_346() -> Unit raise {
  let t2847 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rid(), @class.eta_ax()]))
  let t2846 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num(), @complexes.complex_pow_one()]))
  let t2842 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t2845 = @tactics.disch_then(fn(x2844 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2839 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2840 = @tactics.mp_tac(x2839)
      fn(x2841 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2840(x2841)
      }
    })(((x2843 : @kernel.Thm) => @bool.spec(t2842, x2843))(x2844))
  })
  let t2838 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t2848 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(abel_power_series_continuous()), t2838), t2845), t2846), t2847)
  abel_power_series_continuous_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : Real, ∀ s : (Num) -> Bool, ∀ a : (Num) -> Cart[Real, 2], summable(s, a) && real_of_num(0) < M → continuous_on((z : Cart[Real, 2]) => infsum(s, (i : Num) => a(i) * pow(z, i)), {(z : Cart[Real, 2]) | norm(Cx(real_of_num(1)) - z) <= M * (real_of_num(1) - norm(z))})"), t2848))
}

///|
let abel_power_series_continuous_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABEL_POWER_SERIES_CONTINUOUS_1")

///|
/// `ABEL_POWER_SERIES_CONTINUOUS_1`
pub fn abel_power_series_continuous_1() -> @kernel.Thm {
  abel_power_series_continuous_1_c.get()
}

///|
/// ABEL_LIMIT_THEOREM
fn step_347() -> Unit raise {
  let t2860 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t2859 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @complexes.complex_sub_refl(), @real.real_sub_refl()]))
  let t2856 = @simp.rewrite_rule(@list.List([@topology.continuous_on_v1()]))
  let t2858 = @tactics.first_x_assum(fn(x2857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2856(x2857))
  })
  let t2855 = @list.List([@meson.asm_meson_tac(@list.List([power_series_radius_of_convergence()])), @tactics.all_tac])
  let t2854 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2853 = @simp.asm_rewrite_tac(@list.List([]))
  let t2852 = @tactics.disch_then(fn(x2850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2850
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t2849 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t2861 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(abel_power_series_continuous()), t2849), t2852), t2853), t2854), t2855), t2858), t2859), t2860), @calc_rat.real_arith_tac)
  abel_limit_theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : Real, ∀ s : (Num) -> Bool, ∀ a : (Num) -> Cart[Real, 2], ∀ w : Cart[Real, 2], summable(s, (i : Num) => a(i) * pow(w, i)) && real_of_num(0) < M → (∀ z : Cart[Real, 2], norm(z) < norm(w) → summable(s, (i : Num) => a(i) * pow(z, i))) && op_minus_minus_gt((z : Cart[Real, 2]) => infsum(s, (i : Num) => a(i) * pow(z, i)), infsum(s, (i : Num) => a(i) * pow(w, i)), within(at(w), {(z : Cart[Real, 2]) | norm(w - z) <= M * (norm(w) - norm(z))}))"), t2861))
}

///|
let abel_limit_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABEL_LIMIT_THEOREM")

///|
/// `ABEL_LIMIT_THEOREM`
pub fn abel_limit_theorem() -> @kernel.Thm {
  abel_limit_theorem_c.get()
}

///|
/// ABEL_LIMIT_THEOREM_1
fn step_348() -> Unit raise {
  let t2871 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rid(), @class.eta_ax()]))
  let t2870 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num(), @complexes.complex_pow_one()]))
  let t2866 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t2869 = @tactics.disch_then(fn(x2868 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2863 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2864 = @tactics.mp_tac(x2863)
      fn(x2865 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2864(x2865)
      }
    })(((x2867 : @kernel.Thm) => @bool.spec(t2866, x2867))(x2868))
  })
  let t2862 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t2872 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(abel_limit_theorem()), t2862), t2869), t2870), t2871)
  abel_limit_theorem_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : Real, ∀ s : (Num) -> Bool, ∀ a : (Num) -> Cart[Real, 2], summable(s, a) && real_of_num(0) < M → (∀ z : Cart[Real, 2], norm(z) < real_of_num(1) → summable(s, (i : Num) => a(i) * pow(z, i))) && op_minus_minus_gt((z : Cart[Real, 2]) => infsum(s, (i : Num) => a(i) * pow(z, i)), infsum(s, a), within(at(Cx(real_of_num(1))), {(z : Cart[Real, 2]) | norm(Cx(real_of_num(1)) - z) <= M * (real_of_num(1) - norm(z))}))"), t2872))
}

///|
let abel_limit_theorem_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABEL_LIMIT_THEOREM_1")

///|
/// `ABEL_LIMIT_THEOREM_1`
pub fn abel_limit_theorem_1() -> @kernel.Thm {
  abel_limit_theorem_1_c.get()
}

///|
/// POWER_SERIES_CONTINUOUS
fn step_349() -> Unit raise {
  let t2954 = @meson.asm_meson_tac(@list.List([]))
  let t2953 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_cball()])))
  let t2955 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.sums(), @topology.lim_sequentially(), @vectors.dist()])), t2953), t2954)
  let t2952 = @tactics.conv_tac(@vectors.norm_arith)
  let t2951 = @tactics.repeat_tac(@tactics.pop_assum(fn(x2948 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2949 = @tactics.mp_tac(x2948)
    fn(x2950 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2949(x2950)
    }
  }))
  let t2944 = @term_syntax.parse_term("real_of_num(0)")
  let t2947 = @tactics.first_x_assum(fn(x2946 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2943 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x2945 : @kernel.Thm) => @bool.spec(t2944, x2945))(x2946))
  })
  let t2956 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2947), t2951), t2952), t2955])
  let t2942 = @simp.rewrite_tac(@list.List([]))
  let t2941 = @tactics.exists_tac(@term_syntax.parse_term("(k : (Num) -> Bool)"))
  let t2940 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (a : (Num) -> Cart[Real, 2])(n) * pow((y : Cart[Real, 2]) - (z : Cart[Real, 2]), n)"))
  let t2939 = @tactics.match_mp_tac(@topology.series_unique())
  let t2938 = @simp.rewrite_tac(@list.List([@topology.in_cball()]))
  let t2937 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2936 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t2935 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, 2], IN(x, cball(((z : Cart[Real, 2]), (R : Real)))) → (f : (Cart[Real, 2]) -> Cart[Real, 2])(x) == (g : (Cart[Real, 2]) -> Cart[Real, 2])(x)"), fn(x2932 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2933 = @tactics.mp_tac(x2932)
    fn(x2934 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2933(x2934)
    }
  })
  let t2930 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t2957 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_then((x2931 : @kernel.Thm) => @tactics.x_choose_tac(t2930, x2931)), t2935), t2936), t2937), t2938), @tactics.disch_tac), t2939), t2940), t2941), t2942), @tactics.conj_tac), t2956)
  let t2927 = @tactics.conv_tac(@vectors.norm_arith)
  let t2926 = @tactics.undisch_tac(@term_syntax.parse_term("norm((z : Cart[Real, 2]) - (x : Cart[Real, 2])) <= (R : Real)"))
  let t2925 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le(), @complexes.complex_norm_cx()]))
  let t2924 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t2923 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_pow()]))
  let t2922 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2921 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t2920 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @real.real_abs_mul(), @vectors.real_abs_norm()]))
  let t2919 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2918 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2917 = @simp.rewrite_tac(@list.List([@topology.in_cball(), @vectors.dist()]))
  let t2928 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t2917), t2918), t2919), t2920), t2921), t2922), t2923), t2924), t2925), t2926), t2927)
  let t2916 = @tactics.conv_tac(@vectors.norm_arith)
  let t2915 = @tactics.undisch_tac(@term_syntax.parse_term("distance(((z : Cart[Real, 2]), (w : Cart[Real, 2]))) < (r : Real)"))
  let t2914 = @simp.expand_tac("R")
  let t2913 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t2909 = @meson.meson_tac(@list.List([]))
  let t2910 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.summable(), @complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) + (r : Cart[Real, 2]) - z == r"))])), t2909)
  let t2911 = @list.List([@simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((z : Cart[Real, 2]), z + (r : Cart[Real, 2]))) == norm(r)"))])), t2910])
  let t2906 = @term_syntax.parse_term("(z : Cart[Real, 2]) + Cx(((r : Real) + (R : Real)) / real_of_num(2))")
  let t2912 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x2908 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2903 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2904 = @tactics.mp_tac(x2903)
      fn(x2905 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2904(x2905)
      }
    })(((x2907 : @kernel.Thm) => @bool.spec(t2906, x2907))(x2908))
  }), @tactics.ants_tac), t2911), @tactics.all_tac])
  let t2902 = @tactics.exists_tac(@term_syntax.parse_term("Cx(((r : Real) + (R : Real)) / real_of_num(2))"))
  let t2929 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(power_series_conv_imp_absconv()), t2902), @tactics.conj_tac), t2912), t2913), t2914), t2915), t2916), t2928])
  let t2958 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re_cx(), @vectors.norm_pos_le(), @complexes.real_cx()])), @tactics.conj_tac), t2929), t2957])
  let t2901 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially(), @vectors.dist()]))
  let t2897 = @term_syntax.parse_term("(k : (Num) -> Bool)")
  let t2898 = @term_syntax.parse_term("(x : Cart[Real, 2]) => IN(x, cball(((z : Cart[Real, 2]), (R : Real))))")
  let t2899 = @term_syntax.parse_term("(n : Num) => Cx(norm((a : (Num) -> Cart[Real, 2])(n) * pow(Cx((R : Real)), n)))")
  let t2900 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(w : Cart[Real, 2]) => (n : Num) => (a : (Num) -> Cart[Real, 2])(n) * pow(w - (z : Cart[Real, 2]), n)"), t2899, t2898, t2897]), series_comparison_uniform_complex()))
  let t2895 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const(), @topology.continuous_on_id()]))
  let t2894 = @tactics.match_mp_tac(@topology.continuous_on_sub())
  let t2893 = @tactics.match_mp_tac(continuous_on_complex_pow())
  let t2892 = @tactics.match_mp_tac(continuous_on_complex_lmul())
  let t2891 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t2890 = @simp.simp_tac(@list.List([@sets.finite_inter(), @iterate.finite_numseg(), @sets.in_inter(), @iterate.in_numseg()]))
  let t2889 = @tactics.match_mp_tac(@topology.continuous_on_vsum())
  let t2888 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2887 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t2896 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t2887), t2888), t2889), t2890), t2891), @tactics.strip_tac), t2892), t2893), t2894), t2895), @tactics.all_tac])
  let t2886 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t2885 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (w : Cart[Real, 2]) => vsum(INTER((k : (Num) -> Bool), op_dot_dot(0, n)), (i : Num) => (a : (Num) -> Cart[Real, 2])(i) * pow(w - (z : Cart[Real, 2]), i))"))
  let t2884 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.continuous_uniform_limit()))
  let t2882 = @tactics.conv_tac(@vectors.norm_arith)
  let t2881 = @tactics.undisch_tac(@term_syntax.parse_term("distance(((z : Cart[Real, 2]), (w : Cart[Real, 2]))) < (r : Real)"))
  let t2883 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("R"), t2881), t2882)])
  let t2880 = @simp.rewrite_tac(@list.List([@topology.interior_cball(), @topology.in_ball()]))
  let t2879 = @tactics.exists_tac(@term_syntax.parse_term("cball(((z : Cart[Real, 2]), (R : Real)))"))
  let t2878 = @tactics.match_mp_tac(@topology.continuous_on_interior())
  let t2877 = @simp.abbrev_tac(@term_syntax.parse_term("(R : Real) == ((r : Real) + distance(((z : Cart[Real, 2]), (w : Cart[Real, 2])))) / real_of_num(2)"))
  let t2876 = @simp.rewrite_tac(@list.List([@topology.in_ball()]))
  let t2875 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t2874 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_at(), @topology.open_ball()]))
  let t2873 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2959 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_ball()])), t2873), t2874), t2875), t2876), @tactics.disch_tac), t2877), t2878), t2879), t2880), @tactics.conj_tac), t2883), t2884), t2885), t2886), @tactics.conj_tac), t2896), t2900), t2901), @tactics.ants_tac), t2958)
  power_series_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, 2], ∀ k : (Num) -> Bool, ∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ r : Real, (∀ w : Cart[Real, 2], IN(w, ball((z, r))) → sums((n : Num) => a(n) * pow(w - z, n), f(w), k)) → continuous_on(f, ball((z, r)))"), t2959))
}

///|
let power_series_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWER_SERIES_CONTINUOUS")

///|
/// `POWER_SERIES_CONTINUOUS`
pub fn power_series_continuous() -> @kernel.Thm {
  power_series_continuous_c.get()
}

///|
/// POWER_SERIES_LIMIT_POINT_OF_ZEROS
fn step_350() -> Unit raise {
  let t3081 = @simp.asm_rewrite_tac(@list.List([@topology.centre_in_ball()]))
  let t3080 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3079 = @simp.asm_rewrite_tac(@list.List([]))
  let t3078 = @tactics.exists_tac(@term_syntax.parse_term("{(i : Num) | IN((m : Num) + i, (k : (Num) -> Bool))}"))
  let t3077 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => (c : (Num) -> Cart[Real, 2])((m : Num) + i) * pow((z : Cart[Real, 2]) - z, i)"))
  let t3076 = @tactics.match_mp_tac(@topology.series_unique())
  let t3082 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) == (c : (Num) -> Cart[Real, 2])((m : Num))"), fn(x3074 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x3074
    @simp.asm_rewrite_tac(@list.List([th_2]))
  }), t3076), t3077), t3078), t3079), t3080), t3081)
  let t3073 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @real.real_lt_min()]))
  let t3072 = @tactics.disch_then(fn(x3069 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3069
    let t3071 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("min((r : Real) / real_of_num(2), (e : Real))"), th_1))
    @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)")), t3071)
  })
  let t3068 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.cball_min_inter())]))
  let t3067 = @simp.rewrite_tac(@list.List([@topology.limpt_infinite_cball(), @sets.inter_assoc()]))
  let t3083 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("limit_point_of((z : Cart[Real, 2]), (s : (Cart[Real, 2]) -> Bool))")), t3067), t3068), t3072), t3073), t3082])
  let t3066 = @simp.rewrite_tac(@list.List([@topology.in_closure_delete(), @class.not_imp(), @sets.in_sing()]))
  let t3063 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3084 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x3065 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3061 = @tactics.mp_tac(x3060)
      fn(x3062 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3061(x3062)
      }
    })(((x3064 : @kernel.Thm) => @bool.spec(t3063, x3064))(x3065))
  }), t3066), @tactics.conj_tac), t3083)
  let t3057 = @simp.rewrite_tac(@list.List([@topology.in_cball(), @topology.in_ball()]))
  let t3056 = @tactics.undisch_tac(@term_syntax.parse_term("IN((w : Cart[Real, 2]), cball(((z : Cart[Real, 2]), (r : Real) / real_of_num(2))))"))
  let t3055 = @simp.asm_rewrite_tac(@list.List([]))
  let t3054 = @tactics.first_assum(@tactics.match_mp_tac)
  let t3053 = @simp.rewrite_tac(@list.List([]))
  let t3052 = @tactics.exists_tac(@term_syntax.parse_term("{(i : Num) | IN((m : Num) + i, (k : (Num) -> Bool))}"))
  let t3051 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => (c : (Num) -> Cart[Real, 2])((m : Num) + i) * pow((w : Cart[Real, 2]) - (z : Cart[Real, 2]), i)"))
  let t3050 = @tactics.match_mp_tac(@topology.series_unique())
  let t3049 = @tactics.subgoal_then(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2])) == (f : (Cart[Real, 2]) -> Cart[Real, 2])(w) / pow(w - (z : Cart[Real, 2]), (m : Num))"), fn(x3047 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3047
    @simp.asm_simp_tac(@list.List([@complexes.complex_div_eq_0(), th]))
  })
  let t3046 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.in_delete()]))
  let t3058 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), t3046), @tactics.strip_tac), t3049), t3050), t3051), t3052), t3053), @tactics.conj_tac), t3054), t3055), t3056), t3057), @calc_rat.asm_real_arith_tac)
  let t3045 = @simp.simp_tac(@list.List([@topology.closure_closed(), @topology.closed_cball(), @topology.subset_balls(), @vectors.dist_refl()]))
  let t3044 = @simp.simp_tac(@list.List([@topology.subset_closure(), @sets.inter_subset(), @sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(DELETE(s, (z : _)), t)"))]))
  let t3042 = @term_syntax.parse_term("closure(cball(((z : Cart[Real, 2]), (r : Real) / real_of_num(2))))")
  let t3043 = @tactics.trans_tac(@sets.subset_trans())(t3042)
  let t3040 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.continuous_on_subset()))
  let t3059 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3040(x3041))
  }), t3043), t3044), t3045), @calc_rat.asm_real_arith_tac), t3058])
  let t3039 = @simp.rewrite_tac(@list.List([@topology.closed_sing(), @sets.in_sing()]))
  let t3085 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.forall_in_closure()), t3039), @tactics.conj_tac), t3059), t3084])
  let t3038 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, 2], IN(x, closure(DELETE(INTER((s : (Cart[Real, 2]) -> Bool), cball(((z : Cart[Real, 2]), (r : Real) / real_of_num(2)))), z))) → IN((g : (Cart[Real, 2]) -> Cart[Real, 2])(x), {Cx(real_of_num(0))})"), fn(x3035 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3036 = @tactics.mp_tac(x3035)
    fn(x3037 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3036(x3037)
    }
  })
  let t3033 = @meson.asm_meson_tac(@list.List([]))
  let t3034 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(power_series_continuous()), t3033), @tactics.all_tac])
  let t3032 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on((g : (Cart[Real, 2]) -> Cart[Real, 2]), ball(((z : Cart[Real, 2]), (r : Real))))"), fn(x3029 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3030 = @tactics.assume_tac(x3029)
    fn(x3031 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3030(x3031)
    }
  })
  let t3024 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t3026 = @tactics.disch_then((x3025 : @kernel.Thm) => @tactics.x_choose_tac(t3024, x3025))
  let t3027 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.summable(), @class.right_imp_exists_thm(), @class.skolem_thm()])), t3026)
  let t3023 = @meson.asm_meson_tac(@list.List([]))
  let t3022 = @class.asm_cases_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) == (z : Cart[Real, 2])"))
  let t3021 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t3028 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), @tactics.disch_tac), t3021), t3022), t3023), t3027])
  let t3020 = @tactics.subgoal_then(@term_syntax.parse_term("∀ w : Cart[Real, 2], IN(w, ball(((z : Cart[Real, 2]), (r : Real)))) → summable({(i : Num) | IN((m : Num) + i, (k : (Num) -> Bool))}, (i : Num) => (c : (Num) -> Cart[Real, 2])(m + i) * pow(w - z, i))"), fn(x3017 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3018 = @tactics.mp_tac(x3017)
    fn(x3019 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3018(x3019)
    }
  })
  let t3015 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vsum_sing(), @complexes.complex_pow(), @arith.add_clauses(), @complexes.complex_mul_rid()])), @tactics.disch_tac)
  let t3014 = @simp.simp_tac(@list.List([@complexes.complex_sub_refl(), @complexes.complex_pow_eq_0()]))
  let t3013 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), @complexes.complex_vec_0(), @complexes.complex_entire()]))
  let t3012 = @simp.rewrite_tac(@list.List([@sets.finite_sing(), @sets.sing_subset(), @sets.in_elim_thm(), @sets.in_sing()]))
  let t3011 = @tactics.exists_tac(@term_syntax.parse_term("{0}"))
  let t3016 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.series_vsum()), t3011), t3012), t3013), t3014), t3015])
  let t3010 = @tactics.subgoal_then(@term_syntax.parse_term("sums((i : Num) => (c : (Num) -> Cart[Real, 2])((m : Num) + i) * pow((z : Cart[Real, 2]) - z, i), vsum({0}, (i : Num) => c(m + i) * pow(z - z, i)), {(i : Num) | IN(m + i, (k : (Num) -> Bool))})"), fn(x3007 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3008 = @tactics.mp_tac(x3007)
    fn(x3009 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3008(x3009)
    }
  })
  let t3003 = @meson.asm_meson_tac(@list.List([@arith.not_le()]))
  let t3002 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_entire()]))
  let t3001 = @simp.asm_rewrite_tac(@list.List([]))
  let t3000 = @class.asm_cases_tac(@term_syntax.parse_term("IN((i : Num), (k : (Num) -> Bool))"))
  let t2998 = @meson.meson(@list.List([]), @term_syntax.parse_term("(∃ x : _, IN((f : (_) -> _)(x), (k : (_) -> Bool)) && (y : _) == f(x)) == (IN(y, k) && (∃ x : _, y == f(x)))"))
  let t2999 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.le_exists()), t2998]))
  let t2997 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @sets.in_elim_thm()]))
  let t2996 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t2995 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.sums_eq()))
  let t2994 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.series_restrict())]))
  let t2993 = @list.List([@meson.asm_meson_tac(@list.List([@topology.in_ball(), @vectors.dist_sym()])), @tactics.all_tac])
  let t2992 = @tactics.subgoal_then(@term_syntax.parse_term("sums((i : Num) => (c : (Num) -> Cart[Real, 2])(i) * pow((w : Cart[Real, 2]) - (z : Cart[Real, 2]), i), (f : (Cart[Real, 2]) -> Cart[Real, 2])(w), (k : (Num) -> Bool))"), fn(x2989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2990 = @tactics.mp_tac(x2989)
    fn(x2991 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2990(x2991)
    }
  })
  let t2988 = @simp.rewrite_tac(@list.List([@sets.image(), @sets.in_elim_thm()]))
  let t2987 = @tactics.disch_then(fn(x2984 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2985 = @tactics.subst1_tac(x2984)
    fn(x2986 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2985(x2986)
    }
  })
  let t2983 = @simp.rewrite_tac(@list.List([]))
  let t2981 = @simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(@topology.sums_reindex_gen())
  let t2978 = @term_syntax.parse_term("{(i : Num) | IN((m : Num) + i, (k : (Num) -> Bool))}")
  let t2979 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]))")
  let t2980 = @term_syntax.parse_term("(i : Num) => (c : (Num) -> Cart[Real, 2])(i) * pow((w : Cart[Real, 2]) - (z : Cart[Real, 2]), i)")
  let t2982 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(m : Num)"), t2980, t2979, t2978]), t2981))
  let t2977 = @tactics.match_mp_tac(series_complex_rmul())
  let t3004 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div()])), t2977), t2982), t2983), t2987), t2988), t2992), t2993), t2994), t2995), t2996), t2997), t2999), t3000), t3001), @class.cond_cases_tac), t3002), t3003)
  let t2976 = @simp.asm_simp_tac(@list.List([@complexes.complex_div_pow2(), @complexes.complex_sub_0(), @arith.le_add()]))
  let t2975 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t2974 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t3005 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2974), @tactics.ap_term_tac), t2975), t2976), @tactics.ap_term_tac), @int.arith_tac), t3004])
  let t2973 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2972 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => (c : (Num) -> Cart[Real, 2])((m : Num) + i) * pow((w : Cart[Real, 2]) - (z : Cart[Real, 2]), m + i) / pow(w - z, m)"))
  let t2971 = @tactics.match_mp_tac(@topology.sums_eq())
  let t3006 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2971), t2972), t2973), @tactics.conj_tac), t3005), @tactics.all_tac])
  let t2970 = @tactics.subgoal_then(@term_syntax.parse_term("∀ w : Cart[Real, 2], IN(w, ball(((z : Cart[Real, 2]), (r : Real)))) && !(w == z) → sums((i : Num) => (c : (Num) -> Cart[Real, 2])((m : Num) + i) * pow(w - z, i), (f : (Cart[Real, 2]) -> Cart[Real, 2])(w) / pow(w - z, m), {(i : Num) | IN(m + i, (k : (Num) -> Bool))})"), fn(x2967 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2968 = @tactics.assume_tac(x2967)
    fn(x2969 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2968(x2969)
    }
  })
  let t2966 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(@tactics.strip_assume_tac))
  let t2965 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → !((q : Bool) && !(r : Bool))) == (q && p → r)"))]))
  let t2964 = @simp.gen_rewrite_tac(fn(x2961 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2962 = @equal.rand_conv(x2961)
    fn(x2963 : @kernel.Term) -> @kernel.Thm raise {
      s2962(x2963)
    }
  }, @list.List([@arith.num_wop()]))
  let t2960 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) → (Q : (_) -> Bool)(x)) == !(∃ x : _, P(x) && !Q(x))"))]))
  let t3086 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t2960), t2964), t2965), t2966), t2970), t3006), t3010), t3016), t3020), t3028), t3032), t3034), t3038), t3085)
  power_series_limit_point_of_zeros_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ c : (Num) -> Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ k : (Num) -> Bool, ∀ r : Real, ∀ s : (Cart[Real, 2]) -> Bool, real_of_num(0) < r && (∀ w : Cart[Real, 2], distance((w, z)) < r → sums((i : Num) => c(i) * pow(w - z, i), f(w), k)) && (∀ w : Cart[Real, 2], IN(w, s) → f(w) == Cx(real_of_num(0))) && limit_point_of(z, s) → (∀ i : Num, IN(i, k) → c(i) == Cx(real_of_num(0)))"), t3086))
}

///|
let power_series_limit_point_of_zeros_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWER_SERIES_LIMIT_POINT_OF_ZEROS")

///|
/// `POWER_SERIES_LIMIT_POINT_OF_ZEROS`
pub fn power_series_limit_point_of_zeros() -> @kernel.Thm {
  power_series_limit_point_of_zeros_c.get()
}

///|
/// POWER_SERIES_UNIQUE
fn step_351() -> Unit raise {
  let t3100 = @simp.asm_simp_tac(@list.List([@topology.series_sub()]))
  let t3099 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_rdistrib()]))
  let t3098 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min(), @complexes.complex_sub_0()]))
  let t3097 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@topology.in_ball()), @topology.ball_min_inter(), @sets.in_inter()]))
  let t3096 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t3092 = @term_syntax.parse_term("(t : (Cart[Real, 2]) -> Bool)")
  let t3093 = @term_syntax.parse_term("min((r : Real), (s : Real))")
  let t3094 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3095 = @tactics.map_every(fn(x3089 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3090 = @tactics.exists_tac(x3089)
    fn(x3091 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3090(x3091)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])(z) - (g : (Cart[Real, 2]) -> Cart[Real, 2])(z)"), t3094, t3093, t3092]))
  let t3088 = @tactics.match_mp_tac(power_series_limit_point_of_zeros())
  let t3087 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_0())]))
  let t3101 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t3087), t3088), t3095), t3096), t3097), t3098), t3099), t3100)
  power_series_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, 2]) -> Cart[Real, 2], ∀ c : (Num) -> Cart[Real, 2], ∀ d : (Num) -> Cart[Real, 2], ∀ k : (Num) -> Bool, ∀ r : Real, ∀ s : Real, ∀ t : (Cart[Real, 2]) -> Bool, ∀ z : Cart[Real, 2], real_of_num(0) < r && real_of_num(0) < s && (∀ w : Cart[Real, 2], IN(w, ball((z, r))) → sums((i : Num) => c(i) * pow(w - z, i), f(w), k)) && (∀ w : Cart[Real, 2], IN(w, ball((z, s))) → sums((i : Num) => d(i) * pow(w - z, i), g(w), k)) && (∀ w : Cart[Real, 2], IN(w, t) → f(w) == g(w)) && limit_point_of(z, t) → (∀ i : Num, IN(i, k) → c(i) == d(i))"), t3101))
}

///|
let power_series_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWER_SERIES_UNIQUE")

///|
/// `POWER_SERIES_UNIQUE`
pub fn power_series_unique() -> @kernel.Thm {
  power_series_unique_c.get()
}

///|
/// MEASURABLE_COMPLEX_ENDOMORPHISM
fn step_352() -> Unit raise {
  let t3165 = @meson.asm_meson_tac(@list.List([@complexes.real_cx()]))
  let t3164 = @simp.asm_rewrite_tac(@list.List([@trivia.i_thm(), @complexes.cnj_add(), @complexes.cnj_mul(), @complexes.cnj_cx(), @complexes.cnj_ii()]))
  let t3163 = @tactics.subst1_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), @complexes.complex_expand()))
  let t3162 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3161 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t3160 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3159 = @tactics.match_mp_tac(@theorems.mono_or())
  let t3157 = @meson.asm_meson_tac(@list.List([@complexes.real_neg(), @complexes.real_cx(), @complexes.complex_ring(@term_syntax.parse_term("ii * ii == -Cx(real_of_num(1))"))]))
  let t3158 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) == ii || z == -ii) == (z * z == -Cx(real_of_num(1)))"))])), t3157), @tactics.all_tac])
  let t3156 = @tactics.subgoal_then(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])(ii) == ii || f(ii) == -ii"), fn(x3153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3154 = @tactics.mp_tac(x3153)
    fn(x3155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3154(x3155)
    }
  })
  let t3151 = @tactics.conv_tac(@complexes.complex_ring)
  let t3150 = @tactics.undisch_tac(@term_syntax.parse_term("!((f : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) == Cx(real_of_num(0)))"))
  let t3149 = @simp.asm_rewrite_tac(@list.List([]))
  let t3148 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.real_v1()])))
  let t3143 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3144 = @list.List([@term_syntax.parse_term("Re((x : Cart[Real, 2]))"), t3143])
  let t3147 = @tactics.disch_then(fn(x3146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3140 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3141 = @tactics.mp_tac(x3140)
      fn(x3142 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3141(x3142)
      }
    })(((x3145 : @kernel.Thm) => @bool.specl(t3144, x3145))(x3146))
  })
  let t3139 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul()]))
  let t3138 = @tactics.disch_then(fn(x3137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3135 = @tactics.mp_tac(x3134)
      fn(x3136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3135(x3136)
      }
    })(@bool.conjunct2(x3137))
  })
  let t3131 = @simp.gen_rewrite_rule(fn(x3130 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3130
  }, @list.List([@vectors.linear()]))
  let t3133 = @tactics.first_x_assum(fn(x3132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3128 = @tactics.mp_tac(x3127)
      fn(x3129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3128(x3129)
      }
    })(t3131(x3132))
  })
  let t3126 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t3125 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3124 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @theorems.left_imp_exists_thm()]))
  let t3122 = @simp.gen_rewrite_rule(fn(x3119 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3120 = @equal.rand_conv(x3119)
    fn(x3121 : @kernel.Term) -> @kernel.Thm raise {
      s3120(x3121)
    }
  }, @list.List([@class.fun_eq_thm()]))
  let t3152 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3117 = @tactics.mp_tac(x3116)
      fn(x3118 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3117(x3118)
      }
    })(t3122(x3123))
  }), t3124), t3125), @tactics.strip_tac), t3126), @tactics.disch_tac), t3133), t3138), t3139), t3147), t3148), t3149), t3150), t3151), @tactics.all_tac])
  let t3115 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, 2], real(x) → (f : (Cart[Real, 2]) -> Cart[Real, 2])(x) == x"), fn(x3112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3113 = @tactics.assume_tac(x3112)
    fn(x3114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3113(x3114)
    }
  })
  let t3111 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool)) == (!p → q)"))]))
  let t3110 = @list.List([@meson.asm_meson_tac(@list.List([@measure.measurable_additive_imp_linear()])), @tactics.all_tac])
  let t3109 = @tactics.subgoal_then(@term_syntax.parse_term("linear((f : (Cart[Real, 2]) -> Cart[Real, 2]))"), fn(x3106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3107 = @tactics.assume_tac(x3106)
    fn(x3108 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3107(x3108)
    }
  })
  let t3104 = @simp.rewrite_tac(@list.List([@complexes.linear_cnj(), @vectors.linear_i()]))
  let t3103 = @tactics.match_mp_tac(@topology.linear_continuous_on())
  let t3102 = @tactics.match_mp_tac(@measure.continuous_imp_measurable_on())
  let t3105 = @list.List([@tactics.strip_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([@measure.measurable_on_const(), @complexes.complex_mul_lzero(), @complexes.complex_add_lid(), @trivia.i_thm(), @complexes.cnj_add(), @complexes.cnj_mul()]))), t3102), t3103), t3104)])
  let t3166 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t3105), t3109), t3110), t3111), @tactics.disch_tac), t3115), t3152), t3156), t3158), t3159), t3160), t3161), t3162), t3163), t3164), t3165)
  measurable_complex_endomorphism_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], (measurable_on(f, UNIV) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], f(x + y) == f(x) + f(y)) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], f(x * y) == f(x) * f(y))) == (f == ((x : Cart[Real, 2]) => Cx(real_of_num(0))) || f == I || f == cnj)"), t3166))
}

///|
let measurable_complex_endomorphism_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEASURABLE_COMPLEX_ENDOMORPHISM")

///|
/// `MEASURABLE_COMPLEX_ENDOMORPHISM`
pub fn measurable_complex_endomorphism() -> @kernel.Thm {
  measurable_complex_endomorphism_c.get()
}

///|
/// REAL_COMPLEX_ENDOMORPHISM
fn step_353() -> Unit raise {
  let t3320 = @meson.asm_meson_tac(@list.List([@complexes.real_cx()]))
  let t3319 = @simp.asm_rewrite_tac(@list.List([@trivia.i_thm(), @complexes.cnj_add(), @complexes.cnj_mul(), @complexes.cnj_cx(), @complexes.cnj_ii()]))
  let t3318 = @tactics.subst1_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), @complexes.complex_expand()))
  let t3317 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3316 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t3315 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3314 = @tactics.match_mp_tac(@theorems.mono_or())
  let t3312 = @meson.asm_meson_tac(@list.List([@complexes.real_neg(), @complexes.real_cx(), @complexes.complex_ring(@term_syntax.parse_term("ii * ii == -Cx(real_of_num(1))"))]))
  let t3313 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) == ii || z == -ii) == (z * z == -Cx(real_of_num(1)))"))])), t3312), @tactics.all_tac])
  let t3311 = @tactics.subgoal_then(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])(ii) == ii || f(ii) == -ii"), fn(x3308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3309 = @tactics.mp_tac(x3308)
    fn(x3310 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3309(x3310)
    }
  })
  let t3306 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @complexes.re_cx()]))
  let t3300 = @term_syntax.parse_term("(q : Real)")
  let t3301 = @list.List([@term_syntax.parse_term("(x : Real)"), t3300])
  let t3304 = @tactics.first_x_assum(fn(x3303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3298 = @tactics.mp_tac(x3297)
      fn(x3299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3298(x3299)
      }
    })(((x3302 : @kernel.Thm) => @bool.specl(t3301, x3302))(x3303))
  })
  let t3293 = @term_syntax.parse_term("(x : Real)")
  let t3294 = @list.List([@term_syntax.parse_term("(q : Real)"), t3293])
  let t3305 = @list.List([@tactics.first_x_assum(fn(x3296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3290 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3291 = @tactics.mp_tac(x3290)
      fn(x3292 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3291(x3292)
      }
    })(((x3295 : @kernel.Thm) => @bool.specl(t3294, x3295))(x3296))
  }), t3304])
  let t3289 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Real)"))(@tactics.strip_assume_tac))
  let t3286 = @drule.match_mp(@floor.rational_between())
  let t3288 = @tactics.first_assum(fn(x3287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3283 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3284 = @tactics.mp_tac(x3283)
      fn(x3285 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3284(x3285)
      }
    })(t3286(x3287))
  })
  let t3282 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3281 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) < (y : Real)) && !(y < x) → x == y")))
  let t3280 = @simp.simp_tac(@list.List([@complexes.real()]))
  let t3279 = @simp.rewrite_tac(@list.List([@sets.in_(), @complexes.real_cx()]))
  let t3275 = @term_syntax.parse_term("Cx((x : Real))")
  let t3278 = @tactics.disch_then(fn(x3277 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3272 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3273 = @tactics.mp_tac(x3272)
      fn(x3274 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3273(x3274)
      }
    })(((x3276 : @kernel.Thm) => @bool.spec(t3275, x3276))(x3277))
  })
  let t3271 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t3268 = @simp.gen_rewrite_rule(fn(x3267 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3267
  }, @list.List([@sets.subset()]))
  let t3270 = @tactics.first_x_assum(fn(x3269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3264 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3265 = @tactics.mp_tac(x3264)
      fn(x3266 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3265(x3266)
      }
    })(t3268(x3269))
  })
  let t3263 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_cx(), @complexes.im_cx()]))
  let t3262 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3260 = @simp.rewrite_tac(@list.List([@realarith.real_le_square()]))
  let t3259 = @simp.rewrite_tac(@list.List([@complexes.re_mul_cx(), @complexes.re_cx()]))
  let t3258 = @tactics.disch_then(fn(x3257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3255 = @tactics.subst1_tac(x3254)
      fn(x3256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3255(x3256)
      }
    })(@equal.sym(x3257))
  })
  let t3253 = @simp.rewrite_tac(@list.List([@complexes.real_v1()]))
  let t3252 = @simp.rewrite_tac(@list.List([@sets.in_(), @complexes.real_cx()]))
  let t3248 = @term_syntax.parse_term("Cx((z : Real))")
  let t3251 = @tactics.disch_then(fn(x3250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3246 = @tactics.mp_tac(x3245)
      fn(x3247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3246(x3247)
      }
    })(((x3249 : @kernel.Thm) => @bool.spec(t3248, x3249))(x3250))
  })
  let t3244 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t3241 = @simp.gen_rewrite_rule(fn(x3240 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3240
  }, @list.List([@sets.subset()]))
  let t3243 = @tactics.first_x_assum(fn(x3242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3238 = @tactics.mp_tac(x3237)
      fn(x3239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3238(x3239)
      }
    })(t3241(x3242))
  })
  let t3236 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_add(), @complexes.cx_mul(), @complexes.re_add(), @real.real_le_addr()]))
  let t3235 = @tactics.disch_then(fn(x3232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3233 = @tactics.subst1_tac(x3232)
    fn(x3234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3233(x3234)
    }
  })
  let t3231 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("(pow((z : Real), 2) == (y : Real) - (x : Real)) == (y == x + z * z)"))]))
  let t3230 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Real)"))
  let t3229 = @simp.rewrite_tac(@list.List([@real.real_pos_eq_square(), @theorems.left_imp_exists_thm()]))
  let t3228 = @simp.gen_rewrite_tac(fn(x3225 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3226 = @equal.land_conv(x3225)
    fn(x3227 : @kernel.Term) -> @kernel.Thm raise {
      s3226(x3227)
    }
  }, @list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t3261 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t3228), t3229), t3230), t3231), t3235), t3236), t3243), t3244), t3251), t3252), t3253), t3258), t3259), t3260), @tactics.all_tac])
  let t3224 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, x <= y → Re((f : (Cart[Real, 2]) -> Cart[Real, 2])(Cx(x))) <= Re(f(Cx(y)))"), fn(x3221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3222 = @tactics.assume_tac(x3221)
    fn(x3223 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3222(x3223)
    }
  })
  let t3220 = @tactics.match_mp_tac(@meson.meson(@list.List([@complexes.real_v1()]), @term_syntax.parse_term("(∀ x : Real, (P : (Cart[Real, 2]) -> Bool)(Cx(x))) → (∀ x : Cart[Real, 2], real(x) → P(x))")))
  let t3218 = @simp.asm_simp_tac(@list.List([@complexes.cx_neg()]))
  let t3217 = @tactics.match_mp_tac(@floor.forall_integer())
  let t3213 = @term_syntax.parse_term("(y : Real)")
  let t3214 = @tactics.spec_tac(@term_syntax.parse_term("(n : Real)"), t3213)
  let t3215 = @tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.undisch_tac(@term_syntax.parse_term("integer((n : Real))"))), t3214)
  let t3211 = @term_syntax.parse_term("(y : Real)")
  let t3212 = @tactics.spec_tac(@term_syntax.parse_term("(m : Real)"), t3211)
  let t3216 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("integer((m : Real))")), t3212), t3215])
  let t3210 = @simp.asm_simp_tac(@list.List([@realax.real_div(), @complexes.cx_mul(), @complexes.cx_inv(), @complexes.cx_inj()]))
  let t3207 = @term_syntax.parse_term("(n : Real)")
  let t3208 = @term_syntax.parse_term("(m : Real)")
  let t3209 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(q : Real)"), t3208, t3207]))
  let t3219 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@floor.rational(), @theorems.left_imp_exists_thm()])), t3209), @tactics.strip_tac), t3210), @tactics.binop_tac), t3216), t3217), t3218), @tactics.all_tac])
  let t3206 = @tactics.subgoal_then(@term_syntax.parse_term("∀ q : Real, rational(q) → (f : (Cart[Real, 2]) -> Cart[Real, 2])(Cx(q)) == Cx(q)"), fn(x3203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3204 = @tactics.assume_tac(x3203)
    fn(x3205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3204(x3205)
    }
  })
  let t3201 = @meson.asm_meson_tac(@list.List([@complexes.complex_mul_linv()]))
  let t3200 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("(z : Cart[Real, 2]) * (w : Cart[Real, 2]) == Cx(real_of_num(1)) → z == inv(w)")))
  let t3202 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3200), t3201), @tactics.all_tac])
  let t3199 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], !(z == Cx(real_of_num(0))) → (f : (Cart[Real, 2]) -> Cart[Real, 2])(inv(z)) == inv(f(z))"), fn(x3196 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3197 = @tactics.assume_tac(x3196)
    fn(x3198 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3197(x3198)
    }
  })
  let t3195 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((w : Cart[Real, 2]) == -(z : Cart[Real, 2])) == (w + z == Cx(real_of_num(0)))"))])), @tactics.all_tac])
  let t3194 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], (f : (Cart[Real, 2]) -> Cart[Real, 2])(-z) == -f(z)"), fn(x3191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3192 = @tactics.assume_tac(x3191)
    fn(x3193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3192(x3193)
    }
  })
  let t3188 = @meson.asm_meson_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((w : Cart[Real, 2]) * (z : Cart[Real, 2]) == w) == (w == Cx(real_of_num(0)) || z == Cx(real_of_num(1)))"))]))
  let t3187 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3186 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @theorems.left_imp_exists_thm()]))
  let t3183 = @simp.gen_rewrite_rule(fn(x3180 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3181 = @equal.rand_conv(x3180)
    fn(x3182 : @kernel.Term) -> @kernel.Thm raise {
      s3181(x3182)
    }
  }, @list.List([@class.fun_eq_thm()]))
  let t3185 = @tactics.first_x_assum(fn(x3184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3178 = @tactics.mp_tac(x3177)
      fn(x3179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3178(x3179)
      }
    })(t3183(x3184))
  })
  let t3189 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), @complexes.cx_add()])), t3185), t3186), t3187), @tactics.strip_tac), @tactics.ap_term_tac), t3188)
  let t3190 = @list.List([@tactics.thenl(@nums.induct_tac, @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) == Cx(real_of_num(0))) == (z + (w : Cart[Real, 2]) == w)"))])), t3189])), @tactics.all_tac])
  let t3307 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, (f : (Cart[Real, 2]) -> Cart[Real, 2])(Cx(real_of_num(n))) == Cx(real_of_num(n))"), fn(x3174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3175 = @tactics.assume_tac(x3174)
    fn(x3176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3175(x3176)
    }
  }), t3190), t3194), t3195), t3199), t3202), t3206), t3219), t3220), t3224), t3261), t3262), t3263), t3270), t3271), t3278), t3279), t3280), @tactics.disch_tac), t3281), t3282), t3288), t3289), t3305), t3306), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3173 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, 2], real(x) → (f : (Cart[Real, 2]) -> Cart[Real, 2])(x) == x"), fn(x3170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3171 = @tactics.assume_tac(x3170)
    fn(x3172 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3171(x3172)
    }
  })
  let t3169 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) || (q : Bool)) == (!p → q)"))]))
  let t3167 = @simp.rewrite_tac(@list.List([@sets.in_(), @complexes.cnj_cnj(), @complexes.real_cx(), @complexes.real_cnj(), @theorems.eq_sym_eq()]))
  let t3168 = @list.List([@tactics.strip_tac, @tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @complexes.complex_mul_lzero(), @complexes.complex_add_lid(), @trivia.i_thm(), @complexes.cnj_add(), @complexes.cnj_mul()]))), t3167)])
  let t3321 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t3168), t3169), @tactics.disch_tac), t3173), t3307), t3311), t3313), t3314), t3315), t3316), t3317), t3318), t3319), t3320)
  real_complex_endomorphism_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], (SUBSET(IMAGE(f, real), real) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], f(x + y) == f(x) + f(y)) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], f(x * y) == f(x) * f(y))) == (f == ((x : Cart[Real, 2]) => Cx(real_of_num(0))) || f == I || f == cnj)"), t3321))
}

///|
let real_complex_endomorphism_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_COMPLEX_ENDOMORPHISM")

///|
/// `REAL_COMPLEX_ENDOMORPHISM`
pub fn real_complex_endomorphism() -> @kernel.Thm {
  real_complex_endomorphism_c.get()
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
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
  step_150()
  step_151()
  step_152()
  step_153()
  step_154()
  step_155()
  step_156()
  step_157()
  step_158()
  step_159()
  step_160()
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_167()
  step_168()
  step_169()
  step_170()
  step_171()
  step_172()
  step_173()
  step_174()
  step_175()
  step_176()
  step_177()
  step_178()
  step_179()
  step_180()
  step_181()
  step_182()
  step_183()
  step_184()
  step_185()
  step_186()
  step_187()
  step_188()
  step_189()
  step_190()
  step_191()
  step_192()
  step_193()
  step_194()
  step_195()
  step_196()
  step_197()
  step_198()
  step_199()
  step_200()
  step_201()
  step_202()
  step_203()
  step_204()
  step_205()
  step_206()
  step_207()
  step_208()
  step_209()
  step_210()
  step_211()
  step_212()
  step_213()
  step_214()
  step_215()
  step_216()
  step_217()
  step_218()
  step_219()
  step_220()
  step_221()
  step_222()
  step_223()
  step_224()
  step_225()
  step_226()
  step_227()
  step_228()
  step_229()
  step_230()
  step_231()
  step_232()
  step_233()
  step_234()
  step_235()
  step_236()
  step_237()
  step_238()
  step_239()
  step_240()
  step_241()
  step_242()
  step_243()
  step_244()
  step_245()
  step_246()
  step_247()
  step_248()
  step_249()
  step_250()
  step_251()
  step_252()
  step_253()
  step_254()
  step_255()
  step_256()
  step_257()
  step_258()
  step_259()
  step_260()
  step_261()
  step_262()
  step_263()
  step_264()
  step_265()
  step_266()
  step_267()
  step_268()
  step_269()
  step_270()
  step_271()
  step_272()
  step_273()
  step_274()
  step_275()
  step_276()
  step_277()
  step_278()
  step_279()
  step_280()
  step_281()
  step_282()
  step_283()
  step_284()
  step_285()
  step_286()
  step_287()
  step_288()
  step_289()
  step_290()
  step_291()
  step_292()
  step_293()
  step_294()
  step_295()
  step_296()
  step_297()
  step_298()
  step_299()
  step_300()
  step_301()
  step_302()
  step_303()
  step_304()
  step_305()
  step_306()
  step_307()
  step_308()
  step_309()
  step_310()
  step_311()
  step_312()
  step_313()
  step_314()
  step_315()
  step_316()
  step_317()
  step_318()
  step_319()
  step_320()
  step_321()
  step_322()
  step_323()
  step_324()
  step_325()
  step_326()
  step_327()
  step_328()
  step_329()
  step_330()
  step_331()
  step_332()
  step_333()
  step_334()
  step_335()
  step_336()
  step_337()
  step_338()
  step_339()
  step_340()
  step_341()
  step_342()
  step_343()
  step_344()
  step_345()
  step_346()
  step_347()
  step_348()
  step_349()
  step_350()
  step_351()
  step_352()
  step_353()
}
