// Translated from upstream Jordan/misc_defs_and_lemmas.ml; edit this file directly.

///|
/// Jordan/misc_defs_and_lemmas.ml:2
fn step_1() -> Unit raise {
  {
    @tactics_refine.labels_flag().val = true
    ()
  }
}

///|
/// dirac_delta
fn step_2() -> Unit raise {
  dirac_delta_c.set(@pair.new_definition(@term_syntax.parse_term("(dirac_delta : (Num, Num) -> Real)((i : Num)) == ((j : Num) => if i == j { real_of_num(1) } else { real_of_num(0) })")))
}

///|
let dirac_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dirac_delta")

///|
/// `dirac_delta`
pub fn dirac_delta() -> @kernel.Thm {
  dirac_delta_c.get()
}

///|
/// min_num
fn step_3() -> Unit raise {
  min_num_c.set(@pair.new_definition(@term_syntax.parse_term("(min_num : ((Num) -> Bool) -> Num)((X : (Num) -> Bool)) == select((m : Num) => IN(m, X) && (∀ n : Num, IN(n, X) → m <= n))")))
}

///|
let min_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("min_num")

///|
/// `min_num`
pub fn min_num() -> @kernel.Thm {
  min_num_c.get()
}

///|
/// min_least
fn step_4() -> Unit raise {
  let t5 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n' : Num) < (n : Num)) → n <= n'"))]))
  let t6 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Num) == select((m : Num) => (X : (Num) -> Bool)(m) && (∀ n : Num, X(n) → m <= n))"))
  let t4 = @term_syntax.parse_term("(n : Num)")
  let t7 = @tactics.assume_tac(@tactics_ext2.select_thm(@term_syntax.parse_term("(m : Num) => (X : (Num) -> Bool)(m) && (∀ n : Num, X(n) → m <= n)"), t4))
  let t8 = @tactics.disch_then(@tactics.choose_tac)
  let t9 = @meson.asm_meson_tac(@list.List([]))
  let t10 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.ispec(@term_syntax.parse_term("(X : (Num) -> Bool)"), @arith.num_wop()))]))
  let t11 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Num, (X : (Num) -> Bool)(n) && (∀ m : Num, m < n → !X(m))"), fn(x1 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2 = @tactics.mp_tac(x1)
    fn(x3 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2(x3)
    }
  })
  let t12 = @tactics.repeat_tac(@tactics.gen_tac)
  let t13 = @list.List([@simp.rewrite_tac(@list.List([min_num(), @sets.in_()])), t12, @tactics.disch_tac, t11, t10, t9, t8, t7, t6, t5])
  min_least_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ X : (Num) -> Bool, ∀ c : Num, X(c) → X(min_num(X)) && min_num(X) <= c"), t13))
}

///|
let min_least_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("min_least")

///|
/// `min_least`
pub fn min_least() -> @kernel.Thm {
  min_least_c.get()
}

///|
/// max_real
fn step_5() -> Unit raise {
  max_real_c.set(@pair.new_definition(@term_syntax.parse_term("(max_real : (Real, Real) -> Real)((x : Real), (y : Real)) == (if y < x { x } else { y })")))
}

///|
let max_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("max_real")

///|
/// `max_real`
pub fn max_real() -> @kernel.Thm {
  max_real_c.get()
}

///|
/// min_real
fn step_6() -> Unit raise {
  min_real_c.set(@pair.new_definition(@term_syntax.parse_term("(min_real : (Real, Real) -> Real)((x : Real), (y : Real)) == (if x < y { x } else { y })")))
}

///|
let min_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("min_real")

///|
/// `min_real`
pub fn min_real() -> @kernel.Thm {
  min_real_c.get()
}

///|
/// deriv
fn step_7() -> Unit raise {
  deriv_c.set(@pair.new_definition(@term_syntax.parse_term("(deriv : ((Real) -> Real, Real) -> Real)((f : (Real) -> Real), (x : Real)) == select((d : Real) => diffl(f, d, x))")))
}

///|
let deriv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("deriv")

///|
/// `deriv`
pub fn deriv() -> @kernel.Thm {
  deriv_c.get()
}

///|
/// deriv2
fn step_8() -> Unit raise {
  deriv2_c.set(@pair.new_definition(@term_syntax.parse_term("(deriv2 : ((Real) -> Real, Real) -> Real)((f : (Real) -> Real)) == deriv(deriv(f))")))
}

///|
let deriv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("deriv2")

///|
/// `deriv2`
pub fn deriv2() -> @kernel.Thm {
  deriv2_c.get()
}

///|
/// square_le
fn step_9() -> Unit raise {
  let t16 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= real_of_num(0) - real_of_num(0)"))]))
  let t17 = @tactics_ext2.clean_assume_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && real_of_num(0) <= (x : Real) && y + x <= real_of_num(0) → x == real_of_num(0) && y == real_of_num(0)")))
  let t18 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * real_of_num(0) == real_of_num(0)"))]))
  let t19 = @tactics.match_mp_tac(@bool.spec(@term_syntax.parse_term("(y : Real) + (x : Real)"), @real.real_le_lcancel_imp()))
  let t20 = @tactics.disj_cases_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (y : Real) + (x : Real) || y + x <= real_of_num(0)")))
  let t21 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_diffsq())]))
  let t22 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= (b : Real)) == (real_of_num(0) <= b - a)"))]))
  let t14 = @term_syntax.parse_term("real_mul")
  square_le_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y && x * x <= y * y → x <= y"), @list.List([@tactics_ext.disch_all_tac, (x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.undisch_find_tac(t14, x15), t22, t21, @tactics.disch_tac, t20, t19, t18, t17, t16])))
}

///|
let square_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("square_le")

///|
/// `square_le`
pub fn square_le() -> @kernel.Thm {
  square_le_c.get()
}

///|
/// max_num_sequence
fn step_10() -> Unit raise {
  let t31 = @meson.asm_meson_tac(@list.List([]))
  let t32 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (M : Num) → x <= M + (u : Num)")))
  let t33 = @simp.asm_rewrite_tac(@list.List([]))
  let t34 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (n : Num)"))
  let t35 = @tactics.exists_tac(@term_syntax.parse_term("(M : Num) + (t : (Num) -> Num)((n : Num))"))
  let t36 = @tactics.disch_then(@tactics.choose_tac)
  let t37 = @tactics.disch_then(fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_2 = x29
    @simp.rewrite_tac(@list.List([t_2]))
  })
  let t38 = @meson.asm_meson_tac(@list.List([]))
  let t39 = @simp.asm_rewrite_tac(@list.List([]))
  let t40 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("(n : Num) <= (m : Num) && !(m == n) → SUC(n) <= m"))
  let t41 = @simp.asm_rewrite_tac(@list.List([]))
  let t42 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == (n : Num)"))
  let t43 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("∀ m : Num, (n : Num) <= m → (b : (Num) -> Num)(m) == 0"))
  let t44 = @tactics.first_assum(fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_1 = x27
    @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(b : (Num) -> Num)"), t_1))
  })
  let t45 = @simp.rewrite_tac(@list.List([]))
  let t46 = @simp.rewrite_tac(@list.List([]))
  let t47 = @meson.asm_meson_tac(@list.List([]))
  let t48 = @simp.rewrite_tac(@list.List([]))
  let t49 = @analysis.expand_tac("b")
  let t50 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("(b : (Num) -> Num)((n : Num)) == 0 && (∀ m : Num, !(m == n) → b(m) == (t : (Num) -> Num)(m))"))
  let t51 = @tactics.first_assum(fn(x25 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x25
    @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(b : (Num) -> Num)"), t))
  })
  let t52 = @simp.abbrev_tac(@term_syntax.parse_term("(b : (Num) -> Num) == ((m : Num) => if m == (n : Num) { 0 } else { (t : (Num) -> Num)(m) })"))
  let t53 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == 0 → a <= 0"))]))
  let t54 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t55 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 <= (m : Num)"))]))
  let t24 = @term_syntax.parse_term("(n : Num)")
  let t56 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t24)
  let t23 = @term_syntax.parse_term("(t : (Num) -> Num)")
  let t57 = @tactics.spec_tac(@term_syntax.parse_term("(t : (Num) -> Num)"), t23)
  let t58 = @list.List([@tactics.gen_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.left_forall_imp_thm())])), @tactics.gen_tac, t57, t56, @nums.induct_tac, @tactics.gen_tac, t55, @tactics.disch_tac, t54, t53, @tactics_ext.disch_all_tac, t52, t51, t50, t49, @tactics.conj_tac, @class.cond_cases_tac, t48, t47, @tactics.gen_tac, @class.cond_cases_tac, t46, t45, @tactics_ext.disch_all_tac, t44, t43, @tactics.gen_tac, t42, t41, t40, @int.arith_tac, t39, @tactics_ext.disch_all_tac, t38, t37, t36, t35, @tactics.gen_tac, t34, t33, @int.arith_tac, t32, t31])
  max_num_sequence_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ t : (Num) -> Num, (∃ n : Num, ∀ m : Num, n <= m → t(m) == 0) → (∃ M : Num, ∀ i : Num, t(i) <= M)"), t58))
}

///|
let max_num_sequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("max_num_sequence")

///|
/// `max_num_sequence`
pub fn max_num_sequence() -> @kernel.Thm {
  max_num_sequence_c.get()
}

///|
/// REAL_INV_LT
fn step_11() -> Unit raise {
  let t59 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq()]))
  let t60 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t61 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((x : Real)) * (y : Real) == y * inv(x)"))]))
  let t62 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac, t61, t60, t59, @calc_rat.real_arith_tac])
  real_inv_lt_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < x → (inv(x) * y < z) == (y < x * z)"), t62))
}

///|
let real_inv_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_LT")

///|
/// `REAL_INV_LT`
pub fn real_inv_lt() -> @kernel.Thm {
  real_inv_lt_c.get()
}

///|
/// REAL_MUL_NN
fn step_12() -> Unit raise {
  let t70 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(0) → x <= real_of_num(0)"))
  let t71 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(0) → !(real_of_num(0) <= x)")), t70]))
  let t72 = @simp.asm_rewrite_tac(@list.List([]))
  let t66 = @term_syntax.parse_term("-(y : Real)")
  let t67 = @list.List([@term_syntax.parse_term("-(x : Real)"), t66])
  let t73 = @tactics_ext2.use_(0L, (x68 : @kernel.Thm) => @bool.specl(t67, x68))
  let t65 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(0) → x <= real_of_num(0)"))
  let t74 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(0) → !(real_of_num(0) <= x)")), t65]))
  let t75 = @simp.asm_rewrite_tac(@list.List([]))
  let t76 = @tactics.then_tac((x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(1L, x64), @tactics.disch_then(@tactics.disj_cases_tac))
  let t77 = @meson.asm_meson_tac(@list.List([]))
  let t78 = @tactics.disj_cases_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) || x == real_of_num(0) || x < real_of_num(0)")))
  let t79 = @meson.asm_meson_tac(@list.List([@analysis.real_le_mul(), @analysis.real_lt_imp_le()]))
  let t80 = @meson.asm_meson_tac(@list.List([@real_ext.real_prop_nn_lcancel()]))
  let t63 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → !(x <= real_of_num(0))"))
  let t81 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → real_of_num(0) <= x")), t63]))
  let t82 = @list.List([@tactics_ext.disch_all_tac, @tactics_ext.subgoal_tac(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) < x → (real_of_num(0) <= x * y) == (real_of_num(0) <= x && real_of_num(0) <= y || x <= real_of_num(0) && y <= real_of_num(0))")), @tactics_ext.disch_all_tac, t81, @tactics.eq_tac, t80, t79, @tactics.disch_tac, t78, t77, t76, t75, @calc_rat.real_arith_tac, t74, t73, (x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(0L, x69), @tactics_ext2.reduce_tac, t72, t71])
  real_mul_nn_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (real_of_num(0) <= x * y) == (real_of_num(0) <= x && real_of_num(0) <= y || x <= real_of_num(0) && y <= real_of_num(0))"), t82))
}

///|
let real_mul_nn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_NN")

///|
/// `REAL_MUL_NN`
pub fn real_mul_nn() -> @kernel.Thm {
  real_mul_nn_c.get()
}

///|
/// ABS_SQUARE
fn step_13() -> Unit raise {
  let t87 = @simp.asm_rewrite_tac(@list.List([]))
  let t88 = @tactics.match_mp_tac(@real_ext.real_prop_lt_lrmul())
  let t89 = @tactics_ext2.kill(1L)
  let t90 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Real) == abs((t : Real))"))
  let t85 = @term_syntax.parse_term("(t : Real)")
  let t91 = @tactics_ext2.use_(0L, (x86 : @kernel.Thm) => @bool.spec(t85, x86))
  let t92 = @tactics.assume_tac(@real.real_abs_pos())
  let t83 = @equal.gsym(@real.real_pow2_abs())
  let t84 = @simp.rewrite_rule(@list.List([@analysis.pow_2()]))(t83)
  let t93 = @list.List([@tactics_ext.rep_gen_tac, @tactics.conv_tac(@equal.subs_conv(@list.List([@bool.spec(@term_syntax.parse_term("(t : Real)"), t84)]))), t92, t91, t90, t89, @tactics_ext.disch_all_tac, t88, t87])
  abs_square_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ t : Real, ∀ u : Real, abs(t) < u → t * t < u * u"), t93))
}

///|
let abs_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_SQUARE")

///|
/// `ABS_SQUARE`
pub fn abs_square() -> @kernel.Thm {
  abs_square_c.get()
}

///|
/// ABS_SQUARE_LE
fn step_14() -> Unit raise {
  let t98 = @simp.asm_rewrite_tac(@list.List([]))
  let t99 = @tactics.match_mp_tac(@real_ext.real_prop_le_lrmul())
  let t100 = @tactics_ext2.kill(1L)
  let t101 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Real) == abs((t : Real))"))
  let t96 = @term_syntax.parse_term("(t : Real)")
  let t102 = @tactics_ext2.use_(0L, (x97 : @kernel.Thm) => @bool.spec(t96, x97))
  let t103 = @tactics.assume_tac(@real.real_abs_pos())
  let t94 = @equal.gsym(@real.real_pow2_abs())
  let t95 = @simp.rewrite_rule(@list.List([@analysis.pow_2()]))(t94)
  let t104 = @list.List([@tactics_ext.rep_gen_tac, @tactics.conv_tac(@equal.subs_conv(@list.List([@bool.spec(@term_syntax.parse_term("(t : Real)"), t95)]))), t103, t102, t101, t100, @tactics_ext.disch_all_tac, t99, t98])
  abs_square_le_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ t : Real, ∀ u : Real, abs(t) <= u → t * t <= u * u"), t104))
}

///|
let abs_square_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_SQUARE_LE")

///|
/// `ABS_SQUARE_LE`
pub fn abs_square_le() -> @kernel.Thm {
  abs_square_le_c.get()
}

///|
/// twopow_eps
fn step_15() -> Unit raise {
  let t107 = @meson.meson_tac(@list.List([@analysis.pow_2_lt(), @realarith.real_let_trans()]))
  let t108 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t109 = @tactics_ext2.cho(3L)
  let t110 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(R : Real) / (e : Real)"), @analysis.real_arch_simple()))
  let t111 = @tactics.conv_tac(@tactics_ext2.quant_right_conv("n"))
  let t112 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_ldiv_eq())]))
  let t113 = @simp.asm_simp_tac(@list.List([real_inv_lt()]))
  let t114 = @simp.once_rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t105 = @tactics.then_tac(@tactics_ext2.reduce_tac, @int.arith_tac)
  let t115 = @tactics.assume_tac(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, real_of_num(0) < pow(real_of_num(2), n)"), t105))
  let t116 = @list.List([@tactics_ext.disch_all_tac, @simp.rewrite_tac(@list.List([@float.twopow_neg()])), t115, t114, t113, t112, t111, @tactics_ext.disch_all_tac, t110, t109, t108, (x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(3L, x106), t107])
  twopow_eps_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ R : Real, ∀ e : Real, ∃ n : Num, real_of_num(0) < R && real_of_num(0) < e → R * twopow(-int_of_num(n)) < e"), t116))
}

///|
let twopow_eps_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("twopow_eps")

///|
/// `twopow_eps`
pub fn twopow_eps() -> @kernel.Thm {
  twopow_eps_c.get()
}

///|
/// prod_EXISTS
fn step_16() -> Unit raise {
  let t119 = @simp.asm_rewrite_tac(@list.List([]))
  let t120 = @tactics.then_tac(@tactics.conv_tac(@equal.depth_conv(@pair.gen_beta_conv)), t119)
  let t121 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num), (Num) -> Real) -> Real) => ∀ n : Num, ∀ m : Num, GEQ(f((n, m)), (f : (Num) -> Real) => (sm : (Num, Num, (Num) -> Real) -> Real)(n, m, f)))"))
  let t117 = @term_syntax.parse_term("(∀ f : (Num) -> Real, ∀ n : Num, (sm : (Num, Num, (Num) -> Real) -> Real)(n, 0, f) == real_of_num(1)) && (∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, sm(n, SUC(m), f) == sm(n, m, f) * f(n + m))")
  let t118 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t122 = @list.List([@tactics.choose_tac(t118(t117)), t121, t120])
  prod_exists_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∃ prod : ((Num, Num), (Num) -> Real) -> Real, (∀ f : (Num) -> Real, ∀ n : Num, prod((n, 0), f) == real_of_num(1)) && (∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, prod((n, SUC(m)), f) == prod((n, m), f) * f(n + m))"), t122))
}

///|
let prod_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prod_EXISTS")

///|
/// `prod_EXISTS`
pub fn prod_exists() -> @kernel.Thm {
  prod_exists_c.get()
}

///|
/// prod_DEF
fn step_17() -> Unit raise {
  prod_def_c.set(@nums.new_specification(@list.List(["prod"]))(prod_exists()))
}

///|
let prod_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prod_DEF")

///|
/// `prod_DEF`
pub fn prod_def() -> @kernel.Thm {
  prod_def_c.get()
}

///|
/// prod
fn step_18() -> Unit raise {
  let t123 = @simp.rewrite_tac(@list.List([prod_def()]))
  prod_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, prod((n, 0), (f : (Num) -> Real)) == real_of_num(1) && prod((n, SUC(m)), f) == prod((n, m), f) * f(n + m)"), t123))
}

///|
let prod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prod")

///|
/// `prod`
pub fn prod() -> @kernel.Thm {
  prod_c.get()
}

///|
/// PROD_TWO
fn step_19() -> Unit raise {
  let t126 = @simp.asm_rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t125 = @int.arith_rule(@term_syntax.parse_term("0 + (n : Num) == n"))
  let t127 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + SUC((p : Num)) == SUC(n + p)")), prod(), t125]))
  let t124 = @simp.rewrite_tac(@list.List([prod(), @analysis.real_mul_rid(), @arith.mult_clauses(), @arith.add_0()]))
  let t128 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t124), t127, t126])
  prod_two_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ n : Num, ∀ p : Num, prod((0, n), f) * prod((n, p), f) == prod((0, n + p), f)"), t128))
}

///|
let prod_two_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROD_TWO")

///|
/// `PROD_TWO`
pub fn prod_two() -> @kernel.Thm {
  prod_two_c.get()
}

///|
/// ABS_PROD
fn step_20() -> Unit raise {
  let t129 = @simp.asm_rewrite_tac(@list.List([prod(), @analysis.abs_mul()]))
  let t130 = @simp.rewrite_tac(@list.List([prod()]))
  let t131 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t130, @calc_rat.real_arith_tac, t129])
  abs_prod_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, abs(prod((m, n), f)) == prod((m, n), (n : Num) => abs(f(n)))"), t131))
}

///|
let abs_prod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_PROD")

///|
/// `ABS_PROD`
pub fn abs_prod() -> @kernel.Thm {
  abs_prod_c.get()
}

///|
/// PROD_EQ
fn step_21() -> Unit raise {
  let t136 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(r : Num) < (n : Num) + (m : Num) → r < SUC(n) + m"))]))
  let t137 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t138 = @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac)
  let t139 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t140 = @tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac)
  let t141 = @simp.asm_rewrite_tac(@list.List([]))
  let t142 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= m + (n : Num) && m + n < SUC(n) + m"))]))
  let t143 = @tactics.disch_then(fn(x133 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x133
    let t135 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Num) + (n : Num)"), th))
    @tactics.then_tac(@tactics.mp_tac(th), t135)
  })
  let t144 = @simp.rewrite_tac(@list.List([prod()]))
  let t132 = @simp.rewrite_tac(@list.List([prod()]))
  let t145 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @nums.induct_tac), t132), t144, t143, t142, @tactics_ext.disch_all_tac, t141, t140, t139, t138, t137, t136])
  prod_eq_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ r : Num, m <= r && r < n + m → f(r) == g(r)) → prod((m, n), f) == prod((m, n), g)"), t145))
}

///|
let prod_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROD_EQ")

///|
/// `PROD_EQ`
pub fn prod_eq() -> @kernel.Thm {
  prod_eq_c.get()
}

///|
/// PROD_POS
fn step_22() -> Unit raise {
  let t147 = @meson.asm_meson_tac(@list.List([@analysis.real_le_mul()]))
  let t146 = @simp.rewrite_tac(@list.List([prod()]))
  let t148 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), @tactics.gen_tac), @nums.induct_tac), t146), @calc_rat.real_arith_tac, t147])
  prod_pos_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num) -> Real, (∀ n : Num, real_of_num(0) <= f(n)) → (∀ m : Num, ∀ n : Num, real_of_num(0) <= prod((m, n), f))"), t148))
}

///|
let prod_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROD_POS")

///|
/// `PROD_POS`
pub fn prod_pos() -> @kernel.Thm {
  prod_pos_c.get()
}

///|
/// PROD_POS_GEN
fn step_23() -> Unit raise {
  let t152 = @meson.asm_meson_tac(@list.List([@analysis.real_le_mul(), @int.arith_rule(@term_syntax.parse_term("(m : Num) <= m + (n : Num)"))]))
  let t151 = @simp.rewrite_tac(@list.List([prod()]))
  let t149 = @term_syntax.parse_term("(n : Num)")
  let t150 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t149)
  let t153 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t150), @nums.induct_tac), t151), @calc_rat.real_arith_tac, t152])
  prod_pos_gen_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∀ n : Num, m <= n → real_of_num(0) <= f(n)) → real_of_num(0) <= prod((m, n), f)"), t153))
}

///|
let prod_pos_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROD_POS_GEN")

///|
/// `PROD_POS_GEN`
pub fn prod_pos_gen() -> @kernel.Thm {
  prod_pos_gen_c.get()
}

///|
/// PROD_ABS
fn step_24() -> Unit raise {
  let t154 = @simp.rewrite_tac(@list.List([abs_prod(), @calc_rat.real_arith(@term_syntax.parse_term("abs(abs((x : Real))) == abs(x)"))]))
  prod_abs_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, abs(prod((m, n), (m : Num) => abs(f(m)))) == prod((m, n), (m : Num) => abs(f(m)))"), t154))
}

///|
let prod_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROD_ABS")

///|
/// `PROD_ABS`
pub fn prod_abs() -> @kernel.Thm {
  prod_abs_c.get()
}

///|
/// PROD_ZERO
fn step_25() -> Unit raise {
  let t164 = @meson.asm_meson_tac(@list.List([]))
  let t163 = @tactics.then_tac(@tactics.disch_then(fn(x161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x161
    @simp.rewrite_tac(@list.List([th_2]))
  }), @calc_rat.real_arith_tac)
  let t165 = @tactics.match_mp_tac(@tactics_refine.prove(@term_syntax.parse_term("(x : Real) == real_of_num(0) → (y : Real) * x == real_of_num(0)"), t163))
  let t166 = @tactics.pop_assum(fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x159
    @tactics.assume_tac(@drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((p : Num) < (n : Num) + (m : Num)) → p < SUC(n) + m → p == m + n")))(th_1))
  })
  let t167 = @meson.asm_meson_tac(@list.List([]))
  let t168 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t158 = @tactics.then_tac(@tactics.disch_then(fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x156
    @simp.rewrite_tac(@list.List([th]))
  }), @calc_rat.real_arith_tac)
  let t169 = @tactics.match_mp_tac(@tactics_refine.prove(@term_syntax.parse_term("(x : Real) == real_of_num(0) → x * (y : Real) == real_of_num(0)"), t158))
  let t170 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) < (n : Num) + (m : Num)"))
  let t171 = @tactics.disch_then(@tactics.choose_tac)
  let t155 = @simp.rewrite_tac(@list.List([prod()]))
  let t172 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t155), @int.arith_tac, t171, t170, t169, t168, t167, t166, t165, t164])
  prod_zero_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ m : Num, ∀ n : Num, (∃ p : Num, m <= p && p < n + m && f(p) == real_of_num(0)) → prod((m, n), f) == real_of_num(0)"), t172))
}

///|
let prod_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROD_ZERO")

///|
/// `PROD_ZERO`
pub fn prod_zero() -> @kernel.Thm {
  prod_zero_c.get()
}

///|
/// PROD_MUL
fn step_26() -> Unit raise {
  let t174 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t173 = @simp.asm_rewrite_tac(@list.List([prod()]))
  let t175 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.every(@lib.replicate(@tactics.gen_tac, 3)), @nums.induct_tac), t173), @calc_rat.real_arith_tac, t174])
  prod_mul_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ m : Num, ∀ n : Num, prod((m, n), (n : Num) => f(n) * g(n)) == prod((m, n), f) * prod((m, n), g)"), t175))
}

///|
let prod_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROD_MUL")

///|
/// `PROD_MUL`
pub fn prod_mul() -> @kernel.Thm {
  prod_mul_c.get()
}

///|
/// PROD_CMUL
fn step_27() -> Unit raise {
  let t177 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t176 = @simp.asm_rewrite_tac(@list.List([prod(), @analysis.pow()]))
  let t178 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.every(@lib.replicate(@tactics.gen_tac, 3)), @nums.induct_tac), t176), @calc_rat.real_arith_tac, t177])
  prod_cmul_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ c : Real, ∀ m : Num, ∀ n : Num, prod((m, n), (n : Num) => c * f(n)) == pow(c, n) * prod((m, n), f)"), t178))
}

///|
let prod_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROD_CMUL")

///|
/// `PROD_CMUL`
pub fn prod_cmul() -> @kernel.Thm {
  prod_cmul_c.get()
}

///|
/// IN_ELIM_THM'
fn step_28() -> Unit raise {
  in_elim_thm_p_c.set(@sets.in_elim_thm())
}

///|
let in_elim_thm_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_ELIM_THM'")

///|
/// `IN_ELIM_THM'`
pub fn in_elim_thm_p() -> @kernel.Thm {
  in_elim_thm_p_c.get()
}

///|
/// SURJ_IMAGE
fn step_29() -> Unit raise {
  let t179 = @meson.asm_meson_tac(@list.List([]))
  let t180 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t181 = @simp.rewrite_tac(@list.List([@sets.extension()]))
  let t182 = @simp.rewrite_tac(@list.List([@sets.surj(), @sets.image()]))
  let t183 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), t182, @tactics_ext.disch_all_tac, t181, @tactics.gen_tac, t180, t179])
  surj_image_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (A) -> B, ∀ a : (A) -> Bool, ∀ b : (B) -> Bool, SURJ(f, a, b) → b == IMAGE(f, a)"), t183))
}

///|
let surj_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SURJ_IMAGE")

///|
/// `SURJ_IMAGE`
pub fn surj_image() -> @kernel.Thm {
  surj_image_c.get()
}

///|
/// SURJ_FINITE
fn step_30() -> Unit raise {
  let t184 = @list.List([@meson.asm_meson_tac(@list.List([surj_image(), @sets.finite_image()]))])
  surj_finite_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : (A) -> Bool, ∀ b : (B) -> Bool, ∀ f : (A) -> B, FINITE(a) && SURJ(f, a, b) → FINITE(b)"), t184))
}

///|
let surj_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SURJ_FINITE")

///|
/// `SURJ_FINITE`
pub fn surj_finite() -> @kernel.Thm {
  surj_finite_c.get()
}

///|
/// BIJ_INVERSE
fn step_31() -> Unit raise {
  let t192 = @meson.asm_meson_tac(@list.List([]))
  let t193 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.inj()])), @tactics.conj_tac), t192)
  let t194 = @tactics.exists_tac(@term_syntax.parse_term("(u : (B) -> A)"))
  let t195 = @tactics.disch_then(@tactics.choose_tac)
  let t196 = @tactics_ext.h_rewrite_rule(@list.List([(x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@class.skolem_thm(), x188)]), (x189 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("1", x189))
  let t197 = @meson.asm_meson_tac(@list.List([@sets.surj()]))
  let t198 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : B, ∃ u : A, IN(y, (b : (B) -> Bool)) → IN(u, (a : (A) -> Bool)) && (f : (A) -> B)(u) == y"), fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s186 = @tactics.assume_tac(x185)
    fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s186(x187)
    }
  })
  let t199 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, t198, t197, @tactics_refine.label_all_tac, t196, @tactics_refine.label_all_tac, (x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.h_undisch_tac((x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("2", x190), x191), t195, t194, t193])
  bij_inverse_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : (A) -> Bool, ∀ b : (B) -> Bool, ∀ f : (A) -> B, SURJ(f, a, b) → (∃ g : (B) -> A, INJ(g, b, a))"), t199))
}

///|
let bij_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIJ_INVERSE")

///|
/// `BIJ_INVERSE`
pub fn bij_inverse() -> @kernel.Thm {
  bij_inverse_c.get()
}

///|
/// UNIONS_INTERS
fn step_32() -> Unit raise {
  let t206 = @meson.asm_meson_tac(@list.List([@sets.in_diff()]))
  let t207 = @tactics.exists_tac(@term_syntax.parse_term("(x : (A) -> Bool)"))
  let t208 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t209 = @meson.asm_meson_tac(@list.List([@sets.subset_diff(), @sets.subset()]))
  let t204 = @term_syntax.parse_term("(op_q : ((_) -> Bool) -> Bool)")
  let t210 = @simp.rewrite_tac(@list.List([@sets.in_inters(), @sets.in_elim_thm()]))
  let t202 = @term_syntax.parse_term("(IN : (_, (_) -> Bool) -> Bool)")
  let t211 = @tactics.disch_then(@tactics.choose_tac)
  let t212 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_unions()]))
  let t213 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : A)"))
  let t214 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.image(), @sets.in_elim_thm()]))
  let t215 = @meson.asm_meson_tac(@list.List([]))
  let t216 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t217 = @meson.asm_meson_tac(@list.List([]))
  let t218 = @tactics.exists_tac(@term_syntax.parse_term("(t : (A) -> Bool)"))
  let t219 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t220 = @tactics.exists_tac(@term_syntax.parse_term("DIFF((X : (A) -> Bool), (t : (A) -> Bool))"))
  let t200 = @term_syntax.parse_term("(op_q : ((_) -> Bool) -> Bool)")
  let t221 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_inters(), @sets.in_unions(), @class.not_forall_thm()]))
  let t222 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : A)"))
  let t223 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.image(), @sets.in_elim_thm()]))
  let t224 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t225 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), t224, @tactics.conj_tac, t223, t222, t221, @tactics_ext.disch_all_tac, (x201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.undisch_find_then(t200, @tactics.choose_tac, x201), t220, t219, @tactics.conj_tac, t218, t217, t216, t215, t214, t213, t212, t211, (x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.undisch_find_tac(t202, x203), t210, @tactics_ext.disch_all_tac, (x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.undisch_find_then(t204, @tactics.choose_tac, x205), @tactics.conj_tac, t209, t208, t207, t206])
  unions_inters_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ X : (A) -> Bool, ∀ V : ((A) -> Bool) -> Bool, DIFF(X, INTERS(V)) == UNIONS(IMAGE(DIFF(X), V))"), t225))
}

///|
let unions_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIONS_INTERS")

///|
/// `UNIONS_INTERS`
pub fn unions_inters() -> @kernel.Thm {
  unions_inters_c.get()
}

///|
/// INTERS_SUBSET
fn step_33() -> Unit raise {
  let t226 = @meson.meson_tac(@list.List([@sets.in_()]))
  let t227 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_inters()]))
  let t228 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), t227, t226])
  inters_subset_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ X : ((A) -> Bool) -> Bool, ∀ A : (A) -> Bool, IN(A, X) → SUBSET(INTERS(X), A)"), t228))
}

///|
let inters_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERS_SUBSET")

///|
/// `INTERS_SUBSET`
pub fn inters_subset() -> @kernel.Thm {
  inters_subset_c.get()
}

///|
/// sub_union
fn step_34() -> Unit raise {
  let t229 = @simp.asm_rewrite_tac(@list.List([]))
  let t230 = @tactics.exists_tac(@term_syntax.parse_term("(X : (A) -> Bool)"))
  let t231 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t232 = @list.List([@tactics_ext.disch_all_tac, @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @sets.unions()])), t231, @tactics_ext.disch_all_tac, t230, t229])
  sub_union_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ X : (A) -> Bool, ∀ U : ((A) -> Bool) -> Bool, U(X) → SUBSET(X, UNIONS(U))"), t232))
}

///|
let sub_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sub_union")

///|
/// `sub_union`
pub fn sub_union() -> @kernel.Thm {
  sub_union_c.get()
}

///|
/// IMAGE_SURJ
fn step_35() -> Unit raise {
  let t233 = @meson.meson_tac(@list.List([@sets.in_()]))
  let t234 = @list.List([@simp.rewrite_tac(@list.List([@sets.surj(), @sets.image(), @sets.in_elim_thm()])), t233])
  image_surj_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (A) -> B, ∀ a : (A) -> Bool, SURJ(f, a, IMAGE(f, a))"), t234))
}

///|
let image_surj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAGE_SURJ")

///|
/// `IMAGE_SURJ`
pub fn image_surj() -> @kernel.Thm {
  image_surj_c.get()
}

///|
/// SUBSET_PREIMAGE
fn step_36() -> Unit raise {
  let t239 = @meson.meson_tac(@list.List([]))
  let t240 = @tactics.disch_then(fn(x237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x237
    @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(y : B)"), t))
  })
  let t241 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t242 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image()]))
  let t235 = @term_syntax.parse_term("(SUBSET : ((_) -> Bool, (_) -> Bool) -> Bool)")
  let t243 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : B)"))
  let t244 = @simp.rewrite_tac(@list.List([@sets.extension()]))
  let t245 = @meson.meson_tac(@list.List([]))
  let t246 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t247 = @list.List([@tactics_ext.disch_all_tac, @tactics.exists_tac(@term_syntax.parse_term("{(x : A) | IN(x, (X : (A) -> Bool)) && IN((f : (A) -> B)(x), (Y : (B) -> Bool))}")), @tactics.conj_tac, t246, t245, t244, t243, (x236 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.undisch_find_tac(t235, x236), t242, t241, t240, t239])
  subset_preimage_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (A) -> B, ∀ X : (A) -> Bool, ∀ Y : (B) -> Bool, SUBSET(Y, IMAGE(f, X)) → (∃ Z : (A) -> Bool, SUBSET(Z, X) && Y == IMAGE(f, Z))"), t247))
}

///|
let subset_preimage_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_PREIMAGE")

///|
/// `SUBSET_PREIMAGE`
pub fn subset_preimage() -> @kernel.Thm {
  subset_preimage_c.get()
}

///|
/// UNIONS_INTER
fn step_37() -> Unit raise {
  let t251 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t252 = @tactics.exists_tac(@term_syntax.parse_term("INTER((A : (A) -> Bool), (u : (A) -> Bool))"))
  let t249 = @term_syntax.parse_term("(op_q : ((_) -> Bool) -> Bool)")
  let t253 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t254 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t255 = @simp.rewrite_tac(@list.List([@sets.in_inter()]))
  let t256 = @meson.asm_meson_tac(@list.List([@sets.in_inter()]))
  let t257 = @tactics.disch_then(@tactics.choose_tac)
  let t258 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t259 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t260 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.unions(), @sets.in_image()]))
  let t261 = @sets.set_tac(@list.List([]))
  let t262 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t263 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.unions(), @sets.in_elim_thm()]))
  let t248 = @sets.set_tac(@list.List([]))
  let t264 = @tactics.match_mp_tac(@tactics_refine.prove(@term_syntax.parse_term("SUBSET((C : (A) -> Bool), (B : (A) -> Bool)) && SUBSET(C, (A : (A) -> Bool)) && SUBSET(INTER(A, B), C) → INTER(B, A) == C"), t248))
  let t265 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), t264, @tactics.conj_tac, t263, t262, t261, t260, @tactics.conj_tac, t259, t258, t257, t256, t255, t254, t253, @tactics_ext.disch_all_tac, (x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.undisch_find_then(t249, @tactics.choose_tac, x250), t252, t251])
  unions_inter_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ U : ((A) -> Bool) -> Bool, ∀ A : (A) -> Bool, INTER(UNIONS(U), A) == UNIONS(IMAGE(INTER(A), U))"), t265))
}

///|
let unions_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIONS_INTER")

///|
/// `UNIONS_INTER`
pub fn unions_inter() -> @kernel.Thm {
  unions_inter_c.get()
}

///|
/// UNIONS_SUBSET
fn step_38() -> Unit raise {
  let t266 = @sets.set_tac(@list.List([]))
  let t267 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), t266])
  unions_subset_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ U : ((A) -> Bool) -> Bool, ∀ X : (A) -> Bool, (∀ A : (A) -> Bool, IN(A, U) → SUBSET(A, X)) → SUBSET(UNIONS(U), X)"), t267))
}

///|
let unions_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIONS_SUBSET")

///|
/// `UNIONS_SUBSET`
pub fn unions_subset() -> @kernel.Thm {
  unions_subset_c.get()
}

///|
/// SUBSET_INTER
fn step_39() -> Unit raise {
  let t268 = @meson.meson_tac(@list.List([@sets.in_()]))
  let t269 = @list.List([@simp.rewrite_tac(@list.List([@sets.subset(), @sets.inter(), @sets.in_elim_thm()])), t268])
  subset_inter_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ X : (A) -> Bool, ∀ A : (A) -> Bool, ∀ B : (A) -> Bool, SUBSET(X, INTER(A, B)) == (SUBSET(X, A) && SUBSET(X, B))"), t269))
}

///|
let subset_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_INTER")

///|
/// `SUBSET_INTER`
pub fn subset_inter() -> @kernel.Thm {
  subset_inter_c.get()
}

///|
/// EMPTY_EXISTS
fn step_40() -> Unit raise {
  let t270 = @meson.meson_tac(@list.List([]))
  let t271 = @simp.rewrite_tac(@list.List([@sets.in_(), @sets.empty()]))
  let t272 = @list.List([@simp.rewrite_tac(@list.List([@sets.extension()])), t271, t270])
  empty_exists_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ X : (A) -> Bool, !(X == {}) == (∃ u : A, IN(u, X))"), t272))
}

///|
let empty_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EMPTY_EXISTS")

///|
/// `EMPTY_EXISTS`
pub fn empty_exists() -> @kernel.Thm {
  empty_exists_c.get()
}

///|
/// UNIONS_UNIONS
fn step_41() -> Unit raise {
  let t273 = @meson.meson_tac(@list.List([@sets.in_()]))
  let t274 = @list.List([@simp.rewrite_tac(@list.List([@sets.subset(), @sets.unions(), @sets.in_elim_thm()])), t273])
  unions_unions_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : ((A) -> Bool) -> Bool, ∀ B : ((A) -> Bool) -> Bool, SUBSET(A, B) → SUBSET(UNIONS(A), UNIONS(B))"), t274))
}

///|
let unions_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIONS_UNIONS")

///|
/// `UNIONS_UNIONS`
pub fn unions_unions() -> @kernel.Thm {
  unions_unions_c.get()
}

///|
/// UNIONS_IMAGE_UNIONS
fn step_42() -> Unit raise {
  let t289 = @simp.asm_rewrite_tac(@list.List([]))
  let t290 = @simp.asm_rewrite_tac(@list.List([]))
  let t291 = @tactics.exists_tac(@term_syntax.parse_term("(x' : ((A) -> Bool) -> Bool)"))
  let t292 = @tactics.exists_tac(@term_syntax.parse_term("(t' : (A) -> Bool)"))
  let t293 = @tactics.disch_then(@tactics.choose_tac)
  let t294 = @simp.rewrite_tac(@list.List([@sets.in_unions()]))
  let t295 = @tactics.first_assum(fn(x287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x287
    @simp.rewrite_tac(@list.List([t]))
  })
  let t296 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : A), (t : (A) -> Bool))"))
  let t297 = @tactics.disch_then(@tactics.choose_tac)
  let t298 = @tactics.first_assum(fn(x284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s285 = @tactics.mp_tac(x284)
    fn(x286 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s285(x286)
    }
  })
  let t299 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t300 = @tactics.first_assum(fn(x281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s282 = @tactics.mp_tac(x281)
    fn(x283 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s282(x283)
    }
  })
  let t301 = @tactics.disch_then(@tactics.choose_tac)
  let t302 = @meson.asm_meson_tac(@list.List([]))
  let t303 = @simp.asm_rewrite_tac(@list.List([]))
  let t304 = @tactics.exists_tac(@term_syntax.parse_term("(t' : ((A) -> Bool) -> Bool)"))
  let t305 = @simp.rewrite_tac(@list.List([@sets.in_unions(), @sets.in_image()]))
  let t306 = @tactics.exists_tac(@term_syntax.parse_term("UNIONS((t' : ((A) -> Bool) -> Bool))"))
  let t307 = @tactics.disch_then(@tactics.choose_tac)
  let t308 = @tactics.first_assum(fn(x278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s279 = @tactics.mp_tac(x278)
    fn(x280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s279(x280)
    }
  })
  let t309 = @tactics.disch_then(@tactics.choose_then(fn(x275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s276 = @tactics.mp_tac(x275)
    fn(x277 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s276(x277)
    }
  }))
  let t310 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_unions()]))
  let t311 = @list.List([@tactics.gen_tac, @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_unions()])), @tactics.gen_tac, t310, @tactics.eq_tac, t309, @tactics_ext.disch_all_tac, t308, t307, t306, t305, @tactics.conj_tac, t304, t303, t302, t301, t300, t299, @tactics_ext.disch_all_tac, t298, t297, t296, t295, t294, t293, t292, @tactics.conj_tac, t291, t290, t289])
  unions_image_unions_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ X : (((A) -> Bool) -> Bool) -> Bool, UNIONS(UNIONS(X)) == UNIONS(IMAGE(UNIONS, X))"), t311))
}

///|
let unions_image_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIONS_IMAGE_UNIONS")

///|
/// `UNIONS_IMAGE_UNIONS`
pub fn unions_image_unions() -> @kernel.Thm {
  unions_image_unions_c.get()
}

///|
/// INTERS_SUBSET2
fn step_43() -> Unit raise {
  let t312 = @meson.meson_tac(@list.List([]))
  let t313 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t314 = @list.List([@simp.rewrite_tac(@list.List([@sets.subset(), @sets.inters(), in_elim_thm_p()])), t313, t312])
  inters_subset2_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ X : (A) -> Bool, ∀ A : ((A) -> Bool) -> Bool, (∃ x : (A) -> Bool, A(x) && SUBSET(x, X)) → SUBSET(INTERS(A), X)"), t314))
}

///|
let inters_subset2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERS_SUBSET2")

///|
/// `INTERS_SUBSET2`
pub fn inters_subset2() -> @kernel.Thm {
  inters_subset2_c.get()
}

///|
/// INTERS_EMPTY
fn step_44() -> Unit raise {
  let t315 = @list.List([@sets.set_tac(@list.List([]))])
  inters_empty_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("(INTERS : (((A) -> Bool) -> Bool, A) -> Bool)(({} : ((A) -> Bool) -> Bool)) == (UNIV : (A) -> Bool)"), t315))
}

///|
let inters_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERS_EMPTY")

///|
/// `INTERS_EMPTY`
pub fn inters_empty() -> @kernel.Thm {
  inters_empty_c.get()
}

///|
/// preimage
fn step_45() -> Unit raise {
  preimage_c.set(@pair.new_definition(@term_syntax.parse_term("(preimage : ((A) -> Bool, (A) -> B, (B) -> Bool, A) -> Bool)((dom : (A) -> Bool), (f : (A) -> B), (Z : (B) -> Bool)) == {(x : A) | IN(x, dom) && IN(f(x), Z)}")))
}

///|
let preimage_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("preimage")

///|
/// `preimage`
pub fn preimage() -> @kernel.Thm {
  preimage_c.get()
}

///|
/// in_preimage
fn step_46() -> Unit raise {
  let t316 = @simp.rewrite_tac(@list.List([in_elim_thm_p()]))
  let t317 = @list.List([@simp.rewrite_tac(@list.List([preimage()])), t316])
  in_preimage_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (A) -> B, ∀ x : A, ∀ Z : (B) -> Bool, ∀ dom : (A) -> Bool, IN(x, preimage(dom, f, Z)) == (IN(x, dom) && IN(f(x), Z))"), t317))
}

///|
let in_preimage_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("in_preimage")

///|
/// `in_preimage`
pub fn in_preimage() -> @kernel.Thm {
  in_preimage_c.get()
}

///|
/// supp
fn step_47() -> Unit raise {
  supp_c.set(@pair.new_definition(@term_syntax.parse_term("(supp : ((A) -> B, A) -> Bool)((f : (A) -> B)) == ((x : A) => !(f(x) == CHOICE(UNIV)))")))
}

///|
let supp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("supp")

///|
/// `supp`
pub fn supp() -> @kernel.Thm {
  supp_c.get()
}

///|
/// func
fn step_48() -> Unit raise {
  func_c.set(@pair.new_definition(@term_syntax.parse_term("(func : ((A) -> Bool, (B) -> Bool, (A) -> B) -> Bool)((a : (A) -> Bool), (b : (B) -> Bool)) == ((f : (A) -> B) => (∀ x : A, IN(x, a) → IN(f(x), b)) && SUBSET(supp(f), a))")))
}

///|
let func_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("func")

///|
/// `func`
pub fn func() -> @kernel.Thm {
  func_c.get()
}

///|
/// reflexive
fn step_49() -> Unit raise {
  reflexive_c.set(@pair.new_definition(@term_syntax.parse_term("(reflexive : ((A, A) -> Bool) -> Bool)((f : (A, A) -> Bool)) == (∀ x : A, f(x, x))")))
}

///|
let reflexive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reflexive")

///|
/// `reflexive`
pub fn reflexive() -> @kernel.Thm {
  reflexive_c.get()
}

///|
/// symmetric
fn step_50() -> Unit raise {
  symmetric_c.set(@pair.new_definition(@term_syntax.parse_term("(symmetric : ((A, A) -> Bool) -> Bool)((f : (A, A) -> Bool)) == (∀ x : A, ∀ y : A, f(x, y) → f(y, x))")))
}

///|
let symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("symmetric")

///|
/// `symmetric`
pub fn symmetric() -> @kernel.Thm {
  symmetric_c.get()
}

///|
/// transitive
fn step_51() -> Unit raise {
  transitive_c.set(@pair.new_definition(@term_syntax.parse_term("(transitive : ((A, A) -> Bool) -> Bool)((f : (A, A) -> Bool)) == (∀ x : A, ∀ y : A, ∀ z : A, f(x, y) && f(y, z) → f(x, z))")))
}

///|
let transitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("transitive")

///|
/// `transitive`
pub fn transitive() -> @kernel.Thm {
  transitive_c.get()
}

///|
/// equivalence_relation
fn step_52() -> Unit raise {
  equivalence_relation_c.set(@pair.new_definition(@term_syntax.parse_term("(equivalence_relation : ((A, A) -> Bool) -> Bool)((f : (A, A) -> Bool)) == (reflexive(f) && symmetric(f) && transitive(f))")))
}

///|
let equivalence_relation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("equivalence_relation")

///|
/// `equivalence_relation`
pub fn equivalence_relation() -> @kernel.Thm {
  equivalence_relation_c.get()
}

///|
/// partition_DEF
fn step_53() -> Unit raise {
  partition_def_c.set(@pair.new_definition(@term_syntax.parse_term("(partition : ((A) -> Bool, ((A) -> Bool) -> Bool) -> Bool)((A : (A) -> Bool), (SA : ((A) -> Bool) -> Bool)) == (UNIONS(SA) == A && (∀ a : (A) -> Bool, ∀ b : (A) -> Bool, IN(a, SA) && IN(b, SA) && !(a == b) → {} == INTER(a, b)))")))
}

///|
let partition_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("partition_DEF")

///|
/// `partition_DEF`
pub fn partition_def() -> @kernel.Thm {
  partition_def_c.get()
}

///|
/// DIFF_DIFF2
fn step_54() -> Unit raise {
  let t318 = @list.List([@sets.set_tac(@list.List([]))])
  diff_diff2_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ X : (A) -> Bool, ∀ A : (A) -> Bool, SUBSET(A, X) → DIFF(X, DIFF(X, A)) == A"), t318))
}

///|
let diff_diff2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIFF_DIFF2")

///|
/// `DIFF_DIFF2`
pub fn diff_diff2() -> @kernel.Thm {
  diff_diff2_c.get()
}

///|
/// GSPEC_THM
fn step_55() -> Unit raise {
  let t319 = @list.List([@meson.meson_tac(@list.List([]))])
  gspec_thm_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ x : A, (∃ y : A, P(y) && x == y) == P(x)"), t319))
}

///|
let gspec_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GSPEC_THM")

///|
/// `GSPEC_THM`
pub fn gspec_thm() -> @kernel.Thm {
  gspec_thm_c.get()
}

///|
/// CARD_GE_REFL
fn step_56() -> Unit raise {
  let t321 = @meson.meson_tac(@list.List([]))
  let t320 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => x"))
  let t322 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@sets.ge_c_v1()]))), t320), t321)
  card_ge_refl_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, op_gt_eq_us_c(s, s)"), t322))
}

///|
let card_ge_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_GE_REFL")

///|
/// `CARD_GE_REFL`
pub fn card_ge_refl() -> @kernel.Thm {
  card_ge_refl_c.get()
}

///|
/// FINITE_HAS_SIZE_LEMMA
fn step_57() -> Unit raise {
  let t354 = @simp.asm_rewrite_tac(@list.List([@arith.lt_refl()]))
  let t353 = @tactics.undisch_tac(@term_syntax.parse_term("(n : Num) < (N : Num)"))
  let t352 = @simp.asm_rewrite_tac(@list.List([]))
  let t351 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t350 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t355 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x347 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s348 = @tactics.mp_tac(x347)
    fn(x349 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s348(x349)
    }
  })), t350), @tactics.strip_tac), t351), t352), t353), @class.cond_cases_tac), t354), @int.arith_tac)
  let t346 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t356 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(N : Num)")), t346), @int.arith_tac), t355])
  let t345 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s340 = @tactics.subst_all_tac(x339)
    fn(x341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s340(x341)
    }
  }, @tactics.ante_res_then(fn(x342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s343 = @tactics.mp_tac(x342)
    fn(x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s343(x344)
    }
  })))
  let t338 = @simp.pure_rewrite_tac(@list.List([@sets.in_insert()]))
  let t337 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t336 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => if n == (N : Num) { (x : A) } else { (f : (Num) -> A)(n) }"))
  let t333 = @term_syntax.parse_term("(f : (Num) -> A)")
  let t335 = @tactics.disch_then((x334 : @kernel.Thm) => @tactics.x_choose_tac(t333, x334))
  let t332 = @simp.pure_rewrite_tac(@list.List([@sets.ge_c_v1()]))
  let t331 = @tactics.pop_assum(fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s329 = @tactics.mp_tac(x328)
    fn(x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s329(x330)
    }
  })
  let t327 = @tactics.exists_tac(@term_syntax.parse_term("SUC((N : Num))"))
  let t324 = @term_syntax.parse_term("(N : Num)")
  let t326 = @tactics.disch_then((x325 : @kernel.Thm) => @tactics.x_choose_tac(t324, x325))
  let t357 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t326), t327), t331), t332), t335), t336), t337), t338), t345), t356)
  let t323 = @simp.rewrite_tac(@list.List([@sets.not_in_empty(), @sets.ge_c_v1(), @sets.in_elim_thm()]))
  let t358 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t323), t357])
  let t359 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_induct()), @tactics.conj_tac), t358)
  finite_has_size_lemma_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, FINITE(s) → (∃ n : Num, op_gt_eq_us_c({(x : Num) | x < n}, s))"), t359))
}

///|
let finite_has_size_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_HAS_SIZE_LEMMA")

///|
/// `FINITE_HAS_SIZE_LEMMA`
pub fn finite_has_size_lemma() -> @kernel.Thm {
  finite_has_size_lemma_c.get()
}

///|
/// NUM_COUNTABLE
fn step_58() -> Unit raise {
  let t360 = @list.List([@simp.rewrite_tac(@list.List([@sets.countable(), card_ge_refl()]))])
  num_countable_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("(COUNTABLE : ((Num) -> Bool) -> Bool)((UNIV : (Num) -> Bool))"), t360))
}

///|
let num_countable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_COUNTABLE")

///|
/// `NUM_COUNTABLE`
pub fn num_countable() -> @kernel.Thm {
  num_countable_c.get()
}

///|
/// NUM2_COUNTABLE
fn step_59() -> Unit raise {
  let t396 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((a : Num)) == a + 1"))]))
  let t397 = @tactics.disch_then(fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_4 = x394
    @simp.rewrite_tac(@list.List([t_4]))
  })
  let t398 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t399 = @tactics.disch_then(fn(x392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_3 = x392
    @simp.rewrite_tac(@list.List([@equal.gsym(t_3)]))
  })
  let t388 = @term_syntax.parse_term("(n : Num)")
  let t400 = @tactics_ext2.use_(0L, (x389 : @kernel.Thm) => @bool.spec(t388, x389))
  let t401 = @tactics_ext2.and_(0L)
  let t402 = @tactics.exists_tac(@term_syntax.parse_term("SUC((n : Num))"))
  let t386 = @term_syntax.parse_term("(n : Num)")
  let t403 = @tactics.disch_then((x387 : @kernel.Thm) => @tactics.x_choose_tac(t386, x387))
  let t404 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((a : Num)) + (b : Num) == a + SUC(b)"))]))
  let t405 = @simp.asm_rewrite_tac(@list.List([]))
  let t383 = @term_syntax.parse_term("SUC((b : Num))")
  let t406 = @tactics_ext2.use_(2L, (x384 : @kernel.Thm) => @bool.spec(t383, x384))
  let t407 = @simp.abbrev_tac(@term_syntax.parse_term("(t' : Num) == SUC((t : Num))"))
  let t408 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((t : Num)) == t + 1"))]))
  let t409 = @simp.asm_rewrite_tac(@list.List([]))
  let t410 = @tactics_ext2.kill(0L)
  let t411 = @analysis.expand_tac("b")
  let t412 = @tactics.exists_tac(@term_syntax.parse_term("SUC((n : Num))"))
  let t413 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t414 = @tactics.disch_then(fn(x381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_2 = x381
    @simp.rewrite_tac(@list.List([@equal.gsym(t_2)]))
  })
  let t377 = @term_syntax.parse_term("(n : Num)")
  let t415 = @tactics_ext2.use_(0L, (x378 : @kernel.Thm) => @bool.spec(t377, x378))
  let t416 = @tactics_ext2.and_(0L)
  let t375 = @term_syntax.parse_term("(n : Num)")
  let t417 = @tactics.disch_then((x376 : @kernel.Thm) => @tactics.x_choose_tac(t375, x376))
  let t418 = @tactics.then_tac((x374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(1L, x374), @tactics_ext2.reduce_tac)
  let t371 = @term_syntax.parse_term("(t : Num)")
  let t372 = @list.List([@term_syntax.parse_term("0"), t371])
  let t419 = @tactics_ext2.use_(1L, (x373 : @kernel.Thm) => @bool.specl(t372, x373))
  let t420 = @tactics.conv_tac(@tactics_ext2.quant_left_conv("a"))
  let t421 = @simp.asm_rewrite_tac(@list.List([]))
  let t422 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t423 = @tactics.disch_then(fn(x369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_1 = x369
    @simp.rewrite_tac(@list.List([t_1]))
  })
  let t424 = @tactics.conv_tac(@tactics_ext2.quant_left_conv("t"))
  let t425 = @tactics.conv_tac(@tactics_ext2.quant_left_conv("t"))
  let t426 = @tactics.conv_tac(@tactics_ext2.quant_left_conv("t"))
  let t368 = @term_syntax.parse_term("(b : Num)")
  let t427 = @tactics.spec_tac(@term_syntax.parse_term("(y' : Num)"), t368)
  let t367 = @term_syntax.parse_term("(a : Num)")
  let t428 = @tactics.spec_tac(@term_syntax.parse_term("(x : Num)"), t367)
  let t429 = @meson.meson_tac(@list.List([]))
  let t430 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("∃ t : Num, t == (x : Num) + (y' : Num)"))
  let t431 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t432 = @tactics.disch_then(fn(x365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x365
    @simp.rewrite_tac(@list.List([t]))
  })
  let t433 = @tactics.repeat_tac(@tactics.disch_then(@tactics.choose_then(fn(x362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s363 = @tactics.mp_tac(x362)
    fn(x364 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s363(x364)
    }
  })))
  let t434 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : (Num, Num))"))
  let t435 = @tactics.exists_tac(@parser.parse_term("fn:num -> (num#num)"))
  let t436 = @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c_v1(), in_elim_thm_p()]))
  let t361 = @term_syntax.parse_term("GABS((f : ((Num, Num), Num) -> (Num, Num)) => ∀ a : Num, ∀ b : Num, GEQ(f((a, b)), (n : Num) => if b == 0 { (0, a + (b + 1)) } else { (a + 1, b - 1) }))")
  let t437 = @list.List([@tactics.choose_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(0, 0)"), t361]), @nums.num_recursion())), t436, @tactics_ext2.name_conflict_tac, t435, t434, t433, t432, t431, t430, t429, t428, t427, t426, t425, t424, @nums.induct_tac, @tactics_ext2.reduce_tac, @tactics_ext.rep_gen_tac, t423, t422, t421, t420, @nums.induct_tac, @tactics_ext2.reduce_tac, @tactics.gen_tac, t419, t418, t417, t416, t415, (x379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(0L, x379), (x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(1L, x380), t414, t413, @tactics.beta_tac, @tactics_ext2.reduce_tac, @tactics_ext.disch_all_tac, t412, t411, t410, t409, t408, @tactics.gen_tac, t407, t406, @tactics.disch_tac, (x385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x385), t405, t404, t403, t402, t401, t400, (x390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(0L, x390), (x391 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x391), t399, t398, @tactics.beta_tac, @tactics_ext2.reduce_tac, t397, t396])
  num2_countable_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("COUNTABLE({((x : Num), (y : Num)) | true})"), t437))
}

///|
let num2_countable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM2_COUNTABLE")

///|
/// `NUM2_COUNTABLE`
pub fn num2_countable() -> @kernel.Thm {
  num2_countable_c.get()
}

///|
/// COUNTABLE_UNIONS
fn step_60() -> Unit raise {
  let t475 = @simp.asm_rewrite_tac(@list.List([]))
  let t476 = @tactics.exists_tac(@term_syntax.parse_term("(x' : Num)"))
  let t477 = @tactics.disch_then(@tactics.choose_then(fn(x474 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x471 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s472 = @tactics.assume_tac(x471)
      fn(x473 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s472(x473)
      }
    })(@equal.gsym(x474))
  }))
  let t478 = @simp.asm_rewrite_tac(@list.List([]))
  let t479 = @meson.meson_tac(@list.List([]))
  let t480 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("∃ x' : Num, ∃ y' : Num, ((u : Num), (v : Num)) == (x', y')"))
  let t468 = @term_syntax.parse_term("((u : Num), (v : Num))")
  let t481 = @tactics_ext2.use_(2L, (x469 : @kernel.Thm) => @bool.spec(t468, x469))
  let t482 = @tactics.repeat_tac(@tactics.disch_then(@tactics.choose_then(fn(x465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s466 = @tactics.mp_tac(x465)
    fn(x467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s466(x467)
    }
  })))
  let t483 = @tactics.then_tac((x464 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(3L, x464), @simp.asm_rewrite_tac(@list.List([])))
  let t462 = @term_syntax.parse_term("(y : A)")
  let t484 = @tactics_ext2.use_(3L, (x463 : @kernel.Thm) => @bool.spec(t462, x463))
  let t460 = @term_syntax.parse_term("(t : (A) -> Bool)")
  let t485 = @tactics_ext2.use_(3L, (x461 : @kernel.Thm) => @bool.spec(t460, x461))
  let t486 = @tactics.disch_then(@tactics.choose_then(fn(x457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s458 = @tactics.mp_tac(x457)
    fn(x459 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s458(x459)
    }
  }))
  let t487 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) => (g : ((A) -> Bool, Num) -> A)((f : (Num, A) -> Bool)(FST((h : (Num) -> (Num, Num))(p))), SND(h(p)))"))
  let t488 = @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c_v1(), in_elim_thm_p(), @sets.in_univ(), @sets.in_unions()]))
  let t455 = @term_syntax.parse_term("(h : (Num) -> (Num, Num))")
  let t489 = @tactics.then_tac((x454 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x454), @tactics.disch_then((x456 : @kernel.Thm) => @tactics.x_choose_tac(t455, x456)))
  let t490 = @tactics_ext2.use_(2L, (x453 : @kernel.Thm) => @equal.conv_rule(@tactics_ext2.name_conflict_conv, x453))
  let t491 = @tactics_ext2.use_(2L, @simp.rewrite_rule(@list.List([@sets.countable(), @sets.ge_c_v1(), in_elim_thm_p(), @sets.in_univ()])))
  let t492 = @tactics.assume_tac(num2_countable())
  let t493 = @simp.asm_simp_tac(@list.List([]))
  let t494 = @tactics.exists_tac(@term_syntax.parse_term("(x : ((A) -> Bool) -> Num)((a : (A) -> Bool))"))
  let t451 = @term_syntax.parse_term("(a : (A) -> Bool)")
  let t495 = @tactics_ext2.use_(0L, (x452 : @kernel.Thm) => @bool.spec(t451, x452))
  let t449 = @term_syntax.parse_term("(a : (A) -> Bool)")
  let t496 = @tactics_ext2.use_(1L, (x450 : @kernel.Thm) => @bool.spec(t449, x450))
  let t497 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("∀ a : (A) -> Bool, ∀ y : A, IN(a, (A : ((A) -> Bool) -> Bool)) && IN(y, a) → (∃ u : Num, ∃ v : Num, a == (f : (Num, A) -> Bool)(u) && y == (g : ((A) -> Bool, Num) -> A)(a, v))"))
  let t447 = @term_syntax.parse_term("(g : ((A) -> Bool, Num) -> A)")
  let t498 = @tactics.disch_then((x448 : @kernel.Thm) => @tactics.x_choose_tac(t447, x448))
  let t444 = @tactics_ext2.quant_left_conv("f")
  let t499 = @tactics_ext2.use_(1L, (x445 : @kernel.Thm) => @equal.conv_rule(t444, x445))
  let t442 = @tactics_ext2.quant_left_conv("f")
  let t500 = @tactics_ext2.use_(1L, (x443 : @kernel.Thm) => @equal.conv_rule(t442, x443))
  let t501 = @tactics_ext2.use_(1L, @simp.rewrite_rule(@list.List([@sets.countable(), @sets.ge_c_v1(), @sets.in_univ()])))
  let t502 = @tactics_ext2.cho(0L)
  let t440 = @tactics_ext2.quant_left_conv("x")
  let t503 = @tactics_ext2.use_(0L, (x441 : @kernel.Thm) => @equal.conv_rule(t440, x441))
  let t438 = @tactics_ext2.quant_left_conv("x")
  let t504 = @tactics_ext2.use_(0L, (x439 : @kernel.Thm) => @equal.conv_rule(t438, x439))
  let t505 = @tactics_ext2.cho(0L)
  let t506 = @list.List([@tactics.gen_tac, @tactics_ext.disch_all_tac, @tactics_ext2.use_(0L, @simp.rewrite_rule(@list.List([@sets.countable(), @sets.ge_c_v1(), @sets.in_univ()]))), t505, t504, t503, t502, t501, t500, t499, (x446 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(1L, x446), t498, t497, @tactics_ext.rep_gen_tac, @tactics_ext.disch_all_tac, t496, t495, t494, t493, t492, t491, t490, t489, @tactics.disch_tac, t488, t487, @tactics.beta_tac, @tactics.gen_tac, t486, @tactics_ext.disch_all_tac, t485, t484, t483, t482, @tactics_ext.disch_all_tac, t481, t480, t479, @tactics.disch_tac, (x470 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x470), t478, t477, t476, t475])
  countable_unions_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : ((A) -> Bool) -> Bool, COUNTABLE(A) && (∀ a : (A) -> Bool, IN(a, A) → COUNTABLE(a)) → COUNTABLE(UNIONS(A))"), t506))
}

///|
let countable_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_UNIONS")

///|
/// `COUNTABLE_UNIONS`
pub fn countable_unions() -> @kernel.Thm {
  countable_unions_c.get()
}

///|
/// COUNTABLE_IMAGE
fn step_61() -> Unit raise {
  let t514 = @meson.asm_meson_tac(@list.List([]))
  let t515 = @tactics.then_tac(@tactics.then_tac((x513 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(0L, x513), @simp.asm_rewrite_tac(@list.List([]))), @tactics.disch_tac)
  let t511 = @term_syntax.parse_term("(x' : A)")
  let t516 = @tactics_ext2.use_(0L, (x512 : @kernel.Thm) => @bool.spec(t511, x512))
  let t517 = @tactics.disch_then(@tactics.choose_tac)
  let t518 = @simp.asm_rewrite_tac(@list.List([]))
  let t508 = @term_syntax.parse_term("(y : B)")
  let t519 = @tactics_ext2.use_(1L, (x509 : @kernel.Thm) => @bool.spec(t508, x509))
  let t520 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t521 = @tactics.exists_tac(@term_syntax.parse_term("o((f' : (A) -> B), (f : (Num) -> A))"))
  let t522 = @tactics_ext2.use_(1L, (x507 : @kernel.Thm) => @equal.conv_rule(@tactics_ext2.name_conflict_conv, x507))
  let t523 = @tactics_ext2.use_(1L, @simp.rewrite_rule(@list.List([in_elim_thm_p()])))
  let t524 = @tactics_ext2.cho(1L)
  let t525 = @tactics_ext2.use_(1L, @simp.rewrite_rule(@list.List([@sets.image(), in_elim_thm_p()])))
  let t526 = @tactics_ext2.cho(0L)
  let t527 = @list.List([@simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c_v1(), @sets.in_univ(), in_elim_thm_p(), @sets.subset()])), @tactics_ext.disch_all_tac, t526, t525, t524, t523, t522, t521, t520, @tactics_ext.disch_all_tac, t519, (x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(1L, x510), t518, t517, t516, t515, t514])
  countable_image_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : (A) -> Bool, ∀ B : (B) -> Bool, COUNTABLE(A) && (∃ f : (A) -> B, SUBSET(B, IMAGE(f, A))) → COUNTABLE(B)"), t527))
}

///|
let countable_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_IMAGE")

///|
/// `COUNTABLE_IMAGE`
pub fn countable_image() -> @kernel.Thm {
  countable_image_c.get()
}

///|
/// COUNTABLE_CARD
fn step_62() -> Unit raise {
  let t528 = @simp.asm_rewrite_tac(@list.List([]))
  let t529 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t530 = @tactics_ext2.cho(1L)
  let t531 = @tactics_ext2.use_(1L, @simp.rewrite_rule(@list.List([@sets.ge_c_v1()])))
  let t532 = @simp.rewrite_tac(@list.List([@sets.image(), @sets.subset(), in_elim_thm_p()]))
  let t533 = @simp.asm_rewrite_tac(@list.List([]))
  let t534 = @tactics.exists_tac(@term_syntax.parse_term("(A : (A) -> Bool)"))
  let t535 = @list.List([@tactics_ext.disch_all_tac, @tactics.match_mp_tac(countable_image()), t534, t533, t532, t531, t530, t529, t528])
  countable_card_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : (A) -> Bool, ∀ B : (B) -> Bool, COUNTABLE(A) && op_gt_eq_us_c(A, B) → COUNTABLE(B)"), t535))
}

///|
let countable_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_CARD")

///|
/// `COUNTABLE_CARD`
pub fn countable_card() -> @kernel.Thm {
  countable_card_c.get()
}

///|
/// COUNTABLE_NUMSEG
fn step_63() -> Unit raise {
  let t536 = @meson.meson_tac(@list.List([]))
  let t537 = @simp.rewrite_tac(@list.List([in_elim_thm_p()]))
  let t538 = @tactics.exists_tac(@term_syntax.parse_term("(I : (Num) -> Num)"))
  let t539 = @list.List([@tactics.gen_tac, @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c_v1(), @sets.in_univ()])), t538, @tactics_ext2.reduce_tac, t537, t536])
  countable_numseg_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ n : Num, COUNTABLE({(x : Num) | x < n})"), t539))
}

///|
let countable_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_NUMSEG")

///|
/// `COUNTABLE_NUMSEG`
pub fn countable_numseg() -> @kernel.Thm {
  countable_numseg_c.get()
}

///|
/// FINITE_COUNTABLE
fn step_64() -> Unit raise {
  let t540 = @simp.asm_rewrite_tac(@list.List([]))
  let t541 = @tactics_ext2.use_(0L, @drule.match_mp(countable_card()))
  let t542 = @tactics_ext2.join(1L, 0L)
  let t543 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), countable_numseg()))
  let t544 = @tactics_ext2.cho(0L)
  let t545 = @list.List([@tactics_ext.disch_all_tac, @tactics_ext2.use_(0L, @drule.match_mp(finite_has_size_lemma())), t544, t543, t542, t541, t540])
  finite_countable_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : (A) -> Bool, FINITE(A) → COUNTABLE(A)"), t545))
}

///|
let finite_countable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_COUNTABLE")

///|
/// `FINITE_COUNTABLE`
pub fn finite_countable() -> @kernel.Thm {
  finite_countable_c.get()
}

///|
/// num_infinite
fn step_65() -> Unit raise {
  let t546 = @simp.asm_rewrite_tac(@list.List([]))
  let t547 = @tactics_ext2.use_(0L, @simp.rewrite_rule(@list.List([@sets.in_univ()])))
  let t548 = @tactics_ext2.use_(0L, @drule.match_mp(@sets.num_finite_avoid()))
  let t549 = @list.List([@tactics_ext2.proof_by_contr_tac, @tactics_ext2.use_(0L, @simp.rewrite_rule(@list.List([]))), t548, t547, t546])
  num_infinite_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("!(FINITE : ((Num) -> Bool) -> Bool)((UNIV : (Num) -> Bool))"), t549))
}

///|
let num_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_infinite")

///|
/// `num_infinite`
pub fn num_infinite() -> @kernel.Thm {
  num_infinite_c.get()
}

///|
/// num_SEG_UNION
fn step_66() -> Unit raise {
  let t550 = @simp.rewrite_tac(@list.List([]))
  let t551 = @simp.rewrite_tac(@list.List([@sets.univ(), @sets.union(), in_elim_thm_p()]))
  let t552 = @tactics.match_mp_tac(@class.eq_ext())
  let t553 = @list.List([@tactics_ext2.rep_basic_tac, @tactics_ext.subgoal_tac(@term_syntax.parse_term("UNION({(u : Num) | (i : Num) < u}, {(m : Num) | m <= i}) == UNIV")), t552, @tactics.gen_tac, t551, @int.arith_tac, t550])
  num_seg_union_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ i : Num, UNION({(u : Num) | i < u}, {(m : Num) | m <= i}) == UNIV"), t553))
}

///|
let num_seg_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_SEG_UNION")

///|
/// `num_SEG_UNION`
pub fn num_seg_union() -> @kernel.Thm {
  num_seg_union_c.get()
}

///|
/// num_above_infinite
fn step_67() -> Unit raise {
  let t555 = @simp.rewrite_tac(@list.List([num_infinite()]))
  let t556 = @simp.asm_rewrite_tac(@list.List([]))
  let t557 = @simp.rewrite_tac(@list.List([num_seg_union()]))
  let t558 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("UNION({(u : Num) | (i : Num) < u}, {(m : Num) | m <= i}) == UNIV"))
  let t559 = @tactics_ext2.use_(0L, @drule.match_mp(@sets.finite_union_imp()))
  let t560 = @tactics_ext2.join(0L, 1L)
  let t561 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(i : Num)"), @sets.finite_numseg_le()))
  let t562 = @list.List([@tactics.gen_tac, @tactics_ext2.proof_by_contr_tac, @tactics_ext2.use_(0L, @simp.rewrite_rule(@list.List([]))), t561, t560, t559, t558, t557, @tactics.disch_tac, (x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(0L, x554), t556, t555])
  num_above_infinite_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ i : Num, !FINITE({(u : Num) | i < u})"), t562))
}

///|
let num_above_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_above_infinite")

///|
/// `num_above_infinite`
pub fn num_above_infinite() -> @kernel.Thm {
  num_above_infinite_c.get()
}

///|
/// INTER_FINITE
fn step_68() -> Unit raise {
  let t563 = @meson.meson_tac(@list.List([@sets.inter_comm()]))
  let t564 = @meson.asm_meson_tac(@list.List([@sets.finite_subset()]))
  let t565 = @sets.set_tac(@list.List([]))
  let t566 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("SUBSET(INTER((s : (A) -> Bool), (t : (A) -> Bool)), s)"))
  let t567 = @tactics.conv_tac(@tactics_ext2.quant_right_conv("s"))
  let t568 = @list.List([@tactics.conv_tac(@tactics_ext2.quant_right_conv("t")), t567, @tactics_ext2.subconj_tac, @tactics_ext.disch_all_tac, t566, t565, t564, t563])
  inter_finite_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A) -> Bool, (FINITE(s) → FINITE(INTER(s, t))) && (FINITE(t) → FINITE(INTER(s, t)))"), t568))
}

///|
let inter_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTER_FINITE")

///|
/// `INTER_FINITE`
pub fn inter_finite() -> @kernel.Thm {
  inter_finite_c.get()
}

///|
/// num_above_finite
fn step_69() -> Unit raise {
  let t569 = @simp.rewrite_tac(@list.List([inter_finite()]))
  let t570 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(i : Num)"), @sets.finite_numseg_le()))
  let t571 = @simp.asm_rewrite_tac(@list.List([]))
  let t572 = @simp.rewrite_tac(@list.List([@sets.finite_union()]))
  let t573 = @tactics.asm_tac(@simp.once_rewrite_tac)(@list.List([]))
  let t574 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.union_over_inter()), num_seg_union(), @sets.inter_univ()]))
  let t575 = @list.List([@tactics_ext.disch_all_tac, @tactics_ext.subgoal_tac(@term_syntax.parse_term("(J : (Num) -> Bool) == UNION(INTER(J, {(u : Num) | (i : Num) < u}), INTER(J, {(m : Num) | m <= i}))")), t574, @tactics.disch_tac, t573, t572, t571, t570, t569])
  num_above_finite_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ i : Num, ∀ J : (Num) -> Bool, FINITE(INTER(J, {(u : Num) | i < u})) → FINITE(J)"), t575))
}

///|
let num_above_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_above_finite")

///|
/// `num_above_finite`
pub fn num_above_finite() -> @kernel.Thm {
  num_above_finite_c.get()
}

///|
/// SUBSET_SUC
fn step_70() -> Unit raise {
  let t589 = @meson.asm_meson_tac(@list.List([@sets.subset_trans()]))
  let t590 = @tactics_ext2.rewr(6L)
  let t591 = @simp.asm_rewrite_tac(@list.List([]))
  let t592 = @simp.asm_rewrite_tac(@list.List([]))
  let t593 = @tactics_ext2.use_(2L, @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) == (j : Num) - (i : Num) → 0 < j - i"))))
  let t594 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("(i : Num) <= (j' : Num)"))
  let t595 = @simp.asm_rewrite_tac(@list.List([]))
  let t596 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("(n : Num) == (j' : Num) - (i : Num)"))
  let t583 = @term_syntax.parse_term("(i : Num)")
  let t584 = @list.List([@term_syntax.parse_term("(j' : Num)"), t583])
  let t597 = @tactics_ext2.use_(1L, (x585 : @kernel.Thm) => @bool.specl(t584, x585))
  let t581 = @term_syntax.parse_term("(j' : Num)")
  let t598 = @tactics_ext2.use_(0L, (x582 : @kernel.Thm) => @bool.spec(t581, x582))
  let t599 = @simp.asm_rewrite_tac(@list.List([]))
  let t600 = @tactics.disch_then(@tactics.choose_tac)
  let t601 = @simp.asm_rewrite_tac(@list.List([]))
  let t602 = @simp.asm_rewrite_tac(@list.List([]))
  let t603 = @tactics.disj_cases_tac(@bool.spec(@term_syntax.parse_term("(j : Num)"), @nums.num_cases()))
  let t604 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("∃ j' : Num, (j : Num) == SUC(j')"))
  let t605 = @simp.asm_rewrite_tac(@list.List([@sets.subset()]))
  let t606 = @tactics_ext2.use_(1L, (x579 : @kernel.Thm) => @equal.conv_rule(@tactics_ext2.reduce_conv, x579))
  let t607 = @tactics_ext2.join(1L, 2L)
  let t608 = @tactics_ext2.rep(2L, @tactics.conv_tac(@tactics_ext2.quant_left_conv("n")))
  let t578 = @term_syntax.parse_term("(j : Num)")
  let t609 = @tactics.spec_tac(@term_syntax.parse_term("(j : Num)"), t578)
  let t577 = @term_syntax.parse_term("(i : Num)")
  let t610 = @tactics.spec_tac(@term_syntax.parse_term("(i : Num)"), t577)
  let t611 = @tactics.conv_tac(@tactics_ext2.quant_left_conv("n"))
  let t576 = @meson.meson_tac(@list.List([]))
  let t612 = @list.List([@tactics.gen_tac, @tactics.disch_tac, @tactics_ext.rep_gen_tac, @tactics.mp_tac(@tactics_refine.prove(@term_syntax.parse_term("∃ n : Num, n == (j : Num) - (i : Num)"), t576)), t611, t610, t609, t608, @nums.induct_tac, @tactics_ext.rep_gen_tac, @tactics_ext.disch_all_tac, t607, t606, t605, @tactics_ext.rep_gen_tac, @tactics.disch_tac, t604, t603, (x580 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x580), t602, @tactics_ext2.reduce_tac, t601, t600, t599, t598, t597, @tactics.disch_tac, t596, (x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x586), t595, @int.arith_tac, @tactics.disch_tac, t594, t593, (x587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x587), t592, @int.arith_tac, (x588 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(1L, x588), t591, @tactics_ext.disch_all_tac, t590, t589])
  subset_suc_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num, A) -> Bool, (∀ i : Num, SUBSET(f(i), f(SUC(i)))) → (∀ i : Num, ∀ j : Num, i <= j → SUBSET(f(i), f(j)))"), t612))
}

///|
let subset_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_SUC")

///|
/// `SUBSET_SUC`
pub fn subset_suc() -> @kernel.Thm {
  subset_suc_c.get()
}

///|
/// SUBSET_SUC2
fn step_71() -> Unit raise {
  let t626 = @meson.asm_meson_tac(@list.List([@sets.subset_trans()]))
  let t627 = @tactics_ext2.rewr(6L)
  let t628 = @simp.asm_rewrite_tac(@list.List([]))
  let t629 = @simp.asm_rewrite_tac(@list.List([]))
  let t630 = @tactics_ext2.use_(2L, @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) == (j : Num) - (i : Num) → 0 < j - i"))))
  let t631 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("(i : Num) <= (j' : Num)"))
  let t632 = @simp.asm_rewrite_tac(@list.List([]))
  let t633 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("(n : Num) == (j' : Num) - (i : Num)"))
  let t620 = @term_syntax.parse_term("(i : Num)")
  let t621 = @list.List([@term_syntax.parse_term("(j' : Num)"), t620])
  let t634 = @tactics_ext2.use_(1L, (x622 : @kernel.Thm) => @bool.specl(t621, x622))
  let t618 = @term_syntax.parse_term("(j' : Num)")
  let t635 = @tactics_ext2.use_(0L, (x619 : @kernel.Thm) => @bool.spec(t618, x619))
  let t636 = @simp.asm_rewrite_tac(@list.List([]))
  let t637 = @tactics.disch_then(@tactics.choose_tac)
  let t638 = @simp.asm_rewrite_tac(@list.List([]))
  let t639 = @simp.asm_rewrite_tac(@list.List([]))
  let t640 = @tactics.disj_cases_tac(@bool.spec(@term_syntax.parse_term("(j : Num)"), @nums.num_cases()))
  let t641 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("∃ j' : Num, (j : Num) == SUC(j')"))
  let t642 = @simp.asm_rewrite_tac(@list.List([@sets.subset()]))
  let t643 = @tactics_ext2.use_(1L, (x616 : @kernel.Thm) => @equal.conv_rule(@tactics_ext2.reduce_conv, x616))
  let t644 = @tactics_ext2.join(1L, 2L)
  let t645 = @tactics_ext2.rep(2L, @tactics.conv_tac(@tactics_ext2.quant_left_conv("n")))
  let t615 = @term_syntax.parse_term("(j : Num)")
  let t646 = @tactics.spec_tac(@term_syntax.parse_term("(j : Num)"), t615)
  let t614 = @term_syntax.parse_term("(i : Num)")
  let t647 = @tactics.spec_tac(@term_syntax.parse_term("(i : Num)"), t614)
  let t648 = @tactics.conv_tac(@tactics_ext2.quant_left_conv("n"))
  let t613 = @meson.meson_tac(@list.List([]))
  let t649 = @list.List([@tactics.gen_tac, @tactics.disch_tac, @tactics_ext.rep_gen_tac, @tactics.mp_tac(@tactics_refine.prove(@term_syntax.parse_term("∃ n : Num, n == (j : Num) - (i : Num)"), t613)), t648, t647, t646, t645, @nums.induct_tac, @tactics_ext.rep_gen_tac, @tactics_ext.disch_all_tac, t644, t643, t642, @tactics_ext.rep_gen_tac, @tactics.disch_tac, t641, t640, (x617 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x617), t639, @tactics_ext2.reduce_tac, t638, t637, t636, t635, t634, @tactics.disch_tac, t633, (x623 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x623), t632, @int.arith_tac, @tactics.disch_tac, t631, t630, (x624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(2L, x624), t629, @int.arith_tac, (x625 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(1L, x625), t628, @tactics_ext.disch_all_tac, t627, t626])
  subset_suc2_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num, A) -> Bool, (∀ i : Num, SUBSET(f(SUC(i)), f(i))) → (∀ i : Num, ∀ j : Num, i <= j → SUBSET(f(j), f(i)))"), t649))
}

///|
let subset_suc2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_SUC2")

///|
/// `SUBSET_SUC2`
pub fn subset_suc2() -> @kernel.Thm {
  subset_suc2_c.get()
}

///|
/// INFINITE_PIGEONHOLE
fn step_72() -> Unit raise {
  let t661 = @meson.meson_tac(@list.List([@sets.in_()]))
  let t662 = @simp.abbrev_tac(@term_syntax.parse_term("(r : (A) -> Bool) == {(i : A) | (I' : (A) -> Bool)(i) && INTER((C : (B) -> Bool), (b : (B) -> Bool), (f : (A) -> B)(i))}"))
  let t663 = @tactics_ext2.and_(5L)
  let t657 = @term_syntax.parse_term("(b : (B) -> Bool)")
  let t664 = @tactics_ext2.use_(3L, (x658 : @kernel.Thm) => @bool.spec(t657, x658))
  let t665 = @simp.asm_rewrite_tac(@list.List([]))
  let t655 = @term_syntax.parse_term("(b : (B) -> Bool)")
  let t666 = @tactics.disch_then((x656 : @kernel.Thm) => @tactics.x_choose_tac(t655, x656))
  let t667 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t668 = @simp.simp_tac(@list.List([@sets.finite_unions()]))
  let t669 = @simp.asm_rewrite_tac(@list.List([]))
  let t670 = @tactics.match_mp_tac(@sets.finite_image())
  let t671 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("FINITE(IMAGE((b : (B) -> Bool) => {(i : A) | (I' : (A) -> Bool)(i) && INTER((C : (B) -> Bool), b, (f : (A) -> B)(i))}, (B : ((B) -> Bool) -> Bool)))"))
  let t672 = @simp.asm_rewrite_tac(@list.List([]))
  let t673 = @simp.asm_rewrite_tac(@list.List([]))
  let t674 = @tactics_ext2.use_(4L, @simp.rewrite_rule(@list.List([@sets.in_()])))
  let t675 = @tactics_ext2.use_(4L, @simp.rewrite_rule(@list.List([in_elim_thm_p(), @sets.inter()])))
  let t676 = @tactics_ext2.rewr(4L)
  let t677 = @tactics_ext2.cho(5L)
  let t678 = @tactics_ext2.and_(4L)
  let t679 = @tactics_ext2.cho(4L)
  let t680 = @simp.asm_rewrite_tac(@list.List([]))
  let t681 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t682 = @simp.rewrite_tac(@list.List([in_elim_thm_p(), @sets.inter()]))
  let t683 = @simp.asm_rewrite_tac(@list.List([]))
  let t684 = @tactics.exists_tac(@term_syntax.parse_term("{(i' : A) | (I' : (A) -> Bool)(i') && INTER((C : (B) -> Bool), (u : (B) -> Bool), (f : (A) -> B)(i'))}"))
  let t685 = @tactics.exists_tac(@term_syntax.parse_term("(u : (B) -> Bool)"))
  let t686 = @tactics.conv_tac(@tactics_ext2.quant_left_conv("x"))
  let t687 = @tactics.conv_tac(@tactics_ext2.quant_left_conv("x"))
  let t688 = @tactics_ext2.cho(2L)
  let t689 = @tactics_ext2.rewr(2L)
  let t690 = @tactics_ext2.use_(2L, @simp.rewrite_rule(@list.List([@sets.in_()])))
  let t653 = @term_syntax.parse_term("(f : (A) -> B)((j : A))")
  let t691 = @tactics_ext2.use_(2L, (x654 : @kernel.Thm) => @bool.spec(t653, x654))
  let t692 = @tactics_ext2.use_(2L, @simp.rewrite_rule(@list.List([in_elim_thm_p()])))
  let t693 = @tactics_ext2.use_(2L, @simp.rewrite_rule(@list.List([@sets.subset(), @sets.unions()])))
  let t694 = @simp.abbrev_tac(@term_syntax.parse_term("(j : A) == (x : A)"))
  let t695 = @simp.rewrite_tac(@list.List([in_elim_thm_p()]))
  let t696 = @tactics.match_mp_tac(@class.eq_ext())
  let t697 = @simp.rewrite_tac(@list.List([@sets.unions(), @sets.in_image()]))
  let t698 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("{(i : A) | (I' : (A) -> Bool)(i) && (C : (B) -> Bool)((f : (A) -> B)(i))} == UNIONS(IMAGE((b : (B) -> Bool) => {(i : A) | I'(i) && INTER(C, b, f(i))}, (B : ((B) -> Bool) -> Bool)))"))
  let t699 = @tactics_ext.taut_tac(@term_syntax.parse_term("(P : Bool) → !P → false"))
  let t650 = @tactics_ext2.quant_left_conv("b")
  let t700 = @list.List([@tactics_ext.disch_all_tac, @tactics_ext2.proof_by_contr_tac, @tactics_ext2.use_(3L, (x651 : @kernel.Thm) => @equal.conv_rule(t650, x651)), (x652 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(0L, x652), t699, t698, t697, t696, @tactics.gen_tac, t695, t694, @tactics.eq_tac, @tactics_ext.disch_all_tac, t693, t692, t691, t690, t689, t688, t687, t686, t685, @tactics_ext2.name_conflict_tac, t684, t683, t682, t681, t680, @tactics.disch_tac, t679, t678, t677, t676, t675, t674, t673, @tactics.disch_tac, t672, t671, t670, t669, t668, @tactics.disch_tac, @tactics.gen_tac, t667, t666, t665, t664, (x659 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(3L, x659), t663, (x660 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(3L, x660), t662, t661])
  infinite_pigeonhole_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ I : (A) -> Bool, ∀ f : (A) -> B, ∀ B : ((B) -> Bool) -> Bool, ∀ C : (B) -> Bool, !FINITE({(i : A) | I(i) && C(f(i))}) && FINITE(B) && SUBSET(C, UNIONS(B)) → (∃ b : (B) -> Bool, B(b) && !FINITE({(i : A) | I(i) && INTER(C, b, f(i))}))"), t700))
}

///|
let infinite_pigeonhole_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INFINITE_PIGEONHOLE")

///|
/// `INFINITE_PIGEONHOLE`
pub fn infinite_pigeonhole() -> @kernel.Thm {
  infinite_pigeonhole_c.get()
}

///|
/// real_FINITE
fn step_73() -> Unit raise {
  let t715 = @simp.asm_rewrite_tac(@list.List([]))
  let t716 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t712 = @term_syntax.parse_term("(x : Real)")
  let t717 = @tactics_ext2.use_(1L, (x713 : @kernel.Thm) => @bool.spec(t712, x713))
  let t718 = @tactics_ext2.rewr(2L)
  let t710 = @term_syntax.parse_term("(n : (Real) -> Num)((x : Real))")
  let t719 = @tactics_ext2.use_(2L, (x711 : @kernel.Thm) => @bool.spec(t710, x711))
  let t708 = @term_syntax.parse_term("(x : Real)")
  let t720 = @tactics_ext2.use_(2L, (x709 : @kernel.Thm) => @bool.spec(t708, x709))
  let t706 = @tactics_ext2.quant_left_conv("x'")
  let t721 = @tactics_ext2.use_(2L, (x707 : @kernel.Thm) => @equal.conv_rule(t706, x707))
  let t704 = @tactics_ext2.quant_left_conv("x'")
  let t722 = @tactics_ext2.use_(2L, (x705 : @kernel.Thm) => @equal.conv_rule(t704, x705))
  let t723 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((a : Num))"))
  let t724 = @tactics_ext2.use_(2L, (x703 : @kernel.Thm) => @equal.conv_rule(@tactics_ext2.name_conflict_conv, x703))
  let t725 = @tactics_ext2.use_(2L, @simp.rewrite_rule(@list.List([@sets.in_image()])))
  let t726 = @tactics_ext2.cho(2L)
  let t727 = @tactics_ext2.rewr(2L)
  let t728 = @tactics.assume_tac(@bool.eq_imp_rule(@bool.spec(@term_syntax.parse_term("IMAGE((n : (Real) -> Num), (s : (Real) -> Bool))"), @sets.num_finite())).0)
  let t729 = @meson.asm_meson_tac(@list.List([@sets.finite_image()]))
  let t730 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("FINITE(IMAGE((n : (Real) -> Num), (s : (Real) -> Bool)))"))
  let t731 = @tactics_ext2.cho(1L)
  let t701 = @tactics_ext2.quant_left_conv("n")
  let t732 = @tactics_ext2.use_(1L, (x702 : @kernel.Thm) => @equal.conv_rule(t701, x702))
  let t733 = @list.List([@tactics_ext.disch_all_tac, @tactics.assume_tac(@analysis.real_arch_simple()), t732, t731, t730, t729, t728, @tactics.disch_tac, t727, t726, t725, t724, t723, @tactics.gen_tac, t722, t721, t720, t719, @tactics.disch_tac, t718, t717, (x714 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext2.und(1L, x714), t716, @tactics_ext2.reduce_tac, t715])
  real_finite_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ s : (Real) -> Bool, FINITE(s) → (∃ a : Real, ∀ x : Real, IN(x, s) → x <= a)"), t733))
}

///|
let real_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_FINITE")

///|
/// `real_FINITE`
pub fn real_finite() -> @kernel.Thm {
  real_finite_c.get()
}

///|
/// UNIONS_DELETE
fn step_74() -> Unit raise {
  let t734 = @meson.meson_tac(@list.List([]))
  let t735 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t736 = @simp.rewrite_tac(@list.List([in_elim_thm_p()]))
  let t737 = @tactics.match_mp_tac(@class.eq_ext())
  let t738 = @list.List([@simp.rewrite_tac(@list.List([@sets.unions(), @sets.delete(), @sets.empty()])), @tactics.gen_tac, t737, t736, @tactics.gen_tac, t735, t734])
  unions_delete_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ s : ((A) -> Bool) -> Bool, UNIONS(s) == UNIONS(DELETE(s, {}))"), t738))
}

///|
let unions_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIONS_DELETE")

///|
/// `UNIONS_DELETE`
pub fn unions_delete() -> @kernel.Thm {
  unions_delete_c.get()
}

///|
/// SUPP
fn step_75() -> Unit raise {
  supp_v1_c.set(@pair.new_definition(@term_syntax.parse_term("(SUPP : ((A) -> B, A) -> Bool)((f : (A) -> B)) == ((x : A) => !(f(x) == CHOICE(UNIV)))")))
}

///|
let supp_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUPP")

///|
/// `SUPP`
pub fn supp_v1() -> @kernel.Thm {
  supp_v1_c.get()
}

///|
/// FUN
fn step_76() -> Unit raise {
  fun_c.set(@pair.new_definition(@term_syntax.parse_term("(FUN : ((A) -> Bool, (B) -> Bool, (A) -> B) -> Bool)((a : (A) -> Bool), (b : (B) -> Bool)) == ((f : (A) -> B) => (∀ x : A, IN(x, a) → IN(f(x), b)) && SUBSET(SUPP(f), a))")))
}

///|
let fun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUN")

///|
/// `FUN`
pub fn fun() -> @kernel.Thm {
  fun_c.get()
}

///|
/// compose
fn step_77() -> Unit raise {
  compose_c.set(@pair.new_definition(@term_syntax.parse_term("(compose : ((_) -> _, (_) -> _, _) -> _)((f : (_) -> _), (g : (_) -> _)) == ((x : _) => f(g(x)))")))
}

///|
let compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("compose")

///|
/// `compose`
pub fn compose() -> @kernel.Thm {
  compose_c.get()
}

///|
/// COMP_ASSOC
fn step_78() -> Unit raise {
  let t739 = @simp.rewrite_tac(@list.List([compose()]))
  let t740 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t739)])
  comp_assoc_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (Num) -> Num, ∀ g : (Num) -> Num, ∀ h : (Num) -> Num, compose(f, compose(g, h)) == compose(compose(f, g), h)"), t740))
}

///|
let comp_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_ASSOC")

///|
/// `COMP_ASSOC`
pub fn comp_assoc() -> @kernel.Thm {
  comp_assoc_c.get()
}

///|
/// COMP_INJ
fn step_79() -> Unit raise {
  let t741 = @meson.asm_meson_tac(@list.List([]))
  let t742 = @simp.rewrite_tac(@list.List([@sets.inj(), compose()]))
  let t743 = @tactics.every(@list.List([@tactics.repeat_tac(@tactics.gen_tac), t742, @tactics_ext.disch_all_tac, t741]))
  comp_inj_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (B) -> C, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, INJ(f, s, t) && INJ(g, t, u) → INJ(compose(g, f), s, u)"), t743))
}

///|
let comp_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_INJ")

///|
/// `COMP_INJ`
pub fn comp_inj() -> @kernel.Thm {
  comp_inj_c.get()
}

///|
/// COMP_SURJ
fn step_80() -> Unit raise {
  let t744 = @meson.asm_meson_tac(@list.List([]))
  let t745 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([@sets.surj(), compose()])), @tactics_ext.disch_all_tac, t744]))
  comp_surj_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (B) -> C, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ u : (C) -> Bool, SURJ(f, s, t) && SURJ(g, t, u) → SURJ(compose(g, f), s, u)"), t745))
}

///|
let comp_surj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_SURJ")

///|
/// `COMP_SURJ`
pub fn comp_surj() -> @kernel.Thm {
  comp_surj_c.get()
}

///|
/// COMP_BIJ
fn step_81() -> Unit raise {
  let t746 = @meson.asm_meson_tac(@list.List([comp_inj(), comp_surj()]))
  let t747 = @simp.rewrite_tac(@list.List([@sets.bij()]))
  let t748 = @tactics.every(@list.List([@tactics.repeat_tac(@tactics.gen_tac), t747, @tactics_ext.disch_all_tac, t746]))
  comp_bij_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ f : (A) -> B, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ g : (B) -> C, ∀ u : (C) -> Bool, BIJ(f, s, t) && BIJ(g, t, u) → BIJ(compose(g, f), s, u)"), t748))
}

///|
let comp_bij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMP_BIJ")

///|
/// `COMP_BIJ`
pub fn comp_bij() -> @kernel.Thm {
  comp_bij_c.get()
}

///|
/// INVERSE_FN
fn step_82() -> Unit raise {
  let t752 = @meson.asm_meson_tac(@list.List([]))
  let t753 = @meson.asm_meson_tac(@list.List([]))
  let t754 = @tactics.first_x_assum(fn(x750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x750
    @tactics.assume_tac(@equal.ap_term(@term_syntax.parse_term("(f : (A) -> B)"), th))
  })
  let t755 = @tactics.repeat_tac(@tactics.gen_tac)
  let t756 = @meson.asm_meson_tac(@list.List([]))
  let t757 = @tactics.repeat_tac(@tactics.conj_tac)
  let t758 = @tactics.exists_tac(@term_syntax.parse_term("(u : (B) -> A)"))
  let t759 = @tactics.disch_then(@tactics.choose_tac)
  let t760 = @meson.asm_meson_tac(@list.List([]))
  let t761 = @simp.rewrite_tac(@list.List([@equal.gsym(@class.skolem_thm())]))
  let t762 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("∃ u : (B) -> A, ∀ y : B, IN(y, (b : (B) -> Bool)) → IN(u(y), (a : (A) -> Bool)) && (f : (A) -> B)(u(y)) == y"))
  let t763 = @simp.rewrite_tac(@list.List([@sets.surj(), @sets.inj()]))
  let t749 = @list.List([@meson.meson_tac(@list.List([]))])
  let t764 = @tactics.match_mp_tac(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Bool, ∀ B : ((B) -> A) -> Bool, (A → (∃ x : (B) -> A, B(x))) → (∃ x : (B) -> A, A → B(x))"), t749))
  let t765 = @tactics.repeat_tac(@tactics.gen_tac)
  let t766 = @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(@class.skolem_thm())])), t765, t764, t763, @tactics_ext.disch_all_tac, t762, t761, @tactics.gen_tac, t760, t759, t758, t757, t756, t755, @tactics_ext.disch_all_tac, t754, t753, t752])
  inverse_fn_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∃ INV : ((A) -> B, (A) -> Bool, (B) -> Bool, B) -> A, ∀ f : (A) -> B, ∀ a : (A) -> Bool, ∀ b : (B) -> Bool, SURJ(f, a, b) → INJ(INV(f, a, b), b, a) && (∀ x : B, IN(x, b) → f(INV(f, a, b, x)) == x)"), t766))
}

///|
let inverse_fn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVERSE_FN")

///|
/// `INVERSE_FN`
pub fn inverse_fn() -> @kernel.Thm {
  inverse_fn_c.get()
}

///|
/// INVERSE_DEF
fn step_83() -> Unit raise {
  inverse_def_c.set(@nums.new_specification(@list.List(["INV"]))(inverse_fn()))
}

///|
let inverse_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVERSE_DEF")

///|
/// `INVERSE_DEF`
pub fn inverse_def() -> @kernel.Thm {
  inverse_def_c.get()
}

///|
/// INVERSE_BIJ
fn step_84() -> Unit raise {
  let t781 = @meson.asm_meson_tac(@list.List([]))
  let t782 = @meson.asm_meson_tac(@list.List([inverse_def(), @sets.inj()]))
  let t783 = @tactics.subgoal_then(@term_syntax.parse_term("IN(INV((f : (A) -> B), (a : (A) -> Bool), (b : (B) -> Bool), f((x : A))), a)"), fn(x778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s779 = @tactics.assume_tac(x778)
    fn(x780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s779(x780)
    }
  })
  let t784 = @simp.asm_rewrite_tac(@list.List([]))
  let t785 = @tactics.first_x_assum(fn(x775 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x775
    let t777 = @term_syntax.parse_term("(x : A)")
    @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("INV((f : (A) -> B), (a : (A) -> Bool), (b : (B) -> Bool), f((x : A)))"), t777]), th))
  })
  let t786 = @simp.rewrite_tac(@list.List([@sets.inj()]))
  let t787 = @meson.asm_meson_tac(@list.List([inverse_def()]))
  let t788 = @tactics.subgoal_then(@term_syntax.parse_term("(f : (A) -> B)(INV(f, (a : (A) -> Bool), (b : (B) -> Bool), f((x : A)))) == f(x)"), fn(x770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s771 = @tactics.assume_tac(x770)
    fn(x772 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s771(x772)
    }
  })
  let t789 = @meson.asm_meson_tac(@list.List([@sets.inj()]))
  let t790 = @tactics.subgoal_then(@term_syntax.parse_term("IN((f : (A) -> B)((x : A)), (b : (B) -> Bool))"), fn(x767 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s768 = @tactics.assume_tac(x767)
    fn(x769 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s768(x769)
    }
  })
  let t791 = @meson.asm_meson_tac(@list.List([@sets.inj()]))
  let t792 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)((x : A))"))
  let t793 = @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac)
  let t794 = @meson.asm_meson_tac(@list.List([inverse_def(), @sets.inj()]))
  let t795 = @simp.rewrite_tac(@list.List([@sets.surj()]))
  let t796 = @simp.asm_simp_tac(@list.List([inverse_def()]))
  let t797 = @simp.rewrite_tac(@list.List([@sets.bij()]))
  let t798 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), t797, @tactics_ext.disch_all_tac, t796, t795, @tactics.conj_tac, t794, t793, t792, @tactics.conj_tac, t791, t790, t789, t788, t787, (x774 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.h_undisch_tac((x773 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x773), x774), t786, @tactics_ext.disch_all_tac, t785, t784, @tactics_ext.disch_all_tac, t783, t782, t781])
  inverse_bij_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (A) -> B, ∀ a : (A) -> Bool, ∀ b : (B) -> Bool, BIJ(f, a, b) → BIJ(INV(f, a, b), b, a)"), t798))
}

///|
let inverse_bij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVERSE_BIJ")

///|
/// `INVERSE_BIJ`
pub fn inverse_bij() -> @kernel.Thm {
  inverse_bij_c.get()
}

///|
/// INVERSE_XY
fn step_85() -> Unit raise {
  let t817 = @meson.asm_meson_tac(@list.List([]))
  let t818 = @tactics.imp_res_then(fn(x815 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x815
    @tactics.assume_tac(@bool.conjunct2(th_4))
  })(inverse_def())
  let t819 = @tactics.first_x_assum(fn(x813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x813
    @tactics.assume_tac(@bool.conjunct2(@simp.rewrite_rule(@list.List([@sets.bij()]))(th_3)))
  })
  let t820 = @simp.asm_rewrite_tac(@list.List([]))
  let t821 = @meson.asm_meson_tac(@list.List([@sets.bij(), @sets.inj()]))
  let t822 = @tactics.imp_res_then(fn(x810 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s811 = @tactics.assume_tac(x810)
    fn(x812 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s811(x812)
    }
  })(inverse_bij())
  let t823 = @simp.asm_rewrite_tac(@list.List([]))
  let t824 = @tactics.repeat_tac(@tactics.conj_tac)
  let t825 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t826 = @tactics.disch_then(fn(x807 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x807
    let t809 = @simp.rewrite_tac(@list.List([@equal.gsym(th_2)]))
    @tactics.then_tac(@tactics.assume_tac(th_2), t809)
  })
  let t827 = @tactics.pop_assum(fn(x803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x803
    let t805 = @bool.conjunct1(@simp.rewrite_rule(@list.List([@sets.bij()]))(th_1))
    let t806 = @tactics.assume_tac(@bool.conjunct2(@simp.rewrite_rule(@list.List([@sets.inj()]))(t805)))
    @tactics.then_tac(@tactics.assume_tac(th_1), t806)
  })
  let t828 = @meson.asm_meson_tac(@list.List([]))
  let t829 = @tactics.first_x_assum(fn(x799 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x799
    let t801 = @bool.conjunct2(@simp.rewrite_rule(@list.List([@sets.bij()]))(th))
    let t802 = @tactics.assume_tac(@drule.match_mp(inverse_def())(t801))
    @tactics.then_tac(@tactics.assume_tac(th), t802)
  })
  let t830 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, @tactics.eq_tac, t829, t828, t827, t826, t825, t824, t823, t822, t821, t820, t819, t818, t817])
  inverse_xy_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (A) -> B, ∀ a : (A) -> Bool, ∀ b : (B) -> Bool, ∀ x : A, ∀ y : B, BIJ(f, a, b) && IN(x, a) && IN(y, b) → (INV(f, a, b, y) == x) == (f(x) == y)"), t830))
}

///|
let inverse_xy_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INVERSE_XY")

///|
/// `INVERSE_XY`
pub fn inverse_xy() -> @kernel.Thm {
  inverse_xy_c.get()
}

///|
/// FINITE_BIJ
fn step_86() -> Unit raise {
  let t831 = @meson.meson_tac(@list.List([surj_image(), @sets.bij(), @sets.inj(), @sets.finite_image()]))
  finite_bij_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : (A) -> Bool, ∀ b : (B) -> Bool, ∀ f : (A) -> B, FINITE(a) && BIJ(f, a, b) → FINITE(b)"), t831))
}

///|
let finite_bij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_BIJ")

///|
/// `FINITE_BIJ`
pub fn finite_bij() -> @kernel.Thm {
  finite_bij_c.get()
}

///|
/// FINITE_INJ
fn step_87() -> Unit raise {
  let t839 = @simp.asm_rewrite_tac(@list.List([]))
  let t840 = @simp.asm_rewrite_tac(@list.List([]))
  let t841 = @meson.asm_meson_tac(@list.List([@sets.bij(), @sets.inj()]))
  let t842 = @tactics.first_x_assum(fn(x837 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x837
    @tactics.match_mp_tac(th)
  })
  let t843 = @tactics.exists_tac(@term_syntax.parse_term("{(x : A) | IN(x, (a : (A) -> Bool)) && IN((f : (A) -> B)(x), (b : (B) -> Bool))}"))
  let t844 = @tactics.match_mp_tac(@sets.finite_subset())
  let t845 = @meson.asm_meson_tac(@list.List([@sets.bij(), @sets.inj()]))
  let t846 = @tactics_ext.popl_tac(@list.List([0L, 1L]))
  let t847 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t848 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t849 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((a : (A) -> Bool), {(x : A) | IN(x, a) && IN((f : (A) -> B)(x), (b : (B) -> Bool))})"), fn(x834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s835 = @tactics.assume_tac(x834)
    fn(x836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s835(x836)
    }
  })
  let t832 = @term_syntax.parse_term("(a : (A) -> Bool)")
  let t833 = @term_syntax.parse_term("(b : (B) -> Bool)")
  let t850 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (A) -> B)"), t833, t832]), @sets.finite_image_inj_general()))
  let t851 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, t850, @tactics_ext.disch_all_tac, t849, t848, @tactics.gen_tac, t847, t846, t845, t844, t843, @tactics.conj_tac, t842, @tactics.conj_tac, t841, t840, t839])
  finite_inj_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : (A) -> Bool, ∀ b : (B) -> Bool, ∀ f : (A) -> B, FINITE(b) && INJ(f, a, b) → FINITE(a)"), t851))
}

///|
let finite_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_INJ")

///|
/// `FINITE_INJ`
pub fn finite_inj() -> @kernel.Thm {
  finite_inj_c.get()
}

///|
/// FINITE_BIJ2
fn step_88() -> Unit raise {
  let t852 = @list.List([@meson.meson_tac(@list.List([@sets.bij(), finite_inj()]))])
  finite_bij2_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : (A) -> Bool, ∀ b : (B) -> Bool, ∀ f : (A) -> B, FINITE(b) && BIJ(f, a, b) → FINITE(a)"), t852))
}

///|
let finite_bij2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_BIJ2")

///|
/// `FINITE_BIJ2`
pub fn finite_bij2() -> @kernel.Thm {
  finite_bij2_c.get()
}

///|
/// BIJ_CARD
fn step_89() -> Unit raise {
  let t853 = @list.List([@meson.asm_meson_tac(@list.List([surj_image(), @sets.bij(), @sets.inj(), @sets.card_image_inj()]))])
  bij_card_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : (A) -> Bool, ∀ b : (B) -> Bool, ∀ f : (A) -> B, FINITE(a) && BIJ(f, a, b) → CARD(a) == CARD(b)"), t853))
}

///|
let bij_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIJ_CARD")

///|
/// `BIJ_CARD`
pub fn bij_card() -> @kernel.Thm {
  bij_card_c.get()
}

///|
/// PAIR_LEMMA
fn step_90() -> Unit raise {
  let t854 = @list.List([@meson.meson_tac(@list.List([@pair.fst(), @pair.snd(), @pair.pair()]))])
  pair_lemma_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ x : (Num, Num), ∀ i : Num, ∀ j : Num, (FST(x) == i && SND(x) == j) == (x == (i, j))"), t854))
}

///|
let pair_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIR_LEMMA")

///|
/// `PAIR_LEMMA`
pub fn pair_lemma() -> @kernel.Thm {
  pair_lemma_c.get()
}

///|
/// CARD_SING
fn step_91() -> Unit raise {
  let t855 = @tactics.accept_tac(@calc_num.num_red_conv(@term_syntax.parse_term("SUC(0)")))
  let t856 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.not_in_empty()]))
  let t857 = @tactics.assume_tac(@sets.finite_rules())
  let t858 = @simp.asm_rewrite_tac(@list.List([]))
  let t859 = @tactics.disch_then(@tactics.choose_tac)
  let t860 = @list.List([@simp.rewrite_tac(@list.List([@sets.sing()])), @tactics.gen_tac, t859, t858, t857, t856, t855])
  card_sing_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ u : (A) -> Bool, SING(u) → CARD(u) == 1"), t860))
}

///|
let card_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_SING")

///|
/// `CARD_SING`
pub fn card_sing() -> @kernel.Thm {
  card_sing_c.get()
}

///|
/// FINITE_SING
fn step_92() -> Unit raise {
  let t861 = @list.List([@meson.meson_tac(@list.List([@sets.finite_rules()]))])
  finite_sing_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ x : A, FINITE({x})"), t861))
}

///|
let finite_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SING")

///|
/// `FINITE_SING`
pub fn finite_sing() -> @kernel.Thm {
  finite_sing_c.get()
}

///|
/// NUM_INTRO
fn step_93() -> Unit raise {
  let t866 = @meson.asm_meson_tac(@list.List([]))
  let t862 = @term_syntax.parse_term("(g : A)")
  let t863 = @list.List([@term_syntax.parse_term("(f : (A) -> Num)((g : A))"), t862])
  let t867 = @tactics_ext.h_val((x864 : @kernel.Thm) => @bool.specl(t863, x864), (x865 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x865))
  let t868 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, @tactics.gen_tac, t867, t866])
  num_intro_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ f : (A) -> Num, ∀ P : (A) -> Bool, (∀ n : Num, ∀ g : A, f(g) == n → P(g)) → (∀ g : A, P(g))"), t868))
}

///|
let num_intro_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_INTRO")

///|
/// `NUM_INTRO`
pub fn num_intro() -> @kernel.Thm {
  num_intro_c.get()
}

///|
/// DOMAIN_EMPTY
fn step_94() -> Unit raise {
  let t869 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([]))), @tactics.beta_tac)
  let t870 = @simp.asm_rewrite_tac(@list.List([]))
  let t871 = @tactics.then_tac(@tactics.disch_tac, @tactics.match_mp_tac(@class.eq_ext()))
  let t872 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t873 = @simp.once_rewrite_tac(@list.List([@sets.extension()]))
  let t874 = @simp.rewrite_tac(@list.List([@sets.empty()]))
  let t875 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.insert(), @sets.not_in_empty(), @sets.subset_empty(), supp_v1()]))
  let t876 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t877 = @list.List([@tactics.gen_tac, @simp.rewrite_tac(@list.List([@sets.extension(), fun()])), t876, t875, t874, t873, t872, @tactics.eq_tac, t871, @tactics.beta_tac, t870, t869])
  domain_empty_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ b : (B) -> Bool, FUN({}, b) == {(u : A) => CHOICE(UNIV)}"), t877))
}

///|
let domain_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOMAIN_EMPTY")

///|
/// `DOMAIN_EMPTY`
pub fn domain_empty() -> @kernel.Thm {
  domain_empty_c.get()
}

///|
/// DOMAIN_INSERT
fn step_95() -> Unit raise {
  let t895 = @simp.asm_rewrite_tac(@list.List([]))
  let t896 = @meson.asm_meson_tac(@list.List([@sets.in_()]))
  let t897 = @simp.asm_rewrite_tac(@list.List([]))
  let t894 = @meson.meson_tac(@list.List([]))
  let t898 = @tactics.disj_cases_tac(@tactics_refine.prove(@term_syntax.parse_term("((t : A) == (s : A)) == true || (t == s) == false"), t894))
  let t899 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : A)"))
  let t900 = @tactics.match_mp_tac(@class.eq_ext())
  let t901 = @tactics_ext.popl_tac(@list.List([0L, 2L, 3L, 4L]))
  let t902 = @simp.rewrite_tac(@list.List([]))
  let t893 = @meson.meson_tac(@list.List([]))
  let t903 = @simp.asm_simp_tac(@list.List([@tactics_refine.prove(@term_syntax.parse_term("!((t : A) == (s : A)) → (t == s) == false"), t893)]))
  let t904 = @tactics.first_x_assum(fn(x891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x891
    @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(t : A)"), th_3))
  })
  let t905 = @tactics_ext.popl_tac(@list.List([1L, 3L, 4L, 5L, 6L]))
  let t906 = @simp.asm_rewrite_tac(@list.List([]))
  let t907 = @tactics_ext.popl_tac(@list.List([1L, 3L, 4L, 5L, 6L]))
  let t908 = @class.asm_cases_tac(@term_syntax.parse_term("(t : A) == (s : A)"))
  let t909 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @class.cond_elim_thm()]))
  let t910 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : A)"))
  let t911 = @meson.asm_meson_tac(@list.List([]))
  let t912 = @tactics_ext.popl_tac(@list.List([1L, 3L, 4L, 5L]))
  let t913 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @class.cond_elim_thm()]))
  let t914 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : A)"))
  let t915 = @tactics.repeat_tac(@tactics.conj_tac)
  let t916 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => if x == (s : A) { (v : B) } else { (u : (A) -> B)(x) }"))
  let t917 = @simp.asm_rewrite_tac(@list.List([]))
  let t918 = @tactics.first_x_assum(fn(x888 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s889 = @tactics.mp_tac(x888)
    fn(x890 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s889(x890)
    }
  })
  let t919 = @tactics.disch_then(@tactics.choose_tac)
  let t920 = @tactics.first_x_assum(fn(x886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x886
    @tactics.mp_tac(th_2)
  })
  let t921 = @tactics.disch_then(@tactics.choose_tac)
  let t922 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : ((A) -> B, B))"))
  let t923 = @simp.rewrite_tac(@list.List([@sets.in_(), @sets.insert(), @sets.subset()]))
  let t924 = @simp.rewrite_tac(@list.List([fun(), supp_v1(), @sets.in_elim_thm()]))
  let t925 = @meson.asm_meson_tac(@list.List([]))
  let t926 = @meson.asm_meson_tac(@list.List([]))
  let t927 = @tactics.first_x_assum(fn(x881 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x881
    let t883 = @equal.beta_rule(@equal.ap_thm(th_1, @term_syntax.parse_term("(x : A)")))
    @tactics.assume_tac(@simp.rewrite_rule(@list.List([@class.cond_elim_thm()]))(t883))
  })
  let t928 = @tactics.first_x_assum(fn(x878 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x878
    let t880 = @equal.ap_term(@term_syntax.parse_term("(FST : (((A) -> B, B), A) -> B)"), th)
    @tactics.assume_tac(@simp.rewrite_rule(@list.List([@pair.fst()]))(t880))
  })
  let t929 = @tactics_ext.popl_tac(@list.List([1L, 2L, 3L, 4L, 6L, 7L]))
  let t930 = @meson.asm_meson_tac(@list.List([@pair.pair(), @pair.fst(), @pair.snd()]))
  let t931 = @simp.asm_rewrite_tac(@list.List([]))
  let t932 = @tactics_ext.popl_tac(@list.List([1L, 2L, 3L, 4L, 6L, 7L]))
  let t933 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (s : A)"))
  let t934 = @tactics.match_mp_tac(@class.eq_ext())
  let t935 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t936 = @tactics.x_gen_tac(@term_syntax.parse_term("(f2 : (A) -> B)"))
  let t937 = @tactics.x_gen_tac(@term_syntax.parse_term("(f1 : (A) -> B)"))
  let t938 = @simp.rewrite_tac(@list.List([fun(), supp_v1()]))
  let t939 = @meson.asm_meson_tac(@list.List([]))
  let t940 = @meson.asm_meson_tac(@list.List([]))
  let t941 = @simp.asm_rewrite_tac(@list.List([]))
  let t942 = @simp.asm_rewrite_tac(@list.List([]))
  let t943 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (s : A)"))
  let t944 = @tactics.then_tac(@analysis.expand_tac("g"), @tactics.beta_tac)
  let t945 = @meson.asm_meson_tac(@list.List([@sets.in_()]))
  let t946 = @simp.rewrite_tac(@list.List([@sets.in_(), @class.cond_elim_thm()]))
  let t947 = @tactics.then_tac(@analysis.expand_tac("g"), @tactics.beta_tac)
  let t948 = @tactics.repeat_tac(@tactics.conj_tac)
  let t949 = @simp.rewrite_tac(@list.List([]))
  let t950 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B)((s : A))"))
  let t951 = @tactics.exists_tac(@term_syntax.parse_term("(g : (A) -> B)"))
  let t952 = @simp.abbrev_tac(@term_syntax.parse_term("(g : (A) -> B) == ((x : A) => if x == (s : A) { CHOICE(UNIV) } else { (f : (A) -> B)(x) })"))
  let t953 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), supp_v1()]))
  let t954 = @simp.rewrite_tac(@list.List([@sets.insert(), @sets.subset()]))
  let t955 = @simp.rewrite_tac(@list.List([fun(), @sets.in_elim_thm()]))
  let t956 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t957 = @tactics.repeat_tac(@tactics.conj_tac)
  let t958 = @tactics_ext.taut_tac(@term_syntax.parse_term("(A : Bool) && (A → (B : Bool)) && (A → (C : Bool)) → (A && B) && A && C"))
  let t959 = @simp.rewrite_tac(@list.List([@sets.bij(), @sets.inj(), @sets.surj()]))
  let t960 = @tactics.exists_tac(@term_syntax.parse_term("(f : (A) -> B) => ((x : A) => if x == (s : A) { CHOICE(UNIV) } else { f(x) }, f(s))"))
  let t961 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac, t960, t959, t958, t957, t956, t955, t954, t953, @tactics.strip_tac, t952, t951, t950, t949, t948, t947, @tactics.gen_tac, t946, t945, @tactics.all_tac, t944, @tactics.gen_tac, t943, t942, t941, t940, @tactics.all_tac, t939, @tactics.all_tac, t938, @tactics.disch_tac, t937, t936, t935, @tactics_ext.disch_all_tac, t934, @tactics.gen_tac, t933, t932, t931, t930, t929, t928, t927, @tactics_refine.label_all_tac, (x885 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.h_undisch_tac((x884 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x884), x885), @class.cond_cases_tac, t926, t925, @tactics.all_tac, t924, t923, @tactics_ext.disch_all_tac, t922, t921, t920, t919, t918, @tactics_ext.disch_all_tac, t917, t916, t915, t914, @tactics.beta_tac, t913, t912, t911, t910, @tactics.beta_tac, t909, t908, t907, t906, t905, t904, t903, @tactics.beta_tac, t902, t901, @tactics.ap_thm_tac, @tactics.ap_term_tac, t900, t899, @tactics.beta_tac, t898, t897, t896, t895])
  domain_insert_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : (A) -> Bool, ∀ b : (B) -> Bool, ∀ s : A, !IN(s, a) → (∃ F : ((A) -> B) -> ((A) -> B, B), BIJ(F, FUN(INSERT(s, a), b), {((u : (A) -> B), (v : B)) | IN(u, FUN(a, b)) && IN(v, b)}))"), t961))
}

///|
let domain_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOMAIN_INSERT")

///|
/// `DOMAIN_INSERT`
pub fn domain_insert() -> @kernel.Thm {
  domain_insert_c.get()
}

///|
/// CARD_DELETE_CHOICE
fn step_96() -> Unit raise {
  let t962 = @meson.asm_meson_tac(@list.List([@sets.has_size_0(), @sets.has_size()]))
  let t963 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("!((x : Num) == 0) → SUC(x - 1) == x")))
  let t964 = @simp.asm_simp_tac(@list.List([@sets.choice_def()]))
  let t965 = @simp.asm_simp_tac(@list.List([@sets.card_delete()]))
  let t966 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, t965, t964, t963, t962])
  card_delete_choice_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : (A) -> Bool, FINITE(a) && !(a == {}) → SUC(CARD(DELETE(a, CHOICE(a)))) == CARD(a)"), t966))
}

///|
let card_delete_choice_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_DELETE_CHOICE")

///|
/// `CARD_DELETE_CHOICE`
pub fn card_delete_choice() -> @kernel.Thm {
  card_delete_choice_c.get()
}

///|
/// Jordan/misc_defs_and_lemmas.ml:1615
fn step_97() -> Unit raise {
  {
    @tactics_refine.labels_flag().val = false
    ()
  }
}

///|
/// FUN_SIZE
fn step_98() -> Unit raise {
  let t1011 = @simp.rewrite_tac(@list.List([@arith.exp(), @arith.mult_ac()]))
  let t1012 = @simp.asm_simp_tac(@list.List([@sets.card_product()]))
  let t1013 = @tactics.pop_assum(fn(x1008 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1008
    let t1010 = @tactics.assume_tac(th_1)
    @tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([@sets.has_size()]))(th_1)), t1010)
  })
  let t1014 = @meson.asm_meson_tac(@list.List([@sets.card_delete()]))
  let t1015 = @tactics_ext.popl_tac(@list.List([1L, 2L, 3L, 4L, 5L, 10L, 11L]))
  let t1016 = @tactics.subgoal_then(@term_syntax.parse_term("HAS_SIZE(FUN(DELETE((a : (A) -> Bool), CHOICE(a)), (b : (B) -> Bool)), EXP(CARD(b), CARD(DELETE(a, CHOICE(a)))))"), fn(x1005 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1006 = @tactics.assume_tac(x1005)
    fn(x1007 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1006(x1007)
    }
  })
  let t1017 = @meson.asm_meson_tac(@list.List([@sets.finite_delete()]))
  let t1018 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE(DELETE((a : (A) -> Bool), CHOICE(a)))"), fn(x1002 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1003 = @tactics.assume_tac(x1002)
    fn(x1004 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1003(x1004)
    }
  })
  let t1019 = @simp.asm_rewrite_tac(@list.List([]))
  let t1020 = @simp.asm_rewrite_tac(@list.List([]))
  let t1021 = @tactics.exists_tac(@term_syntax.parse_term("(F' : ((A) -> B) -> ((A) -> B, B))"))
  let t1022 = @tactics.match_mp_tac(bij_card())
  let t1023 = @tactics.subgoal_then(@term_syntax.parse_term("CARD(FUN((a : (A) -> Bool), (b : (B) -> Bool))) == CARD({((u : (A) -> B), (v : B)) | IN(u, FUN(DELETE(a, CHOICE(a)), b)) && IN(v, b)})"), fn(x999 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1000 = @tactics.assume_tac(x999)
    fn(x1001 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1000(x1001)
    }
  })
  let t1024 = @simp.asm_rewrite_tac(@list.List([]))
  let t1025 = @meson.asm_meson_tac(@list.List([@sets.has_size()]))
  let t1026 = @simp.asm_rewrite_tac(@list.List([]))
  let t1027 = @tactics.match_mp_tac(@sets.finite_product())
  let t1028 = @simp.asm_rewrite_tac(@list.List([]))
  let t1029 = @tactics.exists_tac(@term_syntax.parse_term("(F' : ((A) -> B) -> ((A) -> B, B))"))
  let t1030 = @tactics.exists_tac(@term_syntax.parse_term("{((u : (A) -> B), (v : B)) | IN(u, FUN(DELETE((a : (A) -> Bool), CHOICE(a)), (b : (B) -> Bool))) && IN(v, b)}"))
  let t996 = @parser.parse_type("B")
  let t997 = (@parser.parse_type("(A->B)#B"), t996)
  let t995 = @parser.parse_type("A")
  let t998 = @bool.pinst(@list.List([(@parser.parse_type("A->B"), t995), t997]), @list.List([]), finite_bij2())
  let t1031 = @tactics.match_mp_tac(@bool.spec(@term_syntax.parse_term("FUN((a : (A) -> Bool), (b : (B) -> Bool))"), t998))
  let t1032 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE(FUN((a : (A) -> Bool), (b : (B) -> Bool)))"), fn(x992 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s993 = @tactics.assume_tac(x992)
    fn(x994 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s993(x994)
    }
  })
  let t1033 = @simp.rewrite_tac(@list.List([@sets.has_size()]))
  let t1034 = @tactics.disch_then(@tactics.choose_tac)
  let t1035 = @simp.asm_simp_tac(@list.List([@sets.insert_delete(), @sets.choice_def()]))
  let t1036 = @meson.asm_meson_tac(@list.List([]))
  let t1037 = @tactics.assume_tac(@int.arith_rule(@term_syntax.parse_term("∀ x : Num, x == SUC((n : Num)) → !(x == 0)")))
  let t1038 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.has_size_0()), @sets.has_size()]))
  let t1039 = @tactics.subgoal_then(@term_syntax.parse_term("!((a : (A) -> Bool) == {})"), fn(x989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s990 = @tactics.assume_tac(x989)
    fn(x991 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s990(x991)
    }
  })
  let t1040 = @simp.rewrite_tac(@list.List([@sets.in_delete()]))
  let t985 = @term_syntax.parse_term("CHOICE((a : (A) -> Bool))")
  let t986 = @term_syntax.parse_term("(b : (B) -> Bool)")
  let t1041 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("DELETE((a : (A) -> Bool), CHOICE(a))"), t986, t985]), domain_insert()))
  let t1042 = @meson.asm_meson_tac(@list.List([@sets.finite_delete()]))
  let t1043 = @tactics.subgoal_then(@term_syntax.parse_term("HAS_SIZE(FUN(DELETE((a : (A) -> Bool), CHOICE(a)), (b : (B) -> Bool)), EXP(CARD(b), CARD(DELETE(a, CHOICE(a)))))"), fn(x982 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s983 = @tactics.assume_tac(x982)
    fn(x984 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s983(x984)
    }
  })
  let t1044 = @tactics_ext.h_match_mp((x980 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("3", x980))((x981 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("4", x981))
  let t1045 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("∀ n : Num, SUC(n) - 1 == n"))]))
  let t1046 = @simp.asm_rewrite_tac(@list.List([]))
  let t1047 = @meson.asm_meson_tac(@list.List([]))
  let t1048 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.has_size_0()), @sets.has_size()]))
  let t1049 = @tactics.assume_tac(@int.arith_rule(@term_syntax.parse_term("∀ x : Num, x == SUC((n : Num)) → !(x == 0)")))
  let t1050 = @tactics.match_mp_tac(@sets.choice_def())
  let t1051 = @tactics.subgoal_then(@term_syntax.parse_term("IN(CHOICE((a : (A) -> Bool)), a)"), fn(x977 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s978 = @tactics.assume_tac(x977)
    fn(x979 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s978(x979)
    }
  })
  let t1052 = @simp.asm_simp_tac(@list.List([@sets.card_delete()]))
  let t1053 = @tactics.subgoal_then(@term_syntax.parse_term("CARD(DELETE((a : (A) -> Bool), CHOICE(a))) == (n : Num)"), fn(x974 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s975 = @tactics.assume_tac(x974)
    fn(x976 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s975(x976)
    }
  })
  let t1054 = @tactics.first_x_assum(fn(x972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x972
    @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("DELETE((a : (A) -> Bool), CHOICE(a))"), th))
  })
  let t1055 = @meson.meson_tac(@list.List([]))
  let t1056 = @simp.rewrite_tac(@list.List([@sets.sing()]))
  let t1057 = @tactics.match_mp_tac(card_sing())
  let t1058 = @simp.rewrite_tac(@list.List([finite_sing()]))
  let t1059 = @simp.asm_rewrite_tac(@list.List([@sets.has_size(), domain_empty()]))
  let t1060 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.has_size_0()), @sets.has_size()]))
  let t1061 = @tactics.subgoal_then(@term_syntax.parse_term("(a : (A) -> Bool) == {}"), fn(x969 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s970 = @tactics.assume_tac(x969)
    fn(x971 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s970(x971)
    }
  })
  let t1062 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t1063 = @simp.asm_rewrite_tac(@list.List([]))
  let t967 = @parser.parse_type("A")
  let t968 = @kernel.inst_type(@list.List([(@parser.parse_type("A->bool"), t967)]), num_intro())
  let t1064 = @list.List([@tactics.gen_tac, @tactics.match_mp_tac(@bool.spec(@term_syntax.parse_term("(CARD : ((A) -> Bool) -> Num)"), t968)), @nums.induct_tac, @tactics.gen_tac, @tactics_ext.disch_all_tac, t1063, t1062, t1061, t1060, t1059, @tactics.conj_tac, t1058, t1057, t1056, t1055, @tactics.gen_tac, t1054, @tactics_ext.disch_all_tac, t1053, t1052, t1051, t1050, t1049, t1048, t1047, t1046, t1045, @tactics_refine.label_all_tac, t1044, t1043, t1042, t1041, @tactics_refine.label_all_tac, (x988 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.h_undisch_tac((x987 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("5", x987), x988), t1040, t1039, t1038, t1037, t1036, t1035, t1034, t1033, t1032, @tactics.all_tac, t1031, t1030, t1029, t1028, t1027, t1026, t1025, t1024, t1023, t1022, t1021, t1020, @tactics.all_tac, t1019, t1018, t1017, t1016, t1015, t1014, t1013, t1012, t1011])
  fun_size_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ b : (B) -> Bool, ∀ a : (A) -> Bool, FINITE(a) && FINITE(b) → HAS_SIZE(FUN(a, b), EXP(CARD(b), CARD(a)))"), t1064))
}

///|
let fun_size_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUN_SIZE")

///|
/// `FUN_SIZE`
pub fn fun_size() -> @kernel.Thm {
  fun_size_c.get()
}

///|
/// Jordan/misc_defs_and_lemmas.ml:1692
fn step_99() -> Unit raise {
  {
    @tactics_refine.labels_flag().val = true
    ()
  }
}

///|
/// drop0
fn step_100() -> Unit raise {
  drop0_c.set(@pair.new_definition(@term_syntax.parse_term("(drop0 : ((A, B)) -> B)((u : (A, B))) == SND(u)")))
}

///|
let drop0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("drop0")

///|
/// `drop0`
pub fn drop0() -> @kernel.Thm {
  drop0_c.get()
}

///|
/// drop1
fn step_101() -> Unit raise {
  drop1_c.set(@pair.new_definition(@term_syntax.parse_term("(drop1 : ((A, B, C)) -> C)((u : (A, B, C))) == SND(SND(u))")))
}

///|
let drop1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("drop1")

///|
/// `drop1`
pub fn drop1() -> @kernel.Thm {
  drop1_c.get()
}

///|
/// drop2
fn step_102() -> Unit raise {
  drop2_c.set(@pair.new_definition(@term_syntax.parse_term("(drop2 : ((A, B, C, D)) -> D)((u : (A, B, C, D))) == SND(SND(SND(u)))")))
}

///|
let drop2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("drop2")

///|
/// `drop2`
pub fn drop2() -> @kernel.Thm {
  drop2_c.get()
}

///|
/// drop3
fn step_103() -> Unit raise {
  drop3_c.set(@pair.new_definition(@term_syntax.parse_term("(drop3 : ((A, B, C, D, E)) -> E)((u : (A, B, C, D, E))) == SND(SND(SND(SND(u))))")))
}

///|
let drop3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("drop3")

///|
/// `drop3`
pub fn drop3() -> @kernel.Thm {
  drop3_c.get()
}

///|
/// part0
fn step_104() -> Unit raise {
  part0_c.set(@pair.new_definition(@term_syntax.parse_term("(part0 : ((A, B)) -> A)((u : (A, B))) == FST(u)")))
}

///|
let part0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("part0")

///|
/// `part0`
pub fn part0() -> @kernel.Thm {
  part0_c.get()
}

///|
/// part1
fn step_105() -> Unit raise {
  part1_c.set(@pair.new_definition(@term_syntax.parse_term("(part1 : ((A, B, C)) -> B)((u : (A, B, C))) == FST(drop0(u))")))
}

///|
let part1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("part1")

///|
/// `part1`
pub fn part1() -> @kernel.Thm {
  part1_c.get()
}

///|
/// part2
fn step_106() -> Unit raise {
  part2_c.set(@pair.new_definition(@term_syntax.parse_term("(part2 : ((A, B, C, D)) -> C)((u : (A, B, C, D))) == FST(drop1(u))")))
}

///|
let part2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("part2")

///|
/// `part2`
pub fn part2() -> @kernel.Thm {
  part2_c.get()
}

///|
/// part3
fn step_107() -> Unit raise {
  part3_c.set(@pair.new_definition(@term_syntax.parse_term("(part3 : ((A, B, C, D, E)) -> D)((u : (A, B, C, D, E))) == FST(drop2(u))")))
}

///|
let part3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("part3")

///|
/// `part3`
pub fn part3() -> @kernel.Thm {
  part3_c.get()
}

///|
/// part4
fn step_108() -> Unit raise {
  part4_c.set(@pair.new_definition(@term_syntax.parse_term("(part4 : ((A, B, C, D, E, F)) -> E)((u : (A, B, C, D, E, F))) == FST(drop3(u))")))
}

///|
let part4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("part4")

///|
/// `part4`
pub fn part4() -> @kernel.Thm {
  part4_c.get()
}

///|
/// part5
fn step_109() -> Unit raise {
  part5_c.set(@pair.new_definition(@term_syntax.parse_term("(part5 : ((A, B, C, D, E, F, G)) -> F)((u : (A, B, C, D, E, F, G))) == FST(SND(SND(SND(SND(SND(u))))))")))
}

///|
let part5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("part5")

///|
/// `part5`
pub fn part5() -> @kernel.Thm {
  part5_c.get()
}

///|
/// part6
fn step_110() -> Unit raise {
  part6_c.set(@pair.new_definition(@term_syntax.parse_term("(part6 : ((A, B, C, D, E, F, G, H)) -> G)((u : (A, B, C, D, E, F, G, H))) == FST(SND(SND(SND(SND(SND(SND(u)))))))")))
}

///|
let part6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("part6")

///|
/// `part6`
pub fn part6() -> @kernel.Thm {
  part6_c.get()
}

///|
/// part7
fn step_111() -> Unit raise {
  part7_c.set(@pair.new_definition(@term_syntax.parse_term("(part7 : ((A, B, C, D, E, F, G, H, I)) -> H)((u : (A, B, C, D, E, F, G, H, I))) == FST(SND(SND(SND(SND(SND(SND(SND(u))))))))")))
}

///|
let part7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("part7")

///|
/// `part7`
pub fn part7() -> @kernel.Thm {
  part7_c.get()
}

///|
/// euclid_def
fn step_112() -> Unit raise {
  euclid_def_c.set((x1065 : @kernel.Term) => @lib_ext.local_definition("euclid", x1065))
}

///|
let euclid_def_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("euclid_def")

///|
/// `euclid_def`
pub fn euclid_def(x : @kernel.Term) -> @kernel.Thm raise {
  (euclid_def_c.get())(x)
}

///|
/// Jordan/misc_defs_and_lemmas.ml:1733
fn step_113() -> Unit raise {
  ignore(@lib_ext.mk_local_interface("euclid"))
}

///|
/// Jordan/misc_defs_and_lemmas.ml:1735
fn step_114() -> Unit raise {
  @preterm.overload_interface("+", @term_syntax.parse_term("(euclid_euclid_plus : ((Num) -> Real, (Num) -> Real, Num) -> Real)"))
}

///|
/// Jordan/misc_defs_and_lemmas.ml:1738
fn step_115() -> Unit raise {
  @preterm.make_overloadable("*#", @parser.parse_type("A -> B -> B"))
}

///|
/// euclid_scale
fn step_116() -> Unit raise {
  euclid_scale_c.set(euclid_def(@term_syntax.parse_term("(euclid_scale : (Real, (Num) -> Real, Num) -> Real)((t : Real), (f : (Num) -> Real)) == ((i : Num) => t * f(i))")))
}

///|
let euclid_scale_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euclid_scale")

///|
/// `euclid_scale`
pub fn euclid_scale() -> @kernel.Thm {
  euclid_scale_c.get()
}

///|
/// Jordan/misc_defs_and_lemmas.ml:1743
fn step_117() -> Unit raise {
  @preterm.overload_interface("*#", @term_syntax.parse_term("euclid_euclid_scale"))
}

///|
/// Jordan/misc_defs_and_lemmas.ml:1745
fn step_118() -> Unit raise {
  @printer.parse_as_infix("*#", (20L, "right"))
}

///|
/// euclid_neg
fn step_119() -> Unit raise {
  euclid_neg_c.set(euclid_def(@term_syntax.parse_term("(euclid_neg : ((Num) -> Real, Num) -> Real)((f : (Num) -> Real)) == ((i : Num) => -f(i))")))
}

///|
let euclid_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euclid_neg")

///|
/// `euclid_neg`
pub fn euclid_neg() -> @kernel.Thm {
  euclid_neg_c.get()
}

///|
/// Jordan/misc_defs_and_lemmas.ml:1751
fn step_120() -> Unit raise {
  @preterm.overload_interface("--", @term_syntax.parse_term("euclid_euclid_neg"))
}

///|
/// Jordan/misc_defs_and_lemmas.ml:1753
fn step_121() -> Unit raise {
  @preterm.overload_interface("-", @term_syntax.parse_term("(euclid_euclid_minus : ((Num) -> Real, (Num) -> Real, Num) -> Real)"))
}

///|
/// euclid_plus
fn step_122() -> Unit raise {
  euclid_plus_c.set(euclid_def(@term_syntax.parse_term("(euclid_plus : ((Num) -> Real, (Num) -> Real, Num) -> Real)((f : (Num) -> Real), (g : (Num) -> Real)) == ((i : Num) => f(i) + g(i))")))
}

///|
let euclid_plus_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euclid_plus")

///|
/// `euclid_plus`
pub fn euclid_plus() -> @kernel.Thm {
  euclid_plus_c.get()
}

///|
/// euclid
fn step_123() -> Unit raise {
  euclid_c.set(euclid_def(@term_syntax.parse_term("(euclid : (Num, (Num) -> Real) -> Bool)((n : Num), (v : (Num) -> Real)) == (∀ m : Num, n <= m → v(m) == real_of_num(0))")))
}

///|
let euclid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euclid")

///|
/// `euclid`
pub fn euclid() -> @kernel.Thm {
  euclid_c.get()
}

///|
/// euclidean
fn step_124() -> Unit raise {
  euclidean_c.set(euclid_def(@term_syntax.parse_term("(euclidean : ((Num) -> Real) -> Bool)((v : (Num) -> Real)) == (∃ n : Num, euclid_euclid(n, v))")))
}

///|
let euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euclidean")

///|
/// `euclidean`
pub fn euclidean() -> @kernel.Thm {
  euclidean_c.get()
}

///|
/// euclid_minus
fn step_125() -> Unit raise {
  euclid_minus_c.set(euclid_def(@term_syntax.parse_term("(euclid_minus : ((Num) -> Real, (Num) -> Real, Num) -> Real)((f : (Num) -> Real), (g : (Num) -> Real)) == ((i : Num) => f(i) - g(i))")))
}

///|
let euclid_minus_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euclid_minus")

///|
/// `euclid_minus`
pub fn euclid_minus() -> @kernel.Thm {
  euclid_minus_c.get()
}

///|
/// euclid0
fn step_126() -> Unit raise {
  euclid0_c.set(euclid_def(@term_syntax.parse_term("(euclid0 : (Num) -> Real) == ((i : Num) => real_of_num(0))")))
}

///|
let euclid0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euclid0")

///|
/// `euclid0`
pub fn euclid0() -> @kernel.Thm {
  euclid0_c.get()
}

///|
/// coord
fn step_127() -> Unit raise {
  coord_c.set(euclid_def(@term_syntax.parse_term("(coord : (Num, (Num) -> Real) -> Real)((i : Num), (f : (Num) -> Real)) == f(i)")))
}

///|
let coord_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("coord")

///|
/// `coord`
pub fn coord() -> @kernel.Thm {
  coord_c.get()
}

///|
/// dot
fn step_128() -> Unit raise {
  dot_c.set(euclid_def(@term_syntax.parse_term("(dot : ((Num) -> Real, (Num) -> Real) -> Real)((f : (Num) -> Real), (g : (Num) -> Real)) == LET((n : Num) => LET_END(sum((0, n), (i : Num) => f(i) * g(i))), min_num((m : Num) => euclid_euclid(m, f) && euclid_euclid(m, g)))")))
}

///|
let dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dot")

///|
/// `dot`
pub fn dot() -> @kernel.Thm {
  dot_c.get()
}

///|
/// norm
fn step_129() -> Unit raise {
  norm_c.set(euclid_def(@term_syntax.parse_term("(norm : ((Num) -> Real) -> Real)((f : (Num) -> Real)) == sqrt(euclid_dot(f, f))")))
}

///|
let norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("norm")

///|
/// `norm`
pub fn norm() -> @kernel.Thm {
  norm_c.get()
}

///|
/// d_euclid
fn step_130() -> Unit raise {
  d_euclid_c.set(euclid_def(@term_syntax.parse_term("(d_euclid : ((Num) -> Real, (Num) -> Real) -> Real)((f : (Num) -> Real), (g : (Num) -> Real)) == euclid_norm(f - g)")))
}

///|
let d_euclid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("d_euclid")

///|
/// `d_euclid`
pub fn d_euclid() -> @kernel.Thm {
  d_euclid_c.get()
}

///|
/// sum_vector_EXISTS
fn step_131() -> Unit raise {
  let t1068 = @simp.asm_rewrite_tac(@list.List([]))
  let t1069 = @tactics.conv_tac(@equal.depth_conv(@pair.gen_beta_conv))
  let t1070 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num), (Num, Num) -> Real, Num) -> Real) => ∀ n : Num, ∀ m : Num, GEQ(f((n, m)), (f : (Num, Num) -> Real) => (sm : (Num, Num, (Num, Num) -> Real, Num) -> Real)(n, m, f)))"))
  let t1066 = @term_syntax.parse_term("(∀ f : (Num, Num) -> Real, ∀ n : Num, (sm : (Num, Num, (Num, Num) -> Real, Num) -> Real)(n, 0, f) == ((n : Num) => real_of_num(0))) && (∀ f : (Num, Num) -> Real, ∀ m : Num, ∀ n : Num, sm(n, SUC(m), f) == sm(n, m, f) + f(n + m))")
  let t1067 = @recursion.prove_recursive_functions_exist(@nums.num_recursion())
  let t1071 = @list.List([@tactics.choose_tac(t1067(t1066)), t1070, t1069, t1068])
  sum_vector_exists_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∃ sum_vector : ((Num, Num), (Num, Num) -> Real, Num) -> Real, (∀ f : (Num, Num) -> Real, ∀ n : Num, sum_vector((n, 0), f) == ((n : Num) => real_of_num(0))) && (∀ f : (Num, Num) -> Real, ∀ m : Num, ∀ n : Num, sum_vector((n, SUC(m)), f) == sum_vector((n, m), f) + f(n + m))"), t1071))
}

///|
let sum_vector_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sum_vector_EXISTS")

///|
/// `sum_vector_EXISTS`
pub fn sum_vector_exists() -> @kernel.Thm {
  sum_vector_exists_c.get()
}

///|
/// sum_vector
fn step_132() -> Unit raise {
  sum_vector_c.set(@nums.new_specification(@list.List(["sum_vector"]))(sum_vector_exists()))
}

///|
let sum_vector_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sum_vector")

///|
/// `sum_vector`
pub fn sum_vector() -> @kernel.Thm {
  sum_vector_c.get()
}

///|
/// mk_segment
fn step_133() -> Unit raise {
  mk_segment_c.set(euclid_def(@term_syntax.parse_term("(mk_segment : ((Num) -> Real, (Num) -> Real, (Num) -> Real) -> Bool)((x : (Num) -> Real), (y : (Num) -> Real)) == {(u : (Num) -> Real) | ∃ a : Real, real_of_num(0) <= a && a <= real_of_num(1) && u == euclid_euclid_scale(a, x) + euclid_euclid_scale(real_of_num(1) - a, y)}")))
}

///|
let mk_segment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_segment")

///|
/// `mk_segment`
pub fn mk_segment() -> @kernel.Thm {
  mk_segment_c.get()
}

///|
/// mk_open_segment
fn step_134() -> Unit raise {
  mk_open_segment_c.set(euclid_def(@term_syntax.parse_term("(mk_open_segment : ((Num) -> Real, (Num) -> Real, (Num) -> Real) -> Bool)((x : (Num) -> Real), (y : (Num) -> Real)) == {(u : (Num) -> Real) | ∃ a : Real, real_of_num(0) < a && a < real_of_num(1) && u == euclid_euclid_scale(a, x) + euclid_euclid_scale(real_of_num(1) - a, y)}")))
}

///|
let mk_open_segment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_open_segment")

///|
/// `mk_open_segment`
pub fn mk_open_segment() -> @kernel.Thm {
  mk_open_segment_c.get()
}

///|
/// convex
fn step_135() -> Unit raise {
  convex_c.set(euclid_def(@term_syntax.parse_term("(convex : (((Num) -> Real) -> Bool) -> Bool)((S : ((Num) -> Real) -> Bool)) == (∀ x : (Num) -> Real, ∀ y : (Num) -> Real, S(x) && S(y) → SUBSET(euclid_mk_segment(x, y), S))")))
}

///|
let convex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("convex")

///|
/// `convex`
pub fn convex() -> @kernel.Thm {
  convex_c.get()
}

///|
/// convex_hull
fn step_136() -> Unit raise {
  convex_hull_c.set(euclid_def(@term_syntax.parse_term("(convex_hull : (((Num) -> Real) -> Bool, (Num) -> Real) -> Bool)((S : ((Num) -> Real) -> Bool)) == {(u : (Num) -> Real) | ∃ f : (Num, Num) -> Real, ∃ alpha : (Num) -> Real, ∃ m : Num, (∀ n : Num, n < m → S(f(n))) && sum((0, m), alpha) == real_of_num(1) && (∀ n : Num, n < m → real_of_num(0) <= alpha(n)) && u == sum_vector((0, m), (n : Num) => euclid_euclid_scale(alpha(n), f(n)))}")))
}

///|
let convex_hull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("convex_hull")

///|
/// `convex_hull`
pub fn convex_hull() -> @kernel.Thm {
  convex_hull_c.get()
}

///|
/// affine_hull
fn step_137() -> Unit raise {
  affine_hull_c.set(euclid_def(@term_syntax.parse_term("(affine_hull : (((Num) -> Real) -> Bool, (Num) -> Real) -> Bool)((S : ((Num) -> Real) -> Bool)) == {(u : (Num) -> Real) | ∃ f : (Num, Num) -> Real, ∃ alpha : (Num) -> Real, ∃ m : Num, (∀ n : Num, n < m → S(f(n))) && sum((0, m), alpha) == real_of_num(1) && u == sum_vector((0, m), (n : Num) => euclid_euclid_scale(alpha(n), f(n)))}")))
}

///|
let affine_hull_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("affine_hull")

///|
/// `affine_hull`
pub fn affine_hull() -> @kernel.Thm {
  affine_hull_c.get()
}

///|
/// mk_line
fn step_138() -> Unit raise {
  mk_line_c.set(euclid_def(@term_syntax.parse_term("(mk_line : ((Num) -> Real, (Num) -> Real, (Num) -> Real) -> Bool)((x : (Num) -> Real), (y : (Num) -> Real)) == {(z : (Num) -> Real) | ∃ t : Real, z == euclid_euclid_scale(t, x) + euclid_euclid_scale(real_of_num(1) - t, y)}")))
}

///|
let mk_line_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_line")

///|
/// `mk_line`
pub fn mk_line() -> @kernel.Thm {
  mk_line_c.get()
}

///|
/// affine
fn step_139() -> Unit raise {
  affine_c.set(euclid_def(@term_syntax.parse_term("(affine : (((Num) -> Real) -> Bool) -> Bool)((S : ((Num) -> Real) -> Bool)) == (∀ x : (Num) -> Real, ∀ y : (Num) -> Real, S(x) && S(y) → SUBSET(euclid_mk_line(x, y), S))")))
}

///|
let affine_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("affine")

///|
/// `affine`
pub fn affine() -> @kernel.Thm {
  affine_c.get()
}

///|
/// affine_dim
fn step_140() -> Unit raise {
  affine_dim_c.set(euclid_def(@term_syntax.parse_term("(affine_dim : (Num, ((Num) -> Real) -> Bool) -> Bool)((n : Num), (S : ((Num) -> Real) -> Bool)) == ((∃ T : ((Num) -> Real) -> Bool, HAS_SIZE(T, SUC(n)) && euclid_affine_hull(T) == euclid_affine_hull(S)) && (∀ T : ((Num) -> Real) -> Bool, ∀ m : Num, HAS_SIZE(T, SUC(m)) && m < n → !(euclid_affine_hull(T) == euclid_affine_hull(S))))")))
}

///|
let affine_dim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("affine_dim")

///|
/// `affine_dim`
pub fn affine_dim() -> @kernel.Thm {
  affine_dim_c.get()
}

///|
/// collinear
fn step_141() -> Unit raise {
  collinear_c.set(euclid_def(@term_syntax.parse_term("(collinear : (((Num) -> Real) -> Bool) -> Bool)((S : ((Num) -> Real) -> Bool)) == (∃ n : Num, euclid_affine_dim(n, S) && n < 2)")))
}

///|
let collinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("collinear")

///|
/// `collinear`
pub fn collinear() -> @kernel.Thm {
  collinear_c.get()
}

///|
/// coplanar
fn step_142() -> Unit raise {
  coplanar_c.set(euclid_def(@term_syntax.parse_term("(coplanar : (((Num) -> Real) -> Bool) -> Bool)((S : ((Num) -> Real) -> Bool)) == (∃ n : Num, euclid_affine_dim(n, S) && n < 3)")))
}

///|
let coplanar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("coplanar")

///|
/// `coplanar`
pub fn coplanar() -> @kernel.Thm {
  coplanar_c.get()
}

///|
/// line
fn step_143() -> Unit raise {
  line_c.set(euclid_def(@term_syntax.parse_term("(line : (((Num) -> Real) -> Bool) -> Bool)((L : ((Num) -> Real) -> Bool)) == (euclid_affine(L) && euclid_affine_dim(1, L))")))
}

///|
let line_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("line")

///|
/// `line`
pub fn line() -> @kernel.Thm {
  line_c.get()
}

///|
/// plane
fn step_144() -> Unit raise {
  plane_c.set(euclid_def(@term_syntax.parse_term("(plane : (((Num) -> Real) -> Bool) -> Bool)((P : ((Num) -> Real) -> Bool)) == (euclid_affine(P) && euclid_affine_dim(2, P))")))
}

///|
let plane_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("plane")

///|
/// `plane`
pub fn plane() -> @kernel.Thm {
  plane_c.get()
}

///|
/// space
fn step_145() -> Unit raise {
  space_c.set(euclid_def(@term_syntax.parse_term("(space : (((Num) -> Real) -> Bool) -> Bool)((R : ((Num) -> Real) -> Bool)) == (euclid_affine(R) && euclid_affine_dim(3, R))")))
}

///|
let space_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("space")

///|
/// `space`
pub fn space() -> @kernel.Thm {
  space_c.get()
}

///|
/// mk_open_half_set
fn step_146() -> Unit raise {
  mk_open_half_set_c.set(euclid_def(@term_syntax.parse_term("(mk_open_half_set : (((Num) -> Real) -> Bool, ((Num) -> Real) -> Bool, (Num) -> Real) -> Bool)((L : ((Num) -> Real) -> Bool), (S : ((Num) -> Real) -> Bool)) == {(u : (Num) -> Real) | ∃ t : Real, ∃ v : (Num) -> Real, ∃ c : (Num) -> Real, L(v) && S(c) && real_of_num(0) < t && u == euclid_euclid_scale(t, c - v) + euclid_euclid_scale(real_of_num(1) - t, v)}")))
}

///|
let mk_open_half_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_open_half_set")

///|
/// `mk_open_half_set`
pub fn mk_open_half_set() -> @kernel.Thm {
  mk_open_half_set_c.get()
}

///|
/// mk_half_set
fn step_147() -> Unit raise {
  mk_half_set_c.set(euclid_def(@term_syntax.parse_term("(mk_half_set : (((Num) -> Real) -> Bool, ((Num) -> Real) -> Bool, (Num) -> Real) -> Bool)((L : ((Num) -> Real) -> Bool), (S : ((Num) -> Real) -> Bool)) == {(u : (Num) -> Real) | ∃ t : Real, ∃ v : (Num) -> Real, ∃ c : (Num) -> Real, L(v) && S(c) && real_of_num(0) <= t && u == euclid_euclid_scale(t, c - v) + euclid_euclid_scale(real_of_num(1) - t, v)}")))
}

///|
let mk_half_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_half_set")

///|
/// `mk_half_set`
pub fn mk_half_set() -> @kernel.Thm {
  mk_half_set_c.get()
}

///|
/// mk_angle
fn step_148() -> Unit raise {
  mk_angle_c.set(euclid_def(@term_syntax.parse_term("(mk_angle : ((Num) -> Real, (Num) -> Real, (Num) -> Real, (Num) -> Real) -> Bool)((x : (Num) -> Real), (y : (Num) -> Real), (z : (Num) -> Real)) == UNION(euclid_mk_half_set({x}, {y}), euclid_mk_half_set({x}, {z}))")))
}

///|
let mk_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_angle")

///|
/// `mk_angle`
pub fn mk_angle() -> @kernel.Thm {
  mk_angle_c.get()
}

///|
/// mk_signed_angle
fn step_149() -> Unit raise {
  mk_signed_angle_c.set(euclid_def(@term_syntax.parse_term("(mk_signed_angle : ((Num) -> Real, (Num) -> Real, (Num) -> Real) -> (((Num) -> Real) -> Bool, ((Num) -> Real) -> Bool))((x : (Num) -> Real), (y : (Num) -> Real), (z : (Num) -> Real)) == (euclid_mk_half_set({x}, {y}), euclid_mk_half_set({x}, {z}))")))
}

///|
let mk_signed_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_signed_angle")

///|
/// `mk_signed_angle`
pub fn mk_signed_angle() -> @kernel.Thm {
  mk_signed_angle_c.get()
}

///|
/// mk_convex_cone
fn step_150() -> Unit raise {
  mk_convex_cone_c.set(euclid_def(@term_syntax.parse_term("(mk_convex_cone : ((Num) -> Real, ((Num) -> Real) -> Bool, (Num) -> Real) -> Bool)((v : (Num) -> Real), (S : ((Num) -> Real) -> Bool)) == euclid_mk_half_set({v}, euclid_convex_hull(S))")))
}

///|
let mk_convex_cone_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_convex_cone")

///|
/// `mk_convex_cone`
pub fn mk_convex_cone() -> @kernel.Thm {
  mk_convex_cone_c.get()
}

///|
/// packing
fn step_151() -> Unit raise {
  packing_c.set(euclid_def(@term_syntax.parse_term("(packing : (((Num) -> Real) -> Bool) -> Bool)((S : ((Num) -> Real) -> Bool)) == (∀ x : (Num) -> Real, ∀ y : (Num) -> Real, S(x) && S(y) && euclid_d_euclid(x, y) < real_of_num(2) → x == y)")))
}

///|
let packing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("packing")

///|
/// `packing`
pub fn packing() -> @kernel.Thm {
  packing_c.get()
}

///|
/// saturated_packing
fn step_152() -> Unit raise {
  saturated_packing_c.set(euclid_def(@term_syntax.parse_term("(saturated_packing : (((Num) -> Real) -> Bool) -> Bool)((S : ((Num) -> Real) -> Bool)) == (euclid_packing(S) && (∀ z : (Num) -> Real, euclid_affine_hull(S, z) → (∃ x : (Num) -> Real, S(x) && euclid_d_euclid(x, z) < real_of_num(2))))")))
}

///|
let saturated_packing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("saturated_packing")

///|
/// `saturated_packing`
pub fn saturated_packing() -> @kernel.Thm {
  saturated_packing_c.get()
}

///|
/// cross_product3
fn step_153() -> Unit raise {
  cross_product3_c.set(euclid_def(@term_syntax.parse_term("(cross_product3 : ((Num) -> Real, (Num) -> Real, Num) -> Real)((v1 : (Num) -> Real), (v2 : (Num) -> Real)) == LET((x1 : Real) => (x2 : Real) => (x3 : Real) => LET_END(LET((y1 : Real) => (y2 : Real) => (y3 : Real) => LET_END((k : Num) => if k == 0 { x2 * y3 - x3 * y2 } else { if k == 1 { x3 * y1 - x1 * y3 } else { if k == 2 { x1 * y2 - x2 * y1 } else { real_of_num(0) } } }), v2(0), v2(1), v2(2))), v1(0), v1(1), v1(2))")))
}

///|
let cross_product3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cross_product3")

///|
/// `cross_product3`
pub fn cross_product3() -> @kernel.Thm {
  cross_product3_c.get()
}

///|
/// triple_product
fn step_154() -> Unit raise {
  triple_product_c.set(euclid_def(@term_syntax.parse_term("(triple_product : ((Num) -> Real, (Num) -> Real, (Num) -> Real) -> Real)((v1 : (Num) -> Real), (v2 : (Num) -> Real), (v3 : (Num) -> Real)) == euclid_dot(v1, euclid_cross_product3(v2, v3))")))
}

///|
let triple_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("triple_product")

///|
/// `triple_product`
pub fn triple_product() -> @kernel.Thm {
  triple_product_c.get()
}

///|
/// mk_triangle
fn step_155() -> Unit raise {
  mk_triangle_c.set(euclid_def(@term_syntax.parse_term("(mk_triangle : ((Num) -> Real, (Num) -> Real, (Num) -> Real, (Num) -> Real) -> Bool)((v1 : (Num) -> Real), (v2 : (Num) -> Real), (v3 : (Num) -> Real)) == UNION(euclid_mk_segment(v1, v2), UNION(euclid_mk_segment(v2, v3), euclid_mk_segment(v3, v1)))")))
}

///|
let mk_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_triangle")

///|
/// `mk_triangle`
pub fn mk_triangle() -> @kernel.Thm {
  mk_triangle_c.get()
}

///|
/// mk_interior_triangle
fn step_156() -> Unit raise {
  mk_interior_triangle_c.set(euclid_def(@term_syntax.parse_term("(mk_interior_triangle : ((Num) -> Real, (Num) -> Real, (Num) -> Real, (Num) -> Real) -> Bool)((v1 : (Num) -> Real), (v2 : (Num) -> Real), (v3 : (Num) -> Real)) == INTER(euclid_mk_open_half_set(euclid_mk_line(v1, v2), {v3}), INTER(euclid_mk_open_half_set(euclid_mk_line(v2, v3), {v1}), euclid_mk_open_half_set(euclid_mk_line(v3, v1), {v2})))")))
}

///|
let mk_interior_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_interior_triangle")

///|
/// `mk_interior_triangle`
pub fn mk_interior_triangle() -> @kernel.Thm {
  mk_interior_triangle_c.get()
}

///|
/// mk_triangular_region
fn step_157() -> Unit raise {
  mk_triangular_region_c.set(euclid_def(@term_syntax.parse_term("(mk_triangular_region : ((Num) -> Real, (Num) -> Real, (Num) -> Real, (Num) -> Real) -> Bool)((v1 : (Num) -> Real), (v2 : (Num) -> Real), (v3 : (Num) -> Real)) == UNION(euclid_mk_triangle(v1, v2, v3), euclid_mk_interior_triangle(v1, v2, v3))")))
}

///|
let mk_triangular_region_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_triangular_region")

///|
/// `mk_triangular_region`
pub fn mk_triangular_region() -> @kernel.Thm {
  mk_triangular_region_c.get()
}

///|
/// half_set_convex
fn step_158() -> Unit raise {
  half_set_convex_c.set(@term_syntax.parse_term("∀ L : ((Num) -> Real) -> Bool, ∀ S : ((Num) -> Real) -> Bool, euclid_convex(euclid_mk_half_set(L, S))"))
}

///|
let half_set_convex_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("half_set_convex")

///|
/// `half_set_convex`
pub fn half_set_convex() -> @kernel.Term {
  half_set_convex_c.get()
}

///|
/// open_half_set_convex
fn step_159() -> Unit raise {
  open_half_set_convex_c.set(@term_syntax.parse_term("∀ L : ((Num) -> Real) -> Bool, ∀ S : ((Num) -> Real) -> Bool, euclid_convex(euclid_mk_open_half_set(L, S))"))
}

///|
let open_half_set_convex_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("open_half_set_convex")

///|
/// `open_half_set_convex`
pub fn open_half_set_convex() -> @kernel.Term {
  open_half_set_convex_c.get()
}

///|
/// affine_dim0
fn step_160() -> Unit raise {
  affine_dim0_c.set(@term_syntax.parse_term("∀ S : ((Num) -> Real) -> Bool, euclid_affine_dim(0, S) == SING(S)"))
}

///|
let affine_dim0_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("affine_dim0")

///|
/// `affine_dim0`
pub fn affine_dim0() -> @kernel.Term {
  affine_dim0_c.get()
}

///|
/// hull_convex
fn step_161() -> Unit raise {
  hull_convex_c.set(@term_syntax.parse_term("∀ S : ((Num) -> Real) -> Bool, euclid_convex(euclid_convex_hull(S))"))
}

///|
let hull_convex_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("hull_convex")

///|
/// `hull_convex`
pub fn hull_convex() -> @kernel.Term {
  hull_convex_c.get()
}

///|
/// hull_minimal
fn step_162() -> Unit raise {
  hull_minimal_c.set(@term_syntax.parse_term("∀ S : ((Num) -> Real) -> Bool, ∀ T : ((Num) -> Real) -> Bool, euclid_convex(T) && SUBSET(S, T) → SUBSET(euclid_convex_hull(S), T)"))
}

///|
let hull_minimal_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("hull_minimal")

///|
/// `hull_minimal`
pub fn hull_minimal() -> @kernel.Term {
  hull_minimal_c.get()
}

///|
/// affine_hull_affine
fn step_163() -> Unit raise {
  affine_hull_affine_c.set(@term_syntax.parse_term("∀ S : ((Num) -> Real) -> Bool, euclid_affine(euclid_affine_hull(S))"))
}

///|
let affine_hull_affine_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("affine_hull_affine")

///|
/// `affine_hull_affine`
pub fn affine_hull_affine() -> @kernel.Term {
  affine_hull_affine_c.get()
}

///|
/// affine_hull_minimal
fn step_164() -> Unit raise {
  affine_hull_minimal_c.set(@term_syntax.parse_term("∀ S : ((Num) -> Real) -> Bool, ∀ T : ((Num) -> Real) -> Bool, euclid_affine(T) && SUBSET(S, T) → SUBSET(euclid_affine_hull(S), T)"))
}

///|
let affine_hull_minimal_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("affine_hull_minimal")

///|
/// `affine_hull_minimal`
pub fn affine_hull_minimal() -> @kernel.Term {
  affine_hull_minimal_c.get()
}

///|
/// mk_line_dim
fn step_165() -> Unit raise {
  mk_line_dim_c.set(@term_syntax.parse_term("∀ x : (Num) -> Real, ∀ y : (Num) -> Real, !(x == y) → euclid_affine_dim(1, euclid_mk_line(x, y))"))
}

///|
let mk_line_dim_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("mk_line_dim")

///|
/// `mk_line_dim`
pub fn mk_line_dim() -> @kernel.Term {
  mk_line_dim_c.get()
}

///|
/// affine_convex_hull
fn step_166() -> Unit raise {
  affine_convex_hull_c.set(@term_syntax.parse_term("∀ S : ((Num) -> Real) -> Bool, euclid_affine_hull(S) == euclid_affine_hull(euclid_convex_hull(S))"))
}

///|
let affine_convex_hull_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("affine_convex_hull")

///|
/// `affine_convex_hull`
pub fn affine_convex_hull() -> @kernel.Term {
  affine_convex_hull_c.get()
}

///|
/// convex_hull_hull
fn step_167() -> Unit raise {
  convex_hull_hull_c.set(@term_syntax.parse_term("∀ S : ((Num) -> Real) -> Bool, euclid_convex_hull(S) == euclid_convex_hull(euclid_convex_hull(S))"))
}

///|
let convex_hull_hull_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("convex_hull_hull")

///|
/// `convex_hull_hull`
pub fn convex_hull_hull() -> @kernel.Term {
  convex_hull_hull_c.get()
}

///|
/// euclid_affine_dim
fn step_168() -> Unit raise {
  euclid_affine_dim_c.set(@term_syntax.parse_term("∀ n : Num, euclid_affine_dim(n, euclid_euclid(n))"))
}

///|
let euclid_affine_dim_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("euclid_affine_dim")

///|
/// `euclid_affine_dim`
pub fn euclid_affine_dim() -> @kernel.Term {
  euclid_affine_dim_c.get()
}

///|
/// affine_dim_subset
fn step_169() -> Unit raise {
  affine_dim_subset_c.set(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ T : ((Num) -> Real) -> Bool, ∀ S : ((Num) -> Real) -> Bool, euclid_affine_dim(m, T) && euclid_affine_dim(n, S) && SUBSET(T, S) → m <= n"))
}

///|
let affine_dim_subset_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("affine_dim_subset")

///|
/// `affine_dim_subset`
pub fn affine_dim_subset() -> @kernel.Term {
  affine_dim_subset_c.get()
}

///|
/// line_postulate
fn step_170() -> Unit raise {
  line_postulate_c.set(@term_syntax.parse_term("∀ x : (Num) -> Real, ∀ y : (Num) -> Real, !(x == y) → existsunique((L : ((Num) -> Real) -> Bool) => L(x) && L(y) && euclid_line(L))"))
}

///|
let line_postulate_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("line_postulate")

///|
/// `line_postulate`
pub fn line_postulate() -> @kernel.Term {
  line_postulate_c.get()
}

///|
/// ruler_postulate
fn step_171() -> Unit raise {
  ruler_postulate_c.set(@term_syntax.parse_term("∀ L : ((Num) -> Real) -> Bool, euclid_line(L) → (∃ f : ((Num) -> Real) -> Real, BIJ(f, L, UNIV) && (∀ x : (Num) -> Real, ∀ y : (Num) -> Real, L(x) && L(y) → euclid_d_euclid(x, y) == abs(f(x) - f(y))))"))
}

///|
let ruler_postulate_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("ruler_postulate")

///|
/// `ruler_postulate`
pub fn ruler_postulate() -> @kernel.Term {
  ruler_postulate_c.get()
}

///|
/// affine_postulate
fn step_172() -> Unit raise {
  affine_postulate_c.set(@term_syntax.parse_term("∀ n : Num, euclid_affine_dim(n, (P : ((Num) -> Real) -> Bool)) → (∃ S : ((Num) -> Real) -> Bool, SUBSET(S, P) && HAS_SIZE(S, n) && euclid_affine_dim(n, S))"))
}

///|
let affine_postulate_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("affine_postulate")

///|
/// `affine_postulate`
pub fn affine_postulate() -> @kernel.Term {
  affine_postulate_c.get()
}

///|
/// line_plane
fn step_173() -> Unit raise {
  line_plane_c.set(@term_syntax.parse_term("∀ P : ((Num) -> Real) -> Bool, ∀ x : (Num) -> Real, ∀ y : (Num) -> Real, euclid_plane(P) && P(x) && P(y) → SUBSET(euclid_mk_line(x, y), P)"))
}

///|
let line_plane_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("line_plane")

///|
/// `line_plane`
pub fn line_plane() -> @kernel.Term {
  line_plane_c.get()
}

///|
/// plane_of_pt
fn step_174() -> Unit raise {
  plane_of_pt_c.set(@term_syntax.parse_term("∀ S : ((Num) -> Real) -> Bool, HAS_SIZE(S, 3) → (∃ P : ((Num) -> Real) -> Bool, euclid_plane(P) && SUBSET(S, P))"))
}

///|
let plane_of_pt_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("plane_of_pt")

///|
/// `plane_of_pt`
pub fn plane_of_pt() -> @kernel.Term {
  plane_of_pt_c.get()
}

///|
/// plane_of_pt_unique
fn step_175() -> Unit raise {
  plane_of_pt_unique_c.set(@term_syntax.parse_term("∀ S : ((Num) -> Real) -> Bool, HAS_SIZE(S, 3) → euclid_collinear(S) || existsunique((P : ((Num) -> Real) -> Bool) => euclid_plane(P) && SUBSET(S, P))"))
}

///|
let plane_of_pt_unique_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("plane_of_pt_unique")

///|
/// `plane_of_pt_unique`
pub fn plane_of_pt_unique() -> @kernel.Term {
  plane_of_pt_unique_c.get()
}

///|
/// plane_inter
fn step_176() -> Unit raise {
  plane_inter_c.set(@term_syntax.parse_term("∀ P : ((Num) -> Real) -> Bool, ∀ Q : ((Num) -> Real) -> Bool, euclid_plane(P) && euclid_plane(Q) → INTER(P, Q) == {} || euclid_line(INTER(P, Q)) || P == Q"))
}

///|
let plane_inter_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("plane_inter")

///|
/// `plane_inter`
pub fn plane_inter() -> @kernel.Term {
  plane_inter_c.get()
}

///|
/// plane_separation
fn step_177() -> Unit raise {
  plane_separation_c.set(@term_syntax.parse_term("∀ P : ((Num) -> Real) -> Bool, ∀ L : ((Num) -> Real) -> Bool, euclid_plane(P) && euclid_line(L) && SUBSET(L, P) → (∃ A : ((Num) -> Real) -> Bool, ∃ B : ((Num) -> Real) -> Bool, INTER(A, B) == {} && INTER(A, L) == {} && INTER(B, L) == {} && UNION(L, UNION(A, B)) == P && (∀ c : (Num) -> Real, ∀ u : ((Num) -> Real) -> Bool, P(c) && u == euclid_mk_open_half_set(L, {c}) → u == A || u == B || u == L) && (∀ a : (Num) -> Real, ∀ b : (Num) -> Real, A(a) && B(b) → !(INTER((segment : ((Num) -> Real, (Num) -> Real, (Num) -> Real) -> Bool)(a, b), L) == {})))"))
}

///|
let plane_separation_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("plane_separation")

///|
/// `plane_separation`
pub fn plane_separation() -> @kernel.Term {
  plane_separation_c.get()
}

///|
/// space_separation
fn step_178() -> Unit raise {
  space_separation_c.set(@term_syntax.parse_term("∀ R : ((Num) -> Real) -> Bool, ∀ P : ((Num) -> Real) -> Bool, euclid_space(R) && euclid_plane(P) && SUBSET(P, R) → (∃ A : ((Num) -> Real) -> Bool, ∃ B : ((Num) -> Real) -> Bool, INTER(A, B) == (EMRTY : ((Num) -> Real) -> Bool) && INTER(A, P) == EMRTY && INTER(B, P) == EMRTY && UNION(P, UNION(A, B)) == R && (∀ c : (Num) -> Real, ∀ u : ((Num) -> Real) -> Bool, R(c) && u == euclid_mk_open_half_set(P, {c}) → u == A || u == B || u == P) && (∀ a : (Num) -> Real, ∀ b : (Num) -> Real, A(a) && B(b) → !(INTER((segment : ((Num) -> Real, (Num) -> Real, _) -> Bool)(a, b), (L : (_) -> Bool)) == {})))"))
}

///|
let space_separation_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("space_separation")

///|
/// `space_separation`
pub fn space_separation() -> @kernel.Term {
  space_separation_c.get()
}

///|
/// metric_space
fn step_179() -> Unit raise {
  metric_space_c.set(euclid_def(@term_syntax.parse_term("(metric_space : (((A) -> Bool, (A, A) -> Real)) -> Bool)(((X : (A) -> Bool), (d : (A, A) -> Real))) == (∀ x : A, ∀ y : A, ∀ z : A, X(x) && X(y) && X(z) → real_of_num(0) <= d(x, y) && (real_of_num(0) == d(x, y)) == (x == y) && d(x, y) == d(y, x) && d(x, z) <= d(x, y) + d(y, z))")))
}

///|
let metric_space_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("metric_space")

///|
/// `metric_space`
pub fn metric_space() -> @kernel.Thm {
  metric_space_c.get()
}

///|
/// set_translate
fn step_180() -> Unit raise {
  set_translate_c.set(euclid_def(@term_syntax.parse_term("(set_translate : ((Num) -> Real, ((Num) -> Real) -> Bool, (Num) -> Real) -> Bool)((v : (Num) -> Real), (X : ((Num) -> Real) -> Bool)) == {(z : (Num) -> Real) | ∃ x : (Num) -> Real, X(x) && z == v + x}")))
}

///|
let set_translate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("set_translate")

///|
/// `set_translate`
pub fn set_translate() -> @kernel.Thm {
  set_translate_c.get()
}

///|
/// set_scale
fn step_181() -> Unit raise {
  set_scale_c.set(euclid_def(@term_syntax.parse_term("(set_scale : (Real, ((Num) -> Real) -> Bool, (Num) -> Real) -> Bool)((r : Real), (X : ((Num) -> Real) -> Bool)) == {(z : (Num) -> Real) | ∃ x : (Num) -> Real, X(x) && z == euclid_euclid_scale(r, x)}")))
}

///|
let set_scale_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("set_scale")

///|
/// `set_scale`
pub fn set_scale() -> @kernel.Thm {
  set_scale_c.get()
}

///|
/// mk_rectangle
fn step_182() -> Unit raise {
  mk_rectangle_c.set(euclid_def(@term_syntax.parse_term("(mk_rectangle : ((Num) -> Real, (Num) -> Real, (Num) -> Real) -> Bool)((a : (Num) -> Real), (b : (Num) -> Real)) == {(z : (Num) -> Real) | ∀ i : Num, a(i) <= z(i) && z(i) < b(i)}")))
}

///|
let mk_rectangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_rectangle")

///|
/// `mk_rectangle`
pub fn mk_rectangle() -> @kernel.Thm {
  mk_rectangle_c.get()
}

///|
/// one_vec
fn step_183() -> Unit raise {
  one_vec_c.set(euclid_def(@term_syntax.parse_term("(one_vec : (Num, Num) -> Real)((n : Num)) == ((i : Num) => if i < n { real_of_num(1) } else { real_of_num(0) })")))
}

///|
let one_vec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("one_vec")

///|
/// `one_vec`
pub fn one_vec() -> @kernel.Thm {
  one_vec_c.get()
}

///|
/// mk_cube
fn step_184() -> Unit raise {
  mk_cube_c.set(euclid_def(@term_syntax.parse_term("(mk_cube : (Num, Num, (Num) -> Int, (Num) -> Real) -> Bool)((n : Num), (k : Num), (v : (Num) -> Int)) == LET((r : Real) => LET_END(LET((vv : (Num) -> Real) => LET_END(euclid_mk_rectangle(euclid_euclid_scale(r, vv), euclid_euclid_scale(r, vv + euclid_one_vec(n)))), (i : Num) => real_of_int(v(i)))), twopow(-int_of_num(k)))")))
}

///|
let mk_cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mk_cube")

///|
/// `mk_cube`
pub fn mk_cube() -> @kernel.Thm {
  mk_cube_c.get()
}

///|
/// inner_cube
fn step_185() -> Unit raise {
  inner_cube_c.set(euclid_def(@term_syntax.parse_term("(inner_cube : (Num, Num, ((Num) -> Real) -> Bool, (Num) -> Int) -> Bool)((n : Num), (k : Num), (A : ((Num) -> Real) -> Bool)) == {(v : (Num) -> Int) | SUBSET(euclid_mk_cube(n, k, v), A) && (∀ i : Num, n < i → int_of_num(0) == v(i))}")))
}

///|
let inner_cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inner_cube")

///|
/// `inner_cube`
pub fn inner_cube() -> @kernel.Thm {
  inner_cube_c.get()
}

///|
/// outer_cube
fn step_186() -> Unit raise {
  outer_cube_c.set(euclid_def(@term_syntax.parse_term("(outer_cube : (Num, Num, ((Num) -> Real) -> Bool, (Num) -> Int) -> Bool)((n : Num), (k : Num), (A : ((Num) -> Real) -> Bool)) == {(v : (Num) -> Int) | !(INTER(euclid_mk_cube(n, k, v), A) == {}) && (∀ i : Num, n < i → int_of_num(0) == v(i))}")))
}

///|
let outer_cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("outer_cube")

///|
/// `outer_cube`
pub fn outer_cube() -> @kernel.Thm {
  outer_cube_c.get()
}

///|
/// inner_vol
fn step_187() -> Unit raise {
  inner_vol_c.set(euclid_def(@term_syntax.parse_term("(inner_vol : (Num, Num, ((Num) -> Real) -> Bool) -> Real)((n : Num), (k : Num), (A : ((Num) -> Real) -> Bool)) == real_of_num(CARD(euclid_inner_cube(n, k, A))) * twopow(-int_of_num(n * k))")))
}

///|
let inner_vol_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inner_vol")

///|
/// `inner_vol`
pub fn inner_vol() -> @kernel.Thm {
  inner_vol_c.get()
}

///|
/// outer_vol
fn step_188() -> Unit raise {
  outer_vol_c.set(euclid_def(@term_syntax.parse_term("(outer_vol : (Num, Num, ((Num) -> Real) -> Bool) -> Real)((n : Num), (k : Num), (A : ((Num) -> Real) -> Bool)) == real_of_num(CARD(euclid_outer_cube(n, k, A))) * twopow(-int_of_num(n * k))")))
}

///|
let outer_vol_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("outer_vol")

///|
/// `outer_vol`
pub fn outer_vol() -> @kernel.Thm {
  outer_vol_c.get()
}

///|
/// euclid_bounded
fn step_189() -> Unit raise {
  euclid_bounded_c.set(euclid_def(@term_syntax.parse_term("(euclid_bounded : (((Num) -> Real) -> Bool) -> Bool)((A : ((Num) -> Real) -> Bool)) == (∃ R : Real, ∀ x : (Num) -> Real, ∀ i : Num, A(x) → x(i) < R)")))
}

///|
let euclid_bounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euclid_bounded")

///|
/// `euclid_bounded`
pub fn euclid_bounded() -> @kernel.Thm {
  euclid_bounded_c.get()
}

///|
/// vol
fn step_190() -> Unit raise {
  vol_c.set(euclid_def(@term_syntax.parse_term("(vol : (Num, ((Num) -> Real) -> Bool) -> Real)((n : Num), (A : ((Num) -> Real) -> Bool)) == lim((k : Num) => euclid_outer_vol(n, k, A))")))
}

///|
let vol_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vol")

///|
/// `vol`
pub fn vol() -> @kernel.Thm {
  vol_c.get()
}

///|
/// Jordan/misc_defs_and_lemmas.ml:2064
fn step_191() -> Unit raise {
  @parse_ext_override_interface.unambiguous_interface(())
}

///|
/// Jordan/misc_defs_and_lemmas.ml:2065
fn step_192() -> Unit raise {
  @parse_ext_override_interface.prioritize_real(())
}

///|
/// SER_APPROX1
fn step_193() -> Unit raise {
  let t1092 = @meson.asm_meson_tac(@list.List([@analysis.sum_uniq()]))
  let t1093 = @tactics.first_x_assum(fn(x1089 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1089
    let t1091 = @bool.spec(@term_syntax.parse_term("(k : Num)"), th_1)
    @tactics.accept_tac(@drule.match_mp(@analysis.sum_summable())(t1091))
  })
  let t1094 = @tactics.imp_res_then(fn(x1086 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1087 = @tactics.assume_tac(x1086)
    fn(x1088 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1087(x1088)
    }
  })(@analysis.ser_offset())
  let t1095 = @simp.asm_rewrite_tac(@list.List([]))
  let t1096 = @tactics.match_mp_tac(@analysis.ser_le2())
  let t1097 = @tactics.subgoal_then(@term_syntax.parse_term("summable((n : Num) => (f : (Num) -> Real)(n + (k : Num))) && suminf((n : Num) => f(n + k)) <= suminf((n : Num) => (g : (Num) -> Real)(n + k))"), fn(x1083 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1084 = @tactics.assume_tac(x1083)
    fn(x1085 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1084(x1085)
    }
  })
  let t1098 = @meson.asm_meson_tac(@list.List([]))
  let t1099 = @tactics.subgoal_then(@term_syntax.parse_term("sums((n : Num) => (f : (Num) -> Real)(n + (k : Num)), (s : Real) - sum((0, k), f))"), fn(x1080 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1081 = @tactics.assume_tac(x1080)
    fn(x1082 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1081(x1082)
    }
  })
  let t1100 = @tactics.imp_res_then(fn(x1077 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1078 = @tactics.assume_tac(x1077)
    fn(x1079 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1078(x1079)
    }
  })(@analysis.sum_uniq())
  let t1101 = @tactics.imp_res_then(fn(x1075 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1075
    @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(k : Num)"), th))
  })(@analysis.ser_offset())
  let t1102 = @tactics.imp_res_then(fn(x1072 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1073 = @tactics.assume_tac(x1072)
    fn(x1074 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1073(x1074)
    }
  })(@analysis.sum_summable())
  let t1103 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, @tactics.gen_tac, @tactics.disch_tac, t1102, t1101, t1100, t1099, t1098, t1097, t1096, @tactics.beta_tac, t1095, t1094, t1093, t1092])
  ser_approx1_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ s : Real, ∀ f : (Num) -> Real, ∀ g : (Num) -> Real, sums(f, s) && summable(g) → (∀ k : Num, (∀ n : Num, abs(f(n + k)) <= g(n + k)) → s - sum((0, k), f) <= suminf((n : Num) => g(n + k)))"), t1103))
}

///|
let ser_approx1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SER_APPROX1")

///|
/// `SER_APPROX1`
pub fn ser_approx1() -> @kernel.Thm {
  ser_approx1_c.get()
}

///|
/// SER_APPROX
fn step_194() -> Unit raise {
  let t1113 = @meson.asm_meson_tac(@list.List([]))
  let t1114 = @tactics.imp_res_then(@tactics.match_mp_tac)(ser_approx1())
  let t1115 = @tactics_ext.h_val2(fn(x1109 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x1110 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x1109, x1110)
    }
  }, (x1111 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x1111), (x1112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("2", x1112))
  let t1116 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_abs_neg()]))
  let t1117 = @tactics.first_x_assum(fn(x1107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1107
    @tactics.match_mp_tac(th)
  })
  let t1118 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@analysis.sum_neg())]))
  let t1119 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("-(s : Real) - -(u : Real) <= (x : Real) → -x <= s - u")))
  let t1120 = @simp.asm_rewrite_tac(@list.List([]))
  let t1121 = @tactics.match_mp_tac(@analysis.ser_neg())
  let t1122 = @simp.asm_rewrite_tac(@list.List([]))
  let t1123 = @tactics.match_mp_tac(ser_approx1())
  let t1124 = @tactics.subgoal_then(@term_syntax.parse_term("∀ k : Num, (∀ n : Num, abs(((p : Num) => -(f : (Num) -> Real)(p))(n + k)) <= (g : (Num) -> Real)(n + k)) → -(s : Real) - sum((0, k), (p : Num) => -f(p)) <= suminf((n : Num) => g(n + k))"), fn(x1104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1105 = @tactics.assume_tac(x1104)
    fn(x1106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1105(x1106)
    }
  })
  let t1125 = @simp.rewrite_tac(@list.List([@real.real_abs_bounds()]))
  let t1126 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, @tactics.gen_tac, t1125, @tactics.conj_tac, t1124, t1123, t1122, t1121, t1120, t1119, t1118, t1117, @tactics.beta_tac, t1116, t1115, t1114, @tactics.gen_tac, t1113])
  ser_approx_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ s : Real, ∀ f : (Num) -> Real, ∀ g : (Num) -> Real, sums(f, s) && (∀ n : Num, abs(f(n)) <= g(n)) && summable(g) → (∀ k : Num, abs(s - sum((0, k), f)) <= suminf((n : Num) => g(n + k)))"), t1126))
}

///|
let ser_approx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SER_APPROX")

///|
/// `SER_APPROX`
pub fn ser_approx() -> @kernel.Thm {
  ser_approx_c.get()
}

///|
/// local_def
fn step_195() -> Unit raise {
  local_def_c.set((x1127 : @kernel.Term) => @lib_ext.local_definition("trig", x1127))
}

///|
let local_def_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("local_def")

///|
/// `local_def`
pub fn local_def(x : @kernel.Term) -> @kernel.Thm raise {
  (local_def_c.get())(x)
}

///|
/// PI_EST
fn step_196() -> Unit raise {
  let t1143 = @simp.rewrite_tac(@list.List([@analysis.real_lt(), @analysis.real_le_v1()]))
  let t1141 = @meson.meson_tac(@list.List([@real.real_abs_refl(), @real.real_abs_inv(), @real.real_le_inv2()]))
  let t1142 = @tactics.match_mp_tac(@tactics_refine.prove(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) && real_of_num(n) <= (a : Real) → inv(a) <= inv(real_of_num(n))"), t1141))
  let t1140 = @tactics.pop_assum(fn(x1138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1138
    @tactics.match_mp_tac(th_1)
  })
  let t1146 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t1140), t1142), t1143), (x1145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.h_undisch_tac((x1144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x1144), x1145)), @int.arith_tac)
  let t1137 = @meson.meson_tac(@list.List([@analysis.real_pos(), @real.real_abs_refl()]))
  let t1147 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_inv(), @tactics_refine.prove(@term_syntax.parse_term("abs(real_of_num((n : Num))) == real_of_num(n)"), t1137)]))
  let t1136 = @meson.meson_tac(@list.List([@real_ext.real_prop_le_lmul(), @analysis.real_pos()]))
  let t1148 = @tactics.assume_tac(@tactics_refine.prove(@term_syntax.parse_term("(a : Real) <= (b : Real) → real_of_num((n : Num)) * a <= real_of_num(n) * b"), t1136))
  let t1149 = @tactics.first_x_assum(fn(x1134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1134
    @tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@real.real_of_num_lt())]))(th))
  })
  let t1133 = @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → 0 < n"))
  let t1150 = @tactics.imp_res_then(fn(x1130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1131 = @tactics.assume_tac(x1130)
    fn(x1132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1131(x1132)
    }
  })(t1133)
  let t1128 = @calc_rat.real_arith(@term_syntax.parse_term("abs(real_of_num(4) * (u : Real)) <= real_of_num(4) / real_of_num(9) && abs(real_of_num(2) * (v : Real)) <= real_of_num(2) / real_of_num(12) && abs(real_of_num(1) * (w : Real)) <= real_of_num(1) / real_of_num(13) && abs(real_of_num(1) * (x : Real)) <= real_of_num(1) / real_of_num(14) → abs(real_of_num(4) * u - real_of_num(2) * v - real_of_num(1) * w - real_of_num(1) * x) <= real_of_num(4) / real_of_num(9) + (real_of_num(2) / real_of_num(12) + (real_of_num(1) / real_of_num(13) + real_of_num(1) / real_of_num(14)))"))
  let t1129 = @simp.rewrite_rule(@list.List([@calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("real_of_num(4) / real_of_num(9) + (real_of_num(2) / real_of_num(12) + (real_of_num(1) / real_of_num(13) + real_of_num(1) / real_of_num(14)))"))]))(t1128)
  let t1151 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@realax.real_div()]))(t1129))
  let t1152 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t1153 = @list.List([@tactics.then_tac(@tactics.gen_tac, @tactics_ext.disch_all_tac), t1152, t1151, t1150, t1149, t1148, t1147, t1146])
  pi_est_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ n : Num, 1 <= n → abs(real_of_num(4) / real_of_num(8 * n + 1) - real_of_num(2) / real_of_num(8 * n + 4) - real_of_num(1) / real_of_num(8 * n + 5) - real_of_num(1) / real_of_num(8 * n + 6)) <= real_of_num(622) / real_of_num(819)"), t1153))
}

///|
let pi_est_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PI_EST")

///|
/// `PI_EST`
pub fn pi_est() -> @kernel.Thm {
  pi_est_c.get()
}

///|
/// pi_fun
fn step_197() -> Unit raise {
  pi_fun_c.set(local_def(@term_syntax.parse_term("(pi_fun : (Num) -> Real)((n : Num)) == inv(pow(real_of_num(16), n)) * (real_of_num(4) / real_of_num(8 * n + 1) - real_of_num(2) / real_of_num(8 * n + 4) - real_of_num(1) / real_of_num(8 * n + 5) - real_of_num(1) / real_of_num(8 * n + 6))")))
}

///|
let pi_fun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pi_fun")

///|
/// `pi_fun`
pub fn pi_fun() -> @kernel.Thm {
  pi_fun_c.get()
}

///|
/// pi_bound_fun
fn step_198() -> Unit raise {
  pi_bound_fun_c.set(local_def(@term_syntax.parse_term("(pi_bound_fun : (Num) -> Real)((n : Num)) == (if n == 0 { real_of_num(8) } else { real_of_num(15) / real_of_num(16) * inv(pow(real_of_num(16), n)) })")))
}

///|
let pi_bound_fun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pi_bound_fun")

///|
/// `pi_bound_fun`
pub fn pi_bound_fun() -> @kernel.Thm {
  pi_bound_fun_c.get()
}

///|
/// PI_EST2
fn step_199() -> Unit raise {
  let t1164 = @meson.asm_meson_tac(@list.List([@analysis.real_le_trans()]))
  let t1165 = @simp.simp_tac(@list.List([@real.real_pow_lt(), @real.real_lt_inv(), @int.arith_rule(@term_syntax.parse_term("real_of_num(0) < real_of_num(16)"))]))
  let t1166 = @tactics.imp_res_then(fn(x1161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1162 = @tactics.assume_tac(x1161)
    fn(x1163 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1162(x1163)
    }
  })(pi_est())
  let t1160 = @int.arith_rule(@term_syntax.parse_term("!((k : Num) == 0) → 1 <= k"))
  let t1167 = @tactics.imp_res_then(fn(x1157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1158 = @tactics.assume_tac(x1157)
    fn(x1159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1158(x1159)
    }
  })(t1160)
  let t1156 = @calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("real_of_num(622) / real_of_num(819) <= real_of_num(15) / real_of_num(16)"))
  let t1168 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([]))(t1156))
  let t1155 = @meson.meson_tac(@list.List([@real.real_le_lmul_eq()]))
  let t1169 = @tactics.match_mp_tac(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) < z && y <= x → z * y <= z * x"), t1155))
  let t1154 = @meson.meson_tac(@list.List([@analysis.real_pos(), @real.real_abs_refl()]))
  let t1170 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_inv(), @real.real_abs_pow(), @tactics_refine.prove(@term_syntax.parse_term("abs(real_of_num((n : Num))) == real_of_num(n)"), t1154)]))
  let t1171 = @tactics.conv_tac(@equal.rand_conv(@simp.rewr_conv(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) == b * a")))))
  let t1172 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1173 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1174 = @simp.asm_rewrite_tac(@list.List([]))
  let t1175 = @list.List([@tactics.gen_tac, @simp.rewrite_tac(@list.List([pi_fun(), pi_bound_fun()])), @class.cond_cases_tac, t1174, t1173, t1172, t1171, t1170, t1169, t1168, t1167, t1166, @tactics.conj_tac, t1165, t1164])
  pi_est2_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ k : Num, abs(trig_pi_fun(k)) <= trig_pi_bound_fun(k)"), t1175))
}

///|
let pi_est2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PI_EST2")

///|
/// `PI_EST2`
pub fn pi_est2() -> @kernel.Thm {
  pi_est2_c.get()
}

///|
/// GP16
fn step_200() -> Unit raise {
  let t1179 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_pow_inv()), @analysis.real_inv_1over()]))
  let t1180 = @tactics.match_mp_tac(@analysis.ser_cmul())
  let t1181 = @tactics.imp_res_then(fn(x1177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1177
    @tactics.assume_tac(@equal.conv_rule(@calc_rat.real_rat_reduce_conv, th))
  })(@analysis.gp())
  let t1176 = @calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("abs(real_of_num(1) / real_of_num(16)) < real_of_num(1)"))
  let t1182 = @list.List([@tactics.gen_tac, @tactics.assume_tac(@simp.rewrite_rule(@list.List([]))(t1176)), t1181, t1180, t1179])
  gp16_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ k : Num, sums((n : Num) => inv(pow(real_of_num(16), k)) * inv(pow(real_of_num(16), n)), inv(pow(real_of_num(16), k)) * (real_of_num(16) / real_of_num(15)))"), t1182))
}

///|
let gp16_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GP16")

///|
/// `GP16`
pub fn gp16() -> @kernel.Thm {
  gp16_c.get()
}

///|
/// GP16a
fn step_201() -> Unit raise {
  let t1192 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1193 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) * ((a : Real) * (c : Real)) == b * real_of_num(1) → a * b * c == b")))
  let t1191 = @meson.meson_tac(@list.List([]))
  let t1194 = @tactics.match_mp_tac(@tactics_refine.prove(@term_syntax.parse_term("(x : Real) == (y : Real) → sums((a : (Num) -> Real), x) → sums(a, y)"), t1191))
  let t1195 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t1196 = @tactics.first_x_assum(fn(x1188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1189 = @tactics.mp_tac(x1188)
    fn(x1190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1189(x1190)
    }
  })
  let t1197 = @tactics.accept_tac(@bool.spec(@term_syntax.parse_term("(k : Num)"), gp16()))
  let t1198 = @simp.rewrite_tac(@list.List([@real.real_pow_inv()]))
  let t1199 = @tactics.match_mp_tac(@analysis.ser_cmul())
  let t1200 = @tactics.subgoal_then(@term_syntax.parse_term("sums((n : Num) => real_of_num(15) / real_of_num(16) * (pow(inv(real_of_num(16)), (k : Num)) * inv(pow(real_of_num(16), n))), real_of_num(15) / real_of_num(16) * (inv(pow(real_of_num(16), k)) * (real_of_num(16) / real_of_num(15))))"), fn(x1185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1186 = @tactics.assume_tac(x1185)
    fn(x1187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1186(x1187)
    }
  })
  let t1201 = @simp.rewrite_tac(@list.List([@real.real_inv_mul(), @real.real_pow_add(), @real.real_pow_inv(), @real.real_mul_ac()]))
  let t1202 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t1203 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < (k : Num) → !((n : Num) + k == 0)"))]))
  let t1204 = @simp.rewrite_tac(@list.List([pi_bound_fun()]))
  let t1205 = @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), @tactics.beta_tac)
  let t1206 = @tactics.match_mp_tac(@class.eq_ext())
  let t1207 = @list.List([@tactics.gen_tac, @tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("((n : Num) => trig_pi_bound_fun(n + (k : Num))) == ((n : Num) => real_of_num(15) / real_of_num(16) * (pow(inv(real_of_num(16)), k) * inv(pow(real_of_num(16), n))))"), fn(x1183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1183
    @simp.rewrite_tac(@list.List([th]))
  }), t1206, t1205, t1204, @class.cond_cases_tac, t1203, t1202, @tactics.ap_term_tac, t1201, t1200, t1199, t1198, t1197, t1196, t1195, t1194, t1193, @tactics.ap_term_tac, t1192])
  gp16a_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ k : Num, 0 < k → sums((n : Num) => trig_pi_bound_fun(n + k), inv(pow(real_of_num(16), k)))"), t1207))
}

///|
let gp16a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GP16a")

///|
/// `GP16a`
pub fn gp16a() -> @kernel.Thm {
  gp16a_c.get()
}

///|
/// PI_SER
fn step_202() -> Unit raise {
  let t1227 = @meson.asm_meson_tac(@list.List([@analysis.sum_uniq()]))
  let t1228 = @tactics.subgoal_then(@term_syntax.parse_term("suminf((n : Num) => trig_pi_bound_fun(n + (k : Num))) == inv(pow(real_of_num(16), k))"), fn(x1225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1225
    @meson.meson_tac(@list.List([th_1]))
  })
  let t1229 = @tactics.disch_then(fn(x1223 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1223
    @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(k : Num)"), th))
  })
  let t1230 = @simp.asm_rewrite_tac(@list.List([]))
  let t1221 = @term_syntax.parse_term("trig_pi_bound_fun")
  let t1222 = @term_syntax.parse_term("trig_pi_fun")
  let t1231 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("pi"), t1222, t1221]), ser_approx()))
  let t1232 = @tactics.imp_res_then(fn(x1218 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1219 = @tactics.assume_tac(x1218)
    fn(x1220 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1219(x1220)
    }
  })(@analysis.sum_summable())
  let t1233 = @tactics.imp_res_then(fn(x1215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1216 = @tactics.assume_tac(x1215)
    fn(x1217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1216(x1217)
    }
  })(@analysis.ser_offset_rev())
  let t1234 = @tactics.imp_res_then(fn(x1212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1213 = @tactics.assume_tac(x1212)
    fn(x1214 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1213(x1214)
    }
  })(@analysis.sum_summable())
  let t1235 = @tactics.imp_res_then(fn(x1209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1210 = @tactics.assume_tac(x1209)
    fn(x1211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1210(x1211)
    }
  })(gp16a())
  let t1236 = @tactics.assume_tac(pi_est2())
  let t1208 = @simp.rewrite_rule(@list.List([@equal.gsym(pi_fun())]))(@polylog.polylog_thm())
  let t1237 = @tactics.assume_tac(@simp.once_rewrite_rule(@list.List([@class.eta_ax()]))(t1208))
  let t1238 = @list.List([@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1237, t1236, t1235, t1234, t1233, t1232, t1231, t1230, t1229, t1228, t1227])
  pi_ser_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ k : Num, 0 < k → abs(pi - sum((0, k), trig_pi_fun)) <= inv(pow(real_of_num(16), k))"), t1238))
}

///|
let pi_ser_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PI_SER")

///|
/// `PI_SER`
pub fn pi_ser() -> @kernel.Thm {
  pi_ser_c.get()
}

///|
/// `SUC_EXPAND_CONV`
pub fn suc_expand_conv(x1239 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1239
  let count = @basics.dest_numeral(tm)
  fn add_suc(x1240 : @num.Num, x1241 : @kernel.Term) -> @kernel.Term raise {
    let i = x1240
    let r = x1241
    if @num.le_num(i, @num.num_of_int64(0L)) {
      r
    } else {
      let t1242 = @kernel.mk_comb(@term_syntax.parse_term("SUC"), r)
      add_suc(@num.sub_num(i, @num.num_of_int64(1L)), t1242)
    }
  }
  let tm_p = add_suc(count, @term_syntax.parse_term("0"))
  let t1243 = @basics.mk_eq(tm, tm_p)
  let t1244 = @num_calc_simp.arith_rewrite_conv(@list.List([]))(t1243)
  @simp.rewrite_rule(@list.List([]))(t1244)
}

///|
/// inv_twopow
fn step_203() -> Unit raise {
  let t1245 = @simp.rewrite_tac(@list.List([@float.twopow_neg(), @equal.gsym(@calc_num.num_red_conv(@term_syntax.parse_term("EXP(2, 4)"))), @calc_int.real_of_num_pow(), @arith.exp_mult()]))
  inv_twopow_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, inv(pow(real_of_num(16), n)) == twopow(-int_of_num(4 * n))"), t1245))
}

///|
let inv_twopow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inv_twopow")

///|
/// `inv_twopow`
pub fn inv_twopow() -> @kernel.Thm {
  inv_twopow_c.get()
}

///|
/// `PI_SERn`
pub fn pi_sern(x1246 : @kernel.Term) -> @kernel.Thm raise {
  let n = x1246
  let t1249 = @num_calc_simp.arith_rewrite_conv(@list.List([@realax.real_add_lid(), @equal.gsym(@realax.real_add_assoc())]))
  let t1248 = @simp.rewrite_conv(@list.List([@analysis.sum()]))
  let t1247 = @equal.top_depth_conv(suc_expand_conv)
  let sum_expand_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@equal.thenc(@num_calc_simp.arith_rewrite_conv(@list.List([])), t1247), t1248), t1249)
  let t1250 = @term_syntax.parse_term("sum((0, (i : Num)), (f : (Num) -> Real))")
  let sum_thm = sum_expand_conv(@kernel.vsubst(@list.List([(n, @term_syntax.parse_term("(i : Num)"))]), t1250))
  let t1251 = @term_syntax.parse_term("0 < (i : Num)")
  let gt_thm = @int.arith_rule(@kernel.vsubst(@list.List([(n, @term_syntax.parse_term("(i : Num)"))]), t1251))
  let t1252 = @drule.match_mp(pi_ser())(gt_thm)
  let t1253 = @equal.beta_rule(@simp.rewrite_rule(@list.List([sum_thm, pi_fun(), inv_twopow()]))(t1252))
  @equal.conv_rule(@num_calc_simp.arith_rewrite_conv(@list.List([])), t1253)
}

///|
/// `recompute_pi`
pub fn recompute_pi(x1254 : Int64) -> @kernel.Thm raise {
  let bprec = x1254
  let n = @lib.div63(bprec, 4L)
  let pi_ser_1 = pi_sern(@nums.mk_numeral(@num.num_of_int64(n)))
  let _ = @float.remove_real_constant(@term_syntax.parse_term("pi"))
  @float.add_real_constant(pi_ser_1)
  @float.interval_of_term(bprec, @term_syntax.parse_term("pi"))
}

///|
/// Jordan/misc_defs_and_lemmas.ml:2277
fn step_204() -> Unit raise {
  ignore(@lib_ext.reduce_local_interface("trig"))
}

///|
/// Jordan/misc_defs_and_lemmas.ml:2278
fn step_205() -> Unit raise {
  @parse_ext_override_interface.pop_priority(())
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
}
