// Translated from upstream Functionspaces/L2.ml; edit this file directly.

///|
/// Functionspaces/L2.ml:22
fn step_1() -> Unit raise {
  @printer.parse_as_infix("complex_measurable_on", (12L, "right"))
}

///|
/// complex_measurable
fn step_2() -> Unit raise {
  complex_measurable_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_measurable_on : ((Real) -> Cart[Real, 2], (Real) -> Bool) -> Bool)((f : (Real) -> Cart[Real, 2]), (s : (Real) -> Bool)) == (real_measurable_on((x : Real) => Re(f(x)), s) && real_measurable_on((x : Real) => Im(f(x)), s))")))
}

///|
let complex_measurable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_measurable")

///|
/// `complex_measurable`
pub fn complex_measurable() -> @kernel.Thm {
  complex_measurable_c.get()
}

///|
/// sq_integrable
fn step_3() -> Unit raise {
  let t1 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t2 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("{(f : (Real) -> Cart[Real, 2]) | complex_measurable_on(f, UNIV) && real_integrable_on((x : Real) => pow(norm(f(x)), 2), UNIV)}")), t1)
  let t3 = @tactics.prove(@term_syntax.parse_term("∃ s : ((Real) -> Cart[Real, 2]) -> Bool, ∀ f : (Real) -> Cart[Real, 2], IN(f, s) == (complex_measurable_on(f, UNIV) && real_integrable_on((x : Real) => pow(norm(f(x)), 2), UNIV))"), t2)
  sq_integrable_c.set(@nums.new_specification(@list.List(["sq_integrable"]))(t3))
}

///|
let sq_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sq_integrable")

///|
/// `sq_integrable`
pub fn sq_integrable() -> @kernel.Thm {
  sq_integrable_c.get()
}

///|
/// r_inprod
fn step_4() -> Unit raise {
  r_inprod_c.set(@pair.new_definition(@term_syntax.parse_term("(r_inprod : ((Real) -> Cart[Real, 2], (Real) -> Cart[Real, 2]) -> Cart[Real, 2])((f : (Real) -> Cart[Real, 2]), (g : (Real) -> Cart[Real, 2])) == complex((real_integral(UNIV, (x : Real) => Re(cnj(f(x)) * g(x))), real_integral(UNIV, (x : Real) => Im(cnj(f(x)) * g(x)))))")))
}

///|
let r_inprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("r_inprod")

///|
/// `r_inprod`
pub fn r_inprod() -> @kernel.Thm {
  r_inprod_c.get()
}

///|
/// FRECHET_REAL_DERIVATIVE_UNIQUE_WITHIN_CLOSED_INTERVAL
fn step_5() -> Unit raise {
  let tem = @simp.rewrite_rule(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("((A : Bool) && (B : Bool) && (C : Bool) → (Q : Bool)) == (C → A && B → Q)"))]))(@derivatives.frechet_derivative_unique_within_closed_interval())
  let t30 = @simp.rewrite_tac(@list.List([]))
  let t29 = @tactics.disch_then(fn(x18 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th1 = x18
    let t27 = @simp.simp_rule(@list.List([th1, @class.fun_eq_thm()]))
    let t23 = @simp.simp_rule(@list.List([@equal.gsym(@vectors.lift_eq_cmul()), @vectors.lift_eq()]))
    @tactics.pop_assum(fn(x28 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s21 = @tactics.mp_tac(x20)
            fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s21(x22)
            }
          })(t23(x24))
        })(((x25 : @kernel.Thm) => @q.spec("(vec : (Num) -> Cart[Real, Unit])(1)", x25))(x26))
      })(t27(x28))
    })
  })
  let t15 = @simp.simp_rule(@list.List([@topology.lift_in_interval(), @cart.dimindex_1(), @vectors.lift_drop(), @int.arith_rule(@term_syntax.parse_term("((x : Num) <= (i : Num) && i <= x) == (i == x)")), @vectors.lift(), @cart.lambda_beta()]))
  let t17 = @tactics.pop_assum(fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x12 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s13 = @tactics.assume_tac(x12)
      fn(x14 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s13(x14)
      }
    })(t15(x16))
  })
  let t9 = @drule.match_mp(tem)
  let t11 = @tactics.disch_then(fn(x10 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x6 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s7 = @tactics.assume_tac(x6)
      fn(x8 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s7(x8)
      }
    })(t9(x10))
  })
  let t5 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("((A : Bool) && (B : Bool) && (C : Bool) → (Q : Bool)) == (C → A && B → Q)")), @topology.image_lift_real_interval()]))
  let t4 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_frechet_derivative_within()]))
  let t31 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t4), t5), t11), t17), t29), t30)
  frechet_real_derivative_unique_within_closed_interval_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ f' : Real, ∀ f'' : Real, ∀ x : Real, ∀ a : Real, ∀ b : Real, a < b && IN(x, real_interval([(a, b)])) && has_real_derivative(f, f', within(atreal(x), real_interval([(a, b)]))) && has_real_derivative(f, f'', within(atreal(x), real_interval([(a, b)]))) → f' == f''"), t31))
}

///|
let frechet_real_derivative_unique_within_closed_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRECHET_REAL_DERIVATIVE_UNIQUE_WITHIN_CLOSED_INTERVAL")

///|
/// `FRECHET_REAL_DERIVATIVE_UNIQUE_WITHIN_CLOSED_INTERVAL`
pub fn frechet_real_derivative_unique_within_closed_interval() -> @kernel.Thm {
  frechet_real_derivative_unique_within_closed_interval_c.get()
}

///|
/// cfun_almost_zero
fn step_6() -> Unit raise {
  let t34 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_empty()]))
  let t35 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("cfun_zero", x32), @simp.rewrite_tac(@list.List([@cfunspace.cfun_zero(), @cfunspace.k_thm()]))), (x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("({} : (Real) -> Bool)", x33)), t34)
  let t36 = @tactics.prove(@term_syntax.parse_term("∃ f : (Real) -> Cart[Real, 2], ∃ k : (Real) -> Bool, real_negligible(k) && (∀ x : Real, !IN(x, k) → f(x) == Cx(real_of_num(0)))"), t35)
  cfun_almost_zero_c.set(@nums.new_specification(@list.List(["cfun_almost_zero"]))(t36))
}

///|
let cfun_almost_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_almost_zero")

///|
/// `cfun_almost_zero`
pub fn cfun_almost_zero() -> @kernel.Thm {
  cfun_almost_zero_c.get()
}

///|
/// is_almost_zero
fn step_7() -> Unit raise {
  is_almost_zero_c.set(@pair.new_definition(@term_syntax.parse_term("(is_almost_zero1 : ((Real) -> Cart[Real, 2]) -> Bool)((f : (Real) -> Cart[Real, 2])) == (∀ a : Real, ∀ b : Real, ∃ k : (Real) -> Bool, real_negligible(k) && (∀ x : Real, IN(x, DIFF(real_interval([(a, b)]), k)) → f(x) == Cx(real_of_num(0))))")))
}

///|
let is_almost_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_almost_zero")

///|
/// `is_almost_zero`
pub fn is_almost_zero() -> @kernel.Thm {
  is_almost_zero_c.get()
}

///|
/// REAL_INTEGRA_ZERO_SUBINTERVALS
fn step_8() -> Unit raise {
  let t51 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!((b : Real) <= (a : Real)) → a <= b"))]))
  let t49 = @equal.gsym(@realax.real_le_antisym())
  let t50 = @impconv.imp_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("∀ s : (Real) -> Bool, !(s == {}) → SUBSET(s, UNIV)")), @misc.real_interval_ne_empty(), t49, @realanalysis.has_real_integral_integrable_integral()]))
  let t48 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@realanalysis.has_real_integral_integrable_integral()])))
  let t47 = @tactics.mp_tac(@q.specl(@list.List(["f", "real_interval([((a : Real), (b : Real))])", "(UNIV : (Real) -> Bool)"]), @realanalysis.real_integral_subset_le()))
  let t46 = @simp.asm_simp_tac(@list.List([]))
  let t45 = @tactics.mp_tac(@q.specl(@list.List(["f", "real_interval([((a : Real), (b : Real))])"]), @realanalysis.real_integral_pos()))
  let t43 = @simp.asm_rewrite_tac(@list.List([]))
  let t44 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@realanalysis.has_real_integral_alt(), @sets.set_rule(@term_syntax.parse_term("IN((x : Real), UNIV)")), @class.eta_ax()]))), t43), @tactics.all_tac])
  let t42 = @q.subgoal_then("∀ a : Real, ∀ b : Real, real_integrable_on(f, real_interval([(a, b)]))", fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s40 = @tactics.assume_tac(x39)
    fn(x41 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s40(x41)
    }
  })
  let t38 = @list.List([@simp.asm_simp_tac(@list.List([@realanalysis.has_real_integral_null()])), @tactics.all_tac])
  let t37 = @q.asm_cases_tac("b <= a")
  let t52 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t37), t38), t42), t44), t45), t46), t47), t48), t50), t51)
  real_integra_zero_subintervals_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, (∀ x : Real, real_of_num(0) <= f(x)) && has_real_integral(f, real_of_num(0), UNIV) → (∀ a : Real, ∀ b : Real, has_real_integral(f, real_of_num(0), real_interval([(a, b)])))"), t52))
}

///|
let real_integra_zero_subintervals_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INTEGRA_ZERO_SUBINTERVALS")

///|
/// `REAL_INTEGRA_ZERO_SUBINTERVALS`
pub fn real_integra_zero_subintervals() -> @kernel.Thm {
  real_integra_zero_subintervals_c.get()
}

///|
/// REAL_POW2_0
fn step_9() -> Unit raise {
  let t53 = @bool.spec(@term_syntax.parse_term("real_of_num(0)"), @real.real_sos_eq_0())
  real_pow2_0_c.set(@simp.rewrite_rule(@list.List([@realax.real_add_lid(), @real.real_pow_zero(), @calc_num.arith()]))(t53))
}

///|
let real_pow2_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW2_0")

///|
/// `REAL_POW2_0`
pub fn real_pow2_0() -> @kernel.Thm {
  real_pow2_0_c.get()
}

///|
/// RINPROD_ALMOST_ZERO
fn step_10() -> Unit raise {
  let t125 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) - real_of_num(0) == real_of_num(0)")), @calc_int.real_abs_num()]))
  let t124 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t123 = @impconv.imp_rewrite_tac(@list.List([@realanalysis.real_integral_unique()]))
  let t122 = @tactics.repeat_tac(@tactics.strip_tac)
  let t121 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(1)"))]))
  let t126 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)")), t121), t122), t123), t124), t125)
  let t127 = @list.List([@meson.asm_meson_tac(@list.List([@realanalysis.has_real_integral_integrable()])), t126])
  let t120 = @tactics.repeat_tac(@tactics.strip_tac)
  let t119 = @list.List([@impconv.imp_rewrite_tac(@list.List([@realanalysis.has_real_integral_negligible(), real_pow2_0(), @complexes.complex_norm_zero()])), @tactics.all_tac])
  let t118 = @q.subgoal_then("∀ a : Real, ∀ b : Real, has_real_integral((x : Real) => pow(norm(f(x)), 2), real_of_num(0), real_interval([(a, b)]))", fn(x115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s116 = @tactics.assume_tac(x115)
    fn(x117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s116(x117)
    }
  })
  let t114 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_alt(), @sets.set_rule(@term_syntax.parse_term("IN((x : Real), UNIV)"))]))
  let t113 = @tactics.match_mp_tac(@realanalysis.real_integral_unique())
  let t112 = @tactics.repeat_tac(@tactics.strip_tac)
  let t111 = @simp.rewrite_tac(@list.List([is_almost_zero()]))
  let t109 = @simp.asm_simp_tac(@list.List([is_almost_zero()]))
  let t108 = @tactics.disch_then(fn(x103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x103
    @tactics.pop_assum(fn(x105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th1 = x105
      let t107 = @drule.match_mp(th1)(th)
      @tactics.assume_tac(@simp.simp_rule(@list.List([real_pow2_0(), @complexes.complex_norm_zero()]))(t107))
    })
  })
  let t99 = @meson.asm_meson_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("(!((a : Real) < (b : Real)) && (a <= (x : Real) && x <= b) && !(x == a)) == false"))]))
  let t100 = @tactics.then_tac(@tactics.then_tac((x98 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("{(a : Real)}", x98), @simp.asm_simp_tac(@list.List([@realanalysis.real_negligible_finite(), @sets.finite_sing(), @misc.real_interval(), @sets.in_elim_thm(), @sets.in_diff(), @sets.in_sing()]))), t99)
  let t97 = @meson.asm_meson_tac(@list.List([@sets.in_diff()]))
  let t96 = @simp.asm_simp_tac(@list.List([]))
  let t95 = @tactics.map_every(fn(x93 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x94 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      @q.exists_tac(x93, x94)
    }
  }, @list.List(["(x : Real) => real_of_num(0)", "x'", "a", "b"]))
  let t92 = @tactics.match_mp_tac(frechet_real_derivative_unique_within_closed_interval())
  let t91 = @tactics.repeat_tac(@tactics.strip_tac)
  let t90 = @tactics.assume_tac(@q.specl(@list.List(["real_of_num(0)", "within(atreal((x : Real)), real_interval([((a : Real), (b : Real))]))"]), @realanalysis.has_real_derivative_const()))
  let t101 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("k", x89), @simp.asm_simp_tac(@list.List([]))), t90), t91), t92), t95), t96), t97), t100])
  let t88 = @q.asm_cases_tac("a < b")
  let t87 = @tactics.repeat_tac(@tactics.strip_tac)
  let t82 = @term_syntax.parse_term("(b : Real)")
  let t83 = @list.List([@term_syntax.parse_term("(a : Real)"), t82])
  let t86 = @tactics.pop_assum(fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s80 = @tactics.mp_tac(x79)
      fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s80(x81)
      }
    })(((x84 : @kernel.Thm) => @bool.specl(t83, x84))(x85))
  })
  let t102 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t86), t87), t88), t101), @tactics.all_tac])
  let t78 = @tactics.subgoal_then(@term_syntax.parse_term("(∀ a : Real, ∀ b : Real, ∃ k : (Real) -> Bool, real_negligible(k) && (∀ x : Real, IN(x, DIFF(real_interval([(a, b)]), k)) → has_real_derivative((x : Real) => real_of_num(0), pow(norm((f : (Real) -> Cart[Real, 2])(x)), 2), within(atreal(x), real_interval([(a, b)]))))) → (∀ a : Real, ∀ b : Real, ∃ k : (Real) -> Bool, real_negligible(k) && (∀ x : Real, IN(x, DIFF(real_interval([(a, b)]), k)) → pow(norm(f(x)), 2) == real_of_num(0)))"), fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s76 = @tactics.assume_tac(x75)
    fn(x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s76(x77)
    }
  })
  let t74 = @simp.asm_rewrite_tac(@list.List([]))
  let t73 = @simp.asm_simp_tac(@list.List([@real.real_le_pow_2(), @realanalysis.has_real_integral_integrable_integral()]))
  let t72 = @tactics.mp_tac(@q.spec("(x : Real) => pow(norm((f : (Real) -> Cart[Real, 2])(x)), 2)", real_integra_zero_subintervals()))
  let t71 = @simp.asm_rewrite_tac(@list.List([]))
  let t70 = @tactics.mp_tac(@q.spec("(x : Real) => pow(norm((f : (Real) -> Cart[Real, 2])(x)), 2)", @realanalysis.has_real_derivative_indefinite_integral()))
  let t68 = @simp.asm_rewrite_tac(@list.List([]))
  let t69 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@realanalysis.has_real_integral_alt(), @sets.set_rule(@term_syntax.parse_term("IN((x : Real), UNIV)")), @class.eta_ax()]))), t68), @tactics.all_tac])
  let t67 = @q.subgoal_then("∀ a : Real, ∀ b : Real, real_integrable_on((x : Real) => pow(norm(f(x)), 2), real_interval([(a, b)]))", fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s65 = @tactics.assume_tac(x64)
    fn(x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s65(x66)
    }
  })
  let t63 = @tactics.disch_then(fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let thm = x60
    let t62 = @tactics.mp_tac(thm)
    @tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realanalysis.has_real_integral_integrable_integral())]))(thm)), t62)
  })
  let t59 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("((P : Bool) → (Q : Bool) → (A : Bool)) == (P && Q → A)"))]))
  let t110 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x56 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s57 = @tactics.mp_tac(x56)
    fn(x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s57(x58)
    }
  }), t59), t63), t67), t69), t70), t71), t72), t73), @tactics.disch_tac), t74), t78), t102), t108), t109), @tactics.all_tac])
  let t55 = @tactics.repeat_tac(@tactics.strip_tac)
  let t54 = @equal.gsym(@complexes.cx_pow())
  let t128 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([sq_integrable(), r_inprod(), r_inprod(), @complexes.re_cx(), @complexes.im_cx(), @equal.gsym(@complexes.cx_def()), @complexes.complex_mul_cnj(), t54, @realanalysis.real_integral_0(), @complexes.cx_inj()])), t55), @tactics.eq_tac), t110), t111), t112), t113), t114), t118), t119), t120), t127)
  rinprod_almost_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Cart[Real, 2], IN(f, sq_integrable) → (r_inprod(f, f) == Cx(real_of_num(0))) == is_almost_zero1(f)"), t128))
}

///|
let rinprod_almost_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RINPROD_ALMOST_ZERO")

///|
/// `RINPROD_ALMOST_ZERO`
pub fn rinprod_almost_zero() -> @kernel.Thm {
  rinprod_almost_zero_c.get()
}

///|
/// ALOMST_ZERO_ZERO
fn step_11() -> Unit raise {
  let t157 = @meson.asm_meson_tac(@list.List([@real.real_sub_rzero(), @realanalysis.has_real_integral_integrable_integral(), @real.real_abs_0()]))
  let t153 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_rzero(), @complexes.re_cx(), @complexes.im_cx()]))
  let t148 = @term_syntax.parse_term("(s : (Real) -> Bool)")
  let t151 = @tactics.pop_assum(fn(x150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x149 : @kernel.Thm) => @tactics.x_choose_tac(t148, x149))(@bool.spec_all(x150))
  })
  let t147 = @tactics.match_mp_tac(@realanalysis.has_real_integral_negligible())
  let t154 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t147), t151), (x152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("s", x152)), t153), @tactics.all_tac])
  let t155 = @tactics.thenl(@q.subgoal_then("∀ a : Real, ∀ b : Real, has_real_integral((x : Real) => Im(cnj(g(x)) * f(x)), real_of_num(0), real_interval([(a, b)]))", fn(x144 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s145 = @tactics.assume_tac(x144)
    fn(x146 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s145(x146)
    }
  }), t154)
  let t142 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_rzero(), @complexes.re_cx(), @complexes.im_cx()]))
  let t137 = @term_syntax.parse_term("(s : (Real) -> Bool)")
  let t140 = @tactics.pop_assum(fn(x139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x138 : @kernel.Thm) => @tactics.x_choose_tac(t137, x138))(@bool.spec_all(x139))
  })
  let t136 = @tactics.match_mp_tac(@realanalysis.has_real_integral_negligible())
  let t143 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t136), t140), (x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("s", x141)), t142), @tactics.all_tac])
  let t156 = @list.List([@tactics.thenl(@q.subgoal_then("∀ a : Real, ∀ b : Real, has_real_integral((x : Real) => Re(cnj(g(x)) * f(x)), real_of_num(0), real_interval([(a, b)]))", fn(x133 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s134 = @tactics.assume_tac(x133)
    fn(x135 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s134(x135)
    }
  }), t143), t155])
  let t132 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([is_almost_zero()])))
  let t131 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_alt(), @sets.set_rule(@term_syntax.parse_term("IN((x : Real), UNIV)"))]))
  let t130 = @tactics.match_mp_tac(@realanalysis.real_integral_unique())
  let t129 = @tactics.repeat_tac(@tactics.strip_tac)
  let t158 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([r_inprod(), @complexes.complex_eq(), @complexes.cx_def(), @complexes.re(), @complexes.im()])), t129), t130), t131), t132), t156), t157)
  alomst_zero_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Cart[Real, 2], ∀ g : (Real) -> Cart[Real, 2], is_almost_zero1(f) → r_inprod(g, f) == Cx(real_of_num(0))"), t158))
}

///|
let alomst_zero_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALOMST_ZERO_ZERO")

///|
/// `ALOMST_ZERO_ZERO`
pub fn alomst_zero_zero() -> @kernel.Thm {
  alomst_zero_zero_c.get()
}

///|
/// RINPROD_ZERO_EQ
fn step_12() -> Unit raise {
  let t159 = @meson.meson_tac(@list.List([alomst_zero_zero(), rinprod_almost_zero()]))
  rinprod_zero_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Real) -> Cart[Real, 2], ∀ y : (Real) -> Cart[Real, 2], IN(x, sq_integrable) && r_inprod(x, x) == Cx(real_of_num(0)) → r_inprod(y, x) == Cx(real_of_num(0))"), t159))
}

///|
let rinprod_zero_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RINPROD_ZERO_EQ")

///|
/// `RINPROD_ZERO_EQ`
pub fn rinprod_zero_eq() -> @kernel.Thm {
  rinprod_zero_eq_c.get()
}

///|
/// SQ_RULE
fn step_13() -> Unit raise {
  sq_rule_c.set(@calc_rat.real_field(@term_syntax.parse_term("pow((a : Real) + (b : Real), 2) == pow(a, 2) + (pow(b, 2) + real_of_num(2) * (a * b))")))
}

///|
let sq_rule_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQ_RULE")

///|
/// `SQ_RULE`
pub fn sq_rule() -> @kernel.Thm {
  sq_rule_c.get()
}

///|
/// SQ_RULE_SUB
fn step_14() -> Unit raise {
  sq_rule_sub_c.set(@calc_rat.real_field(@term_syntax.parse_term("pow((a : Real) - (b : Real), 2) == pow(a, 2) + (pow(b, 2) - real_of_num(2) * (a * b))")))
}

///|
let sq_rule_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQ_RULE_SUB")

///|
/// `SQ_RULE_SUB`
pub fn sq_rule_sub() -> @kernel.Thm {
  sq_rule_sub_c.get()
}

///|
/// ABS_POW_2
fn step_15() -> Unit raise {
  abs_pow_2_c.set(@meson.meson(@list.List([@real.real_abs_refl(), @real.real_le_pow_2()]), @term_syntax.parse_term("∀ x : Real, abs(pow(x, 2)) == pow(x, 2)")))
}

///|
let abs_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_POW_2")

///|
/// `ABS_POW_2`
pub fn abs_pow_2() -> @kernel.Thm {
  abs_pow_2_c.get()
}

///|
/// SQ_INTEGRABLE_SUBSPACE
fn step_16() -> Unit raise {
  let t183 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t181 = @equal.gsym(sq_rule_sub())
  let t182 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == a1 + a2 + (b1 + (b2 - c1))")), t181, @real.real_abs_pow()]))
  let t180 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t179 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t178 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @real.real_abs_mul(), @calc_int.real_abs_num()]))
  let t176 = @tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable())
  let t174 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t172 = @equal.gsym(sq_rule_sub())
  let t173 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == a1 + (a2 - c1) + (b1 + b2)")), t172, @real.real_abs_pow()]))
  let t171 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t170 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t169 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @real.real_abs_mul(), @calc_int.real_abs_num()]))
  let t175 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x168 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => pow(Re(x(x')), 2) + pow(Im(x(x')), 2) + (pow(Re(y(x')), 2) + pow(Im(y(x')), 2))", x168)), t169), t170), t171), t173), t174), @tactics.all_tac])
  let t167 = @tactics.repeat_tac(@tactics.strip_tac)
  let t166 = @tactics.match_mp_tac(@realanalysis.real_integrable_add())
  let t165 = @simp.asm_rewrite_tac(@list.List([]))
  let t164 = @tactics.match_mp_tac(@realanalysis.real_integrable_add())
  let t163 = @simp.asm_rewrite_tac(@list.List([]))
  let t162 = @tactics.match_mp_tac(@realanalysis.real_integrable_add())
  let t161 = @simp.asm_simp_tac(@list.List([@cfunspace.cfun_add_thm(), @complexes.complex_add(), @complexes.complex_sqnorm(), @complexes.re(), @complexes.im(), sq_rule(), @calc_rat.real_field(@term_syntax.parse_term("(a1 : Real) + ((b1 : Real) + (c1 : Real)) + ((a2 : Real) + ((b2 : Real) + (c2 : Real))) == a1 + a2 + (b1 + b2 + (c1 + c2))"))]))
  let t184 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([sq_rule(), @complexes.complex_sqnorm()]))), t161), t162), t163), t164), t165), t166), t167), t175), t176), (x177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => pow(Re(x(x')), 2) + pow(Im(x(x')), 2) + (pow(Re(y(x')), 2) + pow(Im(y(x')), 2))", x177)), t178), t179), t180), t182), t183)
  let t185 = @simp.asm_simp_tac(@list.List([@cfunspace.cfun_add_thm(), @complexes.im_add(), @realanalysis.real_measurable_on_add()]))
  let t186 = @simp.asm_simp_tac(@list.List([@cfunspace.cfun_add_thm(), @complexes.re_add(), @realanalysis.real_measurable_on_add()]))
  let t187 = @simp.asm_simp_tac(@list.List([@cfunspace.cfun_smul_v1(), @complexes.complex_norm_mul(), @real.real_pow_mul(), @realanalysis.real_integrable_lmul()]))
  let t188 = @simp.asm_simp_tac(@list.List([@cfunspace.cfun_smul_v1(), @realanalysis.real_measurable_on_lmul(), @complexes.im(), @complexes.complex_mul(), @realanalysis.real_measurable_on_add()]))
  let t189 = @list.List([@simp.asm_simp_tac(@list.List([@cfunspace.cfun_smul_v1(), @realanalysis.real_measurable_on_lmul(), @complexes.re(), @complexes.complex_mul(), @realanalysis.real_measurable_on_sub()])), t188, t187, t186, t185, t184])
  let t160 = @tactics.repeat_tac(@tactics.strip_tac)
  let t190 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cfunspace.is_cfun_subspace(), sq_integrable(), complex_measurable(), @cfunspace.cfun_zero(), @cfunspace.k_thm(), @complexes.re_cx(), @complexes.im_cx(), @realanalysis.real_measurable_on_0(), @complexes.complex_norm_0(), @real.real_pow_zero(), @calc_num.arith(), @realanalysis.real_integrable_0()])), t160), t189)
  sq_integrable_subspace_c.set(@tactics.prove(@term_syntax.parse_term("is_cfun_subspace(sq_integrable)"), t190))
}

///|
let sq_integrable_subspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQ_INTEGRABLE_SUBSPACE")

///|
/// `SQ_INTEGRABLE_SUBSPACE`
pub fn sq_integrable_subspace() -> @kernel.Thm {
  sq_integrable_subspace_c.get()
}

///|
/// RINPROD_SELF_POS
fn step_17() -> Unit raise {
  let t194 = @simp.asm_rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t193 = @tactics.match_mp_tac(@realanalysis.real_integral_pos())
  let t192 = @tactics.repeat_tac(@tactics.strip_tac)
  let t191 = @equal.gsym(@complexes.cx_def())
  let t195 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([sq_integrable(), @complexes.real_v1(), r_inprod(), @complexes.complex_mul_cnj(), @complexes.re_cx(), @complexes.im_cx(), @equal.gsym(@complexes.cx_pow()), @complexes.re(), @complexes.im(), @realanalysis.real_integral_0(), t191, @cfunspace.real_of_complex_cx()])), t192), t193), t194)
  rinprod_self_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Cart[Real, 2], IN(f, sq_integrable) → real(r_inprod(f, f)) && real_of_num(0) <= real_of_complex(r_inprod(f, f))"), t195))
}

///|
let rinprod_self_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RINPROD_SELF_POS")

///|
/// `RINPROD_SELF_POS`
pub fn rinprod_self_pos() -> @kernel.Thm {
  rinprod_self_pos_c.get()
}

///|
/// RINPROD_CNJ
fn step_18() -> Unit raise {
  let t226 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t224 = @equal.gsym(@realanalysis.real_integral_neg())
  let t225 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_neg_lmul()), @realanalysis.real_integrable_sub(), @realanalysis.real_integrable_neg(), @realanalysis.real_integrable_add(), t224]))
  let t222 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t220 = @equal.gsym(sq_rule_sub())
  let t221 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == b1 + (a2 - c1) + (b2 + a1)")), t220, @real.real_abs_pow()]))
  let t219 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t218 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t217 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t223 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x216 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(g(x')), 2) + pow(Im(g(x')), 2)))", x216)), t217), t218), t219), t221), t222), @tactics.all_tac])
  let t215 = @q.subgoal_then("real_integrable_on((x : Real) => Im(f(x)) * Re(g(x)), UNIV)", fn(x212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s213 = @tactics.assume_tac(x212)
    fn(x214 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s213(x214)
    }
  })
  let t210 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t208 = @equal.gsym(sq_rule_sub())
  let t209 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == a1 + (b2 - c1) + (b1 + a2)")), t208, @real.real_abs_pow()]))
  let t207 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t206 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t205 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t211 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(g(x')), 2) + pow(Im(g(x')), 2)))", x204)), t205), t206), t207), t209), t210), @tactics.all_tac])
  let t203 = @q.subgoal_then("real_integrable_on((x : Real) => Re(f(x)) * Im(g(x)), UNIV)", fn(x200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s201 = @tactics.assume_tac(x200)
    fn(x202 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s201(x202)
    }
  })
  let t199 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t198 = @tactics.repeat_tac(@tactics.strip_tac)
  let t197 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t196 = @tactics.repeat_tac(@tactics.strip_tac)
  let t227 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([sq_integrable(), complex_measurable(), @complexes.re(), @complexes.im(), @complexes.cnj(), @complexes.complex_sqnorm(), r_inprod(), @complexes.complex_mul()])), t196), @tactics.ap_term_tac), t197), t198), t199), t203), t211), t215), t223), t225), @tactics.ap_term_tac), t226), @calc_rat.real_arith_tac)
  rinprod_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Cart[Real, 2], ∀ g : (Real) -> Cart[Real, 2], IN(f, sq_integrable) && IN(g, sq_integrable) → cnj(r_inprod(f, g)) == r_inprod(g, f)"), t227))
}

///|
let rinprod_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RINPROD_CNJ")

///|
/// `RINPROD_CNJ`
pub fn rinprod_cnj() -> @kernel.Thm {
  rinprod_cnj_c.get()
}

///|
/// RINPROD_RSMUL
fn step_19() -> Unit raise {
  let t287 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_neg()]))
  let t285 = @tactics.match_mp_tac(@realanalysis.real_integrable_add())
  let t286 = @tactics.orelse_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_sub()), t285)
  let t283 = @tactics.orelse_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_lmul()), @tactics.all_tac)
  let t284 = @tactics.orelse_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))), @calc_rat.real_arith_tac), t283)
  let t282 = @tactics.repeat_tac(@tactics.strip_tac)
  let t278 = @equal.gsym(@realanalysis.real_integral_add())
  let t279 = @equal.gsym(@realanalysis.real_integral_sub())
  let t280 = @equal.gsym(@realanalysis.real_integral_lmul())
  let t281 = @impconv.imp_rewrite_tac(@list.List([@equal.gsym(@real.real_neg_lmul()), @realanalysis.real_integrable_sub(), @realanalysis.real_integrable_neg(), @realanalysis.real_integrable_add(), t280, @realanalysis.real_integrable_lmul(), t279, t278]))
  let t276 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t274 = @equal.gsym(sq_rule_sub())
  let t275 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == b1 + (b2 - c1) + (a2 + a1)")), t274, @real.real_abs_pow()]))
  let t273 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t272 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t271 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t277 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x270 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(g(x')), 2) + pow(Im(g(x')), 2)))", x270)), t271), t272), t273), t275), t276), @tactics.all_tac])
  let t269 = @q.subgoal_then("real_integrable_on((x : Real) => Im(f(x)) * Im(g(x)), UNIV)", fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s267 = @tactics.assume_tac(x266)
    fn(x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s267(x268)
    }
  })
  let t264 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t262 = @equal.gsym(sq_rule_sub())
  let t263 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == a1 + (a2 - c1) + (b2 + b1)")), t262, @real.real_abs_pow()]))
  let t261 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t260 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t259 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t265 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(g(x')), 2) + pow(Im(g(x')), 2)))", x258)), t259), t260), t261), t263), t264), @tactics.all_tac])
  let t257 = @q.subgoal_then("real_integrable_on((x : Real) => Re(f(x)) * Re(g(x)), UNIV)", fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s255 = @tactics.assume_tac(x254)
    fn(x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s255(x256)
    }
  })
  let t252 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t250 = @equal.gsym(sq_rule_sub())
  let t251 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == b1 + (a2 - c1) + (b2 + a1)")), t250, @real.real_abs_pow()]))
  let t249 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t248 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t247 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t253 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x246 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(g(x')), 2) + pow(Im(g(x')), 2)))", x246)), t247), t248), t249), t251), t252), @tactics.all_tac])
  let t245 = @q.subgoal_then("real_integrable_on((x : Real) => Im(f(x)) * Re(g(x)), UNIV)", fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s243 = @tactics.assume_tac(x242)
    fn(x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s243(x244)
    }
  })
  let t240 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t238 = @equal.gsym(sq_rule_sub())
  let t239 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == a1 + (b2 - c1) + (b1 + a2)")), t238, @real.real_abs_pow()]))
  let t237 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t236 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t235 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t241 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(g(x')), 2) + pow(Im(g(x')), 2)))", x234)), t235), t236), t237), t239), t240), @tactics.all_tac])
  let t233 = @q.subgoal_then("real_integrable_on((x : Real) => Re(f(x)) * Im(g(x)), UNIV)", fn(x230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s231 = @tactics.assume_tac(x230)
    fn(x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s231(x232)
    }
  })
  let t229 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t228 = @tactics.repeat_tac(@tactics.strip_tac)
  let t288 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([sq_integrable(), complex_measurable(), @cfunspace.cfun_smul_v1(), @complexes.re(), @complexes.im(), @complexes.cnj(), @complexes.complex_sqnorm(), r_inprod(), @complexes.complex_mul()])), t228), @tactics.ap_term_tac), t229), t233), t241), t245), t253), t257), t265), t269), t277), t281), t282), t284), t286), t287)
  rinprod_rsmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Cart[Real, 2], ∀ g : (Real) -> Cart[Real, 2], ∀ a : Cart[Real, 2], IN(f, sq_integrable) && IN(g, sq_integrable) → r_inprod(f, cfun_smul(a, g)) == a * r_inprod(f, g)"), t288))
}

///|
let rinprod_rsmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RINPROD_RSMUL")

///|
/// `RINPROD_RSMUL`
pub fn rinprod_rsmul() -> @kernel.Thm {
  rinprod_rsmul_c.get()
}

///|
/// RINPROD_LADD
fn step_20() -> Unit raise {
  let t397 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_neg()]))
  let t395 = @tactics.match_mp_tac(@realanalysis.real_integrable_add())
  let t396 = @tactics.orelse_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_sub()), t395)
  let t393 = @tactics.orelse_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_lmul()), @tactics.all_tac)
  let t394 = @tactics.orelse_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))), @calc_rat.real_arith_tac), t393)
  let t392 = @tactics.repeat_tac(@tactics.strip_tac)
  let t388 = @equal.gsym(@realanalysis.real_integral_add())
  let t389 = @equal.gsym(@realanalysis.real_integral_sub())
  let t390 = @equal.gsym(@realanalysis.real_integral_lmul())
  let t391 = @impconv.imp_rewrite_tac(@list.List([@equal.gsym(@real.real_neg_lmul()), @realanalysis.real_integrable_sub(), @realanalysis.real_integrable_neg(), @realanalysis.real_integrable_add(), t390, @realanalysis.real_integrable_lmul(), t389, t388]))
  let t386 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t384 = @equal.gsym(sq_rule_sub())
  let t385 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == b1 + (b2 - c1) + (a2 + a1)")), t384, @real.real_abs_pow()]))
  let t383 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t382 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t381 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t387 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(g(x')), 2) + pow(Im(g(x')), 2) + (pow(Re(z(x')), 2) + pow(Im(z(x')), 2)))", x380)), t381), t382), t383), t385), t386), @tactics.all_tac])
  let t379 = @q.subgoal_then("real_integrable_on((x : Real) => Im(g(x)) * Im(z(x)), UNIV)", fn(x376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s377 = @tactics.assume_tac(x376)
    fn(x378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s377(x378)
    }
  })
  let t374 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t372 = @equal.gsym(sq_rule_sub())
  let t373 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == a1 + (a2 - c1) + (b2 + b1)")), t372, @real.real_abs_pow()]))
  let t371 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t370 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t369 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t375 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(g(x')), 2) + pow(Im(g(x')), 2) + (pow(Re(z(x')), 2) + pow(Im(z(x')), 2)))", x368)), t369), t370), t371), t373), t374), @tactics.all_tac])
  let t367 = @q.subgoal_then("real_integrable_on((x : Real) => Re(g(x)) * Re(z(x)), UNIV)", fn(x364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s365 = @tactics.assume_tac(x364)
    fn(x366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s365(x366)
    }
  })
  let t362 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t360 = @equal.gsym(sq_rule_sub())
  let t361 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == b1 + (b2 - c1) + (a2 + a1)")), t360, @real.real_abs_pow()]))
  let t359 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t358 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t357 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t363 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(z(x')), 2) + pow(Im(z(x')), 2)))", x356)), t357), t358), t359), t361), t362), @tactics.all_tac])
  let t355 = @q.subgoal_then("real_integrable_on((x : Real) => Im(f(x)) * Im(z(x)), UNIV)", fn(x352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s353 = @tactics.assume_tac(x352)
    fn(x354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s353(x354)
    }
  })
  let t350 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t348 = @equal.gsym(sq_rule_sub())
  let t349 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == a1 + (a2 - c1) + (b2 + b1)")), t348, @real.real_abs_pow()]))
  let t347 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t346 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t345 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t351 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(z(x')), 2) + pow(Im(z(x')), 2)))", x344)), t345), t346), t347), t349), t350), @tactics.all_tac])
  let t343 = @q.subgoal_then("real_integrable_on((x : Real) => Re(f(x)) * Re(z(x)), UNIV)", fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s341 = @tactics.assume_tac(x340)
    fn(x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s341(x342)
    }
  })
  let t338 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t336 = @equal.gsym(sq_rule_sub())
  let t337 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == b1 + (a2 - c1) + (b2 + a1)")), t336, @real.real_abs_pow()]))
  let t335 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t334 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t333 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t339 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(g(x')), 2) + pow(Im(g(x')), 2) + (pow(Re(z(x')), 2) + pow(Im(z(x')), 2)))", x332)), t333), t334), t335), t337), t338), @tactics.all_tac])
  let t331 = @q.subgoal_then("real_integrable_on((x : Real) => Im(g(x)) * Re(z(x)), UNIV)", fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s329 = @tactics.assume_tac(x328)
    fn(x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s329(x330)
    }
  })
  let t326 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t324 = @equal.gsym(sq_rule_sub())
  let t325 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == a1 + (b2 - c1) + (b1 + a2)")), t324, @real.real_abs_pow()]))
  let t323 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t322 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t321 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t327 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(g(x')), 2) + pow(Im(g(x')), 2) + (pow(Re(z(x')), 2) + pow(Im(z(x')), 2)))", x320)), t321), t322), t323), t325), t326), @tactics.all_tac])
  let t319 = @q.subgoal_then("real_integrable_on((x : Real) => Re(g(x)) * Im(z(x)), UNIV)", fn(x316 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s317 = @tactics.assume_tac(x316)
    fn(x318 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s317(x318)
    }
  })
  let t314 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t312 = @equal.gsym(sq_rule_sub())
  let t313 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == b1 + (a2 - c1) + (b2 + a1)")), t312, @real.real_abs_pow()]))
  let t311 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t310 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t309 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t315 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x308 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(z(x')), 2) + pow(Im(z(x')), 2)))", x308)), t309), t310), t311), t313), t314), @tactics.all_tac])
  let t307 = @q.subgoal_then("real_integrable_on((x : Real) => Im(f(x)) * Re(z(x)), UNIV)", fn(x304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s305 = @tactics.assume_tac(x304)
    fn(x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s305(x306)
    }
  })
  let t302 = @meson.meson_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t300 = @equal.gsym(sq_rule_sub())
  let t301 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) + ((a2 : Real) + (b2 : Real)) - (c1 : Real) == a1 + (b2 - c1) + (b1 + a2)")), t300, @real.real_abs_pow()]))
  let t299 = @simp.once_rewrite_tac(@list.List([@equal.gsym(abs_pow_2())]))
  let t298 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t297 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measurable_on_lmul(), @realanalysis.real_measurable_on_mul(), @realanalysis.real_integrable_add(), @realanalysis.real_integrable_lmul(), @real.real_abs_mul(), @calc_int.real_abs_num(), @calc_rat.real_field(@term_syntax.parse_term("((x : Real) <= inv(real_of_num(2)) * (y : Real)) == (real_of_num(2) * x <= y)"))]))
  let t303 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), (x296 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("(x' : Real) => inv(real_of_num(2)) * (pow(Re(f(x')), 2) + pow(Im(f(x')), 2) + (pow(Re(z(x')), 2) + pow(Im(z(x')), 2)))", x296)), t297), t298), t299), t301), t302), @tactics.all_tac])
  let t295 = @q.subgoal_then("real_integrable_on((x : Real) => Re(f(x)) * Im(z(x)), UNIV)", fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s293 = @tactics.assume_tac(x292)
    fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s293(x294)
    }
  })
  let t291 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t290 = @tactics.repeat_tac(@tactics.strip_tac)
  let t289 = @equal.gsym(@realax.real_sub())
  let t398 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([sq_integrable(), complex_measurable(), @cfunspace.cfun_add_thm(), @complexes.re(), @complexes.im(), @complexes.cnj(), @complexes.complex_sqnorm(), r_inprod(), @complexes.complex_mul(), @complexes.re_add(), @complexes.im_add(), @equal.gsym(@real.real_neg_lmul()), @real.real_sub_rneg(), @real.real_add_rdistrib(), t289, @complexes.complex_add()])), t290), @tactics.ap_term_tac), t291), t295), t303), t307), t315), t319), t327), t331), t339), t343), t351), t355), t363), t367), t375), t379), t387), t391), t392), t394), t396), t397)
  rinprod_ladd_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Cart[Real, 2], ∀ g : (Real) -> Cart[Real, 2], ∀ z : (Real) -> Cart[Real, 2], IN(f, sq_integrable) && IN(g, sq_integrable) && IN(z, sq_integrable) → r_inprod(f + g, z) == r_inprod(f, z) + r_inprod(g, z)"), t398))
}

///|
let rinprod_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RINPROD_LADD")

///|
/// `RINPROD_LADD`
pub fn rinprod_ladd() -> @kernel.Thm {
  rinprod_ladd_c.get()
}

///|
/// SQ_INTEGRABLE_INNER_SPACE
fn step_21() -> Unit raise {
  let t400 = @simp.asm_simp_tac(@list.List([rinprod_ladd(), rinprod_rsmul(), rinprod_rsmul(), rinprod_zero_eq(), rinprod_cnj(), rinprod_self_pos(), sq_integrable_subspace()]))
  let t399 = @tactics.repeat_tac(@tactics.strip_tac)
  let t401 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cfunspace.is_inner_space()])), t399), t400)
  sq_integrable_inner_space_c.set(@tactics.prove(@term_syntax.parse_term("is_inner_space((sq_integrable, r_inprod))"), t401))
}

///|
let sq_integrable_inner_space_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQ_INTEGRABLE_INNER_SPACE")

///|
/// `SQ_INTEGRABLE_INNER_SPACE`
pub fn sq_integrable_inner_space() -> @kernel.Thm {
  sq_integrable_inner_space_c.get()
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
}
