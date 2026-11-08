// Translated from upstream 100/fourier.ml; edit this file directly.

///|
/// SUM_NUMBERS
fn step_1() -> Unit raise {
  let t1 = @tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @arith.le_0(), @equal.gsym(@real.real_of_num_suc())]))), @calc_rat.real_arith_tac)
  sum_numbers_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, sum(op_dot_dot(0, n), (r : Num) => real_of_num(r)) == real_of_num(n) * (real_of_num(n) + real_of_num(1)) / real_of_num(2)"), t1))
}

///|
let sum_numbers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_NUMBERS")

///|
/// `SUM_NUMBERS`
pub fn sum_numbers() -> @kernel.Thm {
  sum_numbers_c.get()
}

///|
/// REAL_INTEGRABLE_REFLECT_AND_ADD
fn step_2() -> Unit raise {
  let t10 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t7 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_subinterval()))
  let t9 = @tactics.first_x_assum(fn(x8 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t7(x8))
  })
  let t5 = @simp.simp_tac(@list.List([@realanalysis.real_integrable_add()]))
  let t4 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg(), @class.eta_ax()]))
  let t6 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_integrable_reflect())])), t4), t5])
  let t3 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (b : Bool) && (a && b → (c : Bool)) → a && b && c")))
  let t11 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t2), t3), t6), t9), t10), @calc_rat.real_arith_tac)
  real_integrable_reflect_and_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ a : Real, real_integrable_on(f, real_interval([(-a, a)])) → real_integrable_on(f, real_interval([(real_of_num(0), a)])) && real_integrable_on((x : Real) => f(-x), real_interval([(real_of_num(0), a)])) && real_integrable_on((x : Real) => f(x) + f(-x), real_interval([(real_of_num(0), a)]))"), t11))
}

///|
let real_integrable_reflect_and_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRABLE_REFLECT_AND_ADD")

///|
/// `REAL_INTEGRABLE_REFLECT_AND_ADD`
pub fn real_integrable_reflect_and_add() -> @kernel.Thm {
  real_integrable_reflect_and_add_c.get()
}

///|
/// REAL_INTEGRAL_REFLECT_AND_ADD
fn step_3() -> Unit raise {
  let t32 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_null(), @calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(0) <= (a : Real)) → a <= -a && a <= real_of_num(0)"))]))
  let t31 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg(), @class.eta_ax(), @calc_int.real_neg_0(), @calc_int.real_add_ac()]))
  let t30 = @simp.gen_rewrite_tac(fn(x29 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x23 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s24 = @equal.rand_conv(x23)
      fn(x25 : @kernel.Term) -> @kernel.Thm raise {
        s24(x25)
      }
    })((fn(x26 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s27 = @equal.rand_conv(x26)
      fn(x28 : @kernel.Term) -> @kernel.Thm raise {
        s27(x28)
      }
    })(x29))
  }, @list.List([@equal.gsym(@realanalysis.real_integral_reflect())]))
  let t22 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_add(), real_integrable_reflect_and_add()]))
  let t21 = @tactics.disch_then(fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s18 = @tactics.subst1_tac(x17)
      fn(x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s18(x19)
      }
    })(@equal.sym(x20))
  })
  let t16 = @simp.asm_rewrite_tac(@list.List([]))
  let t13 = @term_syntax.parse_term("real_of_num(0)")
  let t14 = @term_syntax.parse_term("(a : Real)")
  let t15 = @term_syntax.parse_term("-(a : Real)")
  let t33 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t15, t14, t13]), @realanalysis.real_integral_combine())), t16), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t21), t22), t30), t31), t32])
  let t12 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (a : Real)"))
  let t34 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t12), t33)
  real_integral_reflect_and_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ a : Real, real_integrable_on(f, real_interval([(-a, a)])) → real_integral(real_interval([(-a, a)]), f) == real_integral(real_interval([(real_of_num(0), a)]), (x : Real) => f(x) + f(-x))"), t34))
}

///|
let real_integral_reflect_and_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRAL_REFLECT_AND_ADD")

///|
/// `REAL_INTEGRAL_REFLECT_AND_ADD`
pub fn real_integral_reflect_and_add() -> @kernel.Thm {
  real_integral_reflect_and_add_c.get()
}

///|
/// 100/fourier.ml:53
fn step_4() -> Unit raise {
  @printer.parse_as_infix("square_integrable_on", (12L, "right"))
}

///|
/// square_integrable_on
fn step_5() -> Unit raise {
  square_integrable_on_c.set(@pair.new_definition(@term_syntax.parse_term("(square_integrable_on : ((Real) -> Real, (Real) -> Bool) -> Bool)((f : (Real) -> Real), (s : (Real) -> Bool)) == (real_measurable_on(f, s) && real_integrable_on((x : Real) => pow(f(x), 2), s))")))
}

///|
let square_integrable_on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("square_integrable_on")

///|
/// `square_integrable_on`
pub fn square_integrable_on() -> @kernel.Thm {
  square_integrable_on_c.get()
}

///|
/// SQUARE_INTEGRABLE_IMP_MEASURABLE
fn step_6() -> Unit raise {
  let t35 = @simp.simp_tac(@list.List([square_integrable_on()]))
  square_integrable_imp_measurable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) → real_measurable_on(f, s)"), t35))
}

///|
let square_integrable_imp_measurable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_IMP_MEASURABLE")

///|
/// `SQUARE_INTEGRABLE_IMP_MEASURABLE`
pub fn square_integrable_imp_measurable() -> @kernel.Thm {
  square_integrable_imp_measurable_c.get()
}

///|
/// SQUARE_INTEGRABLE_LSPACE
fn step_7() -> Unit raise {
  let t38 = @simp.rewrite_tac(@list.List([@real.real_pow2_abs(), @trivia.o_def()]))
  let t37 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @vectors.norm_real(), @equal.gsym(@vectors.drop_()), @vectors.lift_drop()]))
  let t36 = @simp.rewrite_tac(@list.List([@realanalysis.real_measurable_on(), @realanalysis.real_integrable_on_v1(), @transcendentals.rpow_pow()]))
  let t39 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([square_integrable_on(), @lpspaces.lspace(), @sets.in_elim_thm()])), t36), t37), t38)
  square_integrable_lspace_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) == IN(o(lift, o(f, drop)), lspace(IMAGE(lift, s), real_of_num(2)))"), t39))
}

///|
let square_integrable_lspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_LSPACE")

///|
/// `SQUARE_INTEGRABLE_LSPACE`
pub fn square_integrable_lspace() -> @kernel.Thm {
  square_integrable_lspace_c.get()
}

///|
/// SQUARE_INTEGRABLE_0
fn step_8() -> Unit raise {
  let t41 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_0()]))
  let t40 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t42 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([square_integrable_on(), @realanalysis.real_measurable_on_0()])), t40), t41)
  square_integrable_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, square_integrable_on((x : Real) => real_of_num(0), s)"), t42))
}

///|
let square_integrable_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_0")

///|
/// `SQUARE_INTEGRABLE_0`
pub fn square_integrable_0() -> @kernel.Thm {
  square_integrable_0_c.get()
}

///|
/// SQUARE_INTEGRABLE_NEG_EQ
fn step_9() -> Unit raise {
  let t43 = @simp.rewrite_tac(@list.List([square_integrable_on(), @realanalysis.real_measurable_on_neg_eq(), @calc_int.real_pow_neg(), @calc_num.arith()]))
  square_integrable_neg_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on((x : Real) => -f(x), s) == square_integrable_on(f, s)"), t43))
}

///|
let square_integrable_neg_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_NEG_EQ")

///|
/// `SQUARE_INTEGRABLE_NEG_EQ`
pub fn square_integrable_neg_eq() -> @kernel.Thm {
  square_integrable_neg_eq_c.get()
}

///|
/// SQUARE_INTEGRABLE_NEG
fn step_10() -> Unit raise {
  let t44 = @simp.rewrite_tac(@list.List([square_integrable_neg_eq()]))
  square_integrable_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) → square_integrable_on((x : Real) => -f(x), s)"), t44))
}

///|
let square_integrable_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_NEG")

///|
/// `SQUARE_INTEGRABLE_NEG`
pub fn square_integrable_neg() -> @kernel.Thm {
  square_integrable_neg_c.get()
}

///|
/// SQUARE_INTEGRABLE_LMUL
fn step_11() -> Unit raise {
  let t45 = @simp.simp_tac(@list.List([@real.real_pow_mul(), @realanalysis.real_integrable_lmul()]))
  let t46 = @tactics.then_tac(@simp.simp_tac(@list.List([square_integrable_on(), @realanalysis.real_measurable_on_lmul()])), t45)
  square_integrable_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, ∀ c : Real, square_integrable_on(f, s) → square_integrable_on((x : Real) => c * f(x), s)"), t46))
}

///|
let square_integrable_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_LMUL")

///|
/// `SQUARE_INTEGRABLE_LMUL`
pub fn square_integrable_lmul() -> @kernel.Thm {
  square_integrable_lmul_c.get()
}

///|
/// SQUARE_INTEGRABLE_RMUL
fn step_12() -> Unit raise {
  let t47 = @simp.simp_tac(@list.List([@real.real_pow_mul(), @realanalysis.real_integrable_rmul()]))
  let t48 = @tactics.then_tac(@simp.simp_tac(@list.List([square_integrable_on(), @realanalysis.real_measurable_on_rmul()])), t47)
  square_integrable_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, ∀ c : Real, square_integrable_on(f, s) → square_integrable_on((x : Real) => f(x) * c, s)"), t48))
}

///|
let square_integrable_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_RMUL")

///|
/// `SQUARE_INTEGRABLE_RMUL`
pub fn square_integrable_rmul() -> @kernel.Thm {
  square_integrable_rmul_c.get()
}

///|
/// SQUARE_INTEGRABLE_IMP_ABSOLUTELY_INTEGRABLE_PRODUCT
fn step_13() -> Unit raise {
  let t58 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.norm_real(), @equal.gsym(@vectors.drop_()), @vectors.lift_drop(), @real.real_abs_mul()]))
  let t57 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(square_integrable_lspace()), @realanalysis.real_integrable_on_v1()]))
  let t56 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t51 = @term_syntax.parse_term("o(lift, o((g : (Real) -> Real), drop))")
  let t52 = @term_syntax.parse_term("o(lift, o((f : (Real) -> Real), drop))")
  let t53 = @term_syntax.parse_term("real_of_num(2)")
  let t54 = @term_syntax.parse_term("real_of_num(2)")
  let t55 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE(lift, (s : (Real) -> Bool))"), t54, t53, t52, t51]), @lpspaces.lspace_integrable_product()))
  let t50 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_mul(), square_integrable_imp_measurable()]))
  let t49 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_real_measurable()]))
  let t59 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t49), t50), t55), t56), t57), t58)
  square_integrable_imp_absolutely_integrable_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && square_integrable_on(g, s) → absolutely_real_integrable_on((x : Real) => f(x) * g(x), s)"), t59))
}

///|
let square_integrable_imp_absolutely_integrable_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_IMP_ABSOLUTELY_INTEGRABLE_PRODUCT")

///|
/// `SQUARE_INTEGRABLE_IMP_ABSOLUTELY_INTEGRABLE_PRODUCT`
pub fn square_integrable_imp_absolutely_integrable_product() -> @kernel.Thm {
  square_integrable_imp_absolutely_integrable_product_c.get()
}

///|
/// SQUARE_INTEGRABLE_IMP_INTEGRABLE_PRODUCT
fn step_14() -> Unit raise {
  let t60 = @simp.simp_tac(@list.List([square_integrable_imp_absolutely_integrable_product(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  square_integrable_imp_integrable_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && square_integrable_on(g, s) → real_integrable_on((x : Real) => f(x) * g(x), s)"), t60))
}

///|
let square_integrable_imp_integrable_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_IMP_INTEGRABLE_PRODUCT")

///|
/// `SQUARE_INTEGRABLE_IMP_INTEGRABLE_PRODUCT`
pub fn square_integrable_imp_integrable_product() -> @kernel.Thm {
  square_integrable_imp_integrable_product_c.get()
}

///|
/// SQUARE_INTEGRABLE_ADD
fn step_15() -> Unit raise {
  let t66 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_add()]))
  let t65 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([square_integrable_on()])))
  let t64 = @simp.asm_simp_tac(@list.List([square_integrable_imp_integrable_product(), @realanalysis.real_integrable_lmul()]))
  let t63 = @tactics.match_mp_tac(@realanalysis.real_integrable_add())
  let t62 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow((x : Real) + (y : Real), 2) == pow(x, 2) + pow(y, 2) + real_of_num(2) * (x * y)"))]))
  let t61 = @simp.asm_simp_tac(@list.List([square_integrable_on(), @realanalysis.real_measurable_on_add(), square_integrable_imp_measurable()]))
  let t67 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t61), t62), t63), t64), t65), t66)
  square_integrable_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && square_integrable_on(g, s) → square_integrable_on((x : Real) => f(x) + g(x), s)"), t67))
}

///|
let square_integrable_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_ADD")

///|
/// `SQUARE_INTEGRABLE_ADD`
pub fn square_integrable_add() -> @kernel.Thm {
  square_integrable_add_c.get()
}

///|
/// SQUARE_INTEGRABLE_SUB
fn step_16() -> Unit raise {
  let t68 = @simp.simp_tac(@list.List([@realax.real_sub(), square_integrable_add(), square_integrable_neg_eq()]))
  square_integrable_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && square_integrable_on(g, s) → square_integrable_on((x : Real) => f(x) - g(x), s)"), t68))
}

///|
let square_integrable_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_SUB")

///|
/// `SQUARE_INTEGRABLE_SUB`
pub fn square_integrable_sub() -> @kernel.Thm {
  square_integrable_sub_c.get()
}

///|
/// SQUARE_INTEGRABLE_ABS
fn step_17() -> Unit raise {
  let t69 = @simp.simp_tac(@list.List([square_integrable_on(), @realanalysis.real_measurable_on_abs(), @real.real_pow2_abs()]))
  square_integrable_abs_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : _, ∀ s : (Real) -> Bool, square_integrable_on(f, s) → square_integrable_on((x : Real) => abs(f(x)), s)"), t69))
}

///|
let square_integrable_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_ABS")

///|
/// `SQUARE_INTEGRABLE_ABS`
pub fn square_integrable_abs() -> @kernel.Thm {
  square_integrable_abs_c.get()
}

///|
/// SQUARE_INTEGRABLE_SUM
fn step_18() -> Unit raise {
  let t72 = @simp.simp_tac(@list.List([square_integrable_0(), @sets.in_insert(), square_integrable_add(), @class.eta_ax(), @iterate.sum_clauses()]))
  let t71 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t70 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t73 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t70), t71), t72)
  square_integrable_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, Real) -> Real, ∀ s : (Real) -> Bool, ∀ t : (_) -> Bool, FINITE(t) && (∀ i : _, IN(i, t) → square_integrable_on(f(i), s)) → square_integrable_on((x : Real) => sum(t, (i : _) => f(i, x)), s)"), t73))
}

///|
let square_integrable_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_SUM")

///|
/// `SQUARE_INTEGRABLE_SUM`
pub fn square_integrable_sum() -> @kernel.Thm {
  square_integrable_sum_c.get()
}

///|
/// REAL_CONTINUOUS_IMP_SQUARE_INTEGRABLE
fn step_19() -> Unit raise {
  let t78 = @simp.asm_rewrite_tac(@list.List([]))
  let t77 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_pow())
  let t79 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_continuous()), t77), t78)
  let t76 = @simp.asm_rewrite_tac(@list.List([]))
  let t75 = @tactics.match_mp_tac(@realanalysis.real_integrable_continuous())
  let t80 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.integrable_imp_real_measurable()), t75), t76), t79])
  let t74 = @simp.rewrite_tac(@list.List([square_integrable_on()]))
  let t81 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t74), @tactics.conj_tac), t80)
  real_continuous_imp_square_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ a : Real, ∀ b : Real, real_continuous_on(f, real_interval([(a, b)])) → square_integrable_on(f, real_interval([(a, b)]))"), t81))
}

///|
let real_continuous_imp_square_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_IMP_SQUARE_INTEGRABLE")

///|
/// `REAL_CONTINUOUS_IMP_SQUARE_INTEGRABLE`
pub fn real_continuous_imp_square_integrable() -> @kernel.Thm {
  real_continuous_imp_square_integrable_c.get()
}

///|
/// SQUARE_INTEGRABLE_IMP_ABSOLUTELY_INTEGRABLE
fn step_20() -> Unit raise {
  let t88 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t86 = @equal.gsym(square_integrable_lspace())
  let t87 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_measurable_measurable()), t86]))
  let t85 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2)"))
  let t84 = @tactics.match_mp_tac(@lpspaces.lspace_mono())
  let t83 = @simp.rewrite_tac(@list.List([@equal.gsym(@lpspaces.lspace_1())]))
  let t82 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_on_v1()]))
  let t89 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t82), t83), t84), t85), t87), t88)
  square_integrable_imp_absolutely_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && real_measurable(s) → absolutely_real_integrable_on(f, s)"), t89))
}

///|
let square_integrable_imp_absolutely_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_IMP_ABSOLUTELY_INTEGRABLE")

///|
/// `SQUARE_INTEGRABLE_IMP_ABSOLUTELY_INTEGRABLE`
pub fn square_integrable_imp_absolutely_integrable() -> @kernel.Thm {
  square_integrable_imp_absolutely_integrable_c.get()
}

///|
/// SQUARE_INTEGRABLE_IMP_INTEGRABLE
fn step_21() -> Unit raise {
  let t90 = @simp.simp_tac(@list.List([square_integrable_imp_absolutely_integrable(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  square_integrable_imp_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && real_measurable(s) → real_integrable_on(f, s)"), t90))
}

///|
let square_integrable_imp_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_IMP_INTEGRABLE")

///|
/// `SQUARE_INTEGRABLE_IMP_INTEGRABLE`
pub fn square_integrable_imp_integrable() -> @kernel.Thm {
  square_integrable_imp_integrable_c.get()
}

///|
/// l2product
fn step_22() -> Unit raise {
  l2product_c.set(@pair.new_definition(@term_syntax.parse_term("(l2product : ((Real) -> Bool, (Real) -> Real, (Real) -> Real) -> Real)((s : (Real) -> Bool), (f : (Real) -> Real), (g : (Real) -> Real)) == real_integral(s, (x : Real) => f(x) * g(x))")))
}

///|
let l2product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("l2product")

///|
/// `l2product`
pub fn l2product() -> @kernel.Thm {
  l2product_c.get()
}

///|
/// l2norm
fn step_23() -> Unit raise {
  l2norm_c.set(@pair.new_definition(@term_syntax.parse_term("(l2norm : ((Real) -> Bool, (Real) -> Real) -> Real)((s : (Real) -> Bool), (f : (Real) -> Real)) == sqrt(l2product(s, f, f))")))
}

///|
let l2norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("l2norm")

///|
/// `l2norm`
pub fn l2norm() -> @kernel.Thm {
  l2norm_c.get()
}

///|
/// L2NORM_LNORM
fn step_24() -> Unit raise {
  let t107 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t103 = @simp.rewrite_rule(@list.List([@realanalysis.real_integrable_on_v1()]))
  let t106 = @tactics.first_assum(fn(x105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s101 = @tactics.mp_tac(x100)
        fn(x102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s101(x102)
        }
      })(t103(x104))
    })(@bool.conjunct2(x105))
  })
  let t99 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @vectors.lift_drop(), @real.real_le_pow_2()]))
  let t98 = @tactics.match_mp_tac(@integration.integral_drop_pos())
  let t97 = @tactics.match_mp_tac(@equal.gsym(@transcendentals.rpow_sqrt()))
  let t96 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t95 = @simp.rewrite_tac(@list.List([@real.real_pow2_abs()]))
  let t94 = @simp.rewrite_tac(@list.List([@vectors.norm_real(), @trivia.o_def(), @equal.gsym(@vectors.drop_()), @vectors.lift_drop(), @transcendentals.rpow_pow()]))
  let t93 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @realanalysis.real_integral_v1()]))
  let t92 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([square_integrable_on()])))
  let t91 = @simp.rewrite_tac(@list.List([l2norm(), @lpspaces.lnorm(), l2product()]))
  let t108 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t91), t92), t93), t94), t95), t96), t97), t98), t99), t106), t107)
  l2norm_lnorm_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) → l2norm(s, f) == lnorm(IMAGE(lift, s), real_of_num(2), o(lift, o(f, drop)))"), t108))
}

///|
let l2norm_lnorm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_LNORM")

///|
/// `L2NORM_LNORM`
pub fn l2norm_lnorm() -> @kernel.Thm {
  l2norm_lnorm_c.get()
}

///|
/// L2PRODUCT_SYM
fn step_25() -> Unit raise {
  let t109 = @simp.rewrite_tac(@list.List([l2product(), @realax.real_mul_sym()]))
  l2product_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, l2product(s, f, g) == l2product(s, g, f)"), t109))
}

///|
let l2product_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_SYM")

///|
/// `L2PRODUCT_SYM`
pub fn l2product_sym() -> @kernel.Thm {
  l2product_sym_c.get()
}

///|
/// L2PRODUCT_POS_LE
fn step_26() -> Unit raise {
  let t113 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t112 = @simp.rewrite_tac(@list.List([@realarith.real_le_square()]))
  let t111 = @tactics.match_mp_tac(@realanalysis.real_integral_pos())
  let t110 = @tactics.repeat_tac(@tactics.strip_tac)
  let t114 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([square_integrable_on(), l2product()])), t110), t111), t112), t113)
  l2product_pos_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, square_integrable_on(f, s) → real_of_num(0) <= l2product(s, f, f)"), t114))
}

///|
let l2product_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_POS_LE")

///|
/// `L2PRODUCT_POS_LE`
pub fn l2product_pos_le() -> @kernel.Thm {
  l2product_pos_le_c.get()
}

///|
/// L2NORM_POW_2
fn step_27() -> Unit raise {
  let t115 = @simp.simp_tac(@list.List([l2norm(), @real.sqrt_pow_2(), l2product_pos_le()]))
  l2norm_pow_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, square_integrable_on(f, s) → pow(l2norm(s, f), 2) == l2product(s, f, f)"), t115))
}

///|
let l2norm_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_POW_2")

///|
/// `L2NORM_POW_2`
pub fn l2norm_pow_2() -> @kernel.Thm {
  l2norm_pow_2_c.get()
}

///|
/// L2NORM_POS_LE
fn step_28() -> Unit raise {
  let t116 = @simp.simp_tac(@list.List([l2norm(), @real.sqrt_pos_le(), l2product_pos_le()]))
  l2norm_pos_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, square_integrable_on(f, s) → real_of_num(0) <= l2norm(s, f)"), t116))
}

///|
let l2norm_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_POS_LE")

///|
/// `L2NORM_POS_LE`
pub fn l2norm_pos_le() -> @kernel.Thm {
  l2norm_pos_le_c.get()
}

///|
/// L2NORM_LE
fn step_29() -> Unit raise {
  let t117 = @simp.simp_tac(@list.List([@real.sqrt_mono_le_eq(), l2norm(), @real.sqrt_mono_le_eq(), l2product_pos_le()]))
  l2norm_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, square_integrable_on(f, s) && square_integrable_on(g, s) → (l2norm(s, f) <= l2norm(s, g)) == (l2product(s, f, f) <= l2product(s, g, g))"), t117))
}

///|
let l2norm_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_LE")

///|
/// `L2NORM_LE`
pub fn l2norm_le() -> @kernel.Thm {
  l2norm_le_c.get()
}

///|
/// L2NORM_EQ
fn step_30() -> Unit raise {
  let t118 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_le_antisym()), l2norm_le()]))
  l2norm_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, square_integrable_on(f, s) && square_integrable_on(g, s) → (l2norm(s, f) == l2norm(s, g)) == (l2product(s, f, f) == l2product(s, g, g))"), t118))
}

///|
let l2norm_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_EQ")

///|
/// `L2NORM_EQ`
pub fn l2norm_eq() -> @kernel.Thm {
  l2norm_eq_c.get()
}

///|
/// SCHWARTZ_INEQUALITY_STRONG
fn step_31() -> Unit raise {
  let t130 = @simp.rewrite_tac(@list.List([@vectors.norm_real(), @trivia.o_def(), @equal.gsym(@vectors.drop_()), @vectors.lift_drop(), @realax.real_le_refl()]))
  let t129 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_v1(), square_integrable_imp_integrable_product(), square_integrable_abs()]))
  let t128 = @simp.rewrite_tac(@list.List([l2product()]))
  let t127 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realax.real_le_trans()))
  let t125 = @equal.gsym(l2norm_lnorm())
  let t126 = @simp.asm_simp_tac(@list.List([@equal.gsym(square_integrable_lspace()), t125]))
  let t124 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t119 = @term_syntax.parse_term("o(lift, o((g : (Real) -> Real), drop))")
  let t120 = @term_syntax.parse_term("o(lift, o((f : (Real) -> Real), drop))")
  let t121 = @term_syntax.parse_term("real_of_num(2)")
  let t122 = @term_syntax.parse_term("real_of_num(2)")
  let t123 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE(lift, (s : (Real) -> Bool))"), t122, t121, t120, t119]), @lpspaces.hoelder_inequality()))
  let t131 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t123), t124), t126), t127), t128), t129), t130)
  schwartz_inequality_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && square_integrable_on(g, s) → l2product(s, (x : Real) => abs(f(x)), (x : Real) => abs(g(x))) <= l2norm(s, f) * l2norm(s, g)"), t131))
}

///|
let schwartz_inequality_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCHWARTZ_INEQUALITY_STRONG")

///|
/// `SCHWARTZ_INEQUALITY_STRONG`
pub fn schwartz_inequality_strong() -> @kernel.Thm {
  schwartz_inequality_strong_c.get()
}

///|
/// SCHWARTZ_INEQUALITY_ABS
fn step_32() -> Unit raise {
  let t138 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @realax.real_le_refl()]))
  let t137 = @simp.asm_simp_tac(@list.List([square_integrable_imp_integrable_product(), square_integrable_abs()]))
  let t136 = @tactics.match_mp_tac(@realanalysis.real_integral_abs_bound_integral())
  let t135 = @simp.rewrite_tac(@list.List([l2product()]))
  let t134 = @simp.asm_simp_tac(@list.List([schwartz_inequality_strong()]))
  let t133 = @tactics.exists_tac(@term_syntax.parse_term("l2product((s : (Real) -> Bool), (x : Real) => abs((f : (Real) -> Real)(x)), (x : Real) => abs((g : (Real) -> Real)(x)))"))
  let t132 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t139 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t132), t133), t134), t135), t136), t137), t138)
  schwartz_inequality_abs_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && square_integrable_on(g, s) → abs(l2product(s, f, g)) <= l2norm(s, f) * l2norm(s, g)"), t139))
}

///|
let schwartz_inequality_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCHWARTZ_INEQUALITY_ABS")

///|
/// `SCHWARTZ_INEQUALITY_ABS`
pub fn schwartz_inequality_abs() -> @kernel.Thm {
  schwartz_inequality_abs_c.get()
}

///|
/// SCHWARTZ_INEQUALITY
fn step_33() -> Unit raise {
  let t140 = @meson.meson_tac(@list.List([schwartz_inequality_abs(), @calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (a : Real) → x <= a"))]))
  schwartz_inequality_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && square_integrable_on(g, s) → l2product(s, f, g) <= l2norm(s, f) * l2norm(s, g)"), t140))
}

///|
let schwartz_inequality_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCHWARTZ_INEQUALITY")

///|
/// `SCHWARTZ_INEQUALITY`
pub fn schwartz_inequality() -> @kernel.Thm {
  schwartz_inequality_c.get()
}

///|
/// L2NORM_TRIANGLE
fn step_34() -> Unit raise {
  let t147 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_add()]))
  let t146 = @simp.asm_simp_tac(@list.List([@equal.gsym(square_integrable_lspace()), l2norm_lnorm(), square_integrable_add()]))
  let t145 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t141 = @term_syntax.parse_term("o(lift, o((g : (Real) -> Real), drop))")
  let t142 = @term_syntax.parse_term("o(lift, o((f : (Real) -> Real), drop))")
  let t143 = @term_syntax.parse_term("real_of_num(2)")
  let t144 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE(lift, (s : (Real) -> Bool))"), t143, t142, t141]), @lpspaces.lnorm_triangle()))
  let t148 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t144), t145), t146), t147)
  l2norm_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && square_integrable_on(g, s) → l2norm(s, (x : Real) => f(x) + g(x)) <= l2norm(s, f) + l2norm(s, g)"), t148))
}

///|
let l2norm_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_TRIANGLE")

///|
/// `L2NORM_TRIANGLE`
pub fn l2norm_triangle() -> @kernel.Thm {
  l2norm_triangle_c.get()
}

///|
/// L2PRODUCT_LADD
fn step_35() -> Unit raise {
  let t149 = @simp.simp_tac(@list.List([l2product(), @real.real_add_rdistrib(), @realanalysis.real_integral_add(), square_integrable_imp_integrable_product()]))
  l2product_ladd_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ h : (Real) -> Real, square_integrable_on(f, s) && square_integrable_on(g, s) && square_integrable_on(h, s) → l2product(s, (x : Real) => f(x) + g(x), h) == l2product(s, f, h) + l2product(s, g, h)"), t149))
}

///|
let l2product_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_LADD")

///|
/// `L2PRODUCT_LADD`
pub fn l2product_ladd() -> @kernel.Thm {
  l2product_ladd_c.get()
}

///|
/// L2PRODUCT_RADD
fn step_36() -> Unit raise {
  let t150 = @simp.simp_tac(@list.List([l2product(), @realax.real_add_ldistrib(), @realanalysis.real_integral_add(), square_integrable_imp_integrable_product()]))
  l2product_radd_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ h : (Real) -> Real, square_integrable_on(f, s) && square_integrable_on(g, s) && square_integrable_on(h, s) → l2product(s, f, (x : Real) => g(x) + h(x)) == l2product(s, f, g) + l2product(s, f, h)"), t150))
}

///|
let l2product_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_RADD")

///|
/// `L2PRODUCT_RADD`
pub fn l2product_radd() -> @kernel.Thm {
  l2product_radd_c.get()
}

///|
/// L2PRODUCT_LSUB
fn step_37() -> Unit raise {
  let t151 = @simp.simp_tac(@list.List([l2product(), @real.real_sub_rdistrib(), @realanalysis.real_integral_sub(), square_integrable_imp_integrable_product()]))
  l2product_lsub_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ h : (Real) -> Real, square_integrable_on(f, s) && square_integrable_on(g, s) && square_integrable_on(h, s) → l2product(s, (x : Real) => f(x) - g(x), h) == l2product(s, f, h) - l2product(s, g, h)"), t151))
}

///|
let l2product_lsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_LSUB")

///|
/// `L2PRODUCT_LSUB`
pub fn l2product_lsub() -> @kernel.Thm {
  l2product_lsub_c.get()
}

///|
/// L2PRODUCT_RSUB
fn step_38() -> Unit raise {
  let t152 = @simp.simp_tac(@list.List([l2product(), @real.real_sub_ldistrib(), @realanalysis.real_integral_sub(), square_integrable_imp_integrable_product()]))
  l2product_rsub_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ h : (Real) -> Real, square_integrable_on(f, s) && square_integrable_on(g, s) && square_integrable_on(h, s) → l2product(s, f, (x : Real) => g(x) - h(x)) == l2product(s, f, g) - l2product(s, f, h)"), t152))
}

///|
let l2product_rsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_RSUB")

///|
/// `L2PRODUCT_RSUB`
pub fn l2product_rsub() -> @kernel.Thm {
  l2product_rsub_c.get()
}

///|
/// L2PRODUCT_LZERO
fn step_39() -> Unit raise {
  let t153 = @simp.rewrite_tac(@list.List([l2product(), @calc_int.real_mul_lzero(), @realanalysis.real_integral_0()]))
  l2product_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, l2product(s, (x : Real) => real_of_num(0), f) == real_of_num(0)"), t153))
}

///|
let l2product_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_LZERO")

///|
/// `L2PRODUCT_LZERO`
pub fn l2product_lzero() -> @kernel.Thm {
  l2product_lzero_c.get()
}

///|
/// L2PRODUCT_RZERO
fn step_40() -> Unit raise {
  let t154 = @simp.rewrite_tac(@list.List([l2product(), @calc_int.real_mul_rzero(), @realanalysis.real_integral_0()]))
  l2product_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (Real) -> Real, l2product(s, f, (x : Real) => real_of_num(0)) == real_of_num(0)"), t154))
}

///|
let l2product_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_RZERO")

///|
/// `L2PRODUCT_RZERO`
pub fn l2product_rzero() -> @kernel.Thm {
  l2product_rzero_c.get()
}

///|
/// L2PRODUCT_LSUM
fn step_41() -> Unit raise {
  let t158 = @simp.asm_simp_tac(@list.List([l2product_lzero(), @iterate.sum_clauses(), l2product_ladd(), square_integrable_sum(), @class.eta_ax(), @sets.in_insert()]))
  let t157 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t156 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t155 = @class.asm_cases_tac(@term_syntax.parse_term("square_integrable_on((g : (Real) -> Real), (s : (Real) -> Bool))"))
  let t159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.replicate_tac(3, @tactics.gen_tac), t155), t156), t157), t158)
  l2product_lsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (_, Real) -> Real, ∀ g : (Real) -> Real, ∀ t : (_) -> Bool, FINITE(t) && (∀ i : _, IN(i, t) → square_integrable_on(f(i), s)) && square_integrable_on(g, s) → l2product(s, (x : Real) => sum(t, (i : _) => f(i, x)), g) == sum(t, (i : _) => l2product(s, f(i), g))"), t159))
}

///|
let l2product_lsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_LSUM")

///|
/// `L2PRODUCT_LSUM`
pub fn l2product_lsum() -> @kernel.Thm {
  l2product_lsum_c.get()
}

///|
/// L2PRODUCT_RSUM
fn step_42() -> Unit raise {
  let t160 = @simp.rewrite_tac(@list.List([l2product_lsum()]))
  let t161 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([l2product_sym()])), t160)
  l2product_rsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ f : (_, Real) -> Real, ∀ g : (Real) -> Real, ∀ t : (_) -> Bool, FINITE(t) && (∀ i : _, IN(i, t) → square_integrable_on(f(i), s)) && square_integrable_on(g, s) → l2product(s, g, (x : Real) => sum(t, (i : _) => f(i, x))) == sum(t, (i : _) => l2product(s, g, f(i)))"), t161))
}

///|
let l2product_rsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_RSUM")

///|
/// `L2PRODUCT_RSUM`
pub fn l2product_rsum() -> @kernel.Thm {
  l2product_rsum_c.get()
}

///|
/// L2PRODUCT_LMUL
fn step_43() -> Unit raise {
  let t162 = @simp.simp_tac(@list.List([l2product(), @equal.gsym(@realax.real_mul_assoc()), @realanalysis.real_integral_lmul(), square_integrable_imp_integrable_product()]))
  l2product_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ c : Real, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, square_integrable_on(f, s) && square_integrable_on(g, s) → l2product(s, (x : Real) => c * f(x), g) == c * l2product(s, f, g)"), t162))
}

///|
let l2product_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_LMUL")

///|
/// `L2PRODUCT_LMUL`
pub fn l2product_lmul() -> @kernel.Thm {
  l2product_lmul_c.get()
}

///|
/// L2PRODUCT_RMUL
fn step_44() -> Unit raise {
  let t163 = @simp.simp_tac(@list.List([l2product_lmul()]))
  let t164 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([l2product_sym()])), t163)
  l2product_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ c : Real, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, square_integrable_on(f, s) && square_integrable_on(g, s) → l2product(s, f, (x : Real) => c * g(x)) == c * l2product(s, f, g)"), t164))
}

///|
let l2product_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2PRODUCT_RMUL")

///|
/// `L2PRODUCT_RMUL`
pub fn l2product_rmul() -> @kernel.Thm {
  l2product_rmul_c.get()
}

///|
/// L2NORM_LMUL
fn step_45() -> Unit raise {
  let t168 = @simp.rewrite_tac(@list.List([@real.sqrt_mul(), @real.pow_2_sqrt_abs()]))
  let t167 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc(), @equal.gsym(@realarith.real_pow_2())]))
  let t166 = @simp.asm_simp_tac(@list.List([l2product_rmul(), square_integrable_lmul()]))
  let t165 = @simp.asm_simp_tac(@list.List([l2norm(), l2product_lmul(), square_integrable_lmul()]))
  let t169 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t165), t166), t167), t168)
  l2norm_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, ∀ c : Real, square_integrable_on(f, s) → l2norm(s, (x : Real) => c * f(x)) == abs(c) * l2norm(s, f)"), t169))
}

///|
let l2norm_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_LMUL")

///|
/// `L2NORM_LMUL`
pub fn l2norm_lmul() -> @kernel.Thm {
  l2norm_lmul_c.get()
}

///|
/// L2NORM_RMUL
fn step_46() -> Unit raise {
  let t170 = @simp.rewrite_tac(@list.List([l2norm_lmul()]))
  let t171 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])), t170)
  l2norm_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, ∀ c : Real, square_integrable_on(f, s) → l2norm(s, (x : Real) => f(x) * c) == l2norm(s, f) * abs(c)"), t171))
}

///|
let l2norm_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_RMUL")

///|
/// `L2NORM_RMUL`
pub fn l2norm_rmul() -> @kernel.Thm {
  l2norm_rmul_c.get()
}

///|
/// L2NORM_NEG
fn step_47() -> Unit raise {
  let t172 = @simp.simp_tac(@list.List([l2norm_lmul(), @calc_int.real_abs_neg(), @calc_int.real_abs_num(), @realax.real_mul_lid()]))
  let t173 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(x : Real) == -real_of_num(1) * x"))])), t172)
  l2norm_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) → l2norm(s, (x : Real) => -f(x)) == l2norm(s, f)"), t173))
}

///|
let l2norm_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_NEG")

///|
/// `L2NORM_NEG`
pub fn l2norm_neg() -> @kernel.Thm {
  l2norm_neg_c.get()
}

///|
/// L2NORM_SUB
fn step_48() -> Unit raise {
  let t182 = @simp.asm_simp_tac(@list.List([l2norm_neg(), square_integrable_sub(), @class.eta_ax()]))
  let t181 = @simp.gen_rewrite_tac(fn(x180 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x174 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s175 = @equal.land_conv(x174)
      fn(x176 : @kernel.Term) -> @kernel.Thm raise {
        s175(x176)
      }
    })((fn(x177 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s178 = @equal.once_depth_conv(x177)
      fn(x179 : @kernel.Term) -> @kernel.Thm raise {
        s178(x179)
      }
    })(x180))
  }, @list.List([@equal.gsym(@realarith.real_neg_sub())]))
  let t183 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t181), t182)
  l2norm_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ s : (Real) -> Bool, square_integrable_on(f, s) && square_integrable_on(g, s) → l2norm(s, (x : Real) => f(x) - g(x)) == l2norm(s, (x : Real) => g(x) - f(x))"), t183))
}

///|
let l2norm_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2NORM_SUB")

///|
/// `L2NORM_SUB`
pub fn l2norm_sub() -> @kernel.Thm {
  l2norm_sub_c.get()
}

///|
/// L2_SUMMABLE
fn step_49() -> Unit raise {
  let t231 = @simp.asm_simp_tac(@list.List([@sets.finite_inter(), @sets.in_inter(), @iterate.finite_numseg()]))
  let t230 = @tactics.match_mp_tac(square_integrable_sum())
  let t229 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax()]))
  let t228 = @tactics.match_mp_tac(square_integrable_sub())
  let t227 = @tactics.match_mp_tac(@equal.gsym(l2norm_lnorm()))
  let t226 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t225 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t224 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t223 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Real) -> Real, ((x : Cart[Real, Unit]) => lift(f(drop(x)))) == o(lift, o(f, drop))"), fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x221
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t218 = @equal.gsym(@vectors.lift_sum())
  let t219 = @simp.rewrite_rule(@list.List([@trivia.o_def()]))(t218)
  let t220 = @simp.simp_tac(@list.List([@trivia.o_def(), @equal.gsym(@vectors.lift_sub()), t219, @iterate.finite_numseg(), @sets.finite_inter()]))
  let t217 = @simp.asm_rewrite_tac(@list.List([]))
  let t216 = @class.asm_cases_tac(@term_syntax.parse_term("square_integrable_on((h : (Real) -> Real), (s : (Real) -> Bool))"))
  let t215 = @tactics.disch_then(fn(x212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x212
    let t214 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(h : (Real) -> Real)")), t214)
  })
  let t211 = @simp.rewrite_tac(@list.List([@equal.gsym(square_integrable_lspace())]))
  let t210 = @simp.abbrev_tac(@term_syntax.parse_term("(h : (Real) -> Real) == o(drop, o((g : (Cart[Real, Unit]) -> Cart[Real, Unit]), lift))"))
  let t209 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_def(), @vectors.lift_drop()])), @tactics.all_tac])
  let t208 = @tactics.subgoal_then(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, Unit]) == o(lift, o(o(drop, o(g, lift)), drop))"), fn(x205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s206 = @tactics.subst1_tac(x205)
    fn(x207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s206(x207)
    }
  })
  let t232 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, Unit])"))(fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s203 = @tactics.mp_tac(x202)
    fn(x204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s203(x204)
    }
  })), t208), t209), t210), t211), t215), t216), t217), t220), t223), t224), t225), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t226), @tactics.gen_tac), t227), t228), t229), t230), t231)
  let t201 = @simp.asm_simp_tac(@list.List([@equal.gsym(l2norm_lnorm()), @sets.in_inter(), @class.eta_ax()]))
  let t200 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t199 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t198 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t197 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t196 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t195 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t194 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t193 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t192 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t191 = @simp.rewrite_tac(@list.List([@realanalysis.real_summable(), @realanalysis.real_sums(), @realanalysis.reallim_sequentially()]))
  let t190 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t233 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("real_summable((t : (Num) -> Bool), (i : Num) => l2norm((s : (Real) -> Bool), (f : (Num, Real) -> Real)(i)))")), t190), t191), @tactics.ap_term_tac), t192), t193), @tactics.ap_term_tac), t194), t195), @tactics.ap_term_tac), @tactics.ap_term_tac), t196), t197), @tactics.ap_term_tac), t198), t199), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t200), t201), t232])
  let t189 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t188 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(square_integrable_lspace())]))
  let t184 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t185 = @term_syntax.parse_term("IMAGE(lift, (s : (Real) -> Bool))")
  let t186 = @term_syntax.parse_term("real_of_num(2)")
  let t187 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => o(lift, o((f : (Num, Real) -> Real)(n), drop))"), t186, t185, t184]), @lpspaces.lspace_summable()))
  let t234 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t187), t188), t189), @tactics.ants_tac), t233)
  l2_summable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, Real) -> Real, ∀ s : (Real) -> Bool, ∀ t : (Num) -> Bool, (∀ i : Num, IN(i, t) → square_integrable_on(f(i), s)) && real_summable(t, (i : Num) => l2norm(s, f(i))) → (∃ g : (Real) -> Real, square_integrable_on(g, s) && op_minus_minus_minus_gt((n : Num) => l2norm(s, (x : Real) => sum(INTER(t, op_dot_dot(0, n)), (i : Num) => f(i, x)) - g(x)), real_of_num(0), sequentially))"), t234))
}

///|
let l2_summable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2_SUMMABLE")

///|
/// `L2_SUMMABLE`
pub fn l2_summable() -> @kernel.Thm {
  l2_summable_c.get()
}

///|
/// L2_COMPLETE
fn step_50() -> Unit raise {
  let t263 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x - real_of_num(0)) == x")), @arith.ge(), l2norm_pos_le(), square_integrable_sub(), @class.eta_ax()]))
  let t262 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t259 = @simp.asm_simp_tac(@list.List([@equal.gsym(l2norm_lnorm()), square_integrable_sub(), @class.eta_ax()]))
  let t260 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop(), @vectors.lift_sub()])), t259])
  let t261 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ((x : Cart[Real, Unit]) => o(lift, o(f, drop), x) - o(lift, o(g, drop), x)) == o(lift, o((y : Real) => f(y) - g(y), drop))"), fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x257
    @simp.rewrite_tac(@list.List([th_1]))
  }), t260)
  let t254 = @simp.asm_rewrite_tac(@list.List([]))
  let t253 = @class.asm_cases_tac(@term_syntax.parse_term("square_integrable_on((h : (Real) -> Real), (s : (Real) -> Bool))"))
  let t252 = @tactics.disch_then(fn(x249 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x249
    let t251 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(h : (Real) -> Real)")), t251)
  })
  let t248 = @simp.rewrite_tac(@list.List([@equal.gsym(square_integrable_lspace())]))
  let t247 = @simp.abbrev_tac(@term_syntax.parse_term("(h : (Real) -> Real) == o(drop, o((g : (Cart[Real, Unit]) -> Cart[Real, Unit]), lift))"))
  let t246 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_def(), @vectors.lift_drop()])), @tactics.all_tac])
  let t245 = @tactics.subgoal_then(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, Unit]) == o(lift, o(o(drop, o(g, lift)), drop))"), fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s243 = @tactics.subst1_tac(x242)
    fn(x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s243(x244)
    }
  })
  let t255 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, Unit])"))(fn(x239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s240 = @tactics.mp_tac(x239)
    fn(x241 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s240(x241)
    }
  })), t245), t246), t247), t248), t252), t253), t254)
  let t256 = @list.List([@tactics.conv_tac(@calc_rat.real_rat_reduce_conv), t255])
  let t238 = @simp.asm_simp_tac(@list.List([@equal.gsym(square_integrable_lspace())]))
  let t235 = @term_syntax.parse_term("IMAGE(lift, (s : (Real) -> Bool))")
  let t236 = @term_syntax.parse_term("real_of_num(2)")
  let t237 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => o(lift, o((f : (Num, Real) -> Real)(n), drop))"), t236, t235]), @lpspaces.riesz_fischer()))
  let t264 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t237), t238), @tactics.ants_tac), t256), t261), t262), t263)
  l2_complete_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, Real) -> Real, ∀ s : (Real) -> Bool, (∀ i : Num, square_integrable_on(f(i), s)) && (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ m : Num, ∀ n : Num, m >= N && n >= N → l2norm(s, (x : Real) => f(m, x) - f(n, x)) < e)) → (∃ g : (Real) -> Real, square_integrable_on(g, s) && op_minus_minus_minus_gt((n : Num) => l2norm(s, (x : Real) => f(n, x) - g(x)), real_of_num(0), sequentially))"), t264))
}

///|
let l2_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2_COMPLETE")

///|
/// `L2_COMPLETE`
pub fn l2_complete() -> @kernel.Thm {
  l2_complete_c.get()
}

///|
/// SQUARE_INTEGRABLE_APPROXIMATE_CONTINUOUS
fn step_51() -> Unit raise {
  let t278 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop(), @vectors.lift_sub()]))
  let t275 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) → x == (y : Real) → y < e")))
  let t277 = @tactics.first_x_assum(fn(x276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t275(x276))
  })
  let t279 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.asm_simp_tac(@list.List([l2norm_lnorm(), square_integrable_sub(), @class.eta_ax()]))), t277), t278)
  let t280 = @list.List([@simp.asm_rewrite_tac(@list.List([square_integrable_lspace(), @trivia.o_def(), @vectors.lift_drop(), @class.eta_ax()])), t279])
  let t274 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t273 = @list.List([@simp.asm_rewrite_tac(@list.List([@realanalysis.real_continuous_on_v1(), @trivia.o_def(), @vectors.lift_drop(), @class.eta_ax(), @vectors.image_lift_univ()])), @tactics.all_tac])
  let t272 = @tactics.exists_tac(@term_syntax.parse_term("o(drop, o((g : (Cart[Real, Unit]) -> Cart[Real, Unit]), lift))"))
  let t271 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, Unit])"))(@tactics.strip_assume_tac))
  let t269 = @equal.gsym(@realanalysis.real_measurable_measurable())
  let t270 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(square_integrable_lspace()), @realax.real_of_num_le(), @calc_num.arith(), t269]))
  let t265 = @term_syntax.parse_term("(e : Real)")
  let t266 = @term_syntax.parse_term("real_of_num(2)")
  let t267 = @term_syntax.parse_term("IMAGE(lift, (s : (Real) -> Bool))")
  let t268 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("o(lift, o((f : (Real) -> Real), drop))"), t267, t266, t265]), @lpspaces.lspace_approximate_continuous()))
  let t281 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t268), t270), t271), t272), @tactics.conj_tac), t273), t274), @tactics.conj_tac), t280)
  square_integrable_approximate_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, ∀ e : Real, real_measurable(s) && square_integrable_on(f, s) && real_of_num(0) < e → (∃ g : (Real) -> Real, real_continuous_on(g, UNIV) && square_integrable_on(g, s) && l2norm(s, (x : Real) => f(x) - g(x)) < e)"), t281))
}

///|
let square_integrable_approximate_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_APPROXIMATE_CONTINUOUS")

///|
/// `SQUARE_INTEGRABLE_APPROXIMATE_CONTINUOUS`
pub fn square_integrable_approximate_continuous() -> @kernel.Thm {
  square_integrable_approximate_continuous_c.get()
}

///|
/// SCHWARZ_BOUND
fn step_52() -> Unit raise {
  let t322 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t319 = @simp.gen_rewrite_rule(fn(x318 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x318
  }, @list.List([@realanalysis.real_integrable_on_v1()]))
  let t321 = @tactics.first_x_assum(fn(x320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s316 = @tactics.mp_tac(x315)
      fn(x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s316(x317)
      }
    })(t319(x320))
  })
  let t314 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @real.real_le_pow_2()]))
  let t313 = @tactics.match_mp_tac(@integration.integral_drop_pos())
  let t312 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= x) == (real_of_num(0) <= x)"))]))
  let t311 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measure_pos_le()]))
  let t310 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t309 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t308 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_measure_measure())]))
  let t307 = @simp.rewrite_tac(@list.List([@real.real_pow_1(), @trivia.o_def(), @vectors.norm_1(), @vectors.lift_drop(), @real.real_pow2_abs()]))
  let t306 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_v1(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t305 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x299 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s300 = @tactics.assume_tac(x299)
    fn(x301 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s300(x301)
    }
  }, fn(x302 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s303 = @tactics.mp_tac(x302)
    fn(x304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s303(x304)
    }
  }))
  let t296 = @simp.gen_rewrite_rule(fn(x295 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x295
  }, @list.List([square_integrable_on()]))
  let t298 = @tactics.first_x_assum(fn(x297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t296(x297))
  })
  let t294 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_on_v1()), @transcendentals.rpow_pow()]))
  let t293 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t290 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@lpspaces.hoelder_bound()))
  let t292 = @tactics.disch_then(fn(x291 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s288 = @tactics.mp_tac(x287)
      fn(x289 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s288(x289)
      }
    })(t290(x291))
  })
  let t286 = @simp.rewrite_tac(@list.List([square_integrable_lspace(), @realanalysis.real_measurable_measurable()]))
  let t285 = @tactics.disch_then(fn(x282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x282
    let t284 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.strip_assume_tac(th), t284)
  })
  let t323 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t285), t286), t292), t293), t294), t298), t305), t306), t307), t308), t309), t310), t311), t312), t313), t314), t321), t322)
  schwarz_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, real_measurable(s) && square_integrable_on(f, s) → absolutely_real_integrable_on(f, s) && pow(real_integral(s, f), 2) <= real_measure(s) * real_integral(s, (x : Real) => pow(f(x), 2))"), t323))
}

///|
let schwarz_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCHWARZ_BOUND")

///|
/// `SCHWARZ_BOUND`
pub fn schwarz_bound() -> @kernel.Thm {
  schwarz_bound_c.get()
}

///|
/// orthonormal_system
fn step_53() -> Unit raise {
  orthonormal_system_c.set(@pair.new_definition(@term_syntax.parse_term("(orthonormal_system : ((Real) -> Bool, (_, Real) -> Real) -> Bool)((s : (Real) -> Bool), (w : (_, Real) -> Real)) == (∀ m : _, ∀ n : _, l2product(s, w(m), w(n)) == (if m == n { real_of_num(1) } else { real_of_num(0) }))")))
}

///|
let orthonormal_system_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orthonormal_system")

///|
/// `orthonormal_system`
pub fn orthonormal_system() -> @kernel.Thm {
  orthonormal_system_c.get()
}

///|
/// orthonormal_coefficient
fn step_54() -> Unit raise {
  orthonormal_coefficient_c.set(@pair.new_definition(@term_syntax.parse_term("(orthonormal_coefficient : ((Real) -> Bool, (Num, Real) -> Real, (Real) -> Real, Num) -> Real)((s : (Real) -> Bool), (w : (Num, Real) -> Real), (f : (Real) -> Real), (n : Num)) == l2product(s, w(n), f)")))
}

///|
let orthonormal_coefficient_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orthonormal_coefficient")

///|
/// `orthonormal_coefficient`
pub fn orthonormal_coefficient() -> @kernel.Thm {
  orthonormal_coefficient_c.get()
}

///|
/// ORTHONORMAL_SYSTEM_L2NORM
fn step_55() -> Unit raise {
  let t324 = @simp.simp_tac(@list.List([orthonormal_system(), l2norm(), @real.sqrt_1()]))
  orthonormal_system_l2norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ w : (_, Real) -> Real, orthonormal_system(s, w) → (∀ i : _, l2norm(s, w(i)) == real_of_num(1))"), t324))
}

///|
let orthonormal_system_l2norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHONORMAL_SYSTEM_L2NORM")

///|
/// `ORTHONORMAL_SYSTEM_L2NORM`
pub fn orthonormal_system_l2norm() -> @kernel.Thm {
  orthonormal_system_l2norm_c.get()
}

///|
/// ORTHONORMAL_PARTIAL_SUM_DIFF
fn step_56() -> Unit raise {
  let t341 = @simp.rewrite_tac(@list.List([l2product_sym()]))
  let t340 = @simp.rewrite_tac(@list.List([orthonormal_coefficient(), @realarith.real_mul_rid(), @equal.gsym(@realarith.real_pow_2())]))
  let t339 = @simp.asm_simp_tac(@list.List([@class.cond_rand(), @calc_int.real_mul_rzero(), @iterate.sum_delta()]))
  let t338 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([orthonormal_system()])))
  let t337 = @simp.asm_simp_tac(@list.List([l2product_lmul(), square_integrable_lmul(), @class.eta_ax()]))
  let t336 = @simp.asm_simp_tac(@list.List([l2product_rmul(), square_integrable_lmul(), @class.eta_ax()]))
  let t335 = @simp.asm_simp_tac(@list.List([l2product_lsum(), square_integrable_lmul(), @iterate.finite_numseg(), @class.eta_ax()]))
  let t334 = @simp.asm_simp_tac(@list.List([l2product_rsum(), @class.eta_ax(), square_integrable_lmul(), @iterate.finite_numseg(), square_integrable_sum()]))
  let t333 = @list.List([@simp.asm_rewrite_tac(@list.List([l2product_sym()])), @tactics.all_tac])
  let t332 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x' : Real) == (x : Real) && (b : Real) - real_of_num(2) * x == (c : Real) → (a : Real) - x - (x' - b) == a + c")))
  let t331 = @simp.asm_simp_tac(@list.List([square_integrable_sub(), @class.eta_ax(), l2product_rsub()]))
  let t330 = @simp.asm_simp_tac(@list.List([l2norm_pow_2(), square_integrable_sub(), @class.eta_ax(), l2product_lsub()]))
  let t329 = @list.List([@simp.asm_simp_tac(@list.List([square_integrable_sum(), @class.eta_ax(), @iterate.finite_numseg(), square_integrable_lmul()])), @tactics.all_tac])
  let t328 = @tactics.subgoal_then(@term_syntax.parse_term("square_integrable_on((x : Real) => sum((t : (Num) -> Bool), (i : Num) => (a : (Num) -> Real)(i) * (w : (Num, Real) -> Real)(i, x)), (s : (Real) -> Bool))"), fn(x325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s326 = @tactics.assume_tac(x325)
    fn(x327 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s326(x327)
    }
  })
  let t342 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t328), t329), t330), t331), t332), @tactics.conj_tac), t333), t334), t335), t336), t337), t338), t339), t340), t341)
  orthonormal_partial_sum_diff_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ w : (Num, Real) -> Real, ∀ a : (Num) -> Real, ∀ f : (Real) -> Real, ∀ t : (Num) -> Bool, orthonormal_system(s, w) && (∀ i : Num, square_integrable_on(w(i), s)) && square_integrable_on(f, s) && FINITE(t) → pow(l2norm(s, (x : Real) => f(x) - sum(t, (i : Num) => a(i) * w(i, x))), 2) == pow(l2norm(s, f), 2) + (sum(t, (i : Num) => pow(a(i), 2)) - real_of_num(2) * sum(t, (i : Num) => a(i) * orthonormal_coefficient(s, w, f, i)))"), t342))
}

///|
let orthonormal_partial_sum_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHONORMAL_PARTIAL_SUM_DIFF")

///|
/// `ORTHONORMAL_PARTIAL_SUM_DIFF`
pub fn orthonormal_partial_sum_diff() -> @kernel.Thm {
  orthonormal_partial_sum_diff_c.get()
}

///|
/// ORTHONORMAL_OPTIMAL_PARTIAL_SUM
fn step_57() -> Unit raise {
  let t358 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t357 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow((b : Real), 2) - real_of_num(2) * (b * b) <= pow((a : Real), 2) - real_of_num(2) * (a * b)) == (real_of_num(0) <= pow(a - b, 2))"))]))
  let t356 = @simp.asm_rewrite_tac(@list.List([]))
  let t355 = @tactics.match_mp_tac(@iterate.sum_le())
  let t353 = @equal.gsym(@iterate.sum_sub())
  let t354 = @simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.sum_lmul()), t353]))
  let t352 = @simp.rewrite_tac(@list.List([@real.real_le_ladd()]))
  let t351 = @simp.asm_simp_tac(@list.List([orthonormal_partial_sum_diff()]))
  let t349 = @list.List([l2norm_le(), square_integrable_sum(), @class.eta_ax(), @iterate.finite_numseg(), @equal.gsym(l2norm_pow_2()), square_integrable_lmul(), square_integrable_sub()])
  let t346 = @simp.basic_ss(@list.List([]))
  let t350 = @tactics.asm_tac(fn(x348 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x343 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s344 = @tactics.conv_tac(x343)
      fn(x345 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s344(x345)
      }
    })(((x347 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t346, 5, x347))(x348))
  })(t349)
  let t359 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t350), t351), t352), t354), t355), t356), t357), t358)
  orthonormal_optimal_partial_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ w : (Num, Real) -> Real, ∀ a : (Num) -> Real, ∀ f : (Real) -> Real, ∀ t : (Num) -> Bool, orthonormal_system(s, w) && (∀ i : Num, square_integrable_on(w(i), s)) && square_integrable_on(f, s) && FINITE(t) → l2norm(s, (x : Real) => f(x) - sum(t, (i : Num) => orthonormal_coefficient(s, w, f, i) * w(i, x))) <= l2norm(s, (x : Real) => f(x) - sum(t, (i : Num) => a(i) * w(i, x)))"), t359))
}

///|
let orthonormal_optimal_partial_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHONORMAL_OPTIMAL_PARTIAL_SUM")

///|
/// `ORTHONORMAL_OPTIMAL_PARTIAL_SUM`
pub fn orthonormal_optimal_partial_sum() -> @kernel.Thm {
  orthonormal_optimal_partial_sum_c.get()
}

///|
/// BESSEL_INEQUALITY
fn step_58() -> Unit raise {
  let t376 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t375 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (p : Real) → p == (x : Real) - (y : Real) → y <= x")))
  let t373 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + ((b : Real) - real_of_num(2) * b) == a - b"))
  let t374 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), t373]))
  let t369 = @term_syntax.parse_term("orthonormal_coefficient((s : (Real) -> Bool), (w : (Num, Real) -> Real), (f : (Real) -> Real))")
  let t372 = @tactics.disch_then(fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s367 = @tactics.mp_tac(x366)
      fn(x368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s367(x368)
      }
    })(((x370 : @kernel.Thm) => @bool.spec(t369, x370))(x371))
  })
  let t363 = @drule.match_mp(orthonormal_partial_sum_diff())
  let t365 = @tactics.first_assum(fn(x364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s361 = @tactics.mp_tac(x360)
      fn(x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s361(x362)
      }
    })(t363(x364))
  })
  let t377 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t365), t372), t374), t375), t376)
  bessel_inequality_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ w : (Num, Real) -> Real, ∀ f : (Real) -> Real, ∀ t : (Num) -> Bool, orthonormal_system(s, w) && (∀ i : Num, square_integrable_on(w(i), s)) && square_integrable_on(f, s) && FINITE(t) → sum(t, (i : Num) => pow(orthonormal_coefficient(s, w, f, i), 2)) <= pow(l2norm(s, f), 2)"), t377))
}

///|
let bessel_inequality_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BESSEL_INEQUALITY")

///|
/// `BESSEL_INEQUALITY`
pub fn bessel_inequality() -> @kernel.Thm {
  bessel_inequality_c.get()
}

///|
/// FOURIER_SERIES_SQUARE_SUMMABLE
fn step_59() -> Unit raise {
  let t396 = @simp.rewrite_tac(@list.List([@iterate.subset_numseg()]))
  let t395 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(INTER((u : (_) -> Bool), s), INTER(u, t))")))
  let t394 = @simp.simp_tac(@list.List([@sets.inter_subset(), @iterate.finite_numseg(), @real.real_le_pow_2(), @sets.finite_inter()]))
  let t393 = @tactics.match_mp_tac(@iterate.sum_subset_simple())
  let t397 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @tactics.repeat_tac(@tactics.strip_tac)), t393), t394), t395), t396), @int.asm_arith_tac)
  let t392 = @simp.simp_tac(@list.List([@sets.finite_inter(), @sets.subset_refl(), @iterate.finite_numseg(), @real.real_le_pow_2()]))
  let t391 = @tactics.match_mp_tac(@iterate.sum_subset_simple())
  let t390 = @simp.simp_tac(@list.List([@iterate.sum_pos_le(), @sets.finite_inter(), @iterate.finite_numseg(), @real.real_le_pow_2()]))
  let t389 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (y : Real) → abs(x) <= y")))
  let t388 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realax.real_le_trans()))
  let t387 = @simp.asm_simp_tac(@list.List([@sets.finite_inter(), @iterate.finite_numseg()]))
  let t383 = @term_syntax.parse_term("INTER((t : (Num) -> Bool), op_dot_dot(0, (n : Num)))")
  let t384 = @term_syntax.parse_term("(f : (Real) -> Real)")
  let t385 = @term_syntax.parse_term("(w : (Num, Real) -> Real)")
  let t386 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Real) -> Bool)"), t385, t384, t383]), bessel_inequality()))
  let t398 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t386), t387), t388), t389), t390), t391), t392), t397])
  let t382 = @tactics.disch_then(@tactics.match_mp_tac)
  let t381 = @simp.rewrite_tac(@list.List([]))
  let t379 = @term_syntax.parse_term("pow(l2norm((s : (Real) -> Bool), (f : (Real) -> Real)), 2)")
  let t380 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => sum(INTER((t : (Num) -> Bool), op_dot_dot(0, n)), (i : Num) => pow(orthonormal_coefficient((s : (Real) -> Bool), (w : (Num, Real) -> Real), (f : (Real) -> Real), i), 2))"), t379]), @misc.convergent_bounded_monotone()))
  let t378 = @simp.rewrite_tac(@list.List([@realanalysis.real_summable(), @realanalysis.real_sums(), @realanalysis.reallim_sequentially()]))
  let t399 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t378), t380), t381), t382), @tactics.conj_tac), t398)
  fourier_series_square_summable_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ w : (Num, Real) -> Real, ∀ f : (Real) -> Real, ∀ t : (Num) -> Bool, orthonormal_system(s, w) && (∀ i : Num, square_integrable_on(w(i), s)) && square_integrable_on(f, s) → real_summable(t, (i : Num) => pow(orthonormal_coefficient(s, w, f, i), 2))"), t399))
}

///|
let fourier_series_square_summable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SERIES_SQUARE_SUMMABLE")

///|
/// `FOURIER_SERIES_SQUARE_SUMMABLE`
pub fn fourier_series_square_summable() -> @kernel.Thm {
  fourier_series_square_summable_c.get()
}

///|
/// ORTHONORMAL_FOURIER_PARTIAL_SUM_DIFF_SQUARED
fn step_60() -> Unit raise {
  let t413 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + ((b : Real) - real_of_num(2) * b) == a - b"))
  let t414 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), t413]))
  let t409 = @term_syntax.parse_term("orthonormal_coefficient((s : (Real) -> Bool), (w : (Num, Real) -> Real), (f : (Real) -> Real))")
  let t412 = @tactics.disch_then(fn(x411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s407 = @tactics.mp_tac(x406)
      fn(x408 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s407(x408)
      }
    })(((x410 : @kernel.Thm) => @bool.spec(t409, x410))(x411))
  })
  let t403 = @drule.match_mp(orthonormal_partial_sum_diff())
  let t405 = @tactics.first_assum(fn(x404 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s401 = @tactics.mp_tac(x400)
      fn(x402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s401(x402)
      }
    })(t403(x404))
  })
  let t415 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t405), t412), t414)
  orthonormal_fourier_partial_sum_diff_squared_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ w : (Num, Real) -> Real, ∀ a : _, ∀ f : (Real) -> Real, ∀ t : (Num) -> Bool, orthonormal_system(s, w) && (∀ i : Num, square_integrable_on(w(i), s)) && square_integrable_on(f, s) && FINITE(t) → pow(l2norm(s, (x : Real) => f(x) - sum(t, (i : Num) => orthonormal_coefficient(s, w, f, i) * w(i, x))), 2) == pow(l2norm(s, f), 2) - sum(t, (i : Num) => pow(orthonormal_coefficient(s, w, f, i), 2))"), t415))
}

///|
let orthonormal_fourier_partial_sum_diff_squared_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHONORMAL_FOURIER_PARTIAL_SUM_DIFF_SQUARED")

///|
/// `ORTHONORMAL_FOURIER_PARTIAL_SUM_DIFF_SQUARED`
pub fn orthonormal_fourier_partial_sum_diff_squared() -> @kernel.Thm {
  orthonormal_fourier_partial_sum_diff_squared_c.get()
}

///|
/// FOURIER_SERIES_L2_SUMMABLE
fn step_61() -> Unit raise {
  let t482 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid(), @realarith.real_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= abs(x)"))]))
  let t481 = @simp.asm_simp_tac(@list.List([@class.cond_rand(), @calc_int.real_mul_rzero(), @iterate.sum_delta()]))
  let t480 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([orthonormal_system()])))
  let t479 = @simp.asm_simp_tac(@list.List([l2product_lmul(), square_integrable_lmul(), @class.eta_ax()]))
  let t478 = @simp.asm_simp_tac(@list.List([l2product_rmul(), square_integrable_lmul(), @class.eta_ax()]))
  let t477 = @simp.asm_simp_tac(@list.List([l2product_lsum(), square_integrable_lmul(), @iterate.finite_numseg(), @sets.finite_inter(), @class.eta_ax()]))
  let t476 = @simp.asm_simp_tac(@list.List([l2product_rsum(), @class.eta_ax(), square_integrable_lmul(), @iterate.finite_numseg(), @sets.finite_inter(), square_integrable_sum()]))
  let t475 = @simp.asm_simp_tac(@list.List([l2norm_pow_2(), square_integrable_sum(), @sets.finite_inter(), @iterate.finite_numseg(), square_integrable_lmul(), @class.eta_ax()]))
  let t474 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) → y < (e : Real) → x < e")))
  let t472 = @simp.asm_rewrite_tac(@list.List([]))
  let t471 = @class.asm_cases_tac(@term_syntax.parse_term("IN((i : Num), (t : (Num) -> Bool))"))
  let t470 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t469 = @simp.simp_tac(@list.List([@sets.finite_inter(), @iterate.finite_numseg(), @sets.extension(), @sets.in_inter(), @sets.not_in_empty(), @sets.in_union(), @iterate.in_numseg()]))
  let t468 = @tactics.match_mp_tac(@iterate.sum_union_eq())
  let t467 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) == (c : Real)) == (b + c == a)"))]))
  let t473 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(h : (Num) -> Real)")), t467), t468), t469), @tactics.conj_tac), t470), t471), t472), @int.asm_arith_tac), @tactics.all_tac])
  let t466 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Num) -> Real, sum(INTER((t : (Num) -> Bool), op_dot_dot(0, (n : Num))), f) - sum(INTER(t, op_dot_dot(0, (m : Num))), f) == sum(INTER(t, op_dot_dot(m + 1, n)), f)"), fn(x464 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x464
    @simp.rewrite_tac(@list.List([th]))
  })
  let t463 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop()]))
  let t462 = @simp.simp_tac(@list.List([@vectors.dist_real(), @equal.gsym(@vectors.drop_()), @vectors.drop_vsum(), @sets.finite_inter(), @iterate.finite_numseg()]))
  let t457 = @term_syntax.parse_term("(m : Num)")
  let t458 = @list.List([@term_syntax.parse_term("(n : Num)"), t457])
  let t461 = @tactics.first_x_assum(fn(x460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x454 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s455 = @tactics.mp_tac(x454)
      fn(x456 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s455(x456)
      }
    })(((x459 : @kernel.Thm) => @bool.specl(t458, x459))(x460))
  })
  let t453 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t452 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t451 = @tactics.match_mp_tac(@real.real_pow_lt2_rev())
  let t450 = @tactics.repeat_tac(@tactics.strip_tac)
  let t448 = @simp.asm_simp_tac(@list.List([square_integrable_sum(), @sets.finite_inter(), @iterate.finite_numseg(), square_integrable_lmul(), @class.eta_ax()]))
  let t447 = @tactics.match_mp_tac(l2norm_sub())
  let t446 = @simp.asm_rewrite_tac(@list.List([]))
  let t445 = @class.asm_cases_tac(@term_syntax.parse_term("(N : Num) <= (n : Num)"))
  let t449 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(N : Num) <= (m : Num)")), t445), t446), @tactics.ap_thm_tac), @tactics.ap_term_tac), t447), t448), @tactics.all_tac])
  let t443 = @term_syntax.parse_term("(n : Num)")
  let t444 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(m : Num)"), t443]))
  let t442 = @tactics.match_mp_tac(@arith.wlog_le())
  let t441 = @simp.gen_rewrite_tac(fn(x440 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x440
  }, @list.List([@theorems.swap_forall_thm()]))
  let t439 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t438 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t437 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt()]))
  let t433 = @term_syntax.parse_term("pow((e : Real), 2)")
  let t436 = @tactics.disch_then(fn(x435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s431 = @tactics.mp_tac(x430)
      fn(x432 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s431(x432)
      }
    })(((x434 : @kernel.Thm) => @bool.spec(t433, x434))(x435))
  })
  let t429 = @simp.rewrite_tac(@list.List([@topology.cauchy(), @arith.ge()]))
  let t428 = @simp.rewrite_tac(@list.List([@realanalysis.real_summable_v1(), @topology.summable(), @topology.sums(), @topology.convergent_eq_cauchy()]))
  let t425 = @drule.match_mp(fourier_series_square_summable())
  let t422 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t427 = @tactics.first_assum(fn(x426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x419 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s420 = @tactics.mp_tac(x419)
        fn(x421 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s420(x421)
        }
      })(((x423 : @kernel.Thm) => @bool.spec(t422, x423))(x424))
    })(t425(x426))
  })
  let t418 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t417 = @simp.asm_simp_tac(@list.List([square_integrable_sum(), @sets.finite_inter(), @iterate.finite_numseg(), square_integrable_lmul(), @class.eta_ax()]))
  let t416 = @tactics.match_mp_tac(l2_complete())
  let t483 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t416), t417), t418), @tactics.disch_tac), t427), t428), t429), t436), t437), t438), t439), @tactics.strip_tac), t441), t442), @tactics.conj_tac), t444), t449), t450), t451), t452), t453), t461), t462), t463), t466), t473), t474), t475), t476), t477), t478), t479), t480), t481), t482)
  fourier_series_l2_summable_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ w : (Num, Real) -> Real, ∀ f : (Real) -> Real, ∀ t : (Num) -> Bool, orthonormal_system(s, w) && (∀ i : Num, square_integrable_on(w(i), s)) && square_integrable_on(f, s) → (∃ g : (Real) -> Real, square_integrable_on(g, s) && op_minus_minus_minus_gt((n : Num) => l2norm(s, (x : Real) => sum(INTER(t, op_dot_dot(0, n)), (i : Num) => orthonormal_coefficient(s, w, f, i) * w(i, x)) - g(x)), real_of_num(0), sequentially))"), t483))
}

///|
let fourier_series_l2_summable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SERIES_L2_SUMMABLE")

///|
/// `FOURIER_SERIES_L2_SUMMABLE`
pub fn fourier_series_l2_summable() -> @kernel.Thm {
  fourier_series_l2_summable_c.get()
}

///|
/// FOURIER_SERIES_L2_SUMMABLE_STRONG
fn step_62() -> Unit raise {
  let t550 = @simp.asm_simp_tac(@list.List([orthonormal_system_l2norm(), @realax.real_mul_lid()]))
  let t549 = @simp.asm_simp_tac(@list.List([square_integrable_sub(), square_integrable_sum(), @sets.finite_inter(), @iterate.finite_numseg(), square_integrable_lmul(), @class.eta_ax()]))
  let t543 = @drule.part_match(fn(x542 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x542))
  }, schwartz_inequality_abs())
  let t538 = @simp.rewrite_tac(@list.List([]))
  let t537 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t536 = @tactics.match_mp_tac(@metric.always_eventually())
  let t534 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realanalysis.reallim_null_comparison()))
  let t551 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x535 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t534(x535))
  }), t536), t537), t538), fn(x548 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x545 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x544 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s540 = @tactics.mp_tac(x539)
            fn(x541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s540(x541)
            }
          })(t543(x544))
        })(@equal.lhand(x545))
      })((fn(x546 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x546.1
      })(x547))
    })(x548)(x548)
  }), t549), t550)
  let t533 = @simp.rewrite_tac(@list.List([@real.real_sub_refl()]))
  let t532 = @simp.asm_simp_tac(@list.List([@iterate.sum_delta(), @sets.in_inter(), @iterate.in_numseg(), @arith.le_0(), @realarith.real_mul_rid()]))
  let t531 = @simp.gen_rewrite_tac(fn(x530 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x524 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s525 = @equal.land_conv(x524)
      fn(x526 : @kernel.Term) -> @kernel.Thm raise {
        s525(x526)
      }
    })((fn(x527 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s528 = @equal.once_depth_conv(x527)
      fn(x529 : @kernel.Term) -> @kernel.Thm raise {
        s528(x529)
      }
    })(x530))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t523 = @simp.asm_simp_tac(@list.List([@class.cond_rand(), @calc_int.real_mul_rzero()]))
  let t522 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([orthonormal_system()])))
  let t521 = @simp.asm_simp_tac(@list.List([l2product_rmul(), @class.eta_ax()]))
  let t520 = @simp.asm_simp_tac(@list.List([l2product_rsub(), square_integrable_sum(), l2product_rsum(), @sets.finite_inter(), @iterate.finite_numseg(), square_integrable_lmul(), @class.eta_ax()]))
  let t519 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t518 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num)"))
  let t517 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t552 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_eventually()), t517), t518), t519), @tactics.disch_tac), t520), t521), t522), t523), t531), t532), t533), t551])
  let t516 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t515 = @simp.gen_rewrite_tac(fn(x512 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s513 = @equal.land_conv(x512)
    fn(x514 : @kernel.Term) -> @kernel.Thm raise {
      s513(x514)
    }
  }, @list.List([@equal.gsym(@realax.real_add_lid())]))
  let t508 = @simp.basic_ss(@list.List([]))
  let t511 = @tactics.asm_tac(fn(x510 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x505 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s506 = @tactics.conv_tac(x505)
      fn(x507 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s506(x507)
      }
    })(((x509 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t508, 5, x509))(x510))
  })(@list.List([l2product_radd(), square_integrable_sub(), square_integrable_sum(), @sets.finite_inter(), @iterate.finite_numseg(), square_integrable_lmul(), @class.eta_ax()]))
  let t503 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t502 = @simp.rewrite_tac(@list.List([]))
  let t501 = @tactics.match_mp_tac(@metric.always_eventually())
  let t504 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_eventually()), t501), @tactics.gen_tac), t502), @tactics.ap_term_tac), t503), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t500 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t499 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => l2product((s : (Real) -> Bool), (w : (Num, Real) -> Real)((i : Num)), (x : Real) => (f : (Real) -> Real)(x) - sum(INTER((t : (Num) -> Bool), op_dot_dot(0, n)), (i : Num) => l2product(s, w(i), f) * w(i, x)) + (sum(INTER(t, op_dot_dot(0, n)), (i : Num) => l2product(s, w(i), f) * w(i, x)) - (g : (Real) -> Real)(x)))"))
  let t498 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @realanalysis.reallim_unique()))
  let t497 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t496 = @simp.asm_rewrite_tac(@list.List([orthonormal_coefficient()]))
  let t495 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (Real) -> Real)"))
  let t494 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t493 = @simp.rewrite_tac(@list.List([orthonormal_coefficient()]))
  let t490 = @drule.match_mp(fourier_series_l2_summable())
  let t487 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t492 = @tactics.first_assum(fn(x491 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x489 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x484 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s485 = @tactics.mp_tac(x484)
        fn(x486 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s485(x486)
        }
      })(((x488 : @kernel.Thm) => @bool.spec(t487, x488))(x489))
    })(t490(x491))
  })
  let t553 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t492), t493), t494), t495), @tactics.strip_tac), t496), t497), @tactics.disch_tac), t498), t499), t500), @tactics.conj_tac), t504), t511), t515), t516), @tactics.conj_tac), t552)
  fourier_series_l2_summable_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ w : (Num, Real) -> Real, ∀ f : (Real) -> Real, ∀ t : (Num) -> Bool, orthonormal_system(s, w) && (∀ i : Num, square_integrable_on(w(i), s)) && square_integrable_on(f, s) → (∃ g : (Real) -> Real, square_integrable_on(g, s) && (∀ i : Num, IN(i, t) → orthonormal_coefficient(s, w, (x : Real) => f(x) - g(x), i) == real_of_num(0)) && op_minus_minus_minus_gt((n : Num) => l2norm(s, (x : Real) => sum(INTER(t, op_dot_dot(0, n)), (i : Num) => orthonormal_coefficient(s, w, f, i) * w(i, x)) - g(x)), real_of_num(0), sequentially))"), t553))
}

///|
let fourier_series_l2_summable_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SERIES_L2_SUMMABLE_STRONG")

///|
/// `FOURIER_SERIES_L2_SUMMABLE_STRONG`
pub fn fourier_series_l2_summable_strong() -> @kernel.Thm {
  fourier_series_l2_summable_strong_c.get()
}

///|
/// REAL_INTEGRABLE_ON_INTERVAL_TAC
fn step_63() -> Unit raise {
  let t555 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_on_differentiable()]))
  let t554 = @tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on())
  real_integrable_on_interval_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_continuous()), t554), t555), @tactics.gen_tac), @tactics.disch_tac), @realanalysis.real_differentiable_tac))
}

///|
let real_integrable_on_interval_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("REAL_INTEGRABLE_ON_INTERVAL_TAC")

///|
/// `REAL_INTEGRABLE_ON_INTERVAL_TAC`
pub fn real_integrable_on_interval_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (real_integrable_on_interval_tac_c.get())(x)
}

///|
/// HAS_REAL_INTEGRAL_SIN_NX
fn step_64() -> Unit raise {
  let t575 = @tactics.conv_tac(@calc_rat.real_field)
  let t572 = @simp.gen_rewrite_rule(fn(x569 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s570 = @equal.rand_conv(x569)
    fn(x571 : @kernel.Term) -> @kernel.Thm raise {
      s570(x571)
    }
  }, @list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t574 = @tactics.first_x_assum(fn(x573 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s567 = @tactics.mp_tac(x566)
      fn(x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s567(x568)
      }
    })(t572(x573))
  })
  let t565 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t564 = @tactics.disch_then(@tactics.match_mp_tac)
  let t563 = @simp.rewrite_tac(@list.List([@real.real_sub_refl()]))
  let t562 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rneg(), @transcendentals.sin_npi(), @transcendentals.cos_npi(), @transcendentals.sin_neg(), @transcendentals.cos_neg()]))
  let t561 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= pi → -pi <= pi")), @transcendentals.pi_pos_le()]))
  let t557 = @term_syntax.parse_term("pi")
  let t558 = @term_syntax.parse_term("-pi")
  let t559 = @term_syntax.parse_term("(x : Real) => sin(real_of_num((n : Num)) * x)")
  let t560 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => -(inv(real_of_num((n : Num))) * cos(real_of_num(n) * x))"), t559, t558, t557]), @realanalysis.real_fundamental_theorem_of_calculus()))
  let t556 = @simp.asm_rewrite_tac(@list.List([@realanalysis.has_real_integral_0(), @calc_int.real_mul_lzero(), @transcendentals.sin_0()]))
  let t576 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))), t556), t560), t561), t562), t563), t564), t565), @tactics.disch_tac), @realanalysis.real_diff_tac), t574), t575)
  has_real_integral_sin_nx_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, has_real_integral((x : Real) => sin(real_of_num(n) * x), real_of_num(0), real_interval([(-pi, pi)]))"), t576))
}

///|
let has_real_integral_sin_nx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_SIN_NX")

///|
/// `HAS_REAL_INTEGRAL_SIN_NX`
pub fn has_real_integral_sin_nx() -> @kernel.Thm {
  has_real_integral_sin_nx_c.get()
}

///|
/// REAL_INTEGRABLE_SIN_CX
fn step_65() -> Unit raise {
  let t577 = @tactics.then_tac(@tactics.gen_tac, real_integrable_on_interval_tac)
  real_integrable_sin_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, real_integrable_on((x : Real) => sin(c * x), real_interval([(-pi, pi)]))"), t577))
}

///|
let real_integrable_sin_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRABLE_SIN_CX")

///|
/// `REAL_INTEGRABLE_SIN_CX`
pub fn real_integrable_sin_cx() -> @kernel.Thm {
  real_integrable_sin_cx_c.get()
}

///|
/// REAL_INTEGRAL_SIN_NX
fn step_66() -> Unit raise {
  let t578 = @simp.rewrite_tac(@list.List([has_real_integral_sin_nx()]))
  let t579 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@realanalysis.real_integral_unique())), t578)
  real_integral_sin_nx_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, real_integral(real_interval([(-pi, pi)]), (x : Real) => sin(real_of_num(n) * x)) == real_of_num(0)"), t579))
}

///|
let real_integral_sin_nx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRAL_SIN_NX")

///|
/// `REAL_INTEGRAL_SIN_NX`
pub fn real_integral_sin_nx() -> @kernel.Thm {
  real_integral_sin_nx_c.get()
}

///|
/// HAS_REAL_INTEGRAL_COS_NX
fn step_67() -> Unit raise {
  let t600 = @tactics.conv_tac(@calc_rat.real_field)
  let t597 = @simp.gen_rewrite_rule(fn(x594 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s595 = @equal.rand_conv(x594)
    fn(x596 : @kernel.Term) -> @kernel.Thm raise {
      s595(x596)
    }
  }, @list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t599 = @tactics.first_x_assum(fn(x598 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x591 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s592 = @tactics.mp_tac(x591)
      fn(x593 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s592(x593)
      }
    })(t597(x598))
  })
  let t590 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t589 = @tactics.disch_then(@tactics.match_mp_tac)
  let t588 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @calc_int.real_neg_0(), @real.real_sub_refl()]))
  let t587 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rneg(), @transcendentals.sin_npi(), @transcendentals.cos_npi(), @transcendentals.sin_neg(), @transcendentals.cos_neg()]))
  let t586 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= pi → -pi <= pi")), @transcendentals.pi_pos_le()]))
  let t583 = @term_syntax.parse_term("pi")
  let t584 = @term_syntax.parse_term("-pi")
  let t585 = @term_syntax.parse_term("(x : Real) => cos(real_of_num((n : Num)) * x)")
  let t601 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => inv(real_of_num((n : Num))) * sin(real_of_num(n) * x)"), t585, t584, t583]), @realanalysis.real_fundamental_theorem_of_calculus())), t586), t587), t588), t589), t590), @tactics.disch_tac), @realanalysis.real_diff_tac), t599), t600)
  let t582 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t581 = @tactics.match_mp_tac(@realanalysis.has_real_integral_const())
  let t580 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * pi == real_of_num(1) * (pi - -pi)"))]))
  let t602 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@transcendentals.cos_0(), @calc_int.real_mul_lzero()])), t580), t581), t582), @calc_rat.real_arith_tac), t601])
  let t603 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))), t602)
  has_real_integral_cos_nx_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, has_real_integral((x : Real) => cos(real_of_num(n) * x), if n == 0 { real_of_num(2) * pi } else { real_of_num(0) }, real_interval([(-pi, pi)]))"), t603))
}

///|
let has_real_integral_cos_nx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_COS_NX")

///|
/// `HAS_REAL_INTEGRAL_COS_NX`
pub fn has_real_integral_cos_nx() -> @kernel.Thm {
  has_real_integral_cos_nx_c.get()
}

///|
/// REAL_INTEGRABLE_COS_CX
fn step_68() -> Unit raise {
  let t604 = @tactics.then_tac(@tactics.gen_tac, real_integrable_on_interval_tac)
  real_integrable_cos_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, real_integrable_on((x : Real) => cos(c * x), real_interval([(-pi, pi)]))"), t604))
}

///|
let real_integrable_cos_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRABLE_COS_CX")

///|
/// `REAL_INTEGRABLE_COS_CX`
pub fn real_integrable_cos_cx() -> @kernel.Thm {
  real_integrable_cos_cx_c.get()
}

///|
/// REAL_INTEGRAL_COS_NX
fn step_69() -> Unit raise {
  let t605 = @simp.rewrite_tac(@list.List([has_real_integral_cos_nx()]))
  let t606 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@realanalysis.real_integral_unique())), t605)
  real_integral_cos_nx_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, real_integral(real_interval([(-pi, pi)]), (x : Real) => cos(real_of_num(n) * x)) == (if n == 0 { real_of_num(2) * pi } else { real_of_num(0) })"), t606))
}

///|
let real_integral_cos_nx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRAL_COS_NX")

///|
/// `REAL_INTEGRAL_COS_NX`
pub fn real_integral_cos_nx() -> @kernel.Thm {
  real_integral_cos_nx_c.get()
}

///|
/// REAL_INTEGRAL_SIN_AND_COS
fn step_70() -> Unit raise {
  let t623 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + a) * inv(real_of_num(2)) == a")), @calc_int.real_mul_lzero()]))
  let t622 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t621 = @simp.rewrite_tac(@list.List([@arith.add_eq_0()]))
  let t620 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) <= (m : Num) → (m - n == 0) == (m == n)"))]))
  let t619 = @simp.rewrite_tac(@list.List([@real.real_sub_refl(), @calc_int.real_mul_lzero(), @realax.real_add_lid()]))
  let t618 = @simp.rewrite_tac(@list.List([real_integral_sin_nx(), real_integral_cos_nx()]))
  let t617 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_add(), @real.real_of_num_sub()]))
  let t616 = @simp.simp_tac(@list.List([@realanalysis.real_integral_add(), @realanalysis.real_integral_sub(), @realax.real_div(), real_integrable_sin_cx(), real_integrable_cos_cx(), @realanalysis.real_integral_rmul(), @realanalysis.real_integrable_sub(), @realanalysis.real_integrable_add()]))
  let t614 = @equal.gsym(@real.real_sub_rdistrib())
  let t615 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_add_rdistrib()), t614]))
  let t613 = @simp.rewrite_tac(@list.List([@transcendentals.real_mul_sin_cos(), @transcendentals.real_mul_cos_sin(), @transcendentals.real_mul_cos_cos(), @transcendentals.real_mul_sin_sin()]))
  let t611 = @term_syntax.parse_term("(m : Num)")
  let t612 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t611]))
  let t609 = @meson.meson_tac(@list.List([]))
  let t610 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_mul_sym()])), t609), @tactics.all_tac])
  let t608 = @tactics.match_mp_tac(@arith.wlog_le())
  let t624 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x607 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x607
  }, @list.List([@theorems.swap_forall_thm()])), t608), @tactics.conj_tac), t610), t612), @tactics.disch_tac), t613), t615), t616), t617), t618), t619), t620), t621), t622), t623), @calc_rat.real_arith_tac)
  real_integral_sin_and_cos_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, real_integral(real_interval([(-pi, pi)]), (x : Real) => cos(real_of_num(m) * x) * cos(real_of_num(n) * x)) == (if m == n { if n == 0 { real_of_num(2) * pi } else { pi } } else { real_of_num(0) }) && real_integral(real_interval([(-pi, pi)]), (x : Real) => cos(real_of_num(m) * x) * sin(real_of_num(n) * x)) == real_of_num(0) && real_integral(real_interval([(-pi, pi)]), (x : Real) => sin(real_of_num(m) * x) * cos(real_of_num(n) * x)) == real_of_num(0) && real_integral(real_interval([(-pi, pi)]), (x : Real) => sin(real_of_num(m) * x) * sin(real_of_num(n) * x)) == (if m == n && !(n == 0) { pi } else { real_of_num(0) })"), t624))
}

///|
let real_integral_sin_and_cos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRAL_SIN_AND_COS")

///|
/// `REAL_INTEGRAL_SIN_AND_COS`
pub fn real_integral_sin_and_cos() -> @kernel.Thm {
  real_integral_sin_and_cos_c.get()
}

///|
/// REAL_INTEGRABLE_SIN_AND_COS
fn step_71() -> Unit raise {
  let t625 = @tactics.repeat_tac(@tactics.conj_tac)
  let t626 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t625), real_integrable_on_interval_tac)
  real_integrable_sin_and_cos_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ a : Real, ∀ b : Real, real_integrable_on((x : Real) => cos(real_of_num(m) * x) * cos(real_of_num(n) * x), real_interval([(a, b)])) && real_integrable_on((x : Real) => cos(real_of_num(m) * x) * sin(real_of_num(n) * x), real_interval([(a, b)])) && real_integrable_on((x : Real) => sin(real_of_num(m) * x) * cos(real_of_num(n) * x), real_interval([(a, b)])) && real_integrable_on((x : Real) => sin(real_of_num(m) * x) * sin(real_of_num(n) * x), real_interval([(a, b)]))"), t626))
}

///|
let real_integrable_sin_and_cos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRABLE_SIN_AND_COS")

///|
/// `REAL_INTEGRABLE_SIN_AND_COS`
pub fn real_integrable_sin_and_cos() -> @kernel.Thm {
  real_integrable_sin_and_cos_c.get()
}

///|
/// trigonometric_set_def
fn step_72() -> Unit raise {
  trigonometric_set_def_c.set(@pair.new_definition(@term_syntax.parse_term("(trigonometric_set : (Num, Real) -> Real)((n : Num)) == (if n == 0 { (x : Real) => real_of_num(1) / sqrt(real_of_num(2) * pi) } else { if ODD(n) { (x : Real) => sin(real_of_num(DIV(n, 2) + 1) * x) / sqrt(pi) } else { (x : Real) => cos(real_of_num(DIV(n, 2)) * x) / sqrt(pi) } })")))
}

///|
let trigonometric_set_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("trigonometric_set_def")

///|
/// `trigonometric_set_def`
pub fn trigonometric_set_def() -> @kernel.Thm {
  trigonometric_set_def_c.get()
}

///|
/// trigonometric_set
fn step_73() -> Unit raise {
  let t629 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @transcendentals.cos_0()]))
  let t628 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(2 * (n : Num) + 2, 2) == n + 1"))]))
  let t627 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(2 * (n : Num) + 1, 2) == n"))]))
  let t630 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([trigonometric_set_def(), @arith.even_add(), @arith.even_mult(), @calc_num.arith(), @arith.add_eq_0(), @equal.gsym(@arith.not_even())])), t627), t628), t629)
  trigonometric_set_c.set(@tactics.prove(@term_syntax.parse_term("trigonometric_set(0) == ((x : Real) => cos(real_of_num(0) * x) / sqrt(real_of_num(2) * pi)) && trigonometric_set(2 * (n : Num) + 1) == ((x : Real) => sin(real_of_num(n + 1) * x) / sqrt(pi)) && trigonometric_set(2 * n + 2) == ((x : Real) => cos(real_of_num(n + 1) * x) / sqrt(pi))"), t630))
}

///|
let trigonometric_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("trigonometric_set")

///|
/// `trigonometric_set`
pub fn trigonometric_set() -> @kernel.Thm {
  trigonometric_set_c.get()
}

///|
/// TRIGONOMETRIC_SET_EVEN
fn step_74() -> Unit raise {
  let t632 = @simp.rewrite_tac(@list.List([trigonometric_set(), @equal.gsym(@arith.add1())]))
  let t631 = @simp.rewrite_tac(@list.List([@nums.not_suc(), @int.arith_rule(@term_syntax.parse_term("2 * SUC((k : Num)) == 2 * k + 2"))]))
  let t633 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@calc_num.arith(), trigonometric_set(), @calc_int.real_mul_lzero(), @transcendentals.cos_0()]))), t631), t632)
  trigonometric_set_even_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, trigonometric_set(2 * k) == (if k == 0 { (x : Real) => real_of_num(1) / sqrt(real_of_num(2) * pi) } else { (x : Real) => cos(real_of_num(k) * x) / sqrt(pi) })"), t633))
}

///|
let trigonometric_set_even_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIGONOMETRIC_SET_EVEN")

///|
/// `TRIGONOMETRIC_SET_EVEN`
pub fn trigonometric_set_even() -> @kernel.Thm {
  trigonometric_set_even_c.get()
}

///|
/// ODD_EVEN_INDUCT_LEMMA
fn step_75() -> Unit raise {
  let t641 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC(2 * (n : Num)) == 2 * n + 1 && SUC(2 * n + 1) == 2 * n + 2"))]))
  let t640 = @simp.rewrite_tac(@list.List([@arith.even_exists(), @arith.odd_exists()]))
  let t639 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(n : Num)"), @arith.even_or_odd()))
  let t638 = @tactics.disch_then(fn(x637 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t636 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t635 = @simp.asm_rewrite_tac(@list.List([]))
  let t634 = @tactics.match_mp_tac(@nums.num_induction())
  let t642 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.forall_simp()])), @tactics.strip_tac), t634), t635), t636), t638), t639), t640), @tactics.strip_tac), t641)
  odd_even_induct_lemma_c.set(@tactics.prove(@term_syntax.parse_term("(∀ n : Num, (P : (Num) -> Bool)(0)) && (∀ n : Num, P(2 * n + 1)) && (∀ n : Num, P(2 * n + 2)) → (∀ n : Num, P(n))"), t642))
}

///|
let odd_even_induct_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_EVEN_INDUCT_LEMMA")

///|
/// `ODD_EVEN_INDUCT_LEMMA`
pub fn odd_even_induct_lemma() -> @kernel.Thm {
  odd_even_induct_lemma_c.get()
}

///|
/// ORTHONORMAL_SYSTEM_TRIGONOMETRIC_SET
fn step_76() -> Unit raise {
  let t663 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t662 = @tactics.match_mp_tac(@realax.real_mul_linv())
  let t661 = @simp.simp_tac(@list.List([@real.sqrt_pow_2(), @realax.real_le_mul(), @realarith.real_pos(), @transcendentals.pi_pos_le()]))
  let t659 = @equal.gsym(@realarith.real_pow_2())
  let t660 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul()), t659]))
  let t658 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @calc_int.real_mul_rzero()]))
  let t657 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(0 == (a : Num) + (b : Num)) == (a == 0 && b == 0)")), @arith.eq_add_rcancel(), @arith.eq_mult_lcancel()]))
  let t656 = @tactics.try_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("false → (p : Bool)"))), @int.asm_arith_tac))
  let t655 = @tactics.try_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t654 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == (n : Num)"))
  let t653 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq(), @calc_int.real_mul_rzero()]))
  let t652 = @simp.rewrite_tac(@list.List([real_integral_sin_and_cos()]))
  let t651 = @simp.simp_tac(@list.List([@realanalysis.real_integral_lmul(), real_integrable_sin_and_cos()]))
  let t650 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) / (k : Real) * ((b : Real) / (l : Real)) == inv(k) * inv(l) * (a * b)"))]))
  let t649 = @simp.rewrite_tac(@list.List([trigonometric_set()]))
  let t648 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t647 = @tactics.repeat_tac(@tactics.conj_tac)
  let t646 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t645 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t644 = @tactics.repeat_tac(@tactics.conj_tac)
  let t643 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t664 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([orthonormal_system(), l2product()])), t643), t644), t645), t646), t647), t648), t649), t650), t651), t652), t653), t654), t655), t656), t657), t658), t660), t661), t662), t663), @calc_rat.real_arith_tac)
  orthonormal_system_trigonometric_set_c.set(@tactics.prove(@term_syntax.parse_term("orthonormal_system(real_interval([(-pi, pi)]), trigonometric_set)"), t664))
}

///|
let orthonormal_system_trigonometric_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHONORMAL_SYSTEM_TRIGONOMETRIC_SET")

///|
/// `ORTHONORMAL_SYSTEM_TRIGONOMETRIC_SET`
pub fn orthonormal_system_trigonometric_set() -> @kernel.Thm {
  orthonormal_system_trigonometric_set_c.get()
}

///|
/// SQUARE_INTEGRABLE_TRIGONOMETRIC_SET
fn step_77() -> Unit raise {
  let t670 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_on_differentiable()]))
  let t669 = @tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on())
  let t668 = @tactics.match_mp_tac(real_continuous_imp_square_integrable())
  let t667 = @tactics.repeat_tac(@tactics.strip_tac)
  let t666 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t665 = @simp.rewrite_tac(@list.List([trigonometric_set()]))
  let t671 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(odd_even_induct_lemma()), t665), t666), t667), t668), t669), t670), @tactics.gen_tac), @tactics.disch_tac), @realanalysis.real_differentiable_tac)
  square_integrable_trigonometric_set_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, square_integrable_on(trigonometric_set(i), real_interval([(-pi, pi)]))"), t671))
}

///|
let square_integrable_trigonometric_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_TRIGONOMETRIC_SET")

///|
/// `SQUARE_INTEGRABLE_TRIGONOMETRIC_SET`
pub fn square_integrable_trigonometric_set() -> @kernel.Thm {
  square_integrable_trigonometric_set_c.get()
}

///|
/// WEIERSTRASS_TRIG_POLYNOMIAL
fn step_78() -> Unit raise {
  let t710 = @simp.simp_tac(@list.List([@sets.in_univ(), @realanalysis.withinreal_univ()]))
  let t707 = @simp.gen_rewrite_rule(fn(x706 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x706
  }, @list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t709 = @tactics.first_x_assum(fn(x708 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s704 = @tactics.mp_tac(x703)
      fn(x705 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s704(x705)
      }
    })(t707(x708))
  })
  let t702 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t700 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_add(), @realanalysis.real_continuous_const(), @realanalysis.real_continuous_within_id()]))
  let t701 = @tactics.try_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_withinreal_compose()), t700))
  let t699 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_complex_components_within()]))
  let t698 = @tactics.match_mp_tac(@realanalysis.real_continuous_within_compose())
  let t696 = @simp.asm_simp_tac(@list.List([@complexes.real_norm(), @complexes.re_neg(), @real.real_neg_gt0()]))
  let t695 = @tactics.undisch_tac(@term_syntax.parse_term("norm((z : Cart[Real, 2])) == real_of_num(1)"))
  let t694 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.real())]))
  let t697 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.continuous_within_clog()), t694), @tactics.disch_tac), t695), t696), @calc_rat.asm_real_arith_tac), @tactics.all_tac]))
  let t693 = @tactics.match_mp_tac(@realanalysis.real_continuous_continuous_within_compose())
  let t692 = @simp.rewrite_tac(@list.List([@trivia.o_assoc()]))
  let t686 = @equal.gsym(@realanalysis.real_continuous_continuous())
  let t687 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc()), t686]))
  let t688 = @list.List([@tactics.then_tac(@simp.gen_rewrite_tac(fn(x683 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s684 = @equal.land_conv(x683)
    fn(x685 : @kernel.Term) -> @kernel.Thm raise {
      s684(x685)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())])), @canal.continuous_tac), t687])
  let t682 = @tactics.match_mp_tac(@topology.continuous_within_compose())
  let t689 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_assoc()])), t682), @tactics.conj_tac), t688)
  let t681 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + pi + pi == x + real_of_num(2) * pi"))]))
  let t680 = @simp.asm_rewrite_tac(@list.List([@complexes.im_add(), @complexes.im_sub(), @complexes.im_mul_ii(), @complexes.re_cx(), @real.real_sub_add()]))
  let t679 = @simp.asm_simp_tac(@list.List([@transcendentals.clog_neg(), @trivia.o_thm()]))
  let t678 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_0(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t677 = @class.asm_cases_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t690 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), t677), t678), @tactics.strip_tac), t679), @class.cond_cases_tac), t680), t681), t689])
  let t676 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_01(), @sets.in_elim_thm()]))
  let t675 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t674 = @tactics.exists_tac(@term_syntax.parse_term("o(Cx, o((f : (Real) -> Real), o((x : Real) => x + pi, o(Im, o(clog, op_minus_minus)))))"))
  let t673 = @tactics.match_mp_tac(@topology.continuous_transform_within())
  let t691 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.real_continuous_continuous()])), t673), t674), t675), t676), @tactics.conj_tac), t690)])
  let t672 = @tactics.disj_cases_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= Re((z : Cart[Real, 2])) || Re(z) < real_of_num(0)")))
  let t711 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t672), t691), t692), t693), t697), t698), t699), t701), t702), t709), t710)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, real_continuous_on(f, UNIV) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → (∀ z : Cart[Real, 2], norm(z) == real_of_num(1) → real_continuous(o(f, o(Im, clog)), within(at(z), {(w : Cart[Real, 2]) | norm(w) == real_of_num(1)})))"), t711)
  let t735 = @simp.asm_simp_tac(@list.List([@misc.in_real_interval(), @transcendentals.clog_works(), @realarith.real_lt_imp_le()]))
  let t734 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t733 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t732 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_0(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t731 = @class.asm_cases_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t730 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t729 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @real.real_lt_01()]))
  let t728 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t727 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) → (e : Bool)) == (a && b && c → d → e)"))]))(@topology.continuous_transform_within()))
  let t726 = @simp.asm_rewrite_tac(@list.List([@realanalysis.real_continuous_continuous()]))
  let t722 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t725 = @tactics.disch_then(fn(x724 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x719 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s720 = @tactics.mp_tac(x719)
      fn(x721 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s720(x721)
      }
    })(((x723 : @kernel.Thm) => @bool.spec(t722, x723))(x724))
  })
  let t718 = @simp.asm_rewrite_tac(@list.List([]))
  let t717 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Real) -> Real)"), lemma1))
  let t716 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Real) -> Real)"))(@tactics.strip_assume_tac))
  let t715 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t712 = @term_syntax.parse_term("pi")
  let t713 = @term_syntax.parse_term("-pi")
  let t714 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t713, t712]), @realanalysis.real_tietze_periodic_interval()))
  let t736 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t714), t715), t716), t717), t718), t725), t726), t727), t728), t729), t730), t731), t732), @tactics.strip_tac), t733), @tactics.ap_term_tac), t734), t735)
  let lemma2 = @tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, real_continuous_on(f, real_interval([(-pi, pi)])) && f(-pi) == f(pi) → (∀ z : Cart[Real, 2], norm(z) == real_of_num(1) → real_continuous(o(f, o(Im, clog)), within(at(z), {(w : Cart[Real, 2]) | norm(w) == real_of_num(1)})))"), t736)
  let t972 = @simp.asm_simp_tac(@list.List([@transcendentals.clog_cexp(), @complexes.im_mul_ii(), @complexes.re_cx(), @realarith.real_lt_le()]))
  let t971 = @simp.asm_rewrite_tac(@list.List([@transcendentals.clog_neg_1(), @complexes.complex_add_rid(), @complexes.im_mul_ii(), @complexes.re_cx()]))
  let t970 = @simp.rewrite_tac(@list.List([@complexes.cx_neg(), @complexes.complex_mul_rzero(), @complexes.complex_neg_0()]))
  let t969 = @simp.rewrite_tac(@list.List([@transcendentals.cos_neg(), @transcendentals.sin_neg(), @transcendentals.sin_pi(), @transcendentals.cos_pi()]))
  let t967 = @equal.gsym(@transcendentals.cx_sin())
  let t968 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_euler(), @equal.gsym(@transcendentals.cx_cos()), t967]))
  let t973 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("(r : Real) == -pi"), fn(x964 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s965 = @tactics.subst_all_tac(x964)
    fn(x966 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s965(x966)
    }
  }), t968), t969), t970), t971), t972])
  let t963 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Real) == -pi"))
  let t962 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t961 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (x' : Real) → abs(x - (y : Real)) < (e : Real) → abs(x' - y) < e")))
  let t960 = @simp.rewrite_tac(@list.List([@transcendentals.norm_cexp_ii()]))
  let t956 = @term_syntax.parse_term("cexp(ii * Cx((r : Real)))")
  let t959 = @tactics.first_x_assum(fn(x958 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x953 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s954 = @tactics.mp_tac(x953)
      fn(x955 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s954(x955)
      }
    })(((x957 : @kernel.Thm) => @bool.spec(t956, x957))(x958))
  })
  let t952 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t951 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Real)"))
  let t950 = @tactics.disch_then(fn(x948 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x948
    @simp.rewrite_tac(@list.List([@equal.gsym(th_1)]))
  })
  let t947 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t944 = @term_syntax.parse_term("(b : (Num) -> Real)")
  let t945 = @term_syntax.parse_term("(a : (Num) -> Real)")
  let t946 = @tactics.map_every(fn(x941 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x941
    let t943 = @tactics.x_gen_tac(t)
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t943)
  }, @list.List([@term_syntax.parse_term("(n : Num)"), t945, t944]))
  let t940 = @simp.expand_tac("trigpoly")
  let t939 = @simp.asm_rewrite_tac(@list.List([]))
  let t937 = @simp.asm_simp_tac(@list.List([]))
  let t936 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([@realax.real_mul_lid()]), @term_syntax.parse_term("cos((x : Real)) == cos(real_of_num(1) * x) && sin(x) == sin(real_of_num(1) * x)"))]))
  let t935 = @simp.rewrite_tac(@list.List([@transcendentals.re_cexp(), @transcendentals.im_cexp(), @complexes.re_mul_ii(), @complexes.im_cx(), @complexes.im_mul_ii(), @complexes.re_cx()]))
  let t934 = @simp.asm_simp_tac(@list.List([]))
  let t938 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t934), t935), t936), t937), @tactics.all_tac])
  let t930 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Real)")
  let t933 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Real, (poly2 : ((Cart[Real, 2]) -> Real) -> Bool)(f) → (trigpoly : ((Real) -> Real) -> Bool)((x : Real) => f(cexp(ii * Cx(x))))"), fn(x932 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x927 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s928 = @tactics.mp_tac(x927)
      fn(x929 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s928(x929)
      }
    })(((x931 : @kernel.Thm) => @bool.spec(t930, x931))(x932))
  })
  let t925 = @simp.asm_simp_tac(@list.List([]))
  let t924 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((ai : Real) * (si : Real) + (bi : Real) * (ci : Real)) * ((aj : Real) * (sj : Real) + (bj : Real) * (cj : Real)) == ai * aj * (si * sj) + bi * bj * (ci * cj) + (ai * bj * (si * cj) + aj * bi * (ci * sj))"))]))
  let t923 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t922 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t921 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t920 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t919 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t918 = @tactics.first_assum(@tactics.match_mp_tac)
  let t917 = @simp.rewrite_tac(@list.List([@determinants.real_mul_sum_numseg()]))
  let t916 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.strip_thm_then)(fn(x913 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s914 = @tactics.subst1_tac(x913)
    fn(x915 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s914(x915)
    }
  }))
  let t912 = @simp.rewrite_tac(@list.List([]))
  let t911 = @tactics.first_x_assum(fn(x902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x902
    @simp.gen_rewrite_tac(fn(x910 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x904 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s905 = @equal.land_conv(x904)
        fn(x906 : @kernel.Term) -> @kernel.Thm raise {
          s905(x906)
        }
      })((fn(x907 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s908 = @equal.once_depth_conv(x907)
        fn(x909 : @kernel.Term) -> @kernel.Thm raise {
          s908(x909)
        }
      })(x910))
    }, @list.List([@equal.sym(th)]))
  })
  let t926 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t911), t912), t916), t917), t918), t919), t920), @tactics.strip_tac), t921), t922), t923), @tactics.strip_tac), t924), t925), @tactics.all_tac])
  let t901 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, (trigpoly : ((Real) -> Real) -> Bool)(f) && trigpoly(g) → trigpoly((x : Real) => f(x) * g(x))"), fn(x898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s899 = @tactics.assume_tac(x898)
    fn(x900 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s899(x900)
    }
  })
  let t896 = @simp.asm_simp_tac(@list.List([]))
  let t894 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - (y : Real) == x + -real_of_num(1) * y"))
  let t895 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) / real_of_num(2) == inv(real_of_num(2)) * x")), t894]))
  let t893 = @simp.simp_tac(@list.List([@real.real_of_num_sub(), @realax.real_of_num_add()]))
  let t891 = @equal.gsym(@real.real_sub_rdistrib())
  let t892 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_add_rdistrib()), t891]))
  let t890 = @simp.rewrite_tac(@list.List([@transcendentals.real_mul_sin_sin(), @transcendentals.real_mul_sin_cos(), @transcendentals.real_mul_cos_sin(), @transcendentals.real_mul_cos_cos()]))
  let t889 = @list.List([@simp.rewrite_tac(@list.List([@theorems.conj_aci(), @real.real_mul_ac()])), @tactics.all_tac])
  let t888 = @tactics.match_mp_tac(@arith.wlog_le())
  let t897 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])), t888), @tactics.conj_tac), t889), t890), t892), t893), t895), t896), @tactics.all_tac])
  let t887 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, ∀ j : Num, (trigpoly : ((Real) -> Real) -> Bool)((x : Real) => sin(real_of_num(i) * x) * sin(real_of_num(j) * x)) && trigpoly((x : Real) => sin(real_of_num(i) * x) * cos(real_of_num(j) * x)) && trigpoly((x : Real) => cos(real_of_num(i) * x) * sin(real_of_num(j) * x)) && trigpoly((x : Real) => cos(real_of_num(i) * x) * cos(real_of_num(j) * x))"), fn(x884 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s885 = @tactics.assume_tac(x884)
    fn(x886 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s885(x886)
    }
  })
  let t882 = @simp.simp_tac(@list.List([@iterate.sum_delta(), @realax.real_mul_lid(), @iterate.in_numseg(), @arith.le_0(), @arith.le_refl()]))
  let t881 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @realax.real_add_lid(), @class.cond_rand(), @class.cond_rator()]))
  let t878 = @term_syntax.parse_term("(i : Num) => if i == (k : Num) { real_of_num(1) } else { real_of_num(0) }")
  let t879 = @term_syntax.parse_term("(i : Num) => real_of_num(0)")
  let t880 = @tactics.map_every(fn(x875 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s876 = @tactics.exists_tac(x875)
    fn(x877 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s876(x877)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num)"), t879, t878]))
  let t874 = @simp.expand_tac("trigpoly")
  let t883 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)")), t874), t880), t881), t882), @tactics.all_tac])
  let t873 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, (trigpoly : ((Real) -> Real) -> Bool)((x : Real) => cos(real_of_num(i) * x))"), fn(x870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s871 = @tactics.assume_tac(x870)
    fn(x872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s871(x872)
    }
  })
  let t868 = @simp.simp_tac(@list.List([@iterate.sum_delta(), @realax.real_mul_lid(), @iterate.in_numseg(), @arith.le_0(), @arith.le_refl()]))
  let t867 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_add_rid(), @class.cond_rand(), @class.cond_rator()]))
  let t864 = @term_syntax.parse_term("(i : Num) => real_of_num(0)")
  let t865 = @term_syntax.parse_term("(i : Num) => if i == (k : Num) { real_of_num(1) } else { real_of_num(0) }")
  let t866 = @tactics.map_every(fn(x861 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s862 = @tactics.exists_tac(x861)
    fn(x863 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s862(x863)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num)"), t865, t864]))
  let t860 = @simp.expand_tac("trigpoly")
  let t869 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)")), t860), t866), t867), t868), @tactics.all_tac])
  let t859 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, (trigpoly : ((Real) -> Real) -> Bool)((x : Real) => sin(real_of_num(i) * x))"), fn(x856 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s857 = @tactics.assume_tac(x856)
    fn(x858 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s857(x858)
    }
  })
  let t853 = @equal.gsym(@realax.real_mul_assoc())
  let t854 = @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib(), @equal.gsym(@iterate.sum_lmul()), t853]))
  let t850 = @term_syntax.parse_term("(i : Num) => (c : Real) * (b : (Num) -> Real)(i)")
  let t851 = @term_syntax.parse_term("(i : Num) => (c : Real) * (a : (Num) -> Real)(i)")
  let t852 = @tactics.map_every(fn(x847 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s848 = @tactics.exists_tac(x847)
    fn(x849 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s848(x849)
    }
  }, @list.List([@term_syntax.parse_term("(n : Num)"), t851, t850]))
  let t846 = @tactics.disch_then(fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s844 = @tactics.subst1_tac(x843)
    fn(x845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s844(x845)
    }
  })
  let t840 = @term_syntax.parse_term("(b : (Num) -> Real)")
  let t841 = @term_syntax.parse_term("(a : (Num) -> Real)")
  let t842 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t841, t840]))
  let t839 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t838 = @simp.expand_tac("trigpoly")
  let t855 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t838), t839), t842), t846), t852), t854), @tactics.all_tac])
  let t837 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ c : Real, (trigpoly : ((Real) -> Real) -> Bool)(f) → trigpoly((x : Real) => c * f(x))"), fn(x834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s835 = @tactics.assume_tac(x834)
    fn(x836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s835(x836)
    }
  })
  let t832 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses(), @sets.in_insert(), @class.eta_ax()]))
  let t831 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t833 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))), t831), t832), @tactics.all_tac])
  let t830 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Num, Real) -> Real, ∀ s : (Num) -> Bool, FINITE(s) && (∀ i : Num, IN(i, s) → (trigpoly : ((Real) -> Real) -> Bool)(f(i))) → trigpoly((x : Real) => sum(s, (i : Num) => f(i, x)))"), fn(x827 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s828 = @tactics.assume_tac(x827)
    fn(x829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s828(x829)
    }
  })
  let t825 = @simp.rewrite_tac(@list.List([@sets.extension(), @iterate.in_numseg(), @sets.in_elim_thm()]))
  let t824 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → sum(s, (f : (_) -> Real)) == sum(t, f)")))
  let t823 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_restrict_set())]))
  let t822 = @simp.rewrite_tac(@list.List([@class.cond_rator(), @class.cond_rand(), @calc_int.real_mul_lzero()]))
  let t821 = @tactics.repeat_tac(@tactics.conj_tac)
  let t820 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == (e : Real) && (b : Real) == (g : Real) && (c : Real) == (f : Real) && (d : Real) == (h : Real) → a + b + (c + d) == e + f + (g + h)")))
  let t819 = @simp.rewrite_tac(@list.List([@iterate.sum_add_numseg(), @class.fun_eq_thm(), @real.real_add_rdistrib()]))
  let t816 = @term_syntax.parse_term("(n : Num) => (if n <= (n1 : Num) { (b1 : (Num) -> Real)(n) } else { real_of_num(0) }) + (if n <= (n2 : Num) { (b2 : (Num) -> Real)(n) } else { real_of_num(0) })")
  let t817 = @term_syntax.parse_term("(n : Num) => (if n <= (n1 : Num) { (a1 : (Num) -> Real)(n) } else { real_of_num(0) }) + (if n <= (n2 : Num) { (a2 : (Num) -> Real)(n) } else { real_of_num(0) })")
  let t818 = @tactics.map_every(fn(x813 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s814 = @tactics.exists_tac(x813)
    fn(x815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s814(x815)
    }
  }, @list.List([@term_syntax.parse_term("MAX((n1 : Num), (n2 : Num))"), t817, t816]))
  let t812 = @tactics.disch_then(@tactics.conjuncts_then(fn(x809 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s810 = @tactics.subst1_tac(x809)
    fn(x811 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s810(x811)
    }
  }))
  let t803 = @term_syntax.parse_term("(b2 : (Num) -> Real)")
  let t804 = @term_syntax.parse_term("(a2 : (Num) -> Real)")
  let t805 = @term_syntax.parse_term("(n2 : Num)")
  let t806 = @term_syntax.parse_term("(b1 : (Num) -> Real)")
  let t807 = @term_syntax.parse_term("(a1 : (Num) -> Real)")
  let t808 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n1 : Num)"), t807, t806, t805, t804, t803]))
  let t802 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t801 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t800 = @simp.expand_tac("trigpoly")
  let t826 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t800), t801), t802), t808), t812), t818), t819), @tactics.gen_tac), t820), t821), t822), t823), t824), t825), @int.arith_tac), @tactics.all_tac])
  let t799 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, (trigpoly : ((Real) -> Real) -> Bool)(f) && trigpoly(g) → trigpoly((x : Real) => f(x) + g(x))"), fn(x796 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s797 = @tactics.assume_tac(x796)
    fn(x798 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s797(x798)
    }
  })
  let t794 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t792 = @term_syntax.parse_term("(n : Num) => (c : Real)")
  let t793 = @tactics.map_every(fn(x789 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s790 = @tactics.exists_tac(x789)
    fn(x791 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s790(x791)
    }
  }, @list.List([@term_syntax.parse_term("(n : Num) => real_of_num(0)"), t792]))
  let t788 = @simp.rewrite_tac(@list.List([@iterate.sum_sing_numseg(), @calc_int.real_mul_lzero(), @transcendentals.sin_0(), @transcendentals.cos_0()]))
  let t787 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t786 = @simp.rewrite_tac(@list.List([]))
  let t785 = @simp.expand_tac("trigpoly")
  let t795 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(c : Real)")), t785), t786), t787), t788), t793), t794), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t784 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : Real, (trigpoly : ((Real) -> Real) -> Bool)((x : Real) => c)"), fn(x781 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s782 = @tactics.assume_tac(x781)
    fn(x783 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s782(x783)
    }
  })
  let t780 = @simp.abbrev_tac(@term_syntax.parse_term("(trigpoly : ((Real) -> Real) -> Bool) == ((f : (Real) -> Real) => ∃ n : Num, ∃ a : (Num) -> Real, ∃ b : (Num) -> Real, f == ((x : Real) => sum(op_dot_dot(0, n), (k : Num) => a(k) * sin(real_of_num(k) * x) + b(k) * cos(real_of_num(k) * x))))"))
  let t779 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Real)"))(@tactics.strip_assume_tac))
  let t778 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), lemma2]))
  let t773 = @term_syntax.parse_term("(e : Real)")
  let t774 = @list.List([@term_syntax.parse_term("o((f : (Real) -> Real), o(Im, clog))"), t773])
  let t777 = @tactics.disch_then(fn(x776 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s771 = @tactics.mp_tac(x770)
      fn(x772 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s771(x772)
      }
    })(((x775 : @kernel.Thm) => @bool.specl(t774, x775))(x776))
  })
  let t763 = @simp.asm_rewrite_tac(@list.List([]))
  let t764 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("Im")), t763)
  let t762 = @simp.asm_rewrite_tac(@list.List([]))
  let t765 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("Re")), t762), t764])
  let t761 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @complexes.complex_eq(), @class.de_morgan_thm()]))
  let t760 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t766 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(w : Cart[Real, 2])"), t760])), t761), @tactics.strip_tac), t765)
  let t759 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_const(), @realanalysis.real_continuous_complex_components_within()]))
  let t758 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_add(), @realanalysis.real_continuous_mul()]))
  let t757 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t767 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ f : _, (P : (_) -> Bool)(f) → (R : (_, _) -> Bool)(f, x)) → (∀ f : _, P(f) → (∀ x : _, (Q : (_) -> Bool)(x) → R(f, x)))"))), @tactics.gen_tac), t757), t758), t759)
  let t754 = @simp.rewrite_tac(@list.List([@topology.continuous_on_lift_norm(), @equal.gsym(@trivia.o_def()), @topology.closed_univ()]))
  let t753 = @tactics.match_mp_tac(@topology.continuous_closed_preimage_constant())
  let t752 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_eq())]))
  let t755 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (p : (_) -> Bool)(x)} == {(x : _) | IN(x, UNIV) && p(x)}"))])), t752), t753), t754)
  let t751 = @meson.meson_tac(@list.List([@realax.real_le_refl()]))
  let t756 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.bounded(), @sets.in_elim_thm()])), t751), t755])
  let t768 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.bounded_closed_imp_compact()), @tactics.conj_tac), t756), t767, t766])
  let t769 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t768), @tactics.all_tac])
  let t750 = @simp.asm_rewrite_tac(@list.List([]))
  let t748 = @term_syntax.parse_term("{(z : Cart[Real, 2]) | norm(z) == real_of_num(1)}")
  let t749 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(poly2 : ((Cart[Real, 2]) -> Real) -> Bool)"), t748]), @realanalysis.stone_weierstrass()))
  let t747 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x746 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x743 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s744 = @tactics.assume_tac(x743)
      fn(x745 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s744(x745)
      }
    })(@bool.conjunct1(x746))
  }))
  let t740 = @term_syntax.parse_term("(∀ c : Real, (poly2 : ((Cart[Real, 2]) -> Real) -> Bool)((x : Cart[Real, 2]) => c)) && (∀ p : (Cart[Real, 2]) -> Real, ∀ q : (Cart[Real, 2]) -> Real, poly2(p) && poly2(q) → poly2((x : Cart[Real, 2]) => p(x) + q(x))) && (∀ p : (Cart[Real, 2]) -> Real, ∀ q : (Cart[Real, 2]) -> Real, poly2(p) && poly2(q) → poly2((x : Cart[Real, 2]) => p(x) * q(x))) && poly2(Re) && poly2(Im)")
  let t741 = @tactics.choose_then(fn(x737 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s738 = @tactics.mp_tac(x737)
    fn(x739 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s738(x739)
    }
  })
  let t742 = t741(@ind_defs.prove_inductive_relations_exist(t740))
  let t974 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t742), t747), t749), t750), @tactics.ants_tac), t769), t777), t778), t779), t780), t784), t795), t799), t826), t830), t833), t837), t855), t859), t869), t873), t883), t887), t897), t901), t926), t933), t938), t939), t940), t946), t947), t950), t951), t952), @tactics.strip_tac), t959), t960), t961), t962), t963), t973)
  weierstrass_trig_polynomial_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ e : Real, real_continuous_on(f, real_interval([(-pi, pi)])) && f(-pi) == f(pi) && real_of_num(0) < e → (∃ n : Num, ∃ a : (Num) -> Real, ∃ b : (Num) -> Real, ∀ x : Real, IN(x, real_interval([(-pi, pi)])) → abs(f(x) - sum(op_dot_dot(0, n), (k : Num) => a(k) * sin(real_of_num(k) * x) + b(k) * cos(real_of_num(k) * x))) < e)"), t974))
}

///|
let weierstrass_trig_polynomial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WEIERSTRASS_TRIG_POLYNOMIAL")

///|
/// `WEIERSTRASS_TRIG_POLYNOMIAL`
pub fn weierstrass_trig_polynomial() -> @kernel.Thm {
  weierstrass_trig_polynomial_c.get()
}

///|
/// REAL_INTEGRAL_TWEAK_ENDS
fn step_79() -> Unit raise {
  let t1119 = @simp.simp_tac(@list.List([@sets.in_diff(), @sets.in_sing()]))
  let t1118 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing()]))
  let t1117 = @tactics.exists_tac(@term_syntax.parse_term("{(a : Real)}"))
  let t1116 = @tactics.match_mp_tac(@realanalysis.real_integral_spike())
  let t1115 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1120 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("real_interval([((a : Real), (b : Real))])"), @realanalysis.real_integral_0())), t1115), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1116), t1117), t1118), t1119)
  let t1114 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t1113 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_continuous(), @realanalysis.real_continuous_on_pow()]))
  let t1121 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integral_pos()), t1113), t1114), t1120])
  let t1110 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((i : Real) - (l : Real)) < (e : Real) → real_of_num(0) <= i && l == real_of_num(0) → i < e")))
  let t1112 = @tactics.first_x_assum(fn(x1111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1110(x1111))
  })
  let t1109 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t1108 = @tactics.match_mp_tac(@real.sqrt_mono_lt())
  let t1107 = @simp.rewrite_tac(@list.List([l2norm(), l2product()]))
  let t1106 = @list.List([@meson.asm_meson_tac(@list.List([@real.pow_2_sqrt(), @realarith.real_lt_imp_le()])), @tactics.all_tac])
  let t1122 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(e : Real) == sqrt(pow(e, 2))"), fn(x1103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1104 = @tactics.subst1_tac(x1103)
    fn(x1105 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1104(x1105)
    }
  }), t1106), t1107), t1108), t1109), t1112), @tactics.conj_tac), t1121)
  let t1102 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_le(), @real.real_of_num_lt()]))
  let t1101 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1100 = @simp.asm_rewrite_tac(@list.List([]))
  let t1099 = @tactics.exists_tac(@term_syntax.parse_term("inv(real_of_num((M : Num)))"))
  let t1098 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t1123 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("inv(real_of_num((n : Num)) + real_of_num(1)) < (b : Real) - (a : Real)"), fn(x1095 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1096 = @tactics.mp_tac(x1095)
    fn(x1097 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1096(x1097)
    }
  }), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t1098), t1099), t1100), t1101), t1102), @int.asm_arith_tac)
  let t1094 = @tactics.conv_tac(@calc_rat.real_field)
  let t1093 = @simp.simp_tac(@list.List([@real.real_le_addr(), @real.real_lt_inv_eq(), @realarith.real_lt_imp_le()]))
  let t1124 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))), t1093), t1094), t1123, t1122])
  let t1092 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1091 = @simp.asm_rewrite_tac(@list.List([]))
  let t1090 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => if x <= (a : Real) + inv(real_of_num((n : Num)) + real_of_num(1)) { (real_of_num(n) + real_of_num(1)) * (d : Real) * (a + inv(real_of_num(n) + real_of_num(1)) - x) } else { real_of_num(0) }"))
  let t1089 = @simp.asm_rewrite_tac(@list.List([]))
  let t1085 = @term_syntax.parse_term("(n : Num)")
  let t1088 = @tactics.remove_then("*", fn(x1087 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1082 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1083 = @tactics.mp_tac(x1082)
      fn(x1084 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1083(x1084)
      }
    })(((x1086 : @kernel.Thm) => @bool.spec(t1085, x1086))(x1087))
  })
  let t1081 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(M : Num) + (N : Num)")), @int.arith_tac), @tactics.all_tac])
  let t1080 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Num, (N : Num) <= n && (M : Num) <= n"), @tactics.strip_assume_tac)
  let t1079 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(M : Num)"))(@tactics.strip_assume_tac))
  let t1078 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_lt()]))
  let t1077 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(b : Real) - (a : Real)"), @real.real_arch_inv()))
  let t1076 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(fn(x1073 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1074 = ((x1072 : @kernel.Thm) => @tactics.label_tac("*", x1072))(x1073)
    fn(x1075 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1074(x1075)
    }
  }))
  let t1071 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt()]))
  let t1067 = @term_syntax.parse_term("pow((e : Real), 2)")
  let t1070 = @tactics.disch_then(fn(x1069 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1064 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1065 = @tactics.mp_tac(x1064)
      fn(x1066 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1065(x1066)
      }
    })(((x1068 : @kernel.Thm) => @bool.spec(t1067, x1068))(x1069))
  })
  let t1063 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t1125 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x1057 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1058 = @tactics.assume_tac(x1057)
    fn(x1059 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1058(x1059)
    }
  }, fn(x1060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1061 = @tactics.mp_tac(x1060)
    fn(x1062 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1061(x1062)
    }
  })), t1063), t1070), t1071), t1076), t1077), t1078), t1079), t1080), t1081), t1088), t1089), @tactics.disch_tac), t1090), t1091), t1092), t1124)
  let t1050 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le(), @real.real_of_num_lt(), @realax.real_of_num_add()]))
  let t1049 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1048 = @tactics.subgoal_then(@term_syntax.parse_term("inv(real_of_num((n : Num)) + real_of_num(1)) <= inv(real_of_num((N : Num)))"), fn(x1045 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1046 = @tactics.mp_tac(x1045)
    fn(x1047 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1046(x1047)
    }
  })
  let t1044 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("false → (p : Bool)")))
  let t1043 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1042 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1041 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1040 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1039 = @tactics.disch_then(fn(x1038 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1037 : (@kernel.Thm, @kernel.Thm)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1033 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1034 = @tactics.mp_tac(x1033)
        fn(x1035 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1034(x1035)
        }
      })((fn(x1036 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
        x1036.0
      })(x1037))
    })(@bool.eq_imp_rule(x1038))
  })
  let t1032 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) - (a : Real)"), @real.real_arch_inv()))
  let t1031 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1051 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_eventually()), t1031), t1032), t1039), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1040), t1041), @tactics.strip_tac), t1042), @tactics.disch_tac), @class.cond_cases_tac), t1043), t1044), t1048), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t1049), t1050), @int.asm_arith_tac)
  let t1030 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const()]))
  let t1028 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))
  let t1029 = @simp.simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) → x * (d : Real) * inv(x) == d")), @real.real_lt_inv_eq(), t1028]))
  let t1027 = @simp.rewrite_tac(@list.List([@real.real_add_sub()]))
  let t1052 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@real.real_le_addr(), @real.real_le_inv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= real_of_num((n : Num)) + real_of_num(1)"))])), t1027), t1029), t1030), t1051])
  let t1026 = @simp.asm_rewrite_tac(@list.List([]))
  let t1025 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == (a : Real)"))
  let t1024 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t1053 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t1024), @tactics.strip_tac), t1025), t1026), t1052)
  let t1023 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t1021 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))
  let t1022 = @simp.simp_tac(@list.List([@equal.gsym(@real.real_le_rdiv_eq()), t1021]))
  let t1020 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= real_of_num(1) - (x : Real) * (y : Real)) == (y * x <= real_of_num(1))"))]))
  let t1019 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @calc_rat.real_arith(@term_syntax.parse_term("abs(real_of_num((n : Num)) + real_of_num(1)) == real_of_num(n) + real_of_num(1)"))]))
  let t1018 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1017 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t1016 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((d : Real) * (x : Real) <= d) == (real_of_num(0) <= d * (real_of_num(1) - x))"))]))
  let t1015 = @simp.once_rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t1014 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) == b * (a * c)"))]))
  let t1013 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_num(), @real.real_abs_pos()]))
  let t1012 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_le_square_abs()), @real.real_abs_abs()]))
  let t1011 = @simp.rewrite_tac(@list.List([@real.real_abs_pow()]))
  let t1010 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t1009 = @term_syntax.parse_term("(x : Real)")
  let t1054 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : Num)"), t1009])), t1010), @tactics.strip_tac), t1011), t1012), @class.cond_cases_tac), t1013), t1014), t1015), t1016), t1017), t1018), t1019), t1020), t1022), t1023), @calc_rat.asm_real_arith_tac)
  let t1008 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_const()]))
  let t1055 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_continuous()), t1008)
  let t1007 = @simp.asm_simp_tac(@list.List([@realanalysis.real_continuous_on_pow()]))
  let t1056 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@realanalysis.real_integrable_continuous())), t1007), t1055, t1054, t1053])
  let t1126 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1056), t1125])
  let t1006 = @simp.rewrite_tac(@list.List([]))
  let t1002 = @term_syntax.parse_term("real_interval([((a : Real), (b : Real))])")
  let t1003 = @term_syntax.parse_term("(x : Real) => pow((d : Real), 2)")
  let t1004 = @term_syntax.parse_term("(x : Real) => if x == (a : Real) { pow((d : Real), 2) } else { real_of_num(0) }")
  let t1005 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : Real) => pow(if x <= (a : Real) + inv(real_of_num(n) + real_of_num(1)) { (real_of_num(n) + real_of_num(1)) * (d : Real) * (a + inv(real_of_num(n) + real_of_num(1)) - x) } else { real_of_num(0) }, 2)"), t1004, t1003, t1002]), @realanalysis.real_dominated_convergence()))
  let t998 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t997 = @simp.simp_tac(@list.List([@realax.real_div(), @realanalysis.real_continuous_on_mul(), @realanalysis.real_continuous_on_const(), @realanalysis.real_continuous_on_sub(), @realanalysis.real_continuous_on_id()]))
  let t996 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => (real_of_num((n : Num)) + real_of_num(1)) * (d : Real) * ((a : Real) + inv(real_of_num(n) + real_of_num(1)) - x)"))
  let t999 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_on_eq()), t996), t997), t998), @calc_rat.asm_real_arith_tac)
  let t993 = @list.List([@simp.asm_rewrite_tac(@list.List([@realax.real_div(), @real.real_sub_refl(), @calc_int.real_mul_rzero()])), @calc_rat.asm_real_arith_tac])
  let t992 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == (a : Real) + inv(real_of_num((n : Num)) + real_of_num(1))"))
  let t991 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t994 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t991), t992), t993)
  let t995 = @list.List([@simp.simp_tac(@list.List([@realax.real_div(), @realanalysis.real_continuous_on_mul(), @realanalysis.real_continuous_on_const(), @realanalysis.real_continuous_on_sub(), @realanalysis.real_continuous_on_id()])), t994])
  let t990 = @simp.rewrite_tac(@list.List([@metric.real_closed_real_interval(), @realanalysis.real_continuous_on_const()]))
  let t989 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_cases())
  let t988 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @misc.in_real_interval()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1000 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_interval([((a : Real), (b : Real))]) == UNION(real_interval([(a, a + inv(real_of_num((n : Num)) + real_of_num(1)))]), real_interval([(a + inv(real_of_num(n) + real_of_num(1)), b)]))"), fn(x985 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s986 = @tactics.subst1_tac(x985)
    fn(x987 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s986(x987)
    }
  }), t988), t989), t990), @tactics.conj_tac), t995), t999])
  let t984 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) + inv(real_of_num((n : Num)) + real_of_num(1)) <= (b : Real)"))
  let t983 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_lt_addr(), @real.real_lt_inv_eq()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t982 = @tactics.subgoal_then(@term_syntax.parse_term("(a : Real) < a + inv(real_of_num((n : Num)) + real_of_num(1))"), fn(x979 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s980 = @tactics.assume_tac(x979)
    fn(x981 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s980(x981)
    }
  })
  let t1001 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t982), t983), t984), t1000), @tactics.all_tac])
  let t978 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, real_continuous_on((x : Real) => if x <= (a : Real) + inv(real_of_num(n) + real_of_num(1)) { (real_of_num(n) + real_of_num(1)) * (d : Real) * (a + inv(real_of_num(n) + real_of_num(1)) - x) } else { real_of_num(0) }, real_interval([(a, (b : Real))]))"), fn(x975 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s976 = @tactics.assume_tac(x975)
    fn(x977 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s976(x977)
    }
  })
  let t1127 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t978), t1001), t1005), t1006), @tactics.ants_tac), t1126)
  real_integral_tweak_ends_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ d : Real, ∀ e : Real, a < b && real_of_num(0) < e → (∃ f : (Real) -> Real, real_continuous_on(f, real_interval([(a, b)])) && f(a) == d && f(b) == real_of_num(0) && l2norm(real_interval([(a, b)]), f) < e)"), t1127))
}

///|
let real_integral_tweak_ends_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRAL_TWEAK_ENDS")

///|
/// `REAL_INTEGRAL_TWEAK_ENDS`
pub fn real_integral_tweak_ends() -> @kernel.Thm {
  real_integral_tweak_ends_c.get()
}

///|
/// SQUARE_INTEGRABLE_APPROXIMATE_CONTINUOUS_ENDS
fn step_80() -> Unit raise {
  let t1164 = @simp.asm_simp_tac(@list.List([l2norm_neg()]))
  let t1163 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) < (e : Real) / real_of_num(2) && (z : Real) < e / real_of_num(2) → (x : Real) <= y + z → x < e")))
  let t1162 = @simp.asm_simp_tac(@list.List([square_integrable_sub(), square_integrable_neg()]))
  let t1156 = @drule.part_match(fn(x1155 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1155))
  }, l2norm_triangle())
  let t1165 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(f : Real) - ((g : Real) + (h : Real)) == f - g + -h"))])), fn(x1161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1160 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1158 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1157 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1153 = @tactics.mp_tac(x1152)
            fn(x1154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1153(x1154)
            }
          })(t1156(x1157))
        })(@equal.lhand(x1158))
      })((fn(x1159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1159.1
      })(x1160))
    })(x1161)(x1161)
  }), t1162), t1163), t1164)
  let t1151 = @simp.asm_rewrite_tac(@list.List([]))
  let t1166 = @tactics.then_tac(@tactics.match_mp_tac(square_integrable_add()), t1151)
  let t1150 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1149 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Real) -> Bool)"))
  let t1148 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_subset())
  let t1147 = @simp.asm_rewrite_tac(@list.List([]))
  let t1167 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_on_add()), t1147), t1148), t1149), t1150), @calc_rat.real_arith_tac, t1166, t1165])
  let t1146 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1145 = @simp.asm_rewrite_tac(@list.List([]))
  let t1144 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => (g : (Real) -> Real)(x) + (h : (Real) -> Real)(x)"))
  let t1143 = @list.List([@simp.asm_simp_tac(@list.List([real_continuous_imp_square_integrable()])), @tactics.all_tac])
  let t1142 = @tactics.subgoal_then(@term_syntax.parse_term("square_integrable_on((h : (Real) -> Real), real_interval([((a : Real), (b : Real))]))"), fn(x1139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1140 = @tactics.assume_tac(x1139)
    fn(x1141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1140(x1141)
    }
  })
  let t1138 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(h : (Real) -> Real)"))(@tactics.strip_assume_tac))
  let t1137 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t1133 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1134 = @term_syntax.parse_term("(g : (Real) -> Real)((b : Real)) - g((a : Real))")
  let t1135 = @term_syntax.parse_term("(b : Real)")
  let t1136 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Real)"), t1135, t1134, t1133]), real_integral_tweak_ends()))
  let t1132 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Real) -> Real)"))(@tactics.strip_assume_tac))
  let t1131 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @realanalysis.real_measurable_real_interval()]))
  let t1128 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1129 = @term_syntax.parse_term("real_interval([((a : Real), (b : Real))])")
  let t1130 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t1129, t1128]), square_integrable_approximate_continuous()))
  let t1168 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1130), t1131), t1132), t1136), t1137), t1138), t1142), t1143), t1144), t1145), t1146), t1167)
  square_integrable_approximate_continuous_ends_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ a : Real, ∀ b : Real, ∀ e : Real, square_integrable_on(f, real_interval([(a, b)])) && a < b && real_of_num(0) < e → (∃ g : (Real) -> Real, real_continuous_on(g, real_interval([(a, b)])) && g(b) == g(a) && square_integrable_on(g, real_interval([(a, b)])) && l2norm(real_interval([(a, b)]), (x : Real) => f(x) - g(x)) < e)"), t1168))
}

///|
let square_integrable_approximate_continuous_ends_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_INTEGRABLE_APPROXIMATE_CONTINUOUS_ENDS")

///|
/// `SQUARE_INTEGRABLE_APPROXIMATE_CONTINUOUS_ENDS`
pub fn square_integrable_approximate_continuous_ends() -> @kernel.Thm {
  square_integrable_approximate_continuous_ends_c.get()
}

///|
/// WEIERSTRASS_L2_TRIG_POLYNOMIAL
fn step_81() -> Unit raise {
  let t1232 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t1231 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t1230 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1229 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_pow_mul(), @equal.gsym(@realax.real_mul_assoc())]))
  let t1233 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@realanalysis.real_integral_const(), @calc_rat.real_arith(@term_syntax.parse_term("(-pi <= pi) == (real_of_num(0) <= pi)")), @transcendentals.pi_pos_le()])), t1229), t1230), t1231), t1232), @calc_rat.real_arith_tac)
  let t1228 = @simp.asm_simp_tac(@list.List([]))
  let t1227 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) < (e : Real) → abs(x) <= abs(e)")))
  let t1226 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_le_square_abs())]))
  let t1225 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1224 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_const()]))
  let t1223 = @simp.asm_rewrite_tac(@list.List([]))
  let t1234 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integral_le()), t1223), t1224), t1225), @tactics.disch_tac), t1226), t1227), t1228), t1233])
  let t1222 = @tactics.exists_tac(@term_syntax.parse_term("real_integral(real_interval([(-pi, pi)]), (x : Real) => pow((e : Real) / real_of_num(6), 2))"))
  let t1221 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1220 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_pos(), @real.real_le_pow_2()]))
  let t1219 = @simp.rewrite_tac(@list.List([square_integrable_on()]))
  let t1218 = @list.List([@simp.asm_simp_tac(@list.List([square_integrable_sub()])), @tactics.all_tac])
  let t1217 = @tactics.subgoal_then(@term_syntax.parse_term("square_integrable_on((x : Real) => (g : (Real) -> Real)(x) - sum(op_dot_dot(0, (n : Num)), (k : Num) => (u : (Num) -> Real)(k) * sin(real_of_num(k) * x) + (v : (Num) -> Real)(k) * cos(real_of_num(k) * x)), real_interval([(-pi, pi)]))"), fn(x1214 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1215 = @tactics.mp_tac(x1214)
    fn(x1216 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1215(x1216)
    }
  })
  let t1213 = @tactics.match_mp_tac(@real.real_le_lsqrt())
  let t1212 = @simp.rewrite_tac(@list.List([l2norm(), l2product(), @equal.gsym(@realarith.real_pow_2())]))
  let t1211 = @simp.asm_rewrite_tac(@list.List([]))
  let t1210 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) / real_of_num(2) && (y : Real) <= e / real_of_num(2) → x + y < e")))
  let t1208 = @simp.asm_simp_tac(@list.List([square_integrable_sub()]))
  let t1207 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(f : Real) - (g : Real) + (g - (h : Real)) == f - h"))]))
  let t1201 = @drule.part_match(fn(x1200 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x1200))
  }, l2norm_triangle())
  let t1209 = @list.List([@tactics.then_tac(@tactics.then_tac(fn(x1206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1203 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1202 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1198 = @tactics.mp_tac(x1197)
            fn(x1199 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1198(x1199)
            }
          })(t1201(x1202))
        })(@kernel.rand(x1203))
      })((fn(x1204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1204.1
      })(x1205))
    })(x1206)(x1206)
  }, t1207), t1208), @tactics.all_tac])
  let t1196 = @tactics.exists_tac(@term_syntax.parse_term("l2norm(real_interval([(-pi, pi)]), (x : Real) => (f : (Real) -> Real)(x) - (g : (Real) -> Real)(x)) + l2norm(real_interval([(-pi, pi)]), (x : Real) => g(x) - sum(op_dot_dot(0, (n : Num)), (k : Num) => (u : (Num) -> Real)(k) * sin(real_of_num(k) * x) + (v : (Num) -> Real)(k) * cos(real_of_num(k) * x)))"))
  let t1194 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_on_differentiable()]))
  let t1193 = @tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on())
  let t1192 = @tactics.match_mp_tac(real_continuous_imp_square_integrable())
  let t1191 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1190 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t1189 = @tactics.match_mp_tac(square_integrable_sum())
  let t1195 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1189), t1190), t1191), t1192), t1193), t1194), @tactics.gen_tac), @tactics.disch_tac), @realanalysis.real_differentiable_tac), @tactics.all_tac])
  let t1188 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ u : (Num) -> Real, ∀ v : (Num) -> Real, square_integrable_on((x : Real) => sum(op_dot_dot(0, n), (k : Num) => u(k) * sin(real_of_num(k) * x) + v(k) * cos(real_of_num(k) * x)), real_interval([(-pi, pi)]))"), fn(x1185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1186 = @tactics.assume_tac(x1185)
    fn(x1187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1186(x1187)
    }
  })
  let t1184 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t1181 = @term_syntax.parse_term("(v : (Num) -> Real)")
  let t1182 = @term_syntax.parse_term("(u : (Num) -> Real)")
  let t1183 = @tactics.map_every(fn(x1178 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x1178
    let t1180 = @tactics.x_gen_tac(t)
    @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t1180)
  }, @list.List([@term_syntax.parse_term("(n : Num)"), t1182, t1181]))
  let t1177 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t1175 = @term_syntax.parse_term("(e : Real) / real_of_num(6)")
  let t1176 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Real) -> Real)"), t1175]), weierstrass_trig_polynomial()))
  let t1174 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Real) -> Real)"))(@tactics.strip_assume_tac))
  let t1173 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @calc_rat.real_arith(@term_syntax.parse_term("(-pi < pi) == (real_of_num(0) < pi)")), @transcendentals.pi_pos()]))
  let t1169 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1170 = @term_syntax.parse_term("pi")
  let t1171 = @term_syntax.parse_term("-pi")
  let t1172 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t1171, t1170, t1169]), square_integrable_approximate_continuous_ends()))
  let t1235 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1172), t1173), t1174), t1176), t1177), t1183), @tactics.disch_tac), t1184), t1188), t1195), t1196), @tactics.conj_tac), t1209), t1210), t1211), t1212), t1213), t1217), t1218), t1219), @tactics.strip_tac), t1220), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1221), t1222), @tactics.conj_tac), t1234)
  weierstrass_l2_trig_polynomial_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ e : Real, square_integrable_on(f, real_interval([(-pi, pi)])) && real_of_num(0) < e → (∃ n : Num, ∃ a : (Num) -> Real, ∃ b : (Num) -> Real, l2norm(real_interval([(-pi, pi)]), (x : Real) => f(x) - sum(op_dot_dot(0, n), (k : Num) => a(k) * sin(real_of_num(k) * x) + b(k) * cos(real_of_num(k) * x))) < e)"), t1235))
}

///|
let weierstrass_l2_trig_polynomial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WEIERSTRASS_L2_TRIG_POLYNOMIAL")

///|
/// `WEIERSTRASS_L2_TRIG_POLYNOMIAL`
pub fn weierstrass_l2_trig_polynomial() -> @kernel.Thm {
  weierstrass_l2_trig_polynomial_c.get()
}

///|
/// WEIERSTRASS_L2_TRIGONOMETRIC_SET
fn step_82() -> Unit raise {
  let t1286 = @simp.rewrite_tac(@list.List([@transcendentals.pi_pos()]))
  let t1285 = @tactics.match_mp_tac(@real.sqrt_pos_lt())
  let t1284 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (s : Real) → s * (b : Real) * ((c : Real) / s) == b * c")))
  let t1283 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("DIV(SUC(2 * SUC((i : Num)) - 1), 2) == SUC(i)"))]))
  let t1282 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1281 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) && i <= (n : Num) → 2 * i - 1 <= 2 * n"))]))
  let t1280 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t1279 = @simp.simp_tac(@list.List([@transcendentals.sin_0(), @calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @realax.real_add_lid(), @calc_num.arith()]))
  let t1278 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @arith.le_0(), @calc_int.real_add_rid()]))
  let t1277 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!(2 * (n : Num) + 1 <= 2 * n)")), @calc_int.real_mul_lzero()]))
  let t1276 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num)) && 2 * SUC(n) - 1 == 2 * n + 1"))]))
  let t1275 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @calc_num.arith(), @iterate.sum_clauses_numseg()]))
  let t1274 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.spec(@term_syntax.parse_term("1"), @iterate.sum_offset()))]))
  let t1287 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * (i : Num) + 1 == 2 * (i + 1) - 1"))])), t1274), t1275), t1276), t1277), t1278), t1279), t1280), t1281), @nums.induct_tac), t1282), t1283), @tactics.disch_tac), t1284), t1285), t1286)
  let t1271 = @simp.rewrite_tac(@list.List([@transcendentals.pi_pos()]))
  let t1270 = @tactics.match_mp_tac(@real.sqrt_pos_lt())
  let t1269 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (s : Real) → s * (b : Real) * ((c : Real) / s) == b * c")))
  let t1268 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t1267 = @simp.rewrite_tac(@list.List([trigonometric_set(), @int.arith_rule(@term_syntax.parse_term("DIV(2 * (i : Num) + 2, 2) == SUC(i)"))]))
  let t1266 = @simp.rewrite_tac(@list.List([@nums.not_suc(), @int.arith_rule(@term_syntax.parse_term("2 * SUC((i : Num)) == 2 * i + 2"))]))
  let t1272 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1265 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t1266), t1267), t1268), t1269), t1270), t1271)
  let t1264 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t1263 = @tactics.match_mp_tac(@real.sqrt_pos_lt())
  let t1262 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (s : Real) → s * (b : Real) * ((c : Real) / s) == b * c")))
  let t1273 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([trigonometric_set(), @calc_num.arith(), @arith.le_0()])), t1262), t1263), t1264), @calc_rat.real_arith_tac), t1272])
  let t1261 = @simp.simp_tac(@list.List([@arith.le_0(), @int.arith_rule(@term_syntax.parse_term("(2 * (i : Num) <= 2 * (n : Num)) == (i <= n)"))]))
  let t1288 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t1261), @nums.induct_tac), t1273), t1287])
  let t1260 = @simp.gen_rewrite_tac(fn(x1257 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1258 = @equal.rand_conv(x1257)
    fn(x1259 : @kernel.Term) -> @kernel.Thm raise {
      s1258(x1259)
    }
  }, @list.List([@realax.real_add_sym()]))
  let t1256 = @simp.rewrite_tac(@list.List([@iterate.sum_add_numseg()]))
  let t1255 = @simp.rewrite_tac(@list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith(), @arith.add_eq_0(), @arith.mult_eq_0()]))
  let t1254 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1253 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1250 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) → (y : Real) == x → y < e")))
  let t1252 = @tactics.first_x_assum(fn(x1251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1250(x1251))
  })
  let t1249 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) => if k == 0 { sqrt(real_of_num(2) * pi) * (b : (Num) -> Real)(0) } else { if EVEN(k) { sqrt(pi) * b(DIV(k, 2)) } else { if k <= 2 * (n : Num) { sqrt(pi) * (a : (Num) -> Real)(DIV(k + 1, 2)) } else { real_of_num(0) } } }"))
  let t1248 = @simp.rewrite_tac(@list.List([@iterate.sum_pair(), @iterate.sum_add_numseg(), trigonometric_set()]))
  let t1247 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("0 == 2 * 0")))
  let t1246 = @tactics.exists_tac(@term_syntax.parse_term("2 * (n : Num) + 1"))
  let t1243 = @term_syntax.parse_term("(b : (Num) -> Real)")
  let t1244 = @term_syntax.parse_term("(a : (Num) -> Real)")
  let t1245 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t1244, t1243]))
  let t1242 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1239 = @drule.match_mp(weierstrass_l2_trig_polynomial())
  let t1241 = @tactics.first_assum(fn(x1240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1237 = @tactics.mp_tac(x1236)
      fn(x1238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1237(x1238)
      }
    })(t1239(x1240))
  })
  let t1289 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1241), t1242), t1245), @tactics.disch_tac), t1246), t1247), t1248), t1249), t1252), @tactics.ap_term_tac), t1253), t1254), @tactics.ap_term_tac), t1255), t1256), t1260), @tactics.binop_tac), t1288)
  weierstrass_l2_trigonometric_set_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ e : Real, square_integrable_on(f, real_interval([(-pi, pi)])) && real_of_num(0) < e → (∃ n : Num, ∃ a : (Num) -> Real, l2norm(real_interval([(-pi, pi)]), (x : Real) => f(x) - sum(op_dot_dot(0, n), (k : Num) => a(k) * trigonometric_set(k, x))) < e)"), t1289))
}

///|
let weierstrass_l2_trigonometric_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WEIERSTRASS_L2_TRIGONOMETRIC_SET")

///|
/// `WEIERSTRASS_L2_TRIGONOMETRIC_SET`
pub fn weierstrass_l2_trigonometric_set() -> @kernel.Thm {
  weierstrass_l2_trigonometric_set_c.get()
}

///|
/// fourier_coefficient
fn step_83() -> Unit raise {
  fourier_coefficient_c.set(@pair.new_definition(@term_syntax.parse_term("(fourier_coefficient : ((Real) -> Real, Num) -> Real) == orthonormal_coefficient(real_interval([(-pi, pi)]), trigonometric_set)")))
}

///|
let fourier_coefficient_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fourier_coefficient")

///|
/// `fourier_coefficient`
pub fn fourier_coefficient() -> @kernel.Thm {
  fourier_coefficient_c.get()
}

///|
/// FOURIER_SERIES_L2
fn step_84() -> Unit raise {
  let t1321 = @simp.simp_tac(@list.List([@iterate.in_numseg(), @calc_int.real_mul_lzero(), @arith.le_0()]))
  let t1320 = @simp.asm_simp_tac(@list.List([@iterate.finite_numseg(), @iterate.subset_numseg(), @arith.le_0()]))
  let t1319 = @tactics.match_mp_tac(@iterate.sum_eq_superset())
  let t1318 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1317 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1315 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) → (y : Real) == x → y < e")))
  let t1322 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1316 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1315(x1316))
  }), @tactics.ap_term_tac), t1317), t1318), @tactics.ap_term_tac), t1319), t1320), t1321)
  let t1314 = @simp.rewrite_tac(@list.List([@class.eta_ax(), square_integrable_trigonometric_set()]))
  let t1313 = @tactics.match_mp_tac(square_integrable_lmul())
  let t1312 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1311 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t1310 = @tactics.match_mp_tac(square_integrable_sum())
  let t1309 = @simp.asm_rewrite_tac(@list.List([]))
  let t1308 = @tactics.match_mp_tac(square_integrable_sub())
  let t1323 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(l2norm_pos_le()), t1308), t1309), t1310), t1311), t1312), t1313), t1314), t1322])
  let t1307 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && (a : Real) < (e : Real) → x <= a → abs(x) < e")))
  let t1306 = @simp.asm_rewrite_tac(@list.List([@iterate.finite_numseg(), orthonormal_system_trigonometric_set(), square_integrable_trigonometric_set(), @real.real_sub_rzero()]))
  let t1301 = @term_syntax.parse_term("op_dot_dot(0, (m : Num))")
  let t1302 = @term_syntax.parse_term("(f : (Real) -> Real)")
  let t1303 = @term_syntax.parse_term("(i : Num) => if i <= (n : Num) { (a : (Num) -> Real)(i) } else { real_of_num(0) }")
  let t1304 = @term_syntax.parse_term("trigonometric_set")
  let t1305 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("real_interval([(-pi, pi)])"), t1304, t1303, t1302, t1301]), orthonormal_optimal_partial_sum()))
  let t1300 = @simp.rewrite_tac(@list.List([fourier_coefficient()]))
  let t1299 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1298 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : (Num) -> Real)"))
  let t1297 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1296 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1295 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1294 = @simp.asm_rewrite_tac(@list.List([]))
  let t1292 = @term_syntax.parse_term("(e : Real)")
  let t1293 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t1292]), weierstrass_l2_trigonometric_set()))
  let t1291 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1290 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t1324 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1290), t1291), @tactics.strip_tac), t1293), t1294), t1295), t1296), t1297), t1298), @tactics.disch_tac), t1299), @tactics.disch_tac), t1300), t1305), t1306), t1307), @tactics.conj_tac), t1323)
  fourier_series_l2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, square_integrable_on(f, real_interval([(-pi, pi)])) → op_minus_minus_minus_gt((n : Num) => l2norm(real_interval([(-pi, pi)]), (x : Real) => f(x) - sum(op_dot_dot(0, n), (i : Num) => fourier_coefficient(f, i) * trigonometric_set(i, x))), real_of_num(0), sequentially)"), t1324))
}

///|
let fourier_series_l2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SERIES_L2")

///|
/// `FOURIER_SERIES_L2`
pub fn fourier_series_l2() -> @kernel.Thm {
  fourier_series_l2_c.get()
}

///|
/// TRIGONOMETRIC_SET_MUL_ABSOLUTELY_INTEGRABLE
fn step_85() -> Unit raise {
  let t1351 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t1350 = @tactics.match_mp_tac(@real.sqrt_mono_le())
  let t1349 = @tactics.subst1_tac(@equal.gsym(@real.sqrt_1()))
  let t1348 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(1) <= real_of_num(1) * abs(x)")))
  let t1347 = @simp.rewrite_tac(@list.List([@transcendentals.cos_bound(), @transcendentals.sin_bound()]))
  let t1346 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1345 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1344 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1342 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)"))
  let t1343 = @simp.simp_tac(@list.List([@real.real_le_ldiv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → real_of_num(0) < abs(x)")), @real.sqrt_pos_lt(), t1342, @transcendentals.pi_pos()]))
  let t1341 = @simp.rewrite_tac(@list.List([trigonometric_set(), @real.real_abs_div()]))
  let t1340 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t1338 = @term_syntax.parse_term("(n : Num)")
  let t1339 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1338)
  let t1337 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1352 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image()])), t1337), t1339), t1340), t1341), t1343), t1344), t1345), t1346), t1347), t1348), t1349), t1350), t1351), @calc_rat.real_arith_tac)
  let t1336 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1335 = @simp.rewrite_tac(@list.List([trigonometric_set(), @realax.real_div()]))
  let t1334 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t1332 = @term_syntax.parse_term("(n : Num)")
  let t1333 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1332)
  let t1331 = @simp.rewrite_tac(@list.List([@class.eta_ax(), @sets.in_univ(), @realanalysis.real_differentiable_on_differentiable()]))
  let t1330 = @tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on())
  let t1329 = @tactics.match_mp_tac(@realanalysis.continuous_imp_real_measurable_on())
  let t1328 = @simp.rewrite_tac(@list.List([@realanalysis.real_measurable_real_interval(), @sets.subset_univ()]))
  let t1327 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Real) -> Bool)"))
  let t1353 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_measurable_subset()), t1327), t1328), t1329), t1330), t1331), t1333), t1334), t1335), t1336), @realanalysis.real_differentiable_tac), t1352])
  let t1326 = @simp.asm_rewrite_tac(@list.List([]))
  let t1325 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t1354 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1325), t1326), @tactics.conj_tac), t1353)
  trigonometric_set_mul_absolutely_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → absolutely_real_integrable_on((x : Real) => trigonometric_set(n, x) * f(x), real_interval([(-pi, pi)]))"), t1354))
}

///|
let trigonometric_set_mul_absolutely_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIGONOMETRIC_SET_MUL_ABSOLUTELY_INTEGRABLE")

///|
/// `TRIGONOMETRIC_SET_MUL_ABSOLUTELY_INTEGRABLE`
pub fn trigonometric_set_mul_absolutely_integrable() -> @kernel.Thm {
  trigonometric_set_mul_absolutely_integrable_c.get()
}

///|
/// TRIGONOMETRIC_SET_MUL_INTEGRABLE
fn step_86() -> Unit raise {
  let t1355 = @simp.simp_tac(@list.List([@realanalysis.absolutely_real_integrable_imp_integrable(), trigonometric_set_mul_absolutely_integrable()]))
  trigonometric_set_mul_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → real_integrable_on((x : Real) => trigonometric_set(n, x) * f(x), real_interval([(-pi, pi)]))"), t1355))
}

///|
let trigonometric_set_mul_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIGONOMETRIC_SET_MUL_INTEGRABLE")

///|
/// `TRIGONOMETRIC_SET_MUL_INTEGRABLE`
pub fn trigonometric_set_mul_integrable() -> @kernel.Thm {
  trigonometric_set_mul_integrable_c.get()
}

///|
let absolutely_integrable_sin_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_INTEGRABLE_SIN_PRODUCT")

///|
/// `ABSOLUTELY_INTEGRABLE_SIN_PRODUCT`
pub fn absolutely_integrable_sin_product() -> @kernel.Thm {
  absolutely_integrable_sin_product_c.get()
}

///|
let absolutely_integrable_cos_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_INTEGRABLE_COS_PRODUCT")

///|
/// `ABSOLUTELY_INTEGRABLE_COS_PRODUCT`
pub fn absolutely_integrable_cos_product() -> @kernel.Thm {
  absolutely_integrable_cos_product_c.get()
}

///|
/// ABSOLUTELY_INTEGRABLE_SIN_PRODUCT, ABSOLUTELY_INTEGRABLE_COS_PRODUCT
fn step_87() -> Unit raise {
  let t1372 = @simp.rewrite_tac(@list.List([trigonometric_set(), @transcendentals.cos_bound(), @transcendentals.sin_bound()]))
  let t1371 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t1369 = @term_syntax.parse_term("(n : Num)")
  let t1370 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1369)
  let t1368 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1373 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image()])), t1368), t1370), t1371), t1372)
  let t1367 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1366 = @simp.rewrite_tac(@list.List([trigonometric_set(), @realax.real_div()]))
  let t1365 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t1363 = @term_syntax.parse_term("(n : Num)")
  let t1364 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1363)
  let t1362 = @simp.rewrite_tac(@list.List([@class.eta_ax(), @sets.in_univ(), @realanalysis.real_differentiable_on_differentiable()]))
  let t1361 = @tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on())
  let t1360 = @tactics.match_mp_tac(@realanalysis.continuous_imp_real_measurable_on())
  let t1359 = @simp.rewrite_tac(@list.List([@realanalysis.real_measurable_real_interval(), @sets.subset_univ()]))
  let t1358 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Real) -> Bool)"))
  let t1374 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_measurable_subset()), t1358), t1359), t1360), t1361), t1362), t1364), t1365), t1366), t1367), @realanalysis.real_differentiable_tac), t1373])
  let t1375 = @tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.conj_tac), t1374)
  let t1357 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t1376 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1357), t1375)
  let t1377 = (@term_syntax.parse_term("(∀ f : (Real) -> Real, ∀ k : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → absolutely_real_integrable_on((x : Real) => sin(k * x) * f(x), real_interval([(-pi, pi)]))) && (∀ f : (Real) -> Real, ∀ k : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → absolutely_real_integrable_on((x : Real) => cos(k * x) * f(x), real_interval([(-pi, pi)])))"), t1376)
  let (absolutely_integrable_sin_product, absolutely_integrable_cos_product) = @bool.conj_pair((fn(x1356 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x1356.0, x1356.1)
  })(t1377))
  absolutely_integrable_sin_product_c.set(absolutely_integrable_sin_product)
  absolutely_integrable_cos_product_c.set(absolutely_integrable_cos_product)
}

///|
/// FOURIER_PRODUCTS_INTEGRABLE_STRONG
fn step_88() -> Unit raise {
  let t1378 = @simp.simp_tac(@list.List([absolutely_integrable_sin_product(), absolutely_integrable_cos_product(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  fourier_products_integrable_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ k : Real, real_integrable_on((x : Real) => cos(k * x) * f(x), real_interval([(-pi, pi)]))) && (∀ k : Real, real_integrable_on((x : Real) => sin(k * x) * f(x), real_interval([(-pi, pi)])))"), t1378))
}

///|
let fourier_products_integrable_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_PRODUCTS_INTEGRABLE_STRONG")

///|
/// `FOURIER_PRODUCTS_INTEGRABLE_STRONG`
pub fn fourier_products_integrable_strong() -> @kernel.Thm {
  fourier_products_integrable_strong_c.get()
}

///|
/// FOURIER_PRODUCTS_INTEGRABLE
fn step_89() -> Unit raise {
  let t1380 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_real_interval(), square_integrable_imp_absolutely_integrable()]))
  let t1379 = @tactics.match_mp_tac(fourier_products_integrable_strong())
  let t1381 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1379), t1380)
  fourier_products_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, square_integrable_on(f, real_interval([(-pi, pi)])) → real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ k : Real, real_integrable_on((x : Real) => cos(k * x) * f(x), real_interval([(-pi, pi)]))) && (∀ k : Real, real_integrable_on((x : Real) => sin(k * x) * f(x), real_interval([(-pi, pi)])))"), t1381))
}

///|
let fourier_products_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_PRODUCTS_INTEGRABLE")

///|
/// `FOURIER_PRODUCTS_INTEGRABLE`
pub fn fourier_products_integrable() -> @kernel.Thm {
  fourier_products_integrable_c.get()
}

///|
/// ABSOLUTELY_INTEGRABLE_APPROXIMATE_CONTINUOUS
fn step_90() -> Unit raise {
  let t1413 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.norm_lift(), @vectors.lift_drop(), @vectors.norm_real(), @equal.gsym(@vectors.drop_()), @vectors.drop_sub(), @vectors.lift_sub()]))
  let t1414 = @tactics.then_tac(@tactics.disch_then(fn(x1410 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1411 = @tactics.subst1_tac(x1410)
    fn(x1412 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1411(x1412)
    }
  }), t1413)
  let t1409 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_sub(), @class.eta_ax()]))
  let t1408 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([@realanalysis.absolutely_real_integrable_on()]))])
  let t1415 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((x : Real) => (f : (Real) -> Real)(x) - o(drop, o((g : (Cart[Real, Unit]) -> Cart[Real, Unit]), lift), x), (s : (Real) -> Bool))"), fn(x1405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1406 = @tactics.mp_tac(x1405)
    fn(x1407 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1406(x1407)
    }
  }), t1408), t1409), t1414])
  let t1399 = @drule.part_match(fn(x1398 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1398))
  }, @realanalysis.real_integral_v1())
  let t1394 = @simp.rewrite_tac(@list.List([@lpspaces.lnorm(), @real.real_inv_1(), @transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t1392 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) → x == (y : Real) → y < e")))
  let t1416 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.first_x_assum(fn(x1393 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1392(x1393))
  })), t1394), fn(x1404 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1403 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1401 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1400 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1396 = @tactics.mp_tac(x1395)
            fn(x1397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1396(x1397)
            }
          })(t1399(x1400))
        })(@kernel.rand(x1401))
      })((fn(x1402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1402.1
      })(x1403))
    })(x1404)(x1404)
  }), @tactics.ants_tac), t1415)
  let t1417 = @list.List([@simp.asm_rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_on_v1(), @trivia.o_def(), @vectors.lift_drop(), @class.eta_ax()])), t1416])
  let t1391 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t1390 = @list.List([@simp.asm_rewrite_tac(@list.List([@realanalysis.real_continuous_on_v1(), @trivia.o_def(), @vectors.lift_drop(), @class.eta_ax(), @vectors.image_lift_univ()])), @tactics.all_tac])
  let t1389 = @tactics.exists_tac(@term_syntax.parse_term("o(drop, o((g : (Cart[Real, Unit]) -> Cart[Real, Unit]), lift))"))
  let t1388 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, Unit])"))(@tactics.strip_assume_tac))
  let t1386 = @equal.gsym(@realanalysis.real_measurable_measurable())
  let t1387 = @simp.asm_rewrite_tac(@list.List([@lpspaces.lspace_1(), @equal.gsym(@realanalysis.absolutely_real_integrable_on_v1()), @realax.real_of_num_le(), @calc_num.arith(), t1386]))
  let t1382 = @term_syntax.parse_term("(e : Real)")
  let t1383 = @term_syntax.parse_term("real_of_num(1)")
  let t1384 = @term_syntax.parse_term("IMAGE(lift, (s : (Real) -> Bool))")
  let t1385 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("o(lift, o((f : (Real) -> Real), drop))"), t1384, t1383, t1382]), @lpspaces.lspace_approximate_continuous()))
  let t1418 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1385), t1387), t1388), t1389), @tactics.conj_tac), t1390), t1391), @tactics.conj_tac), t1417)
  absolutely_integrable_approximate_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, ∀ e : Real, real_measurable(s) && absolutely_real_integrable_on(f, s) && real_of_num(0) < e → (∃ g : (Real) -> Real, real_continuous_on(g, UNIV) && absolutely_real_integrable_on(g, s) && real_integral(s, (x : Real) => abs(f(x) - g(x))) < e)"), t1418))
}

///|
let absolutely_integrable_approximate_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_INTEGRABLE_APPROXIMATE_CONTINUOUS")

///|
/// `ABSOLUTELY_INTEGRABLE_APPROXIMATE_CONTINUOUS`
pub fn absolutely_integrable_approximate_continuous() -> @kernel.Thm {
  absolutely_integrable_approximate_continuous_c.get()
}

///|
/// RIEMANN_LEBESGUE_SQUARE_INTEGRABLE
fn step_91() -> Unit raise {
  let t1434 = @simp.simp_tac(@list.List([@sets.in_univ(), @realanalysis.reallim_null_pow_eq(), @calc_num.arith(), @class.eta_ax()]))
  let t1431 = @drule.match_mp(@realanalysis.real_summable_imp_tozero())
  let t1433 = @tactics.disch_then(fn(x1432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1429 = @tactics.mp_tac(x1428)
      fn(x1430 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1429(x1430)
      }
    })(t1431(x1432))
  })
  let t1425 = @drule.match_mp(fourier_series_square_summable())
  let t1422 = @term_syntax.parse_term("(UNIV : (Num) -> Bool)")
  let t1427 = @tactics.first_assum(fn(x1426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1419 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1420 = @tactics.mp_tac(x1419)
        fn(x1421 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1420(x1421)
        }
      })(((x1423 : @kernel.Thm) => @bool.spec(t1422, x1423))(x1424))
    })(t1425(x1426))
  })
  let t1435 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1427), t1433), t1434)
  riemann_lebesgue_square_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ w : (Num, Real) -> Real, ∀ f : (Real) -> Real, orthonormal_system(s, w) && (∀ i : Num, square_integrable_on(w(i), s)) && square_integrable_on(f, s) → op_minus_minus_minus_gt(orthonormal_coefficient(s, w, f), real_of_num(0), sequentially)"), t1435))
}

///|
let riemann_lebesgue_square_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIEMANN_LEBESGUE_SQUARE_INTEGRABLE")

///|
/// `RIEMANN_LEBESGUE_SQUARE_INTEGRABLE`
pub fn riemann_lebesgue_square_integrable() -> @kernel.Thm {
  riemann_lebesgue_square_integrable_c.get()
}

///|
/// RIEMANN_LEBESGUE
fn step_92() -> Unit raise {
  let t1519 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t1518 = @tactics.match_mp_tac(@real.sqrt_mono_le())
  let t1517 = @tactics.subst1_tac(@equal.gsym(@real.sqrt_1()))
  let t1516 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(1) <= real_of_num(1) * abs(x)")))
  let t1515 = @simp.rewrite_tac(@list.List([@transcendentals.cos_bound(), @transcendentals.sin_bound()]))
  let t1514 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1513 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1512 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1510 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)"))
  let t1511 = @simp.simp_tac(@list.List([@real.real_le_ldiv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → real_of_num(0) < abs(x)")), @real.sqrt_pos_lt(), t1510, @transcendentals.pi_pos()]))
  let t1509 = @simp.rewrite_tac(@list.List([trigonometric_set(), @real.real_abs_div()]))
  let t1508 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t1506 = @term_syntax.parse_term("(n : Num)")
  let t1507 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1506)
  let t1505 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1504 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1503 = @simp.gen_rewrite_tac(fn(x1500 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1501 = @equal.rand_conv(x1500)
    fn(x1502 : @kernel.Term) -> @kernel.Thm raise {
      s1501(x1502)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t1499 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_sub()]))
  let t1498 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sub_ldistrib())]))
  let t1520 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1498), t1499), t1503), t1504), t1505), t1507), t1508), t1509), t1511), t1512), t1513), t1514), t1515), t1516), t1517), t1518), t1519), @calc_rat.real_arith_tac)
  let t1497 = @simp.simp_tac(@list.List([@realanalysis.absolutely_real_integrable_on()]))
  let t1496 = @list.List([@simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_sub()])), @tactics.all_tac])
  let t1521 = @tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((x : Real) => (f : (Real) -> Real)(x) - (g : (Real) -> Real)(x), real_interval([(-pi, pi)]))"), fn(x1493 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1494 = @tactics.mp_tac(x1493)
    fn(x1495 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1494(x1495)
    }
  }), t1496), t1497)
  let t1492 = @simp.asm_simp_tac(@list.List([trigonometric_set_mul_integrable()]))
  let t1522 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_sub()), t1492), t1521, t1520])
  let t1491 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1490 = @tactics.match_mp_tac(@realanalysis.real_integral_abs_bound_integral())
  let t1489 = @tactics.disch_then(fn(x1488 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1486 = @tactics.subst1_tac(x1485)
      fn(x1487 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1486(x1487)
      }
    })(@equal.sym(x1488))
  })
  let t1484 = @simp.rewrite_tac(@list.List([]))
  let t1483 = @simp.asm_simp_tac(@list.List([trigonometric_set_mul_integrable()]))
  let t1476 = @drule.part_match(fn(x1475 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x1475))
  }, @realanalysis.real_integral_sub())
  let t1471 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (y : Real)) <= (r : Real) → abs(abs(x) - abs(y)) <= r")))
  let t1468 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) / real_of_num(2) → abs((y : Real) - (z : Real)) <= x → y < e / real_of_num(2) → z < e")))
  let t1470 = @tactics.first_x_assum(fn(x1469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1468(x1469))
  })
  let t1467 = @simp.rewrite_tac(@list.List([fourier_coefficient(), orthonormal_coefficient(), l2product()]))
  let t1466 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t1465 = @class.asm_cases_tac(@term_syntax.parse_term("(N : Num) <= (n : Num)"))
  let t1464 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1463 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1462 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1461 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1460 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t1456 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1459 = @tactics.disch_then(fn(x1458 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1454 = @tactics.mp_tac(x1453)
      fn(x1455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1454(x1455)
      }
    })(((x1457 : @kernel.Thm) => @bool.spec(t1456, x1457))(x1458))
  })
  let t1452 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t1450 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1449 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Real) -> Bool)"))
  let t1448 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_subset())
  let t1447 = @tactics.match_mp_tac(real_continuous_imp_square_integrable())
  let t1451 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([orthonormal_system_trigonometric_set(), square_integrable_trigonometric_set()])), t1447), t1448), t1449), t1450), @tactics.all_tac])
  let t1446 = @simp.asm_rewrite_tac(@list.List([]))
  let t1443 = @term_syntax.parse_term("(g : (Real) -> Real)")
  let t1444 = @term_syntax.parse_term("trigonometric_set")
  let t1445 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("real_interval([(-pi, pi)])"), t1444, t1443]), riemann_lebesgue_square_integrable()))
  let t1442 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (Real) -> Real)"))
  let t1441 = @simp.asm_simp_tac(@list.List([@misc.real_half(), @realanalysis.real_measurable_real_interval(), @theorems.left_imp_exists_thm()]))
  let t1438 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1439 = @term_syntax.parse_term("real_interval([(-pi, pi)])")
  let t1440 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t1439, t1438]), absolutely_integrable_approximate_continuous()))
  let t1437 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1436 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t1523 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1436), t1437), @tactics.disch_tac), t1440), t1441), t1442), @tactics.strip_tac), t1445), t1446), @tactics.ants_tac), t1451), t1452), t1459), t1460), t1461), t1462), t1463), t1464), t1465), t1466), t1467), t1470), t1471), fn(x1482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1481 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1479 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1478 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1477 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x1472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s1473 = @tactics.mp_tac(x1472)
              fn(x1474 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s1473(x1474)
              }
            })(t1476(x1477))
          })(@kernel.rand(x1478))
        })(@equal.lhand(x1479))
      })((fn(x1480 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1480.1
      })(x1481))
    })(x1482)(x1482)
  }), t1483), t1484), t1489), t1490), t1491), t1522)
  riemann_lebesgue_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → op_minus_minus_minus_gt(fourier_coefficient(f), real_of_num(0), sequentially)"), t1523))
}

///|
let riemann_lebesgue_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIEMANN_LEBESGUE")

///|
/// `RIEMANN_LEBESGUE`
pub fn riemann_lebesgue() -> @kernel.Thm {
  riemann_lebesgue_c.get()
}

///|
/// RIEMANN_LEBESGUE_SIN
fn step_93() -> Unit raise {
  let t1571 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t1570 = @tactics.match_mp_tac(@real.real_le_lsqrt())
  let t1569 = @simp.simp_tac(@list.List([@real.sqrt_pos_le(), @transcendentals.pi_pos_le()]))
  let t1568 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= real_of_num(4) → inv(real_of_num(4)) * abs(x) <= real_of_num(1)")))
  let t1567 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq()]))
  let t1566 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t1565 = @simp.gen_rewrite_tac(fn(x1562 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1563 = @equal.rand_conv(x1562)
    fn(x1564 : @kernel.Term) -> @kernel.Thm raise {
      s1563(x1564)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t1561 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(d : Real) <= (e : Real) → (x : Real) < d → x < e")))
  let t1560 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t1559 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq(), @real.sqrt_pos_lt(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → real_of_num(0) < abs(x)")), @real.real_abs_div()]))
  let t1557 = @equal.gsym(@realax.real_div())
  let t1558 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(t1557)]))
  let t1556 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_lmul(), fourier_products_integrable_strong()]))
  let t1555 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) / sqrt(pi) * (b : Real) == inv(sqrt(pi)) * (a * b)"))]))
  let t1554 = @simp.rewrite_tac(@list.List([fourier_coefficient(), orthonormal_coefficient(), trigonometric_set(), l2product(), @real.real_sub_rzero()]))
  let t1550 = @term_syntax.parse_term("2 * (n : Num) + 1")
  let t1553 = @tactics.first_x_assum(fn(x1552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1547 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1548 = @tactics.mp_tac(x1547)
      fn(x1549 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1548(x1549)
      }
    })(((x1551 : @kernel.Thm) => @bool.spec(t1550, x1551))(x1552))
  })
  let t1545 = @tactics.disch_then(fn(x1544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1546 = @list.List([@int.arith_tac, @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t1545)])
  let t1543 = @tactics.match_mp_tac(@nums.num_induction())
  let t1542 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1"))
  let t1539 = @term_syntax.parse_term("(N : Num)")
  let t1541 = @tactics.disch_then((x1540 : @kernel.Thm) => @tactics.x_choose_tac(t1539, x1540))
  let t1535 = @term_syntax.parse_term("(e : Real) / real_of_num(4)")
  let t1538 = @tactics.first_x_assum(fn(x1537 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1532 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1533 = @tactics.mp_tac(x1532)
      fn(x1534 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1533(x1534)
      }
    })(((x1536 : @kernel.Thm) => @bool.spec(t1535, x1536))(x1537))
  })
  let t1531 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1530 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t1527 = @drule.match_mp(riemann_lebesgue())
  let t1529 = @tactics.first_assum(fn(x1528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1524 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1525 = @tactics.mp_tac(x1524)
      fn(x1526 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1525(x1526)
      }
    })(t1527(x1528))
  })
  let t1572 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1529), t1530), @tactics.disch_tac), t1531), @tactics.disch_tac), t1538), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1541), t1542), t1543), @tactics.conj_tac), t1546), @tactics.disch_tac), t1553), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1554), t1555), t1556), t1558), t1559), t1560), t1561), t1565), t1566), t1567), t1568), t1569), t1570), t1571), @calc_rat.real_arith_tac)
  riemann_lebesgue_sin_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(-pi, pi)]), (x : Real) => sin(real_of_num(n) * x) * f(x)), real_of_num(0), sequentially)"), t1572))
}

///|
let riemann_lebesgue_sin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIEMANN_LEBESGUE_SIN")

///|
/// `RIEMANN_LEBESGUE_SIN`
pub fn riemann_lebesgue_sin() -> @kernel.Thm {
  riemann_lebesgue_sin_c.get()
}

///|
/// RIEMANN_LEBESGUE_COS
fn step_94() -> Unit raise {
  let t1620 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t1619 = @tactics.match_mp_tac(@real.real_le_lsqrt())
  let t1618 = @simp.simp_tac(@list.List([@real.sqrt_pos_le(), @transcendentals.pi_pos_le()]))
  let t1617 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= real_of_num(4) → inv(real_of_num(4)) * abs(x) <= real_of_num(1)")))
  let t1616 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq()]))
  let t1615 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t1614 = @simp.gen_rewrite_tac(fn(x1611 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1612 = @equal.rand_conv(x1611)
    fn(x1613 : @kernel.Term) -> @kernel.Thm raise {
      s1612(x1613)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t1610 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(d : Real) <= (e : Real) → (x : Real) < d → x < e")))
  let t1609 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t1608 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq(), @real.sqrt_pos_lt(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → real_of_num(0) < abs(x)")), @real.real_abs_div()]))
  let t1606 = @equal.gsym(@realax.real_div())
  let t1607 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(t1606)]))
  let t1605 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_lmul(), fourier_products_integrable_strong()]))
  let t1604 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) / sqrt(pi) * (b : Real) == inv(sqrt(pi)) * (a * b)"))]))
  let t1603 = @simp.rewrite_tac(@list.List([fourier_coefficient(), orthonormal_coefficient(), trigonometric_set(), l2product(), @real.real_sub_rzero()]))
  let t1599 = @term_syntax.parse_term("2 * (n : Num) + 2")
  let t1602 = @tactics.first_x_assum(fn(x1601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1596 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1597 = @tactics.mp_tac(x1596)
      fn(x1598 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1597(x1598)
      }
    })(((x1600 : @kernel.Thm) => @bool.spec(t1599, x1600))(x1601))
  })
  let t1594 = @tactics.disch_then(fn(x1593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1595 = @list.List([@int.arith_tac, @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t1594)])
  let t1592 = @tactics.match_mp_tac(@nums.num_induction())
  let t1591 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1"))
  let t1588 = @term_syntax.parse_term("(N : Num)")
  let t1590 = @tactics.disch_then((x1589 : @kernel.Thm) => @tactics.x_choose_tac(t1588, x1589))
  let t1584 = @term_syntax.parse_term("(e : Real) / real_of_num(4)")
  let t1587 = @tactics.first_x_assum(fn(x1586 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1582 = @tactics.mp_tac(x1581)
      fn(x1583 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1582(x1583)
      }
    })(((x1585 : @kernel.Thm) => @bool.spec(t1584, x1585))(x1586))
  })
  let t1580 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1579 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t1576 = @drule.match_mp(riemann_lebesgue())
  let t1578 = @tactics.first_assum(fn(x1577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1573 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1574 = @tactics.mp_tac(x1573)
      fn(x1575 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1574(x1575)
      }
    })(t1576(x1577))
  })
  let t1621 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1578), t1579), @tactics.disch_tac), t1580), @tactics.disch_tac), t1587), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1590), t1591), t1592), @tactics.conj_tac), t1595), @tactics.disch_tac), t1602), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1603), t1604), t1605), t1607), t1608), t1609), t1610), t1614), t1615), t1616), t1617), t1618), t1619), t1620), @calc_rat.real_arith_tac)
  riemann_lebesgue_cos_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(-pi, pi)]), (x : Real) => cos(real_of_num(n) * x) * f(x)), real_of_num(0), sequentially)"), t1621))
}

///|
let riemann_lebesgue_cos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIEMANN_LEBESGUE_COS")

///|
/// `RIEMANN_LEBESGUE_COS`
pub fn riemann_lebesgue_cos() -> @kernel.Thm {
  riemann_lebesgue_cos_c.get()
}

///|
/// RIEMANN_LEBESGUE_SIN_HALF
fn step_95() -> Unit raise {
  let t1633 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_imp_integrable(), absolutely_integrable_sin_product(), absolutely_integrable_cos_product()]))
  let t1629 = @tactics.match_mp_tac(riemann_lebesgue_cos())
  let t1630 = @list.List([@tactics.match_mp_tac(riemann_lebesgue_sin()), t1629])
  let t1631 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_null_add()), @tactics.conj_tac), t1630)
  let t1628 = @tactics.match_mp_tac(@realanalysis.real_integral_add())
  let t1627 = @tactics.conv_tac(@equal.sym_conv)
  let t1626 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t1625 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1632 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.always_eventually()), t1625), t1626), t1627), t1628), t1631])
  let t1624 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_integral(real_interval([(-pi, pi)]), (x : Real) => sin(real_of_num(n) * x) * (cos(real_of_num(1) / real_of_num(2) * x) * (f : (Real) -> Real)(x))) + real_integral(real_interval([(-pi, pi)]), (x : Real) => cos(real_of_num(n) * x) * (sin(real_of_num(1) / real_of_num(2) * x) * f(x)))"))
  let t1623 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t1622 = @simp.rewrite_tac(@list.List([@transcendentals.sin_add(), @real.real_add_rdistrib()]))
  let t1634 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1622), t1623), t1624), @tactics.conj_tac), t1632), t1633)
  riemann_lebesgue_sin_half_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(-pi, pi)]), (x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * f(x)), real_of_num(0), sequentially)"), t1634))
}

///|
let riemann_lebesgue_sin_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIEMANN_LEBESGUE_SIN_HALF")

///|
/// `RIEMANN_LEBESGUE_SIN_HALF`
pub fn riemann_lebesgue_sin_half() -> @kernel.Thm {
  riemann_lebesgue_sin_half_c.get()
}

///|
/// FOURIER_SUM_LIMIT_PAIR
fn step_96() -> Unit raise {
  let t1709 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1708 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1707 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1706 = @simp.asm_rewrite_tac(@list.List([]))
  let t1703 = @term_syntax.parse_term("(e : Real)")
  let t1710 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1700 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1701 = @tactics.mp_tac(x1700)
      fn(x1702 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1701(x1702)
      }
    })(((x1704 : @kernel.Thm) => @bool.spec(t1703, x1704))(x1705))
  }), t1706), t1707), @tactics.gen_tac), @tactics.disch_tac), t1708), t1709), @int.asm_arith_tac)
  let t1696 = @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @int.asm_arith_tac)
  let t1695 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t1694 = @tactics.match_mp_tac(@real.sqrt_mono_le())
  let t1693 = @tactics.subst1_tac(@equal.gsym(@real.sqrt_1()))
  let t1692 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(1) <= real_of_num(1) * abs(x)")))
  let t1691 = @simp.rewrite_tac(@list.List([@transcendentals.cos_bound(), @transcendentals.sin_bound()]))
  let t1690 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1689 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1688 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1686 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)"))
  let t1687 = @simp.simp_tac(@list.List([@real.real_le_ldiv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → real_of_num(0) < abs(x)")), @real.sqrt_pos_lt(), t1686, @transcendentals.pi_pos()]))
  let t1685 = @simp.rewrite_tac(@list.List([@arith.add1(), trigonometric_set(), @real.real_abs_div()]))
  let t1684 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t1682 = @term_syntax.parse_term("(r : Num)")
  let t1683 = @tactics.spec_tac(@term_syntax.parse_term("SUC(2 * DIV((n : Num), 2))"), t1682)
  let t1681 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t1680 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1697 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_mul()])), t1680), t1681), t1683), t1684), t1685), t1687), t1688), t1689), t1690), t1691), t1692), t1693), t1694), t1695), @calc_rat.real_arith_tac), t1696])
  let t1679 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) * (y : Real)) <= abs(x) * real_of_num(1) && abs(x) < (e : Real) → abs(x * y) < e")))
  let t1678 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @int.asm_arith_tac), @tactics.all_tac])
  let t1698 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (l : Real)) < (e : Real) / real_of_num(2) && abs((y : Real)) < e / real_of_num(2) → abs(x + y - l) < e"))), @tactics.conj_tac), t1678), t1679), @tactics.conj_tac), t1697)
  let t1677 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1699 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) < (e : Real) / real_of_num(2) → abs(x) < e"))), t1677), @int.asm_arith_tac), t1698])
  let t1676 = @simp.rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @arith.le_0()]))
  let t1674 = @int.arith_rule(@term_syntax.parse_term("(n : Num) == 2 * DIV(n, 2) || n == SUC(2 * DIV(n, 2))"))
  let t1675 = @tactics.disj_cases_then(fn(x1671 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1672 = @tactics.subst1_tac(x1671)
    fn(x1673 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1672(x1673)
    }
  })(t1674)
  let t1670 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1669 = @tactics.exists_tac(@term_syntax.parse_term("(N1 : Num) + (2 * (N2 : Num) + 1)"))
  let t1668 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N2 : Num)"))(fn(x1665 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1666 = ((x1664 : @kernel.Thm) => @tactics.label_tac("2", x1664))(x1665)
    fn(x1667 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1666(x1667)
    }
  }))
  let t1663 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (e : Real) / real_of_num(2)"), fn(x1656 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1656
    @tactics.first_assum(fn(x1662 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1658 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1659 = @tactics.mp_tac(x1658)
        fn(x1660 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1659(x1660)
        }
      })((fn(x1661 : @kernel.Thm) -> @kernel.Thm raise {
        @drule.match_mp(x1661)(th)
      })(x1662))
    })
  })
  let t1655 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N1 : Num)"))(fn(x1652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1653 = ((x1651 : @kernel.Thm) => @tactics.label_tac("1", x1651))(x1652)
    fn(x1654 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1653(x1654)
    }
  }))
  let t1650 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t1646 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1649 = @tactics.disch_then(fn(x1648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1644 = @tactics.mp_tac(x1643)
      fn(x1645 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1644(x1645)
      }
    })(((x1647 : @kernel.Thm) => @bool.spec(t1646, x1647))(x1648))
  })
  let t1642 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially(), @real.real_sub_rzero()]))
  let t1640 = @drule.match_mp(riemann_lebesgue())
  let t1711 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1641 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1637 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1638 = @tactics.mp_tac(x1637)
      fn(x1639 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1638(x1639)
      }
    })(t1640(x1641))
  }), t1642), t1649), t1650), t1655), t1663), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1668), t1669), t1670), @tactics.disch_tac), t1675), t1676), t1699), t1710])
  let t1636 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1635 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t1712 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1635), @tactics.eq_tac), @tactics.disch_tac), t1636), @tactics.disch_tac), t1711)
  fourier_sum_limit_pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : _, ∀ t : Real, ∀ l : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, 2 * n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), l, sequentially) == op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), l, sequentially)"), t1712))
}

///|
let fourier_sum_limit_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_LIMIT_PAIR")

///|
/// `FOURIER_SUM_LIMIT_PAIR`
pub fn fourier_sum_limit_pair() -> @kernel.Thm {
  fourier_sum_limit_pair_c.get()
}

///|
/// FOURIER_SUM_0
fn step_97() -> Unit raise {
  let t1726 = @simp.rewrite_tac(@list.List([trigonometric_set(), @realax.real_div(), @calc_int.real_mul_rzero(), @transcendentals.sin_0(), @calc_int.real_mul_lzero(), @calc_int.real_add_rid()]))
  let t1724 = @simp.rewrite_tac(@list.List([@iterate.sum_pair()]))
  let t1721 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= 2 * DIV((n : Num), 2) + 1 && !(x <= n) → x == 2 * DIV(n, 2) + 1")))
  let t1723 = @tactics.disch_then(fn(x1722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1719 = @tactics.subst1_tac(x1718)
      fn(x1720 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1719(x1720)
      }
    })(t1721(x1722))
  })
  let t1717 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @sets.subset(), @arith.le_0()]))
  let t1716 = @tactics.match_mp_tac(@iterate.sum_superset())
  let t1715 = @tactics.conv_tac(@equal.sym_conv)
  let t1725 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@calc_num.num_reduce_conv), t1715), t1716), t1717), @tactics.conj_tac), @list.List([@int.arith_tac, @tactics.gen_tac])), t1723), t1724])
  let t1714 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(2 * 0, 2 * DIV((n : Num), 2) + 1), (k : Num) => fourier_coefficient((f : (Real) -> Real), k) * trigonometric_set(k, real_of_num(0)))"))
  let t1713 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1727 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1713), t1714), @tactics.conj_tac), t1725), t1726)
  fourier_sum_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, real_of_num(0))) == sum(op_dot_dot(0, DIV(n, 2)), (k : Num) => fourier_coefficient(f, 2 * k) * trigonometric_set(2 * k, real_of_num(0)))"), t1727))
}

///|
let fourier_sum_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_0")

///|
/// `FOURIER_SUM_0`
pub fn fourier_sum_0() -> @kernel.Thm {
  fourier_sum_0_c.get()
}

///|
/// FOURIER_SUM_0_EXPLICIT
fn step_98() -> Unit raise {
  let t1734 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @transcendentals.cos_0(), @realax.real_div(), @realax.real_mul_lid()]))
  let t1733 = @simp.rewrite_tac(@list.List([trigonometric_set(), @int.arith_rule(@term_syntax.parse_term("2 * SUC((i : Num)) == 2 * i + 2"))]))
  let t1732 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1731 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t1735 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.add_clauses()])), t1731), @nums.induct_tac), t1732), t1733), t1734)
  let t1736 = @list.List([@simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @real.sqrt_mul(), @real.real_inv_mul(), @equal.gsym(@realax.real_mul_assoc())])), t1735])
  let t1730 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), trigonometric_set(), @calc_int.real_mul_lzero(), @transcendentals.cos_0(), @realax.real_div()]))
  let t1729 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @arith.le_0(), @realax.real_div(), @real.real_add_rdistrib(), @equal.gsym(@iterate.sum_rmul())]))
  let t1728 = @simp.rewrite_tac(@list.List([fourier_sum_0()]))
  let t1737 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1728), t1729), t1730), @tactics.binop_tac), t1736)
  fourier_sum_0_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, real_of_num(0))) == (fourier_coefficient(f, 0) / sqrt(real_of_num(2)) + sum(op_dot_dot(1, DIV(n, 2)), (k : Num) => fourier_coefficient(f, 2 * k))) / sqrt(pi)"), t1737))
}

///|
let fourier_sum_0_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_0_EXPLICIT")

///|
/// `FOURIER_SUM_0_EXPLICIT`
pub fn fourier_sum_0_explicit() -> @kernel.Thm {
  fourier_sum_0_explicit_c.get()
}

///|
/// FOURIER_SUM_0_INTEGRALS
fn step_99() -> Unit raise {
  let t1759 = @simp.rewrite_tac(@list.List([@transcendentals.pi_pos_le()]))
  let t1758 = @tactics.match_mp_tac(@real.sqrt_pow_2())
  let t1757 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t1756 = @simp.rewrite_tac(@list.List([@arith.add1(), @equal.gsym(@real.real_inv_mul())]))
  let t1755 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(i : Real) * (x : Real) * i == x * (i * i)"))]))
  let t1754 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_lmul(), fourier_products_integrable_strong()]))
  let t1753 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) == b * (a * c)"))]))
  let t1752 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @transcendentals.cos_0(), @realax.real_div(), @realax.real_mul_lid()]))
  let t1751 = @simp.rewrite_tac(@list.List([trigonometric_set(), @int.arith_rule(@term_syntax.parse_term("2 * SUC((i : Num)) == 2 * i + 2"))]))
  let t1750 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1760 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), @nums.induct_tac), t1750), @tactics.strip_tac), t1751), t1752), t1753), t1754), t1755), t1756), @tactics.ap_term_tac), @tactics.ap_term_tac), t1757), t1758), t1759)
  let t1749 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t1748 = @tactics.match_mp_tac(@real.pow_2_sqrt())
  let t1747 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t1746 = @simp.simp_tac(@list.List([@equal.gsym(@real.sqrt_mul()), @realarith.real_pos(), @transcendentals.pi_pos_le(), @realax.real_le_mul()]))
  let t1744 = @equal.gsym(@real.real_inv_mul())
  let t1745 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), t1744]))
  let t1743 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) * (d : Real) == b * (a * (c * d))"))]))
  let t1742 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_lmul(), fourier_products_integrable_strong()]))
  let t1761 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.cos_0(), @calc_int.real_mul_lzero(), @realax.real_div(), @realax.real_mul_lid()])), t1742), t1743), t1745), @tactics.ap_term_tac), @tactics.ap_term_tac), t1746), t1747), t1748), t1749), @calc_rat.real_arith_tac), t1760])
  let t1741 = @simp.rewrite_tac(@list.List([trigonometric_set()]))
  let t1740 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_add_rdistrib(), @equal.gsym(@iterate.sum_rmul())]))
  let t1739 = @simp.rewrite_tac(@list.List([fourier_coefficient(), orthonormal_coefficient(), l2product()]))
  let t1738 = @simp.rewrite_tac(@list.List([fourier_sum_0_explicit()]))
  let t1762 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1738), t1739), t1740), t1741), @tactics.binop_tac), t1761)
  fourier_sum_0_integrals_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, real_of_num(0))) == (real_integral(real_interval([(-pi, pi)]), f) / real_of_num(2) + sum(op_dot_dot(1, DIV(n, 2)), (k : Num) => real_integral(real_interval([(-pi, pi)]), (x : Real) => cos(real_of_num(k) * x) * f(x)))) / pi"), t1762))
}

///|
let fourier_sum_0_integrals_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_0_INTEGRALS")

///|
/// `FOURIER_SUM_0_INTEGRALS`
pub fn fourier_sum_0_integrals() -> @kernel.Thm {
  fourier_sum_0_integrals_c.get()
}

///|
/// FOURIER_SUM_0_INTEGRAL
fn step_100() -> Unit raise {
  let t1767 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @iterate.sum_rmul()]))
  let t1764 = @equal.gsym(@realanalysis.real_integral_rmul())
  let t1765 = @equal.gsym(@realanalysis.real_integral_add())
  let t1766 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realanalysis.real_integral_sum()), @iterate.finite_numseg(), fourier_products_integrable_strong(), @realax.real_div(), t1765, t1764, @realanalysis.real_integrable_rmul(), @class.eta_ax(), @realanalysis.real_integrable_sum()]))
  let t1763 = @simp.asm_simp_tac(@list.List([fourier_sum_0_integrals()]))
  let t1768 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1763), t1766), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t1767), @calc_rat.real_arith_tac)
  fourier_sum_0_integral_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, real_of_num(0))) == real_integral(real_interval([(-pi, pi)]), (x : Real) => (real_of_num(1) / real_of_num(2) + sum(op_dot_dot(1, DIV(n, 2)), (k : Num) => cos(real_of_num(k) * x))) * f(x)) / pi"), t1768))
}

///|
let fourier_sum_0_integral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_0_INTEGRAL")

///|
/// `FOURIER_SUM_0_INTEGRAL`
pub fn fourier_sum_0_integral() -> @kernel.Thm {
  fourier_sum_0_integral_c.get()
}

///|
/// FOURIER_COEFFICIENT_ADD
fn step_101() -> Unit raise {
  let t1769 = @simp.simp_tac(@list.List([trigonometric_set_mul_integrable(), @realax.real_add_ldistrib(), @realanalysis.real_integral_add()]))
  let t1770 = @tactics.then_tac(@simp.simp_tac(@list.List([fourier_coefficient(), orthonormal_coefficient(), l2product()])), t1769)
  fourier_coefficient_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ i : Num, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && absolutely_real_integrable_on(g, real_interval([(-pi, pi)])) → fourier_coefficient((x : Real) => f(x) + g(x), i) == fourier_coefficient(f, i) + fourier_coefficient(g, i)"), t1770))
}

///|
let fourier_coefficient_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_COEFFICIENT_ADD")

///|
/// `FOURIER_COEFFICIENT_ADD`
pub fn fourier_coefficient_add() -> @kernel.Thm {
  fourier_coefficient_add_c.get()
}

///|
/// FOURIER_COEFFICIENT_SUB
fn step_102() -> Unit raise {
  let t1771 = @simp.simp_tac(@list.List([trigonometric_set_mul_integrable(), @real.real_sub_ldistrib(), @realanalysis.real_integral_sub()]))
  let t1772 = @tactics.then_tac(@simp.simp_tac(@list.List([fourier_coefficient(), orthonormal_coefficient(), l2product()])), t1771)
  fourier_coefficient_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ i : Num, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && absolutely_real_integrable_on(g, real_interval([(-pi, pi)])) → fourier_coefficient((x : Real) => f(x) - g(x), i) == fourier_coefficient(f, i) - fourier_coefficient(g, i)"), t1772))
}

///|
let fourier_coefficient_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_COEFFICIENT_SUB")

///|
/// `FOURIER_COEFFICIENT_SUB`
pub fn fourier_coefficient_sub() -> @kernel.Thm {
  fourier_coefficient_sub_c.get()
}

///|
/// FOURIER_COEFFICIENT_CONST
fn step_103() -> Unit raise {
  let t1816 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq(), @realanalysis.real_integral_unique(), @calc_int.real_mul_lzero()]))
  let t1815 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc()), @calc_int.real_mul_lzero()]))
  let t1812 = @drule.match_mp(@realanalysis.has_real_integral_rmul())
  let t1809 = @term_syntax.parse_term("inv(sqrt(pi)) * (c : Real)")
  let t1814 = @tactics.disch_then(fn(x1813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1806 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1807 = @tactics.mp_tac(x1806)
        fn(x1808 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1807(x1808)
        }
      })(((x1810 : @kernel.Thm) => @bool.spec(t1809, x1810))(x1811))
    })(t1812(x1813))
  })
  let t1805 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(n : Num) + 1"), has_real_integral_cos_nx()))
  let t1817 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t1805), t1814), t1815), t1816)
  let t1804 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq(), @realanalysis.real_integral_unique()]))
  let t1803 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc()), @calc_int.real_mul_lzero()]))
  let t1800 = @drule.match_mp(@realanalysis.has_real_integral_rmul())
  let t1797 = @term_syntax.parse_term("inv(sqrt(pi)) * (c : Real)")
  let t1802 = @tactics.disch_then(fn(x1801 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1799 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1795 = @tactics.mp_tac(x1794)
        fn(x1796 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1795(x1796)
        }
      })(((x1798 : @kernel.Thm) => @bool.spec(t1797, x1798))(x1799))
    })(t1800(x1801))
  })
  let t1793 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(n : Num) + 1"), has_real_integral_sin_nx()))
  let t1818 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t1793), t1802), t1803), t1804)
  let t1792 = @simp.simp_tac(@list.List([@real.sqrt_pow_2(), @real.real_lt_mul(), @realax.real_le_mul(), @realarith.real_pos(), @real.real_of_num_lt(), @calc_num.arith(), @real.sqrt_pos_lt(), @transcendentals.pi_pos(), @realarith.real_lt_imp_le()]))
  let t1791 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (s : Real) && pow(s, 2) == real_of_num(2) * pi → real_of_num(2) * (pi * (inv(s) * (c : Real))) == c * s")))
  let t1788 = @drule.match_mp(@realanalysis.real_integral_unique())
  let t1790 = @tactics.disch_then(fn(x1789 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1785 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1786 = @tactics.subst1_tac(x1785)
      fn(x1787 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1786(x1787)
      }
    })(t1788(x1789))
  })
  let t1784 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t1781 = @drule.match_mp(@realanalysis.has_real_integral_rmul())
  let t1778 = @term_syntax.parse_term("inv(sqrt(real_of_num(2) * pi)) * (c : Real)")
  let t1783 = @tactics.disch_then(fn(x1782 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1780 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1775 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1776 = @tactics.mp_tac(x1775)
        fn(x1777 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1776(x1777)
        }
      })(((x1779 : @kernel.Thm) => @bool.spec(t1778, x1779))(x1780))
    })(t1781(x1782))
  })
  let t1819 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("0"), has_real_integral_cos_nx())), t1783), t1784), t1790), t1791), t1792), t1818, t1817])
  let t1774 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1773 = @simp.rewrite_tac(@list.List([fourier_coefficient(), orthonormal_coefficient(), l2product(), trigonometric_set()]))
  let t1820 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(odd_even_induct_lemma())), t1773), t1774), t1819)
  fourier_coefficient_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ i : Num, fourier_coefficient((x : Real) => c, i) == (if i == 0 { c * sqrt(real_of_num(2) * pi) } else { real_of_num(0) })"), t1820))
}

///|
let fourier_coefficient_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_COEFFICIENT_CONST")

///|
/// `FOURIER_COEFFICIENT_CONST`
pub fn fourier_coefficient_const() -> @kernel.Thm {
  fourier_coefficient_const_c.get()
}

///|
/// REAL_PERIODIC_INTEGER_MULTIPLE
fn step_104() -> Unit raise {
  let t1830 = @meson.asm_meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + -real_of_num((n : Num)) * (a : Real) + real_of_num(n) * a == x"))]))
  let t1829 = @simp.asm_rewrite_tac(@list.List([]))
  let t1828 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1831 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@floor.integer_cases()])), t1828), t1829), t1830)
  let t1827 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), @real.real_add_rdistrib(), @realax.real_add_assoc(), @realax.real_mul_lid()]))
  let t1826 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_add_rid()]))
  let t1832 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t1826), t1827), t1831])
  let t1825 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, (f : (Real) -> Real)(x + real_of_num(n) * (a : Real)) == f(x)"), fn(x1822 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1823 = @tactics.assume_tac(x1822)
    fn(x1824 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1823(x1824)
    }
  })
  let t1821 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@floor.integer_closed(), @realax.real_mul_lid()]))])
  let t1833 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t1821), @tactics.disch_tac), t1825), t1832)
  real_periodic_integer_multiple_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ a : Real, (∀ x : Real, f(x + a) == f(x)) == (∀ x : Real, ∀ n : Real, integer(n) → f(x + n * a) == f(x))"), t1833))
}

///|
let real_periodic_integer_multiple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_PERIODIC_INTEGER_MULTIPLE")

///|
/// `REAL_PERIODIC_INTEGER_MULTIPLE`
pub fn real_periodic_integer_multiple() -> @kernel.Thm {
  real_periodic_integer_multiple_c.get()
}

///|
/// HAS_REAL_INTEGRAL_OFFSET
fn step_105() -> Unit raise {
  let t1848 = @simp.rewrite_tac(@list.List([@misc.in_real_interval(), @theorems.exists_refl(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (c : Real) == (y : Real)) == (x == y + c)"))]))
  let t1847 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t1846 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1845 = @simp.rewrite_tac(@list.List([@real.real_abs_1(), @realax.real_mul_lid(), @real.real_inv_1()]))
  let t1844 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq(), @calc_num.arith_eq(), @realax.real_mul_lid(), @real.real_inv_1()]))
  let t1841 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_affinity()))
  let t1837 = @term_syntax.parse_term("(c : Real)")
  let t1838 = @list.List([@term_syntax.parse_term("real_of_num(1)"), t1837])
  let t1843 = @tactics.disch_then(fn(x1842 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1835 = @tactics.mp_tac(x1834)
        fn(x1836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1835(x1836)
        }
      })(((x1839 : @kernel.Thm) => @bool.specl(t1838, x1839))(x1840))
    })(t1841(x1842))
  })
  let t1849 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1843), t1844), t1845), t1846), @tactics.ap_term_tac), t1847), t1848), @calc_rat.real_arith_tac)
  has_real_integral_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ i : Real, ∀ a : Real, ∀ b : Real, ∀ c : Real, has_real_integral(f, i, real_interval([(a, b)])) → has_real_integral((x : Real) => f(x + c), i, real_interval([(a - c, b - c)]))"), t1849))
}

///|
let has_real_integral_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_OFFSET")

///|
/// `HAS_REAL_INTEGRAL_OFFSET`
pub fn has_real_integral_offset() -> @kernel.Thm {
  has_real_integral_offset_c.get()
}

///|
/// HAS_REAL_INTEGRAL_PERIODIC_OFFSET_LEMMA
fn step_106() -> Unit raise {
  let t1874 = @tactics.disch_then(fn(x1873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1871 = @tactics.subst1_tac(x1870)
      fn(x1872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1871(x1872)
      }
    })(@equal.sym(x1873))
  })
  let t1869 = @simp.rewrite_tac(@list.List([]))
  let t1865 = @term_syntax.parse_term("(x : Real) + ((a : Real) - (b : Real))")
  let t1868 = @tactics.first_x_assum(fn(x1867 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1863 = @tactics.mp_tac(x1862)
      fn(x1864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1863(x1864)
      }
    })(((x1866 : @kernel.Thm) => @bool.spec(t1865, x1866))(x1867))
  })
  let t1861 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1860 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_eq()))
  let t1859 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (a - (b : Real)) == b && a + (c : Real) - (a - b) == b + c"))]))
  let t1856 = @drule.match_mp(has_real_integral_offset())
  let t1853 = @term_syntax.parse_term("(a : Real) - (b : Real)")
  let t1858 = @tactics.first_x_assum(fn(x1857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1855 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1851 = @tactics.mp_tac(x1850)
        fn(x1852 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1851(x1852)
        }
      })(((x1854 : @kernel.Thm) => @bool.spec(t1853, x1854))(x1855))
    })(t1856(x1857))
  })
  let t1875 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1858), t1859), t1860), t1861), @tactics.disch_tac), t1868), t1869), t1874), @tactics.ap_term_tac), @calc_rat.real_arith_tac)
  has_real_integral_periodic_offset_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ i : Real, ∀ a : Real, ∀ b : Real, ∀ c : Real, (∀ x : Real, f(x + (b - a)) == f(x)) && has_real_integral(f, i, real_interval([(a, a + c)])) → has_real_integral(f, i, real_interval([(b, b + c)]))"), t1875))
}

///|
let has_real_integral_periodic_offset_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_PERIODIC_OFFSET_LEMMA")

///|
/// `HAS_REAL_INTEGRAL_PERIODIC_OFFSET_LEMMA`
pub fn has_real_integral_periodic_offset_lemma() -> @kernel.Thm {
  has_real_integral_periodic_offset_lemma_c.get()
}

///|
/// HAS_REAL_INTEGRAL_PERIODIC_OFFSET_POS
fn step_107() -> Unit raise {
  let t1879 = @list.List([@meson.asm_meson_tac(@list.List([@realanalysis.real_integrable_on()])), @calc_rat.asm_real_arith_tac])
  let t1878 = @simp.asm_rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t1877 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([((a : Real), (b : Real))])"))
  let t1876 = @tactics.match_mp_tac(@realanalysis.real_integrable_on_subinterval())
  let tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.has_real_integral_integral())])), t1876), t1877), t1878), @tactics.conj_tac), t1879)
  let t1900 = @meson.asm_meson_tac(@list.List([@realanalysis.has_real_integral_unique(), @realax.real_add_sym()]))
  let t1899 = @tactics.repeat_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_tac])))
  let t1897 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) → (e : Bool)) == (c && d → a && b → e)"))]))(@realanalysis.has_real_integral_combine()))
  let t1901 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then(fn(x1898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1894 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1895 = @tactics.mp_tac(x1894)
      fn(x1896 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1895(x1896)
      }
    })(t1897(x1898))
  })), t1899), t1900)
  let t1893 = @simp.asm_rewrite_tac(@list.List([]))
  let t1892 = @tactics.exists_tac(@term_syntax.parse_term("(a : Real)"))
  let t1891 = @tactics.match_mp_tac(has_real_integral_periodic_offset_lemma())
  let t1890 = @tactics.try_tac(tac)
  let t1902 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t1890), t1891), t1892), t1893), tac), t1901])
  let t1889 = @tactics.subgoal_then(@term_syntax.parse_term("(has_real_integral((f : (Real) -> Real), real_integral(real_interval([((a : Real), a + (c : Real))]), f), real_interval([(a, a + c)])) && has_real_integral(f, real_integral(real_interval([(a + c, (b : Real))]), f), real_interval([(a + c, b)]))) && has_real_integral(f, real_integral(real_interval([(a + c, b)]), f), real_interval([(a + c, b)])) && has_real_integral(f, real_integral(real_interval([(a, a + c)]), f), real_interval([(b, b + c)]))"), fn(x1886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1887 = @tactics.mp_tac(x1886)
    fn(x1888 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1887(x1888)
    }
  })
  let t1885 = @tactics.match_mp_tac(has_real_integral_offset())
  let t1883 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == a + (c : Real) - c && (b : Real) == b + c - c"))
  let t1884 = @tactics.conjuncts_then(fn(x1880 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1881 = @tactics.subst1_tac(x1880)
    fn(x1882 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1881(x1882)
    }
  })(t1883)
  let t1903 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1884), t1885), t1889), t1902)
  has_real_integral_periodic_offset_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ i : Real, ∀ a : Real, ∀ b : Real, ∀ c : Real, (∀ x : Real, f(x + (b - a)) == f(x)) && real_of_num(0) <= c && a + c <= b && has_real_integral(f, i, real_interval([(a, b)])) → has_real_integral((x : Real) => f(x + c), i, real_interval([(a, b)]))"), t1903))
}

///|
let has_real_integral_periodic_offset_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_PERIODIC_OFFSET_POS")

///|
/// `HAS_REAL_INTEGRAL_PERIODIC_OFFSET_POS`
pub fn has_real_integral_periodic_offset_pos() -> @kernel.Thm {
  has_real_integral_periodic_offset_pos_c.get()
}

///|
/// HAS_REAL_INTEGRAL_PERIODIC_OFFSET_WEAK
fn step_108() -> Unit raise {
  let t1926 = @tactics.disch_then(fn(x1925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1922 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1923 = @tactics.subst1_tac(x1922)
      fn(x1924 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1923(x1924)
      }
    })(@equal.sym(x1925))
  })
  let t1921 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(-(a : Real) - -(b : Real)) == a - b"))]))
  let t1917 = @term_syntax.parse_term("-(x : Real) + ((a : Real) - (b : Real))")
  let t1920 = @tactics.first_x_assum(fn(x1919 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1914 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1915 = @tactics.mp_tac(x1914)
      fn(x1916 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1915(x1916)
      }
    })(((x1918 : @kernel.Thm) => @bool.spec(t1917, x1918))(x1919))
  })
  let t1913 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1912 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1911 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg()]))
  let t1910 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_neg_add(), @realanalysis.has_real_integral_reflect()]))
  let t1906 = @term_syntax.parse_term("-(c : Real)")
  let t1907 = @term_syntax.parse_term("-(a : Real)")
  let t1908 = @term_syntax.parse_term("-(b : Real)")
  let t1909 = @term_syntax.parse_term("(i : Real)")
  let t1927 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => (f : (Real) -> Real)(-x)"), t1909, t1908, t1907, t1906]), has_real_integral_periodic_offset_pos())), t1910), t1911), t1912), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t1913), t1920), t1921), t1926), @tactics.ap_term_tac), @calc_rat.real_arith_tac)
  let t1905 = @simp.asm_rewrite_tac(@list.List([]))
  let t1928 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(has_real_integral_periodic_offset_pos()), t1905), @calc_rat.asm_real_arith_tac), t1927])
  let t1904 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (c : Real)"))
  let t1929 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1904), t1928)
  has_real_integral_periodic_offset_weak_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ i : Real, ∀ a : Real, ∀ b : Real, ∀ c : Real, (∀ x : Real, f(x + (b - a)) == f(x)) && abs(c) <= b - a && has_real_integral(f, i, real_interval([(a, b)])) → has_real_integral((x : Real) => f(x + c), i, real_interval([(a, b)]))"), t1929))
}

///|
let has_real_integral_periodic_offset_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_PERIODIC_OFFSET_WEAK")

///|
/// `HAS_REAL_INTEGRAL_PERIODIC_OFFSET_WEAK`
pub fn has_real_integral_periodic_offset_weak() -> @kernel.Thm {
  has_real_integral_periodic_offset_weak_c.get()
}

///|
/// HAS_REAL_INTEGRAL_PERIODIC_OFFSET
fn step_109() -> Unit raise {
  let t1945 = @simp.simp_tac(@list.List([@floor.integer_closed(), @floor.floor()]))
  let t1944 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1943 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([real_periodic_integer_multiple()])))
  let t1942 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("(a : Real) < (b : Real) → (x : Real) + (b - a) * ((c : Real) / (b - a) - (f : Real)) == x + c + -f * (b - a)"))]))
  let t1941 = @simp.rewrite_tac(@list.List([@floor.frac_floor()]))
  let t1940 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1946 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_eq())), t1940), @tactics.strip_tac), t1941), t1942), t1943), t1944), t1945)
  let t1939 = @simp.asm_rewrite_tac(@list.List([@realax.real_abs(), @floor.floor_frac()]))
  let t1938 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_lt(), @real.real_lt_lmul_eq()]))
  let t1937 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) && (b - a) * (f : Real) < (b - a) * real_of_num(1) → abs(b - a) * f <= b - a")))
  let t1936 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t1947 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(has_real_integral_periodic_offset_weak()), t1936), t1937), t1938), t1939), t1946])
  let t1935 = @tactics.subgoal_then(@term_syntax.parse_term("has_real_integral((x : Real) => (f : (Real) -> Real)(x + ((b : Real) - (a : Real)) * frac((c : Real) / (b - a))), (i : Real), real_interval([(a, b)]))"), fn(x1932 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1933 = @tactics.mp_tac(x1932)
    fn(x1934 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1933(x1934)
    }
  })
  let t1931 = @simp.asm_simp_tac(@list.List([@realanalysis.has_real_integral_null_eq()]))
  let t1930 = @tactics.disj_cases_tac(@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) <= (a : Real) || a < b")))
  let t1948 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1930), t1931), @tactics.strip_tac), t1935), t1947)
  has_real_integral_periodic_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ i : Real, ∀ a : Real, ∀ b : Real, ∀ c : Real, (∀ x : Real, f(x + (b - a)) == f(x)) && has_real_integral(f, i, real_interval([(a, b)])) → has_real_integral((x : Real) => f(x + c), i, real_interval([(a, b)]))"), t1948))
}

///|
let has_real_integral_periodic_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_PERIODIC_OFFSET")

///|
/// `HAS_REAL_INTEGRAL_PERIODIC_OFFSET`
pub fn has_real_integral_periodic_offset() -> @kernel.Thm {
  has_real_integral_periodic_offset_c.get()
}

///|
/// REAL_INTEGRABLE_PERIODIC_OFFSET
fn step_110() -> Unit raise {
  let t1949 = @meson.meson_tac(@list.List([has_real_integral_periodic_offset()]))
  let t1950 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.real_integrable_on()])), t1949)
  real_integrable_periodic_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ a : Real, ∀ b : Real, ∀ c : Real, (∀ x : Real, f(x + (b - a)) == f(x)) && real_integrable_on(f, real_interval([(a, b)])) → real_integrable_on((x : Real) => f(x + c), real_interval([(a, b)]))"), t1950))
}

///|
let real_integrable_periodic_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRABLE_PERIODIC_OFFSET")

///|
/// `REAL_INTEGRABLE_PERIODIC_OFFSET`
pub fn real_integrable_periodic_offset() -> @kernel.Thm {
  real_integrable_periodic_offset_c.get()
}

///|
/// ABSOLUTELY_REAL_INTEGRABLE_PERIODIC_OFFSET
fn step_111() -> Unit raise {
  let t1955 = @simp.asm_rewrite_tac(@list.List([]))
  let t1954 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1952 = @bool.spec_all(real_integrable_periodic_offset())
  let t1953 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(f : (Real) -> Real)"), t1952))
  let t1951 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1956 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_on()])), t1951), t1953), t1954), t1955)
  absolutely_real_integrable_periodic_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ a : Real, ∀ b : Real, ∀ c : Real, (∀ x : Real, f(x + (b - a)) == f(x)) && absolutely_real_integrable_on(f, real_interval([(a, b)])) → absolutely_real_integrable_on((x : Real) => f(x + c), real_interval([(a, b)]))"), t1956))
}

///|
let absolutely_real_integrable_periodic_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_REAL_INTEGRABLE_PERIODIC_OFFSET")

///|
/// `ABSOLUTELY_REAL_INTEGRABLE_PERIODIC_OFFSET`
pub fn absolutely_real_integrable_periodic_offset() -> @kernel.Thm {
  absolutely_real_integrable_periodic_offset_c.get()
}

///|
/// REAL_INTEGRAL_PERIODIC_OFFSET
fn step_112() -> Unit raise {
  let t1959 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realanalysis.has_real_integral_integral())]))
  let t1958 = @tactics.match_mp_tac(has_real_integral_periodic_offset())
  let t1957 = @tactics.match_mp_tac(@realanalysis.real_integral_unique())
  let t1960 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1957), t1958), t1959)
  real_integral_periodic_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ a : Real, ∀ b : Real, ∀ c : Real, (∀ x : Real, f(x + (b - a)) == f(x)) && real_integrable_on(f, real_interval([(a, b)])) → real_integral(real_interval([(a, b)]), (x : Real) => f(x + c)) == real_integral(real_interval([(a, b)]), f)"), t1960))
}

///|
let real_integral_periodic_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRAL_PERIODIC_OFFSET")

///|
/// `REAL_INTEGRAL_PERIODIC_OFFSET`
pub fn real_integral_periodic_offset() -> @kernel.Thm {
  real_integral_periodic_offset_c.get()
}

///|
/// FOURIER_OFFSET_TERM
fn step_113() -> Unit raise {
  let t2044 = @simp.asm_rewrite_tac(@list.List([]))
  let t2043 = @tactics.match_mp_tac(@realanalysis.has_real_integral_lmul())
  let t2042 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t2041 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) == a * (c * b)"))]))
  let t2040 = @tactics.match_mp_tac(@realanalysis.real_integral_unique())
  let t2045 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (t : Real) - t == x"))])), @tactics.disch_tac), t2040), t2041), t2042), t2043), t2044)
  let t2039 = @simp.rewrite_tac(@list.List([@real.real_pow_one(), @real.real_sub_rzero(), @realax.real_mul_lid()]))
  let t2038 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @calc_int.real_mul_lzero(), @arith.even_mult(), @calc_num.arith()]))
  let t2037 = @simp.rewrite_tac(@list.List([@transcendentals.cos_add(), @transcendentals.sin_npi(), @transcendentals.cos_npi(), @realax.real_of_num_mul()]))
  let t2046 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) * ((x : Real) + real_of_num(2) * pi - (t : Real)) == real_of_num(2) * n * pi + n * (x - t)"))])), t2037), t2038), t2039), t2045])
  let t2036 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2034 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integral()])), @tactics.disch_tac)
  let t2031 = @simp.rewrite_tac(@list.List([@transcendentals.cos_bound()]))
  let t2030 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t2032 = @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image()])), t2030), t2031)
  let t2029 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2028 = @simp.rewrite_tac(@list.List([trigonometric_set(), @realax.real_div()]))
  let t2027 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t2025 = @term_syntax.parse_term("(n : Num)")
  let t2026 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t2025)
  let t2024 = @simp.rewrite_tac(@list.List([@class.eta_ax(), @sets.in_univ(), @realanalysis.real_differentiable_on_differentiable()]))
  let t2023 = @tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on())
  let t2022 = @tactics.match_mp_tac(@realanalysis.continuous_imp_real_measurable_on())
  let t2021 = @simp.rewrite_tac(@list.List([@realanalysis.real_measurable_real_interval(), @sets.subset_univ()]))
  let t2020 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Real) -> Bool)"))
  let t2033 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_measurable_subset()), t2020), t2021), t2022), t2023), t2024), t2026), t2027), t2028), t2029), @realanalysis.real_differentiable_tac), t2032])
  let t2019 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t2035 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable()), t2019), @tactics.conj_tac), t2033), t2034])
  let t2018 = @tactics.subgoal_then(@term_syntax.parse_term("real_integrable_on((x : Real) => cos(real_of_num((n : Num) + 1) * (x - (t : Real))) * (f : (Real) -> Real)(x), real_interval([(-pi, pi)]))"), fn(x2015 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2016 = @tactics.mp_tac(x2015)
    fn(x2017 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2016(x2017)
    }
  })
  let t2014 = @simp.rewrite_tac(@list.List([]))
  let t2009 = @term_syntax.parse_term("(t : Real)")
  let t2010 = @term_syntax.parse_term("pi")
  let t2011 = @term_syntax.parse_term("-pi")
  let t2012 = @term_syntax.parse_term("real_integral(real_interval([(-pi, pi)]), (x : Real) => cos(real_of_num((n : Num) + 1) * (x - (t : Real))) * (f : (Real) -> Real)(x))")
  let t2013 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => cos(real_of_num((n : Num) + 1) * (x - (t : Real))) * (f : (Real) -> Real)(x)"), t2012, t2011, t2010, t2009]), has_real_integral_periodic_offset()))
  let t2008 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((cm : Real) - (cp : Real)) / real_of_num(2) * (f : Real) + (cm + cp) / real_of_num(2) * f == cm * f"))]))
  let t2007 = @tactics.disch_then(fn(x2006 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2003 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2004 = @tactics.subst1_tac(x2003)
      fn(x2005 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2004(x2005)
      }
    })(@equal.sym(x2006))
  })
  let t1999 = @simp.rewrite_tac(@list.List([@transcendentals.sin_bound(), @transcendentals.cos_bound(), @calc_int.real_abs_neg()]))
  let t1998 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((y : Real)) <= real_of_num(1) → abs((x + y) / real_of_num(2)) <= real_of_num(1)")))
  let t1997 = @simp.rewrite_tac(@list.List([@realax.real_sub()]))
  let t1996 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1995 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t2000 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image()])), t1995), t1996), t1997), t1998), t1999)
  let t1994 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1993 = @simp.rewrite_tac(@list.List([trigonometric_set(), @realax.real_div()]))
  let t1992 = @tactics.match_mp_tac(odd_even_induct_lemma())
  let t1990 = @term_syntax.parse_term("(n : Num)")
  let t1991 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1990)
  let t1989 = @simp.rewrite_tac(@list.List([@class.eta_ax(), @sets.in_univ(), @realanalysis.real_differentiable_on_differentiable()]))
  let t1988 = @tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on())
  let t1987 = @tactics.match_mp_tac(@realanalysis.continuous_imp_real_measurable_on())
  let t1986 = @simp.rewrite_tac(@list.List([@realanalysis.real_measurable_real_interval(), @sets.subset_univ()]))
  let t1985 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Real) -> Bool)"))
  let t2001 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_measurable_subset()), t1985), t1986), t1987), t1988), t1989), t1991), t1992), t1993), t1994), @realanalysis.real_differentiable_tac), t2000]))
  let t1984 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t2002 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable())), t1984), t2001), @tactics.all_tac])
  let t1983 = @simp.rewrite_tac(@list.List([]))
  let t1976 = @drule.part_match(fn(x1975 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x1975))
  }, @realanalysis.real_integral_add())
  let t1970 = @equal.gsym(@realax.real_add_ldistrib())
  let t1971 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sub_ldistrib()), t1970]))
  let t1969 = @simp.rewrite_tac(@list.List([@transcendentals.real_mul_sin_sin(), @transcendentals.real_mul_cos_cos()]))
  let t1968 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == a * c * b"))]))
  let t1966 = @equal.gsym(@realax.real_mul_assoc())
  let t1967 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_lmul(), @equal.gsym(@realanalysis.real_integral_rmul()), fourier_products_integrable_strong(), t1966]))
  let t1965 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) == b * (a * c)"))]))
  let t1964 = @simp.rewrite_tac(@list.List([l2product()]))
  let t1963 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @transcendentals.cos_0(), @realarith.real_mul_rid()]))
  let t1962 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc(), @equal.gsym(@real.real_add_rdistrib())]))
  let t1961 = @simp.rewrite_tac(@list.List([trigonometric_set(), fourier_coefficient(), orthonormal_coefficient()]))
  let t2047 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1961), t1962), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1963), t1964), t1965), t1967), t1968), t1969), t1971), fn(x1982 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1981 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1979 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1978 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1977 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x1972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s1973 = @tactics.mp_tac(x1972)
              fn(x1974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s1973(x1974)
              }
            })(t1976(x1977))
          })(@kernel.rand(x1978))
        })(@kernel.rand(x1979))
      })((fn(x1980 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1980.1
      })(x1981))
    })(x1982)(x1982)
  }), t1983), @tactics.ants_tac), t2002), t2007), t2008), t2013), t2014), t2018), t2035), t2036), @tactics.ants_tac), t2046)
  fourier_offset_term_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → fourier_coefficient((x : Real) => f(x + t), 2 * n + 2) * trigonometric_set(2 * n + 2, real_of_num(0)) == fourier_coefficient(f, 2 * n + 1) * trigonometric_set(2 * n + 1, t) + fourier_coefficient(f, 2 * n + 2) * trigonometric_set(2 * n + 2, t)"), t2047))
}

///|
let fourier_offset_term_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_OFFSET_TERM")

///|
/// `FOURIER_OFFSET_TERM`
pub fn fourier_offset_term() -> @kernel.Thm {
  fourier_offset_term_c.get()
}

///|
/// FOURIER_SUM_OFFSET
fn step_114() -> Unit raise {
  let t2067 = @simp.rewrite_tac(@list.List([trigonometric_set(), @calc_int.real_mul_rzero(), @transcendentals.cos_0(), @transcendentals.sin_0()]))
  let t2066 = @simp.asm_simp_tac(@list.List([@equal.gsym(fourier_offset_term())]))
  let t2065 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) + 1 + 1 == k + 2"))]))
  let t2064 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t2063 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t2062 = @simp.rewrite_tac(@list.List([@iterate.sum_offset(), @iterate.sum_pair()]))
  let t2061 = @list.List([@tactics.then_tac(@tactics.binop_tac, @int.asm_arith_tac), @tactics.all_tac])
  let t2060 = @tactics.subgoal_then(@term_syntax.parse_term("op_dot_dot(1, 2 * (n : Num)) == op_dot_dot(2 * 0 + 1, 2 * (n - 1) + 1 + 1)"), fn(x2057 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2058 = @tactics.subst1_tac(x2057)
    fn(x2059 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2058(x2059)
    }
  })
  let t2056 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @iterate.sum_clauses_numseg(), @calc_num.arith_eq()]))
  let t2055 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2053 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi")), @realanalysis.real_integrable_lmul(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t2049 = @term_syntax.parse_term("(t : Real)")
  let t2050 = @term_syntax.parse_term("pi")
  let t2051 = @term_syntax.parse_term("-pi")
  let t2052 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real) => real_of_num(1) / sqrt(real_of_num(2) * pi) * (f : (Real) -> Real)(x)"), t2051, t2050, t2049]), real_integral_periodic_offset()))
  let t2054 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([fourier_coefficient(), trigonometric_set(), l2product(), orthonormal_coefficient(), @calc_int.real_mul_lzero(), @transcendentals.cos_0()])), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2052), t2053), @tactics.all_tac])
  let t2048 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @arith.le_0(), @arith.add_clauses()]))
  let t2068 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2048), @tactics.binop_tac), t2054), t2055), t2056), t2060), t2061), t2062), t2063), t2064), @tactics.strip_tac), t2065), t2066), t2067), @calc_rat.real_arith_tac)
  fourier_sum_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → sum(op_dot_dot(0, 2 * n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)) == sum(op_dot_dot(0, 2 * n), (k : Num) => fourier_coefficient((x : Real) => f(x + t), k) * trigonometric_set(k, real_of_num(0)))"), t2068))
}

///|
let fourier_sum_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_OFFSET")

///|
/// `FOURIER_SUM_OFFSET`
pub fn fourier_sum_offset() -> @kernel.Thm {
  fourier_sum_offset_c.get()
}

///|
/// FOURIER_SUM_OFFSET_UNPAIRED
fn step_115() -> Unit raise {
  let t2078 = @simp.rewrite_tac(@list.List([@transcendentals.sin_0(), @calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid()]))
  let t2077 = @simp.rewrite_tac(@list.List([@arith.add1(), trigonometric_set(), @realax.real_div(), @calc_int.real_mul_rzero()]))
  let t2074 = @simp.rewrite_tac(@list.List([@real.real_eq_add_lcancel_0()]))
  let t2075 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), @tactics.gen_tac), @tactics.disch_tac), t2074)
  let t2073 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.mult_clauses(), @iterate.sum_clauses_numseg(), @arith.le_0()]))
  let t2076 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_pair())])), t2073), t2075])
  let t2072 = @simp.rewrite_tac(@list.List([]))
  let t2071 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(0, (n : Num)), (k : Num) => fourier_coefficient((x : Real) => (f : (Real) -> Real)(x + (t : Real)), 2 * k) * trigonometric_set(2 * k, real_of_num(0)) + fourier_coefficient((x : Real) => f(x + t), 2 * k + 1) * trigonometric_set(2 * k + 1, real_of_num(0)))"))
  let t2070 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2069 = @simp.asm_simp_tac(@list.List([fourier_sum_offset()]))
  let t2079 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2069), t2070), t2071), t2072), @tactics.conj_tac), t2076), t2077), t2078)
  fourier_sum_offset_unpaired_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → sum(op_dot_dot(0, 2 * n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)) == sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient((x : Real) => f(x + t), 2 * k) * trigonometric_set(2 * k, real_of_num(0)))"), t2079))
}

///|
let fourier_sum_offset_unpaired_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_OFFSET_UNPAIRED")

///|
/// `FOURIER_SUM_OFFSET_UNPAIRED`
pub fn fourier_sum_offset_unpaired() -> @kernel.Thm {
  fourier_sum_offset_unpaired_c.get()
}

///|
/// dirichlet_kernel
fn step_116() -> Unit raise {
  dirichlet_kernel_c.set(@pair.new_definition(@term_syntax.parse_term("(dirichlet_kernel : (Num, Real) -> Real)((n : Num), (x : Real)) == (if x == real_of_num(0) { real_of_num(n) + real_of_num(1) / real_of_num(2) } else { sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) / (real_of_num(2) * sin(x / real_of_num(2))) })")))
}

///|
let dirichlet_kernel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dirichlet_kernel")

///|
/// `dirichlet_kernel`
pub fn dirichlet_kernel() -> @kernel.Thm {
  dirichlet_kernel_c.get()
}

///|
/// DIRICHLET_KERNEL_0
fn step_117() -> Unit raise {
  let t2088 = @tactics.match_mp_tac(@transcendentals.sin_eq_0_pi())
  let t2089 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([])), t2088)])
  let t2087 = @tactics.subgoal_then(@term_syntax.parse_term("!((x : Real) * inv(real_of_num(2)) == real_of_num(0))"), fn(x2084 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2085 = @tactics.mp_tac(x2084)
    fn(x2086 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2085(x2086)
    }
  })
  let t2083 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) → inv(real_of_num(2) * x) * x == inv(real_of_num(2))")))
  let t2082 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @realax.real_mul_sym(), @realarith.real_mul_rid()]))
  let t2081 = @simp.asm_rewrite_tac(@list.List([@realax.real_add_lid()]))
  let t2080 = @simp.rewrite_tac(@list.List([dirichlet_kernel()]))
  let t2090 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2080), @class.cond_cases_tac), t2081), t2082), t2083), @tactics.disch_tac), t2087), t2089), @calc_rat.asm_real_arith_tac)
  dirichlet_kernel_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, abs(x) < real_of_num(2) * pi → dirichlet_kernel(0, x) == real_of_num(1) / real_of_num(2)"), t2090))
}

///|
let dirichlet_kernel_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_KERNEL_0")

///|
/// `DIRICHLET_KERNEL_0`
pub fn dirichlet_kernel_0() -> @kernel.Thm {
  dirichlet_kernel_0_c.get()
}

///|
/// DIRICHLET_KERNEL_NEG
fn step_118() -> Unit raise {
  let t2092 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rneg(), @calc_int.real_mul_lneg(), @realax.real_div(), @transcendentals.sin_neg(), @real.real_inv_neg(), @calc_int.real_neg_neg()]))
  let t2091 = @simp.rewrite_tac(@list.List([dirichlet_kernel(), @real.real_neg_eq_0()]))
  let t2093 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2091), @class.cond_cases_tac), t2092)
  dirichlet_kernel_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ x : Real, dirichlet_kernel(n, -x) == dirichlet_kernel(n, x)"), t2093))
}

///|
let dirichlet_kernel_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_KERNEL_NEG")

///|
/// `DIRICHLET_KERNEL_NEG`
pub fn dirichlet_kernel_neg() -> @kernel.Thm {
  dirichlet_kernel_neg_c.get()
}

///|
/// DIRICHLET_KERNEL_CONTINUOUS_STRONG
fn step_119() -> Unit raise {
  let t2101 = @meson.asm_meson_tac(@list.List([]))
  let t2100 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_atreal()]))
  let t2097 = @drule.match_mp(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t2099 = @tactics.first_x_assum(fn(x2098 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2094 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2095 = @tactics.mp_tac(x2094)
      fn(x2096 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2095(x2096)
      }
    })(t2097(x2098))
  })
  let t2102 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2099), t2100), t2101)
  let lemma = @tactics.prove(@term_syntax.parse_term("real_differentiable((f : (Real) -> Real), atreal((a : Real))) && f(a) == (b : Real) → op_minus_minus_minus_gt(f, b, atreal(a))"), t2102)
  let t2159 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @realax.real_div(), @transcendentals.cos_0(), @realarith.real_mul_rid()]))
  let t2158 = @tactics.match_mp_tac(lemma)
  let t2157 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t2156 = @tactics.match_mp_tac(@realanalysis.reallim_div())
  let t2155 = @simp.gen_rewrite_tac(fn(x2154 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2148 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2149 = @equal.rator_conv(x2148)
      fn(x2150 : @kernel.Term) -> @kernel.Thm raise {
        s2149(x2150)
      }
    })((fn(x2151 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2152 = @equal.rand_conv(x2151)
      fn(x2153 : @kernel.Term) -> @kernel.Thm raise {
        s2152(x2153)
      }
    })(x2154))
  }, @list.List([@equal.gsym(@real.real_div_1())]))
  let t2147 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t2160 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc()])), t2147), t2155), t2156), t2157), @tactics.conj_tac), t2158), t2159), @realanalysis.real_differentiable_tac)
  let t2146 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @realax.real_div(), @transcendentals.sin_0()]))
  let t2161 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lemma), t2146), @realanalysis.real_differentiable_tac)
  let t2145 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @transcendentals.sin_0()]))
  let t2162 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lemma), t2145), @realanalysis.real_differentiable_tac)
  let t2144 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t2163 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2139
    let t2143 = @tactics.match_mp_tac(@transcendentals.cos_pos_pi())
    let t2142 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
    let t2141 = @simp.rewrite_tac(@list.List([]))
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(th), t2141), t2142), t2143)
  }), t2144), @calc_rat.asm_real_arith_tac)
  let t2164 = @tactics.then_tac(@realanalysis.real_diff_tac, @calc_rat.real_arith_tac)
  let t2165 = @list.List([@tactics.then_tac(@realanalysis.real_diff_tac, @calc_rat.real_arith_tac), t2164, t2163, t2162, t2161, t2160])
  let t2138 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2137 = @simp.rewrite_tac(@list.List([@real.real_lt_01(), @real.real_sub_rzero()]))
  let t2134 = @term_syntax.parse_term("real_of_num(1)")
  let t2135 = @term_syntax.parse_term("(x : Real) => cos(x / real_of_num(2))")
  let t2136 = @tactics.map_every(fn(x2131 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2132 = @tactics.exists_tac(x2131)
    fn(x2133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2132(x2133)
    }
  }, @list.List([@term_syntax.parse_term("(x : Real) => (real_of_num((k : Num)) + real_of_num(1) / real_of_num(2)) * cos((real_of_num(k) + real_of_num(1) / real_of_num(2)) * x)"), t2135, t2134]))
  let t2130 = @tactics.match_mp_tac(@realanalysis.lhospital())
  let t2128 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t2127 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t2129 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@realanalysis.eventually_atreal(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < abs((x : Real) - real_of_num(0))) == !(x == real_of_num(0))"))])), t2127), t2128), @tactics.all_tac])
  let t2126 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => sin((real_of_num((k : Num)) + real_of_num(1) / real_of_num(2)) * x) / (real_of_num(2) * sin(x / real_of_num(2)))"))
  let t2125 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t2124 = @simp.asm_rewrite_tac(@list.List([@realanalysis.real_continuous_atreal()]))
  let t2120 = @tactics.exists_tac(@term_syntax.parse_term("abs((x : Real))"))
  let t2119 = @simp.rewrite_tac(@list.List([@realanalysis.eventually_atreal()]))
  let t2118 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.reallim_transform_eventually()))
  let t2121 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@realanalysis.real_continuous_atreal()])), t2118), t2119), t2120), @calc_rat.asm_real_arith_tac)
  let t2115 = @simp.asm_rewrite_tac(@list.List([@realanalysis.netlimit_atreal()]))
  let t2116 = @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) / real_of_num(2)"), @transcendentals.sin_eq_0_pi())), t2115), @calc_rat.asm_real_arith_tac)
  let t2117 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())), @realanalysis.real_differentiable_tac), t2116])
  let t2114 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t2122 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_div()), t2114), @tactics.conj_tac), t2117), t2121])
  let t2123 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_continuous((x : Real) => sin((real_of_num((k : Num)) + real_of_num(1) / real_of_num(2)) * x) / (real_of_num(2) * sin(x / real_of_num(2))), atreal((x : Real)))"), fn(x2111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2112 = @tactics.mp_tac(x2111)
    fn(x2113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2112(x2113)
    }
  }), t2122)])
  let t2110 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t2109 = @simp.rewrite_tac(@list.List([dirichlet_kernel()]))
  let t2108 = @simp.gen_rewrite_tac(fn(x2105 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2106 = @equal.land_conv(x2105)
    fn(x2107 : @kernel.Term) -> @kernel.Thm raise {
      s2106(x2107)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t2103 = @term_syntax.parse_term("(x : Real)")
  let t2104 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : Num)"), t2103]))
  let t2166 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@metric.real_open_real_interval(), @misc.in_real_interval(), @realanalysis.real_continuous_on_eq_real_continuous_at()])), t2104), @tactics.strip_tac), t2108), t2109), t2110), t2123), t2124), t2125), t2126), @tactics.conj_tac), t2129), t2130), t2136), t2137), t2138), t2165)
  dirichlet_kernel_continuous_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, real_continuous_on(dirichlet_kernel(n), real_interval((-(real_of_num(2) * pi), real_of_num(2) * pi)))"), t2166))
}

///|
let dirichlet_kernel_continuous_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_KERNEL_CONTINUOUS_STRONG")

///|
/// `DIRICHLET_KERNEL_CONTINUOUS_STRONG`
pub fn dirichlet_kernel_continuous_strong() -> @kernel.Thm {
  dirichlet_kernel_continuous_strong_c.get()
}

///|
/// DIRICHLET_KERNEL_CONTINUOUS
fn step_120() -> Unit raise {
  let t2170 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t2169 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t2168 = @simp.rewrite_tac(@list.List([dirichlet_kernel_continuous_strong()]))
  let t2167 = @tactics.exists_tac(@term_syntax.parse_term("real_interval((-(real_of_num(2) * pi), real_of_num(2) * pi))"))
  let t2171 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@realanalysis.real_continuous_on_subset())), t2167), t2168), t2169), t2170), @calc_rat.real_arith_tac)
  dirichlet_kernel_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, real_continuous_on(dirichlet_kernel(n), real_interval([(-pi, pi)]))"), t2171))
}

///|
let dirichlet_kernel_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_KERNEL_CONTINUOUS")

///|
/// `DIRICHLET_KERNEL_CONTINUOUS`
pub fn dirichlet_kernel_continuous() -> @kernel.Thm {
  dirichlet_kernel_continuous_c.get()
}

///|
/// ABSOLUTELY_REAL_INTEGRABLE_MUL_DIRICHLET_KERNEL
fn step_121() -> Unit raise {
  let t2176 = @simp.asm_rewrite_tac(@list.List([dirichlet_kernel_continuous(), @class.eta_ax(), @metric.real_compact_interval()]))
  let t2175 = @tactics.match_mp_tac(@realanalysis.real_compact_continuous_image())
  let t2177 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.real_compact_imp_bounded()), t2175), t2176)
  let t2174 = @simp.asm_rewrite_tac(@list.List([dirichlet_kernel_continuous(), @class.eta_ax(), @metric.real_closed_real_interval()]))
  let t2178 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_imp_real_measurable_on_closed_subset()), t2174), t2177])
  let t2173 = @simp.asm_rewrite_tac(@list.List([]))
  let t2172 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t2179 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2172), t2173), @tactics.conj_tac), t2178)
  absolutely_real_integrable_mul_dirichlet_kernel_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * f(x), real_interval([(-pi, pi)]))"), t2179))
}

///|
let absolutely_real_integrable_mul_dirichlet_kernel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_REAL_INTEGRABLE_MUL_DIRICHLET_KERNEL")

///|
/// `ABSOLUTELY_REAL_INTEGRABLE_MUL_DIRICHLET_KERNEL`
pub fn absolutely_real_integrable_mul_dirichlet_kernel() -> @kernel.Thm {
  absolutely_real_integrable_mul_dirichlet_kernel_c.get()
}

///|
/// COSINE_SUM_LEMMA
fn step_122() -> Unit raise {
  let t2192 = @simp.rewrite_tac(@list.List([@real.real_add_rdistrib()]))
  let t2191 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num((n : Num)) + real_of_num(1)) * (x : Real) - x / real_of_num(2) == (real_of_num(n) + real_of_num(1) / real_of_num(2)) * x"))]))
  let t2190 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) * (x : Real) - x / real_of_num(2) == x / real_of_num(2)"))]))
  let t2188 = @equal.gsym(@realax.real_div())
  let t2189 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t2188]))
  let t2187 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2186 = @tactics.subgoal_then(@term_syntax.parse_term("∀ k : Num, ∀ x : Real, real_of_num(k) * x + x * inv(real_of_num(2)) == real_of_num(k + 1) * x - x * inv(real_of_num(2))"), fn(x2184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2184
    @simp.rewrite_tac(@list.List([th, @iterate.sum_diffs_alt()]))
  })
  let t2183 = @simp.rewrite_tac(@list.List([@transcendentals.real_mul_cos_sin(), @realax.real_div(), @real.real_sub_rdistrib()]))
  let t2182 = @simp.rewrite_tac(@list.List([@real.real_add_rdistrib(), @equal.gsym(@iterate.sum_rmul())]))
  let t2193 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2182), t2183), t2186), t2187), t2189), t2190), t2191), t2192), @calc_rat.real_arith_tac)
  let t2181 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @calc_int.real_add_rid(), @realax.real_mul_sym()]))
  let t2194 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@realax.real_add_lid(), @iterate.sum_clauses_numseg(), @calc_num.arith()])), t2181), t2193])
  let t2180 = @tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) == 0 || 1 <= n")))
  let t2195 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2180), t2194)
  cosine_sum_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ x : Real, (real_of_num(1) / real_of_num(2) + sum(op_dot_dot(1, n), (k : Num) => cos(real_of_num(k) * x))) * sin(x / real_of_num(2)) == sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) / real_of_num(2)"), t2195))
}

///|
let cosine_sum_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COSINE_SUM_LEMMA")

///|
/// `COSINE_SUM_LEMMA`
pub fn cosine_sum_lemma() -> @kernel.Thm {
  cosine_sum_lemma_c.get()
}

///|
/// DIRICHLET_KERNEL_COSINE_SUM
fn step_123() -> Unit raise {
  let t2199 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) / real_of_num(2)"), @transcendentals.sin_eq_0_pi()))
  let t2198 = @simp.rewrite_tac(@list.List([cosine_sum_lemma()]))
  let t2197 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((y : Real) == real_of_num(0)) && (z : Real) * y == (x : Real) / real_of_num(2) → x / (real_of_num(2) * y) == z")))
  let t2196 = @simp.asm_rewrite_tac(@list.List([dirichlet_kernel()]))
  let t2200 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2196), t2197), t2198), t2199), @calc_rat.asm_real_arith_tac)
  dirichlet_kernel_cosine_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ x : Real, !(x == real_of_num(0)) && abs(x) < real_of_num(2) * pi → dirichlet_kernel(n, x) == real_of_num(1) / real_of_num(2) + sum(op_dot_dot(1, n), (k : Num) => cos(real_of_num(k) * x))"), t2200))
}

///|
let dirichlet_kernel_cosine_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_KERNEL_COSINE_SUM")

///|
/// `DIRICHLET_KERNEL_COSINE_SUM`
pub fn dirichlet_kernel_cosine_sum() -> @kernel.Thm {
  dirichlet_kernel_cosine_sum_c.get()
}

///|
/// HAS_REAL_INTEGRAL_DIRICHLET_KERNEL
fn step_124() -> Unit raise {
  let t2225 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t2224 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(k : Num)"), has_real_integral_cos_nx()))
  let t2223 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t2222 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t2226 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.has_real_integral_sum()), t2222), t2223), @tactics.strip_tac), t2224), t2225)
  let t2221 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t2220 = @tactics.match_mp_tac(@realanalysis.has_real_integral_const())
  let t2227 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2217 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2218 = @equal.land_conv(x2217)
    fn(x2219 : @kernel.Term) -> @kernel.Thm raise {
      s2218(x2219)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi == real_of_num(1) / real_of_num(2) * (pi - -pi)"))])), t2220), t2221), @calc_rat.real_arith_tac), t2226])
  let t2216 = @tactics.match_mp_tac(@realanalysis.has_real_integral_add())
  let t2215 = @tactics.disch_then(fn(x2210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2210
    @simp.gen_rewrite_tac(fn(x2212 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2213 = @equal.land_conv(x2212)
      fn(x2214 : @kernel.Term) -> @kernel.Thm raise {
        s2213(x2214)
      }
    }, @list.List([th]))
  })
  let t2209 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_0()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2208 = @tactics.subgoal_then(@term_syntax.parse_term("pi == pi + sum(op_dot_dot(1, (n : Num)), (k : Num) => real_of_num(0))"), fn(x2205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2206 = @tactics.mp_tac(x2205)
    fn(x2207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2206(x2207)
    }
  })
  let t2204 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < pi && -pi <= (x : Real) && x <= pi → abs(x) < real_of_num(2) * pi")), dirichlet_kernel_cosine_sum(), @transcendentals.pi_pos()]))
  let t2203 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing(), @sets.in_diff(), @sets.in_sing(), @misc.in_real_interval()]))
  let t2202 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t2201 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => real_of_num(1) / real_of_num(2) + sum(op_dot_dot(1, (n : Num)), (k : Num) => cos(real_of_num(k) * x))"))
  let t2228 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@realanalysis.has_real_integral_spike())), t2201), t2202), t2203), t2204), t2208), t2209), t2215), t2216), @tactics.conj_tac), t2227)
  has_real_integral_dirichlet_kernel_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, has_real_integral(dirichlet_kernel(n), pi, real_interval([(-pi, pi)]))"), t2228))
}

///|
let has_real_integral_dirichlet_kernel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_DIRICHLET_KERNEL")

///|
/// `HAS_REAL_INTEGRAL_DIRICHLET_KERNEL`
pub fn has_real_integral_dirichlet_kernel() -> @kernel.Thm {
  has_real_integral_dirichlet_kernel_c.get()
}

///|
/// HAS_REAL_INTEGRAL_DIRICHLET_KERNEL_HALF
fn step_125() -> Unit raise {
  let t2263 = @simp.rewrite_tac(@list.List([has_real_integral_dirichlet_kernel()]))
  let t2262 = @tactics.match_mp_tac(@realanalysis.real_integral_unique())
  let t2261 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == pi → x == real_of_num(2) * (y : Real) → y == pi / real_of_num(2)")))
  let t2258 = @drule.match_mp(@realanalysis.real_integral_unique())
  let t2260 = @tactics.disch_then(fn(x2259 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2256 = @tactics.mp_tac(x2255)
      fn(x2257 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2256(x2257)
      }
    })(t2258(x2259))
  })
  let t2254 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2253 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_mul_2())]))
  let t2247 = @term_syntax.parse_term("real_of_num(0)")
  let t2248 = @term_syntax.parse_term("pi")
  let t2249 = @term_syntax.parse_term("-pi")
  let t2250 = @term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), pi)]), dirichlet_kernel((n : Num)))")
  let t2251 = @term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), pi)]), dirichlet_kernel((n : Num)))")
  let t2252 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("dirichlet_kernel((n : Num))"), t2251, t2250, t2249, t2248, t2247]), @realanalysis.has_real_integral_combine()))
  let t2246 = @list.List([@meson.asm_meson_tac(@list.List([@realanalysis.real_integrable_on()])), @tactics.all_tac])
  let t2245 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t2244 = @simp.rewrite_tac(@list.List([dirichlet_kernel_neg(), @class.eta_ax(), @calc_int.real_neg_0()]))
  let t2241 = @simp.gen_rewrite_rule(fn(x2240 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2240
  }, @list.List([@equal.gsym(@realanalysis.has_real_integral_reflect())]))
  let t2243 = @tactics.first_assum(fn(x2242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2238 = @tactics.mp_tac(x2237)
      fn(x2239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2238(x2239)
      }
    })(t2241(x2242))
  })
  let t2235 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integral()])), @tactics.disch_tac)
  let t2233 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t2234 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval()])), t2233), @calc_rat.real_arith_tac)
  let t2236 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@meson.meson_tac(@list.List([has_real_integral_dirichlet_kernel(), @realanalysis.real_integrable_on()])), t2234])), t2235])
  let t2229 = @term_syntax.parse_term("pi")
  let t2230 = @term_syntax.parse_term("real_of_num(0)")
  let t2231 = @term_syntax.parse_term("pi")
  let t2232 = @term_syntax.parse_term("-pi")
  let t2264 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("dirichlet_kernel((n : Num))"), t2232, t2231, t2230, t2229]), @realanalysis.real_integrable_subinterval()))), @tactics.ants_tac), t2236), t2243), t2244), @tactics.disch_tac), t2245), @tactics.conj_tac), t2246), t2252), t2253), @tactics.ants_tac), t2254), t2260), t2261), t2262), t2263)
  has_real_integral_dirichlet_kernel_half_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, has_real_integral(dirichlet_kernel(n), pi / real_of_num(2), real_interval([(real_of_num(0), pi)]))"), t2264))
}

///|
let has_real_integral_dirichlet_kernel_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_DIRICHLET_KERNEL_HALF")

///|
/// `HAS_REAL_INTEGRAL_DIRICHLET_KERNEL_HALF`
pub fn has_real_integral_dirichlet_kernel_half() -> @kernel.Thm {
  has_real_integral_dirichlet_kernel_half_c.get()
}

///|
/// FOURIER_SUM_OFFSET_DIRICHLET_KERNEL
fn step_126() -> Unit raise {
  let t2313 = @simp.simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @transcendentals.pi_pos_le()]))
  let t2312 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t2311 = @tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("(s : Real) * s == (p : Real) → p * ((f : Real) * (c : Real)) == c * s * (f * s)")))
  let t2310 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t2309 = @simp.asm_simp_tac(@list.List([trigonometric_set_even(), @arith.le_1()]))
  let t2308 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t2314 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t2308), @tactics.strip_tac), t2309), t2310), t2311), t2312), @tactics.ap_term_tac), t2313)
  let t2305 = @simp.rewrite_tac(@list.List([cosine_sum_lemma()]))
  let t2304 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((y : Real) == real_of_num(0)) → ((x : Real) / (real_of_num(2) * y) == (z : Real)) == (z * y == x / real_of_num(2))"))]))
  let t2303 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t2302 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (b : Bool) && !(d : Bool) && (!(c : Bool) → (e : Bool)) → (a && b && c → d) → e")))
  let t2306 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) / real_of_num(2)"), @transcendentals.sin_eq_0_pi())), t2302), t2303), t2304), t2305)
  let t2307 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @transcendentals.cos_0(), @iterate.sum_const_numseg(), @arith.add_sub()])), @calc_rat.real_arith_tac), t2306])
  let t2301 = @simp.asm_rewrite_tac(@list.List([dirichlet_kernel()]))
  let t2300 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t2299 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - real_of_num(1) / real_of_num(2) == (y : Real)) == (x == real_of_num(1) / real_of_num(2) + y)"))]))
  let t2315 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_lmul()])), @tactics.ap_term_tac), @tactics.ap_term_tac), t2299), t2300), t2301), t2307), t2314])
  let t2298 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (n : Num)), (k : Num) => inv(pi) * ((f : (Real) -> Real)((x : Real) + (t : Real)) * cos(real_of_num(k) * x)))"))
  let t2297 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2296 = @simp.rewrite_tac(@list.List([@real.real_inv_mul(), @calc_rat.real_arith(@term_syntax.parse_term("((d : Real) * ((f : Real) * (i : Real)) == real_of_num(1) * f * (inv(real_of_num(2)) * i) + (y : Real)) == (i * (f * (d - real_of_num(1) / real_of_num(2))) == y)"))]))
  let t2295 = @simp.simp_tac(@list.List([@real.real_pow_inv(), @real.sqrt_pow_2(), @realax.real_le_mul(), @realarith.real_pos(), @transcendentals.pi_pos_le(), @real.real_le_inv_eq()]))
  let t2294 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @transcendentals.cos_0(), @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * b)) == a * c * pow(b, 2)"))]))
  let t2293 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t2292 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2291 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_empty(), @sets.diff_empty()]))
  let t2290 = @tactics.exists_tac(@term_syntax.parse_term("({} : (Real) -> Bool)"))
  let t2289 = @tactics.match_mp_tac(@realanalysis.real_integral_spike())
  let t2284 = @equal.gsym(@realanalysis.real_integral_sum())
  let t2285 = @equal.gsym(@realanalysis.real_integral_add())
  let t2286 = @equal.gsym(@realanalysis.real_integral_rmul())
  let t2287 = @list.List([@equal.gsym(@realax.real_mul_assoc()), t2286, t2285, absolutely_integrable_cos_product(), absolutely_integrable_sin_product(), @realanalysis.absolutely_real_integrable_lmul(), trigonometric_set_mul_absolutely_integrable(), @realanalysis.absolutely_real_integrable_imp_integrable(), t2284, @iterate.finite_numseg(), @realanalysis.absolutely_real_integrable_rmul(), @realanalysis.absolutely_real_integrable_sum(), absolutely_real_integrable_mul_dirichlet_kernel()])
  let t2281 = @simp.basic_ss(@list.List([]))
  let t2288 = @tactics.asm_tac(fn(x2283 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2278 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2279 = @tactics.conv_tac(x2278)
      fn(x2280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2279(x2280)
      }
    })(((x2282 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t2281, 5, x2282))(x2283))
  })(t2287)
  let t2277 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2273 = @term_syntax.parse_term("(t : Real)")
  let t2274 = @term_syntax.parse_term("pi")
  let t2275 = @term_syntax.parse_term("-pi")
  let t2276 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2275, t2274, t2273]), absolutely_real_integrable_periodic_offset()))
  let t2272 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), fourier_coefficient(), orthonormal_coefficient(), trigonometric_set(), l2product()]))
  let t2270 = @simp.simp_tac(@list.List([trigonometric_set_even(), @arith.le_1(), @calc_int.real_mul_rzero(), @transcendentals.cos_0()]))
  let t2271 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.match_mp_tac(@iterate.sum_eq_numseg())), t2270), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2269 = @tactics.exists_tac(@term_syntax.parse_term("fourier_coefficient((x : Real) => (f : (Real) -> Real)(x + (t : Real)), 0) * (real_of_num(1) / sqrt(real_of_num(2) * pi)) + sum(op_dot_dot(1, (n : Num)), (k : Num) => fourier_coefficient((x : Real) => f(x + t), 2 * k) / sqrt(pi))"))
  let t2268 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2267 = @simp.rewrite_tac(@list.List([trigonometric_set(), @transcendentals.cos_0(), @calc_int.real_mul_lzero()]))
  let t2266 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @arith.le_0(), @calc_num.arith()]))
  let t2265 = @simp.asm_simp_tac(@list.List([fourier_sum_offset_unpaired()]))
  let t2316 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2265), t2266), t2267), t2268), t2269), @tactics.conj_tac), t2271), t2272), t2276), t2277), @tactics.disch_tac), t2288), t2289), t2290), t2291), t2292), t2293), @tactics.strip_tac), t2294), t2295), t2296), t2297), t2298), @tactics.conj_tac), t2315)
  fourier_sum_offset_dirichlet_kernel_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → sum(op_dot_dot(0, 2 * n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)) == real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * f(x + t)) / pi"), t2316))
}

///|
let fourier_sum_offset_dirichlet_kernel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_OFFSET_DIRICHLET_KERNEL")

///|
/// `FOURIER_SUM_OFFSET_DIRICHLET_KERNEL`
pub fn fourier_sum_offset_dirichlet_kernel() -> @kernel.Thm {
  fourier_sum_offset_dirichlet_kernel_c.get()
}

///|
/// FOURIER_SUM_LIMIT_DIRICHLET_KERNEL
fn step_127() -> Unit raise {
  let t2332 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t2331 = @simp.simp_tac(@list.List([@realax.real_div(), @realanalysis.reallim_rmul_eq(), @transcendentals.pi_nz(), @real.real_inv_eq_0()]))
  let t2329 = @tactics.conv_tac(@calc_rat.real_field)
  let t2330 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), t2329), @tactics.all_tac])
  let t2328 = @tactics.subgoal_then(@term_syntax.parse_term("(l : Real) == l * pi / pi"), fn(x2319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2319
    @simp.gen_rewrite_tac(fn(x2327 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2321 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2322 = @equal.land_conv(x2321)
        fn(x2323 : @kernel.Term) -> @kernel.Thm raise {
          s2322(x2323)
        }
      })((fn(x2324 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2325 = @equal.once_depth_conv(x2324)
        fn(x2326 : @kernel.Term) -> @kernel.Thm raise {
          s2325(x2326)
        }
      })(x2327))
    }, @list.List([th]))
  })
  let t2318 = @simp.asm_simp_tac(@list.List([fourier_sum_offset_dirichlet_kernel()]))
  let t2317 = @simp.asm_simp_tac(@list.List([@equal.gsym(fourier_sum_limit_pair())]))
  let t2333 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2317), t2318), t2328), t2330), t2331), t2332)
  fourier_sum_limit_dirichlet_kernel_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ t : Real, ∀ l : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), l, sequentially) == op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * f(x + t)), pi * l, sequentially)"), t2333))
}

///|
let fourier_sum_limit_dirichlet_kernel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_LIMIT_DIRICHLET_KERNEL")

///|
/// `FOURIER_SUM_LIMIT_DIRICHLET_KERNEL`
pub fn fourier_sum_limit_dirichlet_kernel() -> @kernel.Thm {
  fourier_sum_limit_dirichlet_kernel_c.get()
}

///|
/// SIMPLE_FOURIER_CONVERGENCE_PERIODIC
fn step_128() -> Unit raise {
  let t2378 = @simp.asm_rewrite_tac(@list.List([]))
  let t2377 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_lmul())
  let t2376 = @tactics.match_mp_tac(riemann_lebesgue_sin_half())
  let t2375 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero()]))
  let t2373 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_mul_ac()]))
  let t2372 = @simp.asm_rewrite_tac(@list.List([dirichlet_kernel()]))
  let t2371 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2370 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_sing(), @misc.in_real_interval()]))
  let t2369 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing()]))
  let t2368 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t2374 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@realanalysis.real_integral_spike())), t2368), t2369), t2370), t2371), t2372), t2373), @tactics.all_tac])
  let t2367 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * ((f : (Real) -> Real)(x + (t : Real)) - f(t))) == real_integral(real_interval([(-pi, pi)]), (x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * (inv(real_of_num(2)) * ((f(x + t) - f(t)) / sin(x / real_of_num(2)))))"), fn(x2365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2365
    @simp.rewrite_tac(@list.List([th]))
  })
  let t2364 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_const()]))
  let t2363 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2359 = @term_syntax.parse_term("(t : Real)")
  let t2360 = @term_syntax.parse_term("pi")
  let t2361 = @term_syntax.parse_term("-pi")
  let t2362 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2361, t2360, t2359]), absolutely_real_integrable_periodic_offset()))
  let t2357 = @term_syntax.parse_term("real_of_num(0)")
  let t2358 = @term_syntax.parse_term("(t : Real)")
  let t2379 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => (f : (Real) -> Real)(x) - f((t : Real))"), t2358, t2357]), fourier_sum_limit_dirichlet_kernel())), t2362), t2363), @tactics.disch_tac), t2364), t2367), t2374), t2375), t2376), t2377), t2378)
  let t2354 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t2353 = @tactics.match_mp_tac(@real.sqrt_pos_lt())
  let t2352 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (s : Real) → (f : Real) * s * (real_of_num(1) / s) == f")))
  let t2355 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([trigonometric_set(), @calc_int.real_mul_lzero(), @transcendentals.cos_0()])), t2352), t2353), t2354), @calc_rat.real_arith_tac)
  let t2351 = @simp.simp_tac(@list.List([@arith.le_1(), @calc_num.arith(), @real.real_sub_rzero()]))
  let t2356 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t2351), t2355])
  let t2350 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) == (u : Real) && (ft : Real) * (t : Real) == (x : Real) → ((f0 : Real) - ft) * t + s == f0 * t + u - x")))
  let t2349 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @arith.le_0()]))
  let t2348 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2347 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t2346 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t2345 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.reallim_transform_eventually()))
  let t2380 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([fourier_coefficient_sub(), fourier_coefficient_const(), @realanalysis.absolutely_real_integrable_const()])), t2345), t2346), t2347), t2348), @tactics.disch_tac), t2349), t2350), @tactics.conj_tac), t2356), t2379])
  let t2344 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (c : Bool)) && (b : Bool) → a == b → c")))
  let t2343 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_const()]))
  let t2342 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2338 = @term_syntax.parse_term("(t : Real)")
  let t2339 = @term_syntax.parse_term("pi")
  let t2340 = @term_syntax.parse_term("-pi")
  let t2341 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2340, t2339, t2338]), absolutely_real_integrable_periodic_offset()))
  let t2335 = @term_syntax.parse_term("real_of_num(0)")
  let t2336 = @term_syntax.parse_term("(t : Real)")
  let t2337 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => (f : (Real) -> Real)(x) - f((t : Real))"), t2336, t2335]), fourier_sum_limit_dirichlet_kernel()))
  let t2334 = @simp.once_rewrite_tac(@list.List([@realanalysis.reallim_null()]))
  let t2381 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2334), t2337), t2341), t2342), @tactics.disch_tac), t2343), t2344), @tactics.conj_tac), t2380)
  simple_fourier_convergence_periodic_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && absolutely_real_integrable_on((x : Real) => (f(x + t) - f(t)) / sin(x / real_of_num(2)), real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), f(t), sequentially)"), t2381))
}

///|
let simple_fourier_convergence_periodic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIMPLE_FOURIER_CONVERGENCE_PERIODIC")

///|
/// `SIMPLE_FOURIER_CONVERGENCE_PERIODIC`
pub fn simple_fourier_convergence_periodic() -> @kernel.Thm {
  simple_fourier_convergence_periodic_c.get()
}

///|
/// REAL_SIN_X2_ZEROS
fn step_129() -> Unit raise {
  let t2385 = @meson.meson_tac(@list.List([@sets.in_()]))
  let t2384 = @simp.rewrite_tac(@list.List([@transcendentals.pi_nz(), @calc_rat.real_ring(@term_syntax.parse_term("(real_of_num(2) * (pi * (m : Real)) == real_of_num(2) * (pi * (n : Real))) == (pi == real_of_num(0) || m == n)"))]))
  let t2383 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @transcendentals.sin_eq_0(), @calc_rat.real_arith(@term_syntax.parse_term("((y : Real) / real_of_num(2) == (n : Real) * pi) == (real_of_num(2) * (pi * n) == y)"))]))
  let t2382 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t2386 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t2382), t2383), t2384), t2385)
  real_sin_x2_zeros_c.set(@tactics.prove(@term_syntax.parse_term("{(x : Real) | sin(x / real_of_num(2)) == real_of_num(0)} == IMAGE((n : Real) => real_of_num(2) * (pi * n), integer)"), t2386))
}

///|
let real_sin_x2_zeros_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SIN_X2_ZEROS")

///|
/// `REAL_SIN_X2_ZEROS`
pub fn real_sin_x2_zeros() -> @kernel.Thm {
  real_sin_x2_zeros_c.get()
}

///|
/// HOELDER_FOURIER_CONVERGENCE_PERIODIC
fn step_130() -> Unit raise {
  let t2550 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2549 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t2548 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t2547 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t2546 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_abs_mul()]))
  let t2545 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t2551 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (a : Real) → x <= max(a, (b : Real))"))), t2545), t2546), t2547), t2548), t2549), t2550), @calc_rat.asm_real_arith_tac)
  let t2544 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t2552 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (b : Real) → x <= max((a : Real), b)"))), t2544), t2551])
  let t2543 = @class.asm_cases_tac(@term_syntax.parse_term("abs((x : Real)) < (e : Real)"))
  let t2553 = @tactics.thenl(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@misc.in_real_interval()]))), t2543), t2552)
  let t2542 = @simp.simp_tac(@list.List([@misc.in_real_interval(), @realax.real_abs()]))
  let t2539 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realanalysis.real_integrable_eq()))
  let t2541 = @tactics.first_x_assum(fn(x2540 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2539(x2540))
  })
  let t2537 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_neg(), @calc_int.real_neg_neg(), @calc_int.real_neg_0()]))
  let t2538 = @list.List([@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_integrable_reflect())])), t2537), @tactics.all_tac])
  let t2536 = @simp.rewrite_tac(@list.List([@real.real_neg_le0(), @transcendentals.pi_pos_le()]))
  let t2535 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t2534 = @tactics.match_mp_tac(@realanalysis.real_integrable_combine())
  let t2533 = @simp.simp_tac(@list.List([@transcendentals.rpow_pos_le(), @real.real_abs_pos()]))
  let t2532 = @tactics.match_mp_tac(@realanalysis.nonnegative_absolutely_real_integrable())
  let t2528 = @drule.match_mp(@realanalysis.has_real_integral_integrable())
  let t2530 = @tactics.disch_then(fn(x2529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2525 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2526 = @tactics.assume_tac(x2525)
      fn(x2527 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2526(x2527)
      }
    })(t2528(x2529))
  })
  let t2523 = @tactics.conv_tac(@calc_rat.real_field)
  let t2521 = @term_syntax.parse_term("real_of_num(0) < (x : Real)")
  let t2522 = @tactics.map_every(fn(x2518 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2519 = @tactics.undisch_tac(x2518)
    fn(x2520 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2519(x2520)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0) < (a : Real)"), t2521]))
  let t2517 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2524 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), t2517), @realanalysis.real_diff_tac), t2522), t2523)
  let t2516 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_rpow())
  let t2531 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_on_lmul()), t2516), @calc_rat.asm_real_arith_tac), t2524])), t2530])
  let t2515 = @simp.rewrite_tac(@list.List([@transcendentals.pi_pos_le()]))
  let t2511 = @term_syntax.parse_term("pi")
  let t2512 = @term_syntax.parse_term("real_of_num(0)")
  let t2513 = @term_syntax.parse_term("(x : Real) => rpow(x, (a : Real) - real_of_num(1))")
  let t2514 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => inv((a : Real)) * rpow(x, a)"), t2513, t2512, t2511]), @realanalysis.real_fundamental_theorem_of_calculus_interior()))
  let t2510 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_lmul())
  let t2509 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_lmul(), @realanalysis.absolutely_real_integrable_abs(), @realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_const()]))
  let t2508 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_max())
  let t2554 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable()), t2508), t2509), t2510), t2514), t2515), @tactics.ants_tac), t2531), t2532), t2533), t2534), t2535), t2536), @tactics.conj_tac), t2538), t2541), t2542)
  let t2504 = @simp.rewrite_tac(@list.List([@misc.countable_integer()]))
  let t2503 = @tactics.match_mp_tac(@card.countable_image())
  let t2502 = @tactics.match_mp_tac(@realanalysis.real_negligible_countable())
  let t2505 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([real_sin_x2_zeros()])), t2502), t2503), t2504)
  let t2501 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t2500 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t2499 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2498 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t2506 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.continuous_imp_real_measurable_on()), t2498), t2499), t2500), t2501), @realanalysis.real_differentiable_tac)
  let t2497 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_const()]))
  let t2496 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable())
  let t2507 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.integrable_imp_real_measurable()), t2496), t2497), t2506, t2505])
  let t2495 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2555 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_div()), t2495), t2507), t2554, t2553])
  let t2494 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2493 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2489 = @term_syntax.parse_term("(t : Real)")
  let t2490 = @term_syntax.parse_term("pi")
  let t2491 = @term_syntax.parse_term("-pi")
  let t2492 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2491, t2490, t2489]), absolutely_real_integrable_periodic_offset()))
  let t2488 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => max((B : Real) * abs((f : (Real) -> Real)(x + (t : Real)) - f(t)), real_of_num(4) * abs((M : Real)) * rpow(abs(x), (a : Real) - real_of_num(1)))"))
  let t2487 = @tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_absolutely_integrable())
  let t2484 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t2485 = @tactics.then_tac(@simp.simp_tac(@list.List([@metric.real_bounded_pos(), @sets.forall_in_image(), @misc.in_real_interval(), @sets.in_diff()])), t2484)
  let t2481 = @simp.rewrite_tac(@list.List([@metric.real_bounded_real_interval(), @sets.subset_diff()]))
  let t2480 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-pi, pi)])"))
  let t2479 = @tactics.match_mp_tac(@realanalysis.real_bounded_subset())
  let t2478 = @simp.simp_tac(@list.List([@metric.real_closed_diff(), @metric.real_closed_real_interval(), @metric.real_open_real_interval()]))
  let t2482 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_compact_eq_bounded_closed()])), t2478), t2479), t2480), t2481)
  let t2476 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) / real_of_num(2)"), @transcendentals.sin_eq_0_pi()))), @calc_rat.asm_real_arith_tac)
  let t2477 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal()), @realanalysis.real_differentiable_tac), t2476])
  let t2475 = @simp.rewrite_tac(@list.List([@realanalysis.netlimit_atreal()]))
  let t2474 = @tactics.match_mp_tac(@realanalysis.real_continuous_inv())
  let t2473 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t2472 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @misc.in_real_interval()]))
  let t2471 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2483 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()])), t2471), t2472), @tactics.strip_tac), t2473), t2474), t2475), @tactics.conj_tac), t2477), t2482])
  let t2470 = @tactics.match_mp_tac(@realanalysis.real_compact_continuous_image())
  let t2486 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.real_compact_imp_bounded()), t2470), @tactics.conj_tac), t2483), t2485])
  let t2469 = @tactics.subgoal_then(@term_syntax.parse_term("real_bounded(IMAGE((x : Real) => inv(sin(x / real_of_num(2))), DIFF(real_interval([(-pi, pi)]), real_interval((-(e : Real), e)))))"), fn(x2466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2467 = @tactics.mp_tac(x2466)
    fn(x2468 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2467(x2468)
    }
  })
  let t2460 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t2459 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_abs_rpow())]))
  let t2461 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (t : Real) - t == x"))])), t2459), t2460), @calc_rat.real_arith_tac)
  let t2462 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @calc_rat.asm_real_arith_tac), t2461])
  let t2458 = @tactics.exists_tac(@term_syntax.parse_term("(M : Real) * rpow(abs((x : Real) + (t : Real) - t), (a : Real))"))
  let t2457 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2456 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - real_of_num(1) + real_of_num(1) == a"))]))
  let t2453 = @equal.gsym(@real.real_abs_nz())
  let t2454 = @equal.gsym(@transcendentals.rpow_add())
  let t2455 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.rpow_pow()), t2454, t2453]))
  let t2452 = @simp.gen_rewrite_tac((x2451 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(3, fn(x2448 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2449 = @equal.rand_conv(x2448)
    fn(x2450 : @kernel.Term) -> @kernel.Thm raise {
      s2449(x2450)
    }
  }, x2451), @list.List([@equal.gsym(@real.real_pow_1())]))
  let t2447 = @equal.gsym(@realax.real_mul_assoc())
  let t2463 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @equal.gsym(@real.real_abs_nz()), t2447])), t2452), t2455), t2456), t2457), t2458), @tactics.conj_tac), t2462)
  let t2446 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2445 = @tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(4) == inv(real_of_num(1) / real_of_num(4))")))
  let t2464 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_inv()])), t2445), t2446), @calc_rat.asm_real_arith_tac), t2463])
  let t2444 = @simp.simp_tac(@list.List([@real.real_abs_pos(), @real.real_le_div()]))
  let t2443 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2441 = @tactics.conv_tac(@calc_rat.real_field)
  let t2440 = @tactics.undisch_tac(@term_syntax.parse_term("!((x : Real) == real_of_num(0))"))
  let t2442 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_div(), @real.real_abs_inv()])), t2440), t2441), @tactics.all_tac])
  let t2439 = @tactics.subgoal_then(@term_syntax.parse_term("abs(((f : (Real) -> Real)((x : Real) + (t : Real)) - f(t)) / sin(x / real_of_num(2))) == abs(inv(sin(x / real_of_num(2)) / x)) * (abs(f(x + t) - f(t)) / abs(x))"), fn(x2436 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2437 = @tactics.subst1_tac(x2436)
    fn(x2438 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2437(x2438)
    }
  })
  let t2433 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - real_of_num(1) / real_of_num(2)) < real_of_num(1) / real_of_num(4) → real_of_num(1) / real_of_num(4) <= abs(x)")))
  let t2435 = @tactics.disch_then(fn(x2434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2431 = @tactics.assume_tac(x2430)
      fn(x2432 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2431(x2432)
      }
    })(t2433(x2434))
  })
  let t2426 = @term_syntax.parse_term("(x : Real)")
  let t2429 = @tactics.remove_then("*", fn(x2428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2424 = @tactics.mp_tac(x2423)
      fn(x2425 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2424(x2425)
      }
    })(((x2427 : @kernel.Thm) => @bool.spec(t2426, x2427))(x2428))
  })
  let t2420 = @equal.gsym(@real.real_abs_mul())
  let t2421 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_abs_rpow()), t2420]))
  let t2422 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@realax.real_div(), @real.real_sub_refl(), @realax.real_add_lid(), @calc_int.real_mul_lzero()])), t2421), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2419 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t2416 = @equal.gsym(@real.real_abs_mul())
  let t2417 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_abs_rpow()), t2416]))
  let t2415 = @simp.asm_rewrite_tac(@list.List([@realax.real_inv_0()]))
  let t2418 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_div()])), t2415), t2417), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2414 = @class.asm_cases_tac(@term_syntax.parse_term("sin((x : Real) / real_of_num(2)) == real_of_num(0)"))
  let t2413 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2412 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t2411 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), (e : Real))"))
  let t2409 = @tactics.conjuncts_then2(fn(x2402 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2403 = @tactics.assume_tac(x2402)
    fn(x2404 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2403(x2404)
    }
  }, fn(x2406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2407 = ((x2405 : @kernel.Thm) => @tactics.label_tac("*", x2405))(x2406)
    fn(x2408 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2407(x2408)
    }
  })
  let t2410 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e : Real)"))(t2409))
  let t2401 = @simp.rewrite_tac(@list.List([@transcendentals.sin_0(), @real.real_sub_rzero()]))
  let t2400 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2396 = @term_syntax.parse_term("real_of_num(1) / real_of_num(4)")
  let t2399 = @tactics.disch_then(fn(x2398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2393 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2394 = @tactics.mp_tac(x2393)
      fn(x2395 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2394(x2395)
      }
    })(((x2397 : @kernel.Thm) => @bool.spec(t2396, x2397))(x2398))
  })
  let t2392 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_derivative_atreal(), @realanalysis.reallim_atreal()]))
  let t2391 = @simp.rewrite_tac(@list.List([@transcendentals.cos_0(), @realarith.real_mul_rid()]))
  let t2390 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2465 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@realanalysis.real_diff_conv(@term_syntax.parse_term("has_real_derivative((x : Real) => sin(x / real_of_num(2)), (w : Real), atreal(real_of_num(0)))"))), t2390), t2391), t2392), t2399), t2400), t2401), t2410), t2411), t2412), t2413), @tactics.strip_tac), t2414), t2418), t2419), t2422), t2429), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2435), t2439), t2442), t2443), t2444), @tactics.conj_tac), t2464), @tactics.all_tac])
  let t2389 = @tactics.subgoal_then(@term_syntax.parse_term("∃ e : Real, real_of_num(0) < e && (∀ x : Real, abs(x) < e → abs(((f : (Real) -> Real)(x + (t : Real)) - f(t)) / sin(x / real_of_num(2))) <= real_of_num(4) * (abs((M : Real)) * rpow(abs(x), (a : Real) - real_of_num(1))))"), @tactics.strip_assume_tac)
  let t2388 = @simp.asm_rewrite_tac(@list.List([]))
  let t2387 = @tactics.match_mp_tac(simple_fourier_convergence_periodic())
  let t2556 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2387), t2388), t2389), t2465), t2469), t2486), t2487), t2488), t2492), t2493), t2494), t2555)
  hoelder_fourier_convergence_periodic_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ d : Real, ∀ M : Real, ∀ a : Real, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && real_of_num(0) < d && real_of_num(0) < a && (∀ x : Real, abs(x - t) < d → abs(f(x) - f(t)) <= M * rpow(abs(x - t), a)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), f(t), sequentially)"), t2556))
}

///|
let hoelder_fourier_convergence_periodic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOELDER_FOURIER_CONVERGENCE_PERIODIC")

///|
/// `HOELDER_FOURIER_CONVERGENCE_PERIODIC`
pub fn hoelder_fourier_convergence_periodic() -> @kernel.Thm {
  hoelder_fourier_convergence_periodic_c.get()
}

///|
/// LIPSCHITZ_FOURIER_CONVERGENCE_PERIODIC
fn step_131() -> Unit raise {
  let t2564 = @simp.asm_rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1(), @real.real_lt_01()]))
  let t2561 = @term_syntax.parse_term("real_of_num(1)")
  let t2562 = @term_syntax.parse_term("(M : Real)")
  let t2563 = @tactics.map_every(fn(x2558 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2559 = @tactics.exists_tac(x2558)
    fn(x2560 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2559(x2560)
    }
  }, @list.List([@term_syntax.parse_term("(d : Real)"), t2562, t2561]))
  let t2557 = @tactics.match_mp_tac(hoelder_fourier_convergence_periodic())
  let t2565 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2557), t2563), t2564)
  lipschitz_fourier_convergence_periodic_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ d : Real, ∀ M : Real, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && real_of_num(0) < d && (∀ x : Real, abs(x - t) < d → abs(f(x) - f(t)) <= M * abs(x - t)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), f(t), sequentially)"), t2565))
}

///|
let lipschitz_fourier_convergence_periodic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIPSCHITZ_FOURIER_CONVERGENCE_PERIODIC")

///|
/// `LIPSCHITZ_FOURIER_CONVERGENCE_PERIODIC`
pub fn lipschitz_fourier_convergence_periodic() -> @kernel.Thm {
  lipschitz_fourier_convergence_periodic_c.get()
}

///|
/// BIDIFFERENTIABLE_FOURIER_CONVERGENCE_PERIODIC
fn step_132() -> Unit raise {
  let t2659 = @term_syntax.parse_term("(x : Real)")
  let t2662 = @tactics.remove_then("2", fn(x2661 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2656 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2657 = @tactics.mp_tac(x2656)
      fn(x2658 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2657(x2658)
      }
    })(((x2660 : @kernel.Thm) => @bool.spec(t2659, x2660))(x2661))
  })
  let t2654 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (t : Real) → real_of_num(0) < abs(x - t)"))
  let t2655 = @equal.gsym(@real.real_abs_div())
  let t2663 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_ldiv_eq()), t2655, t2654])), t2662), @calc_rat.asm_real_arith_tac)
  let t2650 = @term_syntax.parse_term("(x : Real)")
  let t2653 = @tactics.remove_then("1", fn(x2652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2647 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2648 = @tactics.mp_tac(x2647)
      fn(x2649 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2648(x2649)
      }
    })(((x2651 : @kernel.Thm) => @bool.spec(t2650, x2651))(x2652))
  })
  let t2645 = @calc_rat.real_arith(@term_syntax.parse_term("(t : Real) < (x : Real) → real_of_num(0) < abs(x - t)"))
  let t2646 = @equal.gsym(@real.real_abs_div())
  let t2664 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_ldiv_eq()), t2646, t2645])), t2653), @calc_rat.asm_real_arith_tac)
  let t2665 = @list.List([@simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @calc_int.real_abs_num(), @calc_int.real_mul_rzero(), @realax.real_le_refl()])), t2664, t2663])
  let t2643 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (t : Real) || t < x || x < t"))
  let t2644 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x2640 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2641 = @tactics.assume_tac(x2640)
    fn(x2642 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2641(x2642)
    }
  })(t2643)
  let t2639 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2638 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t2636 = @term_syntax.parse_term("abs((B1 : Real)) + (abs((B2 : Real)) + real_of_num(1))")
  let t2637 = @tactics.map_every(fn(x2633 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2634 = @tactics.exists_tac(x2633)
    fn(x2635 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2634(x2635)
    }
  }, @list.List([@term_syntax.parse_term("min((d1 : Real), (d2 : Real))"), t2636]))
  let t2631 = @tactics.conjuncts_then2(fn(x2624 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2625 = @tactics.assume_tac(x2624)
    fn(x2626 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2625(x2626)
    }
  }, fn(x2628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2629 = ((x2627 : @kernel.Thm) => @tactics.label_tac("2", x2627))(x2628)
    fn(x2630 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2629(x2630)
    }
  })
  let t2632 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d2 : Real)"))(t2631))
  let t2623 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @real.real_lt_01()]))
  let t2619 = @term_syntax.parse_term("real_of_num(1)")
  let t2622 = @tactics.disch_then(fn(x2621 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2616 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2617 = @tactics.mp_tac(x2616)
      fn(x2618 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2617(x2618)
      }
    })(((x2620 : @kernel.Thm) => @bool.spec(t2619, x2620))(x2621))
  })
  let t2613 = @simp.gen_rewrite_rule(fn(x2612 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2612
  }, @list.List([@realanalysis.reallim_withinreal()]))
  let t2615 = @tactics.remove_then("2", fn(x2614 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2609 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2610 = @tactics.mp_tac(x2609)
      fn(x2611 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2610(x2611)
      }
    })(t2613(x2614))
  })
  let t2607 = @tactics.conjuncts_then2(fn(x2600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2601 = @tactics.assume_tac(x2600)
    fn(x2602 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2601(x2602)
    }
  }, fn(x2604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2605 = ((x2603 : @kernel.Thm) => @tactics.label_tac("1", x2603))(x2604)
    fn(x2606 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2605(x2606)
    }
  })
  let t2608 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d1 : Real)"))(t2607))
  let t2599 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @real.real_lt_01()]))
  let t2595 = @term_syntax.parse_term("real_of_num(1)")
  let t2598 = @tactics.disch_then(fn(x2597 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2592 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2593 = @tactics.mp_tac(x2592)
      fn(x2594 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2593(x2594)
      }
    })(((x2596 : @kernel.Thm) => @bool.spec(t2595, x2596))(x2597))
  })
  let t2589 = @simp.gen_rewrite_rule(fn(x2588 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2588
  }, @list.List([@realanalysis.reallim_withinreal()]))
  let t2591 = @tactics.remove_then("1", fn(x2590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2586 = @tactics.mp_tac(x2585)
      fn(x2587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2586(x2587)
      }
    })(t2589(x2590))
  })
  let t2584 = @tactics.match_mp_tac(lipschitz_fourier_convergence_periodic())
  let t2582 = @tactics.x_choose_then(@term_syntax.parse_term("(B2 : Real)"))(fn(x2579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2580 = ((x2578 : @kernel.Thm) => @tactics.label_tac("2", x2578))(x2579)
    fn(x2581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2580(x2581)
    }
  })
  let t2583 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(B1 : Real)"))(fn(x2575 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2576 = ((x2574 : @kernel.Thm) => @tactics.label_tac("1", x2574))(x2575)
    fn(x2577 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2576(x2577)
    }
  }), t2582))
  let t2573 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable(), @realanalysis.has_real_derivative_withinreal()]))
  let t2572 = @tactics.replicate_tac(2, @tactics.disch_then(@tactics.conjuncts_then2(fn(x2566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2567 = @tactics.assume_tac(x2566)
    fn(x2568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2567(x2568)
    }
  }, fn(x2569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2570 = @tactics.mp_tac(x2569)
    fn(x2571 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2570(x2571)
    }
  })))
  let t2666 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2572), t2573), t2583), t2584), t2591), t2598), t2599), t2608), t2615), t2622), t2623), t2632), t2637), t2638), t2639), @tactics.strip_tac), t2644), t2665)
  bidifferentiable_fourier_convergence_periodic_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && real_differentiable(f, within(atreal(t), {(x : Real) | t < x})) && real_differentiable(f, within(atreal(t), {(x : Real) | x < t})) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), f(t), sequentially)"), t2666))
}

///|
let bidifferentiable_fourier_convergence_periodic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BIDIFFERENTIABLE_FOURIER_CONVERGENCE_PERIODIC")

///|
/// `BIDIFFERENTIABLE_FOURIER_CONVERGENCE_PERIODIC`
pub fn bidifferentiable_fourier_convergence_periodic() -> @kernel.Thm {
  bidifferentiable_fourier_convergence_periodic_c.get()
}

///|
/// DIFFERENTIABLE_FOURIER_CONVERGENCE_PERIODIC
fn step_133() -> Unit raise {
  let t2672 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_derivative_atreal_within()]))
  let t2671 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2670 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable()]))
  let t2669 = @tactics.undisch_tac(@term_syntax.parse_term("real_differentiable((f : (Real) -> Real), atreal((t : Real)))"))
  let t2668 = @simp.asm_rewrite_tac(@list.List([]))
  let t2667 = @tactics.match_mp_tac(bidifferentiable_fourier_convergence_periodic())
  let t2673 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2667), t2668), @tactics.conj_tac), t2669), t2670), t2671), t2672)
  differentiable_fourier_convergence_periodic_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && real_differentiable(f, atreal(t)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), f(t), sequentially)"), t2673))
}

///|
let differentiable_fourier_convergence_periodic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIFFERENTIABLE_FOURIER_CONVERGENCE_PERIODIC")

///|
/// `DIFFERENTIABLE_FOURIER_CONVERGENCE_PERIODIC`
pub fn differentiable_fourier_convergence_periodic() -> @kernel.Thm {
  differentiable_fourier_convergence_periodic_c.get()
}

///|
/// ABSOLUTELY_REAL_INTEGRABLE_MUL_DIRICHLET_KERNEL_REFLECTED
fn step_134() -> Unit raise {
  let t2683 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_const()]))
  let t2682 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2681 = @tactics.match_mp_tac(absolutely_real_integrable_periodic_offset())
  let t2680 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t2679 = @simp.rewrite_tac(@list.List([@realax.real_sub(), @calc_int.real_neg_neg()]))
  let t2678 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_on())]))
  let t2677 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_integrable_reflect())]))
  let t2684 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_on()])), t2677), t2678), t2679), t2680), t2681), t2682)
  let t2676 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2675 = @tactics.match_mp_tac(absolutely_real_integrable_periodic_offset())
  let t2685 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_add_sym()])), t2675), t2676), t2684, t2683])
  let t2674 = @tactics.match_mp_tac(absolutely_real_integrable_mul_dirichlet_kernel())
  let t2686 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2674), t2685)
  absolutely_real_integrable_mul_dirichlet_kernel_reflected_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ c : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * f((t : Real) + x), real_interval([(-pi, pi)])) && absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * f(t - x), real_interval([(-pi, pi)])) && absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * c, real_interval([(-pi, pi)]))"), t2686))
}

///|
let absolutely_real_integrable_mul_dirichlet_kernel_reflected_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_REAL_INTEGRABLE_MUL_DIRICHLET_KERNEL_REFLECTED")

///|
/// `ABSOLUTELY_REAL_INTEGRABLE_MUL_DIRICHLET_KERNEL_REFLECTED`
pub fn absolutely_real_integrable_mul_dirichlet_kernel_reflected() -> @kernel.Thm {
  absolutely_real_integrable_mul_dirichlet_kernel_reflected_c.get()
}

///|
/// ABSOLUTELY_REAL_INTEGRABLE_MUL_DIRICHLET_KERNEL_REFLECTED_PART
fn step_135() -> Unit raise {
  let t2704 = @simp.simp_tac(@list.List([@realax.real_add_ldistrib(), @real.real_sub_ldistrib(), @realanalysis.absolutely_real_integrable_add(), @realanalysis.absolutely_real_integrable_sub()]))
  let t2703 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t2702 = @simp.asm_rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t2701 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2700 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-pi, pi)])"))
  let t2699 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_on_subinterval())
  let t2705 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2699), t2700), t2701), t2702), t2703), @calc_rat.asm_real_arith_tac), t2704])
  let t2698 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool)) && (a && b && c → (d : Bool) && (e : Bool)) → a && b && c && d && e")))
  let t2697 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t2691 = @drule.match_mp(absolutely_real_integrable_mul_dirichlet_kernel_reflected())
  let t2696 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2692 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2688 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2689 = @tactics.assume_tac(x2688)
      fn(x2690 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2689(x2690)
      }
    })(t2691(x2692))
  }, fn(x2693 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2694 = @tactics.assume_tac(x2693)
    fn(x2695 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2694(x2695)
    }
  }))
  let t2687 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t2706 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2687), t2696), t2697), t2698), @tactics.conj_tac), t2705)
  absolutely_real_integrable_mul_dirichlet_kernel_reflected_part_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ d : Real, ∀ c : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && d <= pi → absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * f((t : Real) + x), real_interval([(real_of_num(0), d)])) && absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * f(t - x), real_interval([(real_of_num(0), d)])) && absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * c, real_interval([(real_of_num(0), d)])) && absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * (f(t + x) + f(t - x)), real_interval([(real_of_num(0), d)])) && absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * (f(t + x) + f(t - x) - c), real_interval([(real_of_num(0), d)]))"), t2706))
}

///|
let absolutely_real_integrable_mul_dirichlet_kernel_reflected_part_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_REAL_INTEGRABLE_MUL_DIRICHLET_KERNEL_REFLECTED_PART")

///|
/// `ABSOLUTELY_REAL_INTEGRABLE_MUL_DIRICHLET_KERNEL_REFLECTED_PART`
pub fn absolutely_real_integrable_mul_dirichlet_kernel_reflected_part() -> @kernel.Thm {
  absolutely_real_integrable_mul_dirichlet_kernel_reflected_part_c.get()
}

///|
/// FOURIER_SUM_OFFSET_DIRICHLET_KERNEL_HALF
fn step_136() -> Unit raise {
  let t2744 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_add_ldistrib()), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t2743 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_refl(), @theorems.forall_and_thm()]))
  let t2738 = @term_syntax.parse_term("(c : Real)")
  let t2739 = @term_syntax.parse_term("pi")
  let t2740 = @term_syntax.parse_term("(n : Num)")
  let t2741 = @bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2740, t2739, t2738]), absolutely_real_integrable_mul_dirichlet_kernel_reflected_part())
  let t2742 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(c : Real)"), t2741))
  let t2737 = @tactics.match_mp_tac(@equal.gsym(@realanalysis.real_integral_sub()))
  let t2736 = @simp.rewrite_tac(@list.List([@real.real_sub_ldistrib(), @realax.real_add_ldistrib()]))
  let t2735 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_eq_sub_radd())]))
  let t2732 = @drule.match_mp(@realanalysis.real_integral_unique())
  let t2734 = @tactics.disch_then(fn(x2733 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2731 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2728 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2729 = @tactics.subst1_tac(x2728)
        fn(x2730 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2729(x2730)
        }
      })(@equal.gsym(x2731))
    })(t2732(x2733))
  })
  let t2727 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi / real_of_num(2) * (real_of_num(2) * (l : Real)) == pi * l"))]))
  let t2724 = @drule.match_mp(@realanalysis.has_real_integral_rmul())
  let t2721 = @term_syntax.parse_term("real_of_num(2) * (l : Real)")
  let t2726 = @tactics.disch_then(fn(x2725 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2723 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2719 = @tactics.mp_tac(x2718)
        fn(x2720 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2719(x2720)
        }
      })(((x2722 : @kernel.Thm) => @bool.spec(t2721, x2722))(x2723))
    })(t2724(x2725))
  })
  let t2717 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), has_real_integral_dirichlet_kernel_half()))
  let t2716 = @simp.rewrite_tac(@list.List([dirichlet_kernel_neg(), @equal.gsym(@realax.real_sub())]))
  let t2715 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@realax.real_add_sym()]), @term_syntax.parse_term("dirichlet_kernel((n : Num), (x : Real)) * (f : (Real) -> Real)(x + (t : Real)) == dirichlet_kernel(n, x) * f(t + x)"))]))
  let t2714 = @simp.asm_simp_tac(@list.List([real_integral_reflect_and_add(), absolutely_real_integrable_mul_dirichlet_kernel(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t2713 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2709 = @term_syntax.parse_term("(t : Real)")
  let t2710 = @term_syntax.parse_term("pi")
  let t2711 = @term_syntax.parse_term("-pi")
  let t2712 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2711, t2710, t2709]), absolutely_real_integrable_periodic_offset()))
  let t2708 = @tactics.match_mp_tac(@drule.match_mp(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < pi → (x : Real) == (y : Real) + pi * (l : Real) → x / pi - l == y / pi")))(@transcendentals.pi_pos()))
  let t2707 = @simp.asm_simp_tac(@list.List([fourier_sum_offset_dirichlet_kernel()]))
  let t2745 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2707), t2708), t2712), t2713), @tactics.disch_tac), t2714), t2715), t2716), t2717), t2726), t2727), t2734), t2735), t2736), t2737), t2742), t2743), @tactics.strip_tac), t2744)
  fourier_sum_offset_dirichlet_kernel_half_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → sum(op_dot_dot(0, 2 * n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)) - (l : Real) == real_integral(real_interval([(real_of_num(0), pi)]), (x : Real) => dirichlet_kernel(n, x) * (f(t + x) + f(t - x) - real_of_num(2) * l)) / pi"), t2745))
}

///|
let fourier_sum_offset_dirichlet_kernel_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_OFFSET_DIRICHLET_KERNEL_HALF")

///|
/// `FOURIER_SUM_OFFSET_DIRICHLET_KERNEL_HALF`
pub fn fourier_sum_offset_dirichlet_kernel_half() -> @kernel.Thm {
  fourier_sum_offset_dirichlet_kernel_half_c.get()
}

///|
/// FOURIER_SUM_LIMIT_DIRICHLET_KERNEL_HALF
fn step_137() -> Unit raise {
  let t2755 = @tactics.conv_tac(@calc_rat.real_field)
  let t2754 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t2753 = @tactics.match_mp_tac(@realanalysis.reallim_null_rmul_eq())
  let t2752 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t2751 = @simp.asm_simp_tac(@list.List([fourier_sum_offset_dirichlet_kernel_half()]))
  let t2750 = @simp.gen_rewrite_tac(fn(x2747 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2748 = @equal.land_conv(x2747)
    fn(x2749 : @kernel.Term) -> @kernel.Thm raise {
      s2748(x2749)
    }
  }, @list.List([@realanalysis.reallim_null()]))
  let t2746 = @simp.asm_simp_tac(@list.List([@equal.gsym(fourier_sum_limit_pair())]))
  let t2756 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2746), t2750), t2751), t2752), t2753), t2754), t2755)
  fourier_sum_limit_dirichlet_kernel_half_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ t : Real, ∀ l : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), l, sequentially) == op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(real_of_num(0), pi)]), (x : Real) => dirichlet_kernel(n, x) * (f(t + x) + f(t - x) - real_of_num(2) * l)), real_of_num(0), sequentially)"), t2756))
}

///|
let fourier_sum_limit_dirichlet_kernel_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_LIMIT_DIRICHLET_KERNEL_HALF")

///|
/// `FOURIER_SUM_LIMIT_DIRICHLET_KERNEL_HALF`
pub fn fourier_sum_limit_dirichlet_kernel_half() -> @kernel.Thm {
  fourier_sum_limit_dirichlet_kernel_half_c.get()
}

///|
/// RIEMANN_LOCALIZATION_INTEGRAL
fn step_138() -> Unit raise {
  let t2839 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2838 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t2837 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t2836 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t2835 = @simp.once_rewrite_tac(@list.List([@realax.real_div()]))
  let t2840 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])), t2835), t2836), t2837), t2838), t2839), @calc_rat.asm_real_arith_tac)
  let t2834 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2841 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @calc_int.real_mul_lzero(), @calc_int.real_abs_num()])), t2834), @calc_rat.asm_real_arith_tac), t2840])
  let t2833 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t2842 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t2833), @tactics.strip_tac), @class.cond_cases_tac), t2841)
  let t2832 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_abs(), @realanalysis.absolutely_real_integrable_sub()]))
  let t2831 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_lmul())
  let t2843 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable()), t2831), t2832)
  let t2825 = @simp.rewrite_tac(@list.List([@misc.countable_integer()]))
  let t2824 = @tactics.match_mp_tac(@card.countable_image())
  let t2826 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_negligible_countable()), t2824), t2825)
  let t2823 = @meson.meson_tac(@list.List([@sets.in_()]))
  let t2822 = @simp.rewrite_tac(@list.List([@transcendentals.pi_nz(), @calc_rat.real_ring(@term_syntax.parse_term("(real_of_num(2) * (pi * (m : Real)) == real_of_num(2) * (pi * (n : Real))) == (pi == real_of_num(0) || m == n)"))]))
  let t2821 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @transcendentals.sin_eq_0(), @calc_rat.real_arith(@term_syntax.parse_term("((y : Real) / real_of_num(2) == (n : Real) * pi) == (real_of_num(2) * (pi * n) == y)"))]))
  let t2820 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t2827 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t2820), t2821), t2822), t2823), t2826])
  let t2828 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{(x : Real) | sin(x / real_of_num(2)) == real_of_num(0)} == IMAGE((n : Real) => real_of_num(2) * (pi * n), integer)"), fn(x2817 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2818 = @tactics.subst1_tac(x2817)
    fn(x2819 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2818(x2819)
    }
  }), t2827)
  let t2816 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t2815 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t2814 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2813 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t2829 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.continuous_imp_real_measurable_on()), t2813), t2814), t2815), t2816), @realanalysis.real_differentiable_tac)
  let t2812 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @misc.in_real_interval()]))
  let t2811 = @tactics.subgoal_then(@term_syntax.parse_term("{(x : Real) | abs(x) < (d : Real)} == real_interval((-d, d))"), fn(x2809 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2809
    @simp.rewrite_tac(@list.List([th_2, @realanalysis.real_lebesgue_measurable_interval()]))
  })
  let t2808 = @simp.asm_simp_tac(@list.List([@realanalysis.integrable_imp_real_measurable(), @realanalysis.real_measurable_on_0(), @realanalysis.absolutely_real_integrable_imp_integrable(), @realanalysis.absolutely_real_integrable_sub()]))
  let t2830 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_cases()), t2808), t2811), t2812), @calc_rat.real_arith_tac), t2829, t2828])
  let t2807 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2844 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_div()), t2807), t2830), t2843, t2842])
  let t2806 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2805 = @simp.rewrite_tac(@list.List([]))
  let t2804 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => (B : Real) * abs((f : (Real) -> Real)(x) - (g : (Real) -> Real)(x))"))
  let t2803 = @tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_absolutely_integrable())
  let t2800 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t2801 = @tactics.then_tac(@simp.simp_tac(@list.List([@metric.real_bounded_pos(), @sets.forall_in_image(), @misc.in_real_interval(), @sets.in_diff()])), t2800)
  let t2797 = @simp.rewrite_tac(@list.List([@metric.real_bounded_real_interval(), @sets.subset_diff()]))
  let t2796 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-pi, pi)])"))
  let t2795 = @tactics.match_mp_tac(@realanalysis.real_bounded_subset())
  let t2794 = @simp.simp_tac(@list.List([@metric.real_closed_diff(), @metric.real_closed_real_interval(), @metric.real_open_real_interval()]))
  let t2798 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_compact_eq_bounded_closed()])), t2794), t2795), t2796), t2797)
  let t2792 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) / real_of_num(2)"), @transcendentals.sin_eq_0_pi()))), @calc_rat.asm_real_arith_tac)
  let t2793 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal()), @realanalysis.real_differentiable_tac), t2792])
  let t2791 = @simp.rewrite_tac(@list.List([@realanalysis.netlimit_atreal()]))
  let t2790 = @tactics.match_mp_tac(@realanalysis.real_continuous_inv())
  let t2789 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t2788 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @misc.in_real_interval()]))
  let t2787 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2799 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()])), t2787), t2788), @tactics.strip_tac), t2789), t2790), t2791), @tactics.conj_tac), t2793), t2798])
  let t2786 = @tactics.match_mp_tac(@realanalysis.real_compact_continuous_image())
  let t2802 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.real_compact_imp_bounded()), t2786), @tactics.conj_tac), t2799), t2801])
  let t2785 = @tactics.subgoal_then(@term_syntax.parse_term("real_bounded(IMAGE((x : Real) => inv(sin(x / real_of_num(2))), DIFF(real_interval([(-pi, pi)]), real_interval((-(d : Real), d)))))"), fn(x2782 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2783 = @tactics.mp_tac(x2782)
    fn(x2784 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2783(x2784)
    }
  })
  let t2781 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_lmul())
  let t2780 = @tactics.match_mp_tac(riemann_lebesgue_sin_half())
  let t2778 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_mul_ac()]))
  let t2777 = @simp.asm_rewrite_tac(@list.List([dirichlet_kernel()]))
  let t2776 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2775 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_sing(), @misc.in_real_interval()]))
  let t2774 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing()]))
  let t2773 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t2779 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@realanalysis.real_integral_spike())), t2773), t2774), t2775), t2776), t2777), t2778), @tactics.all_tac])
  let t2772 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * (if abs(x) < (d : Real) { real_of_num(0) } else { (f : (Real) -> Real)(x) - (g : (Real) -> Real)(x) })) == real_integral(real_interval([(-pi, pi)]), (x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * (inv(real_of_num(2)) * ((if abs(x) < d { real_of_num(0) } else { f(x) - g(x) }) / sin(x / real_of_num(2)))))"), fn(x2770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2770
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t2768 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2767 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) == (x : Real) - (y : Real)) == (x == y)"))]))
  let t2766 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sub_ldistrib())]))
  let t2765 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t2764 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2763 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_empty(), @sets.diff_empty()]))
  let t2762 = @tactics.exists_tac(@term_syntax.parse_term("({} : (Real) -> Bool)"))
  let t2761 = @tactics.match_mp_tac(@realanalysis.real_integral_spike())
  let t2760 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2769 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([absolutely_real_integrable_mul_dirichlet_kernel(), @realanalysis.absolutely_real_integrable_imp_integrable(), @equal.gsym(@realanalysis.real_integral_sub())])), t2760), t2761), t2762), t2763), t2764), t2765), @tactics.strip_tac), t2766), @tactics.ap_term_tac), @class.cond_cases_tac), t2767), t2768), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2759 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * (f : (Real) -> Real)(x)) - real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * (g : (Real) -> Real)(x)) == real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * (if abs(x) < (d : Real) { real_of_num(0) } else { f(x) - g(x) }))"), fn(x2757 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2757
    @simp.rewrite_tac(@list.List([th]))
  })
  let t2845 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2759), t2769), t2772), t2779), t2780), t2781), t2785), t2802), t2803), t2804), t2805), t2806), t2844)
  riemann_localization_integral_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Real, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && absolutely_real_integrable_on(g, real_interval([(-pi, pi)])) && real_of_num(0) < d && (∀ x : Real, abs(x) < d → f(x) == g(x)) → op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * f(x)) - real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * g(x)), real_of_num(0), sequentially)"), t2845))
}

///|
let riemann_localization_integral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIEMANN_LOCALIZATION_INTEGRAL")

///|
/// `RIEMANN_LOCALIZATION_INTEGRAL`
pub fn riemann_localization_integral() -> @kernel.Thm {
  riemann_localization_integral_c.get()
}

///|
/// RIEMANN_LOCALIZATION_INTEGRAL_RANGE
fn step_139() -> Unit raise {
  let t2866 = @tactics.disch_then(fn(x2864 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2864
    @simp.rewrite_tac(@list.List([@drule.match_mp(@realanalysis.real_integral_restrict())(th)]))
  })
  let t2867 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval()])), @calc_rat.asm_real_arith_tac), t2866])
  let t2863 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(real_interval([(-(d : Real), d)]), real_interval([(-pi, pi)]))"), fn(x2860 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2861 = @tactics.mp_tac(x2860)
    fn(x2862 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2861(x2862)
    }
  })
  let t2868 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@meson.meson(@list.List([@calc_int.real_mul_rzero()]), @term_syntax.parse_term("(a : Real) * (if (p : Bool) { (b : Real) } else { real_of_num(0) }) == (if p { a * b } else { real_of_num(0) })"))])), t2863), t2867)
  let t2859 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), @calc_rat.real_arith_tac)
  let t2858 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t2855 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.absolutely_real_integrable_on_subinterval()))
  let t2857 = @tactics.first_x_assum(fn(x2856 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2855(x2856))
  })
  let t2854 = @simp.rewrite_tac(@list.List([@equal.gsym(@misc.real_interval())]))
  let t2853 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (d : Real) && d <= pi → ((-pi <= (x : Real) && x <= pi) && -d <= x && x <= d) == (-d <= x && x <= d)"))]))
  let t2852 = @simp.rewrite_tac(@list.List([@sets.inter(), @misc.in_real_interval()]))
  let t2851 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_restrict_univ(), @equal.gsym(@sets.in_inter())]))
  let t2850 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(if (p : Bool) { if (q : Bool) { (x : _) } else { (y : _) } } else { y }) == (if p && q { x } else { y })"))]))
  let t2869 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_restrict_univ())])), t2850), t2851), t2852), t2853), t2854), t2857), t2858), @calc_rat.asm_real_arith_tac), t2859])), t2868])
  let t2849 = @simp.asm_rewrite_tac(@list.List([]))
  let t2846 = @term_syntax.parse_term("(x : Real) => if IN(x, real_interval([(-(d : Real), d)])) { (f : (Real) -> Real)(x) } else { real_of_num(0) }")
  let t2847 = @term_syntax.parse_term("(f : (Real) -> Real)")
  let t2848 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d : Real)"), t2847, t2846]), riemann_localization_integral()))
  let t2870 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2848), t2849), @tactics.ants_tac), t2869)
  riemann_localization_integral_range_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Real, ∀ f : (Real) -> Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && real_of_num(0) < d && d <= pi → op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(-pi, pi)]), (x : Real) => dirichlet_kernel(n, x) * f(x)) - real_integral(real_interval([(-d, d)]), (x : Real) => dirichlet_kernel(n, x) * f(x)), real_of_num(0), sequentially)"), t2870))
}

///|
let riemann_localization_integral_range_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIEMANN_LOCALIZATION_INTEGRAL_RANGE")

///|
/// `RIEMANN_LOCALIZATION_INTEGRAL_RANGE`
pub fn riemann_localization_integral_range() -> @kernel.Thm {
  riemann_localization_integral_range_c.get()
}

///|
/// RIEMANN_LOCALIZATION
fn step_140() -> Unit raise {
  let t2883 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2884 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2883), @calc_rat.asm_real_arith_tac)
  let t2882 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2881 = @tactics.match_mp_tac(absolutely_real_integrable_periodic_offset())
  let t2885 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_add_sym()])), t2881), t2882)
  let t2880 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2879 = @tactics.match_mp_tac(absolutely_real_integrable_periodic_offset())
  let t2886 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_add_sym()])), t2879), t2880), t2885, t2884])
  let t2878 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2877 = @simp.asm_rewrite_tac(@list.List([]))
  let t2876 = @tactics.exists_tac(@term_syntax.parse_term("(d : Real)"))
  let t2875 = @tactics.match_mp_tac(riemann_localization_integral())
  let t2874 = @simp.rewrite_tac(@list.List([]))
  let t2873 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eq())
  let t2872 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t2871 = @simp.asm_simp_tac(@list.List([fourier_sum_limit_dirichlet_kernel()]))
  let t2887 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2871), t2872), t2873), t2874), t2875), t2876), t2877), t2878), t2886)
  riemann_localization_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Real, ∀ d : Real, ∀ c : Real, ∀ f : (Real) -> Real, ∀ g : (Real) -> Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && absolutely_real_integrable_on(g, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && (∀ x : Real, g(x + real_of_num(2) * pi) == g(x)) && real_of_num(0) < d && (∀ x : Real, abs(x - t) < d → f(x) == g(x)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), c, sequentially) == op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(g, k) * trigonometric_set(k, t)), c, sequentially)"), t2887))
}

///|
let riemann_localization_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIEMANN_LOCALIZATION")

///|
/// `RIEMANN_LOCALIZATION`
pub fn riemann_localization() -> @kernel.Thm {
  riemann_localization_c.get()
}

///|
/// RIEMANN_LOCALIZATION_INTEGRAL_RANGE_HALF
fn step_141() -> Unit raise {
  let t2905 = @simp.rewrite_tac(@list.List([dirichlet_kernel_neg(), @equal.gsym(@realax.real_add_ldistrib())]))
  let t2906 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([real_integral_reflect_and_add(), @realanalysis.absolutely_real_integrable_imp_integrable()])), t2905)
  let t2904 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t2900 = @term_syntax.parse_term("(n : Num)")
  let t2898 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.absolutely_real_integrable_on_subinterval()))
  let t2903 = @tactics.first_x_assum(fn(x2902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2899 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.match_mp_tac(t2898(x2899))
    })(((x2901 : @kernel.Thm) => @bool.spec(t2900, x2901))(x2902))
  })
  let t2907 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t2903), t2904), @calc_rat.asm_real_arith_tac), t2906])
  let t2897 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, absolutely_real_integrable_on((x : Real) => dirichlet_kernel(n, x) * (f : (Real) -> Real)(x), real_interval([(-(d : Real), d)]))"), fn(x2894 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2895 = @tactics.assume_tac(x2894)
    fn(x2896 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2895(x2896)
    }
  })
  let t2893 = @simp.asm_rewrite_tac(@list.List([]))
  let t2890 = @term_syntax.parse_term("(n : Num)")
  let t2891 = @bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2890]), absolutely_real_integrable_mul_dirichlet_kernel())
  let t2892 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(n : Num)"), t2891))
  let t2888 = @term_syntax.parse_term("(f : (Real) -> Real)")
  let t2889 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Real)"), t2888]), riemann_localization_integral_range()))
  let t2908 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2889), t2892), t2893), @tactics.disch_tac), t2897), t2907)
  riemann_localization_integral_range_half_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Real, ∀ f : (Real) -> Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && real_of_num(0) < d && d <= pi → op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(real_of_num(0), pi)]), (x : Real) => dirichlet_kernel(n, x) * (f(x) + f(-x))) - real_integral(real_interval([(real_of_num(0), d)]), (x : Real) => dirichlet_kernel(n, x) * (f(x) + f(-x))), real_of_num(0), sequentially)"), t2908))
}

///|
let riemann_localization_integral_range_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIEMANN_LOCALIZATION_INTEGRAL_RANGE_HALF")

///|
/// `RIEMANN_LOCALIZATION_INTEGRAL_RANGE_HALF`
pub fn riemann_localization_integral_range_half() -> @kernel.Thm {
  riemann_localization_integral_range_half_c.get()
}

///|
/// FOURIER_SUM_LIMIT_DIRICHLET_KERNEL_PART
fn step_142() -> Unit raise {
  let t2922 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2921 = @tactics.match_mp_tac(absolutely_real_integrable_periodic_offset())
  let t2920 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t2919 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_const()]))
  let t2918 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_sub())
  let t2917 = @simp.asm_rewrite_tac(@list.List([]))
  let t2916 = @tactics.match_mp_tac(riemann_localization_integral_range_half())
  let t2915 = @tactics.disch_then(fn(x2913 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2913
    @simp.rewrite_tac(@list.List([th]))
  })
  let t2912 = @tactics.mp_tac(@meson.meson(@list.List([@realax.real_sub()]), @term_syntax.parse_term("∀ x : Real, (f : (Real) -> Real)((t : Real) - x) == f(t + -x)")))
  let t2911 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (y : Real) - real_of_num(2) * (l : Real) == x - l + (y - l)"))]))
  let t2910 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eq())
  let t2909 = @simp.asm_simp_tac(@list.List([fourier_sum_limit_dirichlet_kernel_half()]))
  let t2923 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2909), t2910), t2911), t2912), t2915), t2916), t2917), t2918), t2919), t2920), t2921), t2922)
  fourier_sum_limit_dirichlet_kernel_part_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ t : Real, ∀ l : Real, ∀ d : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && real_of_num(0) < d && d <= pi → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), l, sequentially) == op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(real_of_num(0), d)]), (x : Real) => dirichlet_kernel(n, x) * (f(t + x) + f(t - x) - real_of_num(2) * l)), real_of_num(0), sequentially)"), t2923))
}

///|
let fourier_sum_limit_dirichlet_kernel_part_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_LIMIT_DIRICHLET_KERNEL_PART")

///|
/// `FOURIER_SUM_LIMIT_DIRICHLET_KERNEL_PART`
pub fn fourier_sum_limit_dirichlet_kernel_part() -> @kernel.Thm {
  fourier_sum_limit_dirichlet_kernel_part_c.get()
}

///|
/// REAL_INTEGRAL_DIRICHLET_KERNEL_MUL_EXPAND
fn step_143() -> Unit raise {
  let t2927 = @simp.simp_tac(@list.List([@sets.in_diff(), @sets.in_sing(), dirichlet_kernel()]))
  let t2926 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing()]))
  let t2925 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t2924 = @tactics.match_mp_tac(@realanalysis.real_integral_spike())
  let t2928 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2924), t2925), t2926), t2927)
  real_integral_dirichlet_kernel_mul_expand_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ s : (Real) -> Bool, real_integral(s, (x : Real) => dirichlet_kernel(n, x) * f(x)) == real_integral(s, (x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) / (real_of_num(2) * sin(x / real_of_num(2))) * f(x))"), t2928))
}

///|
let real_integral_dirichlet_kernel_mul_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRAL_DIRICHLET_KERNEL_MUL_EXPAND")

///|
/// `REAL_INTEGRAL_DIRICHLET_KERNEL_MUL_EXPAND`
pub fn real_integral_dirichlet_kernel_mul_expand() -> @kernel.Thm {
  real_integral_dirichlet_kernel_mul_expand_c.get()
}

///|
/// REAL_INTEGRABLE_DIRICHLET_KERNEL_MUL_EXPAND
fn step_144() -> Unit raise {
  let t2932 = @simp.simp_tac(@list.List([@sets.in_diff(), @sets.in_sing(), dirichlet_kernel()]))
  let t2931 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing()]))
  let t2930 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t2929 = @tactics.match_mp_tac(@realanalysis.real_integrable_spike())
  let t2933 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t2929), t2930), t2931), t2932)
  real_integrable_dirichlet_kernel_mul_expand_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ s : (Real) -> Bool, real_integrable_on((x : Real) => dirichlet_kernel(n, x) * f(x), s) == real_integrable_on((x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) / (real_of_num(2) * sin(x / real_of_num(2))) * f(x), s)"), t2933))
}

///|
let real_integrable_dirichlet_kernel_mul_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRABLE_DIRICHLET_KERNEL_MUL_EXPAND")

///|
/// `REAL_INTEGRABLE_DIRICHLET_KERNEL_MUL_EXPAND`
pub fn real_integrable_dirichlet_kernel_mul_expand() -> @kernel.Thm {
  real_integrable_dirichlet_kernel_mul_expand_c.get()
}

///|
/// SIN_SUB_X_BOUND
fn step_145() -> Unit raise {
  let t2940 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_0(), @realax.real_mul_lid()]))
  let t2938 = @equal.gsym(@complexes.cx_sub())
  let t2939 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), t2938, @complexes.complex_norm_cx(), @real.real_abs_0()]))
  let t2937 = @simp.rewrite_tac(@list.List([@complexes.complex_pow(), @complexes.complex_pow_1(), @complexes.complex_div_1(), @complexes.im_cx()]))
  let t2936 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t2935 = @simp.rewrite_tac(@list.List([@vectors.vsum_clauses_numseg(), @equal.gsym(@transcendentals.cx_sin())]))
  let t2934 = @term_syntax.parse_term("Cx((x : Real))")
  let t2941 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("0"), t2934]), @transcendentals.taylor_csin()))), t2935), t2936), t2937), t2939), t2940), @calc_rat.real_arith_tac)
  sin_sub_x_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, abs(sin(x) - x) <= pow(abs(x), 3)"), t2941))
}

///|
let sin_sub_x_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_SUB_X_BOUND")

///|
/// `SIN_SUB_X_BOUND`
pub fn sin_sub_x_bound() -> @kernel.Thm {
  sin_sub_x_bound_c.get()
}

///|
/// SIN_OVER_X_SUB1_BOUND
fn step_146() -> Unit raise {
  let t2949 = @simp.rewrite_tac(@list.List([sin_sub_x_bound()]))
  let t2948 = @simp.asm_simp_tac(@list.List([@real.real_sub_ldistrib(), @real.real_div_lmul(), @realarith.real_mul_rid()]))
  let t2947 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_abs_nz()), @calc_num.arith()]))
  let t2945 = @equal.gsym(@bool.conjunct2(@realax.real_pow()))
  let t2946 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_mul()), t2945]))
  let t2944 = @tactics.exists_tac(@term_syntax.parse_term("abs((x : Real))"))
  let t2943 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t2942 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_pow2_abs())]))
  let t2950 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2942), t2943), t2944), t2946), t2947), t2948), t2949)
  sin_over_x_sub1_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, !(x == real_of_num(0)) → abs(sin(x) / x - real_of_num(1)) <= pow(x, 2)"), t2950))
}

///|
let sin_over_x_sub1_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_OVER_X_SUB1_BOUND")

///|
/// `SIN_OVER_X_SUB1_BOUND`
pub fn sin_over_x_sub1_bound() -> @kernel.Thm {
  sin_over_x_sub1_bound_c.get()
}

///|
/// SIN_LOWER_BOUND_HALF
fn step_147() -> Unit raise {
  let t2955 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_le_square_abs())]))
  let t2954 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t2953 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(4) * pow((x : Real), 3) <= x) == (x * pow(x, 2) <= x * pow(real_of_num(1) / real_of_num(2), 2))"))]))
  let t2952 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(4) * (x3 : Real) <= abs((x : Real)) → abs((s : Real) - x) <= x3 → abs(x) / real_of_num(2) <= abs(s)")))
  let t2951 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), sin_sub_x_bound()))
  let t2956 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2951), t2952), t2953), t2954), t2955), @calc_rat.asm_real_arith_tac)
  sin_lower_bound_half_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, abs(x) <= real_of_num(1) / real_of_num(2) → abs(x) / real_of_num(2) <= abs(sin(x))"), t2956))
}

///|
let sin_lower_bound_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_LOWER_BOUND_HALF")

///|
/// `SIN_LOWER_BOUND_HALF`
pub fn sin_lower_bound_half() -> @kernel.Thm {
  sin_lower_bound_half_c.get()
}

///|
/// INV_SIN_SUB_INV_BOUND
fn step_148() -> Unit raise {
  let t2969 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real)"), sin_lower_bound_half()))
  let t2968 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t2967 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realax.real_mul_assoc()]))
  let t2966 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_pow2_abs())]))
  let t2965 = @simp.asm_simp_tac(@list.List([sin_over_x_sub1_bound()]))
  let t2964 = @tactics.exists_tac(@term_syntax.parse_term("pow((x : Real), 2)"))
  let t2963 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2962 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs(real_of_num(1) - (s : Real) * inv((x : Real))) == abs(s / x - real_of_num(1))"))]))
  let t2970 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_abs_nz()), @real.real_sub_ldistrib(), @real.real_mul_rinv()])), t2962), t2963), t2964), t2965), t2966), t2967), t2968), t2969), @calc_rat.asm_real_arith_tac)
  let t2961 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t2971 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), @transcendentals.sin_eq_0_pi())), t2961), @calc_rat.asm_real_arith_tac), t2970])
  let t2960 = @class.asm_cases_tac(@term_syntax.parse_term("sin((x : Real)) == real_of_num(0)"))
  let t2959 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_mul())]))
  let t2958 = @tactics.exists_tac(@term_syntax.parse_term("abs(sin((x : Real)))"))
  let t2957 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t2972 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2957), t2958), t2959), t2960), t2971)
  inv_sin_sub_inv_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, !(x == real_of_num(0)) && abs(x) <= real_of_num(1) / real_of_num(2) → abs(inv(sin(x)) - inv(x)) <= real_of_num(2) * abs(x)"), t2972))
}

///|
let inv_sin_sub_inv_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INV_SIN_SUB_INV_BOUND")

///|
/// `INV_SIN_SUB_INV_BOUND`
pub fn inv_sin_sub_inv_bound() -> @kernel.Thm {
  inv_sin_sub_inv_bound_c.get()
}

///|
/// FOURIER_SUM_LIMIT_SINE_PART
fn step_149() -> Unit raise {
  let t3168 = @list.List([@tactics.match_mp_tac(inv_sin_sub_inv_bound()), @calc_rat.asm_real_arith_tac])
  let t3167 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * abs((x : Real) / real_of_num(2))"))
  let t3166 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t3165 = @simp.gen_rewrite_tac(fn(x3164 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3160 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x3154 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3155 = @equal.land_conv(x3154)
        fn(x3156 : @kernel.Term) -> @kernel.Thm raise {
          s3155(x3156)
        }
      })((fn(x3157 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3158 = @equal.rand_conv(x3157)
        fn(x3159 : @kernel.Term) -> @kernel.Thm raise {
          s3158(x3159)
        }
      })(x3160))
    })((fn(x3161 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3162 = @equal.rand_conv(x3161)
      fn(x3163 : @kernel.Term) -> @kernel.Thm raise {
        s3162(x3163)
      }
    })(x3164))
  }, @list.List([@equal.gsym(@real.real_inv_div())]))
  let t3153 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t3152 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((is_ : Real) - real_of_num(2) * (ix : Real)) <= real_of_num(1) → abs(inv(real_of_num(2)) * is_ - ix) <= max((B : Real), real_of_num(2))")))
  let t3151 = @simp.rewrite_tac(@list.List([@real.real_inv_mul()]))
  let t3150 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@realax.real_div(), @calc_int.real_mul_lzero(), @realax.real_inv_0(), @transcendentals.sin_0()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3149 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t3147 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3148 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (B : Real) → x <= max(B, (C : Real))"))), t3147), @calc_rat.asm_real_arith_tac)])
  let t3146 = @class.asm_cases_tac(@term_syntax.parse_term("abs((x : Real)) <= real_of_num(1)"))
  let t3145 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3144 = @tactics.exists_tac(@term_syntax.parse_term("max((B : Real), real_of_num(2))"))
  let t3143 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t3142 = @simp.rewrite_tac(@list.List([@misc.in_real_interval(), @sets.in_union()]))
  let t3141 = @simp.rewrite_tac(@list.List([@metric.real_bounded_pos(), @sets.forall_in_image()]))
  let t3139 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3136 = @simp.gen_rewrite_rule(fn(x3135 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3135
  }, @list.List([@sets.in_union()]))
  let t3138 = @tactics.first_x_assum(fn(x3137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3133 = @tactics.mp_tac(x3132)
      fn(x3134 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3133(x3134)
      }
    })(t3136(x3137))
  })
  let t3131 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) / real_of_num(2)"), @transcendentals.sin_eq_0_pi()))
  let t3130 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t3129 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t3128 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3127 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t3126 = @simp.simp_tac(@list.List([@metric.real_compact_interval(), @metric.real_compact_union()]))
  let t3125 = @tactics.match_mp_tac(@realanalysis.real_compact_continuous_image())
  let t3140 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.real_compact_imp_bounded()), t3125), t3126), t3127), t3128), t3129), t3130), @realanalysis.real_differentiable_tac), t3131), t3138), t3139), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3124 = @tactics.subgoal_then(@term_syntax.parse_term("real_bounded(IMAGE((x : Real) => inv(real_of_num(2) * sin(x / real_of_num(2))) - inv(x), UNION(real_interval([(-pi, -real_of_num(1))]), real_interval([(real_of_num(1), pi)]))))"), fn(x3121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3122 = @tactics.mp_tac(x3121)
    fn(x3123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3122(x3123)
    }
  })
  let t3117 = @simp.rewrite_tac(@list.List([@misc.countable_integer()]))
  let t3116 = @tactics.match_mp_tac(@card.countable_image())
  let t3115 = @tactics.match_mp_tac(@realanalysis.real_negligible_countable())
  let t3114 = @simp.rewrite_tac(@list.List([real_sin_x2_zeros()]))
  let t3118 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * (x : Real) == real_of_num(0)) == (x == real_of_num(0))"))])), t3114), t3115), t3116), t3117)
  let t3113 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t3112 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t3111 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3110 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t3119 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.continuous_imp_real_measurable_on()), t3110), t3111), t3112), t3113), @realanalysis.real_differentiable_tac), t3118])
  let t3109 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_imp_real_measurable_on_closed_subset(), @metric.real_closed_real_interval(), @realanalysis.real_continuous_on_const(), @realanalysis.real_continuous_on_id(), @sets.sing_gspec(), @realanalysis.real_negligible_sing(), @metric.real_closed_univ()]))
  let t3108 = @tactics.match_mp_tac(@realanalysis.real_measurable_on_div())
  let t3107 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((x : Real)) == real_of_num(1) / x"))]))
  let t3106 = @simp.rewrite_tac(@list.List([]))
  let t3105 = @simp.gen_rewrite_tac(fn(x3102 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3103 = @equal.land_conv(x3102)
    fn(x3104 : @kernel.Term) -> @kernel.Thm raise {
      s3103(x3104)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t3101 = @tactics.match_mp_tac(@realanalysis.real_measurable_on_sub())
  let t3100 = @simp.rewrite_tac(@list.List([@realanalysis.real_measurable_on_0(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool))} == s")), @realanalysis.real_lebesgue_measurable_interval()]))
  let t3120 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_cases()), t3100), t3101), @tactics.conj_tac), t3105), t3106), t3107), t3108), t3109), @tactics.conj_tac), t3119), @tactics.all_tac])
  let t3099 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_add(), @realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_const()]))
  let t3098 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t3097 = @tactics.match_mp_tac(riemann_lebesgue_sin_half())
  let t3096 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()]), @term_syntax.parse_term("(if (p : (_) -> Bool)((x : _)) { (a : (_) -> Real)(x) * ((b : (_) -> Real)(x) * (c : (_) -> Real)(x)) } else { real_of_num(0) }) == a(x) * ((if p(x) { b(x) } else { real_of_num(0) }) * c(x))"))]))
  let t3094 = @tactics.disch_then(fn(x3092 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3092
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(@realanalysis.real_integral_restrict())(th_1))]))
  })
  let t3095 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval()])), @calc_rat.asm_real_arith_tac), t3094])
  let t3169 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("SUBSET(real_interval([(real_of_num(0), (d : Real))]), real_interval([(-pi, pi)]))"), fn(x3089 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3090 = @tactics.mp_tac(x3089)
    fn(x3091 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3090(x3091)
    }
  }), t3095), t3096), t3097), t3098), t3099), @tactics.conj_tac), t3120), t3124), t3140), t3141), t3142), t3143), t3144), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t3145), @tactics.strip_tac), @class.cond_cases_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t3146), t3148), t3149), t3150), t3151), t3152), t3153), t3165), t3166), t3167), @tactics.conj_tac), t3168), @calc_rat.asm_real_arith_tac)
  let t3084 = @tactics.match_mp_tac(sin_over_x_sub1_bound())
  let t3083 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) → real_of_num(2) * (y : Real) / x == y / (x / real_of_num(2))"))]))
  let t3082 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((z : Real) - real_of_num(1)) <= (y : Real) → abs(real_of_num(1) + y) <= (B : Real) → abs(z) <= B")))
  let t3081 = @simp.asm_rewrite_tac(@list.List([]))
  let t3078 = @term_syntax.parse_term("(x : Real)")
  let t3085 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("*", fn(x3080 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3075 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3076 = @tactics.mp_tac(x3075)
      fn(x3077 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3076(x3077)
      }
    })(((x3079 : @kernel.Thm) => @bool.spec(t3078, x3079))(x3080))
  }), t3081), t3082), t3083), t3084), @calc_rat.asm_real_arith_tac)
  let t3086 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@realax.real_div(), @realax.real_inv_0(), @realarith.real_mul_rid()])), @calc_rat.asm_real_arith_tac), t3085])
  let t3074 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t3073 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3072 = @simp.asm_rewrite_tac(@list.List([]))
  let t3071 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3064 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3065 = @tactics.assume_tac(x3064)
    fn(x3066 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3065(x3066)
    }
  }, fn(x3068 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3069 = ((x3067 : @kernel.Thm) => @tactics.label_tac("*", x3067))(x3068)
    fn(x3070 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3069(x3070)
    }
  }))
  let t3063 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : Real)"))
  let t3062 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3087 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_bounded_pos(), @sets.forall_in_image()])), t3062), t3063), t3071), t3072), t3073), @tactics.disch_tac), t3074), t3086)
  let t3061 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t3060 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t3059 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3058 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t3057 = @simp.rewrite_tac(@list.List([@metric.real_compact_interval()]))
  let t3056 = @tactics.match_mp_tac(@realanalysis.real_compact_continuous_image())
  let t3088 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.real_compact_imp_bounded()), t3056), t3057), t3058), t3059), t3060), t3061), @realanalysis.real_differentiable_tac), t3087])
  let t3055 = @tactics.subgoal_then(@term_syntax.parse_term("real_bounded(IMAGE((x : Real) => real_of_num(1) + pow(x / real_of_num(2), 2), real_interval([(-pi, pi)])))"), fn(x3052 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3053 = @tactics.mp_tac(x3052)
    fn(x3054 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3053(x3054)
    }
  })
  let t3046 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t3045 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t3044 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3043 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t3042 = @simp.rewrite_tac(@list.List([@metric.real_closed_univ(), @metric.real_closed_real_interval()]))
  let t3041 = @tactics.match_mp_tac(@realanalysis.real_continuous_imp_real_measurable_on_closed_subset())
  let t3040 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing(), @sets.sing_gspec()]))
  let t3047 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_div()), t3040), @tactics.conj_tac), t3041), t3042), t3043), t3044), t3045), t3046), @realanalysis.real_differentiable_tac), @tactics.all_tac])
  let t3039 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_add(), @realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_const()]))
  let t3038 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t3037 = @tactics.match_mp_tac(absolutely_real_integrable_mul_dirichlet_kernel())
  let t3036 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval()])), @calc_rat.asm_real_arith_tac)])
  let t3035 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-pi, pi)])"))
  let t3034 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_on_subinterval())
  let t3048 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable()), t3034), t3035), @tactics.conj_tac), t3036), t3037), t3038), t3039), @tactics.conj_tac), t3047)
  let t3033 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) / real_of_num(2)"), @transcendentals.sin_eq_0_pi()))
  let t3032 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) && !((y : Real) == real_of_num(0)) → (a : Real) / x == a / (real_of_num(2) * y) * (real_of_num(2) * y / x)")))
  let t3031 = @simp.asm_rewrite_tac(@list.List([dirichlet_kernel()]))
  let t3030 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_sing(), @misc.in_real_interval(), @realax.real_mul_assoc()]))
  let t3049 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t3030), @tactics.strip_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3031), t3032), t3033), @calc_rat.asm_real_arith_tac), t3048])
  let t3029 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing()]))
  let t3028 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t3027 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => dirichlet_kernel((n : Num), x) * (real_of_num(2) * sin(x / real_of_num(2)) / x * ((f : (Real) -> Real)((t : Real) + x) + f(t - x) - real_of_num(2) * (l : Real)))"))
  let t3050 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(@realanalysis.real_integrable_spike())), t3027), t3028), t3029), @tactics.conj_tac), t3049)
  let t3026 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_add(), @realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_const()]))
  let t3025 = @tactics.match_mp_tac(absolutely_real_integrable_mul_dirichlet_kernel())
  let t3024 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval()])), @calc_rat.asm_real_arith_tac)])
  let t3023 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-pi, pi)])"))
  let t3022 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_on_subinterval())
  let t3021 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable())
  let t3051 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(real_integrable_dirichlet_kernel_mul_expand())])), t3021), t3022), t3023), @tactics.conj_tac), t3024), t3025), t3026), t3050])
  let t3020 = @tactics.match_mp_tac(@realanalysis.real_integral_sub())
  let t3019 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("sin((y : Real)) * (((a : Real) - (b : Real)) / (x : Real)) == sin(y) / x * (a - b)"))]))
  let t3018 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((inv((y : Real)) - inv((x : Real))) * (b : Real)) == a / y * b - a / x * b"))]))
  let t3017 = @simp.rewrite_tac(@list.List([real_integral_dirichlet_kernel_mul_expand()]))
  let t3016 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3170 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t3016), @tactics.disch_tac), t3017), t3018), t3019), t3020), @tactics.conj_tac), t3051), t3055), t3088), t3169])
  let t3015 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3014 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_integral(real_interval([(real_of_num(0), (d : Real))]), (x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * ((inv(real_of_num(2) * sin(x / real_of_num(2))) - inv(x)) * ((f : (Real) -> Real)((t : Real) + x) + f(t - x) - real_of_num(2) * (l : Real))))"))
  let t3013 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg()]))
  let t3011 = @equal.gsym(@realax.real_sub())
  let t3012 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_on()), t3011]))
  let t3010 = @simp.gen_rewrite_tac(fn(x3009 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3003 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3004 = @equal.land_conv(x3003)
      fn(x3005 : @kernel.Term) -> @kernel.Thm raise {
        s3004(x3005)
      }
    })((fn(x3006 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3007 = @equal.once_depth_conv(x3006)
      fn(x3008 : @kernel.Term) -> @kernel.Thm raise {
        s3007(x3008)
      }
    })(x3009))
  }, @list.List([@equal.gsym(@realanalysis.real_integrable_reflect())]))
  let t3002 = @simp.gen_rewrite_tac(fn(x2999 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3000 = @equal.land_conv(x2999)
    fn(x3001 : @kernel.Term) -> @kernel.Thm raise {
      s3000(x3001)
    }
  }, @list.List([@realanalysis.absolutely_real_integrable_on()]))
  let t2998 = @tactics.disch_then(fn(x2995 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2995
    let t2997 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(th), t2997)
  })
  let t2994 = @simp.gen_rewrite_tac(fn(x2993 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2987 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2988 = @equal.land_conv(x2987)
      fn(x2989 : @kernel.Term) -> @kernel.Thm raise {
        s2988(x2989)
      }
    })((fn(x2990 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2991 = @equal.once_depth_conv(x2990)
      fn(x2992 : @kernel.Term) -> @kernel.Thm raise {
        s2991(x2992)
      }
    })(x2993))
  }, @list.List([@realax.real_add_sym()]))
  let t2986 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t2982 = @term_syntax.parse_term("(t : Real)")
  let t2983 = @term_syntax.parse_term("pi")
  let t2984 = @term_syntax.parse_term("-pi")
  let t2985 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2984, t2983, t2982]), absolutely_real_integrable_periodic_offset()))
  let t2981 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t2980 = @simp.rewrite_tac(@list.List([]))
  let t2979 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eq())
  let t2978 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2977 = @simp.asm_rewrite_tac(@list.List([]))
  let t2973 = @term_syntax.parse_term("(d : Real)")
  let t2974 = @term_syntax.parse_term("(l : Real)")
  let t2975 = @term_syntax.parse_term("(t : Real)")
  let t2976 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2975, t2974, t2973]), fourier_sum_limit_dirichlet_kernel_part()))
  let t3171 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2976), t2977), t2978), @tactics.ap_term_tac), t2979), t2980), t2981), t2985), t2986), t2994), t2998), t3002), t3010), t3012), t3013), @tactics.disch_tac), t3014), t3015), @tactics.conj_tac), t3170)
  fourier_sum_limit_sine_part_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ t : Real, ∀ l : Real, ∀ d : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && real_of_num(0) < d && d <= pi → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), l, sequentially) == op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(real_of_num(0), d)]), (x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * ((f(t + x) + f(t - x) - real_of_num(2) * l) / x)), real_of_num(0), sequentially)"), t3171))
}

///|
let fourier_sum_limit_sine_part_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_LIMIT_SINE_PART")

///|
/// `FOURIER_SUM_LIMIT_SINE_PART`
pub fn fourier_sum_limit_sine_part() -> @kernel.Thm {
  fourier_sum_limit_sine_part_c.get()
}

///|
/// FOURIER_DINI_TEST
fn step_150() -> Unit raise {
  let t3412 = @simp.rewrite_tac(@list.List([@real.real_abs_pos(), @transcendentals.sin_bound()]))
  let t3411 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t3410 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) * (y : Real) <= y) == (x * y <= real_of_num(1) * y)"))]))
  let t3409 = @simp.asm_rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t3408 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t3407 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc()]))
  let t3406 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3405 = @simp.simp_tac(@list.List([@real.real_abs_mul(), @real.real_abs_div(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x"))]))
  let t3404 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3413 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t3404), t3405), t3406), t3407), t3408), t3409), t3410), t3411), t3412)
  let t3403 = @simp.asm_rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t3401 = @term_syntax.parse_term("(d : Real)")
  let t3402 = @tactics.map_every(fn(x3398 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3399 = @tactics.exists_tac(x3398)
    fn(x3400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3399(x3400)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0)"), t3401]))
  let t3414 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_subinterval()), t3402), t3403), @calc_rat.asm_real_arith_tac), t3413])
  let t3397 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t3396 = @tactics.match_mp_tac(@realanalysis.real_integral_abs_bound_integral())
  let t3394 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) < (e : Real) / real_of_num(2) → abs((y : Real)) <= x → abs(y) < e / real_of_num(2)")))
  let t3415 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3394(x3395))
  }), t3396), t3397), @tactics.conj_tac), t3414)
  let t3393 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_imp_integrable(), @realarith.real_lt_imp_le()]))
  let t3392 = @tactics.exists_tac(@term_syntax.parse_term("(dd : Real)"))
  let t3391 = @tactics.match_mp_tac(@realanalysis.real_integrable_combine())
  let t3390 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t3416 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integral_combine()), t3390), t3391), t3392), t3393), t3415])
  let t3389 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), (dd : Real))]), (f : (Real) -> Real)) + real_integral(real_interval([(dd, pi)]), f) == real_integral(real_interval([(real_of_num(0), pi)]), f) && abs(real_integral(real_interval([(real_of_num(0), dd)]), f)) < (e : Real) / real_of_num(2) → abs(real_integral(real_interval([(dd, pi)]), f) - real_of_num(0)) < e / real_of_num(2) → abs(real_integral(real_interval([(real_of_num(0), pi)]), f)) < e")))
  let t3388 = @simp.asm_rewrite_tac(@list.List([]))
  let t3384 = @term_syntax.parse_term("(n : Num)")
  let t3387 = @tactics.first_x_assum(fn(x3386 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3382 = @tactics.mp_tac(x3381)
      fn(x3383 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3382(x3383)
      }
    })(((x3385 : @kernel.Thm) => @bool.spec(t3384, x3385))(x3386))
  })
  let t3380 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3379 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t3378 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3377 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t3373 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t3376 = @tactics.disch_then(fn(x3375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3370 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3371 = @tactics.mp_tac(x3370)
      fn(x3372 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3371(x3372)
      }
    })(((x3374 : @kernel.Thm) => @bool.spec(t3373, x3374))(x3375))
  })
  let t3369 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t3368 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - (l : Real) + ((y : Real) - l) == x + y - real_of_num(2) * l"))]))
  let t3367 = @simp.rewrite_tac(@list.List([@equal.gsym(@misc.in_real_interval()), @realanalysis.real_integral_restrict_univ()]))
  let t3366 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (dd : Real) && dd <= pi → ((real_of_num(0) <= (x : Real) && x <= pi) && !(abs(x) < dd)) == (dd <= x && x <= pi)"))]))
  let t3365 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3364 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(if (p : Bool) { if (q : Bool) { (x : Real) } else { real_of_num(0) } } else { real_of_num(0) }) == (if p && q { x } else { real_of_num(0) })"))]))
  let t3363 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_integral_restrict_univ())]))
  let t3362 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@calc_int.real_mul_rzero()]), @term_syntax.parse_term("(s : Real) * (if (p : Bool) { real_of_num(0) } else { (y : Real) }) == (if !p { s * y } else { real_of_num(0) })"))]))
  let t3361 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t3360 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_add_rdistrib())]))
  let t3359 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(if (p : Bool) { real_of_num(0) } else { (a : Real) }) - (if p { real_of_num(0) } else { -(b : Real) }) == (if p { real_of_num(0) } else { a + b })"))]))
  let t3358 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_neg(), @calc_int.real_mul_rneg(), @calc_int.real_neg_neg()]))
  let t3356 = @equal.gsym(@real.real_sub_ldistrib())
  let t3357 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_sub()), t3356]))
  let t3355 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_neg(), @calc_int.real_mul_rneg(), @transcendentals.sin_neg(), @calc_int.real_mul_lneg()]))
  let t3351 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3350 = @simp.asm_simp_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_lt_imp_le(), @calc_int.real_abs_num(), @real.real_abs_inv()]))
  let t3349 = @simp.rewrite_tac(@list.List([@realarith.real_not_lt()]))
  let t3348 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3347 = @tactics.exists_tac(@term_syntax.parse_term("inv((dd : Real))"))
  let t3352 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image(), @sets.in_univ()])), t3347), t3348), t3349), @class.cond_cases_tac), t3350), t3351), @calc_rat.asm_real_arith_tac)
  let t3344 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_imp_real_measurable_on_closed_subset(), @metric.real_closed_real_interval(), @realanalysis.real_continuous_on_const(), @realanalysis.real_continuous_on_id(), @sets.sing_gspec(), @realanalysis.real_negligible_sing(), @metric.real_closed_univ()]))
  let t3343 = @tactics.match_mp_tac(@realanalysis.real_measurable_on_div())
  let t3342 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((x : Real)) == real_of_num(1) / x"))]))
  let t3341 = @simp.rewrite_tac(@list.List([]))
  let t3345 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x3338 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3339 = @equal.land_conv(x3338)
    fn(x3340 : @kernel.Term) -> @kernel.Thm raise {
      s3339(x3340)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())])), t3341), t3342), t3343), t3344)
  let t3337 = @simp.rewrite_tac(@list.List([@equal.gsym(@misc.real_interval()), @realanalysis.real_lebesgue_measurable_interval()]))
  let t3336 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) < (d : Real)) == (-d < x && x < d)"))]))
  let t3335 = @simp.rewrite_tac(@list.List([@realanalysis.real_lebesgue_measurable_compl()]))
  let t3346 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | !(P : (_) -> Bool)(x)} == DIFF(UNIV, {(x : _) | P(x)})"))])), t3335), t3336), t3337), t3345])
  let t3334 = @simp.rewrite_tac(@list.List([@realanalysis.real_measurable_on_0()]))
  let t3353 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_cases()), t3334), @tactics.conj_tac), t3346), t3352])
  let t3333 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_restrict_univ(), @realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_const()]))
  let t3332 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t3331 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@calc_int.real_mul_rzero(), @calc_int.real_mul_lzero()]), @term_syntax.parse_term("(if (P : (_) -> Bool)((x : _)) && (Q : (_) -> Bool)(x) { (a : (_) -> Real)(x) * (b : (_) -> Real)(x) } else { real_of_num(0) }) == (if Q(x) { a(x) } else { real_of_num(0) }) * (if P(x) { b(x) } else { real_of_num(0) })"))]))
  let t3330 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@realax.real_div())]))
  let t3329 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(if (P : (_) -> Bool)((x : _)) { if (Q : (_) -> Bool)(x) { real_of_num(0) } else { (a : (_) -> Real)(x) } } else { real_of_num(0) }) == (if P(x) && !Q(x) { a(x) } else { real_of_num(0) })"))]))
  let t3354 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_restrict_univ())])), t3329), t3330), t3331), t3332), t3333), @tactics.conj_tac), t3353), @tactics.all_tac])
  let t3328 = @simp.simp_tac(@list.List([real_integral_reflect_and_add(), @realanalysis.absolutely_real_integrable_imp_integrable(), fourier_products_integrable_strong()]))
  let t3327 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) => if abs(x) < (dd : Real) { real_of_num(0) } else { ((f : (Real) -> Real)((t : Real) + x) - (l : Real)) / x }"), riemann_lebesgue_sin_half()))
  let t3326 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3322 = @simp.rewrite_tac(@list.List([@transcendentals.sin_bound()]))
  let t3321 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t3323 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image()])), t3321), t3322)
  let t3320 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t3319 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t3318 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3317 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t3316 = @simp.rewrite_tac(@list.List([@metric.real_closed_univ(), @metric.real_closed_real_interval()]))
  let t3324 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_imp_real_measurable_on_closed_subset()), t3316), t3317), t3318), t3319), t3320), @realanalysis.real_differentiable_tac), t3323]))
  let t3315 = @simp.asm_rewrite_tac(@list.List([]))
  let t3314 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t3325 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3314), t3315), t3324), @tactics.all_tac])
  let t3313 = @tactics.subgoal_then(@term_syntax.parse_term("(∀ n : Num, absolutely_real_integrable_on((x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * (((f : (Real) -> Real)((t : Real) + x) + f(t - x) - real_of_num(2) * (l : Real)) / x), real_interval([(real_of_num(0), (dd : Real))]))) && (∀ n : Num, absolutely_real_integrable_on((x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * ((f(t + x) + f(t - x) - real_of_num(2) * l) / x), real_interval([(dd, pi)])))"), @tactics.strip_assume_tac)
  let t3308 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t3307 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_add(), @realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_const()]))
  let t3306 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-pi, pi)])"))
  let t3309 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_on_subinterval()), t3306), t3307), t3308), @calc_rat.asm_real_arith_tac)
  let t3305 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3304 = @simp.rewrite_tac(@list.List([@misc.in_real_interval(), @real.real_abs_inv()]))
  let t3303 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3302 = @tactics.exists_tac(@term_syntax.parse_term("inv((dd : Real))"))
  let t3310 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image()])), t3302), t3303), t3304), @tactics.strip_tac), t3305), @calc_rat.asm_real_arith_tac)
  let t3301 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_imp_real_measurable_on_closed_subset(), @metric.real_closed_real_interval(), @realanalysis.real_continuous_on_const(), @realanalysis.real_continuous_on_id(), @sets.sing_gspec(), @realanalysis.real_negligible_sing(), @metric.real_closed_univ()]))
  let t3300 = @tactics.match_mp_tac(@realanalysis.real_measurable_on_div())
  let t3299 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((x : Real)) == real_of_num(1) / x"))]))
  let t3298 = @simp.rewrite_tac(@list.List([]))
  let t3311 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x3295 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3296 = @equal.land_conv(x3295)
    fn(x3297 : @kernel.Term) -> @kernel.Thm raise {
      s3296(x3297)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())])), t3298), t3299), t3300), t3301), t3310, t3309])
  let t3294 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3293 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t3312 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@realax.real_div())])), t3293), t3294), t3311), @tactics.all_tac])
  let t3292 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((x : Real) => ((f : (Real) -> Real)((t : Real) + x) + f(t - x) - real_of_num(2) * (l : Real)) / x, real_interval([((dd : Real), pi)]))"), fn(x3289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3290 = @tactics.assume_tac(x3289)
    fn(x3291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3290(x3291)
    }
  })
  let t3284 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval()])), @calc_rat.asm_real_arith_tac)
  let t3283 = @simp.simp_tac(@list.List([@realax.real_abs()]))
  let t3282 = @simp.simp_tac(@list.List([@real.real_abs_div(), @misc.in_real_interval(), @sets.in_diff()]))
  let t3281 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_empty()]))
  let t3280 = @tactics.exists_tac(@term_syntax.parse_term("({} : (Real) -> Bool)"))
  let t3278 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) → (r : Bool)) == (q → p → r)"))]))(@realanalysis.real_integrable_spike()))
  let t3285 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3279 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3278(x3279))
  }), t3280), t3281), t3282), t3283), t3284])
  let t3276 = @term_syntax.parse_term("(d : Real)")
  let t3277 = @tactics.map_every(fn(x3273 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3274 = @tactics.exists_tac(x3273)
    fn(x3275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3274(x3275)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0)"), t3276]))
  let t3286 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_subinterval()), t3277), @tactics.conj_tac), t3285)
  let t3272 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t3271 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_imp_integrable(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_sub(), @realanalysis.real_integrable_const()]))
  let t3269 = @term_syntax.parse_term("pi")
  let t3270 = @tactics.map_every(fn(x3266 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3267 = @tactics.exists_tac(x3266)
    fn(x3268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3267(x3268)
    }
  }, @list.List([@term_syntax.parse_term("-pi"), t3269]))
  let t3265 = @tactics.match_mp_tac(@realanalysis.real_integrable_subinterval())
  let t3264 = @tactics.match_mp_tac(@realanalysis.integrable_imp_real_measurable())
  let t3263 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_imp_real_measurable_on_closed_subset(), @metric.real_closed_real_interval(), @realanalysis.real_continuous_on_const(), @realanalysis.real_continuous_on_id(), @sets.sing_gspec(), @realanalysis.real_negligible_sing(), @metric.real_closed_univ()]))
  let t3287 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_div()), t3263), t3264), t3265), t3270), t3271), t3272), @calc_rat.asm_real_arith_tac), t3286])
  let t3288 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_real_measurable()])), @tactics.conj_tac), t3287), @tactics.all_tac])
  let t3262 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((x : Real) => ((f : (Real) -> Real)((t : Real) + x) + f(t - x) - real_of_num(2) * (l : Real)) / x, real_interval([(real_of_num(0), (dd : Real))]))"), fn(x3259 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3260 = @tactics.assume_tac(x3259)
    fn(x3261 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3260(x3261)
    }
  })
  let t3258 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg()]))
  let t3256 = @equal.gsym(@realax.real_sub())
  let t3257 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_on()), t3256]))
  let t3255 = @simp.gen_rewrite_tac(fn(x3254 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3248 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3249 = @equal.land_conv(x3248)
      fn(x3250 : @kernel.Term) -> @kernel.Thm raise {
        s3249(x3250)
      }
    })((fn(x3251 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3252 = @equal.once_depth_conv(x3251)
      fn(x3253 : @kernel.Term) -> @kernel.Thm raise {
        s3252(x3253)
      }
    })(x3254))
  }, @list.List([@equal.gsym(@realanalysis.real_integrable_reflect())]))
  let t3247 = @simp.gen_rewrite_tac(fn(x3244 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3245 = @equal.land_conv(x3244)
    fn(x3246 : @kernel.Term) -> @kernel.Thm raise {
      s3245(x3246)
    }
  }, @list.List([@realanalysis.absolutely_real_integrable_on()]))
  let t3243 = @tactics.disch_then(fn(x3240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3240
    let t3242 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(th), t3242)
  })
  let t3239 = @simp.gen_rewrite_tac(fn(x3238 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3232 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3233 = @equal.land_conv(x3232)
      fn(x3234 : @kernel.Term) -> @kernel.Thm raise {
        s3233(x3234)
      }
    })((fn(x3235 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3236 = @equal.once_depth_conv(x3235)
      fn(x3237 : @kernel.Term) -> @kernel.Thm raise {
        s3236(x3237)
      }
    })(x3238))
  }, @list.List([@realax.real_add_sym()]))
  let t3231 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t3227 = @term_syntax.parse_term("(t : Real)")
  let t3228 = @term_syntax.parse_term("pi")
  let t3229 = @term_syntax.parse_term("-pi")
  let t3230 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t3229, t3228, t3227]), absolutely_real_integrable_periodic_offset()))
  let t3226 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3225 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (dd : Real) && dd <= (d : Real) && dd <= pi && dd < (k : Real)"), @tactics.strip_assume_tac)
  let t3224 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3223 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t3219 = @term_syntax.parse_term("(dd : Real)")
  let t3222 = @tactics.disch_then(fn(x3221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3217 = @tactics.mp_tac(x3216)
      fn(x3218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3217(x3218)
      }
    })(((x3220 : @kernel.Thm) => @bool.spec(t3219, x3220))(x3221))
  })
  let t3215 = @simp.abbrev_tac(@term_syntax.parse_term("(dd : Real) == min((d : Real), min((k : Real) / real_of_num(2), pi))"))
  let t3213 = @tactics.conjuncts_then2(fn(x3207 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3208 = @tactics.assume_tac(x3207)
    fn(x3209 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3208(x3209)
    }
  }, fn(x3210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3211 = @tactics.mp_tac(x3210)
    fn(x3212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3211(x3212)
    }
  })
  let t3214 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Real)"))(t3213))
  let t3206 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t3202 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t3205 = @tactics.disch_then(fn(x3204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3200 = @tactics.mp_tac(x3199)
      fn(x3201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3200(x3201)
      }
    })(((x3203 : @kernel.Thm) => @bool.spec(t3202, x3203))(x3204))
  })
  let t3198 = @simp.simp_tac(@list.List([@realanalysis.real_integral_null(), @realax.real_le_refl()]))
  let t3197 = @simp.asm_simp_tac(@list.List([@misc.in_real_interval(), @realax.real_le_refl(), @realarith.real_lt_imp_le()]))
  let t3193 = @term_syntax.parse_term("real_of_num(0)")
  let t3196 = @tactics.disch_then(fn(x3195 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3191 = @tactics.mp_tac(x3190)
      fn(x3192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3191(x3192)
      }
    })(((x3194 : @kernel.Thm) => @bool.spec(t3193, x3194))(x3195))
  })
  let t3189 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on()]))
  let t3186 = @drule.match_mp(@realanalysis.real_indefinite_integral_continuous_right())
  let t3188 = @tactics.first_assum(fn(x3187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3184 = @tactics.mp_tac(x3183)
      fn(x3185 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3184(x3185)
      }
    })(t3186(x3187))
  })
  let t3182 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t3181 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t3180 = @tactics.disch_then(fn(x3177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3178 = @tactics.subst1_tac(x3177)
    fn(x3179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3178(x3179)
    }
  })
  let t3176 = @simp.asm_rewrite_tac(@list.List([@transcendentals.pi_pos(), @realax.real_le_refl()]))
  let t3172 = @term_syntax.parse_term("pi")
  let t3173 = @term_syntax.parse_term("(l : Real)")
  let t3174 = @term_syntax.parse_term("(t : Real)")
  let t3175 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t3174, t3173, t3172]), fourier_sum_limit_sine_part()))
  let t3417 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3175), t3176), t3180), t3181), t3182), @tactics.disch_tac), t3188), t3189), t3196), t3197), t3198), t3205), t3206), t3214), t3215), t3222), t3223), @tactics.ants_tac), t3224), t3225), t3226), t3230), t3231), t3239), t3243), t3247), t3255), t3257), t3258), @tactics.disch_tac), t3262), t3288), t3292), t3312), t3313), t3325), t3326), t3327), t3328), @tactics.ants_tac), t3354), t3355), t3357), t3358), t3359), t3360), t3361), t3362), t3363), t3364), t3365), t3366), t3367), t3368), t3369), t3376), t3377), t3378), t3379), @tactics.disch_tac), t3380), @tactics.disch_tac), t3387), t3388), t3389), @tactics.conj_tac), t3416)
  fourier_dini_test_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ t : Real, ∀ l : Real, ∀ d : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && real_of_num(0) < d && real_integrable_on((x : Real) => abs(f(t + x) + f(t - x) - real_of_num(2) * l) / x, real_interval([(real_of_num(0), d)])) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t)), l, sequentially)"), t3417))
}

///|
let fourier_dini_test_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_DINI_TEST")

///|
/// `FOURIER_DINI_TEST`
pub fn fourier_dini_test() -> @kernel.Thm {
  fourier_dini_test_c.get()
}

///|
/// REAL_INTEGRAL_SIN_OVER_X_BOUND
fn step_151() -> Unit raise {
  let t3429 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_on_null(), @realanalysis.real_integral_null(), @realarith.real_lt_imp_le(), @calc_int.real_abs_num(), @realarith.real_pos()]))
  let t3430 = @tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@real.real_not_le()]))), t3429)
  let t3426 = @simp.rewrite_tac(@list.List([@transcendentals.cos_bound()]))
  let t3425 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= real_of_num(1) && abs((y : Real)) <= real_of_num(1) → abs(-y - -x) <= real_of_num(2)")))
  let t3424 = @simp.asm_rewrite_tac(@list.List([]))
  let t3427 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()])), @tactics.strip_tac), t3424), t3425), t3426)
  let t3423 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3428 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3423), @realanalysis.real_diff_tac), @calc_rat.real_arith_tac), t3427])
  let t3422 = @simp.rewrite_tac(@list.List([]))
  let t3419 = @term_syntax.parse_term("(b : Real)")
  let t3420 = @term_syntax.parse_term("(a : Real)")
  let t3421 = @term_syntax.parse_term("(x : Real) => sin(x)")
  let t3431 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => -cos(x)"), t3421, t3420, t3419]), @realanalysis.real_fundamental_theorem_of_calculus())), t3422), @tactics.ants_tac), t3428), t3430])
  let t3418 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) <= (b : Real)"))
  let t3432 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t3418), t3431)
  let lemma0 = @tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, real_integrable_on((x : Real) => sin(x), real_interval([(a, b)])) && abs(real_integral(real_interval([(a, b)]), (x : Real) => sin(x))) <= real_of_num(2)"), t3432)
  let t3464 = @tactics.match_mp_tac(@real.real_le_div())
  let t3463 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_on_null(), @realanalysis.real_integral_null(), @realarith.real_lt_imp_le(), @calc_int.real_abs_num(), @realarith.real_pos()]))
  let t3465 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@real.real_not_le()]))), t3463), t3464), @calc_rat.asm_real_arith_tac)
  let t3460 = @simp.asm_rewrite_tac(@list.List([@realax.real_abs(), @realax.real_le_refl(), @real.real_le_inv_eq()]))
  let t3459 = @simp.rewrite_tac(@list.List([@real.real_abs_pos(), lemma0]))
  let t3458 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3457 = @simp.asm_simp_tac(@list.List([@real.real_le_inv2(), @real.real_abs_mul()]))
  let t3456 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("inv((b : Real)) <= inv((a : Real)) && abs((x : Real)) <= inv(a) * real_of_num(2) && abs((y : Real)) <= inv(b) * real_of_num(2) → abs(x + y) <= real_of_num(4) / a")))
  let t3455 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_neg_add(), @calc_int.real_mul_lneg(), @calc_int.real_neg_neg()]))
  let t3454 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t3453 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(-inv((y : Real)) * (x : Real)) == x / y"))]))
  let t3450 = @drule.match_mp(@realanalysis.has_real_integral_neg())
  let t3452 = @tactics.disch_then(fn(x3451 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3447 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3448 = @tactics.mp_tac(x3447)
      fn(x3449 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3448(x3449)
      }
    })(t3450(x3451))
  })
  let t3446 = @tactics.conjuncts_then2(fn(x3440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3441 = @tactics.assume_tac(x3440)
    fn(x3442 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3441(x3442)
    }
  }, fn(x3443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3444 = @tactics.mp_tac(x3443)
    fn(x3445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3444(x3445)
    }
  })
  let t3461 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : Real)"))(t3446)), t3452), t3453), t3454), @tactics.strip_tac), t3455), t3456), t3457), @tactics.conj_tac), t3458), t3459), t3460), @calc_rat.asm_real_arith_tac)
  let t3439 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3438 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3462 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_le_neg2(), @misc.in_real_interval()])), t3438), t3439), @calc_rat.asm_real_arith_tac), t3461])
  let t3437 = @simp.asm_rewrite_tac(@list.List([@misc.real_interval_eq_empty(), @realarith.real_not_lt(), lemma0]))
  let t3434 = @term_syntax.parse_term("(b : Real)")
  let t3435 = @term_syntax.parse_term("(a : Real)")
  let t3436 = @term_syntax.parse_term("(x : Real) => -inv(x)")
  let t3466 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => sin(x)"), t3436, t3435, t3434]), @realanalysis.real_second_mean_value_theorem_full())), t3437), @tactics.ants_tac), t3462), t3465])
  let t3433 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) <= (b : Real)"))
  let t3467 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t3433), t3466)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, real_of_num(0) < a → real_integrable_on((x : Real) => sin(x) / x, real_interval([(a, b)])) && abs(real_integral(real_interval([(a, b)]), (x : Real) => sin(x) / x)) <= real_of_num(4) / a"), t3467)
  let t3487 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_le_square_abs())]))
  let t3486 = @simp.asm_simp_tac(@list.List([@real.real_pow_le()]))
  let t3485 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t3484 = @simp.asm_rewrite_tac(@list.List([@realax.real_abs(), @calc_rat.real_arith(@term_syntax.parse_term("(pow((x : Real), 5) / real_of_num(24) <= pow(x, 3) / real_of_num(6)) == (pow(x, 3) * pow(x, 2) <= pow(x, 3) * pow(real_of_num(2), 2))"))]))
  let t3483 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(e : Real) <= (t : Real) → abs(sin((x : Real)) - (x + -t)) <= e → sin(x) <= x")))
  let t3482 = @simp.simp_tac(@list.List([@real.real_pow_1(), @real.real_div_1(), @realax.real_pow(), @calc_int.real_mul_lneg(), @realax.real_mul_lid()]))
  let t3481 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @complexes.im_cx(), @real.real_abs_0(), @transcendentals.real_exp_0()]))
  let t3475 = @equal.gsym(@complexes.cx_sub())
  let t3476 = @equal.gsym(@complexes.cx_add())
  let t3477 = @equal.gsym(@complexes.cx_neg())
  let t3478 = @equal.gsym(@complexes.cx_div())
  let t3479 = @equal.gsym(@complexes.cx_mul())
  let t3480 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_pow()), t3479, t3478, t3477, t3476, t3475]))
  let t3474 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3473 = @simp.rewrite_tac(@list.List([@vectors.vsum_clauses_numseg(), @equal.gsym(@transcendentals.cx_sin())]))
  let t3472 = @tactics.conv_tac(@equal.top_depth_conv(@calc_num.num_conv))
  let t3470 = @term_syntax.parse_term("Cx((x : Real))")
  let t3471 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("1"), t3470]), @transcendentals.taylor_csin()))
  let t3469 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@transcendentals.sin_bounds(), @realax.real_le_total(), @realax.real_le_trans()]))])
  let t3468 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) <= real_of_num(1)"))
  let t3488 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3468), t3469), t3471), t3472), t3473), t3474), t3480), t3481), t3482), t3483), t3484), t3485), t3486), t3487), @calc_rat.asm_real_arith_tac)
  let lemma2 = @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → sin(x) <= x"), t3488)
  let t3493 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t3492 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi_le())
  let t3491 = @simp.asm_simp_tac(@list.List([lemma2]))
  let t3490 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) <= (x : Real) && real_of_num(0) <= s → abs(s) <= abs(x)")))
  let t3494 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_abs_div(), @real.real_le_ldiv_eq(), @realax.real_mul_lid(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && !(x == real_of_num(0)) → real_of_num(0) < abs(x)"))])), t3490), t3491), t3492), t3493), @calc_rat.asm_real_arith_tac)
  let t3495 = @list.List([@simp.asm_simp_tac(@list.List([@realax.real_div(), @calc_int.real_mul_rzero(), @realax.real_inv_0(), @calc_int.real_abs_num(), @realarith.real_pos()])), t3494])
  let t3489 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t3496 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t3489), t3495)
  let lemma3 = @tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x && x <= real_of_num(2) → abs(sin(x) / x) <= real_of_num(1)"), t3496)
  let t3523 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_on_null(), @realanalysis.real_integral_null(), @realarith.real_lt_imp_le(), @calc_int.real_abs_num(), @realarith.real_pos()]))
  let t3524 = @tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@real.real_not_le()]))), t3523)
  let t3519 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@realanalysis.real_integral_const()])), @calc_rat.asm_real_arith_tac)
  let t3518 = @tactics.match_mp_tac(lemma3)
  let t3517 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3516 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3515 = @simp.asm_rewrite_tac(@list.List([@realanalysis.real_integrable_const()]))
  let t3520 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integral_abs_bound_integral()), t3515), t3516), t3517), t3518), @calc_rat.asm_real_arith_tac), t3519])
  let t3514 = @tactics.exists_tac(@term_syntax.parse_term("real_integral(real_interval([((a : Real), (b : Real))]), (x : Real) => real_of_num(1))"))
  let t3521 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.match_mp_tac(@realax.real_le_trans())), t3514), @tactics.conj_tac), t3520)
  let t3511 = @tactics.match_mp_tac(lemma3)
  let t3510 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3512 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), t3510), t3511), @calc_rat.asm_real_arith_tac)
  let t3507 = @simp.rewrite_tac(@list.List([@sets.sing_gspec(), @realanalysis.real_negligible_sing()]))
  let t3506 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_id()]))
  let t3508 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.continuous_imp_real_measurable_on()), t3506)
  let t3505 = @simp.rewrite_tac(@list.List([lemma0]))
  let t3504 = @simp.gen_rewrite_tac(fn(x3501 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3502 = @equal.land_conv(x3501)
    fn(x3503 : @kernel.Term) -> @kernel.Thm raise {
      s3502(x3503)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t3509 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.integrable_imp_real_measurable()), t3504), t3505), t3508, t3507])
  let t3500 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3513 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_div()), t3500), t3509), t3512])
  let t3499 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_const()]))
  let t3498 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => real_of_num(1)"))
  let t3522 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), t3498), t3499), @tactics.conj_tac), t3513), t3521])
  let t3525 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b"))), @tactics.conj_tac), t3522), t3524])
  let t3497 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) <= (b : Real)"))
  let t3526 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t3497), t3525)
  let lemma4 = @tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, real_of_num(0) <= a && b <= real_of_num(2) → real_integrable_on((x : Real) => sin(x) / x, real_interval([(a, b)])) && abs(real_integral(real_interval([(a, b)]), (x : Real) => sin(x) / x)) <= real_of_num(2)"), t3526)
  let t3558 = @meson.asm_meson_tac(@list.List([lemma1, @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)"))]))
  let t3559 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x3555 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3556 = @equal.rand_conv(x3555)
    fn(x3557 : @kernel.Term) -> @kernel.Thm raise {
      s3556(x3557)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) == real_of_num(4) / real_of_num(2)"))])), t3558)
  let t3560 = @list.List([@meson.asm_meson_tac(@list.List([lemma4, @realax.real_le_refl()])), t3559])
  let t3554 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= real_of_num(2) && abs((y : Real)) <= real_of_num(2) → abs(x + y) <= real_of_num(4)")))
  let t3553 = @tactics.disch_then(fn(x3552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3550 = @tactics.subst1_tac(x3549)
      fn(x3551 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3550(x3551)
      }
    })(@equal.sym(x3552))
  })
  let t3548 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t3544 = @term_syntax.parse_term("real_of_num(2)")
  let t3545 = @term_syntax.parse_term("(b : Real)")
  let t3546 = @term_syntax.parse_term("(a : Real)")
  let t3547 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => sin(x) / x"), t3546, t3545, t3544]), @realanalysis.real_integral_combine()))
  let t3542 = @meson.asm_meson_tac(@list.List([lemma1, @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)"))]))
  let t3543 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([lemma4, @realax.real_le_refl()])), t3542])), @tactics.disch_tac])
  let t3541 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t3537 = @term_syntax.parse_term("real_of_num(2)")
  let t3538 = @term_syntax.parse_term("(b : Real)")
  let t3539 = @term_syntax.parse_term("(a : Real)")
  let t3540 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => sin(x) / x"), t3539, t3538, t3537]), @realanalysis.real_integrable_combine()))
  let t3536 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@real.real_not_le()])))
  let t3534 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) <= (a : Real) → real_of_num(0) < a"))]))
  let t3533 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t3532 = @simp.rewrite_tac(@list.List([]))
  let t3531 = @tactics.match_mp_tac(@theorems.mono_and())
  let t3530 = @term_syntax.parse_term("(b : Real)")
  let t3535 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real)"), t3530]), lemma1)), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3531), t3532), t3533), t3534), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3529 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(2) <= (a : Real)"))
  let t3528 = @list.List([@meson.asm_meson_tac(@list.List([lemma4, @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= real_of_num(2) → x <= real_of_num(4)"))])), @tactics.all_tac])
  let t3527 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Real) <= real_of_num(2)"))
  let t3561 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t3527), t3528), t3529), t3535), t3536), t3540), t3541), @tactics.ants_tac), t3543), t3547), t3548), t3553), t3554), @tactics.conj_tac), t3560)
  let lemma5 = @tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, real_of_num(0) <= a → real_integrable_on((x : Real) => sin(x) / x, real_interval([(a, b)])) && abs(real_integral(real_interval([(a, b)]), (x : Real) => sin(x) / x)) <= real_of_num(4)"), t3561)
  let t3602 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_on_null(), @realanalysis.real_integral_null(), @realarith.real_lt_imp_le(), @calc_int.real_abs_num(), @realarith.real_pos()]))
  let t3603 = @tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@real.real_not_le()]))), t3602)
  let t3601 = @simp.asm_rewrite_tac(@list.List([]))
  let t3600 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t3599 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_not_le()), @real.real_le_lmul_eq()]))
  let t3598 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @misc.real_interval_eq_empty()]))
  let t3595 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (c : Real) → c * (inv(c) * (i : Real)) == i && abs(c) == c"))
  let t3596 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (c : Real) → c * ((s : Real) * (inv(c) * inv((x : Real)))) == s * inv(x)"))
  let t3597 = @simp.asm_simp_tac(@list.List([@realanalysis.image_stretch_real_interval(), @real.real_le_inv_eq(), @realarith.real_lt_imp_le(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (c : Real) → inv(c) * (c * (a : Real)) == a")), @real.real_inv_mul(), @realax.real_div(), t3596, t3595]))
  let t3592 = @drule.match_mp(@realanalysis.has_real_integral_lmul())
  let t3589 = @term_syntax.parse_term("(c : Real)")
  let t3594 = @tactics.disch_then(fn(x3593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3591 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3586 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3587 = @tactics.mp_tac(x3586)
        fn(x3588 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3587(x3588)
        }
      })(((x3590 : @kernel.Thm) => @bool.spec(t3589, x3590))(x3591))
    })(t3592(x3593))
  })
  let t3585 = @simp.asm_simp_tac(@list.List([@real.real_lt_imp_nz(), @calc_int.real_add_rid(), @real.real_sub_rzero()]))
  let t3582 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_stretch()))
  let t3579 = @term_syntax.parse_term("(c : Real)")
  let t3584 = @tactics.disch_then(fn(x3583 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3577 = @tactics.mp_tac(x3576)
        fn(x3578 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3577(x3578)
        }
      })(((x3580 : @kernel.Thm) => @bool.spec(t3579, x3580))(x3581))
    })(t3582(x3583))
  })
  let t3575 = @simp.gen_rewrite_tac(fn(x3572 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3573 = @equal.land_conv(x3572)
    fn(x3574 : @kernel.Term) -> @kernel.Thm raise {
      s3573(x3574)
    }
  }, @list.List([@realanalysis.has_real_integral_integral()]))
  let t3571 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3565 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3566 = @tactics.mp_tac(x3565)
    fn(x3567 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3566(x3567)
    }
  }, fn(x3568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3569 = @tactics.assume_tac(x3568)
    fn(x3570 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3569(x3570)
    }
  }))
  let t3564 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_lt_imp_le()]))
  let t3563 = @term_syntax.parse_term("(c : Real) * (b : Real)")
  let t3604 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(c : Real) * (a : Real)"), t3563]), lemma5)), t3564), t3571), t3575), t3584), t3585), t3594), t3597), t3598), t3599), t3600), @tactics.strip_tac), t3601), t3603])
  let t3562 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) <= (b : Real)"))
  let t3605 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t3562), t3604)
  real_integral_sin_over_x_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, real_of_num(0) <= a && real_of_num(0) < c → real_integrable_on((x : Real) => sin(c * x) / x, real_interval([(a, b)])) && abs(real_integral(real_interval([(a, b)]), (x : Real) => sin(c * x) / x)) <= real_of_num(4)"), t3605))
}

///|
let real_integral_sin_over_x_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRAL_SIN_OVER_X_BOUND")

///|
/// `REAL_INTEGRAL_SIN_OVER_X_BOUND`
pub fn real_integral_sin_over_x_bound() -> @kernel.Thm {
  real_integral_sin_over_x_bound_c.get()
}

///|
/// FOURIER_JORDAN_BOUNDED_VARIATION
fn step_152() -> Unit raise {
  let t3609 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @misc.in_real_interval()]))
  let t3608 = @tactics.exists_tac(@term_syntax.parse_term("(d : Real)"))
  let t3607 = @simp.rewrite_tac(@list.List([@realanalysis.eventually_atreal()]))
  let t3606 = @tactics.match_mp_tac(@realanalysis.reallim_transform_withinreal_set())
  let t3610 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3606), t3607), t3608), t3609), @calc_rat.real_arith_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ l : Real, ∀ d : Real, real_of_num(0) < d → op_minus_minus_minus_gt(f, l, within(atreal(real_of_num(0)), real_interval([(real_of_num(0), d)]))) == op_minus_minus_minus_gt(f, l, within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x}))"), t3610)
  let t4135 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t4134 = @tactics.exists_tac(@term_syntax.parse_term("(k : Real)"))
  let t4133 = @tactics.match_mp_tac(@realanalysis.real_integrable_combine())
  let t4132 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t4131 = @tactics.match_mp_tac(@realanalysis.real_integral_combine())
  let t4130 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t4129 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (y : Real) == (z : Real) → abs(x) <= (e : Real) / real_of_num(2) → abs(y) < e / real_of_num(2) → abs(z) < e")))
  let t4124 = @term_syntax.parse_term("(n : Num)")
  let t4126 = @tactics.conjuncts_then2(fn(x4118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4119 = @tactics.assume_tac(x4118)
    fn(x4120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4119(x4120)
    }
  }, fn(x4121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4122 = @tactics.mp_tac(x4121)
    fn(x4123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4122(x4123)
    }
  })
  let t4128 = @tactics.first_x_assum(fn(x4127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t4126(((x4125 : @kernel.Thm) => @bool.spec(t4124, x4125))(x4127))
  })
  let t4117 = @simp.rewrite_tac(@list.List([]))
  let t4116 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t4115 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4114 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t4113 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t4112 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t4111 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t4107 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t4110 = @tactics.disch_then(fn(x4109 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4105 = @tactics.mp_tac(x4104)
      fn(x4106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4105(x4106)
      }
    })(((x4108 : @kernel.Thm) => @bool.spec(t4107, x4108))(x4109))
  })
  let t4103 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t4102 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_on())]))
  let t4101 = @simp.rewrite_tac(@list.List([@equal.gsym(@misc.in_real_interval()), @realanalysis.real_integral_restrict_univ(), @realanalysis.real_integrable_restrict_univ()]))
  let t4100 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, ((-pi <= x && x <= pi) && (k : Real) <= x && x <= (d : Real)) == (k <= x && x <= d)"), fn(x4098 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x4098
    @simp.rewrite_tac(@list.List([th_5]))
  })
  let t4097 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(if (P : Bool) { if (Q : Bool) { (x : Real) } else { real_of_num(0) } } else { real_of_num(0) }) == (if P && Q { x } else { real_of_num(0) })"))]))
  let t4096 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t4095 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@calc_int.real_mul_rzero()]), @term_syntax.parse_term("(if (P : Bool) { (s : Real) * (if (Q : Bool) { (a : Real) } else { real_of_num(0) }) } else { real_of_num(0) }) == (if P && Q { s * a } else { real_of_num(0) })"))]))
  let t4093 = @equal.gsym(@realanalysis.real_integrable_restrict_univ())
  let t4094 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_integral_restrict_univ()), t4093]))
  let t4092 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@calc_int.real_abs_num()]), @term_syntax.parse_term("abs(if (p : Bool) { (x : Real) } else { real_of_num(0) }) == (if p { abs(x) } else { real_of_num(0) })"))]))
  let t4091 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_on()]))
  let t4090 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Real) => if (k : Real) <= x && x <= (d : Real) { (h : (Real) -> Real)(x) / x } else { real_of_num(0) }"), riemann_lebesgue_sin_half()))
  let t4086 = @simp.rewrite_tac(@list.List([@transcendentals.sin_bound()]))
  let t4085 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t4087 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image()])), t4085), t4086)
  let t4084 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t4083 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t4082 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4081 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t4080 = @simp.rewrite_tac(@list.List([@metric.real_closed_univ(), @metric.real_closed_real_interval()]))
  let t4088 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_imp_real_measurable_on_closed_subset()), t4080), t4081), t4082), t4083), t4084), @realanalysis.real_differentiable_tac), t4087])
  let t4079 = @simp.asm_rewrite_tac(@list.List([]))
  let t4089 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())), t4079), @tactics.conj_tac), t4088), @tactics.all_tac])
  let t4078 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, absolutely_real_integrable_on((x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * ((h : (Real) -> Real)(x) / x), real_interval([((k : Real), (d : Real))]))"), fn(x4075 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4076 = @tactics.assume_tac(x4075)
    fn(x4077 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4076(x4077)
    }
  })
  let t4070 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t4069 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_add()]))
  let t4068 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-pi, pi)])"))
  let t4067 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_on_subinterval())
  let t4066 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_const()]))
  let t4065 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_sub())
  let t4071 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t4065), t4066), t4067), t4068), t4069), t4070), @calc_rat.asm_real_arith_tac)
  let t4064 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t4063 = @simp.rewrite_tac(@list.List([@real.real_abs_inv()]))
  let t4062 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4061 = @tactics.exists_tac(@term_syntax.parse_term("inv((k : Real))"))
  let t4072 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image(), @misc.in_real_interval()])), t4061), t4062), t4063), t4064), @calc_rat.asm_real_arith_tac)
  let t4060 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@misc.in_real_interval()])))
  let t4059 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_within_id()]))
  let t4058 = @tactics.match_mp_tac(@realanalysis.real_continuous_inv_withinreal())
  let t4057 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4056 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t4055 = @simp.rewrite_tac(@list.List([@metric.real_closed_real_interval()]))
  let t4054 = @tactics.match_mp_tac(@realanalysis.real_continuous_imp_real_measurable_on_closed_subset())
  let t4073 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x4051 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4052 = @equal.land_conv(x4051)
    fn(x4053 : @kernel.Term) -> @kernel.Thm raise {
      s4052(x4053)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())])), t4054), t4055), t4056), t4057), t4058), t4059), t4060), @calc_rat.asm_real_arith_tac), t4072, t4071])
  let t4050 = @tactics.repeat_tac(@tactics.conj_tac)
  let t4049 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t4074 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@realax.real_div())])), t4049), t4050), t4073), @tactics.all_tac])
  let t4048 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((x : Real) => (h : (Real) -> Real)(x) / x, real_interval([((k : Real), (d : Real))]))"), fn(x4045 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4046 = @tactics.assume_tac(x4045)
    fn(x4047 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4046(x4047)
    }
  })
  let t4044 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg()]))
  let t4042 = @equal.gsym(@realax.real_sub())
  let t4043 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_on()), t4042]))
  let t4041 = @simp.gen_rewrite_tac(fn(x4040 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x4034 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4035 = @equal.land_conv(x4034)
      fn(x4036 : @kernel.Term) -> @kernel.Thm raise {
        s4035(x4036)
      }
    })((fn(x4037 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4038 = @equal.once_depth_conv(x4037)
      fn(x4039 : @kernel.Term) -> @kernel.Thm raise {
        s4038(x4039)
      }
    })(x4040))
  }, @list.List([@equal.gsym(@realanalysis.real_integrable_reflect())]))
  let t4033 = @simp.gen_rewrite_tac(fn(x4030 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4031 = @equal.land_conv(x4030)
    fn(x4032 : @kernel.Term) -> @kernel.Thm raise {
      s4031(x4032)
    }
  }, @list.List([@realanalysis.absolutely_real_integrable_on()]))
  let t4029 = @tactics.disch_then(fn(x4026 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x4026
    let t4028 = @tactics.mp_tac(th_4)
    @tactics.then_tac(@tactics.assume_tac(th_4), t4028)
  })
  let t4025 = @simp.gen_rewrite_tac(fn(x4024 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x4018 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4019 = @equal.land_conv(x4018)
      fn(x4020 : @kernel.Term) -> @kernel.Thm raise {
        s4019(x4020)
      }
    })((fn(x4021 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4022 = @equal.once_depth_conv(x4021)
      fn(x4023 : @kernel.Term) -> @kernel.Thm raise {
        s4022(x4023)
      }
    })(x4024))
  }, @list.List([@realax.real_add_sym()]))
  let t4017 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t4013 = @term_syntax.parse_term("(t : Real)")
  let t4014 = @term_syntax.parse_term("pi")
  let t4015 = @term_syntax.parse_term("-pi")
  let t4016 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t4015, t4014, t4013]), absolutely_real_integrable_periodic_offset()))
  let t4011 = @simp.asm_simp_tac(@list.List([real_integral_sin_over_x_bound(), @realarith.real_lt_imp_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1) / real_of_num(2)"))]))
  let t4010 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@misc.in_real_interval()])))
  let t4009 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4008 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4007 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t4006 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (e : Real) / real_of_num(16) * real_of_num(4) && abs((y : Real)) <= e / real_of_num(16) * real_of_num(4) → abs(x - y) <= e / real_of_num(2)")))
  let t4005 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_sub(), @realanalysis.real_integral_sub()]))
  let t4004 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) * (((h : Real) - (h' : Real)) / (x : Real)) == s * (h / x) - s * (h' / x)"))]))
  let t4001 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c2 : Real)"))(@tactics.strip_assume_tac))
  let t4000 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t4002 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x3999 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3993 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3994 = @equal.land_conv(x3993)
      fn(x3995 : @kernel.Term) -> @kernel.Thm raise {
        s3994(x3995)
      }
    })((fn(x3996 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3997 = @equal.once_depth_conv(x3996)
      fn(x3998 : @kernel.Term) -> @kernel.Thm raise {
        s3997(x3998)
      }
    })(x3999))
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(h : Real) * ((s : Real) / (x : Real)) == s * (h / x)"))])), t4000), t4001)
  let t3991 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3990 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3989 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3992 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), t3989), t3990), t3991), @calc_rat.asm_real_arith_tac)
  let t3988 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3987 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3983 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(h : Real) < real_of_num(0) → (h' : Real) <= h → !(abs(h') < -h)")))
  let t3985 = @tactics.first_x_assum(fn(x3984 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3983(x3984))
  })
  let t3982 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t3978 = @term_syntax.parse_term("min((d : Real), min((x : Real), (dd : Real))) / real_of_num(2)")
  let t3981 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3973 = @tactics.assume_tac(x3972)
    fn(x3974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3973(x3974)
    }
  }, fn(x3980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3975 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3976 = @tactics.mp_tac(x3975)
      fn(x3977 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3976(x3977)
      }
    })(((x3979 : @kernel.Thm) => @bool.spec(t3978, x3979))(x3980))
  }))
  let t3971 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(dd : Real)"))(fn(x3968 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3969 = @tactics.mp_tac(x3968)
    fn(x3970 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3969(x3970)
    }
  }))
  let t3967 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t3963 = @term_syntax.parse_term("-(h2 : (Real) -> Real)((x : Real))")
  let t3966 = @tactics.disch_then(fn(x3965 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3960 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3961 = @tactics.mp_tac(x3960)
      fn(x3962 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3961(x3962)
      }
    })(((x3964 : @kernel.Thm) => @bool.spec(t3963, x3964))(x3965))
  })
  let t3959 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal(), @sets.in_elim_thm(), @real.real_sub_rzero()]))
  let t3958 = @tactics.undisch_tac(@term_syntax.parse_term("op_minus_minus_minus_gt((h2 : (Real) -> Real), real_of_num(0), within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x}))"))
  let t3986 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt())])), @tactics.disch_tac), t3958), t3959), t3966), t3967), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3971), t3981), t3982), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3985), @tactics.all_tac])
  let t3957 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3956 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t4003 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t3956), t3957), t3986), t3987), t3988), @calc_rat.asm_real_arith_tac), t3992])), t4002])
  let t3955 = @simp.asm_simp_tac(@list.List([real_integral_sin_over_x_bound(), @realax.real_le_refl(), @realax.real_add_lid(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1) / real_of_num(2)")), @calc_int.real_mul_lzero()]))
  let t3954 = @simp.asm_simp_tac(@list.List([@misc.real_interval_eq_empty(), @realarith.real_not_lt(), @realarith.real_lt_imp_le()]))
  let t3948 = @term_syntax.parse_term("(h2 : (Real) -> Real)((k : Real))")
  let t3949 = @term_syntax.parse_term("real_of_num(0)")
  let t3950 = @term_syntax.parse_term("(k : Real)")
  let t3951 = @term_syntax.parse_term("real_of_num(0)")
  let t3952 = @term_syntax.parse_term("(h2 : (Real) -> Real)")
  let t3953 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => sin((real_of_num((n : Num)) + real_of_num(1) / real_of_num(2)) * x) / x"), t3952, t3951, t3950, t3949, t3948]), @realanalysis.real_second_mean_value_theorem_gen_full()))
  let t3945 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c1 : Real)"))(@tactics.strip_assume_tac))
  let t3944 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t3946 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x3943 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3937 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3938 = @equal.land_conv(x3937)
      fn(x3939 : @kernel.Term) -> @kernel.Thm raise {
        s3938(x3939)
      }
    })((fn(x3940 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3941 = @equal.once_depth_conv(x3940)
      fn(x3942 : @kernel.Term) -> @kernel.Thm raise {
        s3941(x3942)
      }
    })(x3943))
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(h : Real) * ((s : Real) / (x : Real)) == s * (h / x)"))])), t3944), t3945)
  let t3935 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3934 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3933 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3936 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), t3933), t3934), t3935), @calc_rat.asm_real_arith_tac)
  let t3932 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3931 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3927 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(h : Real) < real_of_num(0) → (h' : Real) <= h → !(abs(h') < -h)")))
  let t3929 = @tactics.first_x_assum(fn(x3928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3927(x3928))
  })
  let t3926 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t3922 = @term_syntax.parse_term("min((d : Real), min((x : Real), (dd : Real))) / real_of_num(2)")
  let t3925 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3916 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3917 = @tactics.assume_tac(x3916)
    fn(x3918 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3917(x3918)
    }
  }, fn(x3924 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3919 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3920 = @tactics.mp_tac(x3919)
      fn(x3921 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3920(x3921)
      }
    })(((x3923 : @kernel.Thm) => @bool.spec(t3922, x3923))(x3924))
  }))
  let t3915 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(dd : Real)"))(fn(x3912 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3913 = @tactics.mp_tac(x3912)
    fn(x3914 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3913(x3914)
    }
  }))
  let t3911 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t3907 = @term_syntax.parse_term("-(h1 : (Real) -> Real)((x : Real))")
  let t3910 = @tactics.disch_then(fn(x3909 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3904 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3905 = @tactics.mp_tac(x3904)
      fn(x3906 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3905(x3906)
      }
    })(((x3908 : @kernel.Thm) => @bool.spec(t3907, x3908))(x3909))
  })
  let t3903 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal(), @sets.in_elim_thm(), @real.real_sub_rzero()]))
  let t3902 = @tactics.undisch_tac(@term_syntax.parse_term("op_minus_minus_minus_gt((h1 : (Real) -> Real), real_of_num(0), within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x}))"))
  let t3930 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt())])), @tactics.disch_tac), t3902), t3903), t3910), t3911), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3915), t3925), t3926), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3929), @tactics.all_tac])
  let t3901 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3900 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3947 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t3900), t3901), t3930), t3931), t3932), @calc_rat.asm_real_arith_tac), t3936])), t3946])
  let t3899 = @simp.asm_simp_tac(@list.List([real_integral_sin_over_x_bound(), @realax.real_le_refl(), @realax.real_add_lid(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1) / real_of_num(2)")), @calc_int.real_mul_lzero()]))
  let t3898 = @simp.asm_simp_tac(@list.List([@misc.real_interval_eq_empty(), @realarith.real_not_lt(), @realarith.real_lt_imp_le()]))
  let t3892 = @term_syntax.parse_term("(h1 : (Real) -> Real)((k : Real))")
  let t3893 = @term_syntax.parse_term("real_of_num(0)")
  let t3894 = @term_syntax.parse_term("(k : Real)")
  let t3895 = @term_syntax.parse_term("real_of_num(0)")
  let t3896 = @term_syntax.parse_term("(h1 : (Real) -> Real)")
  let t3897 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => sin((real_of_num((n : Num)) + real_of_num(1) / real_of_num(2)) * x) / x"), t3896, t3895, t3894, t3893, t3892]), @realanalysis.real_second_mean_value_theorem_gen_full()))
  let t3891 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3890 = @simp.asm_rewrite_tac(@list.List([]))
  let t3889 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Real)"))
  let t3888 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3886 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3885 = @tactics.replicate_tac(2, @tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t3884 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), min((k1 : Real), (k2 : Real))) / real_of_num(2)"))
  let t3883 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k2 : Real)"))(@tactics.strip_assume_tac))])
  let t3879 = @term_syntax.parse_term("(e : Real) / real_of_num(16)")
  let t3882 = @tactics.disch_then(fn(x3881 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3876 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3877 = @tactics.mp_tac(x3876)
      fn(x3878 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3877(x3878)
      }
    })(((x3880 : @kernel.Thm) => @bool.spec(t3879, x3880))(x3881))
  })
  let t3875 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k1 : Real)"))(@tactics.strip_assume_tac))])
  let t3871 = @term_syntax.parse_term("(e : Real) / real_of_num(16)")
  let t3874 = @tactics.disch_then(fn(x3873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3868 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3869 = @tactics.mp_tac(x3868)
      fn(x3870 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3869(x3870)
      }
    })(((x3872 : @kernel.Thm) => @bool.spec(t3871, x3872))(x3873))
  })
  let t3867 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal(), @sets.in_elim_thm(), @real.real_sub_rzero()]))
  let t3866 = @tactics.undisch_tac(@term_syntax.parse_term("op_minus_minus_minus_gt((h1 : (Real) -> Real), real_of_num(0), within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x}))"))
  let t3887 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_minus_minus_minus_gt((h2 : (Real) -> Real), real_of_num(0), within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x}))")), t3866), t3867), t3874), @tactics.ants_tac), t3875), t3882), @tactics.ants_tac), t3883), t3884), t3885), @tactics.conj_tac), t3886), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3865 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k : Real, real_of_num(0) < k && k < (d : Real) && abs((h1 : (Real) -> Real)(k)) < (e : Real) / real_of_num(16) && abs((h2 : (Real) -> Real)(k)) < e / real_of_num(16)"), fn(x3862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3863 = @tactics.mp_tac(x3862)
    fn(x3864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3863(x3864)
    }
  })
  let t3858 = @tactics.repeat_tac(@tactics.disch_tac)
  let t3857 = @simp.asm_simp_tac(@list.List([lemma]))
  let t3855 = @term_syntax.parse_term("op_minus_minus_minus_gt((h2 : (Real) -> Real), (l : Real), within(atreal(real_of_num(0)), real_interval([(real_of_num(0), (d : Real))])))")
  let t3856 = @tactics.map_every(fn(x3852 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3853 = @tactics.undisch_tac(x3852)
    fn(x3854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3853(x3854)
    }
  }, @list.List([@term_syntax.parse_term("op_minus_minus_minus_gt((h1 : (Real) -> Real), (l : Real), within(atreal(real_of_num(0)), real_interval([(real_of_num(0), (d : Real))])))"), t3855]))
  let t3851 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realanalysis.reallim_null())]))
  let t3850 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (l : Real) <= (y : Real) - l) == (x <= y)"))]))
  let t3849 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => (h2 : (Real) -> Real)(x) - (l : Real)"))
  let t3859 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(x : Real) => (h1 : (Real) -> Real)(x) - (l : Real)")), t3849), t3850), t3851), t3856), t3857), t3858), @calc_rat.real_arith_tac)
  let t3846 = @simp.asm_simp_tac(@list.List([lemma]))
  let t3844 = @term_syntax.parse_term("op_minus_minus_minus_gt((h2 : (Real) -> Real), (l' : Real), within(atreal(real_of_num(0)), real_interval([(real_of_num(0), (d : Real))])))")
  let t3845 = @tactics.map_every(fn(x3841 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3842 = @tactics.undisch_tac(x3841)
    fn(x3843 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3842(x3843)
    }
  }, @list.List([@term_syntax.parse_term("op_minus_minus_minus_gt((h1 : (Real) -> Real), (l : Real), within(atreal(real_of_num(0)), real_interval([(real_of_num(0), (d : Real))])))"), t3844]))
  let t3840 = @tactics.match_mp_tac(@realanalysis.reallim_sub())
  let t3839 = @simp.asm_rewrite_tac(@list.List([]))
  let t3847 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x3838 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3832 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3833 = @equal.rator_conv(x3832)
      fn(x3834 : @kernel.Term) -> @kernel.Thm raise {
        s3833(x3834)
      }
    })((fn(x3835 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3836 = @equal.land_conv(x3835)
      fn(x3837 : @kernel.Term) -> @kernel.Thm raise {
        s3836(x3837)
      }
    })(x3838))
  }, @list.List([@equal.gsym(@class.eta_ax())])), t3839), t3840), t3845), t3846)
  let t3831 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t3830 = @simp.rewrite_tac(@list.List([@sets.extension(), @class.not_forall_thm(), @sets.in_elim_thm(), @sets.in_sing()]))
  let t3829 = @list.List([@calc_rat.real_arith_tac, @tactics.disch_then(fn(x3826 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3827 = @tactics.subst1_tac(x3826)
    fn(x3828 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3827(x3828)
    }
  })])
  let t3825 = @simp.rewrite_tac(@list.List([@misc.is_realinterval(), @sets.in_elim_thm()]))
  let t3819 = @drule.part_match(fn(x3818 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x3818))
  }, @realanalysis.trivial_limit_within_realinterval())
  let t3848 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(fn(x3824 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x3823 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3821 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x3820 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x3815 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s3816 = @tactics.mp_tac(x3815)
            fn(x3817 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s3816(x3817)
            }
          })(t3819(x3820))
        })(@kernel.rand(x3821))
      })((fn(x3822 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x3822.1
      })(x3823))
    })(x3824)(x3824)
  }, t3825), @tactics.ants_tac), t3829), t3830), t3831), @calc_rat.real_arith_tac), t3847])
  let t3814 = @simp.asm_rewrite_tac(@list.List([]))
  let t3813 = @tactics.exists_tac(@term_syntax.parse_term("(h : (Real) -> Real)"))
  let t3812 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x})"), @realanalysis.reallim_unique()))
  let t3811 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_0())]))
  let t3860 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t3811), t3812), t3813), t3814), @tactics.conj_tac), t3848), t3859])
  let t3810 = @tactics.subgoal_then(@term_syntax.parse_term("(l' : Real) == (l : Real)"), fn(x3807 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3808 = @tactics.subst_all_tac(x3807)
    fn(x3809 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3808(x3809)
    }
  })
  let t3804 = @term_syntax.parse_term("(l' : Real)")
  let t3806 = @tactics.disch_then((x3805 : @kernel.Thm) => @tactics.x_choose_tac(t3804, x3805))
  let t3803 = @simp.asm_simp_tac(@list.List([@realarith.real_not_lt(), @realarith.real_lt_imp_le()]))
  let t3802 = @simp.asm_rewrite_tac(@list.List([@misc.ends_in_real_interval(), @misc.real_interval_eq_empty()]))
  let t3798 = @term_syntax.parse_term("real_of_num(0)")
  let t3799 = @term_syntax.parse_term("(d : Real)")
  let t3800 = @term_syntax.parse_term("real_of_num(0)")
  let t3801 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(h2 : (Real) -> Real)"), t3800, t3799, t3798]), @realanalysis.increasing_right_limit()))
  let t3795 = @term_syntax.parse_term("(l : Real)")
  let t3797 = @tactics.disch_then((x3796 : @kernel.Thm) => @tactics.x_choose_tac(t3795, x3796))
  let t3794 = @simp.asm_simp_tac(@list.List([@realarith.real_not_lt(), @realarith.real_lt_imp_le()]))
  let t3793 = @simp.asm_rewrite_tac(@list.List([@misc.ends_in_real_interval(), @misc.real_interval_eq_empty()]))
  let t3789 = @term_syntax.parse_term("real_of_num(0)")
  let t3790 = @term_syntax.parse_term("(d : Real)")
  let t3791 = @term_syntax.parse_term("real_of_num(0)")
  let t3792 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(h1 : (Real) -> Real)"), t3791, t3790, t3789]), @realanalysis.increasing_right_limit()))
  let t3787 = @term_syntax.parse_term("(h2 : (Real) -> Real)")
  let t3788 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(h1 : (Real) -> Real)"), t3787]))
  let t3786 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t3784 = @term_syntax.parse_term("(d : Real)")
  let t3785 = @term_syntax.parse_term("real_of_num(0)")
  let t3861 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(h : (Real) -> Real)"), t3785, t3784]), @realanalysis.has_bounded_real_variation_darboux())), t3786), t3788), @tactics.strip_tac), t3792), t3793), t3794), t3797), t3801), t3802), t3803), t3806), t3810), t3860), @tactics.all_tac])
  let t4012 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ h1 : (Real) -> Real, ∃ h2 : (Real) -> Real, (∀ x : Real, ∀ y : Real, IN(x, real_interval([(real_of_num(0), (d : Real))])) && IN(y, real_interval([(real_of_num(0), d)])) && x <= y → h1(x) <= h1(y)) && (∀ x : Real, ∀ y : Real, IN(x, real_interval([(real_of_num(0), d)])) && IN(y, real_interval([(real_of_num(0), d)])) && x <= y → h2(x) <= h2(y)) && op_minus_minus_minus_gt(h1, real_of_num(0), within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x})) && op_minus_minus_minus_gt(h2, real_of_num(0), within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x})) && (∀ x : Real, (h : (Real) -> Real)(x) == h1(x) - h2(x))"), @tactics.strip_assume_tac), t3861), t3865), t3887), t3888), t3889), @tactics.strip_tac), t3890), t3891), t3897), t3898), t3899), @tactics.ants_tac), t3947), t3953), t3954), t3955), @tactics.ants_tac), t4003), t4004), t4005), t4006), t4007), @tactics.conj_tac), t4008), t4009), t4010), t4011), @tactics.all_tac])
  let t3783 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k : Real, real_of_num(0) < k && k < (d : Real) && (∀ n : Num, real_integrable_on((x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * ((h : (Real) -> Real)(x) / x), real_interval([(real_of_num(0), k)])) && abs(real_integral(real_interval([(real_of_num(0), k)]), (x : Real) => sin((real_of_num(n) + real_of_num(1) / real_of_num(2)) * x) * (h(x) / x))) <= (e : Real) / real_of_num(2))"), @tactics.strip_assume_tac)
  let t3782 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t3781 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t3775 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t3774 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t3773 = @tactics.disch_then(fn(x3770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x3770
    let t3772 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : Real) + (x : Real)"), th_3))
    @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t3772)
  })
  let t3769 = @simp.asm_rewrite_tac(@list.List([]))
  let t3768 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3763 = @tactics.assume_tac(x3762)
    fn(x3764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3763(x3764)
    }
  }, fn(x3765 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3766 = @tactics.mp_tac(x3765)
    fn(x3767 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3766(x3767)
    }
  }))
  let t3761 = @tactics.x_gen_tac(@term_syntax.parse_term("(d1 : Real)"))
  let t3760 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3759 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3758 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t3757 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t3756 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t3755 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal()]))
  let t3754 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.reallim())]))
  let t3776 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x3753 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3751 = @tactics.mp_tac(x3750)
      fn(x3752 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3751(x3752)
      }
    })(@class.select_rule(x3753))
  }), t3754), t3755), t3756), t3757), t3758), t3759), t3760), t3761), t3768), t3769), t3773), t3774), t3775), @calc_rat.real_arith_tac)
  let t3749 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t3748 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t3747 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d1 : Real)"))(fn(x3738 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x3738
    let t3746 = @tactics.conjuncts_then2(fn(x3740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3741 = @tactics.assume_tac(x3740)
      fn(x3742 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3741(x3742)
      }
    }, fn(x3743 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3744 = @tactics.mp_tac(x3743)
      fn(x3745 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3744(x3745)
      }
    })(th_2)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("min((d0 : Real), (d1 : Real))")), t3746)
  }))
  let t3737 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval(), @sets.in_elim_thm()]))
  let t3736 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t3735 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t3734 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t3733 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal()]))
  let t3732 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : Real)"))
  let t3731 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3730 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3727 = @term_syntax.parse_term("(t : Real)")
  let t3728 = @term_syntax.parse_term("(t : Real) + (d0 : Real)")
  let t3729 = @term_syntax.parse_term("(t : Real) - (d0 : Real)")
  let t3777 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t3729, t3728, t3727]), @realanalysis.has_bounded_real_variation_right_limit())), t3730), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3731), t3732), t3733), t3734), t3735), t3736), t3737), t3747), t3748), t3749), @calc_rat.asm_real_arith_tac), t3776])
  let t3778 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ l : Real, op_minus_minus_minus_gt((f : (Real) -> Real), l, within(atreal((t : Real)), {(r : Real) | r >= t}))"), fn(x3724 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3725 = @tactics.mp_tac(x3724)
    fn(x3726 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3725(x3726)
    }
  }), t3777)
  let t3721 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t3720 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t3719 = @tactics.disch_then(fn(x3716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3716
    let t3718 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : Real) - (x : Real)"), th_1))
    @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t3718)
  })
  let t3715 = @simp.asm_rewrite_tac(@list.List([]))
  let t3714 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3708 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3709 = @tactics.assume_tac(x3708)
    fn(x3710 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3709(x3710)
    }
  }, fn(x3711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3712 = @tactics.mp_tac(x3711)
    fn(x3713 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3712(x3713)
    }
  }))
  let t3707 = @tactics.x_gen_tac(@term_syntax.parse_term("(d1 : Real)"))
  let t3706 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3705 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3704 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t3703 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t3702 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t3701 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal()]))
  let t3700 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.reallim())]))
  let t3722 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x3699 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3696 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3697 = @tactics.mp_tac(x3696)
      fn(x3698 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3697(x3698)
      }
    })(@class.select_rule(x3699))
  }), t3700), t3701), t3702), t3703), t3704), t3705), t3706), t3707), t3714), t3715), t3719), t3720), t3721), @calc_rat.real_arith_tac)
  let t3695 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t3694 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t3693 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d1 : Real)"))(fn(x3684 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3684
    let t3692 = @tactics.conjuncts_then2(fn(x3686 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3687 = @tactics.assume_tac(x3686)
      fn(x3688 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3687(x3688)
      }
    }, fn(x3689 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3690 = @tactics.mp_tac(x3689)
      fn(x3691 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3690(x3691)
      }
    })(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("min((d0 : Real), (d1 : Real))")), t3692)
  }))
  let t3683 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval(), @sets.in_elim_thm()]))
  let t3682 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t3681 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t3680 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t3679 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal()]))
  let t3678 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : Real)"))
  let t3677 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3676 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3673 = @term_syntax.parse_term("(t : Real)")
  let t3674 = @term_syntax.parse_term("(t : Real) + (d0 : Real)")
  let t3675 = @term_syntax.parse_term("(t : Real) - (d0 : Real)")
  let t3723 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t3675, t3674, t3673]), @realanalysis.has_bounded_real_variation_left_limit())), t3676), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3677), t3678), t3679), t3680), t3681), t3682), t3683), t3693), t3694), t3695), @calc_rat.asm_real_arith_tac), t3722])
  let t3779 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ l : Real, op_minus_minus_minus_gt((f : (Real) -> Real), l, within(atreal((t : Real)), {(l : Real) | l <= t}))"), fn(x3670 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3671 = @tactics.mp_tac(x3670)
    fn(x3672 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3671(x3672)
    }
  }), t3723), t3778])
  let t3669 = @tactics.match_mp_tac(@realanalysis.reallim_null_add())
  let t3668 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(f' : Real) + (f : Real) - real_of_num(2) * (((l : Real) + (l' : Real)) / real_of_num(2)) == f - l + (f' - l')"))]))
  let t3667 = @simp.expand_tac("s")
  let t3780 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t3667), t3668), t3669), @tactics.conj_tac), t3779), @tactics.all_tac])
  let t3666 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_minus_gt((h : (Real) -> Real), real_of_num(0), within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x}))"), fn(x3663 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3664 = @tactics.assume_tac(x3663)
    fn(x3665 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3664(x3665)
    }
  })
  let t3661 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3660 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (a' : Real) && (b' : Real) <= (b : Real) → a - b <= a' - b'")))
  let t3659 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3658 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t3657 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (s : Real) <= (y : Real) - s) == (x <= y)")), @real.real_le_radd()]))
  let t3656 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => (f2 : (Real) -> Real)((t : Real) + x) - (f1 : (Real) -> Real)(t - x) + (s : Real)"))
  let t3655 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => (f1 : (Real) -> Real)((t : Real) + x) - (f2 : (Real) -> Real)(t - x) - (s : Real)"))
  let t3653 = @term_syntax.parse_term("(f2 : (Real) -> Real)")
  let t3654 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f1 : (Real) -> Real)"), t3653]))
  let t3652 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @misc.in_real_interval()]))
  let t3651 = @simp.rewrite_tac(@list.List([@realanalysis.has_bounded_real_variation_darboux()]))
  let t3650 = @simp.expand_tac("h")
  let t3648 = @simp.gen_rewrite_rule(fn(x3647 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3647
  }, @list.List([@realanalysis.has_bounded_real_variation_darboux()]))
  let t3662 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3649 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3645 = @tactics.mp_tac(x3644)
      fn(x3646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3645(x3646)
      }
    })(t3648(x3649))
  }), t3650), t3651), t3652), t3654), @tactics.strip_tac), t3655), t3656), t3657), t3658), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t3659), t3660), @tactics.conj_tac), t3661), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3643 = @tactics.subgoal_then(@term_syntax.parse_term("has_bounded_real_variation_on((h : (Real) -> Real), real_interval([(real_of_num(0), (d : Real))]))"), fn(x3640 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3641 = @tactics.assume_tac(x3640)
    fn(x3642 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3641(x3642)
    }
  })
  let t3639 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3638 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (d : Real)"), fn(x3635 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3636 = @tactics.assume_tac(x3635)
    fn(x3637 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3636(x3637)
    }
  })
  let t3634 = @simp.abbrev_tac(@term_syntax.parse_term("(d : Real) == min((d0 : Real), pi)"))
  let t3633 = @tactics.disch_then(fn(x3632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t3631 = @simp.simp_tac(@list.List([]))
  let t3628 = @simp.gen_rewrite_rule(fn(x3627 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3627
  }, @list.List([@class.fun_eq_thm()]))
  let t3630 = @tactics.first_assum(fn(x3629 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3624 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3625 = @tactics.mp_tac(x3624)
      fn(x3626 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3625(x3626)
      }
    })(t3628(x3629))
  })
  let t3623 = @simp.abbrev_tac(@term_syntax.parse_term("(h : (Real) -> Real) == ((u : Real) => (f : (Real) -> Real)((t : Real) + u) + f(t - u) - real_of_num(2) * (s : Real))"))
  let t3622 = @tactics.disch_then(fn(x3619 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3620 = @tactics.subst1_tac(x3619)
    fn(x3621 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3620(x3621)
    }
  })
  let t3618 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("min((d0 : Real), pi) <= pi"))]))
  let t3614 = @term_syntax.parse_term("min((d0 : Real), pi)")
  let t3615 = @term_syntax.parse_term("(s : Real)")
  let t3616 = @term_syntax.parse_term("(t : Real)")
  let t3617 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t3616, t3615, t3614]), fourier_sum_limit_sine_part()))
  let t3613 = @simp.abbrev_tac(@term_syntax.parse_term("(s : Real) == (reallim(within(atreal((t : Real)), {(l : Real) | l <= t}), (f : (Real) -> Real)) + reallim(within(atreal(t), {(r : Real) | r >= t}), f)) / real_of_num(2)"))
  let t3611 = @term_syntax.parse_term("(d0 : Real)")
  let t3612 = @term_syntax.parse_term("(t : Real)")
  let t4136 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t3612, t3611])), @tactics.strip_tac), t3613), t3617), t3618), t3622), t3623), t3630), t3631), t3633), t3634), t3638), t3639), t3643), t3662), t3666), t3780), t3781), t3782), @tactics.disch_tac), t3783), t4012), t4016), t4017), t4025), t4029), t4033), t4041), t4043), t4044), @tactics.disch_tac), t4048), t4074), t4078), t4089), t4090), t4091), t4092), t4094), t4095), t4096), t4097), t4100), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4101), t4102), t4103), t4110), t4111), t4112), t4113), t4114), t4115), t4116), t4117), t4128), t4129), t4130), t4131), t4132), t4133), t4134), t4135), @calc_rat.asm_real_arith_tac)
  fourier_jordan_bounded_variation_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ x : Real, ∀ d : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && real_of_num(0) < d && has_bounded_real_variation_on(f, real_interval([(x - d, x + d)])) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, x)), (reallim(within(atreal(x), {(l : Real) | l <= x}), f) + reallim(within(atreal(x), {(r : Real) | r >= x}), f)) / real_of_num(2), sequentially)"), t4136))
}

///|
let fourier_jordan_bounded_variation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_JORDAN_BOUNDED_VARIATION")

///|
/// `FOURIER_JORDAN_BOUNDED_VARIATION`
pub fn fourier_jordan_bounded_variation() -> @kernel.Thm {
  fourier_jordan_bounded_variation_c.get()
}

///|
/// FOURIER_JORDAN_BOUNDED_VARIATION_SIMPLE
fn step_153() -> Unit raise {
  let t4256 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t4254 = @equal.gsym(@realax.real_of_num_mul())
  let t4255 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t4254]))
  let t4253 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t4252 = @simp.asm_rewrite_tac(@list.List([]))
  let t4251 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-real_of_num(2 * (N : Num) + 1) * pi, real_of_num(2 * N + 1) * pi)])"))
  let t4250 = @tactics.match_mp_tac(@realanalysis.has_bounded_real_variation_on_subset())
  let t4247 = @term_syntax.parse_term("(N : Num)")
  let t4249 = @tactics.disch_then((x4248 : @kernel.Thm) => @tactics.x_choose_tac(t4247, x4248))
  let t4243 = @term_syntax.parse_term("abs((x : Real)) + real_of_num(3)")
  let t4246 = @tactics.disch_then(fn(x4245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4241 = @tactics.mp_tac(x4240)
      fn(x4242 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4241(x4242)
      }
    })(((x4244 : @kernel.Thm) => @bool.spec(t4243, x4244))(x4245))
  })
  let t4239 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4238 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("real_of_num(2) * pi"), @real.real_arch()))
  let t4234 = @simp.simp_tac(@list.List([@floor.integer_closed()]))
  let t4233 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t4232 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(real_of_num(2) + real_of_num(2) * (m : Real) + real_of_num(1)) == real_of_num(2) * -(m + real_of_num(1)) - real_of_num(1)"))]))
  let t4231 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(real_of_num(2) * (m : Real) + real_of_num(1)) == real_of_num(2) * -(m + real_of_num(1)) + real_of_num(1)"))]))
  let t4229 = @equal.gsym(@realax.real_of_num_mul())
  let t4230 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t4229]))
  let t4228 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_lneg())]))
  let t4235 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x4225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4226 = @tactics.subst1_tac(x4225)
    fn(x4227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4226(x4227)
    }
  }), t4228), t4230), t4231), t4232), t4233), t4234)
  let t4224 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_le()]))
  let t4223 = @simp.rewrite_tac(@list.List([@calc_int.real_le_neg2(), @calc_rat.real_arith(@term_syntax.parse_term("(-(a : Real) <= (b : Real)) == (real_of_num(0) <= a + b)"))]))
  let t4222 = @simp.simp_tac(@list.List([@real.real_le_rmul_eq(), @transcendentals.pi_pos(), @realax.real_of_num_le()]))
  let t4236 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_lneg())])), t4222), t4223), t4224), @int.arith_tac), t4235])
  let t4218 = @term_syntax.parse_term("-(real_of_num(2 * (m : Num) + 1) * pi)")
  let t4219 = @term_syntax.parse_term("real_of_num(2 * (n : Num) + 1) * pi")
  let t4220 = @term_syntax.parse_term("-(real_of_num(2 + 2 * (m : Num) + 1) * pi)")
  let t4221 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t4220, t4219, t4218]), @realanalysis.has_bounded_real_variation_on_combine()))
  let t4217 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4237 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses(), @realax.real_mul_lid(), @calc_int.real_mul_lneg()]))), t4217), t4221), @tactics.ants_tac), t4236), @tactics.all_tac])
  let t4216 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, has_bounded_real_variation_on((f : (Real) -> Real), real_interval([(-real_of_num(2 * m + 1) * pi, real_of_num(2 * n + 1) * pi)]))"), fn(x4213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4214 = @tactics.assume_tac(x4213)
    fn(x4215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4214(x4215)
    }
  })
  let t4209 = @simp.simp_tac(@list.List([@floor.integer_closed()]))
  let t4208 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t4207 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) + real_of_num(2) * (n : Real) + real_of_num(1)) * pi == (real_of_num(2) * (n + real_of_num(1)) + real_of_num(1)) * pi"))]))
  let t4206 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * (n : Real) + real_of_num(1)) * pi == (real_of_num(2) * (n + real_of_num(1)) - real_of_num(1)) * pi"))]))
  let t4204 = @equal.gsym(@realax.real_of_num_mul())
  let t4205 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t4204]))
  let t4203 = @simp.asm_rewrite_tac(@list.List([]))
  let t4210 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x4200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4201 = @tactics.subst1_tac(x4200)
    fn(x4202 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4201(x4202)
    }
  }), t4203), t4205), t4206), t4207), t4208), t4209)
  let t4199 = @simp.simp_tac(@list.List([@real.real_le_rmul_eq(), @transcendentals.pi_pos(), @realax.real_of_num_le()]))
  let t4211 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-pi == -real_of_num(1) * pi"))])), t4199), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @int.arith_tac])), t4210])
  let t4195 = @term_syntax.parse_term("real_of_num(2 * (n : Num) + 1) * pi")
  let t4196 = @term_syntax.parse_term("real_of_num(2 + 2 * (n : Num) + 1) * pi")
  let t4197 = @term_syntax.parse_term("-pi")
  let t4198 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t4197, t4196, t4195]), @realanalysis.has_bounded_real_variation_on_combine()))
  let t4212 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses(), @realax.real_mul_lid()]))), t4198), @tactics.ants_tac), t4211), @tactics.all_tac])
  let t4194 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, has_bounded_real_variation_on((f : (Real) -> Real), real_interval([(-pi, real_of_num(2 * n + 1) * pi)]))"), fn(x4191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4192 = @tactics.assume_tac(x4191)
    fn(x4193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4192(x4193)
    }
  })
  let t4189 = @simp.rewrite_tac(@list.List([@lists.cons_11(), @pair.pair_eq()]))
  let t4188 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t4187 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax()]))
  let t4186 = @simp.asm_rewrite_tac(@list.List([@floor.integer_neg()]))
  let t4185 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (n : Real) * (real_of_num(2) * pi) == real_of_num(2) * (n * pi) + x"))]))
  let t4180 = @term_syntax.parse_term("-(n : Real)")
  let t4181 = @list.List([@term_syntax.parse_term("(x : Real)"), t4180])
  let t4177 = @term_syntax.parse_term("(x : Real)")
  let t4184 = @tactics.disch_then(fn(x4183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4175 = @tactics.mp_tac(x4174)
        fn(x4176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4175(x4176)
        }
      })(((x4178 : @kernel.Thm) => @bool.gen(t4177, x4178))(x4179))
    })(((x4182 : @kernel.Thm) => @bool.specl(t4181, x4182))(x4183))
  })
  let t4171 = @simp.gen_rewrite_rule(fn(x4170 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4170
  }, @list.List([real_periodic_integer_multiple()]))
  let t4173 = @tactics.first_x_assum(fn(x4172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4168 = @tactics.mp_tac(x4167)
      fn(x4169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4168(x4169)
      }
    })(t4171(x4172))
  })
  let t4166 = @simp.rewrite_tac(@list.List([@floor.integer_neg(), @equal.gsym(@realanalysis.real_interval_translation())]))
  let t4163 = @drule.match_mp(@realanalysis.has_bounded_real_variation_translation())
  let t4160 = @term_syntax.parse_term("real_of_num(2) * (-(n : Real) * pi)")
  let t4165 = @tactics.first_assum(fn(x4164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4158 = @tactics.mp_tac(x4157)
        fn(x4159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4158(x4159)
        }
      })(((x4161 : @kernel.Thm) => @bool.spec(t4160, x4161))(x4162))
    })(t4163(x4164))
  })
  let t4190 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4165), t4166), t4173), t4184), t4185), t4186), @tactics.disch_tac), t4187), t4188), @tactics.ap_term_tac), @tactics.ap_term_tac), t4189), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4257 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ n : Real, integer(n) → has_bounded_real_variation_on((f : (Real) -> Real), real_interval([((real_of_num(2) * n - real_of_num(1)) * pi, (real_of_num(2) * n + real_of_num(1)) * pi)]))"), fn(x4154 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4155 = @tactics.assume_tac(x4154)
    fn(x4156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4155(x4156)
    }
  }), t4190), t4194), t4212), t4216), t4237), t4238), @tactics.ants_tac), t4239), t4246), t4249), t4250), t4251), t4252), t4253), t4255), t4256), @calc_rat.asm_real_arith_tac)
  let t4153 = @simp.asm_rewrite_tac(@list.List([]))
  let t4152 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_increasing())
  let t4151 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_sub())
  let t4150 = @simp.asm_rewrite_tac(@list.List([]))
  let t4149 = @simp.gen_rewrite_tac(fn(x4146 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4147 = @equal.land_conv(x4146)
    fn(x4148 : @kernel.Term) -> @kernel.Thm raise {
      s4147(x4148)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t4144 = @simp.gen_rewrite_rule(fn(x4143 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4143
  }, @list.List([@realanalysis.has_bounded_real_variation_darboux()]))
  let t4258 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x4145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4140 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4141 = @tactics.mp_tac(x4140)
      fn(x4142 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4141(x4142)
      }
    })(t4144(x4145))
  }), @tactics.strip_tac), t4149), t4150), t4151), @tactics.conj_tac), t4152), t4153), t4257])
  let t4139 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_01()]))
  let t4138 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t4137 = @tactics.match_mp_tac(fourier_jordan_bounded_variation())
  let t4259 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4137), t4138), t4139), @tactics.conj_tac), t4258)
  fourier_jordan_bounded_variation_simple_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ x : Real, has_bounded_real_variation_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, x)), (reallim(within(atreal(x), {(l : Real) | l <= x}), f) + reallim(within(atreal(x), {(r : Real) | r >= x}), f)) / real_of_num(2), sequentially)"), t4259))
}

///|
let fourier_jordan_bounded_variation_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_JORDAN_BOUNDED_VARIATION_SIMPLE")

///|
/// `FOURIER_JORDAN_BOUNDED_VARIATION_SIMPLE`
pub fn fourier_jordan_bounded_variation_simple() -> @kernel.Thm {
  fourier_jordan_bounded_variation_simple_c.get()
}

///|
/// fejer_kernel
fn step_154() -> Unit raise {
  fejer_kernel_c.set(@pair.new_definition(@term_syntax.parse_term("(fejer_kernel : (Num, Real) -> Real)((n : Num), (x : Real)) == (if n == 0 { real_of_num(0) } else { sum(op_dot_dot(0, n - 1), (r : Num) => dirichlet_kernel(r, x)) / real_of_num(n) })")))
}

///|
let fejer_kernel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fejer_kernel")

///|
/// `fejer_kernel`
pub fn fejer_kernel() -> @kernel.Thm {
  fejer_kernel_c.get()
}

///|
/// FEJER_KERNEL
fn step_155() -> Unit raise {
  let t4287 = @simp.rewrite_tac(@list.List([@realax.real_add_lid(), @real.real_sub_rzero(), @realax.real_div(), @real.real_mul_ac()]))
  let t4286 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @arith.le_1(), @transcendentals.real_sub_cos()]))
  let t4285 = @simp.rewrite_tac(@list.List([@iterate.sum_diffs(), @arith.le_0(), @calc_int.real_mul_lzero()]))
  let t4284 = @simp.rewrite_tac(@list.List([@realax.real_div(), @iterate.sum_rmul(), @transcendentals.cos_neg(), @realax.real_of_num_add()]))
  let t4282 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) / real_of_num(2) + (real_of_num((n : Num)) + real_of_num(1) / real_of_num(2)) * x == (real_of_num(n) + real_of_num(1)) * x"))
  let t4283 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) / real_of_num(2) - (real_of_num((n : Num)) + real_of_num(1) / real_of_num(2)) * x == -(real_of_num(n) * x)")), t4282]))
  let t4281 = @simp.rewrite_tac(@list.List([@transcendentals.real_mul_sin_sin()]))
  let t4280 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((s : Real) == real_of_num(0)) → real_of_num(2) * (pow(s, 2) * ((a : Real) / (real_of_num(2) * s))) == s * a"))]))
  let t4279 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_eq(), @equal.gsym(@iterate.sum_lmul())]))
  let t4278 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((n : Real) == real_of_num(0)) && !((s : Real) == real_of_num(0)) && real_of_num(2) * (pow(s, 2) * (l : Real)) == (r : Real) → l / n == r / (real_of_num(2) * (n * pow(s, 2)))")))
  let t4277 = @list.List([@simp.asm_rewrite_tac(@list.List([@real.real_pow_zero(), @calc_num.arith_eq(), @calc_int.real_mul_rzero(), @realax.real_div(), @realax.real_inv_0(), @iterate.sum_0(), @calc_int.real_mul_lzero()])), @tactics.all_tac])
  let t4276 = @class.asm_cases_tac(@term_syntax.parse_term("sin((x : Real) / real_of_num(2)) == real_of_num(0)"))
  let t4274 = @tactics.conv_tac(@calc_rat.real_field)
  let t4271 = @simp.gen_rewrite_rule(fn(x4268 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4269 = @equal.rand_conv(x4268)
    fn(x4270 : @kernel.Term) -> @kernel.Thm raise {
      s4269(x4270)
    }
  }, @list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t4273 = @tactics.first_x_assum(fn(x4272 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4265 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4266 = @tactics.mp_tac(x4265)
      fn(x4267 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4266(x4267)
      }
    })(t4271(x4272))
  })
  let t4264 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @equal.gsym(@real.real_of_num_sub()), @arith.le_1(), @arith.sub_0()]))
  let t4275 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_add_numseg(), @iterate.sum_const_numseg(), @simp.rewrite_rule(@list.List([@class.eta_ax()]))(sum_numbers())])), t4264), t4273), t4274), @tactics.all_tac])
  let t4263 = @simp.asm_rewrite_tac(@list.List([]))
  let t4262 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t4261 = @simp.asm_rewrite_tac(@list.List([@iterate.sum_0()]))
  let t4260 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t4288 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([fejer_kernel(), dirichlet_kernel()])), t4260), t4261), t4262), t4263), t4275), t4276), t4277), t4278), t4279), t4280), t4281), t4283), t4284), t4285), t4286), t4287), @calc_rat.real_arith_tac)
  fejer_kernel_v1_c.set(@tactics.prove(@term_syntax.parse_term("fejer_kernel((n : Num), (x : Real)) == (if n == 0 { real_of_num(0) } else { if x == real_of_num(0) { real_of_num(n) / real_of_num(2) } else { pow(sin(real_of_num(n) / real_of_num(2) * x), 2) / (real_of_num(2) * (real_of_num(n) * pow(sin(x / real_of_num(2)), 2))) } })"), t4288))
}

///|
let fejer_kernel_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FEJER_KERNEL")

///|
/// `FEJER_KERNEL`
pub fn fejer_kernel_v1() -> @kernel.Thm {
  fejer_kernel_v1_c.get()
}

///|
/// FEJER_KERNEL_CONTINUOUS_STRONG
fn step_156() -> Unit raise {
  let t4298 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), dirichlet_kernel_continuous_strong()]))
  let t4297 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_sum())
  let t4296 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_rmul())
  let t4295 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t4294 = @simp.asm_rewrite_tac(@list.List([@realanalysis.real_continuous_on_const()]))
  let t4293 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t4292 = @simp.rewrite_tac(@list.List([fejer_kernel()]))
  let t4299 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x4289 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4290 = @equal.land_conv(x4289)
    fn(x4291 : @kernel.Term) -> @kernel.Thm raise {
      s4290(x4291)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))), t4292), t4293), t4294), t4295), t4296), t4297), t4298)
  fejer_kernel_continuous_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, real_continuous_on(fejer_kernel(n), real_interval((-(real_of_num(2) * pi), real_of_num(2) * pi)))"), t4299))
}

///|
let fejer_kernel_continuous_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FEJER_KERNEL_CONTINUOUS_STRONG")

///|
/// `FEJER_KERNEL_CONTINUOUS_STRONG`
pub fn fejer_kernel_continuous_strong() -> @kernel.Thm {
  fejer_kernel_continuous_strong_c.get()
}

///|
/// FEJER_KERNEL_CONTINUOUS
fn step_157() -> Unit raise {
  let t4303 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t4302 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t4301 = @simp.rewrite_tac(@list.List([fejer_kernel_continuous_strong()]))
  let t4300 = @tactics.exists_tac(@term_syntax.parse_term("real_interval((-(real_of_num(2) * pi), real_of_num(2) * pi))"))
  let t4304 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@realanalysis.real_continuous_on_subset())), t4300), t4301), t4302), t4303), @calc_rat.real_arith_tac)
  fejer_kernel_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, real_continuous_on(fejer_kernel(n), real_interval([(-pi, pi)]))"), t4304))
}

///|
let fejer_kernel_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FEJER_KERNEL_CONTINUOUS")

///|
/// `FEJER_KERNEL_CONTINUOUS`
pub fn fejer_kernel_continuous() -> @kernel.Thm {
  fejer_kernel_continuous_c.get()
}

///|
/// ABSOLUTELY_REAL_INTEGRABLE_MUL_FEJER_KERNEL
fn step_158() -> Unit raise {
  let t4309 = @simp.asm_rewrite_tac(@list.List([fejer_kernel_continuous(), @class.eta_ax(), @metric.real_compact_interval()]))
  let t4308 = @tactics.match_mp_tac(@realanalysis.real_compact_continuous_image())
  let t4310 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.real_compact_imp_bounded()), t4308), t4309)
  let t4307 = @simp.asm_rewrite_tac(@list.List([fejer_kernel_continuous(), @class.eta_ax(), @metric.real_closed_real_interval()]))
  let t4311 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_imp_real_measurable_on_closed_subset()), t4307), t4310])
  let t4306 = @simp.asm_rewrite_tac(@list.List([]))
  let t4305 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t4312 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4305), t4306), @tactics.conj_tac), t4311)
  absolutely_real_integrable_mul_fejer_kernel_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) → absolutely_real_integrable_on((x : Real) => fejer_kernel(n, x) * f(x), real_interval([(-pi, pi)]))"), t4312))
}

///|
let absolutely_real_integrable_mul_fejer_kernel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_REAL_INTEGRABLE_MUL_FEJER_KERNEL")

///|
/// `ABSOLUTELY_REAL_INTEGRABLE_MUL_FEJER_KERNEL`
pub fn absolutely_real_integrable_mul_fejer_kernel() -> @kernel.Thm {
  absolutely_real_integrable_mul_fejer_kernel_c.get()
}

///|
/// ABSOLUTELY_REAL_INTEGRABLE_MUL_FEJER_KERNEL_REFLECTED
fn step_159() -> Unit raise {
  let t4322 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_const()]))
  let t4321 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t4320 = @tactics.match_mp_tac(absolutely_real_integrable_periodic_offset())
  let t4319 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t4318 = @simp.rewrite_tac(@list.List([@realax.real_sub(), @calc_int.real_neg_neg()]))
  let t4317 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_on())]))
  let t4316 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_integrable_reflect())]))
  let t4323 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_on()])), t4316), t4317), t4318), t4319), t4320), t4321)
  let t4315 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t4314 = @tactics.match_mp_tac(absolutely_real_integrable_periodic_offset())
  let t4324 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_add_sym()])), t4314), t4315), t4323, t4322])
  let t4313 = @tactics.match_mp_tac(absolutely_real_integrable_mul_fejer_kernel())
  let t4325 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4313), t4324)
  absolutely_real_integrable_mul_fejer_kernel_reflected_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ c : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → absolutely_real_integrable_on((x : Real) => fejer_kernel(n, x) * f((t : Real) + x), real_interval([(-pi, pi)])) && absolutely_real_integrable_on((x : Real) => fejer_kernel(n, x) * f(t - x), real_interval([(-pi, pi)])) && absolutely_real_integrable_on((x : Real) => fejer_kernel(n, x) * c, real_interval([(-pi, pi)]))"), t4325))
}

///|
let absolutely_real_integrable_mul_fejer_kernel_reflected_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_REAL_INTEGRABLE_MUL_FEJER_KERNEL_REFLECTED")

///|
/// `ABSOLUTELY_REAL_INTEGRABLE_MUL_FEJER_KERNEL_REFLECTED`
pub fn absolutely_real_integrable_mul_fejer_kernel_reflected() -> @kernel.Thm {
  absolutely_real_integrable_mul_fejer_kernel_reflected_c.get()
}

///|
/// ABSOLUTELY_REAL_INTEGRABLE_MUL_FEJER_KERNEL_REFLECTED_PART
fn step_160() -> Unit raise {
  let t4343 = @simp.simp_tac(@list.List([@realax.real_add_ldistrib(), @real.real_sub_ldistrib(), @realanalysis.absolutely_real_integrable_add(), @realanalysis.absolutely_real_integrable_sub()]))
  let t4342 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t4341 = @simp.asm_rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t4340 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4339 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-pi, pi)])"))
  let t4338 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_on_subinterval())
  let t4344 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4338), t4339), t4340), t4341), t4342), @calc_rat.asm_real_arith_tac), t4343])
  let t4337 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool)) && (a && b && c → (d : Bool) && (e : Bool)) → a && b && c && d && e")))
  let t4336 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t4330 = @drule.match_mp(absolutely_real_integrable_mul_fejer_kernel_reflected())
  let t4335 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x4331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4327 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4328 = @tactics.assume_tac(x4327)
      fn(x4329 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4328(x4329)
      }
    })(t4330(x4331))
  }, fn(x4332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4333 = @tactics.assume_tac(x4332)
    fn(x4334 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4333(x4334)
    }
  }))
  let t4326 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t4345 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t4326), t4335), t4336), t4337), @tactics.conj_tac), t4344)
  absolutely_real_integrable_mul_fejer_kernel_reflected_part_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ d : Real, ∀ c : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && d <= pi → absolutely_real_integrable_on((x : Real) => fejer_kernel(n, x) * f((t : Real) + x), real_interval([(real_of_num(0), d)])) && absolutely_real_integrable_on((x : Real) => fejer_kernel(n, x) * f(t - x), real_interval([(real_of_num(0), d)])) && absolutely_real_integrable_on((x : Real) => fejer_kernel(n, x) * c, real_interval([(real_of_num(0), d)])) && absolutely_real_integrable_on((x : Real) => fejer_kernel(n, x) * (f(t + x) + f(t - x)), real_interval([(real_of_num(0), d)])) && absolutely_real_integrable_on((x : Real) => fejer_kernel(n, x) * (f(t + x) + f(t - x) - c), real_interval([(real_of_num(0), d)]))"), t4345))
}

///|
let absolutely_real_integrable_mul_fejer_kernel_reflected_part_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_REAL_INTEGRABLE_MUL_FEJER_KERNEL_REFLECTED_PART")

///|
/// `ABSOLUTELY_REAL_INTEGRABLE_MUL_FEJER_KERNEL_REFLECTED_PART`
pub fn absolutely_real_integrable_mul_fejer_kernel_reflected_part() -> @kernel.Thm {
  absolutely_real_integrable_mul_fejer_kernel_reflected_part_c.get()
}

///|
/// FOURIER_SUM_OFFSET_FEJER_KERNEL_HALF
fn step_161() -> Unit raise {
  let t4381 = @simp.asm_simp_tac(@list.List([@arith.le_1(), @realax.real_of_num_eq()]))
  let t4380 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((n : Real) == real_of_num(0)) → (s : Real) * (f : Real) == n * (s / n * f)")))
  let t4379 = @simp.asm_simp_tac(@list.List([fejer_kernel(), @arith.le_1()]))
  let t4378 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t4377 = @tactics.match_mp_tac(@realanalysis.real_integral_eq())
  let t4376 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realanalysis.real_integral_lmul()), @realax.real_le_refl(), absolutely_real_integrable_mul_fejer_kernel_reflected_part(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t4375 = @simp.rewrite_tac(@list.List([@iterate.sum_rmul()]))
  let t4374 = @tactics.disch_then(fn(x4373 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4370 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4371 = @tactics.subst1_tac(x4370)
      fn(x4372 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4371(x4372)
      }
    })(@equal.sym(x4373))
  })
  let t4369 = @simp.asm_simp_tac(@list.List([absolutely_real_integrable_mul_dirichlet_kernel_reflected_part(), @realanalysis.absolutely_real_integrable_imp_integrable(), @iterate.finite_numseg(), @realax.real_le_refl()]))
  let t4363 = @drule.part_match(fn(x4362 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x4362))
  }, @realanalysis.real_integral_sum())
  let t4358 = @simp.rewrite_tac(@list.List([@realax.real_div(), @iterate.sum_rmul(), @realax.real_mul_assoc()]))
  let t4357 = @simp.asm_simp_tac(@list.List([fourier_sum_offset_dirichlet_kernel_half()]))
  let t4356 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_sub_numseg())]))
  let t4355 = @tactics.disch_then(fn(x4354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4351 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4352 = @tactics.subst1_tac(x4351)
      fn(x4353 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4352(x4353)
      }
    })(@equal.sym(x4354))
  })
  let t4350 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @arith.le_1(), @arith.sub_0()]))
  let t4347 = @term_syntax.parse_term("(n : Num) - 1")
  let t4348 = @term_syntax.parse_term("0")
  let t4349 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(l : Real)"), t4348, t4347]), @iterate.sum_const_numseg()))
  let t4346 = @simp.asm_simp_tac(@list.List([@arith.le_1(), @realax.real_of_num_eq(), @calc_rat.real_field(@term_syntax.parse_term("!((n : Real) == real_of_num(0)) → ((x : Real) / n - (l : Real) == (y : Real)) == (x - n * l == n * y)"))]))
  let t4382 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4346), t4349), t4350), t4355), t4356), t4357), t4358), @tactics.ap_thm_tac), @tactics.ap_term_tac), fn(x4368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x4367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4365 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x4364 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x4359 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s4360 = @tactics.mp_tac(x4359)
            fn(x4361 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s4360(x4361)
            }
          })(t4363(x4364))
        })(@equal.lhand(x4365))
      })((fn(x4366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x4366.1
      })(x4367))
    })(x4368)(x4368)
  }), t4369), t4374), t4375), t4376), t4377), t4378), @tactics.strip_tac), t4379), t4380), t4381)
  fourier_sum_offset_fejer_kernel_half_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ n : Num, ∀ t : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && 0 < n → sum(op_dot_dot(0, n - 1), (r : Num) => sum(op_dot_dot(0, 2 * r), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t))) / real_of_num(n) - (l : Real) == real_integral(real_interval([(real_of_num(0), pi)]), (x : Real) => fejer_kernel(n, x) * (f(t + x) + f(t - x) - real_of_num(2) * l)) / pi"), t4382))
}

///|
let fourier_sum_offset_fejer_kernel_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_OFFSET_FEJER_KERNEL_HALF")

///|
/// `FOURIER_SUM_OFFSET_FEJER_KERNEL_HALF`
pub fn fourier_sum_offset_fejer_kernel_half() -> @kernel.Thm {
  fourier_sum_offset_fejer_kernel_half_c.get()
}

///|
/// FOURIER_SUM_LIMIT_FEJER_KERNEL_HALF
fn step_162() -> Unit raise {
  let t4398 = @simp.asm_simp_tac(@list.List([@transcendentals.pi_pos(), @real.real_lt_imp_nz(), @real.real_div_rmul(), @real.real_sub_refl()]))
  let t4397 = @simp.asm_simp_tac(@list.List([fourier_sum_offset_fejer_kernel_half(), @arith.le_1()]))
  let t4396 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4395 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4394 = @tactics.match_mp_tac(@realanalysis.reallim_eventually())
  let t4393 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eq())
  let t4392 = @simp.gen_rewrite_tac(fn(x4389 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4390 = @equal.land_conv(x4389)
    fn(x4391 : @kernel.Term) -> @kernel.Thm raise {
      s4390(x4391)
    }
  }, @list.List([@equal.gsym(@drule.match_mp(@realanalysis.reallim_null_rmul_eq())(@transcendentals.pi_nz()))]))
  let t4388 = @simp.rewrite_tac(@list.List([]))
  let t4387 = @simp.gen_rewrite_tac(fn(x4384 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4385 = @equal.land_conv(x4384)
    fn(x4386 : @kernel.Term) -> @kernel.Thm raise {
      s4385(x4386)
    }
  }, @list.List([@realanalysis.reallim_null()]))
  let t4383 = @simp.asm_simp_tac(@list.List([@equal.gsym(fourier_sum_limit_pair())]))
  let t4399 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4383), t4387), t4388), t4392), t4393), t4394), t4395), t4396), t4397), t4398)
  fourier_sum_limit_fejer_kernel_half_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ t : Real, ∀ l : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n - 1), (r : Num) => sum(op_dot_dot(0, 2 * r), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, t))) / real_of_num(n), l, sequentially) == op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([(real_of_num(0), pi)]), (x : Real) => fejer_kernel(n, x) * (f(t + x) + f(t - x) - real_of_num(2) * l)), real_of_num(0), sequentially)"), t4399))
}

///|
let fourier_sum_limit_fejer_kernel_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_SUM_LIMIT_FEJER_KERNEL_HALF")

///|
/// `FOURIER_SUM_LIMIT_FEJER_KERNEL_HALF`
pub fn fourier_sum_limit_fejer_kernel_half() -> @kernel.Thm {
  fourier_sum_limit_fejer_kernel_half_c.get()
}

///|
/// HAS_REAL_INTEGRAL_FEJER_KERNEL
fn step_163() -> Unit raise {
  let t4428 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), has_real_integral_dirichlet_kernel()]))
  let t4427 = @tactics.match_mp_tac(@realanalysis.has_real_integral_sum())
  let t4426 = @tactics.match_mp_tac(@realanalysis.has_real_integral_rmul())
  let t4429 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t4426), t4427), t4428)
  let t4425 = @tactics.conv_tac(@calc_rat.real_field)
  let t4422 = @simp.gen_rewrite_rule(fn(x4419 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4420 = @equal.rand_conv(x4419)
    fn(x4421 : @kernel.Term) -> @kernel.Thm raise {
      s4420(x4421)
    }
  }, @list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t4424 = @tactics.first_assum(fn(x4423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4417 = @tactics.mp_tac(x4416)
      fn(x4418 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4417(x4418)
      }
    })(t4422(x4423))
  })
  let t4430 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@iterate.sum_const_numseg(), @arith.sub_add(), @arith.le_1(), @arith.sub_0()])), t4424), t4425), t4429])
  let t4415 = @tactics.subgoal_then(@term_syntax.parse_term("pi == sum(op_dot_dot(0, (n : Num) - 1), (r : Num) => pi) / real_of_num(n)"), fn(x4410 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x4410
    @simp.gen_rewrite_tac(fn(x4412 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4413 = @equal.land_conv(x4412)
      fn(x4414 : @kernel.Term) -> @kernel.Thm raise {
        s4413(x4414)
      }
    }, @list.List([th]))
  })
  let t4409 = @simp.asm_rewrite_tac(@list.List([@realanalysis.has_real_integral_0()]))
  let t4408 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t4407 = @simp.rewrite_tac(@list.List([fejer_kernel()]))
  let t4431 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x4406 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x4400 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4401 = @equal.rator_conv(x4400)
      fn(x4402 : @kernel.Term) -> @kernel.Thm raise {
        s4401(x4402)
      }
    })((fn(x4403 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4404 = @equal.land_conv(x4403)
      fn(x4405 : @kernel.Term) -> @kernel.Thm raise {
        s4404(x4405)
      }
    })(x4406))
  }, @list.List([@equal.gsym(@class.eta_ax())]))), t4407), t4408), t4409), t4415), t4430)
  has_real_integral_fejer_kernel_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, has_real_integral(fejer_kernel(n), if n == 0 { real_of_num(0) } else { pi }, real_interval([(-pi, pi)]))"), t4431))
}

///|
let has_real_integral_fejer_kernel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_FEJER_KERNEL")

///|
/// `HAS_REAL_INTEGRAL_FEJER_KERNEL`
pub fn has_real_integral_fejer_kernel() -> @kernel.Thm {
  has_real_integral_fejer_kernel_c.get()
}

///|
/// HAS_REAL_INTEGRAL_FEJER_KERNEL_HALF
fn step_164() -> Unit raise {
  let t4461 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), has_real_integral_dirichlet_kernel_half()]))
  let t4460 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t4459 = @tactics.match_mp_tac(@realanalysis.has_real_integral_sum())
  let t4458 = @tactics.match_mp_tac(@realanalysis.has_real_integral_rmul())
  let t4462 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t4458), t4459), t4460), t4461)
  let t4457 = @tactics.conv_tac(@calc_rat.real_field)
  let t4454 = @simp.gen_rewrite_rule(fn(x4451 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4452 = @equal.rand_conv(x4451)
    fn(x4453 : @kernel.Term) -> @kernel.Thm raise {
      s4452(x4453)
    }
  }, @list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t4456 = @tactics.first_assum(fn(x4455 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4449 = @tactics.mp_tac(x4448)
      fn(x4450 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4449(x4450)
      }
    })(t4454(x4455))
  })
  let t4463 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@iterate.sum_const_numseg(), @arith.sub_add(), @arith.le_1(), @arith.sub_0()])), t4456), t4457), t4462])
  let t4447 = @tactics.subgoal_then(@term_syntax.parse_term("pi / real_of_num(2) == sum(op_dot_dot(0, (n : Num) - 1), (r : Num) => pi / real_of_num(2)) / real_of_num(n)"), fn(x4442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x4442
    @simp.gen_rewrite_tac(fn(x4444 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4445 = @equal.land_conv(x4444)
      fn(x4446 : @kernel.Term) -> @kernel.Thm raise {
        s4445(x4446)
      }
    }, @list.List([th]))
  })
  let t4441 = @simp.asm_rewrite_tac(@list.List([@realanalysis.has_real_integral_0()]))
  let t4440 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t4439 = @simp.rewrite_tac(@list.List([fejer_kernel()]))
  let t4464 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x4438 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x4432 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4433 = @equal.rator_conv(x4432)
      fn(x4434 : @kernel.Term) -> @kernel.Thm raise {
        s4433(x4434)
      }
    })((fn(x4435 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4436 = @equal.land_conv(x4435)
      fn(x4437 : @kernel.Term) -> @kernel.Thm raise {
        s4436(x4437)
      }
    })(x4438))
  }, @list.List([@equal.gsym(@class.eta_ax())]))), t4439), t4440), t4441), t4447), t4463)
  has_real_integral_fejer_kernel_half_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, has_real_integral(fejer_kernel(n), if n == 0 { real_of_num(0) } else { pi / real_of_num(2) }, real_interval([(real_of_num(0), pi)]))"), t4464))
}

///|
let has_real_integral_fejer_kernel_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_INTEGRAL_FEJER_KERNEL_HALF")

///|
/// `HAS_REAL_INTEGRAL_FEJER_KERNEL_HALF`
pub fn has_real_integral_fejer_kernel_half() -> @kernel.Thm {
  has_real_integral_fejer_kernel_half_c.get()
}

///|
/// FEJER_KERNEL_POS_LE
fn step_165() -> Unit raise {
  let t4471 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t4469 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t4470 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), t4469))
  let t4468 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t4467 = @tactics.match_mp_tac(@real.real_le_div())
  let t4466 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_simp_tac(@list.List([@realarith.real_pos(), @real.real_le_div()]))))
  let t4465 = @simp.rewrite_tac(@list.List([fejer_kernel_v1()]))
  let t4472 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t4465), t4466), t4467), t4468), t4470), t4471)
  fejer_kernel_pos_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ x : Real, real_of_num(0) <= fejer_kernel(n, x)"), t4472))
}

///|
let fejer_kernel_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FEJER_KERNEL_POS_LE")

///|
/// `FEJER_KERNEL_POS_LE`
pub fn fejer_kernel_pos_le() -> @kernel.Thm {
  fejer_kernel_pos_le_c.get()
}

///|
/// FOURIER_FEJER_CESARO_SUMMABLE
fn step_166() -> Unit raise {
  let t4767 = @simp.simp_tac(@list.List([@transcendentals.pi_pos(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < pi → pi / real_of_num(2) * ((e : Real) / real_of_num(2) / pi) == e / real_of_num(4)"))]))
  let t4766 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4765 = @simp.simp_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t4761 = @term_syntax.parse_term("(e : Real) / real_of_num(2) / pi")
  let t4764 = @tactics.disch_then(fn(x4763 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4758 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4759 = @tactics.mp_tac(x4758)
      fn(x4760 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4759(x4760)
      }
    })(((x4762 : @kernel.Thm) => @bool.spec(t4761, x4762))(x4763))
  })
  let t4756 = @drule.match_mp(@realanalysis.has_real_integral_rmul())
  let t4768 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x4757 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4753 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4754 = @tactics.mp_tac(x4753)
      fn(x4755 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4754(x4755)
      }
    })(t4756(x4757))
  }), t4764), t4765), t4766), t4767), @calc_rat.asm_real_arith_tac)
  let t4748 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t4747 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_div()), @tactics.conj_tac))
  let t4746 = @simp.asm_rewrite_tac(@list.List([fejer_kernel_pos_le()]))
  let t4745 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t4749 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4745), t4746), t4747), t4748), @calc_rat.asm_real_arith_tac)
  let t4744 = @meson.asm_meson_tac(@list.List([@realanalysis.real_integrable_on()]))
  let t4743 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t4750 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_rmul()), t4743), t4744)
  let t4741 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval()])), @calc_rat.asm_real_arith_tac)
  let t4742 = @list.List([@meson.asm_meson_tac(@list.List([@realanalysis.real_integrable_on()])), t4741])
  let t4740 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(real_of_num(0), pi)])"))
  let t4739 = @tactics.match_mp_tac(@realanalysis.real_integrable_on_subinterval())
  let t4738 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t4751 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_rmul()), t4738), t4739), t4740), @tactics.conj_tac), t4742)
  let t4752 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval()])), @calc_rat.asm_real_arith_tac), t4751, t4750, t4749])
  let t4737 = @tactics.repeat_tac(@tactics.conj_tac)
  let t4736 = @simp.rewrite_tac(@list.List([]))
  let t4769 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integral_subset_le()), t4736), t4737), t4752), t4768])
  let t4735 = @tactics.exists_tac(@term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), pi)]), (x : Real) => fejer_kernel((n : Num), x) * ((e : Real) / real_of_num(2) / pi))"))
  let t4734 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t4733 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t4770 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), has_real_integral_fejer_kernel_half())), t4733), @tactics.disch_tac), t4734), t4735), @tactics.conj_tac), t4769)
  let t4729 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t4728 = @tactics.match_mp_tac(@realarith.real_lt_imp_le())
  let t4727 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @calc_int.real_abs_num(), @realarith.real_pos(), @transcendentals.pi_pos_le(), @realarith.real_lt_imp_le()]))
  let t4726 = @simp.rewrite_tac(@list.List([fejer_kernel_pos_le()]))
  let t4725 = @simp.rewrite_tac(@list.List([@real.real_abs_pos(), @calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= x) == (real_of_num(0) <= x)"))]))
  let t4724 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4723 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t4722 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t4730 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t4722), @tactics.strip_tac), t4723), t4724), t4725), t4726), @class.cond_cases_tac), t4727), t4728), t4729), @calc_rat.asm_real_arith_tac)
  let t4721 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_const(), @realarith.real_lt_imp_le(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t4718 = @term_syntax.parse_term("real_of_num(0)")
  let t4719 = @term_syntax.parse_term("(k : Real)")
  let t4720 = @term_syntax.parse_term("(n : Num)")
  let t4731 = @tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => (e : Real) / real_of_num(2) / pi"), t4720, t4719, t4718]), absolutely_real_integrable_mul_fejer_kernel_reflected_part())), t4721)
  let t4717 = @simp.asm_simp_tac(@list.List([absolutely_real_integrable_mul_fejer_kernel_reflected_part(), @realanalysis.absolutely_real_integrable_imp_integrable(), @realarith.real_lt_imp_le()]))
  let t4716 = @simp.expand_tac("h")
  let t4715 = @simp.simp_tac(@list.List([@sets.in_diff(), @sets.in_sing(), @realanalysis.real_negligible_sing()]))
  let t4713 = @term_syntax.parse_term("{real_of_num(0)}")
  let t4714 = @tactics.map_every(fn(x4710 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4711 = @tactics.exists_tac(x4710)
    fn(x4712 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4711(x4712)
    }
  }, @list.List([@term_syntax.parse_term("(x : Real) => fejer_kernel((n : Num), x) * (h : (Real) -> Real)(x)"), t4713]))
  let t4732 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(@realanalysis.real_integrable_spike())), t4714), t4715), t4716), t4717), t4731, t4730])
  let t4709 = @tactics.repeat_tac(@tactics.conj_tac)
  let t4708 = @tactics.match_mp_tac(@realanalysis.real_integral_abs_bound_integral())
  let t4706 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing()]))
  let t4705 = @simp.simp_tac(@list.List([@sets.in_diff(), @sets.in_sing()]))
  let t4704 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t4707 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integral_spike()), t4704), t4705), t4706), @tactics.all_tac])
  let t4771 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), (k : Real))]), (x : Real) => fejer_kernel((n : Num), x) * (h : (Real) -> Real)(x)) == real_integral(real_interval([(real_of_num(0), k)]), (x : Real) => fejer_kernel(n, x) * (if x == real_of_num(0) { real_of_num(0) } else { h(x) }))"), fn(x4701 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4702 = @tactics.subst1_tac(x4701)
    fn(x4703 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4702(x4703)
    }
  }), t4707), t4708), t4709), t4732), t4770])
  let t4700 = @tactics.exists_tac(@term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), (k : Real))]), (x : Real) => fejer_kernel((n : Num), x) * ((e : Real) / real_of_num(2) / pi))"))
  let t4699 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t4698 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (e : Real) / real_of_num(2) → x + (y : Real) == (z : Real) → abs(y) < e / real_of_num(2) → abs(z) < e")))
  let t4696 = @simp.asm_simp_tac(@list.List([absolutely_real_integrable_mul_fejer_kernel_reflected_part(), @realanalysis.absolutely_real_integrable_imp_integrable(), @realax.real_le_refl()]))
  let t4695 = @simp.expand_tac("h")
  let t4697 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()])), t4695), t4696), @tactics.all_tac])
  let t4691 = @term_syntax.parse_term("(k : Real)")
  let t4692 = @term_syntax.parse_term("pi")
  let t4693 = @term_syntax.parse_term("real_of_num(0)")
  let t4694 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => fejer_kernel((n : Num), x) * (h : (Real) -> Real)(x)"), t4693, t4692, t4691]), @realanalysis.real_integral_combine()))
  let t4690 = @simp.asm_rewrite_tac(@list.List([]))
  let t4686 = @term_syntax.parse_term("(n : Num)")
  let t4689 = @tactics.first_x_assum(fn(x4688 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4684 = @tactics.mp_tac(x4683)
      fn(x4685 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4684(x4685)
      }
    })(((x4687 : @kernel.Thm) => @bool.spec(t4686, x4687))(x4688))
  })
  let t4682 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(MAX((a : Num), (b : Num)) <= (x : Num)) == (a <= x && b <= x)"))]))
  let t4681 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4680 = @tactics.exists_tac(@term_syntax.parse_term("MAX(1, (N : Num))"))
  let t4677 = @term_syntax.parse_term("(N : Num)")
  let t4679 = @tactics.disch_then((x4678 : @kernel.Thm) => @tactics.x_choose_tac(t4677, x4678))
  let t4676 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t4672 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t4675 = @tactics.disch_then(fn(x4674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4669 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4670 = @tactics.mp_tac(x4669)
      fn(x4671 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4670(x4671)
      }
    })(((x4673 : @kernel.Thm) => @bool.spec(t4672, x4673))(x4674))
  })
  let t4668 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially(), @real.real_sub_rzero()]))
  let t4664 = @simp.rewrite_tac(@list.List([@real.real_abs_pow(), @real.real_pow2_abs(), @misc.abs_square_le_1(), @transcendentals.sin_bound()]))
  let t4663 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t4665 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_image()])), t4663), t4664)
  let t4662 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_withinreal())
  let t4661 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4660 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t4659 = @tactics.match_mp_tac(@realanalysis.real_integrable_continuous())
  let t4666 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.integrable_imp_real_measurable()), t4659), t4660), t4661), t4662), @realanalysis.real_differentiable_tac), t4665])
  let t4658 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t4657 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t4656 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable())
  let t4655 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t4654 = @tactics.match_mp_tac(@realanalysis.real_integrable_lmul())
  let t4653 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) * ((t : Real) * ((n : Real) * ((i : Real) * (h : Real)))) == n * (s * (h * (t * i)))"))]))
  let t4652 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @equal.gsym(@realax.real_mul_assoc())]))
  let t4650 = @simp.asm_rewrite_tac(@list.List([]))
  let t4649 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4651 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), t4649), @class.cond_cases_tac), t4650), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4648 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => pow(sin(real_of_num((n : Num)) / real_of_num(2) * x), 2) / (real_of_num(2) * (real_of_num(n) * pow(sin(x / real_of_num(2)), 2))) * (h : (Real) -> Real)(x)"))
  let t4647 = @tactics.match_mp_tac(@realanalysis.real_integrable_eq())
  let t4646 = @tactics.match_mp_tac(@realanalysis.integrable_imp_real_measurable())
  let t4645 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_rmul(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t4644 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => abs((h : (Real) -> Real)(x)) / (real_of_num(2) * pow(sin(x / real_of_num(2)), 2)) * inv(real_of_num((n : Num)))"))
  let t4643 = @tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable())
  let t4641 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t4640 = @simp.simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_pos(), @real.real_le_pow_2()]))
  let t4639 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_inv_eq()]))
  let t4638 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) && real_of_num(0) <= x → abs(x) <= y")))
  let t4637 = @simp.rewrite_tac(@list.List([@real.real_abs_pow(), @real.real_pow2_abs(), @misc.abs_square_le_1(), @transcendentals.sin_bound()]))
  let t4636 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4635 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4634 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) <= (y : Real)) == (x <= real_of_num(1) * y)"))]))
  let t4633 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul()), @real.real_abs_mul()]))
  let t4632 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4631 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t4630 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t4629 = @simp.gen_rewrite_tac(fn(x4626 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4627 = @equal.land_conv(x4626)
    fn(x4628 : @kernel.Term) -> @kernel.Thm raise {
      s4627(x4628)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t4625 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t4624 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t4642 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t4624), @class.cond_cases_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.strip_tac), t4625), t4629), t4630), t4631), t4632), t4633), t4634), t4635), t4636), t4637), t4638), t4639), t4640), t4641), @tactics.disch_tac])
  let t4623 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && (b → (a : Bool)) → a && b")))
  let t4622 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_rmul(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t4621 = @tactics.match_mp_tac(@realanalysis.real_integral_abs_bound_integral())
  let t4620 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realanalysis.real_integral_rmul()), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t4619 = @simp.gen_rewrite_tac(fn(x4616 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4617 = @equal.rand_conv(x4616)
    fn(x4618 : @kernel.Term) -> @kernel.Thm raise {
      s4617(x4618)
    }
  }, @list.List([@realax.real_div()]))
  let t4613 = @simp.rewrite_tac(@list.List([@real.real_pow2_abs()]))
  let t4612 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_div(), @calc_int.real_abs_num(), @real.real_abs_pow()]))
  let t4614 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x4609 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x4609
    let t4611 = @tactics.mp_tac(@drule.match_mp(@realanalysis.absolutely_real_integrable_abs())(th_2))
    @tactics.then_tac(@tactics.assume_tac(th_2), t4611)
  }), t4612), t4613), @tactics.disch_tac)
  let t4605 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t4604 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t4606 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("(real_of_num(2) * pow((x : Real), 2) == real_of_num(0)) == (x == real_of_num(0))"))])), t4604), t4605), @calc_rat.asm_real_arith_tac)
  let t4607 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_withinreal()), @realanalysis.real_differentiable_tac), t4606])
  let t4603 = @tactics.match_mp_tac(@realanalysis.real_continuous_inv_withinreal())
  let t4602 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t4601 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t4608 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()])), t4601), t4602), @tactics.strip_tac), t4603), @tactics.conj_tac), t4607)
  let t4596 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval()])), @calc_rat.asm_real_arith_tac)
  let t4593 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t4592 = @tactics.match_mp_tac(absolutely_real_integrable_periodic_offset())
  let t4591 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t4590 = @simp.rewrite_tac(@list.List([@realax.real_sub(), @calc_int.real_neg_neg()]))
  let t4589 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.absolutely_real_integrable_on())]))
  let t4588 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_integrable_reflect())]))
  let t4594 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_sub(), @realanalysis.absolutely_real_integrable_on()])), t4588), t4589), t4590), t4591), t4592), t4593)
  let t4587 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - -pi == real_of_num(2) * pi"))]))
  let t4586 = @tactics.match_mp_tac(absolutely_real_integrable_periodic_offset())
  let t4595 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_add_sym()])), t4586), t4587), t4594])
  let t4597 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_add()), @tactics.conj_tac), t4595), t4596])
  let t4585 = @tactics.exists_tac(@term_syntax.parse_term("real_interval([(-pi, pi)])"))
  let t4584 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_on_subinterval())
  let t4583 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_const()]))
  let t4582 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_sub())
  let t4598 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t4582), t4583), t4584), t4585), @tactics.conj_tac), t4597)
  let t4581 = @simp.rewrite_tac(@list.List([@metric.real_compact_interval()]))
  let t4580 = @tactics.match_mp_tac(@realanalysis.real_compact_continuous_image())
  let t4599 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.real_compact_imp_bounded()), t4580), t4581)
  let t4579 = @tactics.match_mp_tac(@realanalysis.real_integrable_continuous())
  let t4600 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.integrable_imp_real_measurable()), t4579), t4599, t4598])
  let t4578 = @tactics.repeat_tac(@tactics.conj_tac)
  let t4577 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t4576 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_bounded_measurable_product())
  let t4575 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t4615 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t4575), t4576), t4577), t4578), t4600), t4608), t4614])
  let t4574 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((x : Real) => (h : (Real) -> Real)(x) / (real_of_num(2) * pow(sin(x / real_of_num(2)), 2)), real_interval([((k : Real), pi)]))"), fn(x4571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4572 = @tactics.mp_tac(x4571)
    fn(x4573 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4572(x4573)
    }
  })
  let t4570 = @simp.asm_simp_tac(@list.List([fejer_kernel_v1(), @arith.le_1()]))
  let t4569 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4568 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4567 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4565 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_n()]))
  let t4564 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t4566 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t4564), t4565)])
  let t4563 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_integral(real_interval([((k : Real), pi)]), (x : Real) => abs((h : (Real) -> Real)(x)) / (real_of_num(2) * pow(sin(x / real_of_num(2)), 2))) / real_of_num(n)"))
  let t4667 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_null_comparison()), t4563), @tactics.conj_tac), t4566), t4567), t4568), t4569), @tactics.disch_tac), t4570), t4574), t4615), t4619), t4620), t4621), t4622), t4623), @tactics.conj_tac), t4642), t4643), t4644), t4645), t4646), t4647), t4648), @tactics.conj_tac), t4651), t4652), t4653), t4654), t4655), t4656), t4657), t4658), @tactics.conj_tac), t4666), @tactics.all_tac])
  let t4562 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => real_integral(real_interval([((k : Real), pi)]), (x : Real) => fejer_kernel(n, x) * (h : (Real) -> Real)(x)), real_of_num(0), sequentially)"), fn(x4559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4560 = @tactics.mp_tac(x4559)
    fn(x4561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4560(x4561)
    }
  })
  let t4557 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t4556 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4555 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])))
  let t4554 = @tactics.exists_tac(@term_syntax.parse_term("min((k : Real), pi) / real_of_num(2)"))
  let t4553 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Real)"))
  let t4552 = @simp.asm_simp_tac(@list.List([@misc.real_half(), @real.real_lt_div(), @transcendentals.pi_pos(), @sets.in_elim_thm(), @real.real_sub_rzero(), @theorems.left_imp_exists_thm()]))
  let t4548 = @term_syntax.parse_term("(e : Real) / real_of_num(2) / pi")
  let t4551 = @tactics.disch_then(fn(x4550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4546 = @tactics.mp_tac(x4545)
      fn(x4547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4546(x4547)
      }
    })(((x4549 : @kernel.Thm) => @bool.spec(t4548, x4549))(x4550))
  })
  let t4544 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal()]))
  let t4558 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_minus_minus_minus_gt((h : (Real) -> Real), real_of_num(0), within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x}))")), t4544), t4551), t4552), t4553), @tactics.strip_tac), t4554), t4555), t4556), t4557), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4543 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k : Real, real_of_num(0) < k && k < pi && (∀ x : Real, real_of_num(0) < x && x <= k → abs((h : (Real) -> Real)(x)) < (e : Real) / real_of_num(2) / pi)"), @tactics.strip_assume_tac)
  let t4542 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t4541 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t4537 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t4536 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t4535 = @tactics.disch_then(fn(x4532 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x4532
    let t4534 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : Real) + (x : Real)"), th_1))
    @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t4534)
  })
  let t4531 = @simp.asm_rewrite_tac(@list.List([]))
  let t4530 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x4524 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4525 = @tactics.assume_tac(x4524)
    fn(x4526 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4525(x4526)
    }
  }, fn(x4527 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4528 = @tactics.mp_tac(x4527)
    fn(x4529 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4528(x4529)
    }
  }))
  let t4523 = @tactics.x_gen_tac(@term_syntax.parse_term("(d1 : Real)"))
  let t4522 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t4521 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t4520 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t4519 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t4518 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t4517 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal()]))
  let t4538 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_minus_minus_minus_gt((f : (Real) -> Real), (r : Real), within(atreal((t : Real)), {(x' : Real) | x' >= t}))")), t4517), t4518), t4519), t4520), t4521), t4522), t4523), t4530), t4531), t4535), t4536), t4537), @calc_rat.real_arith_tac)
  let t4516 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t4515 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t4514 = @tactics.disch_then(fn(x4511 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x4511
    let t4513 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : Real) - (x : Real)"), th))
    @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t4513)
  })
  let t4510 = @simp.asm_rewrite_tac(@list.List([]))
  let t4509 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x4503 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4504 = @tactics.assume_tac(x4503)
    fn(x4505 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4504(x4505)
    }
  }, fn(x4506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4507 = @tactics.mp_tac(x4506)
    fn(x4508 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4507(x4508)
    }
  }))
  let t4502 = @tactics.x_gen_tac(@term_syntax.parse_term("(d1 : Real)"))
  let t4501 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t4500 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t4499 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t4498 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t4497 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t4496 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal()]))
  let t4539 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_minus_minus_minus_gt((f : (Real) -> Real), (l : Real), within(atreal((t : Real)), {(x' : Real) | x' <= t}))")), t4496), t4497), t4498), t4499), t4500), t4501), t4502), t4509), t4510), t4514), t4515), t4516), @calc_rat.real_arith_tac), t4538])
  let t4495 = @tactics.match_mp_tac(@realanalysis.reallim_null_add())
  let t4494 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(f' : Real) + (f : Real) - ((l : Real) + (l' : Real)) == f - l + (f' - l')"))]))
  let t4540 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t4494), t4495), @tactics.conj_tac), t4539), @tactics.all_tac])
  let t4493 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_minus_gt((h : (Real) -> Real), real_of_num(0), within(atreal(real_of_num(0)), {(x : Real) | real_of_num(0) <= x}))"), fn(x4490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4491 = @tactics.assume_tac(x4490)
    fn(x4492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4491(x4492)
    }
  })
  let t4489 = @tactics.disch_then(fn(x4488 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t4487 = @simp.simp_tac(@list.List([]))
  let t4484 = @simp.gen_rewrite_rule(fn(x4483 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4483
  }, @list.List([@class.fun_eq_thm()]))
  let t4486 = @tactics.first_assum(fn(x4485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4480 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4481 = @tactics.mp_tac(x4480)
      fn(x4482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4481(x4482)
      }
    })(t4484(x4485))
  })
  let t4479 = @simp.abbrev_tac(@term_syntax.parse_term("(h : (Real) -> Real) == ((u : Real) => (f : (Real) -> Real)((t : Real) + u) + f(t - u) - ((l : Real) + (r : Real)))"))
  let t4478 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * ((x : Real) / real_of_num(2)) == x"))]))
  let t4477 = @simp.asm_simp_tac(@list.List([fourier_sum_limit_fejer_kernel_half()]))
  let t4476 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4473 = @term_syntax.parse_term("(r : Real)")
  let t4474 = @term_syntax.parse_term("(l : Real)")
  let t4475 = @term_syntax.parse_term("(t : Real)")
  let t4772 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t4475, t4474, t4473])), t4476), t4477), t4478), t4479), t4486), t4487), t4489), t4493), t4540), t4541), t4542), @tactics.disch_tac), t4543), t4558), t4562), t4667), t4668), t4675), t4676), t4679), t4680), t4681), t4682), @tactics.strip_tac), t4689), t4690), t4694), @tactics.ants_tac), t4697), t4698), t4699), t4700), @tactics.conj_tac), t4771)
  fourier_fejer_cesaro_summable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ x : Real, ∀ l : Real, ∀ r : Real, absolutely_real_integrable_on(f, real_interval([(-pi, pi)])) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) && op_minus_minus_minus_gt(f, l, within(atreal(x), {(x' : Real) | x' <= x})) && op_minus_minus_minus_gt(f, r, within(atreal(x), {(x' : Real) | x' >= x})) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n - 1), (m : Num) => sum(op_dot_dot(0, 2 * m), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, x))) / real_of_num(n), (l + r) / real_of_num(2), sequentially)"), t4772))
}

///|
let fourier_fejer_cesaro_summable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_FEJER_CESARO_SUMMABLE")

///|
/// `FOURIER_FEJER_CESARO_SUMMABLE`
pub fn fourier_fejer_cesaro_summable() -> @kernel.Thm {
  fourier_fejer_cesaro_summable_c.get()
}

///|
/// FOURIER_FEJER_CESARO_SUMMABLE_SIMPLE
fn step_167() -> Unit raise {
  let t4785 = @meson.asm_meson_tac(@list.List([@realanalysis.real_continuous_on_eq_real_continuous_at(), @metric.real_open_univ(), @sets.in_univ()]))
  let t4784 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_continuous_atreal())]))
  let t4786 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@realanalysis.reallim_atreal_withinreal())), t4784), t4785)
  let t4783 = @meson.asm_meson_tac(@list.List([@realanalysis.real_continuous_on_subset(), @sets.subset_univ()]))
  let t4787 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_continuous()), t4783), t4786])
  let t4782 = @simp.asm_rewrite_tac(@list.List([]))
  let t4781 = @tactics.match_mp_tac(fourier_fejer_cesaro_summable())
  let t4780 = @simp.gen_rewrite_tac(fn(x4779 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x4773 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4774 = @equal.rator_conv(x4773)
      fn(x4775 : @kernel.Term) -> @kernel.Thm raise {
        s4774(x4775)
      }
    })((fn(x4776 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4777 = @equal.rand_conv(x4776)
      fn(x4778 : @kernel.Term) -> @kernel.Thm raise {
        s4777(x4778)
      }
    })(x4779))
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (x + x) / real_of_num(2)"))]))
  let t4788 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4780), t4781), t4782), @tactics.conj_tac), t4787)
  fourier_fejer_cesaro_summable_simple_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ x : Real, ∀ l : _, ∀ r : _, real_continuous_on(f, UNIV) && (∀ x : Real, f(x + real_of_num(2) * pi) == f(x)) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(0, n - 1), (m : Num) => sum(op_dot_dot(0, 2 * m), (k : Num) => fourier_coefficient(f, k) * trigonometric_set(k, x))) / real_of_num(n), f(x), sequentially)"), t4788))
}

///|
let fourier_fejer_cesaro_summable_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOURIER_FEJER_CESARO_SUMMABLE_SIMPLE")

///|
/// `FOURIER_FEJER_CESARO_SUMMABLE_SIMPLE`
pub fn fourier_fejer_cesaro_summable_simple() -> @kernel.Thm {
  fourier_fejer_cesaro_summable_simple_c.get()
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
}
