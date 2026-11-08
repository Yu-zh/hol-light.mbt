// Translated from upstream Multivariate/gamma.ml; edit this file directly.

///|
/// euler_mascheroni
fn step_1() -> Unit raise {
  euler_mascheroni_c.set(@pair.new_definition(@term_syntax.parse_term("(euler_mascheroni : Real) == reallim(sequentially, (n : Num) => sum(op_dot_dot(1, n), (k : Num) => inv(real_of_num(k))) - log(real_of_num(n)))")))
}

///|
let euler_mascheroni_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euler_mascheroni")

///|
/// `euler_mascheroni`
pub fn euler_mascheroni() -> @kernel.Thm {
  euler_mascheroni_c.get()
}

///|
/// EULER_MASCHERONI
fn step_2() -> Unit raise {
  let t70 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le(), @real.real_of_num_lt()]))
  let t69 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t68 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) / real_of_num(2) <= real_of_num(1) - real_of_num(1) / (n : Real)) == (inv(n) <= inv(real_of_num(2)))"))]))
  let t67 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t66 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t65 = @simp.gen_rewrite_tac(fn(x62 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s63 = @equal.rand_conv(x62)
    fn(x64 : @kernel.Term) -> @kernel.Thm raise {
      s63(x64)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t61 = @simp.simp_tac(@list.List([@real.real_le_inv_eq(), @real.real_pow_le(), @realarith.real_pos()]))
  let t60 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t59 = @simp.gen_rewrite_tac(fn(x56 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s57 = @equal.rand_conv(x56)
    fn(x58 : @kernel.Term) -> @kernel.Thm raise {
      s57(x58)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t55 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_pow_inv()]))
  let t54 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t53 = @simp.rewrite_tac(@list.List([@real.real_abs_sub()]))
  let t52 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t51 = @simp.rewrite_tac(@list.List([@real.real_pow_1(), @vectors.vector_sub_rzero()]))
  let t49 = @equal.gsym(@complexes.cx_sub())
  let t50 = @simp.asm_simp_tac(@list.List([@complexes.complex_neg_neg(), @equal.gsym(@transcendentals.cx_log()), @realarith.real_lt_add(), @real.real_of_num_lt(), @arith.le_1(), @calc_num.arith(), @real.real_lt_inv_eq(), t49]))
  let t48 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_2(), @complexes.complex_mul_lneg(), @complexes.complex_mul_lid()]))
  let t47 = @simp.asm_simp_tac(@list.List([@complexes.complex_pow_1(), @real.real_inv_lt_1(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(1 < (n : Num)) == (2 <= n)"))]))
  let t46 = @simp.rewrite_tac(@list.List([@real.real_abs_inv(), @calc_int.real_abs_num(), @complexes.complex_div_1()]))
  let t45 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t44 = @simp.rewrite_tac(@list.List([@vectors.vsum_clauses_numseg()]))
  let t43 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), @vectors.vsum_sing_numseg(), @complexes.complex_norm_cx()]))
  let t38 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_n()]))
  let t37 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t39 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t37), t38)
  let t35 = @term_syntax.parse_term("Cx(inv(real_of_num((n : Num))))")
  let t36 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("0"), t35]), @cauchy.taylor_clog()))
  let t33 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (n : Real) → (n + real_of_num(1)) / n == real_of_num(1) + inv(n)"))
  let t34 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @real.real_of_num_lt(), @arith.le_1(), t33]))
  let t31 = @int.arith_rule(@term_syntax.parse_term("0 < (n : Num) + 1"))
  let t32 = @simp.asm_simp_tac(@list.List([@calc_int.real_abs_neg(), @equal.gsym(@transcendentals.log_div()), @real.real_of_num_lt(), @arith.le_1(), t31]))
  let t30 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t29 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t40 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t29), t30), @tactics.disch_tac), @class.cond_cases_tac), @list.List([@tactics.all_tac, @int.asm_arith_tac])), t32), t34), t36), t39])
  let t28 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_of_num(2) / real_of_num(n)"))
  let t27 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t26 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) - (x : Real) + (y : Real) == -(x - y)"))]))
  let t25 = @simp.rewrite_tac(@list.List([@iterate.sum_diffs(), @transcendentals.log_1(), @class.cond_rand(), @class.cond_rator()]))
  let t24 = @simp.rewrite_tac(@list.List([@iterate.sum_add_numseg(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (y : Real) - (x - (z : Real)) == y + z"))]))
  let t23 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.reallim_transform()))
  let t22 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : Real)"))
  let t21 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t41 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.real_summable(), @realanalysis.real_sums(), @misc.from_inter_numseg()])), t21), t22), t23), t24), t25), t26), t27), t28), @tactics.conj_tac), t40)
  let t17 = @term_syntax.parse_term("Cx(inv(real_of_num((n : Num))))")
  let t18 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("1"), t17]), @cauchy.taylor_clog()))
  let t15 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (n : Real) → (n + real_of_num(1)) / n == real_of_num(1) + inv(n)"))
  let t16 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @real.real_of_num_lt(), @arith.le_1(), t15]))
  let t13 = @int.arith_rule(@term_syntax.parse_term("0 < (n : Num) + 1"))
  let t14 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_div()), @real.real_of_num_lt(), @arith.le_1(), t13]))
  let t12 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + ((b : Real) - (c : Real)) == a - (c - b)"))]))
  let t11 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t10 = @simp.rewrite_tac(@list.List([@arith.ge(), @misc.in_from()]))
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("2")), t10), t11), @tactics.strip_tac), t12), t14), t16), t18)
  let t9 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t8 = @tactics.match_mp_tac(@realanalysis.real_summable_zeta_integer())
  let t7 = @tactics.match_mp_tac(@realanalysis.real_summable_lmul())
  let t20 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t7), t8), t9), t19])
  let t6 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) => real_of_num(2) / pow(real_of_num(k), 2)"))
  let t42 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_summable_comparison()), t6), @tactics.conj_tac), t20), t41])
  let t5 = @tactics.subgoal_then(@term_syntax.parse_term("real_summable(from(1), (k : Num) => inv(real_of_num(k)) + (log(real_of_num(k)) - log(real_of_num(k + 1))))"), fn(x2 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3 = @tactics.mp_tac(x2)
    fn(x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3(x4)
    }
  })
  let t1 = @tactics.conv_tac(@class.select_conv)
  let t71 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([euler_mascheroni(), @realanalysis.reallim()])), t1), t5), t42), t43), t44), t45), t46), t47), t48), t50), t51), t52), t53), t54), t55), t59), t60), t61), t65), t66), t67), t68), t69), t70), @int.asm_arith_tac)
  euler_mascheroni_v1_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(1, n), (k : Num) => inv(real_of_num(k))) - log(real_of_num(n)), euler_mascheroni, sequentially)"), t71))
}

///|
let euler_mascheroni_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_MASCHERONI")

///|
/// `EULER_MASCHERONI`
pub fn euler_mascheroni_v1() -> @kernel.Thm {
  euler_mascheroni_v1_c.get()
}

///|
/// LOG2_APPROX_40
fn step_3() -> Unit raise {
  let t88 = @simp.simp_tac(@list.List([@transcendentals.log_inv(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)"))]))
  let t87 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t86 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t85 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t84 = @tactics.conv_tac(@equal.once_depth_conv(@iterate.expand_sum_conv))
  let t83 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) / (c : Real)) == a / c * b"))]))
  let t82 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t81 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t73 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) + -inv(real_of_num(2))"))
  let t74 = @equal.gsym(@complexes.cx_sub())
  let t75 = @equal.gsym(@transcendentals.cx_log())
  let t76 = @equal.gsym(@complexes.cx_mul())
  let t77 = @equal.gsym(@complexes.cx_add())
  let t78 = @equal.gsym(@complexes.cx_neg())
  let t79 = @equal.gsym(@complexes.cx_pow())
  let t80 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.cx_div()), t79, t78, t77, t76, @complexes.vsum_cx(), @complexes.complex_norm_cx(), t75, t74, t73]))
  let t72 = @term_syntax.parse_term("Cx(-inv(real_of_num(2)))")
  let t89 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("41"), t72]), @cauchy.taylor_clog())), t80), t81), t82), t83), t84), t85), t86), t87), t88), @calc_rat.real_arith_tac)
  log2_approx_40_c.set(@tactics.prove(@term_syntax.parse_term("abs(log(real_of_num(2)) - real_of_num(381061692393) / real_of_num(549755813888)) <= inv(pow(real_of_num(2), 40))"), t89))
}

///|
let log2_approx_40_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOG2_APPROX_40")

///|
/// `LOG2_APPROX_40`
pub fn log2_approx_40() -> @kernel.Thm {
  log2_approx_40_c.get()
}

///|
/// EULER_MASCHERONI_APPROX_32
fn step_4() -> Unit raise {
  let t227 = @simp.simp_tac(@list.List([@real.real_pow_le(), @realarith.real_pos()]))
  let t226 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("(((x : Real) - (y : Real)) / real_of_num(60) <= inv(real_of_num(60)) * x) == (real_of_num(0) <= y)"))]))
  let t225 = @simp.rewrite_tac(@list.List([@real.real_inv_mul()]))
  let t223 = @drule.match_mp(@realanalysis.real_integral_unique())
  let t228 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x220 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s221 = @tactics.subst1_tac(x220)
      fn(x222 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s221(x222)
      }
    })(t223(x224))
  }), t225), t226), t227)
  let t219 = @meson.asm_meson_tac(@list.List([@realanalysis.real_integrable_on()]))
  let t218 = @simp.asm_rewrite_tac(@list.List([]))
  let t229 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integral_abs_bound_integral()), t218), t219), t228])
  let t216 = @term_syntax.parse_term("real_integral(real_interval([(real_of_num((m : Num)), real_of_num((n : Num)))]), (x : Real) => inv(real_of_num(12) * pow(x, 6)))")
  let t217 = @tactics.trans_tac(@realax.real_le_trans())(t216)
  let t215 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t214 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t212 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_lmul(), @real.real_abs_mul(), @realax.real_mul_assoc()]))
  let t211 = @meson.asm_meson_tac(@list.List([@realanalysis.real_integrable_on()]))
  let t210 = @simp.asm_rewrite_tac(@list.List([@realanalysis.real_integrable_const()]))
  let t209 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => inv(real_of_num(12) * pow(x, 6))"))
  let t213 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_bounded_by_integrable_imp_integrable()), t209), t210), t211), t212])
  let t208 = @tactics.subgoal_then(@term_syntax.parse_term("real_integrable_on((x : Real) => bernoulli(5, frac(x)) / pow(x, 6), real_interval([(real_of_num((m : Num)), real_of_num((n : Num)))]))"), fn(x205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s206 = @tactics.assume_tac(x205)
    fn(x207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s206(x207)
    }
  })
  let t201 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t200 = @tactics.match_mp_tac(@real.real_pow_le())
  let t199 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t202 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= x) == (real_of_num(0) <= x)"))])), t199), t200), t201), @calc_rat.asm_real_arith_tac)
  let t198 = @simp.rewrite_tac(@list.List([@realanalysis.bernoulli_conv(@term_syntax.parse_term("bernoulli(4, real_of_num(0))"))]))
  let t197 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t196 = @simp.simp_tac(@list.List([@misc.in_real_interval(), @floor.floor_frac(), @realarith.real_lt_imp_le()]))
  let t195 = @term_syntax.parse_term("frac((x : Real))")
  let t203 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("5"), t195]), @realanalysis.bernoulli_bound())), t196), t197), t198), @calc_rat.real_arith_tac), t202])
  let t194 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t193 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t192 = @simp.rewrite_tac(@list.List([@real.real_inv_mul(), @realax.real_div(), @real.real_abs_mul()]))
  let t191 = @tactics.repeat_tac(@tactics.strip_tac)
  let t204 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), t191), t192), t193), t194), @tactics.conj_tac), t203), @tactics.all_tac])
  let t190 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, IN(x, real_interval([(real_of_num((m : Num)), real_of_num((n : Num)))])) → abs(bernoulli(5, frac(x)) / pow(x, 6)) <= inv(real_of_num(12) * pow(x, 6))"), fn(x187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s188 = @tactics.assume_tac(x187)
    fn(x189 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s188(x189)
    }
  })
  let t184 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t185 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_inv_mul(), @calc_rat.real_arith(@term_syntax.parse_term("inv(-real_of_num(60)) * (x : Real) - inv(-real_of_num(60)) * (y : Real) == (y - x) / real_of_num(60)"))])), t184), @tactics.disch_tac)
  let t182 = @tactics.conv_tac(@calc_rat.real_field)
  let t183 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())]))), @calc_rat.asm_real_arith_tac), t182])
  let t181 = @tactics.subgoal_then(@term_syntax.parse_term("!((x : Real) == real_of_num(0))"), fn(x178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s179 = @tactics.mp_tac(x178)
    fn(x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s179(x180)
    }
  })
  let t177 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t176 = @tactics.repeat_tac(@tactics.strip_tac)
  let t186 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), t176), @realanalysis.real_diff_tac), t177), t181), t183), t185])
  let t175 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t171 = @term_syntax.parse_term("real_of_num((n : Num))")
  let t172 = @term_syntax.parse_term("real_of_num((m : Num))")
  let t173 = @term_syntax.parse_term("(x : Real) => inv(real_of_num(12) * pow(x, 6))")
  let t174 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => inv(-real_of_num(60) * pow(x, 5))"), t173, t172, t171]), @realanalysis.real_fundamental_theorem_of_calculus()))
  let t169 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t168 = @simp.asm_rewrite_tac(@list.List([@real.real_pow_eq_0()]))
  let t167 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_atreal())
  let t166 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t165 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t164 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t163 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @misc.in_real_interval()]))
  let t162 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t161 = @simp.simp_tac(@list.List([@realanalysis.real_negligible_countable(), @misc.countable_integer()]))
  let t160 = @simp.rewrite_tac(@list.List([@realanalysis.real_lebesgue_measurable_interval()]))
  let t159 = @tactics.exists_tac(@term_syntax.parse_term("integer"))
  let t170 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_ae_imp_measurable_on_lebesgue_measurable_subset()), t159), t160), t161), t162), t163), t164), t165), @tactics.strip_tac), t166), t167), @realanalysis.real_differentiable_tac), t168), t169), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t158 = @tactics.subgoal_then(@term_syntax.parse_term("real_measurable_on((x : Real) => bernoulli(5, frac(x)) / pow(x, 6), real_interval([(real_of_num((m : Num)), real_of_num((n : Num)))]))"), fn(x155 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s156 = @tactics.assume_tac(x155)
    fn(x157 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s156(x157)
    }
  })
  let t154 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) * -((n : Real) * inv((x : Real))) == -n * (b / x)"))]))
  let t153 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) / real_of_num(120) * abs(real_integral(real_interval([(real_of_num((m : Num)), real_of_num((n : Num)))]), (x : Real) => bernoulli(5, frac(x)) * -(real_of_num(120) * inv(pow(x, 6)))))"))
  let t152 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t148 = @drule.match_mp(@realanalysis.real_integral_unique())
  let t150 = @tactics.disch_then(fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s146 = @tactics.subst1_tac(x145)
      fn(x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s146(x147)
      }
    })(t148(x149))
  })
  let t144 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t143 = @tactics.repeat_tac(@tactics.strip_tac)
  let t151 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval(), @equal.gsym(@realax.real_of_num_add())])), t143), @realanalysis.real_diff_tac), t144), @calc_rat.asm_real_arith_tac), t150])
  let t142 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_le()]))
  let t138 = @term_syntax.parse_term("real_of_num((n : Num))")
  let t139 = @term_syntax.parse_term("real_of_num((m : Num))")
  let t140 = @term_syntax.parse_term("(x : Real) => inv(x)")
  let t141 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => log(x)"), t140, t139, t138]), @realanalysis.real_fundamental_theorem_of_calculus()))
  let t135 = @tactics.disch_then(fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s133 = @tactics.subst1_tac(x132)
    fn(x134 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s133(x134)
    }
  })
  let t131 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t130 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg(), @realax.real_mul_lid(), @real.real_pow_1()]))
  let t129 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t128 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.bernoulli_conv(@term_syntax.parse_term("bernoulli(5, (x : Real))")))]))
  let t127 = @tactics.conv_tac(@equal.once_depth_conv(@realanalysis.bernoulli_conv))
  let t126 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t125 = @tactics.conv_tac(@equal.once_depth_conv(@iterate.expand_sum_conv))
  let t124 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @realax.real_pow()]))
  let t136 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s121 = @tactics.mp_tac(x120)
      fn(x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s121(x122)
      }
    })(@bool.conjunct2(x123))
  }), t124), t125), t126), t127), t128), t129), t130), t131), t135)
  let t119 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.fact(), @realax.real_of_num_mul(), @arith.mult_ac()]))
  let t118 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t117 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t116 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rneg(), @calc_int.real_mul_lneg(), @realarith.real_mul_rid()]))
  let t115 = @simp.rewrite_tac(@list.List([@real.real_pow_add(), @real.real_pow_1()]))
  let t113 = @int.arith_rule(@term_syntax.parse_term("(k : Num) + 1 + 1 == SUC(SUC(k))"))
  let t114 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((k : Num) + 1) * 2 - k == SUC(SUC(k))")), t113]))
  let t112 = @simp.asm_simp_tac(@list.List([@real.real_div_pow2_alt(), @int.arith_rule(@term_syntax.parse_term("!(((k : Num) + 1) * 2 < k)"))]))
  let t111 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_pow_pow()]))
  let t110 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t109 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t108 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc()), @real.real_pow_eq_0(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg()]))
  let t107 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @arith.add_sub(), @realarith.real_mul_rid(), @real.real_sub_lzero()]))
  let t106 = @tactics.repeat_tac(@tactics.strip_tac)
  let t137 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), t106), @realanalysis.real_diff_tac), t107), t108), t109), t110), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t111), t112), t114), t115), t116), @tactics.ap_term_tac), @tactics.ap_term_tac), t117), t118), @tactics.ap_thm_tac), @tactics.ap_term_tac), t119), t136])
  let t105 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t104 = @simp.asm_rewrite_tac(@list.List([]))
  let t100 = @term_syntax.parse_term("2")
  let t101 = @term_syntax.parse_term("(n : Num)")
  let t102 = @term_syntax.parse_term("(m : Num)")
  let t103 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : Real) => pow(-real_of_num(1), n) * (real_of_num(FACT(n)) / pow(x, n + 1))"), t102, t101, t100]), @realanalysis.real_euler_maclaurin()))
  let t99 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (m : Num) → m - 1 + 1 == m"))]))
  let t98 = @list.List([@int.asm_arith_tac, @tactics.disch_then(fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s95 = @tactics.subst1_tac(x94)
      fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s95(x96)
      }
    })(@equal.sym(x97))
  })])
  let t90 = @term_syntax.parse_term("(n : Num)")
  let t91 = @term_syntax.parse_term("(m : Num) - 1")
  let t92 = @term_syntax.parse_term("1")
  let t93 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(k : Num) => inv(real_of_num(k))"), t92, t91, t90]), @iterate.sum_combine_r()))
  let t230 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t93), @tactics.ants_tac), t98), t99), t103), t104), t105), @tactics.ants_tac), t137), t141), t142), @tactics.ants_tac), t151), t152), t153), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t154), t158), t170), t174), t175), @tactics.ants_tac), t186), t190), t204), t208), t213), t214), t215), t217), @tactics.conj_tac), t229)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, 1 <= m && m <= n → abs(sum(op_dot_dot(1, n), (k : Num) => inv(real_of_num(k))) - log(real_of_num(n)) - (sum(op_dot_dot(1, m - 1), (k : Num) => inv(real_of_num(k))) - log(real_of_num(m)) + ((inv(real_of_num(m)) + inv(real_of_num(n))) / real_of_num(2) + (real_of_num(1) / real_of_num(12) * (inv(pow(real_of_num(m), 2)) - inv(pow(real_of_num(n), 2))) + -real_of_num(1) / real_of_num(120) * (inv(pow(real_of_num(m), 4)) - inv(pow(real_of_num(n), 4))))))) <= inv(real_of_num(60) * pow(real_of_num(m), 5))"), t230)
  let t244 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@metric.eventually_mono()))
  let t246 = @tactics.first_x_assum(fn(x245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t244(x245))
  })
  let t243 = @simp.asm_simp_tac(@list.List([@realanalysis.reallim_sub(), @metric.trivial_limit_sequentially()]))
  let t242 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (f : (Num) -> Real)(n) - (g : (Num) -> Real)(n)"))
  let t240 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @realanalysis.reallim_ubound()))
  let t241 = @list.List([@tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @realanalysis.reallim_lbound())), t240])
  let t239 = @simp.rewrite_tac(@list.List([@real.real_abs_bounds()]))
  let t238 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((l : Real) - (m : Real)) <= (d : Real) → abs(m - (k : Real)) <= (e : Real) - d → abs(l - k) <= e")))
  let t237 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s232 = @tactics.assume_tac(x231)
    fn(x233 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s232(x233)
    }
  }, fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s235 = @tactics.mp_tac(x234)
    fn(x236 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s235(x236)
    }
  })))
  let t247 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t237), t238), t239), @tactics.conj_tac), t241), t242), t243), t246), @calc_rat.real_arith_tac)
  let lemma2 = @tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ g : (Num) -> Real, ∀ l : Real, ∀ m : Real, ∀ d : Real, ∀ e : Real, ∀ k : Real, op_minus_minus_minus_gt(f, l, sequentially) → op_minus_minus_minus_gt(g, m, sequentially) && eventually((n : Num) => abs(f(n) - g(n)) <= d, sequentially) && abs(m - k) <= e - d → abs(l - k) <= e"), t247)
  let t285 = @tactics.mp_tac(log2_approx_40())
  let t284 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t283 = @tactics.conv_tac(@equal.once_depth_conv(@iterate.expand_sum_conv))
  let t282 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t286 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@calc_num.num_reduce_conv), t282), t283), t284), t285), @calc_rat.real_arith_tac)
  let t281 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t280 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)"))
  let t287 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@transcendentals.log_pow()), t280])), @tactics.ap_term_tac), t281), t286])
  let t279 = @tactics.subgoal_then(@term_syntax.parse_term("log(real_of_num(64)) == real_of_num(6) * log(real_of_num(2))"), fn(x276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s277 = @tactics.subst1_tac(x276)
    fn(x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s277(x278)
    }
  })
  let t274 = @tactics.match_mp_tac(lemma1)
  let t275 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t274), @int.asm_arith_tac), @tactics.all_tac])
  let t273 = @tactics.exists_tac(@term_syntax.parse_term("64"))
  let t272 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ a : _, (P : (_, _) -> Bool)(a, a) && (Q : (_) -> Bool)(a)) → (∃ a : _, (∃ b : _, P(a, b)) && Q(a))")))
  let t271 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t269 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t268 = @tactics.match_mp_tac(@realanalysis.reallim_1_over_pow())
  let t267 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_n()]))
  let t266 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_null_neg()]))
  let t265 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const()]))
  let t264 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t263 = @simp.gen_rewrite_tac(fn(x260 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s261 = @equal.land_conv(x260)
    fn(x262 : @kernel.Term) -> @kernel.Thm raise {
      s261(x262)
    }
  }, @list.List([@equal.gsym(@calc_int.real_add_rid())]))
  let t259 = @simp.rewrite_tac(@list.List([@realax.real_sub()]))
  let t258 = @tactics.match_mp_tac(@realanalysis.reallim_lmul())
  let t257 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) / real_of_num(2) == inv(real_of_num(2)) * x"))]))
  let t256 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const()]))
  let t270 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_add()), @tactics.conj_tac))), t256), t257), t258), t259), t263), t264), t265), t266), t267), t268), t269), @tactics.all_tac])
  let t255 = @tactics.repeat_tac(@tactics.conj_tac)
  let t254 = @simp.rewrite_tac(@list.List([]))
  let t253 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ n : _, (P : (_) -> Bool)(n)) && (∃ n : _, (Q : (_) -> Bool)(n)) → (∃ n : _, P(n) && Q(n))")))
  let t252 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t251 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => inv(real_of_num(60) * pow(real_of_num(m), 5))"))
  let t250 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => sum(op_dot_dot(1, m - 1), (k : Num) => inv(real_of_num(k))) - log(real_of_num(m)) + (inv(real_of_num(m)) / real_of_num(2) + (real_of_num(1) / real_of_num(12) * inv(pow(real_of_num(m), 2)) + -real_of_num(1) / real_of_num(120) * inv(pow(real_of_num(m), 4))))"))
  let t249 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => (n : Num) => sum(op_dot_dot(1, m - 1), (k : Num) => inv(real_of_num(k))) - log(real_of_num(m)) + ((inv(real_of_num(m)) + inv(real_of_num(n))) / real_of_num(2) + (real_of_num(1) / real_of_num(12) * (inv(pow(real_of_num(m), 2)) - inv(pow(real_of_num(n), 2))) + -real_of_num(1) / real_of_num(120) * (inv(pow(real_of_num(m), 4)) - inv(pow(real_of_num(n), 4)))))"))
  let t248 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ a : (Num) -> _, ∃ b : (Num) -> _, ∃ c : (Num) -> _, ∃ m : Num, (P : (_, _, _) -> Bool)(a(m), b(m), c(m))) → (∃ a : _, ∃ b : _, ∃ c : _, P(a, b, c))")))
  let t288 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@drule.match_mp(lemma2)(euler_mascheroni_v1())), t248), t249), t250), t251), t252), t253), t254), t255), t270), t271), t272), t273), @tactics.conj_tac), t275), t279), t287)
  euler_mascheroni_approx_32_c.set(@tactics.prove(@term_syntax.parse_term("abs(euler_mascheroni - real_of_num(2479122403) / real_of_num(4294967296)) <= inv(pow(real_of_num(2), 32))"), t288))
}

///|
let euler_mascheroni_approx_32_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_MASCHERONI_APPROX_32")

///|
/// `EULER_MASCHERONI_APPROX_32`
pub fn euler_mascheroni_approx_32() -> @kernel.Thm {
  euler_mascheroni_approx_32_c.get()
}

///|
/// lgamma
fn step_5() -> Unit raise {
  lgamma_c.set(@pair.new_definition(@term_syntax.parse_term("(lgamma : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) == lim(sequentially, (n : Num) => z * clog(Cx(real_of_num(n))) - clog(z) - vsum(op_dot_dot(1, n), (m : Num) => clog((Cx(real_of_num(m)) + z) / Cx(real_of_num(m)))))")))
}

///|
let lgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lgamma")

///|
/// `lgamma`
pub fn lgamma() -> @kernel.Thm {
  lgamma_c.get()
}

///|
let lgamma_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LGAMMA")

///|
/// `LGAMMA`
pub fn lgamma_v1() -> @kernel.Thm {
  lgamma_v1_c.get()
}

///|
let complex_differentiable_at_lgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_AT_LGAMMA")

///|
/// `COMPLEX_DIFFERENTIABLE_AT_LGAMMA`
pub fn complex_differentiable_at_lgamma() -> @kernel.Thm {
  complex_differentiable_at_lgamma_c.get()
}

///|
/// LGAMMA, COMPLEX_DIFFERENTIABLE_AT_LGAMMA
fn step_6() -> Unit raise {
  let t726 = @simp.asm_simp_tac(@list.List([@topology.centre_in_ball(), @real.real_lt_min()]))
  let t725 = @tactics.disch_then(fn(x724 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(@bool.conjunct2(x724))
  })
  let t727 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@canal.holomorphic_on_open(), @topology.open_ball(), @canal.complex_differentiable()])), t725), t726)
  let t723 = @meson.asm_meson_tac(@list.List([]))
  let t722 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.cball_min_inter(), @sets.in_inter()])))
  let t721 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → real_of_num(0) < real_of_num((m : Num)) + x")))
  let t720 = @simp.asm_simp_tac(@list.List([@real.real_lt_imp_nz(), @real.real_of_num_lt(), @arith.le_1()]))
  let t719 = @tactics.match_mp_tac(@real.real_lt_div())
  let t718 = @simp.rewrite_tac(@list.List([@complexes.im_cx(), @complexes.re_cx(), @realax.real_add_lid()]))
  let t717 = @simp.asm_simp_tac(@list.List([@real.real_lt_imp_nz(), @real.real_of_num_lt(), @arith.le_1()]))
  let t716 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t715 = @simp.asm_simp_tac(@list.List([@complexes.re_div_cx(), @complexes.im_div_cx(), @real.real_div_eq_0(), @complexes.re_add(), @complexes.im_add()]))
  let t714 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @equal.gsym(@complexes.complex_div()), @theorems.imp_conj()]))
  let t713 = @tactics.match_mp_tac(@transcendentals.holomorphic_on_clog())
  let t712 = @simp.simp_tac(@list.List([@canal.holomorphic_on_add(), @canal.holomorphic_on_id(), @canal.holomorphic_on_const(), @complexes.complex_div(), @canal.holomorphic_on_mul()]))
  let t711 = @tactics.match_mp_tac(@canal.holomorphic_on_compose())
  let t710 = @simp.gen_rewrite_tac(fn(x707 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s708 = @equal.land_conv(x707)
    fn(x709 : @kernel.Term) -> @kernel.Thm raise {
      s708(x709)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t706 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t705 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t704 = @tactics.match_mp_tac(@canal.holomorphic_on_vsum())
  let t703 = @simp.simp_tac(@list.List([@canal.holomorphic_on_mul(), @canal.holomorphic_on_id(), @canal.holomorphic_on_const()]))
  let t702 = @tactics.match_mp_tac(@canal.holomorphic_on_sub())
  let t701 = @simp.rewrite_tac(@list.List([@topology.ball_subset_cball(), @equal.gsym(@topology.cball_min_inter())]))
  let t700 = @tactics.match_mp_tac(@meson.meson(@list.List([@canal.holomorphic_on_imp_continuous_on(), @canal.holomorphic_on_subset()]), @term_syntax.parse_term("SUBSET((t : (Cart[Real, 2]) -> Bool), (s : (Cart[Real, 2]) -> Bool)) && holomorphic_on((f : (Cart[Real, 2]) -> Cart[Real, 2]), s) → continuous_on(f, s) && holomorphic_on(f, t)")))
  let t699 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t698 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t696 = @meson.asm_meson_tac(@list.List([]))
  let t697 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@vectors.dist())])), t696)])
  let t695 = @simp.rewrite_tac(@list.List([@topology.cball_min_inter(), @sets.in_inter()]))
  let t694 = @simp.asm_rewrite_tac(@list.List([@metric.trivial_limit_sequentially(), @metric.eventually_sequentially()]))
  let t693 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (z : Cart[Real, 2]) => z * clog(Cx(real_of_num(n))) - vsum(op_dot_dot(1, n), (m : Num) => clog((Cx(real_of_num(m)) + z) / Cx(real_of_num(m))))"))
  let t728 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @cauchy.holomorphic_uniform_limit())), t693), t694), t695), @tactics.conj_tac), t697), t698), t699), @tactics.disch_tac), t700), t701), t702), t703), t704), t705), t706), @tactics.strip_tac), t710), t711), t712), t713), t714), t715), t716), @tactics.disch_tac), t717), t718), @tactics.disch_tac), t719), t720), t721), t722), t723), t727])
  let t692 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on((ll : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])), cball((z, min((r : Real), (dd : (Cart[Real, 2]) -> Real)(z))))) && holomorphic_on(ll(z), ball((z, min(r, dd(z)))))"), fn(x689 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s690 = @tactics.mp_tac(x689)
    fn(x691 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s690(x691)
    }
  })
  let t686 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Real)"))(@tactics.strip_assume_tac))
  let t685 = @simp.asm_rewrite_tac(@list.List([]))
  let t681 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t684 = @tactics.disch_then(fn(x683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x678 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s679 = @tactics.mp_tac(x678)
      fn(x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s679(x680)
      }
    })(((x682 : @kernel.Thm) => @bool.spec(t681, x682))(x683))
  })
  let t687 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.open_contains_cball(), @sets.in_elim_thm(), @sets.subset()])), t684), t685), t686)
  let t677 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_univ(), @sets.in_diff(), @sets.in_inter(), @sets.extension()]))
  let t688 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("{(z : Cart[Real, 2]) | Im(z) == real_of_num(0) → real_of_num(0) < Re(z)} == DIFF(UNIV, INTER({(z : Cart[Real, 2]) | Im(z) == real_of_num(0)}, {(z : Cart[Real, 2]) | Re(z) <= real_of_num(0)}))"), fn(x675 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x675
    @simp.simp_tac(@list.List([th_2, @canal.closed_halfspace_re_le(), @equal.gsym(@topology.closed()), @canal.closed_halfspace_im_eq(), @topology.closed_inter()]))
  }), t677), @calc_rat.real_arith_tac), t687])
  let t674 = @tactics.subgoal_then(@term_syntax.parse_term("open({(z : Cart[Real, 2]) | Im(z) == real_of_num(0) → real_of_num(0) < Re(z)})"), fn(x671 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s672 = @tactics.mp_tac(x671)
    fn(x673 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s672(x673)
    }
  })
  let t669 = @simp.asm_simp_tac(@list.List([@topology.in_cball(), @realarith.real_lt_imp_le()]))
  let t668 = @simp.asm_simp_tac(@list.List([@topology.centre_in_cball(), @realarith.real_lt_imp_le()]))
  let t667 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t666 = @tactics.repeat_tac(@tactics.strip_tac)
  let t665 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t664 = @simp.asm_rewrite_tac(@list.List([]))
  let t660 = @term_syntax.parse_term("(r : Real)")
  let t663 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s655 = @tactics.assume_tac(x654)
    fn(x656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s655(x656)
    }
  }, fn(x662 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x657 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s658 = @tactics.mp_tac(x657)
      fn(x659 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s658(x659)
      }
    })(((x661 : @kernel.Thm) => @bool.spec(t660, x661))(x662))
  }))
  let t653 = @simp.rewrite_tac(@list.List([@equal.gsym(@class.skolem_thm()), @class.right_exists_imp_thm()]))
  let t652 = @simp.asm_simp_tac(@list.List([]))
  let t647 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t650 = @tactics.remove_then("*", fn(x649 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s645 = @tactics.mp_tac(x644)
      fn(x646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s645(x646)
      }
    })(((x648 : @kernel.Thm) => @bool.spec(t647, x648))(x649))
  })
  let t641 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t651 = @list.List([@tactics.remove_then("*", fn(x643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s639 = @tactics.mp_tac(x638)
      fn(x640 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s639(x640)
      }
    })(((x642 : @kernel.Thm) => @bool.spec(t641, x642))(x643))
  }), t650])
  let t637 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Real)"))
  let t636 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially(), @topology.lim_sequentially()]))
  let t635 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (w : Cart[Real, 2]) * clog(Cx(real_of_num(n))) - vsum(op_dot_dot(1, n), (m : Num) => clog((Cx(real_of_num(m)) + w) / Cx(real_of_num(m))))"))
  let t634 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_unique()))
  let t633 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t670 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), t633), @tactics.strip_tac), t634), t635), t636), @tactics.conj_tac), t637), @tactics.strip_tac), t651), t652), t653), t663), t664), t665), t666), t667), t668), t669), @tactics.all_tac])
  let t632 = @simp.asm_simp_tac(@list.List([@real.real_lt_min()]))
  let t631 = @tactics.exists_tac(@term_syntax.parse_term("min((e : Real), (dd : (Cart[Real, 2]) -> Real)((z : Cart[Real, 2])))"))
  let t630 = @tactics.exists_tac(@term_syntax.parse_term("(ll : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2]))"))
  let t629 = @tactics.match_mp_tac(@canal.complex_differentiable_transform_at())
  let t628 = @simp.asm_simp_tac(@list.List([@transcendentals.complex_differentiable_at_clog()]))
  let t627 = @tactics.match_mp_tac(@canal.complex_differentiable_sub())
  let t625 = @meson.asm_meson_tac(@list.List([]))
  let t624 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t623 = @tactics.match_mp_tac(@topology.lim_sub())
  let t622 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(w : Cart[Real, 2]) - (z : Cart[Real, 2]) - (v : Cart[Real, 2]) == w - v - z"))]))
  let t621 = @simp.asm_simp_tac(@list.List([]))
  let t620 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (w : Cart[Real, 2]) * clog(Cx(real_of_num(n))) - clog(w) - vsum(op_dot_dot(1, n), (m : Num) => clog((Cx(real_of_num(m)) + w) / Cx(real_of_num(m))))"))
  let t619 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t618 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_unique()))
  let t617 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t626 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), t617), @tactics.disch_tac), t618), t619), t620), t621), t622), t623), t624), t625), @tactics.all_tac])
  let t616 = @simp.asm_rewrite_tac(@list.List([]))
  let t615 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t614 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t613 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.subset(), @topology.in_ball()]))
  let t609 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t612 = @tactics.disch_then(fn(x611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x606 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s607 = @tactics.mp_tac(x606)
      fn(x608 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s607(x608)
      }
    })(((x610 : @kernel.Thm) => @bool.spec(t609, x610))(x611))
  })
  let t605 = @simp.rewrite_tac(@list.List([@topology.open_contains_ball()]))
  let t602 = @simp.gen_rewrite_rule(fn(x601 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x601
  }, @list.List([@topology.open_contains_ball()]))
  let t604 = @tactics.first_x_assum(fn(x603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x598 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s599 = @tactics.mp_tac(x598)
      fn(x600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s599(x600)
      }
    })(t602(x603))
  })
  let t597 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => (ll : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])(z, z) - clog(z)"))
  let t596 = @tactics.match_mp_tac(@canal.complex_differentiable_transform_at())
  let t594 = @simp.rewrite_tac(@list.List([@complexes.im_neg(), @complexes.re_neg(), @complexes.im_cx(), @complexes.re_cx()]))
  let t593 = @tactics.first_x_assum(fn(x592 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s586 = @tactics.mp_tac(x585)
      fn(x587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s586(x587)
      }
    })(((x591 : @kernel.Thm) => @lib.check(fn(x590 : @kernel.Thm) -> Bool raise {
      (fn(x588 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x588)
      })((fn(x589 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x589)
      })(x590))
    }, x591))(x592))
  })
  let t584 = @tactics.disch_then(fn(x581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s582 = @tactics.subst_all_tac(x581)
    fn(x583 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s582(x583)
    }
  })
  let t595 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) + (x : Cart[Real, 2]) == Cx(real_of_num(0))) == (z == -x)"))]))), t584), t593), t594), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t580 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, !((z : Cart[Real, 2]) + Cx(real_of_num(n)) == Cx(real_of_num(0)))"), fn(x577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s578 = @tactics.assume_tac(x577)
    fn(x579 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s578(x579)
    }
  })
  let t576 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t574 = @meson.asm_meson_tac(@list.List([]))
  let t573 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t572 = @tactics.match_mp_tac(@topology.lim_sub())
  let t571 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(w : Cart[Real, 2]) - (z : Cart[Real, 2]) - (v : Cart[Real, 2]) == w - v - z"))]))
  let t570 = @tactics.exists_tac(@term_syntax.parse_term("(ll : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2]), z) - clog(z)"))
  let t569 = @tactics.conv_tac(@class.select_conv)
  let t568 = @simp.rewrite_tac(@list.List([lgamma(), @topology.lim()]))
  let t575 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t568), t569), t570), t571), t572), t573), t574), @tactics.disch_tac])
  let t567 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t565 = @meson.meson_tac(@list.List([@topology.centre_in_cball(), @realarith.real_lt_imp_le()]))
  let t564 = @simp.asm_rewrite_tac(@list.List([@topology.lim_sequentially(), @equal.gsym(@class.skolem_thm())]))
  let t560 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t563 = @tactics.first_x_assum(fn(x562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x557 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s558 = @tactics.mp_tac(x557)
      fn(x559 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s558(x559)
      }
    })(((x561 : @kernel.Thm) => @bool.spec(t560, x561))(x562))
  })
  let t566 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), t563), t564), t565), @tactics.all_tac])
  let t556 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], (∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → op_minus_minus_gt((n : Num) => z * clog(Cx(real_of_num(n))) - vsum(op_dot_dot(1, n), (m : Num) => clog((Cx(real_of_num(m)) + z) / Cx(real_of_num(m)))), (ll : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])(z, z), sequentially)"), fn(x553 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s554 = @tactics.assume_tac(x553)
    fn(x555 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s554(x555)
    }
  })
  let t550 = @tactics.disch_then(fn(x547 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s548 = ((x546 : @kernel.Thm) => @tactics.label_tac("*", x546))(x547)
    fn(x549 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s548(x549)
    }
  })
  let t544 = @term_syntax.parse_term("(ll : (Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])")
  let t545 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(dd : (Cart[Real, 2]) -> Real)"), t544]))
  let t543 = @simp.rewrite_tac(@list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]))
  let t551 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x542 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x536 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s537 = @equal.land_conv(x536)
      fn(x538 : @kernel.Term) -> @kernel.Thm raise {
        s537(x538)
      }
    })((fn(x539 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s540 = @equal.redepth_conv(x539)
      fn(x541 : @kernel.Term) -> @kernel.Thm raise {
        s540(x541)
      }
    })(x542))
  }, @list.List([@class.right_imp_exists_thm()])), t543), t545), t550)
  let t535 = @tactics.conv_tac(@vectors.norm_arith)
  let t533 = @equal.gsym(@realax.real_of_num_add())
  let t534 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t533]))
  let t532 = @tactics.repeat_tac(@tactics.pop_assum(fn(x529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s530 = @tactics.mp_tac(x529)
    fn(x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s530(x531)
    }
  }))
  let t528 = @tactics.first_x_assum(fn(x527 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x522 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x526 : @kernel.Thm) => @lib.check(fn(x525 : @kernel.Thm) -> Bool raise {
      (fn(x523 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x523)
      })((fn(x524 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x524)
      })(x525))
    }, x526))(x527))
  })
  let t519 = @simp.gen_rewrite_rule(fn(x518 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x518
  }, @list.List([@topology.in_cball()]))
  let t521 = @tactics.first_x_assum(fn(x520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x515 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s516 = @tactics.mp_tac(x515)
      fn(x517 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s516(x517)
      }
    })(t519(x520))
  })
  let t511 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t510 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((x : Real)) == real_of_num(1) / x"))]))
  let t509 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t508 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t507 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) / real_of_num(2) <= real_of_num(1) - (x : Real)) == (x <= real_of_num(1) / real_of_num(2))"))]))
  let t506 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t505 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t504 = @simp.gen_rewrite_tac(fn(x501 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s502 = @equal.rand_conv(x501)
    fn(x503 : @kernel.Term) -> @kernel.Thm raise {
      s502(x503)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t500 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t498 = @equal.gsym(@realax.real_of_num_add())
  let t499 = @tactics.try_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@real.real_of_num_lt()), t498]))), @calc_rat.asm_real_arith_tac), @tactics.all_tac])))
  let t497 = @simp.asm_rewrite_tac(@list.List([@realax.real_mul_lid(), @realax.real_of_num_le()]))
  let t496 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t495 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((x : Real)) == real_of_num(1) / x"))]))
  let t494 = @simp.rewrite_tac(@list.List([@realarith.real_sub_le()]))
  let t493 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le(), @realarith.real_pos(), @realax.real_le_refl(), @real.real_le_inv_eq()]))
  let t492 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t491 = @tactics.match_mp_tac(@real.real_le_add2())
  let t490 = @simp.once_rewrite_tac(@list.List([@realax.real_div()]))
  let t512 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) + real_of_num(2) * (x : Real) == real_of_num(1) * real_of_num(2) + x * real_of_num(2)"))])), t490), t491), @tactics.conj_tac), t492), t493), t494), t495), t496), t497), t499), t500), t504), t505), t506), t507), t508), t509), t510), t511)
  let t489 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t488 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((x : Real)) == real_of_num(1) / x"))]))
  let t487 = @simp.rewrite_tac(@list.List([@realarith.real_sub_le(), @vectors.norm_pos_le(), @realarith.real_pos()]))
  let t486 = @tactics.match_mp_tac(@real.real_le_div())
  let t513 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_le_add()), @tactics.conj_tac), t486), t487), t488), t489)
  let t485 = @tactics.conv_tac(@vectors.norm_arith)
  let t483 = @simp.gen_rewrite_rule(fn(x482 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x482
  }, @list.List([@topology.in_cball()]))
  let t514 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x484 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x479 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s480 = @tactics.mp_tac(x479)
      fn(x481 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s480(x481)
      }
    })(t483(x484))
  }), t485), t513, t512])
  let t478 = @tactics.repeat_tac(@tactics.conj_tac)
  let t476 = @tactics.conv_tac(@vectors.norm_arith)
  let t474 = @simp.gen_rewrite_rule(fn(x473 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x473
  }, @list.List([@topology.in_cball()]))
  let t477 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x475 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x470 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s471 = @tactics.mp_tac(x470)
      fn(x472 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s471(x472)
      }
    })(t474(x475))
  }), t476), @tactics.all_tac])
  let t469 = @tactics.subgoal_then(@term_syntax.parse_term("norm((z : Cart[Real, 2])) <= norm((y : Cart[Real, 2])) + (d : Real)"), fn(x466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s467 = @tactics.assume_tac(x466)
    fn(x468 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s467(x468)
    }
  })
  let t465 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t464 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t463 = @simp.asm_simp_tac(@list.List([@real.real_le_div2_eq(), @real.real_of_num_lt(), @arith.le_1(), @real.real_pow_lt()]))
  let t462 = @simp.rewrite_tac(@list.List([@real.real_pow_div(), @real.real_pow_inv(), @calc_rat.real_arith(@term_syntax.parse_term("((n : Real) * (inv((k : Real)) / (d : Real)) + pow(n, 2) / k / (e : Real) <= real_of_num(2) * ((x : Real) + pow(x, 2)) / k) == (n * (real_of_num(1) / d + n / e) / k <= x * (real_of_num(2) + real_of_num(2) * x) / k)"))]))
  let t461 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lneg(), @complexes.complex_mul_rneg()]))
  let t460 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("(x' : Cart[Real, 2]) == -(y' : Cart[Real, 2]) && (d : Real) + (e : Real) <= (f : Real) → norm((x : Cart[Real, 2]) - x') <= d → norm((y : Cart[Real, 2]) - y') <= e → norm(x + y) <= f")))
  let t459 = @simp.asm_simp_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1(), @complexes.complex_field(@term_syntax.parse_term("!((k : Cart[Real, 2]) == Cx(real_of_num(0))) → (k + (z : Cart[Real, 2])) / k == Cx(real_of_num(1)) + z / k"))]))
  let t457 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_ldistrib()]))
  let t456 = @tactics.conv_tac(@vectors.norm_arith)
  let t454 = @equal.gsym(@realax.real_of_num_add())
  let t455 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t454]))
  let t453 = @tactics.repeat_tac(@tactics.pop_assum(fn(x450 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s451 = @tactics.mp_tac(x450)
    fn(x452 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s451(x452)
    }
  }))
  let t449 = @tactics.first_x_assum(fn(x448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x447 : @kernel.Thm) => @lib.check(fn(x446 : @kernel.Thm) -> Bool raise {
      (fn(x444 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x444)
      })((fn(x445 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x445)
      })(x446))
    }, x447))(x448))
  })
  let t441 = @simp.gen_rewrite_rule(fn(x440 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x440
  }, @list.List([@topology.in_cball()]))
  let t458 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x437 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s438 = @tactics.mp_tac(x437)
      fn(x439 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s438(x439)
      }
    })(t441(x442))
  }), t449), t453), t455), t456), t457])
  let t436 = @tactics.subgoal_then(@term_syntax.parse_term("norm((z : Cart[Real, 2])) < real_of_num((k : Num))"), fn(x433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s434 = @tactics.assume_tac(x433)
    fn(x435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s434(x435)
    }
  })
  let t432 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le(), @equal.gsym(@complexes.complex_norm_mul())]))
  let t429 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@real.real_le_lmul()))
  let t426 = @term_syntax.parse_term("norm((z : Cart[Real, 2]))")
  let t431 = @tactics.disch_then(fn(x430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s424 = @tactics.mp_tac(x423)
        fn(x425 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s424(x425)
        }
      })(((x427 : @kernel.Thm) => @bool.spec(t426, x427))(x428))
    })(t429(x430))
  })
  let t422 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @complexes.complex_mul_lid()]))
  let t421 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1(), @complexes.complex_pow_1()]))
  let t420 = @simp.asm_simp_tac(@list.List([@real.real_inv_lt_1(), @real.real_of_num_lt(), @complexes.complex_div_1()]))
  let t419 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_neg(), @calc_num.arith(), @calc_int.real_abs_num(), @complexes.complex_pow_one()]))
  let t418 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv(), @complexes.complex_norm_div(), @complexes.complex_norm_cx()]))
  let t417 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_v1()), @vectors.norm_neg()]))
  let t416 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t415 = @simp.rewrite_tac(@list.List([@vectors.vsum_sing_numseg()]))
  let t413 = @term_syntax.parse_term("-inv(Cx(real_of_num((k : Num))))")
  let t414 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("1"), t413]), @cauchy.taylor_clog()))
  let t411 = @term_syntax.parse_term("(z : Cart[Real, 2]) / Cx(real_of_num((k : Num)))")
  let t412 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("1"), t411]), @cauchy.taylor_clog()))
  let t409 = @tactics.conv_tac(@calc_rat.real_field)
  let t408 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t407 = @tactics.undisch_tac(@term_syntax.parse_term("2 <= (k : Num)"))
  let t403 = @equal.gsym(@transcendentals.log_div())
  let t404 = @equal.gsym(@complexes.cx_inv())
  let t405 = @equal.gsym(@complexes.cx_sub())
  let t406 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) <= (x : Real) → real_of_num(0) < x && real_of_num(1) < x && real_of_num(0) < x - real_of_num(1)"))
  let t410 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @realax.real_of_num_le(), @realarith.real_sub_lt(), @real.real_inv_lt_1(), t406, t405, t404, t403])), @tactics.ap_term_tac), @tactics.ap_term_tac), t407), t408), t409), @tactics.all_tac])
  let t402 = @tactics.subgoal_then(@term_syntax.parse_term("clog(Cx(real_of_num((k : Num)) - real_of_num(1))) - clog(Cx(real_of_num(k))) == clog(Cx(real_of_num(1)) - inv(Cx(real_of_num(k))))"), fn(x399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s400 = @tactics.subst1_tac(x399)
    fn(x401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s400(x401)
    }
  })
  let t398 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (k : Num) && 1 < k && 2 <= k"), @tactics.strip_assume_tac)
  let t395 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) - real_of_num(1) == x"))
  let t396 = @equal.gsym(@realax.real_of_num_add())
  let t397 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) * ((a : Cart[Real, 2]) - (b : Cart[Real, 2])) - (c : Cart[Real, 2]) == -(z * (b - a) + c)")), @vectors.norm_neg(), t396, t395]))
  let t393 = @equal.gsym(@complexes.cx_div())
  let t394 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_pow()), t393, @complexes.real_cx(), @complexes.re_cx()]))
  let t392 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t391 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t390 = @tactics.match_mp_tac(@complexes.complex_norm_vsum_bound())
  let t389 = @simp.rewrite_tac(@list.List([@vectors.norm_neg()]))
  let t388 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(x : Cart[Real, 2]) + (a : Cart[Real, 2]) - (x + (y : Cart[Real, 2]) + a) == -y"))]))
  let t387 = @list.List([@int.asm_arith_tac, @tactics.disch_then(fn(x385 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x385
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(@vectors.vsum_combine_r())(th_1))]))
  })])
  let t384 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (m : Num) + 1 && m <= (n : Num)"), fn(x381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s382 = @tactics.mp_tac(x381)
    fn(x383 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s382(x383)
    }
  })
  let t380 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realarith.real_let_trans()))
  let t378 = @tactics.conv_tac(@complexes.complex_ring)
  let t377 = @tactics.repeat_tac(@tactics.strip_tac)
  let t375 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) - real_of_num(1) == x"))
  let t376 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t375, @real.real_sub_refl()]))
  let t374 = @simp.asm_simp_tac(@list.List([@complexes.vsum_complex_lmul(), @iterate.finite_numseg(), @vectors.vsum_diffs_alt()]))
  let t379 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vsum_sub_numseg()])), t374), t376), t377), t378), @tactics.all_tac])
  let t373 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, 1 <= n → (z : Cart[Real, 2]) * clog(Cx(real_of_num(n))) - vsum(op_dot_dot(1, n), (m : Num) => clog((Cx(real_of_num(m)) + z) / Cx(real_of_num(m)))) == vsum(op_dot_dot(1, n), (m : Num) => z * (clog(Cx(real_of_num(m + 1) - real_of_num(1))) - clog(Cx(real_of_num(m) - real_of_num(1)))) - clog((Cx(real_of_num(m)) + z) / Cx(real_of_num(m)))) + z * clog(Cx(real_of_num(0)))"), fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x371
    @simp.asm_simp_tac(@list.List([th]))
  })
  let t370 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t369 = @simp.rewrite_tac(@list.List([@misc.from_inter_numseg_max(), @int.arith_rule(@term_syntax.parse_term("MAX(1, (m : Num) + 1) == m + 1"))]))
  let t364 = @term_syntax.parse_term("(n : Num)")
  let t365 = @list.List([@term_syntax.parse_term("(m : Num) + 1"), t364])
  let t368 = @tactics.first_x_assum(fn(x367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s362 = @tactics.mp_tac(x361)
      fn(x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s362(x363)
      }
    })(((x366 : @kernel.Thm) => @bool.specl(t365, x366))(x367))
  })
  let t360 = @simp.rewrite_tac(@list.List([@arith.ge(), @int.arith_rule(@term_syntax.parse_term("(MAX((a : Num), (b : Num)) <= (c : Num)) == (a <= c && b <= c)"))]))
  let t357 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t358 = @term_syntax.parse_term("(n : Num)")
  let t359 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(m : Num)"), t358, t357]))
  let t356 = @tactics.exists_tac(@term_syntax.parse_term("MAX(MAX(1, 2), MAX((M : Num), (N : Num)))"))
  let t355 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(fn(x352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s353 = ((x351 : @kernel.Thm) => @tactics.label_tac("N", x351))(x352)
    fn(x354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s353(x354)
    }
  }))
  let t350 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(2) * (norm((y : Cart[Real, 2])) + (d : Real)) + real_of_num(1)"), @real.real_arch_simple()))
  let t349 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(M : Num)"))(fn(x346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s347 = ((x345 : @kernel.Thm) => @tactics.label_tac("M", x345))(x346)
    fn(x348 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s347(x348)
    }
  }))
  let t344 = @simp.asm_rewrite_tac(@list.List([]))
  let t340 = @term_syntax.parse_term("(e : Real)")
  let t343 = @tactics.disch_then(fn(x342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s338 = @tactics.mp_tac(x337)
      fn(x339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s338(x339)
      }
    })(((x341 : @kernel.Thm) => @bool.spec(t340, x341))(x342))
  })
  let t336 = @simp.rewrite_tac(@list.List([@topology.summable(), @topology.series_cauchy(), @arith.ge()]))
  let t334 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t333 = @tactics.match_mp_tac(@transcendentals.summable_zeta_integer())
  let t332 = @tactics.match_mp_tac(@canal.summable_complex_lmul())
  let t335 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_assoc()])), t332), t333), t334), @tactics.all_tac])
  let t331 = @tactics.subgoal_then(@term_syntax.parse_term("summable(from(1), (m : Num) => Cx(real_of_num(2) * (norm((y : Cart[Real, 2])) + (d : Real) + pow(norm(y) + d, 2))) / pow(Cx(real_of_num(m)), 2))"), fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s329 = @tactics.mp_tac(x328)
    fn(x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s329(x330)
    }
  })
  let t327 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t326 = @simp.rewrite_tac(@list.List([@topology.uniformly_convergent_eq_cauchy_alt()]))
  let t325 = @simp.asm_rewrite_tac(@list.List([]))
  let t324 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Real)"))
  let t323 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t322 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t318 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t321 = @tactics.disch_then(fn(x320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s316 = @tactics.mp_tac(x315)
      fn(x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s316(x317)
      }
    })(((x319 : @kernel.Thm) => @bool.spec(t318, x319))(x320))
  })
  let t314 = @simp.rewrite_tac(@list.List([@topology.open_contains_cball()]))
  let t311 = @simp.gen_rewrite_rule(fn(x310 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x310
  }, @list.List([@topology.open_contains_ball()]))
  let t313 = @tactics.first_x_assum(fn(x312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s308 = @tactics.mp_tac(x307)
      fn(x309 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s308(x309)
      }
    })(t311(x312))
  })
  let t552 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t313), t314), t321), t322), t323), t324), @tactics.strip_tac), t325), t326), t327), @tactics.disch_tac), t331), t335), t336), t343), t344), t349), t350), t355), t356), t359), t360), @tactics.strip_tac), t368), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t369), t370), t373), t379), t380), t384), t387), t388), t389), t390), t391), t392), @tactics.strip_tac), t394), t397), t398), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t402), t410), t412), t414), t415), t416), t417), t418), t419), t420), t421), t422), t431), t432), t436), t458), t459), t460), t461), t462), t463), t464), t465), t469), t477), t478), t514), t521), t528), t532), t534), t535), t551])
  let t306 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], (∀ n : Num, !(y + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → (∃ d : Real, ∃ l : (Cart[Real, 2]) -> Cart[Real, 2], real_of_num(0) < d && (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, ∀ z : Cart[Real, 2], N <= n && IN(z, cball((y, d))) → distance((z * clog(Cx(real_of_num(n))) - vsum(op_dot_dot(1, n), (m : Num) => clog((Cx(real_of_num(m)) + z) / Cx(real_of_num(m)))), l(z))) < e)))"), fn(x303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s304 = @tactics.mp_tac(x303)
    fn(x305 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s304(x305)
    }
  })
  let t301 = @simp.simp_tac(@list.List([@equal.gsym(@floor.real_eq_integers()), @floor.integer_closed()]))
  let t300 = @simp.rewrite_tac(@list.List([@complexes.complex_eq_neg2(), @complexes.cx_inj(), @equal.gsym(@complexes.cx_sub()), @complexes.complex_norm_cx()]))
  let t299 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(x : Cart[Real, 2]) - -(y : Cart[Real, 2]) == y - x"))]))
  let t298 = @simp.simp_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((x : Cart[Real, 2]) + (y : Cart[Real, 2]) == Cx(real_of_num(0))) == (x == -y)"))]))
  let t297 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t296 = @simp.rewrite_tac(@list.List([@real.real_lt_01(), @theorems.imp_conj()]))
  let t295 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t294 = @tactics.match_mp_tac(@topology.discrete_imp_closed())
  let t293 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.closed())]))
  let t302 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(z : _) | ∀ n : _, (P : (_, _) -> Bool)(n, z)} == DIFF(UNIV, {(z : _) | ∃ n : _, !P(n, z)})"))])), t293), t294), t295), t296), t297), t298), t299), t300), t301), @tactics.all_tac])
  let t729 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("open({(z : Cart[Real, 2]) | ∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))})"), fn(x290 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s291 = @tactics.assume_tac(x290)
    fn(x292 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s291(x292)
    }
  }), t302), t306), t552), t556), t566), t567), @tactics.conj_tac), t575), t576), @tactics.disch_tac), t580), t595), t596), t597), t604), t605), t612), t613), t614), t615), @tactics.strip_tac), t616), @tactics.conj_tac), t626), t627), t628), t629), t630), t631), t632), @tactics.conj_tac), t670), t674), t688), t692), t728)
  let t730 = (@term_syntax.parse_term("(∀ z : Cart[Real, 2], (∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → op_minus_minus_gt((n : Num) => z * clog(Cx(real_of_num(n))) - clog(z) - vsum(op_dot_dot(1, n), (m : Num) => clog((Cx(real_of_num(m)) + z) / Cx(real_of_num(m)))), lgamma(z), sequentially)) && (∀ z : Cart[Real, 2], (Im(z) == real_of_num(0) → real_of_num(0) < Re(z)) → complex_differentiable(lgamma, at(z)))"), t729)
  let (lgamma_1, complex_differentiable_at_lgamma) = @bool.conj_pair((fn(x289 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x289.0, x289.1)
  })(t730))
  lgamma_v1_c.set(lgamma_1)
  complex_differentiable_at_lgamma_c.set(complex_differentiable_at_lgamma)
}

///|
/// LGAMMA_ALT
fn step_7() -> Unit raise {
  let t751 = @equal.gsym(@complexes.complex_sub())
  let t752 = @simp.asm_simp_tac(@list.List([@transcendentals.clog_mul_cx(), @real.real_lt_inv_eq(), @real.real_of_num_lt(), @arith.le_1(), @equal.gsym(@complexes.cx_inv()), @transcendentals.log_inv(), @complexes.cx_neg(), t751]))
  let t750 = @simp.once_rewrite_tac(@list.List([@complexes.complex_add_sym()]))
  let t749 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t748 = @tactics.match_mp_tac(@vectors.vsum_eq_numseg())
  let t747 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vsum_sub_numseg())]))
  let t745 = @equal.gsym(@complexes.vsum_cx())
  let t746 = @simp.simp_tac(@list.List([@products.real_of_num_nproduct(), @iterate.finite_numseg(), @equal.gsym(@transcendentals.cx_log()), @transcendentals.log_product(), @products.product_pos_lt(), @iterate.in_numseg(), @real.real_of_num_lt(), @arith.le_1(), t745]))
  let t744 = @simp.rewrite_tac(@list.List([@equal.gsym(@products.nproduct_fact()), @arith.add_clauses()]))
  let t743 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) == (d : Cart[Real, 2]) - (c : Cart[Real, 2]) → (x : Cart[Real, 2]) - (y : Cart[Real, 2]) - a == x + c - (y + d)")))
  let t742 = @simp.simp_tac(@list.List([@vectors.vector_sub_eq(), @vectors.vsum_clauses_left(), @arith.le_0(), @complexes.complex_add_lid()]))
  let t741 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t740 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t739 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t738 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t737 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform()))
  let t734 = @drule.match_mp(lgamma_v1())
  let t736 = @tactics.first_assum(fn(x735 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x731 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s732 = @tactics.mp_tac(x731)
      fn(x733 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s732(x733)
      }
    })(t734(x735))
  })
  let t753 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t736), t737), t738), t739), t740), t741), @tactics.disch_tac), t742), t743), t744), t746), t747), t748), t749), t750), t752)
  lgamma_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → op_minus_minus_gt((n : Num) => z * clog(Cx(real_of_num(n))) + clog(Cx(real_of_num(FACT(n)))) - vsum(op_dot_dot(0, n), (m : Num) => clog(Cx(real_of_num(m)) + z)), lgamma(z), sequentially)"), t753))
}

///|
let lgamma_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LGAMMA_ALT")

///|
/// `LGAMMA_ALT`
pub fn lgamma_alt() -> @kernel.Thm {
  lgamma_alt_c.get()
}

///|
/// LGAMMA_ALT2
fn step_8() -> Unit raise {
  let t814 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_n()]))
  let t811 = @equal.gsym(@realanalysis.reallim_complex())
  let t812 = @simp.rewrite_rule(@list.List([@trivia.o_def()]))(t811)
  let t813 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inv()), t812]))
  let t808 = @term_syntax.parse_term("(n : Num) => n + 1")
  let t809 = @bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t808]), @topology.lim_subsequence())
  let t810 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(t809))
  let t807 = @tactics.match_mp_tac(@canal.lim_null_complex_lmul())
  let t815 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div()])), t807), t810), @tactics.conj_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t813), t814)
  let t806 = @simp.rewrite_tac(@list.List([@calc_int.real_add_rid(), @real.real_lt_01()]))
  let t805 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_cx()]))
  let t816 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.complex_differentiable_imp_continuous_at()), @canal.complex_differentiable_tac), t805), t806), t815])
  let t804 = @tactics.disch_then(@tactics.match_mp_tac)
  let t803 = @simp.rewrite_tac(@list.List([]))
  let t801 = @term_syntax.parse_term("sequentially")
  let t802 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => clog(Cx(real_of_num(1)) + z)"), t801]), @topology.lim_continuous_function()))
  let t800 = @list.List([@simp.rewrite_tac(@list.List([@complexes.complex_add_rid(), @transcendentals.clog_1()])), @tactics.all_tac])
  let t799 = @tactics.subgoal_then(@term_syntax.parse_term("Cx(real_of_num(0)) == clog(Cx(real_of_num(1)) + Cx(real_of_num(0)))"), fn(x796 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s797 = @tactics.subst1_tac(x796)
    fn(x798 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s797(x798)
    }
  })
  let t795 = @simp.simp_tac(@list.List([@realax.real_of_num_eq(), @complexes.cx_inj(), @calc_num.arith_eq(), @arith.add_eq_0(), @complexes.complex_field(@term_syntax.parse_term("!((y : Cart[Real, 2]) == Cx(real_of_num(0))) → (y + (z : Cart[Real, 2])) / y == Cx(real_of_num(1)) + z / y"))]))
  let t794 = @tactics.match_mp_tac(@canal.lim_null_complex_neg())
  let t817 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_vec_0()])), t794), t795), t799), t800), t802), t803), t804), @tactics.conj_tac), t816)
  let t793 = @tactics.conv_tac(@complexes.complex_ring)
  let t792 = @simp.simp_tac(@list.List([@transcendentals.cx_log(), @real.real_of_num_lt(), @arith.lt_0()]))
  let t791 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num((n : Num))) + (z : Cart[Real, 2]) == z + Cx(real_of_num(n))"))]))
  let t789 = @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))
  let t790 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @vectors.vsum_clauses_numseg(), t789]))
  let t788 = @simp.asm_rewrite_tac(@list.List([]))
  let t787 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t786 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t818 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t786), t787), @tactics.disch_tac), t788), t790), t791), t792), t793), t817])
  let t785 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => -clog((Cx(real_of_num(n + 1)) + (z : Cart[Real, 2])) / Cx(real_of_num(n + 1)))"))
  let t784 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t783 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t782 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform()))
  let t781 = @simp.rewrite_tac(@list.List([]))
  let t777 = @term_syntax.parse_term("(r : Num) => r + 1")
  let t780 = @tactics.disch_then(fn(x779 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s775 = @tactics.mp_tac(x774)
      fn(x776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s775(x776)
      }
    })(((x778 : @kernel.Thm) => @bool.spec(t777, x778))(x779))
  })
  let t771 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.lim_subsequence()))
  let t773 = @tactics.disch_then(fn(x772 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s769 = @tactics.mp_tac(x768)
      fn(x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s769(x770)
      }
    })(t771(x772))
  })
  let t765 = @drule.match_mp(lgamma_v1())
  let t767 = @tactics.first_assum(fn(x766 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s763 = @tactics.mp_tac(x762)
      fn(x764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s763(x764)
      }
    })(t765(x766))
  })
  let t761 = @simp.rewrite_tac(@list.List([@vectors.vsum_diffs_alt(), @transcendentals.log_1(), @complexes.complex_sub_rzero()]))
  let t760 = @simp.rewrite_tac(@list.List([@complexes.cx_sub(), @realax.real_of_num_add(), @int.arith_rule(@term_syntax.parse_term("1 + (m : Num) == m + 1"))]))
  let t759 = @simp.simp_tac(@list.List([@vectors.vsum_sub_numseg(), @complexes.vsum_complex_lmul(), @iterate.finite_numseg()]))
  let t757 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) + real_of_num((m : Num))"))
  let t758 = @simp.simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @transcendentals.log_div(), @real.real_lt_div(), t757, @real.real_of_num_lt(), @arith.le_1()]))
  let t755 = @equal.gsym(@complexes.cx_div())
  let t756 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t755]))
  let t754 = @simp.simp_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1(), @complexes.complex_field(@term_syntax.parse_term("!((m : Cart[Real, 2]) == Cx(real_of_num(0))) → Cx(real_of_num(1)) + (z : Cart[Real, 2]) / m == (z + m) / m"))]))
  let t819 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t754), t756), t758), t759), t760), t761), t767), t773), t780), t781), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t782), t783), t784), t785), @tactics.conj_tac), t818)
  lgamma_alt2_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → op_minus_minus_gt((n : Num) => vsum(op_dot_dot(1, n), (m : Num) => z * clog(Cx(real_of_num(1)) + Cx(real_of_num(1)) / Cx(real_of_num(m))) - clog(Cx(real_of_num(1)) + z / Cx(real_of_num(m)))) - clog(z), lgamma(z), sequentially)"), t819))
}

///|
let lgamma_alt2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LGAMMA_ALT2")

///|
/// `LGAMMA_ALT2`
pub fn lgamma_alt2() -> @kernel.Thm {
  lgamma_alt2_c.get()
}

///|
/// cgamma
fn step_9() -> Unit raise {
  cgamma_c.set(@pair.new_definition(@term_syntax.parse_term("(cgamma : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) == lim(sequentially, (n : Num) => cpow(Cx(real_of_num(n)), z) * Cx(real_of_num(FACT(n))) / cproduct(op_dot_dot(0, n), (m : Num) => z + Cx(real_of_num(m))))")))
}

///|
let cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cgamma")

///|
/// `cgamma`
pub fn cgamma() -> @kernel.Thm {
  cgamma_c.get()
}

///|
let cgamma_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA")

///|
/// `CGAMMA`
pub fn cgamma_v1() -> @kernel.Thm {
  cgamma_v1_c.get()
}

///|
let cgamma_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_EQ_0")

///|
/// `CGAMMA_EQ_0`
pub fn cgamma_eq_0() -> @kernel.Thm {
  cgamma_eq_0_c.get()
}

///|
let cgamma_lgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_LGAMMA")

///|
/// `CGAMMA_LGAMMA`
pub fn cgamma_lgamma() -> @kernel.Thm {
  cgamma_lgamma_c.get()
}

///|
/// CGAMMA, CGAMMA_EQ_0, CGAMMA_LGAMMA
fn step_10() -> Unit raise {
  let t898 = @simp.simp_tac(@list.List([@transcendentals.cexp_nz()]))
  let t897 = @meson.asm_meson_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t899 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_unique())), t897), t898])
  let t896 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(q : Bool) && (q → (p : Bool)) → p && q")))
  let t894 = @meson.asm_meson_tac(@list.List([]))
  let t893 = @tactics.conv_tac(@class.select_conv)
  let t895 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cgamma(), @topology.lim()])), t893), t894), @tactics.disch_tac])
  let t900 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q"))), @tactics.conj_tac), t895), t896), @tactics.conj_tac), t899)
  let t890 = @simp.asm_simp_tac(@list.List([lgamma_v1(), @transcendentals.continuous_at_cexp()]))
  let t891 = @tactics.then_tac(@tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("cexp"), @topology.lim_continuous_function())), t890)
  let t889 = @simp.rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t888 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_entire(), @complexes.complex_inv_eq_0()]))
  let t887 = @simp.once_rewrite_tac(@list.List([@complexes.complex_add_sym()]))
  let t886 = @tactics.match_mp_tac(@transcendentals.cexp_clog())
  let t885 = @simp.gen_rewrite_tac(fn(x884 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x878 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s879 = @equal.rand_conv(x878)
      fn(x880 : @kernel.Term) -> @kernel.Thm raise {
        s879(x880)
      }
    })((fn(x881 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s882 = @equal.once_depth_conv(x881)
      fn(x883 : @kernel.Term) -> @kernel.Thm raise {
        s882(x883)
      }
    })(x884))
  }, @list.List([@complexes.complex_add_sym()]))
  let t877 = @simp.gen_rewrite_tac(fn(x874 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s875 = @equal.rand_conv(x874)
    fn(x876 : @kernel.Term) -> @kernel.Thm raise {
      s875(x876)
    }
  }, @list.List([@complexes.complex_mul_sym()]))
  let t873 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_inv_mul())]))
  let t872 = @simp.gen_rewrite_tac(fn(x871 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x865 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s866 = @equal.rand_conv(x865)
      fn(x867 : @kernel.Term) -> @kernel.Thm raise {
        s866(x867)
      }
    })((fn(x868 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s869 = @equal.land_conv(x868)
      fn(x870 : @kernel.Term) -> @kernel.Thm raise {
        s869(x870)
      }
    })(x871))
  }, @list.List([@equal.gsym(@complexes.complex_inv_inv())]))
  let t864 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_neg()]))
  let t863 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t862 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t861 = @tactics.match_mp_tac(@complexes.cproduct_eq())
  let t860 = @simp.simp_tac(@list.List([@transcendentals.cexp_vsum(), @iterate.finite_numseg()]))
  let t858 = @equal.gsym(@vectors.vsum_neg())
  let t859 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cexp_neg()), t858]))
  let t857 = @simp.simp_tac(@list.List([@arith.add_clauses(), @equal.gsym(@complexes.cproduct_mul()), @iterate.finite_numseg()]))
  let t856 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_add_rid(), @transcendentals.cexp_clog()])), @tactics.all_tac])
  let t855 = @simp.rewrite_tac(@list.List([@complexes.complex_add_rid()]))
  let t854 = @simp.gen_rewrite_tac(fn(x851 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s852 = @equal.rand_conv(x851)
    fn(x853 : @kernel.Term) -> @kernel.Thm raise {
      s852(x853)
    }
  }, @list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * (c : Cart[Real, 2])) == b * (a * c)"))]))
  let t850 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses_left(), @arith.le_0()]))
  let t849 = @simp.simp_tac(@list.List([@complexes.cx_product(), @iterate.finite_numseg(), @equal.gsym(@complexes.cproduct_inv())]))
  let t848 = @simp.simp_tac(@list.List([@equal.gsym(@products.nproduct_fact()), @products.real_of_num_nproduct(), @iterate.finite_numseg()]))
  let t847 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t846 = @simp.asm_simp_tac(@list.List([@transcendentals.cexp_sub(), @transcendentals.cpow(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1()]))
  let t845 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t844 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t892 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t844), t845), @tactics.disch_tac), t846), t847), @tactics.ap_term_tac), t848), t849), t850), t854), t855), @tactics.binop_tac), t856), t857), t859), t860), t861), t862), t863), @tactics.strip_tac), t864), t872), t873), @tactics.ap_term_tac), t877), t885), t886), t887), t888), t889), @int.asm_arith_tac), t891])
  let t843 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => cexp((y : Cart[Real, 2]) * clog(Cx(real_of_num(n))) - clog(y) - vsum(op_dot_dot(1, n), (m : Num) => clog((Cx(real_of_num(m)) + y) / Cx(real_of_num(m)))))"))
  let t901 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.lim_transform_eventually()), t843), @tactics.conj_tac), t892), t900])
  let t842 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_gt((n : Num) => cpow(Cx(real_of_num(n)), (y : Cart[Real, 2])) * Cx(real_of_num(FACT(n))) / cproduct(op_dot_dot(0, n), (m : Num) => y + Cx(real_of_num(m))), cexp(lgamma(y)), sequentially)"), fn(x839 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s840 = @tactics.assume_tac(x839)
    fn(x841 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s840(x841)
    }
  })
  let t836 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@class.not_exists_thm()])))
  let t837 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t836)
  let t835 = @meson.asm_meson_tac(@list.List([@arith.le_refl()]))
  let t834 = @simp.simp_tac(@list.List([@complexes.complex_entire(), @complexes.complex_div_eq_0(), @complexes.cproduct_eq_0(), @iterate.finite_numseg(), @iterate.in_numseg(), @arith.le_0()]))
  let t833 = @simp.rewrite_tac(@list.List([@arith.ge()]))
  let t832 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t831 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num)"))
  let t830 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t829 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t828 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t827 = @tactics.match_mp_tac(@meson.meson(@list.List([@topology.lim_unique()]), @term_syntax.parse_term("!trivial_limit((net : Net[_])) && op_minus_minus_gt((f : (_) -> Cart[Real, _]), (a : Cart[Real, _]), net) → op_minus_minus_gt(f, select((a : Cart[Real, _]) => op_minus_minus_gt(f, a, net)), net) && select((a : Cart[Real, _]) => op_minus_minus_gt(f, a, net)) == a")))
  let t826 = @simp.rewrite_tac(@list.List([cgamma(), @topology.lim()]))
  let t823 = @term_syntax.parse_term("(N : Num)")
  let t825 = @tactics.first_x_assum((x824 : @kernel.Thm) => @tactics.x_choose_tac(t823, x824))
  let t838 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@equal.gsym(@class.not_exists_thm())])), t825), t826), t827), t828), t829), t830), t831), t832), t833), @tactics.disch_tac), t834), t835), t837])
  let t822 = @class.asm_cases_tac(@term_syntax.parse_term("∃ n : Num, (y : Cart[Real, 2]) + Cx(real_of_num(n)) == Cx(real_of_num(0))"))
  let t821 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t902 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])), t821), t822), t838), t842), t901)
  let t903 = (@term_syntax.parse_term("(∀ z : Cart[Real, 2], op_minus_minus_gt((n : Num) => cpow(Cx(real_of_num(n)), z) * Cx(real_of_num(FACT(n))) / cproduct(op_dot_dot(0, n), (m : Num) => z + Cx(real_of_num(m))), cgamma(z), sequentially)) && (∀ z : Cart[Real, 2], (cgamma(z) == Cx(real_of_num(0))) == (∃ n : Num, z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) && (∀ z : Cart[Real, 2], cgamma(z) == (if (∃ n : Num, z + Cx(real_of_num(n)) == Cx(real_of_num(0))) { Cx(real_of_num(0)) } else { cexp(lgamma(z)) }))"), t902)
  match @bool.conjuncts_rule((fn(x820 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x820.0, x820.1)
  })(t903)) {
    More(cgamma_1, tail=More(cgamma_eq_0, tail=More(cgamma_lgamma, tail=Empty))) => {
      cgamma_v1_c.set(cgamma_1)
      cgamma_eq_0_c.set(cgamma_eq_0)
      cgamma_lgamma_c.set(cgamma_lgamma)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:649:4")
  }
}

///|
/// CGAMMA_RECURRENCE_ALT
fn step_11() -> Unit raise {
  let t1036 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt(), @realax.real_of_num_le()]))
  let t1035 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1034 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t1033 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) / real_of_num(2) <= real_of_num(1) - (x : Real)) == (x <= inv(real_of_num(2)))"))]))
  let t1032 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1031 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1030 = @simp.gen_rewrite_tac(fn(x1027 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1028 = @equal.rand_conv(x1027)
    fn(x1029 : @kernel.Term) -> @kernel.Thm raise {
      s1028(x1029)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t1026 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t1025 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1024 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t1023 = @simp.rewrite_tac(@list.List([@realax.real_div(), @complexes.complex_norm_mul()]))
  let t1022 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t1021 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t1019 = @simp.rewrite_tac(@list.List([@complexes.cx_add(), @complexes.cx_inv()]))
  let t1018 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt()]))
  let t1020 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_inv_lt_1()), t1018), @int.asm_arith_tac), t1019])
  let t1017 = @simp.rewrite_tac(@list.List([@real.real_abs_inv(), @calc_int.real_abs_num()]))
  let t1016 = @simp.rewrite_tac(@list.List([@real.real_pow_1(), @equal.gsym(@complexes.cx_add()), @complexes.complex_norm_cx()]))
  let t1015 = @simp.simp_tac(@list.List([@vectors.vsum_clauses_numseg(), @calc_num.arith(), @vectors.vector_sub_rzero()]))
  let t1013 = @term_syntax.parse_term("Cx(inv(real_of_num((n : Num))))")
  let t1014 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("0"), t1013]), @cauchy.taylor_clog()))
  let t1012 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1011 = @simp.rewrite_tac(@list.List([@arith.ge(), @misc.in_from()]))
  let t1010 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t1009 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1008 = @simp.simp_tac(@list.List([@transcendentals.lim_inv_n(), @canal.lim_null_complex_lmul()]))
  let t1007 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => Cx(real_of_num(2)) * inv(Cx(real_of_num(n)))"))
  let t1006 = @tactics.match_mp_tac(@canal.lim_null_comparison_complex())
  let t1005 = @tactics.match_mp_tac(@canal.lim_null_complex_lmul())
  let t1004 = @simp.rewrite_tac(@list.List([@transcendentals.continuous_at_cexp()]))
  let t1003 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("cexp"), @topology.lim_continuous_function()))
  let t1002 = @simp.gen_rewrite_tac(fn(x999 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1000 = @equal.land_conv(x999)
    fn(x1001 : @kernel.Term) -> @kernel.Thm raise {
      s1000(x1001)
    }
  }, @list.List([@equal.gsym(@transcendentals.cexp_0())]))
  let t997 = @simp.rewrite_tac(@list.List([@complexes.cx_sub()]))
  let t994 = @int.arith_rule(@term_syntax.parse_term("0 < (n : Num) + 1"))
  let t995 = @equal.gsym(@transcendentals.cx_log())
  let t996 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_add(), @equal.gsym(@complexes.cx_div()), t995, @arith.le_1(), @transcendentals.log_div(), @real.real_of_num_lt(), @real.real_lt_div(), t994]))
  let t992 = @equal.gsym(@complexes.cx_add())
  let t993 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), t992]))
  let t991 = @simp.asm_simp_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1(), @complexes.complex_field(@term_syntax.parse_term("!((n : Cart[Real, 2]) == Cx(real_of_num(0))) → Cx(real_of_num(1)) + inv(n) == (n + Cx(real_of_num(1))) / n"))]))
  let t990 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_ldistrib())]))
  let t989 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cexp_sub())]))
  let t988 = @tactics.repeat_tac(@tactics.strip_tac)
  let t987 = @simp.simp_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj(), @realax.real_of_num_eq(), @nums.not_suc(), @arith.le_1()]))
  let t986 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t998 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t986), t987), t988), t989), @tactics.ap_term_tac), t990), @tactics.ap_term_tac), t991), t993), t996), t997), @tactics.all_tac])
  let t985 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => cexp(((z : Cart[Real, 2]) + Cx(real_of_num(1))) * clog(Cx(real_of_num(1)) + inv(Cx(real_of_num(n)))))"))
  let t984 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t982 = @meson.asm_meson_tac(@list.List([]))
  let t981 = @simp.simp_tac(@list.List([@complexes.cproduct_eq_0(), @iterate.finite_numseg()]))
  let t980 = @tactics.match_mp_tac(@complexes.complex_div_refl())
  let t979 = @simp.rewrite_tac(@list.List([]))
  let t978 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t977 = @tactics.match_mp_tac(@metric.always_eventually())
  let t983 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.lim_eventually()), t977), t978), t979), t980), t981), t982), @tactics.all_tac])
  let t976 = @tactics.match_mp_tac(@canal.lim_complex_mul())
  let t975 = @simp.gen_rewrite_tac(fn(x972 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s973 = @equal.land_conv(x972)
    fn(x974 : @kernel.Term) -> @kernel.Thm raise {
      s973(x974)
    }
  }, @list.List([@equal.gsym(@complexes.complex_mul_lid())]))
  let t971 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_div()), @complexes.complex_div_refl(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.fact_nz(), @complexes.complex_mul_lid()]))
  let t970 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * ((c : Cart[Real, 2]) * ((d : Cart[Real, 2]) * ((e : Cart[Real, 2]) * ((f : Cart[Real, 2]) * ((g : Cart[Real, 2]) * (h : Cart[Real, 2]))))))) == a * d * (c * g * (h * e * (b * f)))"))]))
  let t969 = @simp.rewrite_tac(@list.List([@complexes.complex_add_rid(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t968 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_mul(), @complexes.complex_inv_inv()]))
  let t964 = @equal.gsym(@transcendentals.cpow_suc())
  let t965 = @simp.once_rewrite_rule(@list.List([@complexes.complex_mul_sym()]))(t964)
  let t966 = @equal.gsym(@realax.real_of_num_mul())
  let t967 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.fact(), @complexes.cx_mul(), @complexes.complex_mul_assoc(), t966, t965]))
  let t963 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses_left(), @arith.le_0(), @arith.add_clauses()]))
  let t960 = @term_syntax.parse_term("1")
  let t961 = @term_syntax.parse_term("(m : Num)")
  let t962 = @simp.simp_tac(@list.List([@equal.sym(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t961, t960]), @complexes.cproduct_offset()))]))
  let t959 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 + (n : Num) == n + 1"))]))
  let t957 = @equal.gsym(@complexes.cx_add())
  let t958 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_add_assoc()), t957, @realax.real_of_num_add()]))
  let t955 = @simp.rewrite_tac(@list.List([]))
  let t952 = @drule.match_mp(@topology.seq_offset())
  let t949 = @term_syntax.parse_term("1")
  let t954 = @tactics.disch_then(fn(x953 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x951 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x946 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s947 = @tactics.mp_tac(x946)
        fn(x948 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s947(x948)
        }
      })(((x950 : @kernel.Thm) => @bool.spec(t949, x950))(x951))
    })(t952(x953))
  })
  let t945 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), cgamma_v1()))
  let t944 = @tactics.match_mp_tac(@canal.lim_complex_lmul())
  let t943 = @simp.asm_rewrite_tac(@list.List([cgamma_v1(), cgamma_eq_0()]))
  let t956 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.lim_complex_div()), t943), t944), t945), t954), t955), @tactics.all_tac])
  let t942 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t941 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (z : Cart[Real, 2]) * (cpow(Cx(real_of_num(n + 1)), z) * Cx(real_of_num(FACT(n + 1))) / cproduct(op_dot_dot(0, n + 1), (m : Num) => z + Cx(real_of_num(m)))) / (cpow(Cx(real_of_num(n)), z + Cx(real_of_num(1))) * Cx(real_of_num(FACT(n))) / cproduct(op_dot_dot(0, n), (m : Num) => z + Cx(real_of_num(1)) + Cx(real_of_num(m))))"))
  let t940 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_unique()))
  let t939 = @simp.asm_rewrite_tac(@list.List([cgamma_eq_0()]))
  let t938 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("(a : Cart[Real, 2]) * (b : Cart[Real, 2]) / (c : Cart[Real, 2]) == Cx(real_of_num(1)) && !(a == Cx(real_of_num(0))) && !(c == Cx(real_of_num(0))) → b == c / a")))
  let t937 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_add_lid()])), @tactics.all_tac])
  let t936 = @tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"), fn(x933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s934 = @tactics.assume_tac(x933)
    fn(x935 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s934(x935)
    }
  })
  let t931 = @meson.asm_meson_tac(@list.List([]))
  let t930 = @equal.gsym(@complexes.cx_add())
  let t932 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_add_assoc()), t930, @realax.real_of_num_add()])), t931), @tactics.all_tac])
  let t929 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, !((z : Cart[Real, 2]) + Cx(real_of_num(1)) + Cx(real_of_num(n)) == Cx(real_of_num(0)))"), fn(x926 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s927 = @tactics.assume_tac(x926)
    fn(x928 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s927(x928)
    }
  })
  let t924 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@class.not_exists_thm()])))
  let t923 = @meson.meson_tac(@list.List([@arith.add1(), @arith.add_sym()]))
  let t921 = @equal.gsym(@complexes.cx_add())
  let t922 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_add_assoc()), t921, @realax.real_of_num_add()]))
  let t920 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_add_rid(), cgamma_eq_0()]))
  let t919 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t918 = @tactics.first_x_assum(fn(x917 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s911 = @tactics.mp_tac(x910)
      fn(x912 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s911(x912)
      }
    })(((x916 : @kernel.Thm) => @lib.check(fn(x915 : @kernel.Thm) -> Bool raise {
      (fn(x913 : @kernel.Term) -> Bool raise {
        @basics.is_exists(x913)
      })((fn(x914 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x914)
      })(x915))
    }, x916))(x917))
  })
  let t909 = @simp.asm_rewrite_tac(@list.List([]))
  let t908 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t907 = @simp.rewrite_tac(@list.List([@complexes.complex_div_eq_0()]))
  let t906 = @tactics.conv_tac(@equal.sym_conv)
  let t925 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x904 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x904
    @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(cgamma_eq_0())]))(th)]))
  }), t906), t907), t908), t909), t918), t919), @nums.induct_tac), t920), t922), t923), t924])
  let t1037 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("∃ n : Num, (z : Cart[Real, 2]) + Cx(real_of_num(n)) == Cx(real_of_num(0))"))), t925), t929), t932), t936), t937), t938), t939), t940), t941), t942), @tactics.conj_tac), t956), t958), t959), t962), t963), t967), t968), t969), t970), t971), t975), t976), @tactics.conj_tac), t983), t984), t985), @tactics.conj_tac), t998), t1002), t1003), t1004), t1005), t1006), t1007), t1008), t1009), t1010), t1011), t1012), @tactics.strip_tac), t1014), t1015), t1016), t1017), @tactics.ants_tac), t1020), t1021), t1022), t1023), t1024), t1025), t1026), t1030), t1031), t1032), t1033), t1034), t1035), t1036), @int.asm_arith_tac)
  cgamma_recurrence_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], cgamma(z) == cgamma(z + Cx(real_of_num(1))) / z"), t1037))
}

///|
let cgamma_recurrence_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_RECURRENCE_ALT")

///|
/// `CGAMMA_RECURRENCE_ALT`
pub fn cgamma_recurrence_alt() -> @kernel.Thm {
  cgamma_recurrence_alt_c.get()
}

///|
/// CGAMMA_1
fn step_12() -> Unit raise {
  let t1072 = @simp.rewrite_tac(@list.List([@complexes.cx_inv(), @transcendentals.lim_inv_n()]))
  let t1069 = @term_syntax.parse_term("1")
  let t1070 = @term_syntax.parse_term("(l : Cart[Real, 2])")
  let t1071 = @tactics.match_mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t1070, t1069]), @topology.seq_offset()))
  let t1068 = @simp.rewrite_tac(@list.List([@topology.lim_const(), @realax.real_of_num_add()]))
  let t1067 = @tactics.match_mp_tac(@topology.lim_sub())
  let t1066 = @simp.rewrite_tac(@list.List([@complexes.cx_sub()]))
  let t1065 = @tactics.subst1_tac(@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(1)) == Cx(real_of_num(1)) - Cx(real_of_num(0))")))
  let t1064 = @simp.simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num((n : Num)) / (real_of_num(n) + real_of_num(1)) == real_of_num(1) - inv(real_of_num(n) + real_of_num(1))"))]))
  let t1062 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")), @complexes.complex_mul_sym()]))
  let t1061 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_mul(), @equal.gsym(@realax.real_of_num_mul())]))
  let t1060 = @simp.rewrite_tac(@list.List([@arith.fact(), @complexes.cproduct_clauses_numseg(), @calc_num.arith()]))
  let t1058 = @term_syntax.parse_term("(m : Num)")
  let t1059 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num) + 1"), t1058)
  let t1057 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.add1()]))
  let t1056 = @simp.rewrite_tac(@list.List([@real.real_of_num_suc(), @realax.real_of_num_mul(), @equal.gsym(@bool.conjunct2(@arith.fact()))]))
  let t1055 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.fact_nz()]))
  let t1054 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("(a : Cart[Real, 2]) * (b : Cart[Real, 2]) == (c : Cart[Real, 2]) && !(b == Cx(real_of_num(0))) → a == inv(b) * c")))
  let t1053 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_inv(), @complexes.complex_inv_mul()]))
  let t1052 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_inv_inv())]))
  let t1051 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t1050 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_n(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1(), @complexes.complex_pow_1()]))
  let t1049 = @simp.rewrite_tac(@list.List([@complexes.cx_div()]))
  let t1048 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1047 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1063 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t1047), t1048), @tactics.disch_tac), t1049), t1050), t1051), @tactics.ap_term_tac), t1052), @tactics.ap_term_tac), t1053), t1054), t1055), t1056), t1057), t1059), @nums.induct_tac), t1060), t1061), t1062), @tactics.all_tac])
  let t1046 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => Cx(real_of_num(n) / (real_of_num(n) + real_of_num(1)))"))
  let t1045 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t1042 = @term_syntax.parse_term("1")
  let t1043 = @term_syntax.parse_term("(m : Num)")
  let t1044 = @simp.simp_tac(@list.List([@equal.sym(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t1043, t1042]), @complexes.cproduct_offset()))]))
  let t1040 = @int.arith_rule(@term_syntax.parse_term("1 + (n : Num) == n + 1"))
  let t1041 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), @realax.real_of_num_add(), t1040]))
  let t1038 = @bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_unique())
  let t1039 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt(), @metric.trivial_limit_sequentially()]))(t1038))
  let t1073 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(1))"), cgamma_v1())), t1039), t1041), t1044), t1045), t1046), @tactics.conj_tac), t1063), t1064), t1065), t1066), t1067), t1068), t1071), t1072)
  cgamma_1_c.set(@tactics.prove(@term_syntax.parse_term("cgamma(Cx(real_of_num(1))) == Cx(real_of_num(1))"), t1073))
}

///|
let cgamma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_1")

///|
/// `CGAMMA_1`
pub fn cgamma_1() -> @kernel.Thm {
  cgamma_1_c.get()
}

///|
/// CGAMMA_RECURRENCE
fn step_13() -> Unit raise {
  let t1076 = @meson.asm_meson_tac(@list.List([cgamma_recurrence_alt()]))
  let t1075 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("(a : Cart[Real, 2]) == (b : Cart[Real, 2]) / (c : Cart[Real, 2]) && !(c == Cx(real_of_num(0))) → b == c * a")))
  let t1074 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_add_lid(), cgamma_1()]))
  let t1077 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac), t1074), t1075), t1076)
  cgamma_recurrence_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], cgamma(z + Cx(real_of_num(1))) == (if z == Cx(real_of_num(0)) { Cx(real_of_num(1)) } else { z * cgamma(z) })"), t1077))
}

///|
let cgamma_recurrence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_RECURRENCE")

///|
/// `CGAMMA_RECURRENCE`
pub fn cgamma_recurrence() -> @kernel.Thm {
  cgamma_recurrence_c.get()
}

///|
/// CGAMMA_FACT
fn step_14() -> Unit raise {
  let t1081 = @simp.asm_rewrite_tac(@list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_mul()), @complexes.cx_mul()]))
  let t1080 = @simp.rewrite_tac(@list.List([cgamma_recurrence(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.add_eq_0(), @calc_num.arith()]))
  let t1079 = @simp.rewrite_tac(@list.List([@complexes.cx_add()]))
  let t1078 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc())]))
  let t1082 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.fact(), @arith.add_clauses(), cgamma_1()]))), t1078), t1079), t1080), t1081)
  cgamma_fact_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, cgamma(Cx(real_of_num(n + 1))) == Cx(real_of_num(FACT(n)))"), t1082))
}

///|
let cgamma_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_FACT")

///|
/// `CGAMMA_FACT`
pub fn cgamma_fact() -> @kernel.Thm {
  cgamma_fact_c.get()
}

///|
/// CGAMMA_POLES
fn step_15() -> Unit raise {
  let t1083 = @meson.meson_tac(@list.List([@complexes.complex_add_linv()]))
  let t1084 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cgamma_eq_0()])), t1083)
  cgamma_poles_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, cgamma(-Cx(real_of_num(n))) == Cx(real_of_num(0))"), t1084))
}

///|
let cgamma_poles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_POLES")

///|
/// `CGAMMA_POLES`
pub fn cgamma_poles() -> @kernel.Thm {
  cgamma_poles_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_AT_CGAMMA
fn step_16() -> Unit raise {
  let t1101 = @simp.asm_rewrite_tac(@list.List([]))
  let t1100 = @tactics.match_mp_tac(@canal.complex_differentiable_compose_at())
  let t1099 = @simp.gen_rewrite_tac(fn(x1096 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1097 = @equal.land_conv(x1096)
    fn(x1098 : @kernel.Term) -> @kernel.Thm raise {
      s1097(x1098)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t1095 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@complexes.complex_add_rid()]))])
  let t1094 = @simp.rewrite_tac(@list.List([@canal.complex_differentiable_id()]))
  let t1093 = @tactics.match_mp_tac(@canal.complex_differentiable_div_at())
  let t1092 = @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(cgamma_recurrence_alt())])), @tactics.all_tac])
  let t1091 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t1089 = @term_syntax.parse_term("real_of_num(1)")
  let t1090 = @tactics.map_every(fn(x1086 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1087 = @tactics.exists_tac(x1086)
    fn(x1088 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1087(x1088)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => cgamma(z + Cx(real_of_num(1))) / z"), t1089]))
  let t1085 = @tactics.match_mp_tac(@canal.complex_differentiable_transform_at())
  let t1102 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1085), t1090), t1091), @tactics.conj_tac), t1092), t1093), t1094), @tactics.conj_tac), t1095), t1099), t1100), t1101), @canal.complex_differentiable_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) && complex_differentiable(cgamma, at(z + Cx(real_of_num(1)))) → complex_differentiable(cgamma, at(z))"), t1102)
  let t1187 = @tactics.conv_tac(@complexes.complex_ring)
  let t1186 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @complexes.cx_add(), @complexes.cx_sub()]))
  let t1185 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) + 1 <= (N : Num) + (m : Num)"), fn(x1183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1183
    @simp.simp_tac(@list.List([th, @equal.gsym(@real.real_of_num_sub())]))
  })
  let t1179 = @term_syntax.parse_term("(N : Num) + (m : Num) - ((n : Num) + 1)")
  let t1182 = @tactics.first_x_assum(fn(x1181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1176 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1177 = @tactics.mp_tac(x1176)
      fn(x1178 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1177(x1178)
      }
    })(((x1180 : @kernel.Thm) => @bool.spec(t1179, x1180))(x1181))
  })
  let t1175 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1174 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @int.asm_arith_tac)])
  let t1173 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) + ((N : Cart[Real, 2]) - ((n : Cart[Real, 2]) + (w : Cart[Real, 2]))) + w == z + (N - n)"))]))
  let t1172 = @tactics.match_mp_tac(lemma)
  let t1188 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), @complexes.cx_add()]))), t1172), t1173), @tactics.conj_tac), t1174), t1175), t1182), t1185), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1186), t1187)
  let t1167 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_cx()]))
  let t1166 = @tactics.match_mp_tac(complex_differentiable_at_lgamma())
  let t1165 = @simp.rewrite_tac(@list.List([@transcendentals.complex_differentiable_at_cexp()]))
  let t1164 = @tactics.match_mp_tac(@canal.complex_differentiable_compose_at())
  let t1168 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1161 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1162 = @equal.land_conv(x1161)
    fn(x1163 : @kernel.Term) -> @kernel.Thm raise {
      s1162(x1163)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())])), t1164), t1165), t1166), t1167), @calc_rat.asm_real_arith_tac)
  let t1160 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(w : Cart[Real, 2]) - (N : Cart[Real, 2]) + ((n : Cart[Real, 2]) + N) == w + n"))]))
  let t1159 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @complexes.cx_add()]))
  let t1155 = @term_syntax.parse_term("(n : Num) + (N : Num)")
  let t1158 = @tactics.disch_then(fn(x1157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1153 = @tactics.mp_tac(x1152)
      fn(x1154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1153(x1154)
      }
    })(((x1156 : @kernel.Thm) => @bool.spec(t1155, x1156))(x1157))
  })
  let t1149 = @term_syntax.parse_term("(n : Num)")
  let t1151 = @tactics.first_x_assum((x1150 : @kernel.Thm) => @tactics.x_choose_tac(t1149, x1150))
  let t1148 = @simp.rewrite_tac(@list.List([]))
  let t1147 = @simp.rewrite_tac(@list.List([cgamma_lgamma()]))
  let t1146 = @simp.asm_simp_tac(@list.List([@vectors.dist(), @complexes.complex_ring(@term_syntax.parse_term("(w : Cart[Real, 2]) - (n : Cart[Real, 2]) - (z : Cart[Real, 2]) == w - (z + n)"))]))
  let t1142 = @term_syntax.parse_term("(w : Cart[Real, 2]) - Cx(real_of_num((N : Num)))")
  let t1145 = @tactics.first_x_assum(fn(x1144 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1140 = @tactics.mp_tac(x1139)
      fn(x1141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1140(x1141)
      }
    })(((x1143 : @kernel.Thm) => @bool.spec(t1142, x1143))(x1144))
  })
  let t1138 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t1169 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), t1138), @tactics.disch_tac), t1145), t1146), t1147), @class.cond_cases_tac), t1148), t1151), t1158), t1159), t1160), t1168])
  let t1137 = @simp.asm_rewrite_tac(@list.List([]))
  let t1136 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1135 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1134 = @simp.asm_rewrite_tac(@list.List([]))
  let t1130 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1133 = @tactics.disch_then(fn(x1132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1128 = @tactics.mp_tac(x1127)
      fn(x1129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1128(x1129)
      }
    })(((x1131 : @kernel.Thm) => @bool.spec(t1130, x1131))(x1132))
  })
  let t1170 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.open_def(), @sets.in_elim_thm()])), t1133), t1134), t1135), t1136), @tactics.strip_tac), t1137), @tactics.conj_tac), t1169)
  let t1126 = @simp.simp_tac(@list.List([@equal.gsym(@floor.real_eq_integers()), @floor.integer_closed()]))
  let t1125 = @simp.rewrite_tac(@list.List([@complexes.complex_eq_neg2(), @complexes.cx_inj(), @equal.gsym(@complexes.cx_sub()), @complexes.complex_norm_cx()]))
  let t1124 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(x : Cart[Real, 2]) - -(y : Cart[Real, 2]) == y - x"))]))
  let t1123 = @simp.simp_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((x : Cart[Real, 2]) + (y : Cart[Real, 2]) == Cx(real_of_num(0))) == (x == -y)"))]))
  let t1122 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t1121 = @simp.rewrite_tac(@list.List([@real.real_lt_01(), @theorems.imp_conj()]))
  let t1120 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1119 = @tactics.match_mp_tac(@topology.discrete_imp_closed())
  let t1118 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.closed())]))
  let t1171 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(z : _) | ∀ n : _, (P : (_, _) -> Bool)(n, z)} == DIFF(UNIV, {(z : _) | ∃ n : _, !P(n, z)})"))])), t1118), t1119), t1120), t1121), t1122), t1123), t1124), t1125), t1126), t1170])
  let t1117 = @tactics.subgoal_then(@term_syntax.parse_term("open({(z : Cart[Real, 2]) | ∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))})"), fn(x1114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1115 = @tactics.mp_tac(x1114)
    fn(x1116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1115(x1116)
    }
  })
  let t1113 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => cexp(lgamma(z))"))
  let t1112 = @tactics.match_mp_tac(@canal.complex_differentiable_transform_at())
  let t1189 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.rewrite_tac(@list.List([@complexes.complex_sub_rzero()]))), t1112), t1113), t1117), t1171), t1188])
  let t1111 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@arith.le_refl(), @complexes.complex_sub_refl(), @complexes.complex_add_rid()]))])
  let t1110 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, n <= (N : Num) → complex_differentiable(cgamma, at((z : Cart[Real, 2]) + (Cx(real_of_num(N)) - Cx(real_of_num(n)))))"), fn(x1107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1108 = @tactics.mp_tac(x1107)
    fn(x1109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1108(x1109)
    }
  })
  let t1104 = @term_syntax.parse_term("(N : Num)")
  let t1106 = @tactics.disch_then((x1105 : @kernel.Thm) => @tactics.x_choose_tac(t1104, x1105))
  let t1103 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("abs(Re((z : Cart[Real, 2]))) + real_of_num(1)"), @real.real_arch_simple()))
  let t1190 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1103), t1106), t1110), t1111), @nums.induct_tac), t1189)
  complex_differentiable_at_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → complex_differentiable(cgamma, at(z))"), t1190))
}

///|
let complex_differentiable_at_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_AT_CGAMMA")

///|
/// `COMPLEX_DIFFERENTIABLE_AT_CGAMMA`
pub fn complex_differentiable_at_cgamma() -> @kernel.Thm {
  complex_differentiable_at_cgamma_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_WITHIN_CGAMMA
fn step_17() -> Unit raise {
  let t1191 = @simp.simp_tac(@list.List([@canal.complex_differentiable_at_within(), complex_differentiable_at_cgamma()]))
  complex_differentiable_within_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, (∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → complex_differentiable(cgamma, within(at(z), s))"), t1191))
}

///|
let complex_differentiable_within_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_WITHIN_CGAMMA")

///|
/// `COMPLEX_DIFFERENTIABLE_WITHIN_CGAMMA`
pub fn complex_differentiable_within_cgamma() -> @kernel.Thm {
  complex_differentiable_within_cgamma_c.get()
}

///|
/// HOLOMORPHIC_ON_CGAMMA
fn step_18() -> Unit raise {
  let t1195 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1194 = @tactics.match_mp_tac(complex_differentiable_within_cgamma())
  let t1193 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1192 = @simp.rewrite_tac(@list.List([@canal.holomorphic_on_differentiable()]))
  let t1196 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1192), t1193), t1194), t1195)
  holomorphic_on_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, SUBSET(s, {(z : Cart[Real, 2]) | ∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))}) → holomorphic_on(cgamma, s)"), t1196))
}

///|
let holomorphic_on_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_CGAMMA")

///|
/// `HOLOMORPHIC_ON_CGAMMA`
pub fn holomorphic_on_cgamma() -> @kernel.Thm {
  holomorphic_on_cgamma_c.get()
}

///|
/// CONTINUOUS_AT_CGAMMA
fn step_19() -> Unit raise {
  let t1197 = @simp.simp_tac(@list.List([@canal.complex_differentiable_imp_continuous_at(), complex_differentiable_at_cgamma()]))
  continuous_at_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → continuous(cgamma, at(z))"), t1197))
}

///|
let continuous_at_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_CGAMMA")

///|
/// `CONTINUOUS_AT_CGAMMA`
pub fn continuous_at_cgamma() -> @kernel.Thm {
  continuous_at_cgamma_c.get()
}

///|
/// CONTINUOUS_WITHIN_CGAMMA
fn step_20() -> Unit raise {
  let t1198 = @simp.simp_tac(@list.List([@canal.complex_differentiable_imp_continuous_within(), complex_differentiable_within_cgamma()]))
  continuous_within_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, (∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → continuous(cgamma, within(at(z), s))"), t1198))
}

///|
let continuous_within_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_WITHIN_CGAMMA")

///|
/// `CONTINUOUS_WITHIN_CGAMMA`
pub fn continuous_within_cgamma() -> @kernel.Thm {
  continuous_within_cgamma_c.get()
}

///|
/// CONTINUOUS_ON_CGAMMA
fn step_21() -> Unit raise {
  let t1199 = @simp.simp_tac(@list.List([@canal.holomorphic_on_imp_continuous_on(), holomorphic_on_cgamma()]))
  continuous_on_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, SUBSET(s, {(z : Cart[Real, 2]) | ∀ n : Num, !(z + Cx(real_of_num(n)) == Cx(real_of_num(0)))}) → continuous_on(cgamma, s)"), t1199))
}

///|
let continuous_on_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CGAMMA")

///|
/// `CONTINUOUS_ON_CGAMMA`
pub fn continuous_on_cgamma() -> @kernel.Thm {
  continuous_on_cgamma_c.get()
}

///|
/// CGAMMA_SIMPLE_POLES
fn step_22() -> Unit raise {
  let t1252 = @simp.rewrite_tac(@list.List([@topology.continuous_at_id()]))
  let t1250 = @equal.gsym(@real.real_of_num_suc())
  let t1251 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_neg()), @complexes.cx_inj(), t1250]))
  let t1249 = @tactics.match_mp_tac(@canal.continuous_complex_inv_at())
  let t1248 = @simp.gen_rewrite_tac(fn(x1245 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1246 = @equal.land_conv(x1245)
    fn(x1247 : @kernel.Term) -> @kernel.Thm raise {
      s1246(x1247)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t1253 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_neg_inv(), @equal.gsym(@topology.continuous_at())])), t1248), t1249), t1251), t1252), @calc_rat.real_arith_tac)
  let t1242 = @tactics.conv_tac(@complexes.complex_ring)
  let t1241 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t1240 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1243 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.eventually_at(), @equal.gsym(@vectors.dist_nz())])), t1240), t1241), t1242)
  let t1244 = @list.List([@tactics.then_tac(@canal.lim_tac, @tactics.conv_tac(@complexes.complex_ring)), t1243])
  let t1239 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1238 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t1237 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) + Cx(real_of_num(1)) + (w : Cart[Real, 2]) == z + (w + Cx(real_of_num(1)))"))]))
  let t1236 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @equal.gsym(@real.real_of_num_suc()), @complexes.cx_add()]))
  let t1233 = @simp.rewrite_rule(@list.List([@theorems.conj_assoc()]))(@topology.lim_compose_at())
  let t1234 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(t1233))
  let t1229 = @term_syntax.parse_term("(z : Cart[Real, 2]) => z + Cx(real_of_num(1))")
  let t1230 = @list.List([@term_syntax.parse_term("at(-Cx(real_of_num(SUC((n : Num)))))"), t1229])
  let t1254 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1227 = @tactics.mp_tac(x1226)
        fn(x1228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1227(x1228)
        }
      })(((x1231 : @kernel.Thm) => @bool.ispecl(t1230, x1231))(x1232))
    })(t1234(x1235))
  }), t1236), t1237), t1238), t1239), @tactics.conj_tac), t1244), t1253])
  let t1225 = @tactics.match_mp_tac(@canal.lim_complex_mul())
  let t1224 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc()]))
  let t1223 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("-Cx(real_of_num(1)) * (p : Cart[Real, 2]) * ((is_ : Cart[Real, 2]) * (i : Cart[Real, 2])) == p * i * -is_"))]))
  let t1222 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_pow(), @complexes.complex_inv_mul()]))
  let t1221 = @simp.once_rewrite_tac(@list.List([cgamma_recurrence_alt()]))
  let t1255 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.fact(), @complexes.cx_mul(), @equal.gsym(@realax.real_of_num_mul())])), t1221), t1222), t1223), t1224), t1225), @tactics.conj_tac), t1254)
  let t1219 = @simp.rewrite_tac(@list.List([@topology.continuous_at(), @complexes.complex_add_lid(), cgamma_1()]))
  let t1218 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), @complexes.cx_inj()]))
  let t1217 = @tactics.match_mp_tac(continuous_at_cgamma())
  let t1216 = @tactics.match_mp_tac(@topology.continuous_at_compose())
  let t1220 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1213 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1214 = @equal.land_conv(x1213)
    fn(x1215 : @kernel.Term) -> @kernel.Thm raise {
      s1214(x1215)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())])), t1216), @tactics.conj_tac), @list.List([@canal.continuous_tac, @tactics.all_tac])), t1217), t1218), @calc_rat.real_arith_tac), t1219])
  let t1212 = @tactics.subgoal_then(@term_syntax.parse_term("continuous((z : Cart[Real, 2]) => cgamma(z + Cx(real_of_num(1))), at(Cx(real_of_num(0))))"), fn(x1209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1210 = @tactics.mp_tac(x1209)
    fn(x1211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1210(x1211)
    }
  })
  let t1208 = @list.List([@tactics.conv_tac(@complexes.complex_field), @tactics.all_tac])
  let t1207 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t1205 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t1206 = @tactics.map_every(fn(x1202 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1203 = @tactics.exists_tac(x1202)
    fn(x1204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1203(x1204)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => cgamma(z + Cx(real_of_num(1)))"), t1205]))
  let t1201 = @tactics.match_mp_tac(@topology.lim_transform_away_at())
  let t1200 = @simp.once_rewrite_tac(@list.List([cgamma_recurrence_alt()]))
  let t1256 = @tactics.thenl(@nums.induct_tac, @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_add_rid(), @complexes.complex_neg_0(), @arith.fact(), @complexes.complex_pow(), @complexes.complex_div_1()])), t1200), t1201), t1206), t1207), @tactics.conj_tac), t1208), t1212), t1220), t1255]))
  cgamma_simple_poles_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, op_minus_minus_gt((z : Cart[Real, 2]) => (z + Cx(real_of_num(n))) * cgamma(z), pow(-Cx(real_of_num(1)), n) / Cx(real_of_num(FACT(n))), at(-Cx(real_of_num(n))))"), t1256))
}

///|
let cgamma_simple_poles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_SIMPLE_POLES")

///|
/// `CGAMMA_SIMPLE_POLES`
pub fn cgamma_simple_poles() -> @kernel.Thm {
  cgamma_simple_poles_c.get()
}

///|
/// CNJ_CGAMMA
fn step_23() -> Unit raise {
  let t1272 = @simp.asm_simp_tac(@list.List([@transcendentals.cnj_clog(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.le_1(), @complexes.cnj_cx()]))
  let t1271 = @simp.rewrite_tac(@list.List([@complexes.cnj_mul(), @complexes.cnj_cnj()]))
  let t1270 = @simp.rewrite_tac(@list.List([@complexes.cnj_cx(), @transcendentals.cnj_cexp()]))
  let t1269 = @simp.rewrite_tac(@list.List([@transcendentals.cpow(), @complexes.cnj_eq_0()]))
  let t1268 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1267 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1266 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1265 = @simp.rewrite_tac(@list.List([@complexes.cnj_add(), @complexes.cnj_cnj(), @complexes.cnj_cx()]))
  let t1264 = @simp.simp_tac(@list.List([@complexes.cnj_div(), @complexes.cnj_mul(), @complexes.cnj_cx(), @complexes.cnj_cproduct(), @iterate.finite_numseg()]))
  let t1263 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually()))
  let t1262 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), cgamma_v1()))
  let t1261 = @simp.rewrite_tac(@list.List([@complexes.cnj_cnj()]))
  let t1260 = @simp.gen_rewrite_tac(fn(x1259 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1259
  }, @list.List([@equal.gsym(@canal.lim_cnj())]))
  let t1258 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t1257 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) → (d : Bool)) == (a && b → c → d)"))]))(@topology.lim_unique()))
  let t1273 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("cnj((z : Cart[Real, 2]))"), cgamma_v1()))), t1257), t1258), t1260), t1261), t1262), t1263), t1264), t1265), t1266), t1267), t1268), t1269), @tactics.disch_tac), @class.cond_cases_tac), t1270), t1271), t1272)
  cnj_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], cnj(cgamma(z)) == cgamma(cnj(z))"), t1273))
}

///|
let cnj_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_CGAMMA")

///|
/// `CNJ_CGAMMA`
pub fn cnj_cgamma() -> @kernel.Thm {
  cnj_cgamma_c.get()
}

///|
/// REAL_GAMMA
fn step_24() -> Unit raise {
  let t1274 = @simp.simp_tac(@list.List([@complexes.real_cnj(), cnj_cgamma()]))
  real_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) → real(cgamma(z))"), t1274))
}

///|
let real_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_GAMMA")

///|
/// `REAL_GAMMA`
pub fn real_gamma() -> @kernel.Thm {
  real_gamma_c.get()
}

///|
/// RE_POS_CGAMMA_REAL
fn step_25() -> Unit raise {
  let t1294 = @tactics.match_mp_tac(@products.product_pos_le_numseg())
  let t1293 = @simp.simp_tac(@list.List([@realax.real_le_mul(), @transcendentals.real_exp_pos_le(), @realarith.real_pos(), @real.real_le_inv_eq()]))
  let t1292 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t1286 = @equal.gsym(@complexes.cx_product())
  let t1287 = @equal.gsym(@complexes.cx_add())
  let t1288 = @equal.gsym(@transcendentals.cx_exp())
  let t1289 = @equal.gsym(@complexes.cx_mul())
  let t1290 = @equal.gsym(@complexes.cx_inv())
  let t1291 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1(), @equal.gsym(@transcendentals.cx_log()), t1290, @real.real_of_num_lt(), t1289, t1288, @complexes.re_mul_cx(), @complexes.re_cx(), @complexes.complex_div(), t1287, t1286, @iterate.finite_numseg()]))
  let t1285 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1284 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1283 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially(), @metric.eventually_sequentially()]))
  let t1282 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool) → (s : Bool)) == (p && r → q → s)"))]))(@canal.lim_re_lbound()))
  let t1281 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx((x : Real))"), cgamma_v1()))
  let t1280 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t1279 = @tactics.disch_then(fn(x1276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1277 = @tactics.subst1_tac(x1276)
    fn(x1278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1277(x1278)
    }
  })
  let t1275 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1295 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.real_exists(), @theorems.left_imp_exists_thm(), @theorems.imp_conj()])), @tactics.gen_tac), t1275), t1279), t1280), @tactics.disch_tac), t1281), t1282), t1283), t1284), t1285), @tactics.disch_tac), t1291), t1292), t1293), t1294), @calc_rat.asm_real_arith_tac)
  re_pos_cgamma_real_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real(z) && real_of_num(0) <= Re(z) → real_of_num(0) <= Re(cgamma(z))"), t1295))
}

///|
let re_pos_cgamma_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RE_POS_CGAMMA_REAL")

///|
/// `RE_POS_CGAMMA_REAL`
pub fn re_pos_cgamma_real() -> @kernel.Thm {
  re_pos_cgamma_real_c.get()
}

///|
/// CGAMMA_LEGENDRE_ALT
fn step_26() -> Unit raise {
  let t1428 = @meson.meson_tac(@list.List([@arith.odd_exists(), @arith.even_exists()]))
  let t1427 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), @arith.even_or_odd()))
  let t1426 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x1423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1424 = @tactics.mp_tac(x1423)
    fn(x1425 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1424(x1425)
    }
  }))
  let t1420 = @simp.gen_rewrite_rule(fn(x1419 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1419
  }, @list.List([@class.not_forall_thm()]))
  let t1422 = @tactics.first_x_assum(fn(x1421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1417 = @tactics.mp_tac(x1416)
      fn(x1418 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1417(x1418)
      }
    })(t1420(x1421))
  })
  let t1415 = @simp.rewrite_tac(@list.List([@real.real_of_num_suc(), @realax.real_of_num_mul()]))
  let t1414 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * (real_of_num(1) / real_of_num(2) + (n : Real)) == real_of_num(2) * n + real_of_num(1)"))]))
  let t1412 = @equal.gsym(@complexes.cx_mul())
  let t1413 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t1412]))
  let t1411 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) + (n : Cart[Real, 2]) == Cx(real_of_num(0))) == (Cx(real_of_num(2)) * z + Cx(real_of_num(2)) * n == Cx(real_of_num(0)))"))]))
  let t1410 = @simp.rewrite_tac(@list.List([@theorems.or_exists_thm(), @equal.gsym(@complexes.complex_add_assoc())]))
  let t1409 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1408 = @simp.rewrite_tac(@list.List([cgamma_eq_0()]))
  let t1429 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0)) && ((w : Cart[Real, 2]) == Cx(real_of_num(0)) || (y : Cart[Real, 2]) == Cx(real_of_num(0))) → w * y == (p : Cart[Real, 2]) * ((q : Cart[Real, 2]) * z)"))), t1408), @tactics.conj_tac), t1409), t1410), t1411), t1413), t1414), t1415), t1422), t1426), t1427), t1428)
  let t1407 = @simp.asm_rewrite_tac(@list.List([cgamma_eq_0(), @transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t1406 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("!((p : Cart[Real, 2]) == Cx(real_of_num(0))) && !((z2 : Cart[Real, 2]) == Cx(real_of_num(0))) → (a : Cart[Real, 2]) == (z : Cart[Real, 2]) * (z' : Cart[Real, 2]) / (p * z2) → z * z' == p * (a * z2)")))
  let t1405 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t1402 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.lim_unique()))
  let t1404 = @tactics.disch_then(fn(x1403 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1400 = @tactics.mp_tac(x1399)
      fn(x1401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1400(x1401)
      }
    })(t1402(x1403))
  })
  let t1398 = @simp.rewrite_tac(@list.List([@complexes.complex_pow(), @complexes.complex_mul_rid(), @complexes.complex_div_1(), @theorems.imp_imp()]))
  let t1397 = @simp.rewrite_tac(@list.List([cgamma_1(), @transcendentals.cpow_n(), @complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t1396 = @list.List([@calc_rat.real_arith_tac, @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)])
  let t1393 = @equal.gsym(@complexes.cx_sub())
  let t1394 = @equal.gsym(@complexes.cx_mul())
  let t1395 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t1394, t1393, @complexes.cx_inj()]))
  let t1430 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1390
    let t1392 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(1) / real_of_num(2))"), th))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), th)), t1392)
  }), t1395), @tactics.ants_tac), t1396), t1397), t1398), t1404), t1405), t1406), t1407), t1429])
  let t1389 = @class.asm_cases_tac(@term_syntax.parse_term("∀ n : Num, !(Cx(real_of_num(2)) * (z : Cart[Real, 2]) + Cx(real_of_num(n)) == Cx(real_of_num(0)))"))
  let t1388 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1386 = @tactics.conv_tac(@complexes.complex_ring)
  let t1385 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc()), @complexes.complex_mul_linv()]))
  let t1384 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid(), @complexes.complex_mul_assoc()]))
  let t1383 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_rinv(), @complexes.cproduct_eq_0(), @iterate.finite_numseg()]))
  let t1382 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(x : Cart[Real, 2]) * ((a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * ((c : Cart[Real, 2]) * ((d : Cart[Real, 2]) * ((e : Cart[Real, 2]) * (f : Cart[Real, 2])))))) == c * e * (a * (b * (d * (f * x))))"))]))
  let t1381 = @simp.simp_tac(@list.List([@arith.le_0(), @complexes.complex_inv_mul(), @complexes.complex_inv_inv(), @equal.gsym(@complexes.complex_pow_inv())]))
  let t1380 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1379 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t1378 = @simp.simp_tac(@list.List([@equal.gsym(@arith.add1()), @complexes.cproduct_clauses_numseg()]))
  let t1377 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cproduct_pair())]))
  let t1375 = @equal.gsym(@complexes.cx_mul())
  let t1376 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t1375, @realax.real_of_num_add(), @realax.real_of_num_mul()]))
  let t1374 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.cproduct_mul()), @arith.sub_0(), @iterate.finite_numseg()]))
  let t1373 = @simp.simp_tac(@list.List([@complexes.cproduct_mul(), @iterate.finite_numseg(), @complexes.cproduct_const_numseg()]))
  let t1372 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) + (m : Cart[Real, 2])) * (z + Cx(real_of_num(1) / real_of_num(2)) + m) == inv(Cx(real_of_num(4))) * ((Cx(real_of_num(2)) * z + Cx(real_of_num(2)) * m) * (Cx(real_of_num(2)) * z + (Cx(real_of_num(2)) * m + Cx(real_of_num(1)))))"))]))
  let t1371 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.cproduct_mul()), @iterate.finite_numseg()]))
  let t1369 = @equal.gsym(@complexes.complex_inv_mul())
  let t1370 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_2()), t1369]))
  let t1368 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_rinv(), @complexes.complex_pow_eq_0(), @transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq(), @arith.le_1(), @complexes.complex_mul_lid()]))
  let t1367 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_pow_2()), @complexes.complex_mul_2(), @transcendentals.cpow_add()]))
  let t1366 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(x : Cart[Real, 2]) * ((y : Cart[Real, 2]) * ((a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * ((c : Cart[Real, 2]) * ((d : Cart[Real, 2]) * ((e : Cart[Real, 2]) * ((f : Cart[Real, 2]) * ((g : Cart[Real, 2]) * ((h : Cart[Real, 2]) * ((i : Cart[Real, 2]) * ((j : Cart[Real, 2]) * ((k : Cart[Real, 2]) * ((l : Cart[Real, 2]) * (m : Cart[Real, 2])))))))))))))) == x * y * (e * h * (a * d * k * (b * f * l * (i * j * (m * (c * g))))))"))]))
  let t1365 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc())]))
  let t1364 = @simp.simp_tac(@list.List([@complexes.complex_pow_1(), @complexes.complex_div(), @complexes.complex_inv_inv(), @complexes.complex_inv_mul()]))
  let t1363 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_sub(), @transcendentals.cpow_n(), @complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t1362 = @simp.simp_tac(@list.List([@transcendentals.cpow_mul_real(), @complexes.real_cx(), @complexes.re_cx(), @realarith.real_pos()]))
  let t1361 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul()), @complexes.cx_mul()]))
  let t1360 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_add(), @complexes.complex_div(), @complexes.complex_inv_mul(), @complexes.complex_inv_inv()]))
  let t1359 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1358 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1357 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1356 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually()))
  let t1355 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid()]))
  let t1350 = @drule.match_mp(@canal.lim_complex_mul())
  let t1352 = @tactics.disch_then(fn(x1351 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1347 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1348 = @tactics.mp_tac(x1347)
      fn(x1349 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1348(x1349)
      }
    })(t1350(x1351))
  })
  let t1353 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_imp()])), t1352)
  let t1346 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1345 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t1343 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.lim_subsequence()))(@transcendentals.lim_inv_n())
  let t1344 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num) => 2 * n + 1"), t1343))
  let t1342 = @tactics.match_mp_tac(@canal.lim_null_complex_lmul())
  let t1341 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) + (b : Cart[Real, 2]) - b == a"))]))
  let t1340 = @simp.once_rewrite_tac(@list.List([@canal.lim_null_complex()]))
  let t1354 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_rinv(), @complexes.cx_inj(), @realax.real_of_num_eq(), @complexes.complex_add_rdistrib(), @int.arith_rule(@term_syntax.parse_term("!(2 * (n : Num) + 1 == 0)"))])), t1340), t1341), t1342), t1344), t1345), t1346), @int.arith_tac), t1353])
  let t1339 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_gt((n : Num) => (Cx(real_of_num(2)) * (z : Cart[Real, 2]) + Cx(real_of_num(2 * n + 1))) / Cx(real_of_num(2 * n + 1)), Cx(real_of_num(1)), sequentially)"), fn(x1336 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1337 = @tactics.mp_tac(x1336)
    fn(x1338 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1337(x1338)
    }
  })
  let t1335 = @simp.rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t1334 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_entire(), @transcendentals.cpow_eq_0(), cgamma_eq_0()]))
  let t1330 = @simp.rewrite_rule(@list.List([@theorems.conj_assoc()]))(@canal.lim_complex_div())
  let t1331 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(t1330))
  let t1333 = @tactics.disch_then(fn(x1332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1327 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1328 = @tactics.mp_tac(x1327)
      fn(x1329 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1328(x1329)
      }
    })(t1331(x1332))
  })
  let t1326 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1323 = @drule.match_mp(@canal.lim_complex_mul())
  let t1325 = @tactics.disch_then(fn(x1324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1321 = @tactics.mp_tac(x1320)
      fn(x1322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1321(x1322)
      }
    })(t1323(x1324))
  })
  let t1318 = @bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2]) + Cx(real_of_num(1) / real_of_num(2))"), cgamma_v1())
  let t1319 = @tactics.mp_tac(@bool.conj(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), cgamma_v1()), t1318))
  let t1315 = @drule.match_mp(@canal.lim_complex_lmul())
  let t1312 = @term_syntax.parse_term("cpow(Cx(real_of_num(2)), Cx(real_of_num(1)) - Cx(real_of_num(2)) * (z : Cart[Real, 2]))")
  let t1317 = @tactics.disch_then(fn(x1316 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1310 = @tactics.mp_tac(x1309)
        fn(x1311 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1310(x1311)
        }
      })(((x1313 : @kernel.Thm) => @bool.spec(t1312, x1313))(x1314))
    })(t1315(x1316))
  })
  let t1308 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t1305 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.lim_subsequence()))
  let t1302 = @term_syntax.parse_term("(n : Num) => 2 * n")
  let t1307 = @tactics.disch_then(fn(x1306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1299 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1300 = @tactics.mp_tac(x1299)
        fn(x1301 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1300(x1301)
        }
      })(((x1303 : @kernel.Thm) => @bool.spec(t1302, x1303))(x1304))
    })(t1305(x1306))
  })
  let t1298 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(2)) * (z : Cart[Real, 2])"), cgamma_v1()))
  let t1297 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1387 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(n : Num) => cpow(Cx(real_of_num(n)), Cx(real_of_num(1) / real_of_num(2))) * inv(Cx(real_of_num(2))) * (pow(Cx(real_of_num(FACT(n))), 2) * inv(Cx(real_of_num(FACT(2 * n)))) * (pow(Cx(real_of_num(4)), n + 1) * inv(Cx(real_of_num(2 * n + 1)))))")), t1297), t1298), t1307), t1308), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t1317), t1319), t1325), t1326), t1333), t1334), t1335), t1339), t1354), t1355), t1356), t1357), t1358), t1359), @tactics.disch_tac), t1360), t1361), t1362), t1363), t1364), t1365), t1366), t1367), t1368), t1370), t1371), t1372), t1373), t1374), t1376), t1377), t1378), t1379), t1380), t1381), t1382), t1383), t1384), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1385), t1386), @tactics.all_tac])
  let t1296 = @tactics.subgoal_then(@term_syntax.parse_term("∃ f : (Num) -> Cart[Real, 2], ∀ z : Cart[Real, 2], (∀ n : Num, !(Cx(real_of_num(2)) * z + Cx(real_of_num(n)) == Cx(real_of_num(0)))) → op_minus_minus_gt(f, cgamma(z) * cgamma(z + Cx(real_of_num(1) / real_of_num(2))) / (cpow(Cx(real_of_num(2)), Cx(real_of_num(1)) - Cx(real_of_num(2)) * z) * cgamma(Cx(real_of_num(2)) * z)), sequentially)"), @tactics.choose_tac)
  let t1431 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_div())])), t1296), t1387), t1388), t1389), t1430)
  cgamma_legendre_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], cgamma(z) * cgamma(z + Cx(real_of_num(1)) / Cx(real_of_num(2))) == cpow(Cx(real_of_num(2)), Cx(real_of_num(1)) - Cx(real_of_num(2)) * z) * (cgamma(Cx(real_of_num(1)) / Cx(real_of_num(2))) * cgamma(Cx(real_of_num(2)) * z))"), t1431))
}

///|
let cgamma_legendre_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_LEGENDRE_ALT")

///|
/// `CGAMMA_LEGENDRE_ALT`
pub fn cgamma_legendre_alt() -> @kernel.Thm {
  cgamma_legendre_alt_c.get()
}

///|
/// CGAMMA_REFLECTION
fn step_27() -> Unit raise {
  let t1437 = @meson.asm_meson_tac(@list.List([@floor.real_eq_integers_imp()]))
  let t1436 = @simp.asm_rewrite_tac(@list.List([@complexes.dist_cx()]))
  let t1435 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x1432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1433 = @tactics.mp_tac(x1432)
    fn(x1434 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1433(x1434)
    }
  })))
  let t1438 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1435), t1436), t1437)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], (∃ n : Real, integer(n) && w == Cx(n)) && (∃ n : Real, integer(n) && z == Cx(n)) && distance((w, z)) < real_of_num(1) → w == z"), t1438)
  let t1969 = @simp.rewrite_tac(@list.List([@transcendentals.pi_nz(), @complexes.real(), @complexes.im_ii()]))
  let t1966 = @simp.once_rewrite_rule(@list.List([@complexes.complex_mul_sym()]))(@complexes.real_mul_cx())
  let t1967 = @equal.gsym(@complexes.cx_mul())
  let t1968 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.cx_sub()), t1967, @complexes.real_cx(), @transcendentals.real_sin(), real_gamma(), @complexes.real_mul(), t1966]))
  let t1970 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("real((y : Cart[Real, 2])) && !real((x : Cart[Real, 2])) → !(x == y)"))), t1968), t1969), @int.arith_tac)
  let t1965 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1964 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_mul(), @realax.real_of_num_eq(), @arith.mult_eq_1()]))
  let t1961 = @simp.gen_rewrite_rule(fn(x1960 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1960
  }, @list.List([@int.integer()]))
  let t1963 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1962 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.choose_tac(t1961(x1962))
  }))
  let t1959 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @calc_int.real_abs_num()]))
  let t1955 = @term_syntax.parse_term("real_abs")
  let t1958 = @tactics.first_x_assum(fn(x1957 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1952 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1953 = @tactics.mp_tac(x1952)
      fn(x1954 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1953(x1954)
      }
    })(((x1956 : @kernel.Thm) => @equal.ap_term(t1955, x1956))(x1957))
  })
  let t1971 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(m : Real)"))(@tactics.strip_assume_tac)), t1958), t1959), t1963), t1964), t1965), t1970])
  let t1951 = @simp.asm_simp_tac(@list.List([@complexes.cx_inj(), @calc_rat.real_field(@term_syntax.parse_term("!((n : Real) == real_of_num(0)) → (inv(real_of_num(4) * n) == (m : Real)) == (real_of_num(4) * (m * n) == real_of_num(1))"))]))
  let t1950 = @simp.expand_tac("g")
  let t1949 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t1948 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid()]))
  let t1947 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @real.real_sub_refl(), @transcendentals.real_exp_0()]))
  let t1946 = @simp.rewrite_tac(@list.List([@transcendentals.sin_pi2(), @transcendentals.cos_pi2(), @equal.gsym(@complexes.ii())]))
  let t1945 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((n : Real) == real_of_num(0)) → real_of_num(2) * (n * pi) * inv(real_of_num(4) * n) == pi / real_of_num(2)"))]))
  let t1944 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_complex(), @realax.real_add_lid()]))
  let t1943 = @simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im(), @calc_int.real_mul_lzero(), @complexes.im_cx(), @complexes.re_cx()]))
  let t1942 = @simp.gen_rewrite_tac(fn(x1941 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    ((x1937 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(3, fn(x1934 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1935 = @equal.land_conv(x1934)
      fn(x1936 : @kernel.Term) -> @kernel.Thm raise {
        s1935(x1936)
      }
    }, x1937))((fn(x1938 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1939 = @equal.rand_conv(x1938)
      fn(x1940 : @kernel.Term) -> @kernel.Thm raise {
        s1939(x1940)
      }
    })(x1941))
  }, @list.List([@complexes.complex_mul()]))
  let t1933 = @simp.asm_rewrite_tac(@list.List([]))
  let t1932 = @tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(a : Cart[Real, 2])"), @complexes.complex_v1())))
  let t1931 = @tactics.disch_then(fn(x1928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1929 = @tactics.subst1_tac(x1928)
    fn(x1930 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1929(x1930)
    }
  })
  let t1927 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_add()]))
  let t1926 = @list.List([@meson.asm_meson_tac(@list.List([@floor.integer_closed()])), @tactics.all_tac])
  let t1925 = @tactics.subgoal_then(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])(Cx(real_of_num(0))) == Cx(pi)"), fn(x1922 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1923 = @tactics.subst1_tac(x1922)
    fn(x1924 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1923(x1924)
    }
  })
  let t1921 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rzero(), @complexes.complex_add_lid()]))
  let t1972 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1918 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1918
    let t1920 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(0))"), th_2))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(inv(real_of_num(4) * (n : Real)))"), th_2)), t1920)
  }), t1921), t1925), t1926), t1927), t1931), t1932), t1933), t1942), t1943), t1944), t1945), t1946), t1947), t1948), t1949), t1950), t1951), @class.cond_cases_tac), t1971)
  let t1915 = @tactics.conv_tac(@complexes.complex_field)
  let t1914 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj())]))
  let t1913 = @tactics.mp_tac(@transcendentals.pi_nz())
  let t1912 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@floor.integer_closed()]))])
  let t1911 = @simp.asm_rewrite_tac(@list.List([]))
  let t1909 = @simp.expand_tac("g")
  let t1910 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t1909])
  let t1916 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) == g(Cx(real_of_num(0)))"), fn(x1906 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1907 = @tactics.mp_tac(x1906)
    fn(x1908 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1907(x1908)
    }
  }), t1910), t1911), @class.cond_cases_tac), t1912), t1913), t1914), t1915)
  let t1905 = @meson.meson_tac(@list.List([@nums.num_cases(), @arith.add1()]))
  let t1904 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @theorems.right_exists_and_thm(), @theorems.exists_refl()]))
  let t1903 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @equal.gsym(@theorems.exists_refl())]))
  let t1901 = @calc_rat.real_arith(@term_syntax.parse_term("(-(p : Real) + (n : Real) == real_of_num(0)) == (p == n)"))
  let t1902 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), @complexes.cx_inj(), @realax.real_of_num_add(), @realax.real_of_num_eq(), t1901]))
  let t1900 = @tactics.disch_then(@tactics.disj_cases_then(fn(x1897 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1898 = @tactics.subst_all_tac(x1897)
    fn(x1899 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1898(x1899)
    }
  }))
  let t1894 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) == (n : Real) → x == n || x == -n")))
  let t1896 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(x1895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1892 = @tactics.mp_tac(x1891)
      fn(x1893 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1892(x1893)
      }
    })(t1894(x1895))
  }))
  let t1890 = @simp.rewrite_tac(@list.List([@int.integer()]))
  let t1888 = @tactics.conjuncts_then2(fn(x1882 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1883 = @tactics.mp_tac(x1882)
    fn(x1884 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1883(x1884)
    }
  }, fn(x1885 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1886 = @tactics.subst1_tac(x1885)
    fn(x1887 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1886(x1887)
    }
  })
  let t1889 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(m : Real)"))(t1888))
  let t1881 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((c : Cart[Real, 2]) - (z : Cart[Real, 2]) + (n : Cart[Real, 2]) == Cx(real_of_num(0))) == (z == n + c)"))]))
  let t1880 = @simp.rewrite_tac(@list.List([@theorems.or_exists_thm(), @equal.gsym(@complexes.complex_add_assoc())]))
  let t1879 = @list.List([@meson.asm_meson_tac(@list.List([@realax.real_mul_sym(), @complexes.cx_mul()])), @tactics.all_tac])
  let t1878 = @simp.rewrite_tac(@list.List([cgamma_eq_0(), @transcendentals.csin_eq_0(), @complexes.complex_inv_eq_0()]))
  let t1877 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0)) && ((w : Cart[Real, 2]) == Cx(real_of_num(0)) || (y : Cart[Real, 2]) == Cx(real_of_num(0))) → w * y == (p : Cart[Real, 2]) * z")))
  let t1917 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div()])), t1877), t1878), @tactics.conj_tac), t1879), t1880), t1881), t1889), t1890), t1896), t1900), t1902), t1903), t1904), t1905), t1916])
  let t1876 = @class.asm_cases_tac(@term_syntax.parse_term("∃ n : Real, integer(n) && (z : Cart[Real, 2]) == Cx(n)"))
  let t1875 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1874 = @tactics.disch_then(fn(x1873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1871 = @tactics.assume_tac(x1870)
      fn(x1872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1871(x1872)
      }
    })(@equal.gsym(x1873))
  })
  let t1869 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_add_lid()]))
  let t1868 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @equal.gsym(@complexes.cx_def())]))
  let t1973 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(a : Cart[Real, 2])"), @complexes.complex_v1()))), t1868), t1869), t1874), t1875), t1876), t1917), t1972])
  let t1867 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Real) == real_of_num(0)"))
  let t1866 = @simp.asm_rewrite_tac(@list.List([]))
  let t1865 = @tactics.undisch_tac(@term_syntax.parse_term("∀ z : Cart[Real, 2], cexp((h : (Cart[Real, 2]) -> Cart[Real, 2])(z)) == (g : (Cart[Real, 2]) -> Cart[Real, 2])(z)"))
  let t1864 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1861 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1862 = @tactics.assume_tac(x1861)
    fn(x1863 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1862(x1863)
    }
  }, @tactics.x_choose_then(@term_syntax.parse_term("(n : Real)"))(@tactics.strip_assume_tac)))
  let t1860 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_nz(), @transcendentals.cexp_eq_1()]))
  let t1859 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((a : Cart[Real, 2]) * (b : Cart[Real, 2]) == b) == (a == Cx(real_of_num(1)) || b == Cx(real_of_num(0)))"))]))
  let t1858 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_add(), @complexes.complex_mul_rid()]))
  let t1857 = @simp.rewrite_tac(@list.List([@floor.integer_closed(), @complexes.complex_add_lid(), @complexes.complex_mul_rzero()]))
  let t1856 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("∀ x : Cart[Real, 2], (h : (Cart[Real, 2]) -> Cart[Real, 2])(x) == (a : Cart[Real, 2]) * x + (b : Cart[Real, 2])"))]))
  let t1855 = @tactics.disch_then(fn(x1853 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1853
    @simp.rewrite_tac(@list.List([@equal.gsym(th_1)]))
  })
  let t1852 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("∀ z : Cart[Real, 2], cexp((h : (Cart[Real, 2]) -> Cart[Real, 2])(z)) == (g : (Cart[Real, 2]) -> Cart[Real, 2])(z)")))
  let t1847 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t1848 = @list.List([@term_syntax.parse_term("real_of_num(1)"), t1847])
  let t1851 = @tactics.first_x_assum(fn(x1850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1844 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1845 = @tactics.mp_tac(x1844)
      fn(x1846 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1845(x1846)
      }
    })(((x1849 : @kernel.Thm) => @bool.specl(t1848, x1849))(x1850))
  })
  let t1839 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t1841 = @tactics.disch_then((x1840 : @kernel.Thm) => @tactics.x_choose_tac(t1839, x1840))
  let t1842 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((a : Cart[Real, 2]) - (b : Cart[Real, 2]) == (c : Cart[Real, 2])) == (a == b + c)"))])), t1841)
  let t1838 = @tactics.conv_tac(@complexes.complex_ring)
  let t1837 = @simp.asm_rewrite_tac(@list.List([]))
  let t1843 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.asm_tac(@canal.gen_complex_diff_tac)(@list.List([]))), t1837), t1838), t1842])
  let t1836 = @simp.rewrite_tac(@list.List([@convex.convex_univ(), @sets.in_univ()]))
  let t1834 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t1835 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (h : (Cart[Real, 2]) -> Cart[Real, 2])(z) - (a : Cart[Real, 2]) * z"), t1834]), @canal.has_complex_derivative_zero_constant()))
  let t1831 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t1833 = @tactics.disch_then((x1832 : @kernel.Thm) => @tactics.x_choose_tac(t1831, x1832))
  let t1830 = @list.List([@meson.asm_meson_tac(@list.List([@canal.has_complex_derivative_at_within()])), @tactics.all_tac])
  let t1829 = @simp.rewrite_tac(@list.List([@convex.convex_univ(), @sets.in_univ()]))
  let t1827 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t1828 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(h' : (Cart[Real, 2]) -> Cart[Real, 2])"), t1827]), @canal.has_complex_derivative_zero_constant()))
  let t1825 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_univ()])), @tactics.disch_tac)
  let t1822 = @tactics.conv_tac(@vectors.norm_arith)
  let t1821 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1)"), @complexes.complex_norm_cx()))
  let t1820 = @tactics.undisch_tac(@term_syntax.parse_term("norm((w : Cart[Real, 2])) <= real_of_num(1)"))
  let t1819 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t1818 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1817 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((a : Cart[Real, 2])) <= (e : Real) && norm((b : Cart[Real, 2])) <= e → norm(a + b) / real_of_num(4) <= e / real_of_num(2)")))
  let t1816 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t1815 = @tactics.first_x_assum(fn(x1806 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1806
    @simp.gen_rewrite_tac(fn(x1814 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1808 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1809 = @equal.land_conv(x1808)
        fn(x1810 : @kernel.Term) -> @kernel.Thm raise {
          s1809(x1810)
        }
      })((fn(x1811 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1812 = @equal.rand_conv(x1811)
        fn(x1813 : @kernel.Term) -> @kernel.Thm raise {
          s1812(x1813)
        }
      })(x1814))
    }, @list.List([@equal.gsym(th)]))
  })
  let t1805 = @simp.asm_simp_tac(@list.List([]))
  let t1804 = @tactics.exists_tac(@term_syntax.parse_term("(h'' : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]))"))
  let t1803 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("∀ w : Cart[Real, 2], norm(w) <= norm(w) / real_of_num(2) && norm((z : Cart[Real, _])) <= norm(w) → z == vec(0)")))
  let t1802 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())]))
  let t1801 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1823 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w : Cart[Real, 2])"))(@tactics.strip_assume_tac)), t1801), t1802), t1803), t1804), t1805), t1815), t1816), t1817), @tactics.conj_tac), t1818), t1819), t1820), t1821), t1822)
  let t1800 = @meson.asm_meson_tac(@list.List([@canal.holomorphic_on_imp_continuous_on(), @topology.continuous_on_subset(), @sets.subset_univ()]))
  let t1824 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_lift_norm_compose()), t1800), t1823])
  let t1799 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1798 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t1797 = @simp.asm_rewrite_tac(@list.List([@canal.complex_in_cball_0(), @topology.compact_cball(), @topology.cball_eq_empty()]))
  let t1795 = @term_syntax.parse_term("cball((Cx(real_of_num(0)), real_of_num(1)))")
  let t1796 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => norm((h'' : (Cart[Real, 2]) -> Cart[Real, 2])(z))"), t1795]), @topology.continuous_attains_sup()))
  let t1794 = @simp.simp_tac(@list.List([@topology.interior_limit_point(), @topology.interior_cball(), @topology.centre_in_ball(), @topology.open_univ(), @real.real_lt_01()]))
  let t1793 = @simp.asm_rewrite_tac(@list.List([@topology.connected_univ(), @sets.subset_univ(), @sets.in_univ()]))
  let t1792 = @tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(0))"))
  let t1791 = @tactics.exists_tac(@term_syntax.parse_term("cball((Cx(real_of_num(0)), real_of_num(1)))"))
  let t1826 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.analytic_continuation()), t1791), t1792), t1793), t1794), t1796), t1797), t1798), t1799), @tactics.ants_tac), t1824), t1825])
  let t1790 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], IN(z, UNIV) → (h'' : (Cart[Real, 2]) -> Cart[Real, 2])(z) == Cx(real_of_num(0))"), fn(x1787 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1788 = @tactics.mp_tac(x1787)
    fn(x1789 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1788(x1789)
    }
  })
  let t1786 = @simp.asm_rewrite_tac(@list.List([@topology.open_univ()]))
  let t1783 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t1784 = @term_syntax.parse_term("(h'' : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t1785 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(h' : (Cart[Real, 2]) -> Cart[Real, 2])"), t1784, t1783]), @cauchy.holomorphic_derivative()))
  let t1780 = @tactics.conv_tac(@complexes.complex_ring)
  let t1781 = @tactics.thenl(@tactics.conj_tac, @list.List([@simp.asm_rewrite_tac(@list.List([@class.eta_ax()])), t1780]))
  let t1779 = @tactics.asm_tac(@canal.gen_complex_diff_tac)(@list.List([]))
  let t1777 = @simp.asm_rewrite_tac(@list.List([]))
  let t1778 = @list.List([@simp.rewrite_tac(@list.List([])), t1777])
  let t1776 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1775 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => ((h' : (Cart[Real, 2]) -> Cart[Real, 2])(z / Cx(real_of_num(2))) + h'((z + Cx(real_of_num(1))) / Cx(real_of_num(2)))) / Cx(real_of_num(2))"))
  let t1774 = @tactics.match_mp_tac(@canal.complex_derivative_unique_at())
  let t1782 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t1774), t1775), t1776), @tactics.conj_tac), t1778), t1779), t1781), @tactics.all_tac])
  let t1773 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], ((h'' : (Cart[Real, 2]) -> Cart[Real, 2])(z / Cx(real_of_num(2))) + h''((z + Cx(real_of_num(1))) / Cx(real_of_num(2)))) / Cx(real_of_num(4)) == h''(z)"), fn(x1770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1771 = @tactics.assume_tac(x1770)
    fn(x1772 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1771(x1772)
    }
  })
  let t1769 = @tactics.x_gen_tac(@term_syntax.parse_term("(h'' : (Cart[Real, 2]) -> Cart[Real, 2])"))
  let t1768 = @simp.asm_rewrite_tac(@list.List([@topology.open_univ(), @sets.in_univ(), @class.skolem_thm(), @theorems.left_imp_exists_thm()]))
  let t1766 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t1767 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(h' : (Cart[Real, 2]) -> Cart[Real, 2])"), t1766]), @canal.holomorphic_on_open()))
  let t1765 = @simp.asm_rewrite_tac(@list.List([@topology.open_univ()]))
  let t1762 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t1763 = @term_syntax.parse_term("(h' : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t1764 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(h : (Cart[Real, 2]) -> Cart[Real, 2])"), t1763, t1762]), @cauchy.holomorphic_derivative()))
  let t1759 = @tactics.conv_tac(@complexes.complex_ring)
  let t1760 = @tactics.thenl(@tactics.conj_tac, @list.List([@simp.asm_rewrite_tac(@list.List([])), t1759]))
  let t1758 = @tactics.asm_tac(@canal.gen_complex_diff_tac)(@list.List([]))
  let t1757 = @simp.rewrite_tac(@list.List([]))
  let t1754 = @simp.gen_rewrite_rule(fn(x1753 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1753
  }, @list.List([@equal.gsym(@class.fun_eq_thm())]))
  let t1756 = @tactics.first_assum(fn(x1755 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1750 = @tactics.subst1_tac(x1749)
        fn(x1751 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1750(x1751)
        }
      })(@equal.sym(x1752))
    })(t1754(x1755))
  })
  let t1747 = @simp.asm_rewrite_tac(@list.List([]))
  let t1748 = @list.List([@simp.rewrite_tac(@list.List([])), t1747])
  let t1746 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1745 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => (g : (Cart[Real, 2]) -> Cart[Real, 2])(z / Cx(real_of_num(2))) * g((z + Cx(real_of_num(1))) / Cx(real_of_num(2)))"))
  let t1744 = @tactics.match_mp_tac(@canal.complex_derivative_unique_at())
  let t1743 = @list.List([@meson.asm_meson_tac(@list.List([@transcendentals.cexp_nz()])), @tactics.all_tac])
  let t1742 = @simp.rewrite_tac(@list.List([@complexes.complex_entire()]))
  let t1741 = @tactics.exists_tac(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2]) / Cx(real_of_num(2))) * g((z + Cx(real_of_num(1))) / Cx(real_of_num(2)))"))
  let t1740 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("∀ a : Cart[Real, 2], !(a == Cx(real_of_num(0))) && a * (x : Cart[Real, 2]) == a * (y : Cart[Real, 2]) → x == y")))
  let t1761 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t1740), t1741), t1742), @tactics.conj_tac), t1743), t1744), t1745), t1746), @tactics.conj_tac), t1748), t1756), t1757), t1758), t1760), @tactics.all_tac])
  let t1739 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], ((h' : (Cart[Real, 2]) -> Cart[Real, 2])(z / Cx(real_of_num(2))) + h'((z + Cx(real_of_num(1))) / Cx(real_of_num(2)))) / Cx(real_of_num(2)) == h'(z)"), fn(x1736 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1737 = @tactics.assume_tac(x1736)
    fn(x1738 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1737(x1738)
    }
  })
  let t1735 = @tactics.x_gen_tac(@term_syntax.parse_term("(h' : (Cart[Real, 2]) -> Cart[Real, 2])"))
  let t1734 = @simp.asm_rewrite_tac(@list.List([@topology.open_univ(), @sets.in_univ(), @class.skolem_thm(), @theorems.left_imp_exists_thm()]))
  let t1732 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t1733 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(h : (Cart[Real, 2]) -> Cart[Real, 2])"), t1732]), @canal.holomorphic_on_open()))
  let t1729 = @tactics.disch_then(fn(x1728 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x1728))
  })
  let t1730 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_univ()])), t1729)
  let t1727 = @meson.asm_meson_tac(@list.List([@floor.integer_closed()]))
  let t1725 = @equal.gsym(@complexes.cx_neg())
  let t1726 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t1725]))
  let t1724 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) + (a : Cart[Real, 2]) == Cx(real_of_num(0))) == (z == -a)"))]))
  let t1723 = @simp.rewrite_tac(@list.List([@complexes.complex_eq_mul_lcancel(), @complexes.cx_inj(), @transcendentals.pi_nz()]))
  let t1722 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((a : Cart[Real, 2]) - (z : Cart[Real, 2]) + (b : Cart[Real, 2]) == Cx(real_of_num(0))) == (z == a + b)"))]))
  let t1721 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@complexes.cx_mul())]))
  let t1720 = @simp.rewrite_tac(@list.List([cgamma_eq_0(), @transcendentals.csin_eq_0(), @complexes.complex_entire()]))
  let t1719 = @simp.rewrite_tac(@list.List([@complexes.cx_inj(), @transcendentals.pi_nz()]))
  let t1718 = @simp.expand_tac("g")
  let t1717 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1716 = @simp.asm_rewrite_tac(@list.List([@paths.contractible_univ(), @sets.in_univ()]))
  let t1731 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]))(@moretop.contractible_imp_holomorphic_log())), t1716), t1717), t1718), @class.cond_cases_tac), t1719), t1720), t1721), t1722), t1723), t1724), t1726), t1727), t1730])
  let t1715 = @tactics.subgoal_then(@term_syntax.parse_term("∃ h : (Cart[Real, 2]) -> Cart[Real, 2], holomorphic_on(h, UNIV) && (∀ z : Cart[Real, 2], IN(z, UNIV) → (g : (Cart[Real, 2]) -> Cart[Real, 2])(z) == cexp(h(z)))"), fn(x1712 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1713 = @tactics.mp_tac(x1712)
    fn(x1714 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1713(x1714)
    }
  })
  let t1710 = @tactics.conv_tac(@complexes.complex_ring)
  let t1706 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) / real_of_num(2) * (x : Real) == x / real_of_num(2)"))
  let t1707 = @equal.gsym(@transcendentals.cx_cos())
  let t1708 = @equal.gsym(@transcendentals.cx_sin())
  let t1709 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), t1708, t1707, @transcendentals.sin_pi2(), @transcendentals.cos_pi2(), t1706]))
  let t1705 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_n(), @complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq(), @transcendentals.csin_add()]))
  let t1704 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_add(), @complexes.cx_neg(), @complexes.complex_mul_lneg(), @complexes.complex_mul_lid()]))
  let t1701 = @equal.rand_conv(@complexes.complex_poly_conv)
  let t1702 = @equal.binop_conv(@equal.depth_binop_conv(@term_syntax.parse_term("complex_mul"), t1701))
  let t1703 = @tactics.conv_tac(@equal.depth_binop_conv(@term_syntax.parse_term("op_eq_eq_gt"), t1702))
  let t1700 = @simp.rewrite_tac(@list.List([@complexes.complex_add_rinv()]))
  let t1697 = @term_syntax.parse_term("-(z : Cart[Real, 2])")
  let t1698 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1699 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("Cx(real_of_num(2))"), t1698, t1697]), @transcendentals.cpow_add()))
  let t1696 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("Cx(real_of_num(1) / real_of_num(2)) * ((z : Cart[Real, 2]) * Cx(pi))"), @transcendentals.csin_double()))
  let t1695 = @simp.rewrite_tac(@list.List([cgamma_legendre_alt()]))
  let t1694 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) + Cx(real_of_num(1))) / Cx(real_of_num(2)) == z / Cx(real_of_num(2)) + Cx(real_of_num(1)) / Cx(real_of_num(2)) && Cx(real_of_num(1)) - z / Cx(real_of_num(2)) == (Cx(real_of_num(1)) - z) / Cx(real_of_num(2)) + Cx(real_of_num(1)) / Cx(real_of_num(2))"))]))
  let t1693 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(1)) - ((z : Cart[Real, 2]) + Cx(real_of_num(1))) / Cx(real_of_num(2)) == (Cx(real_of_num(1)) - z) / Cx(real_of_num(2))"))]))
  let t1692 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * (c : Cart[Real, 2])) * ((d : Cart[Real, 2]) * ((e : Cart[Real, 2]) * (f : Cart[Real, 2]))) == a * d * (e * b * (c * f))"))]))
  let t1691 = @tactics.repeat_tac(@tactics.thenl(@class.cond_cases_tac, @list.List([@meson.asm_meson_tac(@list.List([@floor.integer_closed()])), @tactics.all_tac])))
  let t1689 = @equal.gsym(@complexes.cx_sub())
  let t1690 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), t1689]))
  let t1688 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) + Cx(real_of_num(1)) == (w : Cart[Real, 2])) == (z == w - Cx(real_of_num(1)))"))]))
  let t1687 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) / Cx(real_of_num(2)) == (w : Cart[Real, 2])) == (z == Cx(real_of_num(2)) * w)"))]))
  let t1686 = @simp.rewrite_tac(@list.List([]))
  let t1685 = @simp.expand_tac("g")
  let t1684 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_sing(), @complexes.complex_sub_0()]))
  let t1683 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1681 = @tactics.match_mp_tac(@canal.continuous_complex_mul())
  let t1680 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t1679 = @simp.asm_rewrite_tac(@list.List([]))
  let t1678 = @tactics.match_mp_tac(@topology.continuous_at_within())
  let t1677 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1676 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @topology.within_univ()]))
  let t1675 = @simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within()]))
  let t1672 = @drule.match_mp(@canal.holomorphic_on_imp_continuous_on())
  let t1674 = @tactics.first_assum(fn(x1673 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1669 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1670 = @tactics.mp_tac(x1669)
      fn(x1671 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1670(x1671)
      }
    })(t1672(x1673))
  })
  let t1667 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1668 = @tactics.try_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1664 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1665 = @equal.land_conv(x1664)
    fn(x1666 : @kernel.Term) -> @kernel.Thm raise {
      s1665(x1666)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())])), t1667), @tactics.conj_tac))
  let t1663 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const()]))
  let t1662 = @tactics.match_mp_tac(@canal.continuous_on_complex_mul())
  let t1682 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_sub()), @tactics.conj_tac), t1662), @tactics.conj_tac), t1663), t1668), t1674), t1675), t1676), t1677), t1678), t1679), t1680), t1681), @tactics.conj_tac), @canal.continuous_tac), @tactics.all_tac])
  let t1661 = @simp.rewrite_tac(@list.List([@topology.closed_sing()]))
  let t1660 = @tactics.match_mp_tac(@topology.forall_in_closure())
  let t1659 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_sing())]))
  let t1658 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_0())]))
  let t1656 = @meson.asm_meson_tac(@list.List([lemma]))
  let t1654 = @equal.gsym(@vectors.dist())
  let t1655 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt()), t1654, @real.real_lt_01()]))
  let t1653 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1652 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1651 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ(), @sets.in_elim_thm()]))
  let t1650 = @tactics.match_mp_tac(@topology.discrete_imp_countable())
  let t1649 = @tactics.match_mp_tac(@paths.countable_empty_interior())
  let t1648 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == {} → DIFF((t : (_) -> Bool), s) == t")))
  let t1657 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.closure_interior()])), t1648), t1649), t1650), t1651), t1652), t1653), t1655), t1656), @tactics.all_tac])
  let t1647 = @tactics.exists_tac(@term_syntax.parse_term("closure({(z : Cart[Real, 2]) | ∀ n : Real, !(integer(n) && z == Cx(n))})"))
  let t1711 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ s : (_) -> Bool, s == UNIV && (∀ x : _, IN(x, s) → (P : (_) -> Bool)(x)) → (∀ x : _, P(x))"))), t1647), @tactics.conj_tac), t1657), t1658), t1659), t1660), t1661), @tactics.conj_tac), t1682), t1683), t1684), @tactics.disch_tac), t1685), t1686), t1687), t1688), t1690), t1691), t1692), t1693), t1694), t1695), t1696), t1699), t1700), t1703), t1704), t1705), t1709), t1710), @tactics.all_tac])
  let t1646 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], (g : (Cart[Real, 2]) -> Cart[Real, 2])(z / Cx(real_of_num(2))) * g((z + Cx(real_of_num(1))) / Cx(real_of_num(2))) == pow(cgamma(Cx(real_of_num(1) / real_of_num(2))), 2) * g(z)"), fn(x1643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1644 = @tactics.assume_tac(x1643)
    fn(x1645 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1644(x1645)
    }
  })
  let t1639 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_refl()]))
  let t1640 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.complex_differentiable_compose_at()), t1639), @canal.complex_differentiable_tac)
  let t1638 = @meson.asm_meson_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) - (w : Cart[Real, 2]) + w == z"))]))
  let t1641 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_thm()])), t1638), t1640])
  let t1637 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t1636 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1635 = @tactics.exists_tac(@term_syntax.parse_term("o((g : (Cart[Real, 2]) -> Cart[Real, 2]), (z : Cart[Real, 2]) => z - Cx((n : Real)))"))
  let t1634 = @tactics.match_mp_tac(@canal.complex_differentiable_transform_at())
  let t1633 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(n : Real)"))(@tactics.strip_assume_tac))
  let t1632 = @simp.asm_simp_tac(@list.List([]))
  let t1631 = @class.asm_cases_tac(@term_syntax.parse_term("∃ n : Real, integer(n) && (z : Cart[Real, 2]) == Cx(n)"))
  let t1630 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1642 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@canal.holomorphic_on_differentiable(), @topology.within_univ(), @sets.in_univ()])), t1630), t1631), t1632), t1633), t1634), t1635), t1636), t1637), @tactics.conj_tac), t1641), @tactics.all_tac])
  let t1629 = @tactics.subgoal_then(@term_syntax.parse_term("holomorphic_on((g : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV)"), fn(x1626 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1627 = @tactics.assume_tac(x1626)
    fn(x1628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1627(x1628)
    }
  })
  let t1620 = @tactics.conv_tac(@complexes.complex_ring)
  let t1619 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@real.real_lt_01()]))])
  let t1618 = @simp.simp_tac(@list.List([@topology.eventually_at(), @complexes.complex_entire(), @complexes.cx_inj(), @transcendentals.pi_nz(), @equal.gsym(@vectors.dist_nz())]))
  let t1617 = @simp.rewrite_tac(@list.List([@transcendentals.lim_csin_over_x()]))
  let t1616 = @tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(0))"))
  let t1615 = @tactics.match_mp_tac(@topology.lim_compose_at())
  let t1614 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1621 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => csin(Cx(pi) * z) / (Cx(pi) * z)) == o((z : Cart[Real, 2]) => csin(z) / z, (w : Cart[Real, 2]) => Cx(pi) * w)"), fn(x1611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1612 = @tactics.subst1_tac(x1611)
    fn(x1613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1612(x1613)
    }
  }), t1614), t1615), t1616), t1617), t1618), @tactics.conj_tac), t1619), @canal.lim_tac), t1620)
  let t1609 = @simp.rewrite_tac(@list.List([@topology.continuous_at(), @trivia.o_def(), @complexes.complex_sub_rzero(), cgamma_1()]))
  let t1607 = @equal.gsym(@complexes.cx_sub())
  let t1608 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t1607, @complexes.cx_inj()]))
  let t1606 = @tactics.match_mp_tac(continuous_at_cgamma())
  let t1610 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_at_compose()), @tactics.conj_tac), @list.List([@canal.continuous_tac, @tactics.all_tac])), t1606), t1608), @calc_rat.real_arith_tac), t1609])
  let t1622 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("continuous(o(cgamma, (z : Cart[Real, 2]) => Cx(real_of_num(1)) - z), at(Cx(real_of_num(0))))"), fn(x1603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1604 = @tactics.mp_tac(x1603)
    fn(x1605 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1604(x1605)
    }
  }), t1610), t1621])
  let t1602 = @tactics.match_mp_tac(@canal.lim_complex_mul())
  let t1600 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_0()]))
  let t1599 = @simp.rewrite_tac(@list.List([@arith.fact(), @complexes.complex_div_1(), @complexes.complex_pow(), @complexes.complex_add_rid()]))
  let t1601 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("0"), cgamma_simple_poles())), t1599), t1600), @tactics.all_tac])
  let t1598 = @tactics.match_mp_tac(@canal.lim_complex_mul())
  let t1597 = @tactics.match_mp_tac(@canal.lim_complex_lmul())
  let t1623 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1594 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1595 = @equal.land_conv(x1594)
    fn(x1596 : @kernel.Term) -> @kernel.Thm raise {
      s1595(x1596)
    }
  }, @list.List([@complexes.complex_ring(@term_syntax.parse_term("(p : Cart[Real, 2]) == p * (Cx(real_of_num(1)) * (Cx(real_of_num(1)) * Cx(real_of_num(1))))"))])), t1597), t1598), @tactics.conj_tac), t1601), t1602), @tactics.conj_tac), t1622)
  let t1591 = @tactics.conv_tac(@complexes.complex_field)
  let t1590 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj())]))
  let t1589 = @tactics.mp_tac(@transcendentals.pi_nz())
  let t1592 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((w : Cart[Real, 2]) == Cx(real_of_num(0)))")), t1589), t1590), t1591)
  let t1588 = @meson.meson_tac(@list.List([@floor.integer_closed()]))
  let t1587 = @simp.asm_rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_rzero()]))
  let t1586 = @tactics.match_mp_tac(lemma)
  let t1585 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) → !p → (q : Bool)")))
  let t1593 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((w : Cart[Real, 2]) == Cx(real_of_num(0)))")), t1585), t1586), t1587), t1588), t1592])
  let t1584 = @simp.rewrite_tac(@list.List([@canal.complex_in_ball_0()]))
  let t1624 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), t1584), @tactics.strip_tac), @class.cond_cases_tac), t1593), t1623])
  let t1583 = @simp.rewrite_tac(@list.List([@topology.open_ball(), @topology.centre_in_ball(), @real.real_lt_01()]))
  let t1582 = @tactics.exists_tac(@term_syntax.parse_term("ball((Cx(real_of_num(0)), real_of_num(1)))"))
  let t1581 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => Cx(pi) * (z * cgamma(z) * (cgamma(Cx(real_of_num(1)) - z) * (csin(Cx(pi) * z) / (Cx(pi) * z))))"))
  let t1580 = @tactics.match_mp_tac(@topology.lim_transform_within_open())
  let t1579 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@floor.integer_closed()]), @term_syntax.parse_term("∃ n : Real, integer(n) && Cx(real_of_num(0)) == Cx(n)"))]))
  let t1578 = @simp.expand_tac("g")
  let t1577 = @simp.rewrite_tac(@list.List([@topology.continuous_at()]))
  let t1576 = @tactics.first_x_assum(fn(x1573 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1574 = @tactics.subst_all_tac(x1573)
    fn(x1575 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1574(x1575)
    }
  })
  let t1571 = @meson.meson_tac(@list.List([@floor.integer_closed()]))
  let t1570 = @simp.asm_rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_rzero()]))
  let t1569 = @tactics.match_mp_tac(lemma)
  let t1568 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t1567 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t1566 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1572 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.complex_differentiable_imp_continuous_at()), t1566), t1567), t1568), @tactics.disch_tac), t1569), t1570), t1571)])
  let t1565 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t1564 = @tactics.match_mp_tac(@topology.continuous_at_within())
  let t1563 = @simp.rewrite_tac(@list.List([@canal.complex_in_ball_0()]))
  let t1562 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1561 = @simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within()]))
  let t1559 = @meson.meson_tac(@list.List([@floor.integer_closed()]))
  let t1558 = @simp.asm_rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_rzero()]))
  let t1557 = @tactics.match_mp_tac(lemma)
  let t1556 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t1555 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t1554 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1553 = @tactics.match_mp_tac(@canal.complex_differentiable_at_within())
  let t1552 = @simp.rewrite_tac(@list.List([@canal.complex_in_ball_0()]))
  let t1551 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1560 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@canal.holomorphic_on_differentiable(), @sets.in_diff(), @sets.in_sing()])), t1551), t1552), @tactics.strip_tac), t1553), t1554), t1555), t1556), @tactics.disch_tac), t1557), t1558), t1559)])
  let t1550 = @simp.rewrite_tac(@list.List([@topology.open_ball(), @sets.finite_sing()]))
  let t1549 = @tactics.exists_tac(@term_syntax.parse_term("{Cx(real_of_num(0))}"))
  let t1548 = @tactics.match_mp_tac(@cauchy.no_isolated_singularity())
  let t1547 = @simp.rewrite_tac(@list.List([@topology.open_ball(), @topology.centre_in_ball(), @real.real_lt_01()]))
  let t1546 = @tactics.exists_tac(@term_syntax.parse_term("ball((Cx(real_of_num(0)), real_of_num(1)))"))
  let t1625 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.holomorphic_on_imp_differentiable_at()), t1546), t1547), t1548), t1549), t1550), @tactics.conj_tac), t1560), t1561), t1562), t1563), @tactics.disch_tac), t1564), t1565), t1572), t1576), t1577), t1578), t1579), t1580), t1581), t1582), t1583), @tactics.conj_tac), t1624), @tactics.all_tac])
  let t1545 = @tactics.subgoal_then(@term_syntax.parse_term("complex_differentiable((g : (Cart[Real, 2]) -> Cart[Real, 2]), at(Cx(real_of_num(0))))"), fn(x1542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1543 = @tactics.assume_tac(x1542)
    fn(x1544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1543(x1544)
    }
  })
  let t1540 = @meson.asm_meson_tac(@list.List([@floor.integer_closed()]))
  let t1538 = @equal.gsym(@complexes.cx_sub())
  let t1539 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t1538]))
  let t1536 = @complexes.complex_ring(@term_syntax.parse_term("(Cx(real_of_num(1)) - (z : Cart[Real, 2]) == (a : Cart[Real, 2]) - (b : Cart[Real, 2])) == (z == b - a + Cx(real_of_num(1)))"))
  let t1537 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) + (a : Cart[Real, 2]) == (b : Cart[Real, 2])) == (z == b - a)")), t1536]))
  let t1535 = @tactics.orelse_tac(@tactics.match_mp_tac(complex_differentiable_at_cgamma()), @canal.complex_differentiable_tac)
  let t1533 = @tactics.match_mp_tac(@canal.complex_differentiable_compose_at())
  let t1534 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1530 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1531 = @equal.land_conv(x1530)
    fn(x1532 : @kernel.Term) -> @kernel.Thm raise {
      s1531(x1532)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())])), t1533), @tactics.conj_tac), @tactics.all_tac])
  let t1529 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.complex_differentiable_mul_at()), @tactics.conj_tac))
  let t1528 = @simp.asm_simp_tac(@list.List([]))
  let t1527 = @simp.rewrite_tac(@list.List([]))
  let t1526 = @simp.expand_tac("g")
  let t1525 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t1524 = @simp.asm_rewrite_tac(@list.List([]))
  let t1523 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1522 = @simp.rewrite_tac(@list.List([@sets.subset(), @topology.in_ball(), @sets.in_diff(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t1521 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1520 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1516 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1519 = @tactics.disch_then(fn(x1518 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1513 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1514 = @tactics.mp_tac(x1513)
      fn(x1515 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1514(x1515)
      }
    })(((x1517 : @kernel.Thm) => @bool.spec(t1516, x1517))(x1518))
  })
  let t1511 = @simp.rewrite_tac(@list.List([@topology.closed(), @topology.open_contains_ball(), @sets.in_univ(), @sets.in_diff()]))
  let t1510 = @meson.meson_tac(@list.List([lemma, @vectors.dist()]))
  let t1509 = @simp.rewrite_tac(@list.List([@real.real_lt_01(), @sets.in_elim_thm()]))
  let t1508 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t1512 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.discrete_imp_closed()), t1508), t1509), t1510), t1511])
  let t1507 = @tactics.subgoal_then(@term_syntax.parse_term("closed({(z : Cart[Real, 2]) | ∃ n : Real, integer(n) && z == Cx(n)})"), fn(x1504 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1505 = @tactics.mp_tac(x1504)
    fn(x1506 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1505(x1506)
    }
  })
  let t1503 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => cgamma(z) * (cgamma(Cx(real_of_num(1)) - z) * csin(Cx(pi) * z))"))
  let t1502 = @tactics.match_mp_tac(@canal.complex_differentiable_transform_at())
  let t1541 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1502), t1503), t1507), t1512), t1519), t1520), t1521), t1522), t1523), @tactics.strip_tac), t1524), t1525), t1526), t1527), t1528), t1529), t1534), t1535), t1537), t1539), t1540), @tactics.all_tac])
  let t1501 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], !(∃ n : Real, integer(n) && z == Cx(n)) → complex_differentiable((g : (Cart[Real, 2]) -> Cart[Real, 2]), at(z))"), fn(x1498 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1499 = @tactics.assume_tac(x1498)
    fn(x1500 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1499(x1500)
    }
  })
  let t1494 = @meson.asm_meson_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) - (w : Cart[Real, 2]) + w == z"))]))
  let t1493 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_neg(), @equal.gsym(@complexes.complex_sub())]))
  let t1489 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) == (a : Real) → x == a || x == -a")))
  let t1490 = @tactics.disj_cases_then(fn(x1486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1487 = @tactics.subst1_tac(x1486)
    fn(x1488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1487(x1488)
    }
  })
  let t1492 = @tactics.first_x_assum(fn(x1491 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t1490(t1489(x1491))
  })
  let t1485 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1495 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.integer()])), t1485), t1492), t1493), t1494)
  let t1484 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_add(), @complexes.complex_add_assoc()]))
  let t1496 = @list.List([@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), @complexes.complex_add_rid()]))), t1484), t1495])
  let t1497 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ z : Cart[Real, 2], (g : (Cart[Real, 2]) -> Cart[Real, 2])(z + Cx(real_of_num(n))) == g(z)"), fn(x1481 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1482 = @tactics.assume_tac(x1481)
    fn(x1483 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1482(x1483)
    }
  }), t1496), @tactics.all_tac])
  let t1480 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Real, ∀ z : Cart[Real, 2], integer(n) → (g : (Cart[Real, 2]) -> Cart[Real, 2])(z + Cx(n)) == g(z)"), fn(x1477 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1478 = @tactics.assume_tac(x1477)
    fn(x1479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1478(x1479)
    }
  })
  let t1473 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_ac()]))
  let t1472 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid(), @complexes.complex_neg_neg()]))
  let t1471 = @simp.rewrite_tac(@list.List([@complexes.complex_add_rid(), @complexes.complex_mul_lneg(), @complexes.complex_mul_rneg()]))
  let t1470 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_neg(), @complexes.complex_mul_ac(), @complexes.cx_neg(), @complexes.complex_mul_lid(), @complexes.complex_mul_lzero()]))
  let t1469 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(z : Cart[Real, 2]) + Cx(real_of_num(1)) == Cx(real_of_num(1)) - z"))]))
  let t1467 = @equal.gsym(@transcendentals.cx_cos())
  let t1468 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cx_sin()), t1467, @transcendentals.sin_pi(), @transcendentals.cos_pi()]))
  let t1466 = @simp.rewrite_tac(@list.List([@complexes.complex_add_ldistrib(), @complexes.complex_mul_rid(), @transcendentals.csin_add()]))
  let t1465 = @simp.gen_rewrite_tac(fn(x1464 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1460 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1454 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1455 = @equal.land_conv(x1454)
        fn(x1456 : @kernel.Term) -> @kernel.Thm raise {
          s1455(x1456)
        }
      })((fn(x1457 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1458 = @equal.rand_conv(x1457)
        fn(x1459 : @kernel.Term) -> @kernel.Thm raise {
          s1458(x1459)
        }
      })(x1460))
    })((fn(x1461 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1462 = @equal.land_conv(x1461)
      fn(x1463 : @kernel.Term) -> @kernel.Thm raise {
        s1462(x1463)
      }
    })(x1464))
  }, @list.List([cgamma_recurrence_alt()]))
  let t1453 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) - ((z : Cart[Real, 2]) + a) == -z"))]))
  let t1474 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1452 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1446 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1447 = @equal.rand_conv(x1446)
      fn(x1448 : @kernel.Term) -> @kernel.Thm raise {
        s1447(x1448)
      }
    })((fn(x1449 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1450 = @equal.land_conv(x1449)
      fn(x1451 : @kernel.Term) -> @kernel.Thm raise {
        s1450(x1451)
      }
    })(x1452))
  }, @list.List([cgamma_recurrence_alt()])), t1453), t1465), t1466), t1468), t1469), t1470), t1471), t1472), t1473)
  let t1445 = @meson.meson_tac(@list.List([@floor.integer_closed(), @calc_rat.real_arith(@term_syntax.parse_term("(n : Real) + real_of_num(1) - real_of_num(1) == n"))]))
  let t1475 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub())])), t1445), t1474])
  let t1444 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) + Cx(real_of_num(1)) == (w : Cart[Real, 2])) == (z == w - Cx(real_of_num(1)))"))]))
  let t1443 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(p : Bool) == (p' : Bool) && (a : _) == (a' : _) && (b : _) == (b' : _) → (if p { a } else { b }) == (if p' { a' } else { b' })")))
  let t1476 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.expand_tac("g")), t1443), t1444), @tactics.conj_tac), t1475), @tactics.all_tac])
  let t1442 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], (g : (Cart[Real, 2]) -> Cart[Real, 2])(z + Cx(real_of_num(1))) == g(z)"), fn(x1439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1440 = @tactics.assume_tac(x1439)
    fn(x1441 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1440(x1441)
    }
  })
  let t1974 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.abbrev_tac(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2]) == ((z : Cart[Real, 2]) => if (∃ n : Real, integer(n) && z == Cx(n)) { Cx(pi) } else { cgamma(z) * (cgamma(Cx(real_of_num(1)) - z) * csin(Cx(pi) * z)) })")), t1442), t1476), t1480), t1497), t1501), t1541), t1545), t1625), t1629), t1642), t1646), t1711), t1715), t1731), t1733), t1734), t1735), @tactics.disch_tac), t1739), t1761), t1764), t1765), @tactics.disch_tac), t1767), t1768), t1769), @tactics.disch_tac), t1773), t1782), t1785), t1786), @tactics.disch_tac), t1790), t1826), t1828), t1829), @tactics.ants_tac), t1830), t1833), t1835), t1836), @tactics.ants_tac), t1843), t1851), t1852), t1855), t1856), t1857), t1858), t1859), t1860), t1864), t1865), t1866), t1867), t1973)
  cgamma_reflection_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], cgamma(z) * cgamma(Cx(real_of_num(1)) - z) == Cx(pi) / csin(Cx(pi) * z)"), t1974))
}

///|
let cgamma_reflection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_REFLECTION")

///|
/// `CGAMMA_REFLECTION`
pub fn cgamma_reflection() -> @kernel.Thm {
  cgamma_reflection_c.get()
}

///|
/// CGAMMA_HALF
fn step_28() -> Unit raise {
  let t1993 = @simp.rewrite_tac(@list.List([@transcendentals.pi_pos()]))
  let t1992 = @tactics.match_mp_tac(@real.sqrt_pos_lt())
  let t1991 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(0) <= -(x : Real)) == (real_of_num(0) < x)"))]))
  let t1990 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t1989 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1988 = @simp.asm_rewrite_tac(@list.List([@complexes.real_cx(), @complexes.re_cx(), @complexes.re_neg()]))
  let t1987 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(1) / real_of_num(2))"), re_pos_cgamma_real()))
  let t1986 = @simp.asm_rewrite_tac(@list.List([]))
  let t1994 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((a : Cart[Real, 2]) * a == pow((b : Cart[Real, 2]), 2)) == (a == b || a == -b)"))])), @tactics.strip_tac), t1986), t1987), t1988), t1989), t1990), t1991), t1992), t1993)
  let t1985 = @simp.rewrite_tac(@list.List([@real.sqrt_pow2(), @transcendentals.pi_pos_le()]))
  let t1984 = @tactics.conv_tac(@equal.sym_conv)
  let t1995 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_pow())])), @tactics.ap_term_tac), t1984), t1985), t1994])
  let t1983 = @tactics.subgoal_then(@term_syntax.parse_term("Cx(pi) == pow(Cx(sqrt(pi)), 2)"), fn(x1980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1981 = @tactics.subst1_tac(x1980)
    fn(x1982 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1981(x1982)
    }
  })
  let t1979 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (real_of_num(1) / real_of_num(2)) == x / real_of_num(2)")), @transcendentals.sin_pi2(), @real.real_div_1()]))
  let t1976 = @equal.gsym(@transcendentals.cx_sin())
  let t1977 = @equal.gsym(@complexes.cx_mul())
  let t1978 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_div()), t1977, t1976]))
  let t1975 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(1)) - Cx(real_of_num(1)) / Cx(real_of_num(2)) == Cx(real_of_num(1)) / Cx(real_of_num(2))"))]))
  let t1996 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(1)) / Cx(real_of_num(2))"), cgamma_reflection())), t1975), t1978), t1979), t1983), t1995)
  cgamma_half_c.set(@tactics.prove(@term_syntax.parse_term("cgamma(Cx(real_of_num(1)) / Cx(real_of_num(2))) == Cx(sqrt(pi))"), t1996))
}

///|
let cgamma_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_HALF")

///|
/// `CGAMMA_HALF`
pub fn cgamma_half() -> @kernel.Thm {
  cgamma_half_c.get()
}

///|
/// CGAMMA_LEGENDRE
fn step_29() -> Unit raise {
  let t1997 = @simp.rewrite_tac(@list.List([cgamma_legendre_alt(), cgamma_half()]))
  cgamma_legendre_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], cgamma(z) * cgamma(z + Cx(real_of_num(1)) / Cx(real_of_num(2))) == cpow(Cx(real_of_num(2)), Cx(real_of_num(1)) - Cx(real_of_num(2)) * z) * (Cx(sqrt(pi)) * cgamma(Cx(real_of_num(2)) * z))"), t1997))
}

///|
let cgamma_legendre_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_LEGENDRE")

///|
/// `CGAMMA_LEGENDRE`
pub fn cgamma_legendre() -> @kernel.Thm {
  cgamma_legendre_c.get()
}

///|
/// CGAMMA_WEIERSTRASS
fn step_30() -> Unit raise {
  let t2058 = @simp.rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @nums.not_suc()]))
  let t2057 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("!((p : Cart[Real, 2]) == Cx(real_of_num(0))) → p * (Cx(real_of_num(1)) + (z : Cart[Real, 2]) * inv(p)) == z + p")))
  let t2056 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(d : Cart[Real, 2]) * (e : Cart[Real, 2]) == (c : Cart[Real, 2]) → (a : Cart[Real, 2]) * (b : Cart[Real, 2]) * c == d * a * (b * e)")))
  let t2055 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_mul(), @equal.gsym(@realax.real_of_num_mul())]))
  let t2054 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")), @complexes.complex_mul_lid()]))
  let t2053 = @simp.rewrite_tac(@list.List([@arith.fact(), @complexes.cproduct_clauses_numseg(), @calc_num.arith()]))
  let t2051 = @term_syntax.parse_term("(p : Num)")
  let t2052 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t2051)
  let t2050 = @tactics.conv_tac(@equal.sym_conv)
  let t2049 = @simp.rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @arith.fact_nz()]))
  let t2048 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0))) && z * (x : Cart[Real, 2]) == (y : Cart[Real, 2]) → inv(z) * y == x")))
  let t2047 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_inv_mul())]))
  let t2046 = @simp.gen_rewrite_tac(fn(x2045 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2039 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2040 = @equal.land_conv(x2039)
      fn(x2041 : @kernel.Term) -> @kernel.Thm raise {
        s2040(x2041)
      }
    })((fn(x2042 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2043 = @equal.land_conv(x2042)
      fn(x2044 : @kernel.Term) -> @kernel.Thm raise {
        s2043(x2044)
      }
    })(x2045))
  }, @list.List([@equal.gsym(@complexes.complex_inv_inv())]))
  let t2038 = @simp.simp_tac(@list.List([@complexes.cproduct_inv(), @iterate.finite_numseg()]))
  let t2037 = @simp.gen_rewrite_tac(fn(x2034 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2035 = @equal.land_conv(x2034)
    fn(x2036 : @kernel.Term) -> @kernel.Thm raise {
      s2035(x2036)
    }
  }, @list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * (c : Cart[Real, 2])) == b * (a * c)"))]))
  let t2033 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_mul(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t2032 = @simp.rewrite_tac(@list.List([@complexes.complex_add_rid(), @arith.add_clauses()]))
  let t2031 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses_left(), @arith.le_0()]))
  let t2030 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2029 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t2028 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t2027 = @simp.rewrite_tac(@list.List([cgamma_v1()]))
  let t2026 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => cpow(Cx(real_of_num(n)), (z : Cart[Real, 2])) * Cx(real_of_num(FACT(n))) / cproduct(op_dot_dot(0, n), (m : Num) => z + Cx(real_of_num(m)))"))
  let t2059 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.lim_transform_eventually()), t2026), t2027), t2028), t2029), t2030), @tactics.disch_tac), t2031), t2032), t2033), @tactics.ap_term_tac), t2037), @tactics.ap_term_tac), t2038), t2046), t2047), @tactics.ap_term_tac), t2048), t2049), t2050), t2052), @nums.induct_tac), t2053), t2054), t2055), t2056), t2057), t2058)
  let t2025 = @simp.rewrite_tac(@list.List([euler_mascheroni_v1()]))
  let t2022 = @equal.gsym(@realanalysis.reallim_complex())
  let t2023 = @simp.rewrite_rule(@list.List([@trivia.o_def()]))(t2022)
  let t2024 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub()), t2023]))
  let t2021 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inv()), @complexes.vsum_cx()]))
  let t2020 = @simp.rewrite_tac(@list.List([@equal.gsym(@canal.lim_null_complex())]))
  let t2019 = @tactics.match_mp_tac(@canal.lim_null_complex_lmul())
  let t2018 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(w : Cart[Real, 2]) * (z : Cart[Real, 2]) + (z * (x : Cart[Real, 2]) + -(y : Cart[Real, 2]) * z) == z * (x - y - w)"))]))
  let t2017 = @simp.simp_tac(@list.List([@transcendentals.continuous_at_cexp(), @complexes.vsum_complex_lmul(), @iterate.finite_numseg()]))
  let t2016 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("cexp"), @topology.lim_continuous_function()))
  let t2015 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cexp_0())]))
  let t2014 = @equal.gsym(@transcendentals.cexp_add())
  let t2060 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@transcendentals.cexp_vsum()), @iterate.finite_numseg(), t2014])), t2015), t2016), t2017), t2018), t2019), t2020), t2021), t2024), t2025), t2059])
  let t2013 = @tactics.match_mp_tac(@canal.lim_complex_mul())
  let t2012 = @simp.gen_rewrite_tac(fn(x2009 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2010 = @equal.land_conv(x2009)
    fn(x2011 : @kernel.Term) -> @kernel.Thm raise {
      s2010(x2011)
    }
  }, @list.List([@equal.gsym(@complexes.complex_mul_lid())]))
  let t2007 = @tactics.conv_tac(@complexes.complex_ring)
  let t2006 = @simp.asm_simp_tac(@list.List([@transcendentals.cx_log(), @real.real_of_num_lt(), @arith.le_1()]))
  let t2005 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cexp_0())]))
  let t2004 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1(), @equal.gsym(@transcendentals.cexp_add())]))
  let t2003 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(c : Cart[Real, 2]) * (c' : Cart[Real, 2]) == Cx(real_of_num(1)) → (a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * c) * (c' * (d : Cart[Real, 2]) * (e : Cart[Real, 2])) == a * d * (b * e)")))
  let t2002 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t2001 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2008 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t2001), t2002), t2003), t2004), t2005), @tactics.ap_term_tac), t2006), t2007), @tactics.all_tac])
  let t2000 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1999 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => cexp(-Cx(euler_mascheroni) * (z : Cart[Real, 2])) * (cproduct(op_dot_dot(1, n), (k : Num) => cexp(z * inv(Cx(real_of_num(k))))) * cexp(-Cx(log(real_of_num(n))) * z)) * (cpow(Cx(real_of_num(n)), z) / z * cproduct(op_dot_dot(1, n), (k : Num) => inv(Cx(real_of_num(1)) + z * inv(Cx(real_of_num(k))))))"))
  let t1998 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t2061 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.simp_tac(@list.List([@complexes.complex_div(), @complexes.cproduct_mul(), @iterate.finite_numseg()]))), t1998), t1999), t2000), @tactics.conj_tac), t2008), t2012), t2013), @tactics.conj_tac), t2060)
  cgamma_weierstrass_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], op_minus_minus_gt((n : Num) => cexp(-Cx(euler_mascheroni) * z) / z * cproduct(op_dot_dot(1, n), (k : Num) => cexp(z / Cx(real_of_num(k))) / (Cx(real_of_num(1)) + z / Cx(real_of_num(k)))), cgamma(z), sequentially)"), t2061))
}

///|
let cgamma_weierstrass_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CGAMMA_WEIERSTRASS")

///|
/// `CGAMMA_WEIERSTRASS`
pub fn cgamma_weierstrass() -> @kernel.Thm {
  cgamma_weierstrass_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_AT_RECIP_CGAMMA
fn step_31() -> Unit raise {
  let t2091 = @tactics.conv_tac(@complexes.complex_ring)
  let t2090 = @simp.rewrite_tac(@list.List([cgamma_simple_poles()]))
  let t2089 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t2088 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq(), @arith.fact_nz()]))
  let t2087 = @simp.rewrite_tac(@list.List([@complexes.complex_div_eq_0(), @complexes.complex_pow_eq_0(), @complexes.cx_inj()]))
  let t2086 = @tactics.match_mp_tac(@canal.lim_complex_inv())
  let t2085 = @tactics.exists_tac(@term_syntax.parse_term("inv(pow(-Cx(real_of_num(1)), (n : Num)) / Cx(real_of_num(FACT(n))))"))
  let t2083 = @complexes.complex_ring(@term_syntax.parse_term("(x : Cart[Real, 2]) - -(z : Cart[Real, 2]) == x + z"))
  let t2084 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.complex_inv_mul()), t2083]))
  let t2082 = @simp.rewrite_tac(@list.List([@trivia.o_def(), cgamma_poles(), @complexes.complex_inv_0(), @complexes.complex_div(), @complexes.complex_mul_lzero(), @complexes.complex_sub_rzero()]))
  let t2081 = @simp.rewrite_tac(@list.List([@canal.complex_differentiable(), @canal.has_complex_derivative_at()]))
  let t2080 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x2077 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2078 = @tactics.subst1_tac(x2077)
    fn(x2079 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2078(x2079)
    }
  }))
  let t2076 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((z : Cart[Real, 2]) + (w : Cart[Real, 2]) == Cx(real_of_num(0))) == (z == -w)"))]))
  let t2074 = @simp.gen_rewrite_rule(fn(x2073 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2073
  }, @list.List([@class.not_forall_thm()]))
  let t2092 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2075 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2070 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2071 = @tactics.mp_tac(x2070)
      fn(x2072 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2071(x2072)
      }
    })(t2074(x2075))
  }), t2076), t2080), t2081), t2082), t2084), t2085), t2086), t2087), t2088), t2089), t2090), t2091)
  let t2069 = @meson.asm_meson_tac(@list.List([]))
  let t2068 = @simp.rewrite_tac(@list.List([@canal.complex_differentiable_id(), cgamma_eq_0()]))
  let t2067 = @tactics.match_mp_tac(@canal.complex_differentiable_inv_at())
  let t2066 = @simp.gen_rewrite_tac(fn(x2063 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2064 = @equal.land_conv(x2063)
    fn(x2065 : @kernel.Term) -> @kernel.Thm raise {
      s2064(x2065)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t2062 = @simp.asm_simp_tac(@list.List([complex_differentiable_at_cgamma()]))
  let t2093 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.complex_differentiable_compose_at()), t2062), t2066), t2067), t2068), t2069), t2092])
  let t2094 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("∀ n : Num, !((z : Cart[Real, 2]) + Cx(real_of_num(n)) == Cx(real_of_num(0)))"))), t2093)
  complex_differentiable_at_recip_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], complex_differentiable(o(inv, cgamma), at(z))"), t2094))
}

///|
let complex_differentiable_at_recip_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_AT_RECIP_CGAMMA")

///|
/// `COMPLEX_DIFFERENTIABLE_AT_RECIP_CGAMMA`
pub fn complex_differentiable_at_recip_cgamma() -> @kernel.Thm {
  complex_differentiable_at_recip_cgamma_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_WITHIN_RECIP_CGAMMA
fn step_32() -> Unit raise {
  let t2095 = @simp.simp_tac(@list.List([@canal.complex_differentiable_at_within(), complex_differentiable_at_recip_cgamma()]))
  complex_differentiable_within_recip_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, complex_differentiable(o(inv, cgamma), within(at(z), s))"), t2095))
}

///|
let complex_differentiable_within_recip_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_WITHIN_RECIP_CGAMMA")

///|
/// `COMPLEX_DIFFERENTIABLE_WITHIN_RECIP_CGAMMA`
pub fn complex_differentiable_within_recip_cgamma() -> @kernel.Thm {
  complex_differentiable_within_recip_cgamma_c.get()
}

///|
/// HOLOMORPHIC_ON_RECIP_CGAMMA
fn step_33() -> Unit raise {
  let t2096 = @simp.rewrite_tac(@list.List([complex_differentiable_within_recip_cgamma()]))
  let t2097 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@canal.holomorphic_on_differentiable()])), t2096)
  holomorphic_on_recip_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(o(inv, cgamma), s)"), t2097))
}

///|
let holomorphic_on_recip_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_RECIP_CGAMMA")

///|
/// `HOLOMORPHIC_ON_RECIP_CGAMMA`
pub fn holomorphic_on_recip_cgamma() -> @kernel.Thm {
  holomorphic_on_recip_cgamma_c.get()
}

///|
/// CONTINUOUS_AT_RECIP_CGAMMA
fn step_34() -> Unit raise {
  let t2098 = @simp.simp_tac(@list.List([@canal.complex_differentiable_imp_continuous_at(), complex_differentiable_at_recip_cgamma()]))
  continuous_at_recip_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], continuous(o(inv, cgamma), at(z))"), t2098))
}

///|
let continuous_at_recip_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_RECIP_CGAMMA")

///|
/// `CONTINUOUS_AT_RECIP_CGAMMA`
pub fn continuous_at_recip_cgamma() -> @kernel.Thm {
  continuous_at_recip_cgamma_c.get()
}

///|
/// CONTINUOUS_WITHIN_RECIP_CGAMMA
fn step_35() -> Unit raise {
  let t2099 = @simp.simp_tac(@list.List([@canal.complex_differentiable_imp_continuous_within(), complex_differentiable_within_recip_cgamma()]))
  continuous_within_recip_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, continuous(o(inv, cgamma), within(at(z), s))"), t2099))
}

///|
let continuous_within_recip_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_WITHIN_RECIP_CGAMMA")

///|
/// `CONTINUOUS_WITHIN_RECIP_CGAMMA`
pub fn continuous_within_recip_cgamma() -> @kernel.Thm {
  continuous_within_recip_cgamma_c.get()
}

///|
/// CONTINUOUS_ON_RECIP_CGAMMA
fn step_36() -> Unit raise {
  let t2100 = @simp.simp_tac(@list.List([@canal.holomorphic_on_imp_continuous_on(), holomorphic_on_recip_cgamma()]))
  continuous_on_recip_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, continuous_on(o(inv, cgamma), s)"), t2100))
}

///|
let continuous_on_recip_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_RECIP_CGAMMA")

///|
/// `CONTINUOUS_ON_RECIP_CGAMMA`
pub fn continuous_on_recip_cgamma() -> @kernel.Thm {
  continuous_on_recip_cgamma_c.get()
}

///|
/// RECIP_CGAMMA
fn step_37() -> Unit raise {
  let t2112 = @meson.asm_meson_tac(@list.List([]))
  let t2111 = @simp.simp_tac(@list.List([@complexes.cproduct_eq_0(), @iterate.in_numseg(), @iterate.finite_numseg(), @arith.le_0()]))
  let t2110 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially(), @complexes.complex_div_eq_0(), @complexes.complex_entire()]))
  let t2109 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t2107 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_0()]))
  let t2108 = @list.List([@meson.asm_meson_tac(@list.List([cgamma_eq_0()])), t2107])
  let t2113 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("cgamma((z : Cart[Real, 2])) == Cx(real_of_num(0))"), fn(x2104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2105 = @tactics.subst1_tac(x2104)
    fn(x2106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2105(x2106)
    }
  }), t2108), t2109), t2110), t2111), t2112)
  let t2103 = @meson.asm_meson_tac(@list.List([]))
  let t2102 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_inv(), cgamma_v1(), @complexes.complex_inv_div(), cgamma_eq_0()]))
  let t2101 = @tactics.match_mp_tac(@canal.lim_complex_inv())
  let t2114 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_inv_inv())])), t2101), t2102), t2103), t2113])
  let t2115 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("∀ n : Num, !((z : Cart[Real, 2]) + Cx(real_of_num(n)) == Cx(real_of_num(0)))"))), t2114)
  recip_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], op_minus_minus_gt((n : Num) => cproduct(op_dot_dot(0, n), (m : Num) => z + Cx(real_of_num(m))) / (cpow(Cx(real_of_num(n)), z) * Cx(real_of_num(FACT(n)))), inv(cgamma(z)), sequentially)"), t2115))
}

///|
let recip_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RECIP_CGAMMA")

///|
/// `RECIP_CGAMMA`
pub fn recip_cgamma() -> @kernel.Thm {
  recip_cgamma_c.get()
}

///|
/// RECIP_CGAMMA_WEIERSTRASS
fn step_38() -> Unit raise {
  let t2155 = @simp.rewrite_tac(@list.List([cgamma_weierstrass()]))
  let t2154 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("inv((z : Cart[Real, 2])) * ((a : Cart[Real, 2]) * (b : Cart[Real, 2])) == a / z * b"))]))
  let t2151 = @equal.gsym(@complexes.complex_mul_lneg())
  let t2152 = @equal.gsym(@complexes.cproduct_inv())
  let t2153 = @simp.simp_tac(@list.List([@complexes.complex_inv_mul(), @equal.gsym(@transcendentals.cexp_neg()), t2152, @iterate.finite_numseg(), t2151, @complexes.complex_inv_div()]))
  let t2150 = @simp.asm_rewrite_tac(@list.List([cgamma_eq_0()]))
  let t2149 = @tactics.match_mp_tac(@canal.lim_complex_inv())
  let t2156 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2148 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2144 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2138 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2139 = @equal.rator_conv(x2138)
        fn(x2140 : @kernel.Term) -> @kernel.Thm raise {
          s2139(x2140)
        }
      })((fn(x2141 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2142 = @equal.land_conv(x2141)
        fn(x2143 : @kernel.Term) -> @kernel.Thm raise {
          s2142(x2143)
        }
      })(x2144))
    })((fn(x2145 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2146 = @equal.abs_conv(x2145)
      fn(x2147 : @kernel.Term) -> @kernel.Thm raise {
        s2146(x2147)
      }
    })(x2148))
  }, @list.List([@equal.gsym(@complexes.complex_inv_inv())])), t2149), t2150), t2153), t2154), t2155)
  let t2137 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t2136 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("(x : Cart[Real, 2]) + (n : Cart[Real, 2]) == Cx(real_of_num(0)) && !(n == Cx(real_of_num(0))) → Cx(real_of_num(1)) + x / n == Cx(real_of_num(0))")))
  let t2135 = @simp.asm_simp_tac(@list.List([@arith.le_1(), @complexes.complex_div_eq_0()]))
  let t2134 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num)"))
  let t2133 = @simp.simp_tac(@list.List([@complexes.cproduct_eq_0(), @iterate.finite_numseg(), @iterate.in_numseg()]))
  let t2132 = @tactics.repeat_tac(@tactics.disj2_tac)
  let t2131 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_add_rid()])), @tactics.all_tac])
  let t2130 = @class.asm_cases_tac(@term_syntax.parse_term("(N : Num) == 0"))
  let t2129 = @simp.rewrite_tac(@list.List([@complexes.complex_entire(), @complexes.complex_div_eq_0()]))
  let t2127 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_0()]))
  let t2128 = @list.List([@meson.asm_meson_tac(@list.List([cgamma_eq_0()])), t2127])
  let t2126 = @tactics.subgoal_then(@term_syntax.parse_term("cgamma((z : Cart[Real, 2])) == Cx(real_of_num(0))"), fn(x2123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2124 = @tactics.subst1_tac(x2123)
    fn(x2125 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2124(x2125)
    }
  })
  let t2122 = @simp.rewrite_tac(@list.List([@arith.ge()]))
  let t2121 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2120 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num)"))
  let t2119 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t2118 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t2116 = @term_syntax.parse_term("(N : Num)")
  let t2157 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum((x2117 : @kernel.Thm) => @tactics.x_choose_tac(t2116, x2117)), t2118), t2119), t2120), t2121), t2122), @tactics.disch_tac), t2126), t2128), t2129), t2130), t2131), t2132), t2133), t2134), t2135), @tactics.disj1_tac), t2136), t2137), t2156])
  let t2158 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("∃ n : Num, (z : Cart[Real, 2]) + Cx(real_of_num(n)) == Cx(real_of_num(0))"))), t2157)
  recip_cgamma_weierstrass_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : _, op_minus_minus_gt((n : Num) => (z : Cart[Real, 2]) * (cexp(Cx(euler_mascheroni) * z) * cproduct(op_dot_dot(1, n), (k : Num) => (Cx(real_of_num(1)) + z / Cx(real_of_num(k))) / cexp(z / Cx(real_of_num(k))))), inv(cgamma(z)), sequentially)"), t2158))
}

///|
let recip_cgamma_weierstrass_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RECIP_CGAMMA_WEIERSTRASS")

///|
/// `RECIP_CGAMMA_WEIERSTRASS`
pub fn recip_cgamma_weierstrass() -> @kernel.Thm {
  recip_cgamma_weierstrass_c.get()
}

///|
/// gamma
fn step_39() -> Unit raise {
  gamma_c.set(@pair.new_definition(@term_syntax.parse_term("(gamma : (Real) -> Real)((x : Real)) == Re(cgamma(Cx(x)))")))
}

///|
let gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gamma")

///|
/// `gamma`
pub fn gamma() -> @kernel.Thm {
  gamma_c.get()
}

///|
/// CX_GAMMA
fn step_40() -> Unit raise {
  let t2159 = @meson.meson_tac(@list.List([@complexes.real_v1(), @complexes.real_cx(), real_gamma()]))
  let t2160 = @tactics.then_tac(@simp.rewrite_tac(@list.List([gamma()])), t2159)
  cx_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, Cx(gamma(x)) == cgamma(Cx(x))"), t2160))
}

///|
let cx_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_GAMMA")

///|
/// `CX_GAMMA`
pub fn cx_gamma() -> @kernel.Thm {
  cx_gamma_c.get()
}

///|
/// GAMMA
fn step_41() -> Unit raise {
  let t2166 = @simp.simp_tac(@list.List([@complexes.cx_mul(), @complexes.cx_product(), @iterate.finite_numseg(), @complexes.cx_add(), @transcendentals.cpow(), @transcendentals.rpow(), @complexes.cx_inj(), @realax.real_of_num_eq(), @real.real_of_num_lt(), @arith.le_1(), @transcendentals.cx_log(), @transcendentals.cx_exp()]))
  let t2165 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t2164 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t2163 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually()))
  let t2162 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx((x : Real))"), cgamma_v1()))
  let t2161 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2167 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.reallim_complex(), @trivia.o_def(), cx_gamma(), @complexes.cx_div()])), t2161), t2162), t2163), t2164), t2165), t2166)
  gamma_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, op_minus_minus_minus_gt((n : Num) => rpow(real_of_num(n), x) * real_of_num(FACT(n)) / product(op_dot_dot(0, n), (m : Num) => x + real_of_num(m)), gamma(x), sequentially)"), t2167))
}

///|
let gamma_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA")

///|
/// `GAMMA`
pub fn gamma_v1() -> @kernel.Thm {
  gamma_v1_c.get()
}

///|
/// GAMMA_EQ_0
fn step_42() -> Unit raise {
  let t2168 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj()), @complexes.cx_add(), cx_gamma(), cgamma_eq_0()]))
  gamma_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, (gamma(x) == real_of_num(0)) == (∃ n : Num, x + real_of_num(n) == real_of_num(0))"), t2168))
}

///|
let gamma_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_EQ_0")

///|
/// `GAMMA_EQ_0`
pub fn gamma_eq_0() -> @kernel.Thm {
  gamma_eq_0_c.get()
}

///|
/// REAL_DIFFERENTIABLE_AT_GAMMA
fn step_43() -> Unit raise {
  let t2177 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), @complexes.cx_inj()]))
  let t2176 = @tactics.match_mp_tac(complex_differentiable_at_cgamma())
  let t2175 = @simp.rewrite_tac(@list.List([real_gamma()]))
  let t2174 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@realanalysis.real_differentiable_from_complex_at()))
  let t2173 = @simp.rewrite_tac(@list.List([gamma()]))
  let t2172 = @simp.gen_rewrite_tac(fn(x2169 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2170 = @equal.land_conv(x2169)
    fn(x2171 : @kernel.Term) -> @kernel.Thm raise {
      s2170(x2171)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t2178 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2172), t2173), t2174), t2175), t2176), t2177)
  real_differentiable_at_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, (∀ n : Num, !(x + real_of_num(n) == real_of_num(0))) → real_differentiable(gamma, atreal(x))"), t2178))
}

///|
let real_differentiable_at_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIFFERENTIABLE_AT_GAMMA")

///|
/// `REAL_DIFFERENTIABLE_AT_GAMMA`
pub fn real_differentiable_at_gamma() -> @kernel.Thm {
  real_differentiable_at_gamma_c.get()
}

///|
/// REAL_DIFFERENTIABLE_WITHIN_GAMMA
fn step_44() -> Unit raise {
  let t2179 = @simp.simp_tac(@list.List([real_differentiable_at_gamma(), @realanalysis.real_differentiable_atreal_within()]))
  real_differentiable_within_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ s : (Real) -> Bool, (∀ n : Num, !(x + real_of_num(n) == real_of_num(0))) → real_differentiable(gamma, within(atreal(x), s))"), t2179))
}

///|
let real_differentiable_within_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIFFERENTIABLE_WITHIN_GAMMA")

///|
/// `REAL_DIFFERENTIABLE_WITHIN_GAMMA`
pub fn real_differentiable_within_gamma() -> @kernel.Thm {
  real_differentiable_within_gamma_c.get()
}

///|
/// REAL_DIFFERENTIABLE_ON_GAMMA
fn step_45() -> Unit raise {
  let t2180 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @realanalysis.real_differentiable_on_differentiable(), real_differentiable_within_gamma()]))
  real_differentiable_on_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, SUBSET(s, {(x : Real) | ∀ n : Num, !(x + real_of_num(n) == real_of_num(0))}) → real_differentiable_on(gamma, s)"), t2180))
}

///|
let real_differentiable_on_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIFFERENTIABLE_ON_GAMMA")

///|
/// `REAL_DIFFERENTIABLE_ON_GAMMA`
pub fn real_differentiable_on_gamma() -> @kernel.Thm {
  real_differentiable_on_gamma_c.get()
}

///|
/// REAL_CONTINUOUS_ATREAL_GAMMA
fn step_46() -> Unit raise {
  let t2191 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), @complexes.re_cx(), @complexes.cx_inj()]))
  let t2190 = @tactics.match_mp_tac(continuous_at_cgamma())
  let t2189 = @tactics.match_mp_tac(@topology.continuous_at_within())
  let t2188 = @simp.simp_tac(@list.List([@topology.linear_continuous_within(), @simp.rewrite_rule(@list.List([@trivia.o_def()]))(@canal.linear_cx_re())]))
  let t2187 = @tactics.match_mp_tac(@topology.continuous_within_compose())
  let t2186 = @simp.gen_rewrite_tac(fn(x2183 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2184 = @equal.land_conv(x2183)
    fn(x2185 : @kernel.Term) -> @kernel.Thm raise {
      s2184(x2185)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t2182 = @simp.rewrite_tac(@list.List([@trivia.o_def(), cx_gamma()]))
  let t2181 = @simp.rewrite_tac(@list.List([@realanalysis.real_complex_continuous_atreal()]))
  let t2192 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2181), t2182), t2186), t2187), t2188), t2189), t2190), t2191)
  real_continuous_atreal_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, (∀ n : Num, !(x + real_of_num(n) == real_of_num(0))) → real_continuous(gamma, atreal(x))"), t2192))
}

///|
let real_continuous_atreal_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_ATREAL_GAMMA")

///|
/// `REAL_CONTINUOUS_ATREAL_GAMMA`
pub fn real_continuous_atreal_gamma() -> @kernel.Thm {
  real_continuous_atreal_gamma_c.get()
}

///|
/// REAL_CONTINUOUS_WITHIN_GAMMA
fn step_47() -> Unit raise {
  let t2193 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_atreal_withinreal(), real_continuous_atreal_gamma()]))
  real_continuous_within_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ s : (Real) -> Bool, (∀ n : Num, !(x + real_of_num(n) == real_of_num(0))) → real_continuous(gamma, within(atreal(x), s))"), t2193))
}

///|
let real_continuous_within_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_WITHIN_GAMMA")

///|
/// `REAL_CONTINUOUS_WITHIN_GAMMA`
pub fn real_continuous_within_gamma() -> @kernel.Thm {
  real_continuous_within_gamma_c.get()
}

///|
/// REAL_CONTINUOUS_ON_GAMMA
fn step_48() -> Unit raise {
  let t2194 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @realanalysis.real_continuous_on_eq_continuous_within(), real_continuous_within_gamma()]))
  real_continuous_on_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, SUBSET(s, {(x : Real) | ∀ n : Num, !(x + real_of_num(n) == real_of_num(0))}) → real_continuous_on(gamma, s)"), t2194))
}

///|
let real_continuous_on_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_ON_GAMMA")

///|
/// `REAL_CONTINUOUS_ON_GAMMA`
pub fn real_continuous_on_gamma() -> @kernel.Thm {
  real_continuous_on_gamma_c.get()
}

///|
/// REAL_DIFFERENTIABLE_ATREAL_RECIP_GAMMA
fn step_49() -> Unit raise {
  let t2202 = @simp.rewrite_tac(@list.List([complex_differentiable_at_recip_cgamma()]))
  let t2201 = @simp.simp_tac(@list.List([real_gamma(), @complexes.real_inv(), @equal.gsym(@trivia.o_def())]))
  let t2203 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@realanalysis.real_differentiable_from_complex_at())), t2201), t2202)
  let t2200 = @equal.gsym(@complexes.cx_inv())
  let t2204 = @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(cx_gamma()), t2200, @complexes.re_cx()])), t2203])
  let t2199 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t2198 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t2197 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => Re(inv(cgamma(Cx(x))))"))
  let t2196 = @tactics.match_mp_tac(@realanalysis.real_differentiable_transform_atreal())
  let t2195 = @simp.rewrite_tac(@list.List([@trivia.o_def(), gamma()]))
  let t2205 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2195), t2196), t2197), t2198), t2199), @tactics.conj_tac), t2204)
  real_differentiable_atreal_recip_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_differentiable(o(inv, gamma), atreal(x))"), t2205))
}

///|
let real_differentiable_atreal_recip_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIFFERENTIABLE_ATREAL_RECIP_GAMMA")

///|
/// `REAL_DIFFERENTIABLE_ATREAL_RECIP_GAMMA`
pub fn real_differentiable_atreal_recip_gamma() -> @kernel.Thm {
  real_differentiable_atreal_recip_gamma_c.get()
}

///|
/// REAL_DIFFERENTIABLE_WITHIN_RECIP_GAMMA
fn step_50() -> Unit raise {
  let t2206 = @simp.simp_tac(@list.List([@realanalysis.real_differentiable_atreal_within(), real_differentiable_atreal_recip_gamma()]))
  real_differentiable_within_recip_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ s : (Real) -> Bool, real_differentiable(o(inv, gamma), within(atreal(x), s))"), t2206))
}

///|
let real_differentiable_within_recip_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIFFERENTIABLE_WITHIN_RECIP_GAMMA")

///|
/// `REAL_DIFFERENTIABLE_WITHIN_RECIP_GAMMA`
pub fn real_differentiable_within_recip_gamma() -> @kernel.Thm {
  real_differentiable_within_recip_gamma_c.get()
}

///|
/// REAL_DIFFERENTIABLE_ON_RECIP_GAMMA
fn step_51() -> Unit raise {
  let t2207 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_on_differentiable(), real_differentiable_within_recip_gamma()]))
  real_differentiable_on_recip_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, real_differentiable_on(o(inv, gamma), s)"), t2207))
}

///|
let real_differentiable_on_recip_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_DIFFERENTIABLE_ON_RECIP_GAMMA")

///|
/// `REAL_DIFFERENTIABLE_ON_RECIP_GAMMA`
pub fn real_differentiable_on_recip_gamma() -> @kernel.Thm {
  real_differentiable_on_recip_gamma_c.get()
}

///|
/// REAL_CONTINUOUS_ATREAL_RECIP_GAMMA
fn step_52() -> Unit raise {
  let t2208 = @simp.simp_tac(@list.List([@realanalysis.real_differentiable_imp_continuous_atreal(), real_differentiable_atreal_recip_gamma()]))
  real_continuous_atreal_recip_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_continuous(o(inv, gamma), atreal(x))"), t2208))
}

///|
let real_continuous_atreal_recip_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_ATREAL_RECIP_GAMMA")

///|
/// `REAL_CONTINUOUS_ATREAL_RECIP_GAMMA`
pub fn real_continuous_atreal_recip_gamma() -> @kernel.Thm {
  real_continuous_atreal_recip_gamma_c.get()
}

///|
/// REAL_CONTINUOUS_WITHINREAL_RECIP_GAMMA
fn step_53() -> Unit raise {
  let t2209 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_atreal_withinreal(), real_continuous_atreal_recip_gamma()]))
  real_continuous_withinreal_recip_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ s : (Real) -> Bool, real_continuous(o(inv, gamma), within(atreal(x), s))"), t2209))
}

///|
let real_continuous_withinreal_recip_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_WITHINREAL_RECIP_GAMMA")

///|
/// `REAL_CONTINUOUS_WITHINREAL_RECIP_GAMMA`
pub fn real_continuous_withinreal_recip_gamma() -> @kernel.Thm {
  real_continuous_withinreal_recip_gamma_c.get()
}

///|
/// REAL_CONTINUOUS_ON_RECIP_GAMMA
fn step_54() -> Unit raise {
  let t2210 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within(), real_continuous_withinreal_recip_gamma()]))
  real_continuous_on_recip_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, real_continuous_on(o(inv, gamma), s)"), t2210))
}

///|
let real_continuous_on_recip_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_ON_RECIP_GAMMA")

///|
/// `REAL_CONTINUOUS_ON_RECIP_GAMMA`
pub fn real_continuous_on_recip_gamma() -> @kernel.Thm {
  real_continuous_on_recip_gamma_c.get()
}

///|
/// GAMMA_RECURRENCE_ALT
fn step_55() -> Unit raise {
  let t2211 = @simp.rewrite_tac(@list.List([@equal.gsym(cgamma_recurrence_alt())]))
  let t2212 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj()), @complexes.cx_div(), cx_gamma(), @complexes.cx_add()])), t2211)
  gamma_recurrence_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, gamma(x) == gamma(x + real_of_num(1)) / x"), t2212))
}

///|
let gamma_recurrence_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_RECURRENCE_ALT")

///|
/// `GAMMA_RECURRENCE_ALT`
pub fn gamma_recurrence_alt() -> @kernel.Thm {
  gamma_recurrence_alt_c.get()
}

///|
/// GAMMA_1
fn step_56() -> Unit raise {
  let t2213 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj()), cx_gamma(), cgamma_1()]))
  gamma_1_c.set(@tactics.prove(@term_syntax.parse_term("gamma(real_of_num(1)) == real_of_num(1)"), t2213))
}

///|
let gamma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_1")

///|
/// `GAMMA_1`
pub fn gamma_1() -> @kernel.Thm {
  gamma_1_c.get()
}

///|
/// GAMMA_RECURRENCE
fn step_57() -> Unit raise {
  let t2218 = @simp.rewrite_tac(@list.List([@complexes.cx_mul(), cx_gamma(), @complexes.cx_add(), @equal.gsym(cgamma_recurrence())]))
  let t2217 = @simp.gen_rewrite_tac(fn(x2214 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2215 = @equal.rand_conv(x2214)
    fn(x2216 : @kernel.Term) -> @kernel.Thm raise {
      s2215(x2216)
    }
  }, @list.List([@class.cond_rand()]))
  let t2219 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj()), cx_gamma()])), @tactics.gen_tac), t2217), t2218)
  gamma_recurrence_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, gamma(x + real_of_num(1)) == (if x == real_of_num(0) { real_of_num(1) } else { x * gamma(x) })"), t2219))
}

///|
let gamma_recurrence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_RECURRENCE")

///|
/// `GAMMA_RECURRENCE`
pub fn gamma_recurrence() -> @kernel.Thm {
  gamma_recurrence_c.get()
}

///|
/// GAMMA_FACT
fn step_58() -> Unit raise {
  let t2220 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj()), cx_gamma(), cgamma_fact()]))
  gamma_fact_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, gamma(real_of_num(n + 1)) == real_of_num(FACT(n))"), t2220))
}

///|
let gamma_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_FACT")

///|
/// `GAMMA_FACT`
pub fn gamma_fact() -> @kernel.Thm {
  gamma_fact_c.get()
}

///|
/// GAMMA_POLES
fn step_59() -> Unit raise {
  let t2221 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj()), cx_gamma(), cgamma_poles(), @complexes.cx_neg()]))
  gamma_poles_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, gamma(-real_of_num(n)) == real_of_num(0)"), t2221))
}

///|
let gamma_poles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_POLES")

///|
/// `GAMMA_POLES`
pub fn gamma_poles() -> @kernel.Thm {
  gamma_poles_c.get()
}

///|
/// GAMMA_SIMPLE_POLES
fn step_60() -> Unit raise {
  let t2242 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@canal.linear_cx_re())]))
  let t2241 = @tactics.match_mp_tac(@topology.linear_continuous_at())
  let t2240 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t2239 = @tactics.match_mp_tac(@topology.lim_at_within())
  let t2238 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@real.real_lt_01()]))])
  let t2237 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_cx(), @complexes.im_cx()]))
  let t2236 = @simp.rewrite_tac(@list.List([@complexes.real(), @sets.in_(), @equal.gsym(@complexes.cx_neg()), @complexes.cx_inj()]))
  let t2235 = @simp.rewrite_tac(@list.List([@topology.eventually_within(), @trivia.o_def(), @sets.in_univ(), @equal.gsym(@vectors.dist_nz())]))
  let t2234 = @simp.rewrite_tac(@list.List([cgamma_simple_poles(), @topology.within_univ()]))
  let t2232 = @term_syntax.parse_term("-Cx(real_of_num((n : Num)))")
  let t2233 = @tactics.map_every(fn(x2229 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2230 = @tactics.exists_tac(x2229)
    fn(x2231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2230(x2231)
    }
  }, @list.List([@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"), t2232]))
  let t2228 = @tactics.match_mp_tac(@topology.lim_compose_within())
  let t2227 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t2226 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => (Cx(Re(z)) + Cx(real_of_num((n : Num)))) * cgamma(Cx(Re(z)))) == o((z : Cart[Real, 2]) => (z + Cx(real_of_num(n))) * cgamma(z), o(Cx, Re))"), fn(x2223 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2224 = @tactics.subst1_tac(x2223)
    fn(x2225 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2224(x2225)
    }
  })
  let t2222 = @simp.rewrite_tac(@list.List([@complexes.cx_mul(), @complexes.cx_add(), cx_gamma(), @complexes.cx_div(), @complexes.cx_pow(), @complexes.cx_neg()]))
  let t2243 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.reallim_complex(), @trivia.o_def(), @realanalysis.lim_atreal_atcomplex()])), @tactics.gen_tac), t2222), t2226), t2227), t2228), t2233), t2234), t2235), t2236), t2237), @tactics.conj_tac), t2238), t2239), @canal.lim_tac), t2240), t2241), t2242)
  gamma_simple_poles_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, op_minus_minus_minus_gt((x : Real) => (x + real_of_num(n)) * gamma(x), pow(-real_of_num(1), n) / real_of_num(FACT(n)), atreal(-real_of_num(n)))"), t2243))
}

///|
let gamma_simple_poles_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_SIMPLE_POLES")

///|
/// `GAMMA_SIMPLE_POLES`
pub fn gamma_simple_poles() -> @kernel.Thm {
  gamma_simple_poles_c.get()
}

///|
/// GAMMA_POS_LE
fn step_61() -> Unit raise {
  let t2244 = @simp.simp_tac(@list.List([gamma(), re_pos_cgamma_real(), @complexes.re_cx(), @complexes.real_cx()]))
  gamma_pos_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → real_of_num(0) <= gamma(x)"), t2244))
}

///|
let gamma_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_POS_LE")

///|
/// `GAMMA_POS_LE`
pub fn gamma_pos_le() -> @kernel.Thm {
  gamma_pos_le_c.get()
}

///|
/// GAMMA_POS_LT
fn step_62() -> Unit raise {
  let t2245 = @simp.rewrite_tac(@list.List([gamma_eq_0()]))
  let t2246 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (x : Real)) == (real_of_num(0) <= x && !(x == real_of_num(0)))")), gamma_pos_le()])), t2245), @calc_rat.real_arith_tac)
  gamma_pos_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → real_of_num(0) < gamma(x)"), t2246))
}

///|
let gamma_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_POS_LT")

///|
/// `GAMMA_POS_LT`
pub fn gamma_pos_lt() -> @kernel.Thm {
  gamma_pos_lt_c.get()
}

///|
/// GAMMA_LEGENDRE_ALT
fn step_63() -> Unit raise {
  let t2248 = @simp.simp_tac(@list.List([@complexes.cx_mul(), @transcendentals.cx_exp(), @complexes.cx_sub(), @transcendentals.cx_log(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t2247 = @simp.rewrite_tac(@list.List([@transcendentals.cpow(), @transcendentals.rpow(), @complexes.cx_inj(), @real.real_of_num_lt(), @realax.real_of_num_eq(), @calc_num.arith()]))
  let t2249 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj()), cx_gamma(), @complexes.cx_add(), @complexes.cx_div(), cgamma_legendre_alt(), @complexes.cx_mul()])), t2247), t2248)
  gamma_legendre_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, gamma(x) * gamma(x + real_of_num(1) / real_of_num(2)) == rpow(real_of_num(2), real_of_num(1) - real_of_num(2) * x) * (gamma(real_of_num(1) / real_of_num(2)) * gamma(real_of_num(2) * x))"), t2249))
}

///|
let gamma_legendre_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_LEGENDRE_ALT")

///|
/// `GAMMA_LEGENDRE_ALT`
pub fn gamma_legendre_alt() -> @kernel.Thm {
  gamma_legendre_alt_c.get()
}

///|
/// GAMMA_REFLECTION
fn step_64() -> Unit raise {
  let t2250 = @simp.rewrite_tac(@list.List([cgamma_reflection()]))
  let t2251 = @tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@complexes.cx_inj()), @complexes.cx_mul(), @complexes.cx_div(), cx_gamma(), @transcendentals.cx_sin(), @complexes.cx_sub()])), t2250)
  gamma_reflection_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, gamma(x) * gamma(real_of_num(1) - x) == pi / sin(pi * x)"), t2251))
}

///|
let gamma_reflection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_REFLECTION")

///|
/// `GAMMA_REFLECTION`
pub fn gamma_reflection() -> @kernel.Thm {
  gamma_reflection_c.get()
}

///|
/// GAMMA_HALF
fn step_65() -> Unit raise {
  let t2252 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj()), @complexes.cx_div(), cx_gamma(), cgamma_half()]))
  gamma_half_c.set(@tactics.prove(@term_syntax.parse_term("gamma(real_of_num(1) / real_of_num(2)) == sqrt(pi)"), t2252))
}

///|
let gamma_half_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_HALF")

///|
/// `GAMMA_HALF`
pub fn gamma_half() -> @kernel.Thm {
  gamma_half_c.get()
}

///|
/// GAMMA_LEGENDRE
fn step_66() -> Unit raise {
  let t2253 = @simp.rewrite_tac(@list.List([gamma_legendre_alt(), gamma_half()]))
  gamma_legendre_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, gamma(x) * gamma(x + real_of_num(1) / real_of_num(2)) == rpow(real_of_num(2), real_of_num(1) - real_of_num(2) * x) * (sqrt(pi) * gamma(real_of_num(2) * x))"), t2253))
}

///|
let gamma_legendre_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_LEGENDRE")

///|
/// `GAMMA_LEGENDRE`
pub fn gamma_legendre() -> @kernel.Thm {
  gamma_legendre_c.get()
}

///|
/// GAMMA_WEIERSTRASS
fn step_67() -> Unit raise {
  let t2259 = @simp.simp_tac(@list.List([@complexes.cx_mul(), @complexes.cx_div(), @transcendentals.cx_exp(), @complexes.cx_neg(), @complexes.cx_product(), @iterate.finite_numseg(), @complexes.cx_add()]))
  let t2258 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t2257 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t2256 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually()))
  let t2255 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx((x : Real))"), cgamma_weierstrass()))
  let t2254 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2260 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.reallim_complex(), @trivia.o_def(), cx_gamma(), @complexes.cx_div()])), t2254), t2255), t2256), t2257), t2258), t2259)
  gamma_weierstrass_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, op_minus_minus_minus_gt((n : Num) => exp(-euler_mascheroni * x) / x * product(op_dot_dot(1, n), (k : Num) => exp(x / real_of_num(k)) / (real_of_num(1) + x / real_of_num(k))), gamma(x), sequentially)"), t2260))
}

///|
let gamma_weierstrass_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_WEIERSTRASS")

///|
/// `GAMMA_WEIERSTRASS`
pub fn gamma_weierstrass() -> @kernel.Thm {
  gamma_weierstrass_c.get()
}

///|
/// REAL_LOG_CONVEX_GAMMA
fn step_68() -> Unit raise {
  let t2287 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("(((x : Real) + real_of_num((k : Num))) * ((y : Real) + real_of_num(k)) <= pow((x + y) / real_of_num(2) + real_of_num(k), 2)) == (real_of_num(0) <= pow(x - y, 2))"))]))
  let t2286 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @realarith.real_lte_add(), @realarith.real_pos()]))
  let t2285 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2284 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul()), @real.real_pow_inv()]))
  let t2288 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2284), t2285), t2286), t2287)
  let t2289 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.is_realinterval(), @sets.in_elim_thm()])), @calc_rat.real_arith_tac)
  let t2283 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2282 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_on_differentiable(), @sets.in_elim_thm()]))
  let t2290 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on()), t2282), t2283), @realanalysis.real_differentiable_tac), @calc_rat.asm_real_arith_tac), t2289, t2288])
  let t2281 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2280 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @real.real_lt_inv_eq(), @realarith.real_lte_add(), @realarith.real_pos()]))
  let t2279 = @tactics.match_mp_tac(@realanalysis.midpoint_real_log_convex())
  let t2278 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t2277 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t2276 = @tactics.match_mp_tac(@realanalysis.real_log_convex_product())
  let t2275 = @simp.simp_tac(@list.List([@equal.gsym(@products.product_inv()), @iterate.finite_numseg()]))
  let t2274 = @simp.asm_simp_tac(@list.List([@realanalysis.real_log_convex_rpow_right(), @real.real_of_num_lt(), @arith.le_1()]))
  let t2273 = @simp.simp_tac(@list.List([@realanalysis.real_log_convex_const(), @realarith.real_pos()]))
  let t2272 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_log_convex_mul()), @tactics.conj_tac))
  let t2271 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t2270 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2269 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t2268 = @simp.rewrite_tac(@list.List([gamma_v1(), @metric.trivial_limit_sequentially(), @metric.eventually_sequentially()]))
  let t2267 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (x : Real) => rpow(real_of_num(n), x) * real_of_num(FACT(n)) / product(op_dot_dot(0, n), (m : Num) => x + real_of_num(m))"))
  let t2266 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @realanalysis.real_log_convex_lim()))
  let t2265 = @tactics.pop_assum(fn(x2264 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2263 = @simp.asm_rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t2262 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Real) | real_of_num(0) < x}"))
  let t2261 = @tactics.match_mp_tac(@realanalysis.real_log_convex_on_subset())
  let t2291 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2261), t2262), t2263), t2265), t2266), t2267), t2268), t2269), t2270), @tactics.disch_tac), t2271), t2272), t2273), t2274), t2275), t2276), t2277), t2278), @tactics.strip_tac), t2279), t2280), t2281), t2290)
  real_log_convex_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, (∀ x : Real, IN(x, s) → real_of_num(0) < x) → real_log_convex_on(gamma, s)"), t2291))
}

///|
let real_log_convex_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LOG_CONVEX_GAMMA")

///|
/// `REAL_LOG_CONVEX_GAMMA`
pub fn real_log_convex_gamma() -> @kernel.Thm {
  real_log_convex_gamma_c.get()
}

///|
/// GAMMA_REAL_LOG_CONVEX_UNIQUE
fn step_69() -> Unit raise {
  let t2533 = @tactics.conv_tac(@calc_rat.real_field)
  let t2534 = @tactics.then_tac(@simp.simp_tac(@list.List([@transcendentals.rpow(), @equal.gsym(@realax.real_of_num_mul()), @real.real_mul_ac()])), t2533)
  let t2535 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt()])), @int.asm_arith_tac), t2534])
  let t2532 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num))"), fn(x2529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2530 = @tactics.mp_tac(x2529)
    fn(x2531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2530(x2531)
    }
  })
  let t2528 = @tactics.match_mp_tac(@real.real_eq_imp_le())
  let t2527 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → SUC(n - 1) == n"))]))
  let t2525 = @simp.rewrite_tac(@list.List([@arith.fact()]))
  let t2526 = @list.List([@tactics.then_tac(@tactics.ap_term_tac, @int.asm_arith_tac), t2525])
  let t2524 = @tactics.subgoal_then(@term_syntax.parse_term("FACT((n : Num)) == FACT(SUC(n - 1))"), fn(x2521 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2522 = @tactics.subst1_tac(x2521)
    fn(x2523 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2522(x2523)
    }
  })
  let t2520 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t2519 = @tactics.disch_then(fn(x2518 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2515 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2516 = @tactics.mp_tac(x2515)
      fn(x2517 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2516(x2517)
      }
    })(@bool.conjunct2(x2518))
  })
  let t2514 = @simp.asm_rewrite_tac(@list.List([]))
  let t2510 = @term_syntax.parse_term("(n : Num)")
  let t2513 = @tactics.first_x_assum(fn(x2512 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2507 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2508 = @tactics.mp_tac(x2507)
      fn(x2509 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2508(x2509)
      }
    })(((x2511 : @kernel.Thm) => @bool.spec(t2510, x2511))(x2512))
  })
  let t2506 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq()]))
  let t2505 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t2504 = @simp.gen_rewrite_tac(fn(x2501 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2502 = @equal.land_conv(x2501)
    fn(x2503 : @kernel.Term) -> @kernel.Thm raise {
      s2502(x2503)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == b * (a * c * d)"))]))
  let t2500 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t2536 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@products.product_clauses_right(), @arith.le_0(), @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 0 < n"))])), t2500), t2504), t2505), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2506), t2513), t2514), t2519), t2520), t2524), t2526), t2527), t2528), t2532), t2535)
  let t2499 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t2498 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow(), @realax.real_of_num_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) <= (x : Real) → real_of_num(0) < x"))]))
  let t2497 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t2496 = @list.List([@int.asm_arith_tac, @tactics.disch_then(fn(x2495 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2493 = @tactics.mp_tac(x2492)
      fn(x2494 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2493(x2494)
      }
    })(@bool.conjunct1(x2495))
  })])
  let t2488 = @term_syntax.parse_term("(n : Num) + 1")
  let t2491 = @tactics.first_x_assum(fn(x2490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2486 = @tactics.mp_tac(x2485)
      fn(x2487 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2486(x2487)
      }
    })(((x2489 : @kernel.Thm) => @bool.spec(t2488, x2489))(x2490))
  })
  let t2537 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @realax.real_mul_lid()])), t2491), @tactics.ants_tac), t2496), t2497), t2498), t2499), t2536])
  let t2484 = @list.List([@simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @real.real_of_num_lt(), @arith.le_1(), @arith.fact_nz(), @transcendentals.rpow_pos_lt(), @int.arith_rule(@term_syntax.parse_term("2 <= (x : Num) → 0 < x"))])), @tactics.all_tac])
  let t2483 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < rpow(real_of_num((n : Num)), (x : Real)) * real_of_num(FACT(n))"), fn(x2480 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2481 = @tactics.assume_tac(x2480)
    fn(x2482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2481(x2482)
    }
  })
  let t2479 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t2478 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t2477 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(f : Real) * ((r : Real) * (n : Real) * (p : Real)) == p * f * (r * n)"))]))
  let t2476 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv()]))
  let t2475 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_le(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(2) <= (n : Real) → real_of_num(1) + (x : Real) * inv(n) == (x + n) / n"))]))
  let t2474 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) && x <= real_of_num(1) + (e : Real) → abs(x - real_of_num(1)) <= e")))
  let t2473 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2469 = @simp.rewrite_tac(@list.List([@real.real_mul_ac(), @calc_int.real_add_ac()]))
  let t2468 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → SUC(n - 1) == n"))]))
  let t2467 = @simp.rewrite_tac(@list.List([@products.product_clauses_numseg(), @arith.le_0()]))
  let t2466 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → SUC(n) - 1 == SUC(n - 1)"))]))
  let t2470 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) + real_of_num(1) + (x : Real) == n + x + real_of_num(1)")), @realarith.real_lt_add(), @real.real_of_num_lt(), @arith.le_1()])), t2466), t2467), t2468), t2469)
  let t2465 = @simp.rewrite_tac(@list.List([@products.product_sing_numseg(), @calc_int.real_add_rid()]))
  let t2471 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) + real_of_num(1) + (x : Real) == x + real_of_num(1)")), @calc_num.arith()])), t2465), t2470])
  let t2464 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2463 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc())]))
  let t2472 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@calc_num.arith()]))), @tactics.disch_tac), t2463), t2464), t2471), @tactics.disch_tac])
  let t2462 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, 0 < n → (f : (Real) -> Real)(real_of_num(n) + (x : Real)) == product(op_dot_dot(0, n - 1), (k : Num) => x + real_of_num(k)) * f(x)"), fn(x2460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x2460
    @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 0 < n")), th_3]))
  })
  let t2459 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t2458 = @simp.asm_simp_tac(@list.List([@transcendentals.real_exp_add(), @transcendentals.exp_log(), @real.real_of_num_lt(), @arith.le_1(), @arith.fact_nz(), @int.arith_rule(@term_syntax.parse_term("real_of_num(2) <= real_of_num((n : Num)) && real_of_num(0) < (x : Real) → real_of_num(0) < real_of_num(n) + x"))]))
  let t2457 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t2456 = @simp.gen_rewrite_tac(fn(x2455 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2451 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2447 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x2441 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2442 = @equal.land_conv(x2441)
          fn(x2443 : @kernel.Term) -> @kernel.Thm raise {
            s2442(x2443)
          }
        })((fn(x2444 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2445 = @equal.binder_conv(x2444)
          fn(x2446 : @kernel.Term) -> @kernel.Thm raise {
            s2445(x2446)
          }
        })(x2447))
      })((fn(x2448 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2449 = @equal.rand_conv(x2448)
        fn(x2450 : @kernel.Term) -> @kernel.Thm raise {
          s2449(x2450)
        }
      })(x2451))
    })((fn(x2452 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2453 = @equal.binop_conv(x2452)
      fn(x2454 : @kernel.Term) -> @kernel.Thm raise {
        s2453(x2454)
      }
    })(x2455))
  }, @list.List([@equal.gsym(@transcendentals.real_exp_mono_le())]))
  let t2439 = @simp.rewrite_tac(@list.List([@realax.real_of_num_mul(), @arith.mult_sym()]))
  let t2438 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → SUC(n - 1) == n"))]))
  let t2437 = @simp.asm_simp_tac(@list.List([@real.real_of_num_lt(), @equal.gsym(@real.real_of_num_suc()), @arith.le_1(), @arith.fact()]))
  let t2436 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → SUC(n) - 1 == SUC(n - 1)"))]))
  let t2435 = @simp.asm_rewrite_tac(@list.List([@realax.real_add_lid(), @arith.fact(), @calc_num.arith()]))
  let t2434 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2440 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@calc_num.arith(), @arith.lt_0()]))), t2434), t2435), t2436), t2437), t2438), t2439), @tactics.all_tac])
  let t2433 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, 0 < n → (f : (Real) -> Real)(real_of_num(n)) == real_of_num(FACT(n - 1))"), fn(x2431 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2431
    @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 0 < n && 0 < n - 1")), th_2]))
  })
  let t2430 = @simp.rewrite_tac(@list.List([@real.real_le_sub_ladd(), @real.real_le_sub_radd()]))
  let t2429 = @simp.simp_tac(@list.List([@realax.real_of_num_le(), @real.real_of_num_sub(), @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 1 <= n"))]))
  let t2426 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_le_rdiv_eq()]))
  let t2425 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) && real_of_num(2) <= (y : Real) → x / (x / (y - real_of_num(1))) == y - real_of_num(1)"))
  let t2427 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) <= (x : Real) → real_of_num(0) < x")), t2425])), t2426)
  let t2422 = @tactics.conv_tac(@calc_rat.real_field)
  let t2421 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(2) <= (n : Real)"))
  let t2423 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) <= (n : Real) → real_of_num(0) < n - real_of_num(1)"))])), t2421), t2422)
  let t2424 = @list.List([@tactics.then_tac(@tactics.ap_term_tac, @calc_rat.real_arith_tac), t2423])
  let t2420 = @tactics.subgoal_then(@term_syntax.parse_term("(f : (Real) -> Real)((n : Real)) == f(n - real_of_num(1) + real_of_num(1))"), fn(x2417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2418 = @tactics.subst1_tac(x2417)
    fn(x2419 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2418(x2419)
    }
  })
  let t2428 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2420), t2424), t2427])
  let t2416 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Real, real_of_num(2) <= n → (f : (Real) -> Real)(n - real_of_num(1)) == f(n) / (n - real_of_num(1))"), fn(x2414 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2414
    @simp.simp_tac(@list.List([th_1]))
  })
  let t2411 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) → (n : Real) * x / x == n"))
  let t2412 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) <= (x : Real) → real_of_num(0) < x && real_of_num(0) < x + real_of_num(1) && real_of_num(0) < x - real_of_num(1)"))
  let t2413 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_div()), @real.real_lt_mul(), t2412, t2411]))
  let t2407 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs((n : Real) + x - n) == x"))]))
  let t2406 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs((n : Real) + real_of_num(1) - n) == real_of_num(1)")), @real.real_div_1()]))
  let t2405 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realanalysis.in_real_segment(), @trivia.o_thm()]))
  let t2399 = @term_syntax.parse_term("real_of_num((n : Num)) + (x : Real)")
  let t2400 = @term_syntax.parse_term("real_of_num((n : Num)) + real_of_num(1)")
  let t2401 = @list.List([@term_syntax.parse_term("real_of_num((n : Num))"), t2400, t2399])
  let t2404 = @tactics.use_then("R", fn(x2403 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2397 = @tactics.mp_tac(x2396)
      fn(x2398 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2397(x2398)
      }
    })(((x2402 : @kernel.Thm) => @bool.specl(t2401, x2402))(x2403))
  })
  let t2395 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_refl(), @real.real_div_1()]))
  let t2408 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(1)")), t2395), t2404), t2405), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2406), t2407), @calc_rat.asm_real_arith_tac)
  let t2394 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs((n : Real) + x - n) == x"))]))
  let t2393 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (x - real_of_num(1))) == real_of_num(1)")), @real.real_div_1()]))
  let t2392 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realanalysis.in_real_segment(), @trivia.o_thm()]))
  let t2386 = @term_syntax.parse_term("real_of_num((n : Num))")
  let t2387 = @term_syntax.parse_term("real_of_num((n : Num)) + (x : Real)")
  let t2388 = @list.List([@term_syntax.parse_term("real_of_num((n : Num)) - real_of_num(1)"), t2387, t2386])
  let t2391 = @tactics.use_then("R", fn(x2390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2384 = @tactics.mp_tac(x2383)
      fn(x2385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2384(x2385)
      }
    })(((x2389 : @kernel.Thm) => @bool.specl(t2388, x2389))(x2390))
  })
  let t2378 = @term_syntax.parse_term("real_of_num((n : Num))")
  let t2379 = @term_syntax.parse_term("real_of_num((n : Num)) + (x : Real)")
  let t2380 = @list.List([@term_syntax.parse_term("real_of_num((n : Num)) - real_of_num(1)"), t2379, t2378])
  let t2409 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.use_then("L", fn(x2382 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2376 = @tactics.mp_tac(x2375)
      fn(x2377 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2376(x2377)
      }
    })(((x2381 : @kernel.Thm) => @bool.specl(t2380, x2381))(x2382))
  }), t2391), t2392), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2393), @tactics.disch_tac), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2394), @calc_rat.asm_real_arith_tac), t2408])
  let t2374 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2373 = @tactics.disch_then(fn(x2370 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2371 = ((x2369 : @kernel.Thm) => @tactics.label_tac("R", x2369))(x2370)
    fn(x2372 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2371(x2372)
    }
  })
  let t2368 = @tactics.disch_then(fn(x2365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2366 = ((x2364 : @kernel.Thm) => @tactics.label_tac("L", x2364))(x2365)
    fn(x2367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2366(x2367)
    }
  })
  let t2363 = @simp.asm_rewrite_tac(@list.List([]))
  let t2358 = @term_syntax.parse_term("{(x : Real) | real_of_num(0) < x}")
  let t2359 = @list.List([@term_syntax.parse_term("o(log, (f : (Real) -> Real))"), t2358])
  let t2362 = @tactics.map_every(fn(x2361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2355 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2356 = @tactics.mp_tac(x2355)
      fn(x2357 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2356(x2357)
      }
    })(((x2360 : @kernel.Thm) => @bool.specl(t2359, x2360))(x2361))
  }, @list.List([@realanalysis.real_convex_on_left_secant(), @realanalysis.real_convex_on_right_secant()]))
  let t2354 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.is_realinterval(), @sets.in_elim_thm()])), @calc_rat.real_arith_tac), @tactics.disch_tac])
  let t2353 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2352 = @term_syntax.parse_term("{(x : Real) | real_of_num(0) < x}")
  let t2410 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t2352]), @realanalysis.real_log_convex_on_v1())), t2353), @tactics.ants_tac), t2354), t2362), t2363), t2368), t2373), t2374), t2409), @tactics.all_tac])
  let t2351 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, real_of_num(2) <= real_of_num(n) → log((f : (Real) -> Real)(real_of_num(n))) - log(f(real_of_num(n) - real_of_num(1))) <= (log(f(real_of_num(n) + (x : Real))) - log(f(real_of_num(n)))) / x && (log(f(real_of_num(n) + x)) - log(f(real_of_num(n)))) / x <= log(f(real_of_num(n) + real_of_num(1))) - log(f(real_of_num(n)))"), fn(x2348 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2349 = @tactics.mp_tac(x2348)
    fn(x2350 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2349(x2350)
    }
  })
  let t2347 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t2346 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t2345 = @simp.simp_tac(@list.List([@realanalysis.reallim_null_lmul(), @realanalysis.reallim_1_over_n()]))
  let t2344 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (x : Real) * inv(real_of_num(n))"))
  let t2343 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t2342 = @simp.once_rewrite_tac(@list.List([@realanalysis.reallim_null()]))
  let t2341 = @simp.asm_simp_tac(@list.List([@realanalysis.reallim_div(), @realanalysis.reallim_const(), gamma_pos_lt(), gamma_v1(), @real.real_lt_imp_nz()]))
  let t2340 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t2339 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (f : (Real) -> Real)((x : Real)) / (rpow(real_of_num(n), x) * real_of_num(FACT(n)) / product(op_dot_dot(0, n), (m : Num) => x + real_of_num(m)))"))
  let t2338 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @realanalysis.reallim_unique()))
  let t2337 = @simp.asm_simp_tac(@list.List([gamma_pos_lt()]))
  let t2336 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (g : Real) && (f : Real) / g == real_of_num(1) → f == g")))
  let t2335 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (x : Real)"), fn(x2332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2333 = @tactics.assume_tac(x2332)
    fn(x2334 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2333(x2334)
    }
  })
  let t2331 = @simp.asm_rewrite_tac(@list.List([gamma_1()]))
  let t2330 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(1)"))
  let t2329 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2323 = @list.List([@calc_rat.asm_real_arith_tac, @meson.asm_meson_tac(@list.List([]))])
  let t2320 = @term_syntax.parse_term("frac((x : Real))")
  let t2324 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.first_x_assum(fn(x2322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2317 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2318 = @tactics.mp_tac(x2317)
      fn(x2319 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2318(x2319)
      }
    })(((x2321 : @kernel.Thm) => @bool.spec(t2320, x2321))(x2322))
  })), @tactics.ants_tac), t2323)
  let t2316 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_of_num_sub()), @arith.le_1()]))
  let t2315 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((n : Num) - 1) + real_of_num(1) == real_of_num(n)"), fn(x2313 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2313
    @meson.asm_meson_tac(@list.List([th, @realax.real_le_refl(), @real.real_lt_01()]))
  })
  let t2312 = @simp.asm_simp_tac(@list.List([@calc_int.real_add_rid(), @real.real_lt_imp_nz()]))
  let t2325 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0")), t2312), t2315), t2316), @calc_rat.real_arith_tac), t2324])
  let t2311 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t2310 = @class.asm_cases_tac(@term_syntax.parse_term("frac((x : Real)) == real_of_num(0)"))
  let t2309 = @simp.asm_rewrite_tac(@list.List([]))
  let t2308 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), @floor.floor_frac()))
  let t2305 = @term_syntax.parse_term("(n : Num)")
  let t2307 = @tactics.disch_then((x2306 : @kernel.Thm) => @tactics.x_choose_tac(t2305, x2306))
  let t2304 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t2303 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), @floor.floor_pos()))
  let t2326 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), @tactics.disch_tac), t2303), t2304), t2307), t2308), t2309), t2310), t2311), t2325)
  let t2302 = @simp.asm_simp_tac(@list.List([gamma_recurrence(), @realarith.real_let_add(), @realarith.real_pos()]))
  let t2301 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) + real_of_num(1) + (x : Real) == n + x + real_of_num(1)"))]))
  let t2300 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc())]))
  let t2299 = @simp.asm_simp_tac(@list.List([@realax.real_add_lid()]))
  let t2327 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), @nums.induct_tac), t2299), t2300), t2301), t2302), @calc_rat.asm_real_arith_tac), t2326])
  let t2328 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ y : Real, real_of_num(0) < y && y <= real_of_num(1) → (∀ n : Num, (f : (Real) -> Real)(real_of_num(n) + y) == gamma(real_of_num(n) + y))"), fn(x2296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2297 = @tactics.assume_tac(x2296)
    fn(x2298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2297(x2298)
    }
  }), t2327)])
  let t2295 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x && x <= real_of_num(1) → (f : (Real) -> Real)(x) == gamma(x)"), fn(x2292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2293 = @tactics.assume_tac(x2292)
    fn(x2294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2293(x2294)
    }
  })
  let t2538 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t2295), t2328), t2329), @tactics.strip_tac), t2330), t2331), t2335), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2336), t2337), t2338), t2339), t2340), t2341), t2342), t2343), t2344), t2345), t2346), t2347), t2351), t2410), t2413), t2416), t2428), t2429), t2430), t2433), t2440), t2456), t2457), t2458), t2459), t2462), t2472), t2473), @tactics.disch_tac), t2474), t2475), t2476), t2477), t2478), t2479), t2483), t2484), @tactics.conj_tac), t2537)
  gamma_real_log_convex_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, f(real_of_num(1)) == real_of_num(1) && (∀ x : Real, real_of_num(0) < x → f(x + real_of_num(1)) == x * f(x)) && (∀ x : Real, real_of_num(0) < x → real_of_num(0) < f(x)) && real_log_convex_on(f, {(x : Real) | real_of_num(0) < x}) → (∀ x : Real, real_of_num(0) < x → f(x) == gamma(x))"), t2538))
}

///|
let gamma_real_log_convex_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAMMA_REAL_LOG_CONVEX_UNIQUE")

///|
/// `GAMMA_REAL_LOG_CONVEX_UNIQUE`
pub fn gamma_real_log_convex_unique() -> @kernel.Thm {
  gamma_real_log_convex_unique_c.get()
}

///|
/// EULER_HAS_INTEGRAL_CGAMMA
fn step_70() -> Unit raise {
  let t2584 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_le(), @equal.gsym(@vectors.lift_eq()), @vectors.lift_num(), @vectors.lift_drop()]))
  let t2583 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @complexes.re_cx()]))
  let t2582 = @tactics.disch_then(fn(x2581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2585 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.complex_differentiable_imp_differentiable()), @canal.complex_differentiable_tac), t2582), t2583), t2584), @calc_rat.asm_real_arith_tac)
  let t2580 = @simp.rewrite_tac(@list.List([@vectors.linear(), @trivia.o_def(), @vectors.drop_add(), @vectors.drop_cmul(), @complexes.cx_add(), @complexes.complex_cmul(), @equal.gsym(@complexes.cx_mul())]))
  let t2586 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@derivatives.differentiable_linear()), t2580), t2585])
  let t2579 = @tactics.match_mp_tac(@derivatives.differentiable_chain_within())
  let t2578 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t2577 = @tactics.subgoal_then(@term_syntax.parse_term("((a : Cart[Real, Unit]) => cpow(Cx(drop(a)), (z : Cart[Real, 2]))) == o((w : Cart[Real, 2]) => cpow(w, z), o(Cx, drop))"), fn(x2574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2575 = @tactics.subst1_tac(x2574)
    fn(x2576 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2575(x2576)
    }
  })
  let t2587 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.differentiable_imp_continuous_within()), t2577), t2578), t2579), @tactics.conj_tac), t2586)
  let t2571 = @simp.rewrite_tac(@list.List([@vectors.norm_real(), @equal.gsym(@vectors.drop_())]))
  let t2570 = @tactics.subgoal_then(@term_syntax.parse_term("norm((u : Cart[Real, Unit])) == drop(u)"), fn(x2568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2568
    @meson.asm_meson_tac(@list.List([th_1]))
  })
  let t2567 = @tactics.match_mp_tac(@transcendentals.log_mono_lt_imp())
  let t2566 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_rpow())]))
  let t2565 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) / (y : Real) == inv(y) * x"))]))
  let t2564 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_rdiv_eq())]))
  let t2563 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t2561 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_lt()]))
  let t2562 = @list.List([@meson.asm_meson_tac(@list.List([@transcendentals.exp_log()])), t2561])
  let t2560 = @tactics.subgoal_then(@term_syntax.parse_term("(e : Real) == exp(log(e))"), fn(x2557 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2558 = @tactics.subst1_tac(x2557)
    fn(x2559 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2558(x2559)
    }
  })
  let t2556 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, Unit])"))
  let t2555 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_pos_lt(), @vectors.dist_0(), @transcendentals.real_abs_exp()]))
  let t2554 = @tactics.exists_tac(@term_syntax.parse_term("rpow((e : Real), inv(Re((z : Cart[Real, 2]))))"))
  let t2553 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t2572 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.lim_within(), @topology.in_interval_1(), @complexes.dist_cx(), @real.real_sub_rzero()])), t2553), @tactics.disch_tac), t2554), t2555), t2556), @tactics.strip_tac), t2560), t2562), t2563), t2564), t2565), t2566), t2567), t2570), t2571), @calc_rat.asm_real_arith_tac)
  let t2552 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < drop((u : Cart[Real, Unit]))"), fn(x2550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2550
    @simp.simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @complexes.re_mul_cx(), th]))
  })
  let t2549 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.dist_0(), @vectors.norm_pos_lt(), @equal.gsym(@vectors.drop_eq()), @vectors.lift_drop(), @vectors.drop_vec()]))
  let t2573 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, Unit])")), t2549), @tactics.strip_tac), t2552), @calc_rat.asm_real_arith_tac), t2572])
  let t2548 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t2547 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t2546 = @tactics.exists_tac(@term_syntax.parse_term("(t : Cart[Real, Unit]) => Cx(exp(Re((z : Cart[Real, 2])) * log(drop(t))))"))
  let t2545 = @tactics.match_mp_tac(@topology.lim_transform_within())
  let t2544 = @simp.rewrite_tac(@list.List([@transcendentals.norm_cexp()]))
  let t2543 = @simp.once_rewrite_tac(@list.List([@canal.lim_null_complex_norm()]))
  let t2588 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@topology.continuous_within(), @transcendentals.cpow(), @complexes.cx_inj(), @equal.gsym(@vectors.lift_eq()), @vectors.lift_num(), @vectors.lift_drop()])), t2543), t2544), t2545), t2546), t2547), t2548), @tactics.conj_tac), t2573), t2587])
  let t2542 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Cart[Real, Unit]) == vec(0)"))
  let t2541 = @simp.rewrite_tac(@list.List([@topology.in_interval_1()]))
  let t2540 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t2539 = @simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within()]))
  let t2589 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2539), t2540), t2541), @tactics.strip_tac), t2542), t2588)
  let lemma0 = @tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ a : Cart[Real, Unit], ∀ b : Cart[Real, Unit], real_of_num(0) < Re(z) && real_of_num(0) <= drop(a) → continuous_on((t : Cart[Real, Unit]) => cpow(Cx(drop(t)), z), interval([(a, b)]))"), t2589)
  let t2670 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 == 1 + n")), @complexes.complex_mul_ac()]))
  let t2668 = @equal.gsym(@complexes.cx_add())
  let t2669 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_add_assoc()), t2668, @realax.real_of_num_add()]))
  let t2665 = @term_syntax.parse_term("1")
  let t2666 = @term_syntax.parse_term("(m : Num)")
  let t2667 = @simp.rewrite_tac(@list.List([@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t2666, t2665]), @complexes.cproduct_offset())]))
  let t2664 = @simp.rewrite_tac(@list.List([@arith.add1(), @complexes.complex_inv_mul(), @complexes.complex_add_rid()]))
  let t2663 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses_left(), @int.arith_rule(@term_syntax.parse_term("0 <= SUC((n : Num))"))]))
  let t2662 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t2660 = @equal.gsym(@real.real_of_num_suc())
  let t2661 = @simp.simp_tac(@list.List([@arith.fact(), @equal.gsym(@realax.real_of_num_mul()), @complexes.cx_mul(), t2660]))
  let t2659 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2658 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1())]))
  let t2656 = @complexes.complex_field(@term_syntax.parse_term("!((n : Cart[Real, 2]) == Cx(real_of_num(0))) && !((z : Cart[Real, 2]) == Cx(real_of_num(0))) → n / z * (z * (p : Cart[Real, 2]) * (Cx(real_of_num(1)) / n * (q : Cart[Real, 2]))) == p * q"))
  let t2657 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num((n : Num)) + real_of_num(1) == real_of_num(0))")), @complexes.cx_inj(), t2656]))
  let t2654 = @drule.match_mp(@canal.has_integral_complex_lmul())
  let t2651 = @term_syntax.parse_term("Cx(real_of_num((n : Num)) + real_of_num(1)) / (z : Cart[Real, 2])")
  let t2671 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2655 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2653 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2649 = @tactics.mp_tac(x2648)
        fn(x2650 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2649(x2650)
        }
      })(((x2652 : @kernel.Thm) => @bool.spec(t2651, x2652))(x2653))
    })(t2654(x2655))
  }), t2657), t2658), t2659), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2661), t2662), @tactics.ap_term_tac), t2663), t2664), t2667), t2669), t2670)
  let t2644 = @simp.asm_rewrite_tac(@list.List([]))
  let t2645 = @tactics.then_tac(@tactics.match_mp_tac(@integration.has_integral_neg()), t2644)
  let t2643 = @tactics.conv_tac(@complexes.complex_field)
  let t2641 = @equal.gsym(@complexes.cx_inj())
  let t2642 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq()), t2641]))
  let t2640 = @tactics.mp_tac(@int.arith_rule(@term_syntax.parse_term("!((n : Num) + 1 == 0)")))
  let t2639 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @arith.add_sub(), @complexes.complex_mul_assoc()]))
  let t2638 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx(), @complexes.complex_mul_lid()]))
  let t2637 = @tactics.match_mp_tac(@canal.has_vector_derivative_real_complex())
  let t2636 = @simp.rewrite_tac(@list.List([@complexes.cx_sub()]))
  let t2635 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2646 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec(), @sets.in_diff(), @sets.in_sing(), @equal.gsym(@vectors.drop_eq())])), t2635), t2636), t2637), @canal.complex_diff_tac), t2638), t2639), t2640), t2642), t2643)
  let t2634 = @simp.simp_tac(@list.List([@topology.continuous_on_sub(), @topology.continuous_on_id(), @topology.continuous_on_const()]))
  let t2633 = @simp.rewrite_tac(@list.List([@canal.continuous_on_cx_lift(), @vectors.lift_sub(), @vectors.lift_drop()]))
  let t2632 = @tactics.match_mp_tac(@canal.continuous_on_complex_pow())
  let t2631 = @tactics.match_mp_tac(@canal.continuous_on_complex_lmul())
  let t2630 = @simp.asm_simp_tac(@list.List([lemma0, @vectors.drop_vec(), @realarith.real_pos()]))
  let t2647 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_complex_mul()), t2630), t2631), t2632), t2633), t2634), t2646, t2645])
  let t2672 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t2647), t2671])
  let t2629 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rneg(), @complexes.complex_ring(@term_syntax.parse_term("-Cx(real_of_num(0)) - (y : Cart[Real, 2]) == -y"))]))
  let t2628 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_mul_rzero(), @complexes.complex_sub_lzero()]))
  let t2627 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_0(), @real.real_sub_refl(), @complexes.complex_pow_zero(), @arith.add_eq_0(), @calc_num.arith()]))
  let t2626 = @simp.rewrite_tac(@list.List([@complexes.bilinear_complex_mul(), @vectors.drop_vec(), @realarith.real_pos(), @card.countable_sing()]))
  let t2617 = @term_syntax.parse_term("Cx(real_of_num(FACT((n : Num)))) / cproduct(op_dot_dot(0, n), (m : Num) => (z : Cart[Real, 2]) + Cx(real_of_num(1)) + Cx(real_of_num(m)))")
  let t2618 = @term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0)}")
  let t2619 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(1)")
  let t2620 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t2621 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => -pow(Cx(real_of_num(1) - drop(t)), (n : Num))")
  let t2622 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => (z : Cart[Real, 2]) * cpow(Cx(drop(t)), z - Cx(real_of_num(1)))")
  let t2623 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => Cx(real_of_num(1)) / Cx(real_of_num((n : Num)) + real_of_num(1)) * pow(Cx(real_of_num(1) - drop(t)), n + 1)")
  let t2624 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => cpow(Cx(drop(t)), (z : Cart[Real, 2]))")
  let t2625 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("complex_mul"), t2624, t2623, t2622, t2621, t2620, t2619, t2618, t2617]), @integration.integration_by_parts()))
  let t2616 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_cx(), @complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) + Cx(real_of_num(1)) - Cx(real_of_num(1)) == z"))]))
  let t2613 = @term_syntax.parse_term("(z : Cart[Real, 2]) + Cx(real_of_num(1))")
  let t2673 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2611 = @tactics.mp_tac(x2610)
      fn(x2612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2611(x2612)
      }
    })(((x2614 : @kernel.Thm) => @bool.spec(t2613, x2614))(x2615))
  }), t2616), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_tac])), t2625), t2626), t2627), t2628), t2629), @tactics.ants_tac), t2672)
  let t2607 = @tactics.conv_tac(@complexes.complex_field)
  let t2606 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t2605 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx()]))
  let t2604 = @tactics.match_mp_tac(@canal.has_vector_derivative_real_complex())
  let t2603 = @simp.rewrite_tac(@list.List([@complexes.cx_sub()]))
  let t2602 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2608 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()])), t2602), t2603), t2604), @canal.complex_diff_tac), t2605), t2606), t2607)
  let t2601 = @simp.asm_rewrite_tac(@list.List([@vectors.drop_vec(), @realarith.real_pos()]))
  let t2600 = @tactics.match_mp_tac(lemma0)
  let t2609 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_complex_rmul()), t2600), t2601), t2608])
  let t2599 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t2598 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2597 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_add_rid(), @complexes.complex_sub_rzero()]))
  let t2596 = @simp.rewrite_tac(@list.List([@vectors.drop_vec(), @transcendentals.cpow_1(), @transcendentals.cpow_0(), @arith.fact(), @complexes.complex_div()]))
  let t2592 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(1)")
  let t2593 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t2594 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => cpow(Cx(drop(t)), (z : Cart[Real, 2]) - Cx(real_of_num(1)))")
  let t2595 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(t : Cart[Real, Unit]) => cpow(Cx(drop(t)), (z : Cart[Real, 2])) / z"), t2594, t2593, t2592]), @integration.fundamental_theorem_of_calculus_interior()))
  let t2674 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_pow(), @complexes.complex_mul_rid(), @complexes.cproduct_clauses_numseg()])), t2595), t2596), t2597), t2598), t2599), @tactics.conj_tac), t2609), t2673])
  let t2591 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx(), @realarith.real_lt_refl()]))
  let t2590 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t2675 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))), t2590), t2591), @tactics.disch_tac), t2674)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ z : Cart[Real, 2], real_of_num(0) < Re(z) → has_integral((t : Cart[Real, Unit]) => cpow(Cx(drop(t)), z - Cx(real_of_num(1))) * pow(Cx(real_of_num(1) - drop(t)), n), Cx(real_of_num(FACT(n))) / cproduct(op_dot_dot(0, n), (m : Num) => z + Cx(real_of_num(m))), interval([(vec(0), vec(1))]))"), t2675)
  let t2736 = @simp.asm_simp_tac(@list.List([@real.real_div_lmul(), @realax.real_of_num_eq(), @arith.le_1()]))
  let t2735 = @simp.asm_simp_tac(@list.List([@complexes.real_cx(), @complexes.re_cx(), @real.real_le_div(), @realarith.real_pos(), @equal.gsym(@complexes.cx_mul())]))
  let t2734 = @impconv.imp_rewrite_tac(@list.List([@equal.gsym(@transcendentals.cpow_mul_real())]))
  let t2733 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc(), @calc_rat.real_arith(@term_syntax.parse_term("inv((x : Real)) * (y : Real) == y / x"))]))
  let t2732 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t2731 = @simp.rewrite_tac(@list.List([@vectors.forall_lift(), @topology.in_interval_1(), @vectors.lift_drop(), @vectors.drop_vec()]))
  let t2730 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.has_integral_eq()))
  let t2729 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) - Cx(real_of_num(1)) + Cx(real_of_num(1)) == z"))]))
  let t2728 = @simp.rewrite_tac(@list.List([@vectors.drop_vec(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool))} == s"))]))
  let t2726 = @equal.gsym(@topology.in_interval_1())
  let t2727 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_vec()), @vectors.lift_drop(), t2726]))
  let t2725 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@sets.inter_comm()]))(@sets.inter()), @sets.in_elim_thm()]))
  let t2723 = @equal.gsym(@vectors.lift_eq_cmul())
  let t2724 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_mul_assoc()), t2723]))
  let t2722 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc(), @equal.gsym(@simp.once_rewrite_rule(@list.List([@complexes.complex_mul_sym()]))(@transcendentals.cpow_suc()))]))
  let t2719 = @drule.match_mp(@canal.has_integral_complex_lmul())
  let t2716 = @term_syntax.parse_term("cpow(Cx(real_of_num((n : Num))), (z : Cart[Real, 2]) - Cx(real_of_num(1)))")
  let t2721 = @tactics.disch_then(fn(x2720 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2713 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2714 = @tactics.mp_tac(x2713)
        fn(x2715 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2714(x2715)
        }
      })(((x2717 : @kernel.Thm) => @bool.spec(t2716, x2717))(x2718))
    })(t2719(x2720))
  })
  let t2712 = @simp.rewrite_tac(@list.List([@vectors.drop_cmul(), @complexes.complex_cmul()]))
  let t2711 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_neg_0(), @vectors.vector_add_rid()]))
  let t2710 = @simp.rewrite_tac(@list.List([@topology.unit_interval_nonempty(), @vectors.vector_add_rid(), @calc_int.real_abs_num()]))
  let t2709 = @simp.rewrite_tac(@list.List([@topology.image_affinity_interval(), @real.real_inv_inv(), @realarith.real_pos()]))
  let t2708 = @simp.asm_simp_tac(@list.List([@real.real_inv_eq_0(), @realax.real_of_num_eq(), @arith.le_1(), @real.real_abs_inv()]))
  let t2707 = @simp.rewrite_tac(@list.List([@cart.dimindex_1(), @real.real_pow_1()]))
  let t2704 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.has_integral_affinity()))
  let t2700 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t2701 = @list.List([@term_syntax.parse_term("inv(real_of_num((n : Num)))"), t2700])
  let t2706 = @tactics.disch_then(fn(x2705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2697 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2698 = @tactics.mp_tac(x2697)
        fn(x2699 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2698(x2699)
        }
      })(((x2702 : @kernel.Thm) => @bool.specl(t2701, x2702))(x2703))
    })(t2704(x2705))
  })
  let t2694 = @drule.match_mp(lemma1)
  let t2691 = @term_syntax.parse_term("(n : Num)")
  let t2696 = @tactics.first_assum(fn(x2695 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2693 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2688 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2689 = @tactics.mp_tac(x2688)
        fn(x2690 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2689(x2690)
        }
      })(((x2692 : @kernel.Thm) => @bool.spec(t2691, x2692))(x2693))
    })(t2694(x2695))
  })
  let t2687 = @simp.rewrite_tac(@list.List([@integration.has_integral_restrict_inter()]))
  let t2686 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(drop((x : Cart[Real, Unit])) <= (b : Real)) == IN(x, {(x : Cart[Real, Unit]) | drop(x) <= b})"))]))
  let t2685 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())]))
  let t2737 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2685), t2686), t2687), t2696), t2706), t2707), t2708), t2709), t2710), t2711), t2712), t2721), t2722), t2724), t2725), t2727), t2728), t2729), t2730), t2731), t2732), @tactics.strip_tac), t2733), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2734), t2735), t2736)
  let t2684 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_sing(), @equal.gsym(@vectors.drop_eq()), @vectors.drop_vec(), @sets.in_elim_thm()]))
  let t2683 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @integration.has_integral_0(), @integration.negligible_sing()]))
  let t2681 = @term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0)}")
  let t2682 = @tactics.map_every(fn(x2678 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2679 = @tactics.exists_tac(x2678)
    fn(x2680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2679(x2680)
    }
  }, @list.List([@term_syntax.parse_term("(t : Cart[Real, Unit]) => Cx(real_of_num(0))"), t2681]))
  let t2677 = @tactics.match_mp_tac(@integration.has_integral_spike())
  let t2738 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@transcendentals.cpow_0(), @complexes.complex_mul_lzero(), @complexes.complex_div()])), t2677), t2682), t2683), t2684), @calc_rat.real_arith_tac), t2737])
  let t2676 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t2739 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2676), t2738)
  let lemma2 = @tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ n : Num, real_of_num(0) < Re(z) → has_integral((t : Cart[Real, Unit]) => if drop(t) <= real_of_num(n) { cpow(Cx(drop(t)), z - Cx(real_of_num(1))) * pow(Cx(real_of_num(1) - drop(t) / real_of_num(n)), n) } else { Cx(real_of_num(0)) }, cpow(Cx(real_of_num(n)), z) * Cx(real_of_num(FACT(n))) / cproduct(op_dot_dot(0, n), (m : Num) => z + Cx(real_of_num(m))), {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)})"), t2739)
  let t2748 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul(), @vectors.lift_add()]))
  let t2747 = @simp.asm_rewrite_tac(@list.List([@vectors.linear(), @complexes.complex_cmul(), @trivia.o_thm(), @complexes.re_add(), @complexes.re_mul_cx()]))
  let t2745 = @tactics.match_mp_tac(@integration.integral_linear())
  let t2746 = @list.List([@tactics.match_mp_tac(@integration.integrable_linear()), t2745])
  let t2744 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2743 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@trivia.o_def())]))
  let t2742 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t2749 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], lift(Re(z)) == o(lift, Re, z)"), fn(x2740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2740
    @simp.rewrite_tac(@list.List([th_2]))
  }), t2742), t2743), t2744), t2746), t2747), t2748)
  let lemma3 = @tactics.prove(@term_syntax.parse_term("integrable_on((f : (Cart[Real, N]) -> Cart[Real, 2]), (s : (Cart[Real, N]) -> Bool)) → integrable_on((x : Cart[Real, N]) => lift(Re(f(x))), s) && integral(s, (x : Cart[Real, N]) => lift(Re(f(x)))) == lift(Re(integral(s, f)))"), t2749)
  let t2857 = @meson.meson_tac(@list.List([@complexes.complex_norm_ge_re_im(), @realax.real_le_trans()]))
  let t2856 = @simp.rewrite_tac(@list.List([@topology.bounded(), @sets.forall_in_image(), @sets.in_univ()]))
  let t2855 = @bool.spec(@term_syntax.parse_term("Cx(Re((z : Cart[Real, 2])))"), cgamma_v1())
  let t2858 = @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@drule.match_mp(@topology.convergent_imp_bounded())(t2855)), t2856), t2857)
  let t2852 = @simp.rewrite_tac(@list.List([@cauchy.exp_limit()]))
  let t2851 = @simp.rewrite_tac(@list.List([@equal.gsym(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@realanalysis.tendsto_real_v1()))]))
  let t2850 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_neg())]))
  let t2849 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) - (t : Real) * inv((x : Real)) == real_of_num(1) + -t / x"))]))
  let t2848 = @tactics.match_mp_tac(@topology.lim_cmul())
  let t2847 = @simp.rewrite_tac(@list.List([@realax.real_div(), @vectors.lift_cmul(), @complexes.re_cx()]))
  let t2841 = @equal.gsym(@complexes.cx_pow())
  let t2842 = @equal.gsym(@complexes.cx_inv())
  let t2843 = @equal.gsym(@complexes.cx_mul())
  let t2844 = @equal.gsym(@transcendentals.cx_log())
  let t2845 = @equal.gsym(@transcendentals.cx_exp())
  let t2846 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj(), @equal.gsym(@complexes.cx_sub()), t2845, t2844, @realarith.real_lt_le(), t2843, t2842, @complexes.re_cx(), t2841]))
  let t2840 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_div(), @topology.lim_const()]))
  let t2839 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Real) == real_of_num(0)"))
  let t2853 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj()])), t2839), t2840), t2846), t2847), t2848), t2849), t2850), t2851), t2852)
  let t2838 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2837 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially(), @equal.gsym(@realax.real_of_num_le())]))
  let t2854 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : Real) + real_of_num(1)"), @real.real_arch_simple())), t2837), t2838), @calc_rat.real_arith_tac), t2853])
  let t2836 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) => lift(Re(cpow(Cx((t : Real)), Cx(Re((z : Cart[Real, 2]))) - Cx(real_of_num(1))) * pow(Cx(real_of_num(1) - t / real_of_num(k)), k)))"))
  let t2835 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t2834 = @simp.rewrite_tac(@list.List([]))
  let t2859 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)")), @tactics.disch_tac), t2834), t2835), t2836), @tactics.conj_tac), t2854)
  let t2831 = @simp.simp_tac(@list.List([@real.real_le_ldiv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))]))
  let t2830 = @simp.rewrite_tac(@list.List([@realarith.real_sub_le()]))
  let t2829 = @tactics.match_mp_tac(@real.real_pow_le())
  let t2828 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_le()]))
  let t2827 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2832 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.rewrite_tac(@list.List([@realax.real_le_refl(), @complexes.re_cx()]))), t2827), t2828), t2829), t2830), t2831), @calc_rat.asm_real_arith_tac)
  let t2826 = @tactics.match_mp_tac(@realanalysis.real_exp_limit_rpow_le())
  let t2824 = @equal.gsym(@real.real_of_num_suc())
  let t2825 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.rpow_pow()), t2824]))
  let t2833 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@complexes.re_cx(), @real.real_le_lmul_eq(), @transcendentals.real_exp_pos_lt()])), t2825), t2826), @calc_rat.asm_real_arith_tac), t2832])
  let t2823 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (n : Real) → x <= n + real_of_num(1)"))]))
  let t2822 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Real) <= real_of_num((n : Num))"))
  let t2821 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc())]))
  let t2815 = @equal.gsym(@complexes.cx_pow())
  let t2816 = @equal.gsym(@complexes.cx_div())
  let t2817 = @equal.gsym(@complexes.cx_mul())
  let t2818 = @equal.gsym(@transcendentals.cx_log())
  let t2819 = @equal.gsym(@transcendentals.cx_exp())
  let t2820 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj(), @equal.gsym(@complexes.cx_sub()), t2819, t2818, @realarith.real_lt_le(), t2817, t2816, @complexes.re_cx(), t2815]))
  let t2814 = @simp.asm_rewrite_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj()]))
  let t2813 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_0(), @complexes.complex_mul_lzero(), @class.cond_id(), @realax.real_le_refl()]))
  let t2812 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Real) == real_of_num(0)"))
  let t2811 = @term_syntax.parse_term("(t : Real)")
  let t2860 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t2811])), @tactics.disch_tac), t2812), t2813), t2814), t2820), t2821), t2822), t2823), t2833), t2859, t2858])
  let t2810 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2809 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @vectors.forall_lift(), @vectors.lift_drop(), @vectors.norm_lift()]))
  let t2808 = @simp.asm_simp_tac(@list.List([lemma3, @simp.rewrite_rule(@list.List([@integration.has_integral_integrable_integral()]))(lemma2), @complexes.re_cx(), @topology.bounded(), @sets.forall_in_gspec()]))
  let t2807 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t2806 = @simp.rewrite_tac(@list.List([]))
  let t2803 = @term_syntax.parse_term("{(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}")
  let t2804 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => lift(Re(cpow(Cx(drop(t)), Cx(Re((z : Cart[Real, 2]))) - Cx(real_of_num(1))) / cexp(Cx(drop(t)))))")
  let t2805 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (t : Cart[Real, Unit]) => lift(Re(if drop(t) <= real_of_num(n) { cpow(Cx(drop(t)), Cx(Re((z : Cart[Real, 2]))) - Cx(real_of_num(1))) * pow(Cx(real_of_num(1) - drop(t) / real_of_num(n)), n) } else { Cx(real_of_num(0)) }))"), t2804, t2803]), @integration.monotone_convergence_increasing()))
  let t2798 = @simp.rewrite_tac(@list.List([@cauchy.cexp_limit()]))
  let t2797 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("(a : Cart[Real, 2]) - (x : Cart[Real, 2]) / (y : Cart[Real, 2]) == a + -x / y"))]))
  let t2796 = @simp.rewrite_tac(@list.List([@complexes.cx_sub(), @complexes.cx_div(), @equal.gsym(@transcendentals.cexp_neg())]))
  let t2795 = @tactics.match_mp_tac(@canal.lim_complex_lmul())
  let t2799 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div()])), t2795), t2796), t2797), t2798)
  let t2794 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2793 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially(), @equal.gsym(@realax.real_of_num_le())]))
  let t2800 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : Real) + real_of_num(1)"), @real.real_arch_simple())), t2793), t2794), @calc_rat.real_arith_tac), t2799])
  let t2792 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) => cpow(Cx((t : Real)), (z : Cart[Real, 2]) - Cx(real_of_num(1))) * pow(Cx(real_of_num(1) - t / real_of_num(k)), k)"))
  let t2791 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t2790 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t2801 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.forall_lift(), @vectors.lift_drop()])), t2790), @tactics.disch_tac), t2791), t2792), @tactics.conj_tac), t2800)
  let t2787 = @simp.asm_simp_tac(@list.List([@real.real_div_lmul(), @realax.real_of_num_eq(), @realax.real_le_refl()]))
  let t2786 = @equal.gsym(@transcendentals.real_exp_neg())
  let t2788 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_n()), t2786])), t2787)
  let t2785 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) - (t : Real) / (n : Real) == real_of_num(1) + -t / n")), @transcendentals.real_exp_le_x()]))
  let t2784 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_le(), @real.real_le_ldiv_eq(), @realax.real_mul_lid(), @real.real_of_num_lt(), @arith.le_1()]))
  let t2789 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le2()), t2784), t2785), t2788])
  let t2782 = @term_syntax.parse_term("pow(exp(-(t : Real) / real_of_num((n : Num))), n)")
  let t2783 = @tactics.trans_tac(@realax.real_le_trans())(t2782)
  let t2781 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @realarith.real_sub_le(), @real.real_le_ldiv_eq(), @realax.real_mul_lid(), @real.real_of_num_lt(), @arith.le_1()]))
  let t2780 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @realax.real_of_num_eq()]))
  let t2779 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num((n : Num)) == real_of_num(0))"), fn(x2776 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2777 = @tactics.mp_tac(x2776)
    fn(x2778 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2777(x2778)
    }
  })
  let t2775 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t2774 = @simp.simp_tac(@list.List([@real.real_le_lmul_eq(), @transcendentals.real_exp_pos_lt()]))
  let t2773 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t2772 = @simp.rewrite_tac(@list.List([@complexes.re_mul_cx(), @complexes.re_sub(), @complexes.re_cx(), @complexes.complex_norm_pow()]))
  let t2771 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @transcendentals.real_exp_sub(), @transcendentals.norm_cexp()]))
  let t2770 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_0(), @transcendentals.real_exp_pos_le()]))
  let t2764 = @equal.gsym(@transcendentals.real_exp_sub())
  let t2765 = @equal.gsym(@complexes.cx_div())
  let t2766 = @equal.gsym(@complexes.cx_mul())
  let t2767 = @equal.gsym(@complexes.cx_sub())
  let t2768 = @equal.gsym(@transcendentals.cx_exp())
  let t2769 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @realarith.real_lt_le(), t2768, t2767, t2766, @complexes.re_cx(), t2765, t2764]))
  let t2763 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @class.cond_id(), @complexes.re_cx(), @transcendentals.cexp_0(), @complexes.complex_div_1(), @complexes.complex_norm_0(), @realax.real_le_refl()]))
  let t2762 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Real) == real_of_num(0)"))
  let t2761 = @simp.rewrite_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj()]))
  let t2759 = @term_syntax.parse_term("(t : Real)")
  let t2760 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t2759]))
  let t2802 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.forall_lift(), @vectors.lift_drop()])), t2760), @tactics.disch_tac), t2761), t2762), t2763), t2769), @class.cond_cases_tac), t2770), t2771), t2772), t2773), t2774), t2775), t2779), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2780), @tactics.disch_tac), t2781), t2783), @tactics.conj_tac), t2789), t2801])
  let t2758 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2757 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.lift_drop()]))
  let t2755 = @meson.meson_tac(@list.List([cgamma_v1(), @topology.lim_unique(), @metric.trivial_limit_sequentially()]))
  let t2756 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.simp_tac(@list.List([@integration.has_integral_integrable_integral()])), t2755)])
  let t2754 = @simp.asm_simp_tac(@list.List([@simp.rewrite_rule(@list.List([@integration.has_integral_integrable_integral()]))(lemma2)]))
  let t2750 = @term_syntax.parse_term("{(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}")
  let t2751 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => lift(Re(cpow(Cx(drop(t)), Cx(Re((z : Cart[Real, 2]))) - Cx(real_of_num(1))) / cexp(Cx(drop(t)))))")
  let t2752 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => cpow(Cx(drop(t)), (z : Cart[Real, 2]) - Cx(real_of_num(1))) / cexp(Cx(drop(t)))")
  let t2753 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (t : Cart[Real, Unit]) => if drop(t) <= real_of_num(n) { cpow(Cx(drop(t)), (z : Cart[Real, 2]) - Cx(real_of_num(1))) * pow(Cx(real_of_num(1) - drop(t) / real_of_num(n)), n) } else { Cx(real_of_num(0)) }"), t2752, t2751, t2750]), @integration.dominated_convergence()))
  let t2861 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2753), t2754), @tactics.ants_tac), t2756), t2757), t2758), t2802), t2805), t2806), @tactics.ants_tac), t2807), t2808), t2809), t2810), t2860)
  euler_has_integral_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(z) → has_integral((t : Cart[Real, Unit]) => cpow(Cx(drop(t)), z - Cx(real_of_num(1))) / cexp(Cx(drop(t))), cgamma(z), {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)})"), t2861))
}

///|
let euler_has_integral_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_HAS_INTEGRAL_CGAMMA")

///|
/// `EULER_HAS_INTEGRAL_CGAMMA`
pub fn euler_has_integral_cgamma() -> @kernel.Thm {
  euler_has_integral_cgamma_c.get()
}

///|
/// EULER_INTEGRAL
fn step_71() -> Unit raise {
  let t2862 = @meson.meson_tac(@list.List([@integration.integral_unique(), euler_has_integral_cgamma()]))
  euler_integral_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(z) → integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => cpow(Cx(drop(t)), z - Cx(real_of_num(1))) / cexp(Cx(drop(t)))) == cgamma(z)"), t2862))
}

///|
let euler_integral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_INTEGRAL")

///|
/// `EULER_INTEGRAL`
pub fn euler_integral() -> @kernel.Thm {
  euler_integral_c.get()
}

///|
/// EULER_INTEGRABLE
fn step_72() -> Unit raise {
  let t2863 = @meson.meson_tac(@list.List([euler_has_integral_cgamma(), @integration.integrable_on()]))
  euler_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(z) → integrable_on((t : Cart[Real, Unit]) => cpow(Cx(drop(t)), z - Cx(real_of_num(1))) / cexp(Cx(drop(t))), {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)})"), t2863))
}

///|
let euler_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_INTEGRABLE")

///|
/// `EULER_INTEGRABLE`
pub fn euler_integrable() -> @kernel.Thm {
  euler_integrable_c.get()
}

///|
/// EULER_HAS_REAL_INTEGRAL_GAMMA
fn step_73() -> Unit raise {
  let t2890 = @equal.gsym(@complexes.cx_div())
  let t2891 = @equal.gsym(@complexes.cx_mul())
  let t2892 = @equal.gsym(@transcendentals.cx_exp())
  let t2893 = @equal.gsym(@complexes.cx_sub())
  let t2894 = @simp.simp_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj(), @transcendentals.rpow(), @realarith.real_lt_le(), @equal.gsym(@transcendentals.cx_log()), t2893, t2892, t2891, @complexes.re_cx(), t2890]))
  let t2889 = @simp.rewrite_tac(@list.List([@integration.negligible_sing(), @vectors.forall_lift(), @sets.in_diff(), @sets.in_elim_thm(), @vectors.lift_drop(), @sets.in_sing(), @equal.gsym(@vectors.drop_eq()), @vectors.drop_vec()]))
  let t2888 = @tactics.exists_tac(@term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0)}"))
  let t2886 = @simp.rewrite_rule(@list.List([@theorems.conj_assoc()]))(@integration.has_integral_spike())
  let t2887 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(t2886))
  let t2884 = @meson.meson_tac(@list.List([@vectors.lift_drop()]))
  let t2883 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.lift_drop()]))
  let t2885 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.surjective_image_eq()), t2883), t2884), @tactics.all_tac])
  let t2882 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(lift, {(t : Real) | real_of_num(0) <= t}) == {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}"), fn(x2879 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2880 = @tactics.subst1_tac(x2879)
    fn(x2881 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2880(x2881)
    }
  })
  let t2877 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul()]))
  let t2878 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.linear(), @complexes.re_add(), @vectors.lift_add(), @complexes.complex_cmul(), @complexes.re_mul_cx()])), t2877), @tactics.all_tac])
  let t2876 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t2873 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.has_integral_linear()))
  let t2870 = @term_syntax.parse_term("o(lift, Re)")
  let t2875 = @tactics.disch_then(fn(x2874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2872 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2867 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2868 = @tactics.mp_tac(x2867)
        fn(x2869 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2868(x2869)
        }
      })(((x2871 : @kernel.Thm) => @bool.ispec(t2870, x2871))(x2872))
    })(t2873(x2874))
  })
  let t2866 = @simp.asm_rewrite_tac(@list.List([gamma(), @trivia.o_def(), @complexes.re_cx()]))
  let t2865 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx((x : Real))"), euler_has_integral_cgamma()))
  let t2864 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral()]))
  let t2895 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2864), t2865), t2866), t2875), t2876), @tactics.ants_tac), t2878), t2882), t2885), t2887), t2888), t2889), t2894)
  euler_has_real_integral_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → has_real_integral((t : Real) => rpow(t, x - real_of_num(1)) / exp(t), gamma(x), {(t : Real) | real_of_num(0) <= t})"), t2895))
}

///|
let euler_has_real_integral_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_HAS_REAL_INTEGRAL_GAMMA")

///|
/// `EULER_HAS_REAL_INTEGRAL_GAMMA`
pub fn euler_has_real_integral_gamma() -> @kernel.Thm {
  euler_has_real_integral_gamma_c.get()
}

///|
/// EULER_REAL_INTEGRAL
fn step_74() -> Unit raise {
  let t2896 = @meson.meson_tac(@list.List([@realanalysis.real_integral_unique(), euler_has_real_integral_gamma()]))
  euler_real_integral_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → real_integral({(t : Real) | real_of_num(0) <= t}, (t : Real) => rpow(t, x - real_of_num(1)) / exp(t)) == gamma(x)"), t2896))
}

///|
let euler_real_integral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_REAL_INTEGRAL")

///|
/// `EULER_REAL_INTEGRAL`
pub fn euler_real_integral() -> @kernel.Thm {
  euler_real_integral_c.get()
}

///|
/// EULER_REAL_INTEGRABLE
fn step_75() -> Unit raise {
  let t2897 = @meson.meson_tac(@list.List([euler_has_real_integral_gamma(), @realanalysis.real_integrable_on()]))
  euler_real_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → real_integrable_on((t : Real) => rpow(t, x - real_of_num(1)) / exp(t), {(t : Real) | real_of_num(0) <= t})"), t2897))
}

///|
let euler_real_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_REAL_INTEGRABLE")

///|
/// `EULER_REAL_INTEGRABLE`
pub fn euler_real_integrable() -> @kernel.Thm {
  euler_real_integrable_c.get()
}

///|
/// EULER_ORIGINAL_REAL_INTEGRABLE
fn step_76() -> Unit raise {
  let t3079 = @tactics.match_mp_tac(@transcendentals.rpow_mono_le())
  let t3078 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.rpow_pow())]))
  let t3080 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (z : Real) → x <= max((y : Real), z)"))), t3078), t3079), @calc_rat.asm_real_arith_tac)
  let t3077 = @tactics.match_mp_tac(@transcendentals.rpow_1_le())
  let t3081 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) → x <= max(y, (z : Real))"))), t3077), @calc_rat.asm_real_arith_tac), t3080])
  let t3076 = @class.asm_cases_tac(@term_syntax.parse_term("-log((t : Real)) <= real_of_num(1)"))
  let t3074 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @transcendentals.rpow_pos_le()]))
  let t3073 = @tactics.match_mp_tac(@real.real_inv_1_le())
  let t3072 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t3075 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_inv())])), t3072), t3073), @calc_rat.asm_real_arith_tac), t3074])
  let t3071 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= -log((t : Real))"), fn(x3068 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3069 = @tactics.assume_tac(x3068)
    fn(x3070 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3069(x3070)
    }
  })
  let t3067 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (t : Real)"), fn(x3064 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3065 = @tactics.assume_tac(x3064)
    fn(x3066 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3065(x3066)
    }
  })
  let t3063 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t3082 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval(), @sets.in_diff(), @sets.in_sing()])), t3063), @tactics.strip_tac), t3067), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3071), t3075), t3076), t3081)
  let t3062 = @simp.asm_rewrite_tac(@list.List([]))
  let t3061 = @tactics.match_mp_tac(@real.real_inv_1_le())
  let t3060 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t3059 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_inv())]))
  let t3058 = @tactics.match_mp_tac(@real.real_pow_le())
  let t3057 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) <= (c : Real) → min((a : Real), b) <= c")))
  let t3056 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (t : Real)"), fn(x3053 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3054 = @tactics.assume_tac(x3053)
    fn(x3055 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3054(x3055)
    }
  })
  let t3052 = @simp.asm_rewrite_tac(@list.List([]))
  let t3051 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Real) == real_of_num(0)"))
  let t3050 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t3049 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t3048 = @simp.asm_rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_const()]))
  let t3047 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => min(pow(-log(real_of_num(0)), (n : Num)), real_of_num(0))"))
  let t3046 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_absolutely_real_integrable_lbound())
  let t3045 = @simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_const()]))
  let t3044 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_max())
  let t3083 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable()), t3044), t3045), t3046), t3047), t3048), t3049), t3050), @tactics.strip_tac), t3051), t3052), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3056), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3057), t3058), t3059), t3060), t3061), t3062)
  let t3043 = @simp.rewrite_tac(@list.List([@real.real_pow_1()]))
  let t3039 = @term_syntax.parse_term("1")
  let t3042 = @tactics.first_x_assum(fn(x3041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3036 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3037 = @tactics.mp_tac(x3036)
      fn(x3038 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3037(x3038)
      }
    })(((x3040 : @kernel.Thm) => @bool.spec(t3039, x3040))(x3041))
  })
  let t3035 = @tactics.match_mp_tac(@realanalysis.integrable_imp_real_measurable())
  let t3034 = @simp.asm_rewrite_tac(@list.List([]))
  let t3084 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_measurable_on_rpow()), t3034), t3035), t3042), t3043), t3083, t3082])
  let t3033 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3032 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing()]))
  let t3031 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t3030 = @tactics.exists_tac(@term_syntax.parse_term("(t : Real) => max(real_of_num(1), pow(-log(t), (n : Num)))"))
  let t3029 = @tactics.match_mp_tac(@realanalysis.real_measurable_bounded_ae_by_integrable_imp_integrable())
  let t3026 = @term_syntax.parse_term("(n : Num)")
  let t3028 = @tactics.disch_then((x3027 : @kernel.Thm) => @tactics.x_choose_tac(t3026, x3027))
  let t3025 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), @real.real_arch_simple()))
  let t3024 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3023 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → real_integrable_on((t : Real) => rpow(-log(t), x), real_interval([(real_of_num(0), real_of_num(1))]))"), fn(x3021 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3021
    @meson.asm_meson_tac(@list.List([th_1]))
  })
  let t3017 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt(), @arith.lt_0()]))
  let t3016 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3018 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_imp()), t3016), t3017)
  let t3019 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc())])), @calc_rat.real_arith_tac), t3018])
  let t3015 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((n : Num)) == real_of_num(SUC(n)) - real_of_num(1)"), fn(x3012 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3013 = @tactics.subst1_tac(x3012)
    fn(x3014 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3013(x3014)
    }
  })
  let t3011 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3010 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.rpow_pow())]))
  let t3009 = @simp.rewrite_tac(@list.List([@bool.conjunct1(@realax.real_pow()), @realanalysis.real_integrable_const()]))
  let t3020 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@nums.num_induction()), t3009), t3010), t3011), t3015), t3019), @tactics.all_tac])
  let t3008 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, real_integrable_on((t : Real) => pow(-log(t), n), real_interval([(real_of_num(0), real_of_num(1))]))"), fn(x3005 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3006 = @tactics.assume_tac(x3005)
    fn(x3007 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3006(x3007)
    }
  })
  let t3001 = @tactics.conv_tac(@calc_rat.real_field)
  let t3000 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing(), @sets.in_diff(), @sets.in_sing()]))
  let t2999 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t2998 = @tactics.match_mp_tac(@realanalysis.real_integrable_spike_eq())
  let t2997 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2996 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_lmul_eq()]))
  let t2995 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t2994 = @tactics.disch_then(fn(x2991 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2992 = @tactics.subst1_tac(x2991)
    fn(x2993 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2992(x2993)
    }
  })
  let t3002 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@realanalysis.real_integrable_lmul_eq(), @real.real_inv_eq_0()])), t2994), t2995), t2996), t2997), t2998), t2999), t3000), t3001)
  let t2989 = @tactics.conv_tac(@calc_rat.real_field)
  let t2988 = @tactics.repeat_tac(@tactics.pop_assum(fn(x2985 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2986 = @tactics.mp_tac(x2985)
    fn(x2987 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2986(x2987)
    }
  }))
  let t2984 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_inv()), @real.real_inv_1_lt(), @transcendentals.log_pos_lt()]))
  let t2983 = @simp.asm_rewrite_tac(@list.List([]))
  let t2982 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t2981 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t2990 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()])), t2981), t2982), @tactics.strip_tac), @tactics.conj_tac), @realanalysis.real_diff_tac), t2983), t2984), t2988), t2989)
  let t2973 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_x_times_log()]))
  let t2972 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t2974 = @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@transcendentals.rpow_zero(), @real.real_inv_eq_0()])), t2972), t2973)
  let t2971 = @meson.meson_tac(@list.List([@real.real_lt_01()]))
  let t2970 = @simp.simp_tac(@list.List([@transcendentals.rpow_pos_le(), @misc.in_real_interval(), @sets.in_elim_thm()]))
  let t2975 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()])), t2970), t2971)
  let t2969 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_atreal(), @realanalysis.reallim_atreal_withinreal()]))
  let t2968 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("real_of_num(0)"), @realanalysis.real_continuous_at_id()))
  let t2967 = @simp.asm_simp_tac(@list.List([@realanalysis.real_continuous_at_rpow(), @realarith.real_lt_imp_le(), @real.real_le_inv_eq()]))
  let t2966 = @bool.ispec(@term_syntax.parse_term("(y : Real) => rpow(y, (x : Real))"), @realanalysis.reallim_real_continuous_function())
  let t2976 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([]))(t2966)), t2967), t2968), t2969), t2975, t2974])
  let t2965 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2964 = @simp.asm_rewrite_tac(@list.List([@realarith.real_entire(), @transcendentals.rpow_eq_0(), @real.real_inv_eq_0()]))
  let t2963 = @tactics.exists_tac(@term_syntax.parse_term("rpow(real_of_num(0), inv((x : Real)))"))
  let t2962 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Real) | real_of_num(0) <= x}"))
  let t2961 = @tactics.match_mp_tac(@realanalysis.reallim_compose_within())
  let t2960 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t2959 = @tactics.subgoal_then(@term_syntax.parse_term("((y : Real) => log(rpow(y, inv((x : Real)))) * rpow(y, inv(x))) == o((y : Real) => log(y) * y, (y : Real) => rpow(y, inv(x)))"), fn(x2956 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2957 = @tactics.subst1_tac(x2956)
    fn(x2958 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2957(x2958)
    }
  })
  let t2955 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t2954 = @simp.asm_simp_tac(@list.List([@realanalysis.real_continuous_at_rpow(), @realarith.real_lt_imp_le()]))
  let t2952 = @bool.ispec(@term_syntax.parse_term("(y : Real) => rpow(y, (x : Real))"), @realanalysis.reallim_real_continuous_function())
  let t2953 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([]))(t2952))
  let t2951 = @list.List([@simp.asm_simp_tac(@list.List([@transcendentals.rpow(), @real.real_lt_imp_nz(), @realarith.real_lt_refl()])), @tactics.all_tac])
  let t2977 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) == rpow(real_of_num(0), (x : Real))"), fn(x2946 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2946
    @simp.gen_rewrite_tac(fn(x2948 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2949 = @equal.land_conv(x2948)
      fn(x2950 : @kernel.Term) -> @kernel.Thm raise {
        s2949(x2950)
      }
    }, @list.List([th]))
  }), t2951), t2953), t2954), t2955), t2959), t2960), t2961), t2962), t2963), t2964), t2965), t2976)
  let t2945 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t2944 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_mul(), @transcendentals.rpow_rpow(), @realax.real_mul_linv()]))
  let t2943 = @simp.asm_simp_tac(@list.List([@transcendentals.log_rpow(), @real.real_lt_inv_eq(), @calc_rat.real_field(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) → -x * (inv(x) * (y : Real) * (z : Real)) == -y * z"))]))
  let t2942 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (y : Real)"), fn(x2939 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2940 = @tactics.assume_tac(x2939)
    fn(x2941 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2940(x2941)
    }
  })
  let t2938 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t2937 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t2936 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t2935 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t2934 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < abs((x : Real) - (a : Real))) == !(x == a)"))]))
  let t2978 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()])), t2934), t2935), t2936), t2937), t2938), @tactics.strip_tac), t2942), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2943), t2944), t2945), t2977])
  let t2933 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real) => rpow(-(x : Real) * (log(rpow(y, inv(x))) * rpow(y, inv(x))), x)"))
  let t2932 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t2931 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_withinreal(), @calc_int.real_mul_rzero()]))
  let t2979 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2929 = @tactics.subst_all_tac(x2928)
    fn(x2930 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2929(x2930)
    }
  }), t2931), t2932), t2933), @tactics.conj_tac), t2978)
  let t2927 = @simp.asm_simp_tac(@list.List([@realarith.real_le_lt()]))
  let t2926 = @tactics.match_mp_tac(@realanalysis.real_continuous_at_rpow())
  let t2925 = @simp.asm_simp_tac(@list.List([@realanalysis.real_continuous_neg(), @realanalysis.real_continuous_at_id(), @realanalysis.real_continuous_at_log()]))
  let t2924 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_atreal_compose()), @tactics.conj_tac))
  let t2923 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t2922 = @tactics.subgoal_then(@term_syntax.parse_term("((y : Real) => rpow(-log(y), (x : Real))) == o((y : Real) => rpow(y, x), o((x : Real) => -x, log))"), fn(x2919 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2920 = @tactics.subst1_tac(x2919)
    fn(x2921 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2920(x2921)
    }
  })
  let t2918 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t2917 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_within_id()]))
  let t2980 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_mul()), t2917), t2918), t2922), t2923), t2924), t2925), t2926), t2927), t2979])
  let t2914 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(0) < x || x == real_of_num(0)")))
  let t2916 = @tactics.first_assum(fn(x2915 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t2914(x2915))
  })
  let t2913 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t2912 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t2911 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t2910 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_lmul())
  let t3003 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())])), t2910), t2911), t2912), t2913), @tactics.strip_tac), t2916), t2980), t2990])), t3002])
  let t2909 = @simp.rewrite_tac(@list.List([@card.countable_insert(), @card.countable_empty(), @realarith.real_mul_rid()]))
  let t2902 = @term_syntax.parse_term("{real_of_num(0), real_of_num(1)}")
  let t2903 = @term_syntax.parse_term("real_of_num(1)")
  let t2904 = @term_syntax.parse_term("real_of_num(0)")
  let t2905 = @term_syntax.parse_term("(t : Real) => real_of_num(1)")
  let t2906 = @term_syntax.parse_term("(t : Real) => -real_of_num(1) / t * rpow(-log(t), (x : Real) - real_of_num(1))")
  let t2907 = @term_syntax.parse_term("(t : Real) => t")
  let t2908 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(t : Real) => inv((x : Real)) * rpow(-log(t), x)"), t2907, t2906, t2905, t2904, t2903, t2902]), @realanalysis.real_integrable_by_parts_eq()))
  let t2901 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl()]))
  let t3004 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))), t2901), @tactics.disch_tac), t2908), t2909), @tactics.ants_tac), t3003), @tactics.all_tac])
  let t3085 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → real_integrable_on((t : Real) => rpow(-log(t), x - real_of_num(1)), real_interval([(real_of_num(0), real_of_num(1))])) == real_integrable_on((t : Real) => rpow(-log(t), x), real_interval([(real_of_num(0), real_of_num(1))]))"), fn(x2898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2899 = @tactics.assume_tac(x2898)
    fn(x2900 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2899(x2900)
    }
  }), t3004), t3008), t3020), t3023), t3024), @tactics.disch_tac), t3025), t3028), t3029), t3030), t3031), t3032), t3033), t3084)
  euler_original_real_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → real_integrable_on((t : Real) => rpow(-log(t), x - real_of_num(1)), real_interval([(real_of_num(0), real_of_num(1))]))"), t3085))
}

///|
let euler_original_real_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_ORIGINAL_REAL_INTEGRABLE")

///|
/// `EULER_ORIGINAL_REAL_INTEGRABLE`
pub fn euler_original_real_integrable() -> @kernel.Thm {
  euler_original_real_integrable_c.get()
}

///|
/// EULER_ORIGINAL_INTEGRABLE
fn step_77() -> Unit raise {
  let t3116 = @equal.gsym(@transcendentals.log_inv())
  let t3117 = @equal.gsym(@complexes.cx_neg())
  let t3118 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @transcendentals.cpow(), @transcendentals.rpow(), t3117, @real.real_lt_imp_nz(), @complexes.re_cx(), @realarith.real_lt_imp_le(), @complexes.complex_norm_mul(), @transcendentals.norm_cexp(), @complexes.re_sub(), @complexes.cx_inj(), @realax.real_le_refl(), @complexes.re_mul_cx(), t3116, @transcendentals.log_pos_lt(), @real.real_inv_1_lt()]))
  let t3115 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (x : Real) && x < real_of_num(1)"), @tactics.strip_assume_tac)
  let t3114 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3119 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.forall_lift(), @sets.in_diff(), @sets.in_insert(), @equal.gsym(@vectors.drop_eq()), @vectors.lift_drop(), @topology.in_interval_1(), @vectors.drop_vec(), @sets.not_in_empty()])), t3114), @tactics.disch_tac), t3115), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3118)
  let t3113 = @simp.asm_rewrite_tac(@list.List([]))
  let t3112 = @tactics.match_mp_tac(euler_original_real_integrable())
  let t3111 = @equal.gsym(@realanalysis.real_integrable_on_v1())
  let t3120 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.interval_real_interval(), @vectors.drop_vec(), @simp.rewrite_rule(@list.List([@trivia.o_def()]))(t3111)])), t3112), t3113)
  let t3110 = @tactics.match_mp_tac(@real.real_inv_1_lt())
  let t3109 = @tactics.match_mp_tac(@transcendentals.log_pos_lt())
  let t3108 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_lt_le())]))
  let t3106 = @equal.gsym(@transcendentals.log_inv())
  let t3107 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @complexes.re_cx(), @realarith.real_lt_le(), @complexes.re_neg(), t3106]))
  let t3105 = @tactics.match_mp_tac(@canal.complex_differentiable_imp_continuous_at())
  let t3104 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3103 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_eq()), @vectors.lift_drop(), @vectors.drop_vec(), @trivia.o_def()]))
  let t3102 = @simp.rewrite_tac(@list.List([@vectors.forall_lift(), @topology.in_interval_1(), @vectors.lift_drop()]))
  let t3101 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm(), @theorems.imp_conj(), @sets.forall_in_image()]))
  let t3100 = @tactics.match_mp_tac(@topology.continuous_at_imp_continuous_on())
  let t3099 = @simp.simp_tac(@list.List([@canal.continuous_on_cx_drop(), @topology.continuous_on_id()]))
  let t3098 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t3097 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t3096 = @tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => cpow(-clog(Cx(drop(t))), (z : Cart[Real, 2]) - Cx(real_of_num(1)))) == o(o((w : Cart[Real, 2]) => cpow(w, z - Cx(real_of_num(1))), o(op_minus_minus, clog)), (x : Cart[Real, Unit]) => Cx(drop(x)))"), fn(x3093 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3094 = @tactics.subst1_tac(x3093)
    fn(x3095 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3094(x3095)
    }
  })
  let t3092 = @simp.rewrite_tac(@list.List([@integration.negligible_insert(), @integration.negligible_empty(), @measure.lebesgue_measurable_interval()]))
  let t3091 = @tactics.exists_tac(@term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1)}"))
  let t3121 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.continuous_ae_imp_measurable_on_lebesgue_measurable_subset()), t3091), t3092), t3096), t3097), t3098), t3099), t3100), t3101), t3102), t3103), t3104), t3105), @canal.complex_differentiable_tac), t3107), @tactics.disch_tac), t3108), t3109), t3110), @calc_rat.asm_real_arith_tac), t3120, t3119])
  let t3090 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3089 = @simp.rewrite_tac(@list.List([@integration.negligible_insert(), @integration.negligible_empty()]))
  let t3088 = @tactics.exists_tac(@term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1)}"))
  let t3087 = @tactics.exists_tac(@term_syntax.parse_term("(t : Cart[Real, Unit]) => lift(rpow(-log(drop(t)), Re((z : Cart[Real, 2])) - real_of_num(1)))"))
  let t3086 = @tactics.match_mp_tac(@measure.measurable_bounded_ae_by_integrable_imp_integrable())
  let t3122 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3086), t3087), t3088), t3089), t3090), t3121)
  euler_original_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(z) → integrable_on((t : Cart[Real, Unit]) => cpow(-clog(Cx(drop(t))), z - Cx(real_of_num(1))), interval([(vec(0), vec(1))]))"), t3122))
}

///|
let euler_original_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_ORIGINAL_INTEGRABLE")

///|
/// `EULER_ORIGINAL_INTEGRABLE`
pub fn euler_original_integrable() -> @kernel.Thm {
  euler_original_integrable_c.get()
}

///|
/// EULER_ORIGINAL_HAS_INTEGRAL_CGAMMA
fn step_78() -> Unit raise {
  let t3294 = @simp.rewrite_tac(@list.List([@vectors.drop_neg(), @vectors.lift_drop(), @vectors.drop_vec()]))
  let t3293 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_elim_thm(), @topology.in_interval_1()]))
  let t3295 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("(i : Cart[Real, 2]) == (j : Cart[Real, 2]) → norm(i - (g : Cart[Real, 2])) < (e : Real) → distance((j, g)) < e"))), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3293), t3294), @calc_rat.asm_real_arith_tac)
  let t3292 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3291 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_neg())]))
  let t3290 = @simp.gen_rewrite_tac(fn(x3287 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3288 = @equal.land_conv(x3287)
    fn(x3289 : @kernel.Term) -> @kernel.Thm raise {
      s3288(x3289)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t3286 = @simp.asm_simp_tac(@list.List([@transcendentals.real_exp_neg(), @transcendentals.exp_log()]))
  let t3285 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_mono_le())]))
  let t3284 = @simp.rewrite_tac(@list.List([@realax.real_add_lid()]))
  let t3283 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t3282 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.drop_neg()]))
  let t3296 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.ball_1(), @topology.subset_interval_1(), @vectors.drop_add(), @vectors.drop_sub(), @vectors.drop_vec()])), t3282), @tactics.disj2_tac), t3283), t3284), t3285), t3286), t3290), t3291), t3292), @calc_rat.asm_real_arith_tac), t3295])
  let t3277 = @term_syntax.parse_term("lift(-log((x : Real)))")
  let t3278 = @list.List([@term_syntax.parse_term("-lift((B : Real))"), t3277])
  let t3281 = @tactics.first_x_assum(fn(x3280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3275 = @tactics.mp_tac(x3274)
      fn(x3276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3275(x3276)
      }
    })(((x3279 : @kernel.Thm) => @bool.specl(t3278, x3279))(x3280))
  })
  let t3273 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (x : Real)"), fn(x3270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3271 = @tactics.assume_tac(x3270)
    fn(x3272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3271(x3272)
    }
  })
  let t3269 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3268 = @simp.rewrite_tac(@list.List([@real.real_lt_01(), @vectors.dist_0(), @vectors.norm_pos_lt(), @topology.in_interval_1(), @vectors.drop_vec(), @equal.gsym(@vectors.drop_eq()), @vectors.drop_vec(), @vectors.forall_lift(), @vectors.lift_drop(), @vectors.norm_lift()]))
  let t3267 = @simp.asm_rewrite_tac(@list.List([@transcendentals.real_exp_pos_lt()]))
  let t3266 = @tactics.exists_tac(@term_syntax.parse_term("exp(-(B : Real))"))
  let t3265 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t3264 = @simp.asm_rewrite_tac(@list.List([]))
  let t3260 = @term_syntax.parse_term("(e : Real)")
  let t3263 = @tactics.first_x_assum(fn(x3262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3258 = @tactics.mp_tac(x3257)
      fn(x3259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3258(x3259)
      }
    })(((x3261 : @kernel.Thm) => @bool.spec(t3260, x3261))(x3262))
  })
  let t3256 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t3255 = @simp.rewrite_tac(@list.List([@topology.lim_within()]))
  let t3254 = @tactics.disch_then(fn(x3253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3251 = @tactics.assume_tac(x3250)
      fn(x3252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3251(x3252)
      }
    })(@bool.conjunct2(x3253))
  })
  let t3249 = @simp.rewrite_tac(@list.List([@integration.integrable_restrict_inter(), @integration.integral_restrict_inter()]))
  let t3248 = @simp.gen_rewrite_tac(fn(x3245 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3246 = @equal.land_conv(x3245)
    fn(x3247 : @kernel.Term) -> @kernel.Thm raise {
      s3246(x3247)
    }
  }, @list.List([@integration.has_integral_alt_v1()]))
  let t3243 = @drule.match_mp(euler_has_integral_cgamma())
  let t3297 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x3244 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3241 = @tactics.mp_tac(x3240)
      fn(x3242 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3241(x3242)
      }
    })(t3243(x3244))
  }), t3248), t3249), t3254), t3255), t3256), @tactics.disch_tac), t3263), t3264), t3265), t3266), t3267), t3268), t3269), @tactics.strip_tac), t3273), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3281), @tactics.ants_tac), t3296)
  let t3237 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t3236 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t3235 = @tactics.disch_then(fn(x3234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3232 = @tactics.subst1_tac(x3231)
      fn(x3233 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3232(x3233)
      }
    })(@equal.sym(x3234))
  })
  let t3230 = @simp.asm_simp_tac(@list.List([@transcendentals.exp_log(), @vectors.lift_num(), @complexes.complex_cmul(), @transcendentals.cx_exp(), @transcendentals.cexp_neg(), @complexes.cx_neg(), @complexes.complex_neg_neg()]))
  let t3228 = @drule.match_mp(@integration.integral_unique())
  let t3238 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x3229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3226 = @tactics.mp_tac(x3225)
      fn(x3227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3226(x3227)
      }
    })(t3228(x3229))
  }), t3230), t3235), t3236), t3237)
  let t3217 = @simp.rewrite_tac(@list.List([@complexes.re_neg(), @complexes.re_cx(), @calc_int.real_neg_neg()]))
  let t3216 = @simp.simp_tac(@list.List([@transcendentals.real_exp_pos_lt(), @equal.gsym(@transcendentals.cx_log()), @transcendentals.log_exp()]))
  let t3215 = @simp.rewrite_tac(@list.List([@complexes.re_cx(), @vectors.vector_neg_neg(), @vectors.lift_drop()]))
  let t3218 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.complex_differentiable_imp_continuous_at()), @canal.complex_differentiable_tac), t3215), t3216), t3217), @calc_rat.asm_real_arith_tac)
  let t3214 = @simp.simp_tac(@list.List([@topology.continuous_neg(), @topology.continuous_at_id()]))
  let t3213 = @simp.gen_rewrite_tac(fn(x3210 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3211 = @equal.land_conv(x3210)
    fn(x3212 : @kernel.Term) -> @kernel.Thm raise {
      s3211(x3212)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t3219 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_cx_drop()), t3213), t3214), t3218])
  let t3209 = @tactics.match_mp_tac(@topology.continuous_at_compose())
  let t3208 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.drop_neg()])), @tactics.all_tac])
  let t3207 = @tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => cpow(-clog(Cx(-drop(t))), (z : Cart[Real, 2]) - Cx(real_of_num(1)))) == o((w : Cart[Real, 2]) => cpow(-clog(w), z - Cx(real_of_num(1))), (t : Cart[Real, Unit]) => Cx(drop(-t)))"), fn(x3204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3205 = @tactics.subst1_tac(x3204)
    fn(x3206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3205(x3206)
    }
  })
  let t3220 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_at_within()), t3207), t3208), t3209), @tactics.conj_tac), t3219)
  let t3201 = @equal.gsym(@realanalysis.has_real_vector_derivative_at())
  let t3202 = @simp.rewrite_rule(@list.List([@trivia.o_def()]))(t3201)
  let t3203 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_neg()), t3202]))
  let t3221 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_vector_derivative_at_within()), t3203), @realanalysis.real_diff_tac), @calc_rat.real_arith_tac), t3220])
  let t3200 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3199 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t3222 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @topology.in_interval_1(), @vectors.drop_vec(), @vectors.forall_lift(), @vectors.lift_drop(), @vectors.drop_neg(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty(), @equal.gsym(@vectors.drop_eq()), @class.de_morgan_thm()])), t3199), t3200), t3221)
  let t3198 = @simp.asm_rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()]))
  let t3197 = @simp.gen_rewrite_tac(fn(x3194 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3195 = @equal.land_conv(x3194)
    fn(x3196 : @kernel.Term) -> @kernel.Thm raise {
      s3195(x3196)
    }
  }, @list.List([@equal.gsym(@transcendentals.real_exp_0())]))
  let t3193 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t3192 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_neg(), @calc_int.real_le_neg2()]))
  let t3191 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-(x : Real) <= real_of_num(0)) == (real_of_num(0) <= x)")), @transcendentals.real_exp_pos_le()]))
  let t3190 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t3223 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @topology.in_interval_1(), @vectors.drop_vec(), @vectors.forall_lift(), @vectors.lift_drop(), @vectors.drop_neg()])), t3190), @tactics.strip_tac), t3191), t3192), t3193), t3197), t3198)
  let t3189 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3188 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_on_differentiable()]))
  let t3187 = @tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on())
  let t3185 = @equal.gsym(@realanalysis.real_continuous_on_v1())
  let t3186 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@trivia.o_def()]))(t3185)]))
  let t3183 = @equal.gsym(@topology.image_lift_real_interval())
  let t3184 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_num()), t3183]))
  let t3224 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_neg()), @vectors.drop_neg()])), t3184), t3186), t3187), t3188), t3189), @realanalysis.real_differentiable_tac), t3223, t3222])
  let t3182 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3181 = @simp.asm_simp_tac(@list.List([euler_original_integrable()]))
  let t3180 = @simp.rewrite_tac(@list.List([@vectors.reflect_interval(), @vectors.vector_neg_neg(), @vectors.vector_neg_0()]))
  let t3179 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_neg()), @integration.integrable_reflect_gen()]))
  let t3178 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_inv()), @transcendentals.log_pos(), @real.real_inv_1_le()]))
  let t3177 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3239 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_pos(), @card.countable_insert(), @card.countable_empty()])), t3177), t3178), t3179), t3180), t3181), t3182), t3224), t3238])
  let t3176 = @simp.simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @transcendentals.real_exp_pos_lt(), @transcendentals.log_exp()]))
  let t3175 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg(), @vectors.drop_vec(), @transcendentals.real_exp_0(), @calc_int.real_neg_0()]))
  let t3174 = @simp.rewrite_tac(@list.List([@vectors.drop_neg(), @vectors.lift_drop(), @calc_int.real_le_neg2(), @transcendentals.real_exp_mono_le()]))
  let t3172 = @equal.gsym(@integration.integral_reflect_gen())
  let t3173 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.reflect_interval()), t3172]))
  let t3171 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.drop_vec(), @equal.gsym(@vectors.drop_neg())]))
  let t3163 = @term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1)}")
  let t3164 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t3165 = @term_syntax.parse_term("-(vec : (Num) -> Cart[Real, Unit])(1)")
  let t3166 = @term_syntax.parse_term("lift(-log((x : Real)))")
  let t3167 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t3168 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => lift(exp(-drop(t)))")
  let t3169 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => -lift(exp(-drop(t)))")
  let t3170 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(t : Cart[Real, Unit]) => cpow(-clog(Cx(drop(-t))), (z : Cart[Real, 2]) - Cx(real_of_num(1)))"), t3169, t3168, t3167, t3166, t3165, t3164, t3163]), @integration.has_integral_substitution_strong()))
  let t3162 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (x : Real)"), fn(x3159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3160 = @tactics.assume_tac(x3159)
    fn(x3161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3160(x3161)
    }
  })
  let t3158 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3157 = @simp.rewrite_tac(@list.List([@real.real_lt_01(), @vectors.dist_0(), @vectors.norm_pos_lt(), @topology.in_interval_1(), @vectors.drop_vec(), @equal.gsym(@vectors.drop_eq()), @vectors.drop_vec(), @vectors.forall_lift(), @vectors.lift_drop()]))
  let t3298 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)")), t3157), t3158), @tactics.strip_tac), t3162), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3170), t3171), t3173), t3174), t3175), t3176), @tactics.ants_tac), t3239), t3297])
  let t3156 = @simp.rewrite_tac(@list.List([@topology.eventually_within()]))
  let t3155 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, Unit]) => integral(interval([(vec(0), lift(-log(drop(x))))]), (t : Cart[Real, Unit]) => cpow(Cx(drop(t)), (z : Cart[Real, 2]) - Cx(real_of_num(1))) / cexp(Cx(drop(t))))"))
  let t3154 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t3152 = @simp.rewrite_tac(@list.List([@vectors.vec_eq(), @calc_num.arith_eq()]))
  let t3151 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @vectors.ends_in_unit_interval()]))
  let t3150 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET({(a : Cart[Real, _]), (b : Cart[Real, _])}, interval([(a, b)])) && !(a == b) → !(∃ x : Cart[Real, _], interval([(a, b)]) == {x})")))
  let t3149 = @simp.rewrite_tac(@list.List([@vectors.ends_in_unit_interval(), @convex.connected_interval()]))
  let t3153 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.connected_imp_perfect()), t3149), t3150), t3151), t3152), @tactics.all_tac])
  let t3148 = @simp.rewrite_tac(@list.List([@topology.trivial_limit_within()]))
  let t3145 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) → (d : Bool)) == (b → a && c → d)"))]))(@topology.lim_unique()))
  let t3147 = @tactics.first_x_assum(fn(x3146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3145(x3146))
  })
  let t3144 = @simp.asm_rewrite_tac(@list.List([@integration.has_integral_integrable_integral()]))
  let t3143 = @simp.rewrite_tac(@list.List([@vectors.ends_in_unit_interval(), @topology.continuous_within()]))
  let t3139 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t3142 = @tactics.disch_then(fn(x3141 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3136 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3137 = @tactics.mp_tac(x3136)
      fn(x3138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3137(x3138)
      }
    })(((x3140 : @kernel.Thm) => @bool.spec(t3139, x3140))(x3141))
  })
  let t3135 = @simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within()]))
  let t3132 = @drule.match_mp(@integration.indefinite_integral_continuous_left())
  let t3134 = @tactics.first_assum(fn(x3133 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3130 = @tactics.mp_tac(x3129)
      fn(x3131 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3130(x3131)
      }
    })(t3132(x3133))
  })
  let t3126 = @drule.match_mp(euler_original_integrable())
  let t3128 = @tactics.first_assum(fn(x3127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3124 = @tactics.assume_tac(x3123)
      fn(x3125 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3124(x3125)
      }
    })(t3126(x3127))
  })
  let t3299 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3128), t3134), t3135), t3142), t3143), @tactics.disch_tac), t3144), t3147), t3148), @tactics.conj_tac), t3153), t3154), t3155), t3156), @tactics.conj_tac), t3298)
  euler_original_has_integral_cgamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(z) → has_integral((t : Cart[Real, Unit]) => cpow(-clog(Cx(drop(t))), z - Cx(real_of_num(1))), cgamma(z), interval([(vec(0), vec(1))]))"), t3299))
}

///|
let euler_original_has_integral_cgamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_ORIGINAL_HAS_INTEGRAL_CGAMMA")

///|
/// `EULER_ORIGINAL_HAS_INTEGRAL_CGAMMA`
pub fn euler_original_has_integral_cgamma() -> @kernel.Thm {
  euler_original_has_integral_cgamma_c.get()
}

///|
/// EULER_ORIGINAL_INTEGRAL
fn step_79() -> Unit raise {
  let t3302 = @simp.asm_rewrite_tac(@list.List([]))
  let t3301 = @tactics.match_mp_tac(euler_original_has_integral_cgamma())
  let t3300 = @tactics.match_mp_tac(@integration.integral_unique())
  let t3303 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3300), t3301), t3302)
  euler_original_integral_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(z) → integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => cpow(-clog(Cx(drop(t))), z - Cx(real_of_num(1)))) == cgamma(z)"), t3303))
}

///|
let euler_original_integral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_ORIGINAL_INTEGRAL")

///|
/// `EULER_ORIGINAL_INTEGRAL`
pub fn euler_original_integral() -> @kernel.Thm {
  euler_original_integral_c.get()
}

///|
/// EULER_ORIGINAL_HAS_REAL_INTEGRAL_GAMMA
fn step_80() -> Unit raise {
  let t3340 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cx_exp()), @complexes.re_cx()]))
  let t3336 = @equal.gsym(@complexes.cx_mul())
  let t3337 = @equal.gsym(@complexes.cx_sub())
  let t3338 = @equal.gsym(@transcendentals.cx_log())
  let t3339 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cx_neg()), t3338, t3337, t3336]))
  let t3341 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @transcendentals.cpow(), @transcendentals.rpow(), @complexes.complex_neg_eq_0(), @complexes.cx_inj(), @real.real_lt_imp_nz()])), t3339), @class.cond_cases_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3340)
  let t3335 = @tactics.match_mp_tac(@real.real_inv_1_lt())
  let t3334 = @tactics.match_mp_tac(@transcendentals.log_pos_lt())
  let t3342 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_inv())])), t3334), t3335), @calc_rat.asm_real_arith_tac), t3341])
  let t3333 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < -log((y : Real))"), fn(x3330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3331 = @tactics.assume_tac(x3330)
    fn(x3332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3331(x3332)
    }
  })
  let t3329 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (y : Real)"), fn(x3326 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3327 = @tactics.assume_tac(x3326)
    fn(x3328 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3327(x3328)
    }
  })
  let t3325 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t3324 = @simp.rewrite_tac(@list.List([@integration.negligible_empty()]))
  let t3323 = @simp.rewrite_tac(@list.List([@integration.negligible_insert(), @vectors.forall_lift(), @topology.in_interval_1(), @class.de_morgan_thm(), @vectors.lift_drop(), @sets.in_insert(), @sets.not_in_empty(), @equal.gsym(@vectors.drop_eq()), @vectors.drop_vec(), @sets.in_diff()]))
  let t3322 = @tactics.exists_tac(@term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1)}"))
  let t3320 = @simp.rewrite_rule(@list.List([@theorems.conj_assoc()]))(@integration.has_integral_spike())
  let t3321 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(t3320))
  let t3318 = @simp.rewrite_tac(@list.List([@topology.image_lift_real_interval(), @vectors.lift_num()]))
  let t3317 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul()]))
  let t3319 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.linear(), @complexes.re_add(), @vectors.lift_add(), @complexes.complex_cmul(), @complexes.re_mul_cx()])), t3317), t3318])
  let t3316 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t3313 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.has_integral_linear()))
  let t3310 = @term_syntax.parse_term("o(lift, Re)")
  let t3315 = @tactics.disch_then(fn(x3314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3308 = @tactics.mp_tac(x3307)
        fn(x3309 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3308(x3309)
        }
      })(((x3311 : @kernel.Thm) => @bool.ispec(t3310, x3311))(x3312))
    })(t3313(x3314))
  })
  let t3306 = @simp.asm_rewrite_tac(@list.List([gamma(), @trivia.o_def(), @complexes.re_cx()]))
  let t3305 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx((x : Real))"), euler_original_has_integral_cgamma()))
  let t3304 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral()]))
  let t3343 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3304), t3305), t3306), t3315), t3316), @tactics.ants_tac), t3319), t3321), t3322), t3323), t3324), t3325), @tactics.strip_tac), t3329), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3333), t3342)
  euler_original_has_real_integral_gamma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → has_real_integral((t : Real) => rpow(-log(t), x - real_of_num(1)), gamma(x), real_interval([(real_of_num(0), real_of_num(1))]))"), t3343))
}

///|
let euler_original_has_real_integral_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_ORIGINAL_HAS_REAL_INTEGRAL_GAMMA")

///|
/// `EULER_ORIGINAL_HAS_REAL_INTEGRAL_GAMMA`
pub fn euler_original_has_real_integral_gamma() -> @kernel.Thm {
  euler_original_has_real_integral_gamma_c.get()
}

///|
/// EULER_ORIGINAL_REAL_INTEGRAL
fn step_81() -> Unit raise {
  let t3344 = @meson.meson_tac(@list.List([@realanalysis.real_integral_unique(), euler_original_has_real_integral_gamma()]))
  euler_original_real_integral_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) < x → real_integral(real_interval([(real_of_num(0), real_of_num(1))]), (t : Real) => rpow(-log(t), x - real_of_num(1))) == gamma(x)"), t3344))
}

///|
let euler_original_real_integral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_ORIGINAL_REAL_INTEGRAL")

///|
/// `EULER_ORIGINAL_REAL_INTEGRAL`
pub fn euler_original_real_integral() -> @kernel.Thm {
  euler_original_real_integral_c.get()
}

///|
let lgamma_stirling_integrals_exist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LGAMMA_STIRLING_INTEGRALS_EXIST")

///|
/// `LGAMMA_STIRLING_INTEGRALS_EXIST`
pub fn lgamma_stirling_integrals_exist() -> @kernel.Thm {
  lgamma_stirling_integrals_exist_c.get()
}

///|
let lgamma_stirling_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LGAMMA_STIRLING")

///|
/// `LGAMMA_STIRLING`
pub fn lgamma_stirling() -> @kernel.Thm {
  lgamma_stirling_c.get()
}

///|
/// LGAMMA_STIRLING_INTEGRALS_EXIST, LGAMMA_STIRLING
fn step_82() -> Unit raise {
  let t3411 = @tactics.conv_tac(@complexes.complex_ring)
  let t3410 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_add_rid()]))
  let t3409 = @simp.rewrite_tac(@list.List([@real.real_pow_one(), @realax.real_mul_lid()]))
  let t3408 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @arith.even_add(), @arith.even_mult(), @calc_num.arith_even()]))
  let t3407 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * (p : Num) + 2 - 1 == 2 * p + 1")), @arith.add_sub()]))
  let t3406 = @simp.simp_tac(@list.List([@arith.le_1()]))
  let t3403 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3397 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3398 = @tactics.mp_tac(x3397)
    fn(x3399 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3398(x3399)
    }
  }, fn(x3400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3401 = @tactics.subst1_tac(x3400)
    fn(x3402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3401(x3402)
    }
  }))
  let t3404 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!(2 * (p : Num) + 2 == 1)"))])), t3403)
  let t3396 = @simp.rewrite_tac(@list.List([@arith.mult_sym()]))
  let t3395 = @simp.rewrite_tac(@list.List([@arith.fact(), @realax.real_of_num_mul()]))
  let t3394 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((k : Num) == 0) && !(k == 1) → k - 1 == SUC(k - 2)"))]))
  let t3393 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((k : Num) == 0) → k + 1 - 2 == k - 1"))]))
  let t3392 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t3391 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul())]))
  let t3390 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc(), @complexes.complex_div()]))
  let t3389 = @simp.asm_simp_tac(@list.List([@arith.add_sub(), @int.arith_rule(@term_syntax.parse_term("!((k : Num) == 0) && !(k == 1) → (k - 1) * 2 - (k - 1 - 1) == k"))]))
  let t3388 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("false → (p : Bool)"))), @int.asm_arith_tac), @tactics.all_tac])
  let t3387 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_div()), @complexes.complex_div_pow2()]))
  let t3386 = @tactics.first_x_assum(fn(x3385 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3380 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x3384 : @kernel.Thm) => @lib.check(fn(x3383 : @kernel.Thm) -> Bool raise {
      (fn(x3381 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x3381)
      })((fn(x3382 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x3382)
      })(x3383))
    }, x3384))(x3385))
  })
  let t3379 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t3378 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc()), @complexes.complex_sub_lzero(), @complexes.complex_neg_neg(), @complexes.complex_mul_lneg()]))
  let t3377 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rid(), @complexes.cx_neg(), @complexes.complex_pow_pow()]))
  let t3376 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rneg(), @realarith.real_mul_rid(), @calc_int.real_neg_neg(), @calc_int.real_mul_lneg()]))
  let t3375 = @simp.rewrite_tac(@list.List([@real.real_pow_add(), @real.real_pow_1(), @complexes.complex_mul_lzero()]))
  let t3374 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_pow_eq_0()]))
  let t3373 = @tactics.orelse_tac(@tactics.conj_tac, @calc_rat.asm_real_arith_tac)
  let t3372 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_add_lid(), @complexes.complex_mul_lid(), @complexes.complex_pow_1(), @complexes.im_add(), @complexes.re_add(), @complexes.im_cx(), @complexes.re_cx()]))
  let t3371 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3370 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3369 = @simp.asm_rewrite_tac(@list.List([]))
  let t3368 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 1"))
  let t3364 = @tactics.conv_tac(@complexes.complex_field)
  let t3365 = @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) + Cx((x : Real)) == Cx(real_of_num(0)))")), t3364)
  let t3366 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.im_add(), @complexes.re_cx(), @complexes.im_cx()])), @calc_rat.asm_real_arith_tac), t3365])
  let t3367 = @list.List([@tactics.thenl(@tactics.then_tac(@canal.complex_diff_tac, @tactics.conj_tac), t3366), @tactics.all_tac])
  let t3363 = @simp.asm_rewrite_tac(@list.List([]))
  let t3362 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t3361 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @int.arith_rule(@term_syntax.parse_term("((k : Num) + 1 == 1) == (k == 0)"))]))
  let t3360 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.im_add(), @complexes.re_add(), @complexes.im_cx(), @complexes.re_cx()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3359 = @tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) + Cx((x : Real)) == Cx(real_of_num(0)))"), fn(x3356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3357 = @tactics.assume_tac(x3356)
    fn(x3358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3357(x3358)
    }
  })
  let t3355 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3353 = @term_syntax.parse_term("(x : Real)")
  let t3354 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : Num)"), t3353]))
  let t3405 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval(), @arith.le_0()])), t3354), t3355), t3359), t3360), t3361), t3362), t3363), t3367), t3368), t3369), @canal.complex_diff_tac), t3370), t3371), t3372), t3373), t3374), t3375), t3376), t3377), t3378), t3379), @tactics.ap_term_tac), t3386), t3387), @class.cond_cases_tac), t3388), t3389), t3390), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3391), @tactics.ap_term_tac), t3392), @tactics.ap_term_tac), t3393), t3394), t3395), t3396), t3404])
  let t3352 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3351 = @simp.asm_rewrite_tac(@list.List([@arith.add_eq_0(), @arith.mult_eq_0(), @arith.mult_eq_1()]))
  let t3347 = @term_syntax.parse_term("(p : Num)")
  let t3348 = @term_syntax.parse_term("(n : Num)")
  let t3349 = @term_syntax.parse_term("0")
  let t3350 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (w : Cart[Real, 2]) => if n == 0 { ((z : Cart[Real, 2]) + w) * clog(z + w) - (z + w) } else { if n == 1 { clog(z + w) } else { Cx(pow(-real_of_num(1), n) * real_of_num(FACT(n - 2))) / pow(z + w, n - 1) } }"), t3349, t3348, t3347]), @realanalysis.complex_euler_maclaurin_antiderivative()))
  let t3346 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num((n : Num))) + (z : Cart[Real, 2]) == z + Cx(real_of_num(n))"))]))
  let t3412 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t3346), t3350), t3351), t3352), @tactics.ants_tac), t3405), t3406), t3407), t3408), t3409), @tactics.disch_tac), t3410), t3411)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ n : Num, ∀ z : Cart[Real, 2], (Im(z) == real_of_num(0) → real_of_num(0) < Re(z)) → integrable_on((x : Cart[Real, Unit]) => Cx(bernoulli(2 * p + 1, frac(drop(x)))) * (Cx(real_of_num(FACT(2 * p))) / pow(z + Cx(drop(x)), 2 * p + 1)), interval([(lift(real_of_num(0)), lift(real_of_num(n)))])) && vsum(op_dot_dot(0, n), (m : Num) => clog(Cx(real_of_num(m)) + z)) == (z + (Cx(real_of_num(n)) + Cx(real_of_num(1)) / Cx(real_of_num(2)))) * clog(z + Cx(real_of_num(n))) - (z - Cx(real_of_num(1)) / Cx(real_of_num(2))) * clog(z) - Cx(real_of_num(n)) + (vsum(op_dot_dot(1, p), (k : Num) => Cx(bernoulli(2 * k, real_of_num(0)) / real_of_num(FACT(2 * k))) * (Cx(real_of_num(FACT(2 * k - 2))) / pow(z + Cx(real_of_num(n)), 2 * k - 1) - Cx(real_of_num(FACT(2 * k - 2))) / pow(z, 2 * k - 1))) + integral(interval([(lift(real_of_num(0)), lift(real_of_num(n)))]), (x : Cart[Real, Unit]) => Cx(bernoulli(2 * p + 1, frac(drop(x)))) * (Cx(real_of_num(FACT(2 * p))) / pow(z + Cx(drop(x)), 2 * p + 1))) / Cx(real_of_num(FACT(2 * p + 1))))"), t3412)
  let t3512 = @tactics.match_mp_tac(@transcendentals.lim_inv_x_pow_offset())
  let t3511 = @simp.once_rewrite_tac(@list.List([@complexes.complex_add_sym()]))
  let t3510 = @simp.rewrite_tac(@list.List([@complexes.cx_inv(), @complexes.cx_pow(), @equal.gsym(@complexes.complex_pow_inv()), @complexes.cx_add()]))
  let t3508 = @equal.gsym(@canal.lim_cx_lift())
  let t3509 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_num()), t3508]))
  let t3507 = @tactics.match_mp_tac(@topology.lim_null_cmul())
  let t3506 = @simp.rewrite_tac(@list.List([@real.real_inv_mul(), @vectors.lift_cmul()]))
  let t3505 = @simp.rewrite_tac(@list.List([@realarith.real_neg_sub(), @topology.lim_const()]))
  let t3502 = @equal.gsym(@calc_int.real_mul_lneg())
  let t3503 = @equal.gsym(@real.real_inv_neg())
  let t3504 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_neg()), t3503, t3502]))
  let t3501 = @tactics.match_mp_tac(@topology.lim_add())
  let t3500 = @simp.gen_rewrite_tac(fn(x3497 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3498 = @equal.land_conv(x3497)
    fn(x3499 : @kernel.Term) -> @kernel.Thm raise {
      s3498(x3499)
    }
  }, @list.List([@equal.gsym(@vectors.vector_add_lid())]))
  let t3496 = @simp.rewrite_tac(@list.List([@vectors.lift_sub(), @vectors.vector_sub_v1()]))
  let t3494 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3493 = @tactics.match_mp_tac(@integration.integral_unique())
  let t3492 = @tactics.conv_tac(@equal.sym_conv)
  let t3491 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3490 = @simp.rewrite_tac(@list.List([@vectors.forall_drop(), @vectors.lift_drop()]))
  let t3489 = @tactics.exists_tac(@term_syntax.parse_term("max(real_of_num(0), abs(Im((z : Cart[Real, 2]))) - Re(z))"))
  let t3495 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.eventually_at_posinfinity(), @realax.real_ge()])), t3489), t3490), t3491), t3492), t3493), t3494), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3488 = @tactics.exists_tac(@term_syntax.parse_term("(b : Real) => lift(inv((real_of_num(1) - real_of_num((n : Num))) * pow(Re((z : Cart[Real, 2])) + b, n - 1)) - inv((real_of_num(1) - real_of_num(n)) * pow(Re(z) + max(real_of_num(0), abs(Im(z)) - Re(z)), n - 1)))"))
  let t3487 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t3485 = @simp.rewrite_tac(@list.List([@integration.content_eq_0_1(), @vectors.lift_drop()]))
  let t3483 = @tactics.match_mp_tac(@integration.integrable_on_null())
  let t3484 = @list.List([@meson.asm_meson_tac(@list.List([@integration.integrable_on()])), t3483])
  let t3482 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= drop((b : Cart[Real, Unit])) && abs(Im((z : Cart[Real, 2]))) - Re(z) <= drop(b)"))
  let t3486 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, Unit])")), t3482), t3484), t3485), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3481 = @tactics.exists_tac(@term_syntax.parse_term("lift(inv((real_of_num((n : Num)) - real_of_num(1)) * pow(Re((z : Cart[Real, 2])) + max(real_of_num(0), abs(Im(z)) - Re(z)), n - 1)))"))
  let t3478 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @equal.gsym(@vectors.lift_sub())]))
  let t3477 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add())]))
  let t3475 = @equal.gsym(@real.real_inv_pow())
  let t3476 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul()), t3475]))
  let t3474 = @simp.asm_simp_tac(@list.List([@realax.real_div(), @realax.real_of_num_le(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(2) <= (x : Real) → inv(real_of_num(1) - x) * ((x - real_of_num(1)) * ((y : Real) * (-(real_of_num(0) + real_of_num(1)) * (p : Real)))) == y * p"))]))
  let t3472 = @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 1 <= n"))
  let t3473 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_of_num_sub()), t3472]))
  let t3471 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3470 = @simp.rewrite_tac(@list.List([@real.real_inv_mul(), @real.real_inv_pow()]))
  let t3468 = @equal.gsym(@realanalysis.has_real_vector_derivative_within())
  let t3469 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@trivia.o_def()]))(t3468)]))
  let t3479 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.forall_lift(), @vectors.lift_drop(), @topology.interval_real_interval()])), t3469), t3470), t3471), @realanalysis.real_diff_tac), t3473), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3474), t3476), @tactics.ap_term_tac), t3477), @tactics.ap_term_tac), @int.asm_arith_tac), t3478])
  let t3467 = @simp.asm_rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.lift_drop(), @real.real_max_le()]))
  let t3463 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t3464 = @term_syntax.parse_term("lift(max(real_of_num(0), abs(Im((z : Cart[Real, 2]))) - Re(z)))")
  let t3465 = @term_syntax.parse_term("(x : Cart[Real, Unit]) => lift(pow(inv(Re((z : Cart[Real, 2])) + drop(x)), (n : Num)))")
  let t3466 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, Unit]) => lift(inv((real_of_num(1) - real_of_num((n : Num))) * pow(Re((z : Cart[Real, 2])) + drop(x), n - 1)))"), t3465, t3464, t3463]), @integration.fundamental_theorem_of_calculus()))
  let t3480 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3466), t3467), @tactics.ants_tac), t3479), @tactics.all_tac])
  let t3462 = @tactics.subgoal_then(@term_syntax.parse_term("∀ b : Cart[Real, Unit], real_of_num(0) <= drop(b) && abs(Im((z : Cart[Real, 2]))) - Re(z) <= drop(b) → has_integral((x : Cart[Real, Unit]) => lift(pow(inv(Re(z) + drop(x)), (n : Num))), lift(inv((real_of_num(1) - real_of_num(n)) * pow(Re(z) + drop(b), n - 1)) - inv((real_of_num(1) - real_of_num(n)) * pow(Re(z) + max(real_of_num(0), abs(Im(z)) - Re(z)), n - 1))), interval([(lift(max(real_of_num(0), abs(Im(z)) - Re(z))), b)]))"), fn(x3459 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3460 = @tactics.assume_tac(x3459)
    fn(x3461 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3460(x3461)
    }
  })
  let t3457 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.drop_vec()]))
  let t3458 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_elim_thm(), @topology.in_interval_1()])), t3457), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3456 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : Cart[Real, Unit], INTER({(t : Cart[Real, Unit]) | abs(Im((z : Cart[Real, 2]))) - Re(z) <= drop(t)}, interval([(vec(0), a)])) == interval([(lift(max(real_of_num(0), abs(Im(z)) - Re(z))), a)])"), fn(x3454 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3454
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t3453 = @simp.rewrite_tac(@list.List([@integration.integrable_restrict_inter(), @integration.integral_restrict_inter()]))
  let t3452 = @simp.once_rewrite_tac(@list.List([@integration.has_integral_lim_at_posinfinity()]))
  let t3451 = @simp.rewrite_tac(@list.List([@integration.integrable_on()]))
  let t3450 = @simp.rewrite_tac(@list.List([@equal.gsym(@integration.integrable_restrict_inter())]))
  let t3448 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_eq()), @vectors.lift_drop()]))
  let t3447 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_union(), @sets.in_elim_thm(), @sets.in_sing(), @sets.in_inter()]))
  let t3446 = @simp.rewrite_tac(@list.List([@integration.negligible_sing()]))
  let t3445 = @tactics.exists_tac(@term_syntax.parse_term("{lift(abs(Im((z : Cart[Real, 2]))) - Re(z))}"))
  let t3449 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.negligible_subset()), t3445), t3446), t3447), t3448), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3444 = @tactics.exists_tac(@term_syntax.parse_term("INTER({(t : Cart[Real, Unit]) | abs(Im((z : Cart[Real, 2]))) - Re(z) <= drop(t)}, {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)})"))
  let t3443 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(@integration.integrable_spike_set()))
  let t3441 = @simp.simp_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @topology.in_interval_1(), @vectors.drop_vec(), @vectors.lift_drop()]))
  let t3442 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("{(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t) && Re((z : Cart[Real, 2])) + drop(t) <= abs(Im(z))} == interval([(vec(0), lift(abs(Im(z)) - Re(z)))])"), fn(x3439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3439
    @simp.rewrite_tac(@list.List([th, @integration.integrable_const()]))
  }), t3441), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3438 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3437 = @tactics.match_mp_tac(@integration.integrable_cases())
  let t3436 = @simp.rewrite_tac(@list.List([@class.cond_rand(), @class.cond_rator()]))
  let t3435 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("max((m : Real), (n : Real)) == (if n <= m { m } else { n })"))]))
  let t3432 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.im_add(), @complexes.re_cx(), @complexes.im_cx()]))
  let t3431 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2]) + Cx((x : Real))"), @complexes.complex_norm_ge_re_im()))
  let t3430 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3429 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le(), @complexes.complex_norm_inv()]))
  let t3428 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t3427 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_pow_inv()), @complexes.complex_norm_pow()]))
  let t3426 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3433 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @equal.gsym(@vectors.forall_drop()), @vectors.lift_drop()])), t3426), @tactics.disch_tac), t3427), t3428), t3429), t3430), t3431), t3432), @calc_rat.asm_real_arith_tac)
  let t3423 = @simp.rewrite_tac(@list.List([@topology.is_interval_1(), @sets.in_elim_thm()]))
  let t3422 = @tactics.match_mp_tac(@convex.is_interval_convex())
  let t3424 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.lebesgue_measurable_convex()), t3422), t3423), @calc_rat.real_arith_tac)
  let t3421 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_add(), @complexes.im_add(), @complexes.re_cx(), @complexes.im_cx()]))
  let t3420 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_eq_0()]))
  let t3419 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @equal.gsym(@vectors.forall_drop())]))
  let t3418 = @simp.simp_tac(@list.List([@canal.continuous_on_complex_pow(), @topology.continuous_on_add(), @topology.continuous_on_const(), @topology.continuous_on_id(), @canal.continuous_on_cx_drop()]))
  let t3425 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_complex_inv()), t3418), t3419), t3420), t3421), @calc_rat.asm_real_arith_tac), t3424])
  let t3434 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@measure.continuous_imp_measurable_on_lebesgue_measurable_subset()), @tactics.conj_tac), t3425), @tactics.all_tac, t3433])
  let t3417 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3416 = @simp.rewrite_tac(@list.List([]))
  let t3415 = @tactics.exists_tac(@term_syntax.parse_term("(t : Cart[Real, Unit]) => lift(pow(inv(max(abs(Im((z : Cart[Real, 2]))), Re(z) + drop(t))), (n : Num)))"))
  let t3414 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_absolutely_integrable())
  let t3413 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_inv()]))
  let t3513 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3413), t3414), t3415), t3416), t3417), t3434), t3435), t3436), t3437), t3438), @tactics.conj_tac), t3442), t3443), t3444), @tactics.conj_tac), t3449), t3450), t3451), t3452), t3453), t3456), t3458), t3462), t3480), t3481), @tactics.conj_tac), t3486), t3487), t3488), @tactics.conj_tac), t3495), t3496), t3500), t3501), t3504), t3505), t3506), t3507), t3509), t3510), t3511), t3512), @int.asm_arith_tac)
  let lemma2 = @tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ n : Num, 2 <= n && (Im(z) == real_of_num(0) → real_of_num(0) < Re(z)) → absolutely_integrable_on((t : Cart[Real, Unit]) => pow(inv(z + Cx(drop(t))), n), {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)})"), t3513)
  let t3517 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_pow_inv()), lemma2]))
  let t3516 = @tactics.match_mp_tac(@realanalysis.absolutely_integrable_on_mul_bernoulli_frac())
  let t3515 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t3514 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_cmul())]))
  let t3518 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3514), t3515), t3516), t3517)
  let lemma3 = @tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ n : Num, 2 <= n && (Im(z) == real_of_num(0) → real_of_num(0) < Re(z)) → integrable_on((t : Cart[Real, Unit]) => Cx(bernoulli(n, frac(drop(t)))) / pow(z + Cx(drop(t)), n), {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)})"), t3518)
  let t3631 = @simp.rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @arith.fact_nz(), @nums.not_suc()]))
  let t3630 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("!((a : Cart[Real, 2]) == Cx(real_of_num(0))) && !((b : Cart[Real, 2]) == Cx(real_of_num(0))) → a * inv(b * a) == inv(b)")))
  let t3628 = @equal.gsym(@realax.real_of_num_mul())
  let t3629 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.fact(), t3628, @complexes.cx_mul()]))
  let t3627 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(x : Cart[Real, 2]) * (y : Cart[Real, 2]) == (z : Cart[Real, 2]) → x * (i : Cart[Real, 2]) * y == i * z")))
  let t3632 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div()])), t3627), t3629), t3630), t3631)
  let t3626 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_ac()]))
  let t3625 = @tactics.match_mp_tac(@integration.integral_eq())
  let t3624 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t3623 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3633 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_num(), @class.fun_eq_thm()])), t3623), t3624), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3625), t3626), t3632])
  let t3622 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t3619 = @drule.match_mp(@canal.lim_complex_rmul())
  let t3616 = @term_syntax.parse_term("inv(Cx(real_of_num(FACT(2 * (p : Num) + 1))))")
  let t3621 = @tactics.disch_then(fn(x3620 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3613 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3614 = @tactics.mp_tac(x3613)
        fn(x3615 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3614(x3615)
        }
      })(((x3617 : @kernel.Thm) => @bool.spec(t3616, x3617))(x3618))
    })(t3619(x3620))
  })
  let t3609 = @drule.match_mp(@topology.lim_posinfinity_sequentially())
  let t3612 = @tactics.disch_then(fn(x3611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3606 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3607 = @tactics.mp_tac(x3606)
        fn(x3608 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3607(x3608)
        }
      })(t3609(x3610))
    })(@bool.conjunct2(x3611))
  })
  let t3605 = @simp.rewrite_tac(@list.List([@integration.has_integral_lim_at_posinfinity()]))
  let t3604 = @simp.asm_simp_tac(@list.List([@canal.integral_complex_lmul()]))
  let t3601 = @drule.match_mp(@integration.integrable_integral())
  let t3603 = @tactics.disch_then(fn(x3602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3598 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3599 = @tactics.mp_tac(x3598)
      fn(x3600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3599(x3600)
      }
    })(t3601(x3602))
  })
  let t3595 = @drule.match_mp(@canal.integrable_complex_lmul())
  let t3592 = @term_syntax.parse_term("Cx(real_of_num(FACT(2 * (p : Num))))")
  let t3597 = @tactics.first_assum(fn(x3596 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3594 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3590 = @tactics.mp_tac(x3589)
        fn(x3591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3590(x3591)
        }
      })(((x3593 : @kernel.Thm) => @bool.spec(t3592, x3593))(x3594))
    })(t3595(x3596))
  })
  let t3588 = @simp.asm_rewrite_tac(@list.List([]))
  let t3587 = @term_syntax.parse_term("2 * (p : Num) + 1")
  let t3634 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2])"), t3587]), lemma3)), t3588), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.disch_tac])), t3597), t3603), t3604), t3605), t3612), t3621), t3622), @tactics.ap_thm_tac), @tactics.binop_tac), t3633)
  let t3584 = @tactics.match_mp_tac(@transcendentals.lim_inv_n_pow_offset())
  let t3583 = @simp.once_rewrite_tac(@list.List([@complexes.complex_add_sym()]))
  let t3582 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_pow_inv())]))
  let t3581 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t3580 = @tactics.match_mp_tac(@topology.lim_sub())
  let t3579 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(z : Cart[Real, 2]) == Cx(real_of_num(0)) - z"))]))
  let t3585 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.lim_complex_lmul()), t3579), t3580), t3581), t3582), t3583), t3584), @int.asm_arith_tac)
  let t3578 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 + (k : Num) == SUC(SUC(k))")), @arith.fact()]))
  let t3577 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 + (k : Num) - 2 == k && 2 + k - 1 == k + 1"))]))
  let t3576 = @tactics.disch_then(fn(x3575 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t3574 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3573 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses()]))
  let t3571 = @term_syntax.parse_term("(k : Num)")
  let t3572 = @tactics.spec_tac(@term_syntax.parse_term("(k : Num)"), t3571)
  let t3570 = @tactics.undisch_tac(@term_syntax.parse_term("1 <= (k : Num)"))
  let t3568 = @equal.gsym(@complexes.cx_mul())
  let t3569 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (k : Num) → 1 <= 2 * k")), @real.real_of_num_sub(), @realax.real_of_num_mul(), t3568, @complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t3567 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(4) * pow((x : Real), 2) - real_of_num(2) * x == real_of_num(2) * x * (real_of_num(2) * x - real_of_num(1))"))]))
  let t3566 = @simp.rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @arith.fact_nz()]))
  let t3586 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("!((y : Cart[Real, 2]) == Cx(real_of_num(0))) && !((z : Cart[Real, 2]) == Cx(real_of_num(0))) && (x : Cart[Real, 2]) * z == y → x / y == inv(z)"))), t3566), t3567), t3569), @tactics.conj_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t3570), t3572), @nums.induct_tac), t3573), t3574), t3576), t3577), t3578), @int.arith_tac), t3585])
  let t3565 = @tactics.subgoal_then(@term_syntax.parse_term("Cx(real_of_num(FACT(2 * (k : Num) - 2))) / Cx(real_of_num(FACT(2 * k))) == inv(Cx(real_of_num(4) * pow(real_of_num(k), 2) - real_of_num(2) * real_of_num(k)))"), fn(x3563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x3563
    @simp.once_rewrite_tac(@list.List([th_4]))
  })
  let t3562 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("inv((x : Cart[Real, 2])) * ((y : Cart[Real, 2]) * (w : Cart[Real, 2]) - y * (z : Cart[Real, 2])) == y / x * (w - z)"))]))
  let t3561 = @tactics.match_mp_tac(@canal.lim_complex_lmul())
  let t3560 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc())]))
  let t3559 = @simp.rewrite_tac(@list.List([@complexes.cx_div(), @complexes.complex_div(), @equal.gsym(@complexes.complex_mul_rneg())]))
  let t3558 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t3557 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t3556 = @tactics.match_mp_tac(@topology.lim_vsum())
  let t3635 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vsum_neg())])), t3556), t3557), t3558), @tactics.strip_tac), t3559), t3560), t3561), t3562), t3565), t3586), t3634])
  let t3555 = @tactics.match_mp_tac(@topology.lim_add())
  let t3554 = @simp.gen_rewrite_tac(fn(x3551 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3552 = @equal.land_conv(x3551)
    fn(x3553 : @kernel.Term) -> @kernel.Thm raise {
      s3552(x3553)
    }
  }, @list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) - (b : Cart[Real, 2]) == -b + a"))]))
  let t3550 = @tactics.disch_then(fn(x3548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x3548
    @simp.once_rewrite_tac(@list.List([th_3]))
  })
  let t3547 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) + (vec(0) + (x : Cart[Real, N])) == a + (y : Cart[Real, N])) == (x == y)"))]))
  let t3546 = @tactics.disch_then(fn(x3544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x3544
    @simp.once_rewrite_tac(@list.List([th_2]))
  })
  let t3543 = @simp.rewrite_tac(@list.List([@vectors.lift_num(), @complexes.complex_pow_1(), @complexes.complex_div_1()]))
  let t3542 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("(a : Cart[Real, 2]) * (Cx(real_of_num(1)) / (b : Cart[Real, 2])) == a / b"))]))
  let t3541 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3540 = @simp.rewrite_tac(@list.List([@vectors.vsum_clauses_numseg()]))
  let t3539 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t3538 = @simp.asm_rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t3533 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3534 = @term_syntax.parse_term("(n : Num)")
  let t3535 = @bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t3534, t3533]), lemma1)
  let t3531 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3532 = @term_syntax.parse_term("(n : Num)")
  let t3536 = @bool.conj(@bool.specl(@list.List([@term_syntax.parse_term("0"), t3532, t3531]), lemma1), t3535)
  let t3537 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(n : Num)"), t3536))
  let t3527 = @simp.rewrite_tac(@list.List([@transcendentals.lim_inv_z_offset()]))
  let t3526 = @simp.once_rewrite_tac(@list.List([@complexes.complex_add_sym()]))
  let t3528 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@canal.lim_infinity_posinfinity_cx())), t3526), t3527)
  let t3525 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), @floor.floor_frac()))
  let t3524 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t3523 = @simp.rewrite_tac(@list.List([@realanalysis.bernoulli_conv(@term_syntax.parse_term("bernoulli(1, (x : Real))"))]))
  let t3522 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3529 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.always_eventually()), t3522), t3523), @tactics.disj1_tac), t3524), t3525), @calc_rat.real_arith_tac), t3528])
  let t3521 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) / real_of_num(2)"))
  let t3520 = @tactics.match_mp_tac(@canal.lim_null_complex_lmul_bounded())
  let t3530 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop(), @complexes.complex_div(), @complexes.complex_vec_0()])), t3520), t3521), @tactics.conj_tac), t3529), @tactics.all_tac])
  let t3519 = @tactics.match_mp_tac(@integration.has_integral_lim_sequentially())
  let t3636 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3519), @tactics.conj_tac), t3530), t3537), t3538), t3539), t3540), t3541), t3542), t3543), t3546), t3547), t3550), t3554), t3555), @tactics.conj_tac), t3635)
  let lemma4 = @tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ p : Num, (Im(z) == real_of_num(0) → real_of_num(0) < Re(z)) && 1 <= p → has_integral((t : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(t)))) / (z + Cx(drop(t))), integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(2 * p + 1, frac(drop(t)))) / pow(z + Cx(drop(t)), 2 * p + 1)) / Cx(real_of_num(2 * p + 1)) - vsum(op_dot_dot(1, p), (k : Num) => Cx(bernoulli(2 * k, real_of_num(0)) / (real_of_num(4) * pow(real_of_num(k), 2) - real_of_num(2) * real_of_num(k))) / pow(z, 2 * k - 1)), {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)})"), t3636)
  let t3642 = @meson.asm_meson_tac(@list.List([@arith.le_refl(), lemma4]))
  let t3641 = @simp.rewrite_tac(@list.List([@integration.integrable_on()]))
  let t3640 = @simp.asm_simp_tac(@list.List([lemma3, @complexes.complex_pow_1()]))
  let t3637 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → n == 1 || 2 <= n")))
  let t3639 = @tactics.first_x_assum(fn(x3638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t3637(x3638))
  })
  let t3643 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3639), t3640), t3641), t3642)
  let lemma5 = @tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ n : Num, 1 <= n && (Im(z) == real_of_num(0) → real_of_num(0) < Re(z)) → integrable_on((t : Cart[Real, Unit]) => Cx(bernoulli(n, frac(drop(t)))) / pow(z + Cx(drop(t)), n), {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)})"), t3643)
  let t3740 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl(), @complexes.re_cx(), @real.real_lt_01()]))
  let t3739 = @tactics.match_mp_tac(lemma5)
  let t3738 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) + (x : Cart[Real, 2]) == pow(z + x, 1)"))]))
  let t3736 = @equal.gsym(@complexes.complex_div())
  let t3737 = @simp.rewrite_tac(@list.List([@equal.gsym(@integration.has_integral_integral()), t3736]))
  let t3734 = @bool.spec_all(@integration.has_integral_lim_at_posinfinity())
  let t3735 = @tactics.match_mp_tac(@drule.match_mp(@class.taut(@term_syntax.parse_term("(p : Bool) == ((q : Bool) && (r : Bool)) → p → r")))(t3734))
  let t3733 = @simp.rewrite_tac(@list.List([@vectors.lift_num()]))
  let t3732 = @tactics.match_mp_tac(@topology.lim_posinfinity_sequentially())
  let t3731 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_num())]))
  let t3730 = @tactics.match_mp_tac(@topology.lim_sub())
  let t3729 = @simp.rewrite_tac(@list.List([@vectors.lift_num()]))
  let t3741 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lid()])), t3729), t3730), @tactics.conj_tac), t3731), t3732), t3733), t3735), t3737), t3738), t3739), t3740)
  let t3726 = @simp.rewrite_tac(@list.List([@equal.gsym(@canal.lim_null_complex()), @cauchy.lim_n_mul_sub_clog()]))
  let t3725 = @simp.simp_tac(@list.List([@canal.lim_null_complex_lmul(), @cauchy.lim_sub_clog()]))
  let t3724 = @simp.once_rewrite_tac(@list.List([@complexes.complex_add_sym()]))
  let t3723 = @simp.rewrite_tac(@list.List([]))
  let t3722 = @tactics.match_mp_tac(@canal.lim_null_complex_add())
  let t3727 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((a : Cart[Real, 2]) + (h : Cart[Real, 2])) * (x : Cart[Real, 2]) - (y : Cart[Real, 2]) == h * x + (a * x - y)"))])), t3722), t3723), t3724), t3725), t3726)
  let t3721 = @simp.rewrite_tac(@list.List([@cauchy.lim_sub_clog()]))
  let t3720 = @simp.once_rewrite_tac(@list.List([@complexes.complex_add_sym()]))
  let t3719 = @simp.gen_rewrite_tac(fn(x3718 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3714 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x3710 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x3706 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(x3700 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s3701 = @equal.rator_conv(x3700)
            fn(x3702 : @kernel.Term) -> @kernel.Thm raise {
              s3701(x3702)
            }
          })((fn(x3703 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s3704 = @equal.land_conv(x3703)
            fn(x3705 : @kernel.Term) -> @kernel.Thm raise {
              s3704(x3705)
            }
          })(x3706))
        })((fn(x3707 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s3708 = @equal.binder_conv(x3707)
          fn(x3709 : @kernel.Term) -> @kernel.Thm raise {
            s3708(x3709)
          }
        })(x3710))
      })((fn(x3711 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3712 = @equal.land_conv(x3711)
        fn(x3713 : @kernel.Term) -> @kernel.Thm raise {
          s3712(x3713)
        }
      })(x3714))
    })((fn(x3715 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3716 = @equal.rand_conv(x3715)
      fn(x3717 : @kernel.Term) -> @kernel.Thm raise {
        s3716(x3717)
      }
    })(x3718))
  }, @list.List([@equal.gsym(@complexes.complex_add_lid())]))
  let t3728 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.lim_null_complex_lmul()), t3719), t3720), t3721), t3727])
  let t3699 = @tactics.match_mp_tac(@canal.lim_null_complex_add())
  let t3697 = @tactics.conv_tac(@complexes.complex_ring)
  let t3698 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@metric.always_eventually()), t3697), @tactics.all_tac])
  let t3696 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (z : Cart[Real, 2]) * (clog(Cx(real_of_num(n))) - clog(z + Cx(real_of_num(n)))) + ((Cx(real_of_num(n)) + Cx(real_of_num(1)) / Cx(real_of_num(2))) * (clog(Cx(real_of_num(1)) + Cx(real_of_num(n))) - clog(z + Cx(real_of_num(n)))) - (Cx(real_of_num(1)) - z))"))
  let t3695 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t3694 = @simp.rewrite_tac(@list.List([@complexes.cx_add()]))
  let t3693 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t3692 = @simp.rewrite_tac(@list.List([]))
  let t3691 = @simp.once_rewrite_tac(@list.List([@canal.lim_null_complex()]))
  let t3742 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.clog_1(), @complexes.complex_mul_rzero(), @complexes.complex_sub_rzero()])), t3691), t3692), t3693), t3694), t3695), t3696), @tactics.conj_tac), t3698), t3699), @tactics.conj_tac), t3728), t3741])
  let t3690 = @tactics.match_mp_tac(@topology.lim_add())
  let t3689 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) + ((b : Cart[Real, 2]) - (c : Cart[Real, 2]) - (n : Cart[Real, 2]) + (x : Cart[Real, 2]) - ((d : Cart[Real, 2]) - (e : Cart[Real, 2]) - n + (y : Cart[Real, 2]))) == a + (b - c - (d - e)) + (x - y)"))]))
  let t3688 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_1(), @complexes.complex_div_1()]))
  let t3686 = @simp.asm_simp_tac(@list.List([@complexes.re_cx(), @real.real_lt_01()]))
  let t3685 = @simp.asm_rewrite_tac(@list.List([@vectors.vsum_clauses_numseg(), @calc_num.arith(), @vectors.vector_add_lid()]))
  let t3684 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3682 = @term_syntax.parse_term("(n : Num)")
  let t3683 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("0"), t3682]), lemma1))
  let t3680 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) + ((b : Cart[Real, 2]) - (c : Cart[Real, 2])) - (d : Cart[Real, 2]) == a - c + (b - d)"))]))
  let t3679 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) + (b : Cart[Real, 2]) - b == a"))]))
  let t3678 = @simp.simp_tac(@list.List([@transcendentals.cx_log(), @real.real_of_num_lt(), @arith.lt_0()]))
  let t3677 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")), @real.real_of_num_suc()]))
  let t3676 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @vectors.vsum_clauses_numseg()]))
  let t3673 = @equal.gsym(@complexes.vsum_cx())
  let t3674 = @equal.gsym(@transcendentals.cx_log())
  let t3675 = @simp.simp_tac(@list.List([@equal.gsym(@products.nproduct_fact()), @products.real_of_num_nproduct(), @iterate.finite_numseg(), t3674, @transcendentals.log_product(), @products.product_pos_lt(), @iterate.in_numseg(), @real.real_of_num_lt(), @arith.le_1(), t3673]))
  let t3672 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.spec(@term_syntax.parse_term("1"), @vectors.vsum_offset())), @arith.add_clauses()]))
  let t3681 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @equal.gsym(@complexes.cx_add())])), t3672), t3675), t3676), t3677), t3678), t3679), t3680])
  let t3671 = @tactics.subgoal_then(@term_syntax.parse_term("clog(Cx(real_of_num(FACT((n : Num))))) == vsum(op_dot_dot(0, n), (m : Num) => clog(Cx(real_of_num(m)) + Cx(real_of_num(1)))) - clog(Cx(real_of_num(n) + real_of_num(1)))"), fn(x3668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3669 = @tactics.subst1_tac(x3668)
    fn(x3670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3669(x3670)
    }
  })
  let t3667 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3666 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t3687 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t3666), t3667), @tactics.disch_tac), t3671), t3681), t3683), t3684), t3685), t3686), @tactics.all_tac])
  let t3665 = @simp.rewrite_tac(@list.List([]))
  let t3664 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (z : Cart[Real, 2]) * clog(Cx(real_of_num(n))) - clog(Cx(real_of_num(n) + real_of_num(1))) + ((Cx(real_of_num(1)) + (Cx(real_of_num(n)) + Cx(real_of_num(1)) / Cx(real_of_num(2)))) * clog(Cx(real_of_num(1)) + Cx(real_of_num(n))) - (Cx(real_of_num(1)) - Cx(real_of_num(1)) / Cx(real_of_num(2))) * clog(Cx(real_of_num(1))) - Cx(real_of_num(n)) + integral(interval([(lift(real_of_num(0)), lift(real_of_num(n)))]), (x : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(x)))) * (Cx(real_of_num(1)) / pow(Cx(real_of_num(1)) + Cx(drop(x)), 1))) / Cx(real_of_num(1)) - ((z + (Cx(real_of_num(n)) + Cx(real_of_num(1)) / Cx(real_of_num(2)))) * clog(z + Cx(real_of_num(n))) - (z - Cx(real_of_num(1)) / Cx(real_of_num(2))) * clog(z) - Cx(real_of_num(n)) + integral(interval([(lift(real_of_num(0)), lift(real_of_num(n)))]), (x : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(x)))) * (Cx(real_of_num(1)) / pow(z + Cx(drop(x)), 1))) / Cx(real_of_num(1))))"))
  let t3663 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t3660 = @bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_unique())
  let t3661 = @simp.rewrite_rule(@list.List([@metric.trivial_limit_sequentially()]))(t3660)
  let t3662 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(t3661))
  let t3657 = @drule.match_mp(lgamma_alt())
  let t3659 = @tactics.first_assum(fn(x3658 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3655 = @tactics.mp_tac(x3654)
      fn(x3656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3655(x3656)
      }
    })(t3657(x3658))
  })
  let t3653 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_add_rid()])), @tactics.all_tac])
  let t3652 = @tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"), fn(x3649 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3650 = @tactics.assume_tac(x3649)
    fn(x3651 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3650(x3651)
    }
  })
  let t3648 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.im_add(), @complexes.re_add(), @complexes.im_cx(), @complexes.re_cx()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3647 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, !((z : Cart[Real, 2]) + Cx(real_of_num(n)) == Cx(real_of_num(0)))"), fn(x3644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3645 = @tactics.assume_tac(x3644)
    fn(x3646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3645(x3646)
    }
  })
  let t3743 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3647), t3648), t3652), t3653), t3659), t3662), t3663), t3664), t3665), @tactics.conj_tac), t3687), t3688), t3689), t3690), @tactics.conj_tac), t3742)
  let lemma6 = @tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (Im(z) == real_of_num(0) → real_of_num(0) < Re(z)) → lgamma(z) == (z - Cx(real_of_num(1)) / Cx(real_of_num(2))) * clog(z) - z + Cx(real_of_num(1)) + (integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(t)))) / (Cx(real_of_num(1)) + Cx(drop(t)))) - integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(t)))) / (z + Cx(drop(t)))))"), t3743)
  let t3847 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t3846 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t3845 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(1), 2) <= pow((y : Real), 2) && real_of_num(0) <= pow((x : Real) - real_of_num(1), 2) → pow(real_of_num(1) + x, 2) / real_of_num(2) <= pow(x, 2) + pow(y, 2)")))
  let t3844 = @simp.rewrite_tac(@list.List([@realax.real_add_lid(), @calc_int.real_add_rid(), @calc_int.real_neg_0()]))
  let t3843 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.im_add(), @complexes.re_mul_ii(), @complexes.im_mul_ii(), @complexes.im_cx(), @complexes.re_cx()]))
  let t3848 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_sqnorm()])), t3843), t3844), t3845), t3846), t3847), @calc_rat.asm_real_arith_tac)
  let t3842 = @tactics.match_mp_tac(@real.real_pow_le())
  let t3849 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real) / real_of_num(2)) == (real_of_num(0) <= x)"))])), t3842), @calc_rat.asm_real_arith_tac)
  let t3841 = @simp.rewrite_tac(@list.List([@complexes.im_add(), @complexes.im_mul_ii(), @complexes.re_cx(), @complexes.im_cx()]))
  let t3835 = @drule.part_match(fn(x3834 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x3834))
  }, @complexes.complex_norm_ge_re_im())
  let t3850 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.then_tac(@tactics.then_tac(fn(x3840 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x3839 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3837 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x3836 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x3831 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s3832 = @tactics.mp_tac(x3831)
            fn(x3833 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s3832(x3833)
            }
          })(t3835(x3836))
        })(@kernel.rand(x3837))
      })((fn(x3838 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x3838.1
      })(x3839))
    })(x3840)(x3840)
  }, t3841), @calc_rat.real_arith_tac), t3849, t3848])
  let t3830 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3829 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3828 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv(real_of_num(2)) * ((y : Real) * (x : Real)) == y * (x / real_of_num(2))"))]))
  let t3827 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_pow(), @calc_rat.real_arith(@term_syntax.parse_term("pow((x : Real), 3) == x * pow(x, 2)"))]))
  let t3825 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.match_mp_tac(@real.real_pow_lt())])
  let t3824 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t3823 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3826 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_mul()), t3823), t3824), @tactics.conj_tac), t3825), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3822 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3821 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t3820 = @simp.gen_rewrite_tac(fn(x3819 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3813 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3814 = @equal.rand_conv(x3813)
      fn(x3815 : @kernel.Term) -> @kernel.Thm raise {
        s3814(x3815)
      }
    })((fn(x3816 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3817 = @equal.land_conv(x3816)
      fn(x3818 : @kernel.Term) -> @kernel.Thm raise {
        s3817(x3818)
      }
    })(x3819))
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t3811 = @equal.gsym(@realax.real_mul_assoc())
  let t3812 = @simp.rewrite_tac(@list.List([@real.real_pow_inv(), @equal.gsym(@real.real_inv_mul()), t3811]))
  let t3809 = @simp.simp_tac(@list.List([@misc.in_real_interval(), @realarith.real_lt_imp_le(), @floor.floor_frac()]))
  let t3808 = @simp.rewrite_tac(@list.List([@realanalysis.bernoulli_conv(@term_syntax.parse_term("bernoulli(2, real_of_num(0))"))]))
  let t3807 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3806 = @term_syntax.parse_term("frac((x : Real))")
  let t3810 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("3"), t3806]), @realanalysis.bernoulli_bound())), t3807), t3808), @tactics.ants_tac), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t3809), @tactics.all_tac])
  let t3805 = @simp.rewrite_tac(@list.List([@real.real_abs_pos(), @real.real_le_inv_eq(), @vectors.norm_pos_le()]))
  let t3804 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3803 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t3802 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) / real_of_num(2) / (y : Real) * (x : Real) == real_of_num(1) / real_of_num(4) * (real_of_num(2) / y * x)"))]))
  let t3801 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @complexes.complex_norm_cx(), @complexes.re_cx()]))
  let t3797 = @equal.gsym(@complexes.cx_pow())
  let t3798 = @equal.gsym(@complexes.cx_mul())
  let t3799 = @equal.gsym(@complexes.cx_inv())
  let t3800 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t3799, t3798, t3797]))
  let t3796 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t3795 = @simp.rewrite_tac(@list.List([@vectors.forall_lift(), @sets.in_elim_thm(), @vectors.lift_drop(), @equal.gsym(@complexes.re_def())]))
  let t3792 = @simp.rewrite_tac(@list.List([@complexes.re_cx(), @real.real_lt_01()]))
  let t3791 = @tactics.match_mp_tac(lemma2)
  let t3790 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t3793 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.integrable_complex_lmul()), t3790), t3791), t3792), @int.arith_tac)
  let t3789 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @complexes.im_mul_ii(), @complexes.re_cx()]))
  let t3794 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lemma5), t3789), @calc_rat.asm_real_arith_tac), t3793, @tactics.all_tac])
  let t3788 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3787 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t3786 = @tactics.match_mp_tac(@integration.integral_norm_bound_integral_component())
  let t3785 = @simp.rewrite_tac(@list.List([@complexes.re_def()]))
  let t3784 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_ge_re_im()]))
  let t3783 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs(Re((z : Cart[Real, 2]))) <= norm(z) && (x : Real) <= Re(z) → x <= norm(z)")))
  let t3782 = @simp.simp_tac(@list.List([@equal.gsym(@canal.integral_complex_lmul()), lemma2, @integration.absolutely_integrable_imp_integrable(), @calc_num.arith(), @complexes.re_cx(), @real.real_of_num_lt()]))
  let t3781 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t3780 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t3779 = @simp.rewrite_tac(@list.List([@topology.eventually_at_posinfinity(), @realax.real_ge()]))
  let t3777 = @simp.rewrite_tac(@list.List([@transcendentals.lim_inv_x(), @complexes.cx_inv()]))
  let t3776 = @tactics.match_mp_tac(@canal.lim_null_complex_lmul())
  let t3775 = @simp.rewrite_tac(@list.List([@realax.real_div(), @complexes.cx_mul()]))
  let t3778 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.lim_null_complex_rmul()), t3775), t3776), t3777)])
  let t3774 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real) => Cx(real_of_num(1) / real_of_num(2) / y) * integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => pow(inv(Cx(real_of_num(1)) + Cx(drop(t))), 2))"))
  let t3773 = @tactics.match_mp_tac(@canal.lim_null_comparison_complex())
  let t3772 = @tactics.match_mp_tac(@canal.lim_null_complex_rmul())
  let t3771 = @simp.once_rewrite_tac(@list.List([@complexes.complex_div()]))
  let t3769 = @simp.rewrite_tac(@list.List([@transcendentals.lim_inv_x()]))
  let t3768 = @tactics.match_mp_tac(@canal.lim_null_complex_lmul())
  let t3767 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_mul()]))
  let t3766 = @tactics.match_mp_tac(@canal.lim_null_complex_lmul())
  let t3770 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div()])), t3766), t3767), t3768), t3769)])
  let t3765 = @tactics.match_mp_tac(@canal.lim_null_complex_sub())
  let t3761 = @drule.match_mp(@integration.integral_unique())
  let t3763 = @tactics.disch_then(fn(x3762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3758 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3759 = @tactics.subst1_tac(x3758)
      fn(x3760 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3759(x3760)
      }
    })(t3761(x3762))
  })
  let t3757 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_1()]))
  let t3756 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3755 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3754 = @simp.rewrite_tac(@list.List([@vectors.vsum_sing_numseg()]))
  let t3753 = @simp.asm_simp_tac(@list.List([@complexes.im_mul_ii(), @complexes.re_cx(), @real.real_lt_imp_nz(), @arith.le_refl()]))
  let t3751 = @term_syntax.parse_term("1")
  let t3752 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("ii * Cx((y : Real))"), t3751]), lemma4))
  let t3750 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (y : Real)"), fn(x3747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3748 = @tactics.assume_tac(x3747)
    fn(x3749 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3748(x3749)
    }
  })
  let t3746 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t3745 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t3764 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.eventually_at_posinfinity(), @realax.real_ge()])), t3745), t3746), @tactics.disch_tac), t3750), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3752), t3753), t3754), t3755), t3756), t3757), t3763), @tactics.refl_tac), @tactics.all_tac])
  let t3744 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real) => integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(3, frac(drop(t)))) / pow(ii * Cx(y) + Cx(drop(t)), 3)) / Cx(real_of_num(3)) - Cx(bernoulli(2, real_of_num(0)) / real_of_num(2)) / (ii * Cx(y))"))
  let t3851 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.lim_transform_eventually()), t3744), @tactics.conj_tac), t3764), t3765), @tactics.conj_tac), t3770), t3771), t3772), t3773), t3774), @tactics.conj_tac), t3778), t3779), t3780), t3781), @tactics.disch_tac), t3782), t3783), t3784), t3785), t3786), t3787), t3788), t3794), t3795), t3796), @tactics.disch_tac), t3800), t3801), t3802), t3803), t3804), t3805), @tactics.conj_tac), t3810), t3812), t3820), t3821), t3822), @tactics.conj_tac), t3826), t3827), t3828), t3829), t3830), t3850)
  let lemma7 = @tactics.prove(@term_syntax.parse_term("op_minus_minus_gt((y : Real) => integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(t)))) / (ii * Cx(y) + Cx(drop(t)))), Cx(real_of_num(0)), at_posinfinity)"), t3851)
  let t4050 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @transcendentals.pi_pos()]))
  let t4049 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t4048 = @tactics.match_mp_tac(@transcendentals.real_exp_lt_1())
  let t4047 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t4046 = @tactics.match_mp_tac(@real.real_pow_lt_1())
  let t4045 = @tactics.match_mp_tac(@real.real_inv_lt_1())
  let t4044 = @simp.rewrite_tac(@list.List([@realarith.real_sub_lt()]))
  let t4043 = @tactics.match_mp_tac(@equal.gsym(@transcendentals.cx_log()))
  let t4042 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (y : Real)"), fn(x4039 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4040 = @tactics.assume_tac(x4039)
    fn(x4041 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4040(x4041)
    }
  })
  let t4038 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t4037 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t4036 = @simp.rewrite_tac(@list.List([@topology.eventually_at_posinfinity(), @realax.real_ge()]))
  let t4051 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually())), t4036), t4037), t4038), @tactics.disch_tac), t4042), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4043), t4044), t4045), t4046), t4047), t4048), t4049), t4050)
  let t4035 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t4034 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(e : Real)"), @real.real_lt_inv_eq()))
  let t4033 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t4032 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_le_x()]))
  let t4029 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) + (e : Real) <= (x : Real) → real_of_num(1) + pi * x <= (z : Real) && real_of_num(0) <= x * (pi - real_of_num(1)) → e < z")))
  let t4031 = @tactics.first_assum(fn(x4030 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t4029(x4030))
  })
  let t4028 = @simp.asm_rewrite_tac(@list.List([@transcendentals.norm_cexp(), @complexes.re_cx()]))
  let t4027 = @tactics.match_mp_tac(@real.real_lt_linv())
  let t4026 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_rzero(), @complexes.complex_norm_inv()]))
  let t4025 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t4024 = @simp.rewrite_tac(@list.List([@vectors.dist(), @realax.real_ge()]))
  let t4023 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) + inv((e : Real))"))
  let t4022 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t4021 = @simp.rewrite_tac(@list.List([@topology.lim_at_posinfinity()]))
  let t4020 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t4019 = @tactics.match_mp_tac(@canal.lim_null_complex_pow())
  let t4018 = @simp.rewrite_tac(@list.List([@complexes.cx_inv(), @transcendentals.cx_exp(), @complexes.cx_pow(), @equal.gsym(@complexes.complex_pow_inv())]))
  let t4017 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t4016 = @tactics.match_mp_tac(@topology.lim_sub())
  let t4015 = @simp.gen_rewrite_tac(fn(x4012 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4013 = @equal.land_conv(x4012)
    fn(x4014 : @kernel.Term) -> @kernel.Thm raise {
      s4013(x4014)
    }
  }, @list.List([@equal.gsym(@complexes.complex_sub_rzero())]))
  let t4052 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@transcendentals.continuous_at_clog(), @complexes.re_cx(), @real.real_lt_01(), @complexes.cx_sub()])), t4015), t4016), t4017), t4018), t4019), t4020), t4021), t4022), @tactics.disch_tac), t4023), t4024), t4025), @tactics.disch_tac), t4026), t4027), t4028), t4031), t4032), t4033), t4034), t4035), @calc_rat.asm_real_arith_tac), t4051])
  let t4011 = @simp.rewrite_tac(@list.List([@transcendentals.clog_1()]))
  let t4007 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t4008 = @term_syntax.parse_term("(y : Real) => Cx(real_of_num(1) - inv(pow(exp(pi * y), 2)))")
  let t4009 = @term_syntax.parse_term("at_posinfinity")
  let t4010 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("clog"), t4009, t4008, t4007]), @topology.lim_continuous_function()))
  let t4006 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t4005 = @tactics.match_mp_tac(@topology.lim_sub())
  let t4004 = @simp.gen_rewrite_tac(fn(x4001 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4002 = @equal.land_conv(x4001)
    fn(x4003 : @kernel.Term) -> @kernel.Thm raise {
      s4002(x4003)
    }
  }, @list.List([@equal.gsym(@complexes.complex_sub_rzero())]))
  let t4000 = @list.List([@tactics.all_tac, @tactics.conv_tac(@complexes.complex_ring)])
  let t3999 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t3998 = @tactics.match_mp_tac(@canal.lim_complex_div())
  let t3997 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t3996 = @tactics.match_mp_tac(@topology.lim_sub())
  let t3995 = @simp.rewrite_tac(@list.List([@complexes.cx_sub(), @complexes.cx_div()]))
  let t3993 = @simp.rewrite_tac(@list.List([@complexes.cx_inj()]))
  let t3991 = @simp.asm_simp_tac(@list.List([@transcendentals.log_mul(), @transcendentals.real_exp_pos_lt(), @realarith.real_sub_lt(), @transcendentals.log_exp()]))
  let t3990 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @transcendentals.pi_pos()]))
  let t3989 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t3988 = @tactics.match_mp_tac(@transcendentals.real_exp_lt_1())
  let t3987 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t3986 = @tactics.match_mp_tac(@real.real_pow_lt_1())
  let t3992 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_inv_lt_1()), t3986), t3987), t3988), t3989), t3990), t3991])
  let t3985 = @tactics.subgoal_then(@term_syntax.parse_term("inv(pow(exp(pi * (y : Real)), 2)) < real_of_num(1)"), fn(x3982 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3983 = @tactics.assume_tac(x3982)
    fn(x3984 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3983(x3984)
    }
  })
  let t3981 = @simp.simp_tac(@list.List([@transcendentals.real_exp_nz(), @calc_rat.real_field(@term_syntax.parse_term("!((e : Real) == real_of_num(0)) → e - inv(e) == e * (real_of_num(1) - inv(pow(e, 2)))"))]))
  let t3980 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((l2 : Real) + (-(l : Real) + (x : Real))) / real_of_num(2) - (-((py : Real) + l) / real_of_num(2) + real_of_num(1)) == (l2 + (py + x)) / real_of_num(2) - real_of_num(1)"))]))
  let t3978 = @equal.gsym(@complexes.cx_sub())
  let t3979 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t3978]))
  let t3976 = @simp.asm_simp_tac(@list.List([@transcendentals.log_mul(), @real.real_lt_inv_eq(), @transcendentals.pi_pos(), @real.real_lt_mul(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)")), @transcendentals.log_sqrt(), @transcendentals.log_inv()]))
  let t3975 = @simp.asm_rewrite_tac(@list.List([@transcendentals.pi_pos()]))
  let t3974 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t3973 = @tactics.match_mp_tac(@transcendentals.real_exp_lt_1())
  let t3972 = @list.List([@tactics.match_mp_tac(@real.real_inv_lt_1()), @tactics.all_tac])
  let t3977 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(1) && real_of_num(1) < (y : Real) → real_of_num(0) < y - x"))), @tactics.conj_tac), t3972), t3973), t3974), t3975), t3976])
  let t3971 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < exp(pi * (y : Real)) - inv(exp(pi * y))"), fn(x3968 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3969 = @tactics.assume_tac(x3968)
    fn(x3970 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3969(x3970)
    }
  })
  let t3967 = @simp.rewrite_tac(@list.List([@real.real_inv_mul()]))
  let t3966 = @tactics.disch_then(fn(x3963 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3964 = @tactics.subst1_tac(x3963)
    fn(x3965 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3964(x3965)
    }
  })
  let t3962 = @simp.rewrite_tac(@list.List([@real.pow_2_sqrt_abs(), @vectors.real_abs_norm()]))
  let t3958 = @term_syntax.parse_term("sqrt")
  let t3961 = @tactics.disch_then(fn(x3960 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3955 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3956 = @tactics.mp_tac(x3955)
      fn(x3957 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3956(x3957)
      }
    })(((x3959 : @kernel.Thm) => @equal.ap_term(t3958, x3959))(x3960))
  })
  let t3954 = @simp.rewrite_tac(@list.List([@complexes.cx_inj(), @equal.gsym(@complexes.cx_pow())]))
  let t3950 = @equal.gsym(@complexes.cx_inv())
  let t3951 = @equal.gsym(@complexes.cx_mul())
  let t3952 = @equal.gsym(@complexes.cx_sub())
  let t3953 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inv()), t3952, t3951, t3950]))
  let t3949 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_sub()]))
  let t3948 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lneg(), @equal.gsym(@complexes.complex_mul_rneg()), @complexes.complex_neg_inv()]))
  let t3945 = @equal.gsym(@transcendentals.cx_exp())
  let t3946 = @equal.gsym(@complexes.cx_mul())
  let t3947 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_inv_mul()), t3946, t3945, @transcendentals.cexp_neg()]))
  let t3944 = @simp.asm_simp_tac(@list.List([@complexes.cx_inj(), @real.real_lt_imp_nz(), @complexes.complex_field(@term_syntax.parse_term("!((y : Cart[Real, 2]) == Cx(real_of_num(0))) → (ii * (y * (z : Cart[Real, 2])) == -((p : Cart[Real, 2]) * ((i : Cart[Real, 2]) * (Cx(real_of_num(2)) * ii)))) == (z == -(Cx(real_of_num(2)) * p) * (inv(y) * i))"))]))
  let t3943 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_inv(), @complexes.complex_inv_mul(), @complexes.complex_inv_neg(), @complexes.complex_mul_rneg()]))
  let t3942 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("ii * ((x : Cart[Real, 2]) * (ii * (y : Cart[Real, 2]))) == -(x * y)"))]))
  let t3941 = @simp.rewrite_tac(@list.List([@transcendentals.csin(), @complexes.complex_ring(@term_syntax.parse_term("-ii * ((x : Cart[Real, 2]) * (ii * (y : Cart[Real, 2]))) == x * y"))]))
  let t3940 = @simp.rewrite_tac(@list.List([@complexes.complex_add_rid(), @complexes.complex_mul_rid()]))
  let t3939 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rzero(), @complexes.cx_neg(), @complexes.complex_mul_rneg()]))
  let t3937 = @equal.gsym(@transcendentals.cx_cos())
  let t3938 = @simp.rewrite_tac(@list.List([@transcendentals.csin_add(), @equal.gsym(@transcendentals.cx_sin()), t3937, @transcendentals.sin_pi(), @transcendentals.cos_pi()]))
  let t3936 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(w : Cart[Real, 2]) * ((z : Cart[Real, 2]) + Cx(real_of_num(1))) == w * z + w"))]))
  let t3935 = @tactics.disch_then(fn(x3934 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3932 = @tactics.subst1_tac(x3931)
      fn(x3933 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3932(x3933)
      }
    })(@equal.sym(x3934))
  })
  let t3930 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lneg(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t3929 = @simp.rewrite_tac(@list.List([@complexes.cnj_mul(), @complexes.cnj_ii(), @complexes.cnj_cx(), cnj_cgamma()]))
  let t3928 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("cgamma(ii * Cx((y : Real)))"), @complexes.complex_norm_pow_2()))
  let t3927 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(1)) - ((z : Cart[Real, 2]) + Cx(real_of_num(1))) == -z"))]))
  let t3926 = @simp.asm_simp_tac(@list.List([@real.real_lt_imp_nz()]))
  let t3925 = @simp.rewrite_tac(@list.List([cgamma_recurrence(), @complexes.complex_entire(), @complexes.ii_nz(), @complexes.cx_inj()]))
  let t3924 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("ii * Cx((y : Real)) + Cx(real_of_num(1))"), cgamma_reflection()))
  let t3923 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (y : Real)"), fn(x3920 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3921 = @tactics.assume_tac(x3920)
    fn(x3922 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3921(x3922)
    }
  })
  let t3919 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t3994 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)")), t3919), @tactics.disch_tac), t3923), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3924), t3925), t3926), t3927), t3928), t3929), t3930), t3935), t3936), t3938), t3939), t3940), t3941), t3942), t3943), t3944), t3947), t3948), t3949), t3953), t3954), t3961), t3962), t3966), t3967), t3971), t3977), t3979), t3980), t3981), t3985), t3992), t3993), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3918 = @simp.rewrite_tac(@list.List([@topology.eventually_at_posinfinity(), @realax.real_ge()]))
  let t3917 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real) => Cx((log(real_of_num(2) * pi) - log(real_of_num(1) - inv(pow(exp(pi * y), 2)))) / real_of_num(2) - real_of_num(1))"))
  let t3916 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t3912 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.im_add(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re_mul_ii(), @complexes.im_mul_ii()]))
  let t3911 = @simp.asm_simp_tac(@list.List([@complexes.re_cx(), @complexes.im_cx(), @realarith.real_lt_imp_le(), @complexes.cx_inj(), @real.real_lt_imp_nz(), @equal.gsym(@transcendentals.cx_log()), @transcendentals.clog_mul_ii()]))
  let t3910 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc()), @complexes.re_mul_ii(), @complexes.im_mul_ii(), @complexes.re_mul_cx(), @complexes.im_mul_cx()]))
  let t3909 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_rdistrib(), @complexes.re_sub(), @equal.gsym(@complexes.cx_div())]))
  let t3908 = @tactics.conv_tac(@equal.sym_conv)
  let t3913 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac), @tactics.ap_term_tac), t3908), t3909), t3910), t3911), t3912), @calc_rat.real_arith_tac)
  let t3905 = @simp.rewrite_tac(@list.List([@transcendentals.norm_cexp(), @transcendentals.log_exp()]))
  let t3906 = @tactics.then_tac(@tactics.disch_then(fn(x3902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3903 = @tactics.subst1_tac(x3902)
    fn(x3904 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3903(x3904)
    }
  }), t3905)
  let t3901 = @simp.rewrite_tac(@list.List([@complexes.im_add(), @complexes.im_mul_ii(), @complexes.im_cx(), @complexes.re_cx()]))
  let t3898 = @term_syntax.parse_term("Im")
  let t3907 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.choose_then(fn(x3900 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3896 = @tactics.mp_tac(x3895)
      fn(x3897 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3896(x3897)
      }
    })(((x3899 : @kernel.Thm) => @equal.ap_term(t3898, x3899))(x3900))
  })), t3901), @calc_rat.asm_real_arith_tac), t3906])
  let t3914 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("ii * Cx((y : Real))"), cgamma_lgamma())), @class.cond_cases_tac), t3907), t3913])
  let t3894 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (y : Real)"), fn(x3891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3892 = @tactics.assume_tac(x3891)
    fn(x3893 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3892(x3893)
    }
  })
  let t3890 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t3915 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)")), t3890), @tactics.disch_tac), t3894), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.binop_tac), t3914), @tactics.all_tac])
  let t3889 = @simp.rewrite_tac(@list.List([@topology.eventually_at_posinfinity(), @realax.real_ge()]))
  let t3888 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real) => Cx(log(norm(cgamma(ii * Cx(y))))) - (Cx(-(pi * y + log(y)) / real_of_num(2)) + Cx(real_of_num(1)))"))
  let t3887 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t3886 = @simp.rewrite_tac(@list.List([@complexes.re_mul_ii(), @complexes.im_cx(), @calc_int.real_neg_0(), @complexes.complex_sub_rzero(), @complexes.re_cx()]))
  let t3884 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @complexes.complex_norm_ge_re_im()]))
  let t3883 = @tactics.match_mp_tac(@metric.always_eventually())
  let t3882 = @simp.rewrite_tac(@list.List([lemma7]))
  let t3881 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real) => integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(t)))) / (ii * Cx(y) + Cx(drop(t))))"))
  let t3885 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.lim_null_comparison_complex()), t3881), t3882), t3883), t3884)])
  let t3880 = @tactics.match_mp_tac(@topology.lim_add())
  let t3879 = @simp.gen_rewrite_tac(fn(x3876 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3877 = @equal.land_conv(x3876)
    fn(x3878 : @kernel.Term) -> @kernel.Thm raise {
      s3877(x3878)
    }
  }, @list.List([@equal.gsym(@complexes.complex_add_rid())]))
  let t3875 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_sub(), @complexes.cx_add(), @complexes.cx_sub()]))
  let t3873 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(s : Cart[Real, 2]) + ((i : Cart[Real, 2]) - (j : Cart[Real, 2])) - s + j == i"))]))
  let t3872 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x3869 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3870 = @tactics.subst1_tac(x3869)
    fn(x3871 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3870(x3871)
    }
  })])
  let t3868 = @simp.asm_simp_tac(@list.List([@complexes.im_mul_ii(), @complexes.re_cx(), @real.real_lt_imp_nz()]))
  let t3867 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("ii * Cx((y : Real))"), lemma6))
  let t3866 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t3874 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)")), t3866), @tactics.disch_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t3867), t3868), @tactics.ants_tac), t3872), t3873), @tactics.all_tac])
  let t3865 = @simp.rewrite_tac(@list.List([@topology.eventually_at_posinfinity(), @realax.real_ge()]))
  let t3864 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real) => Cx(Re(lgamma(ii * Cx(y)) - ((ii * Cx(y) - Cx(real_of_num(1)) / Cx(real_of_num(2))) * clog(ii * Cx(y)) - ii * Cx(y) + Cx(real_of_num(1))) + integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(t)))) / (ii * Cx(y) + Cx(drop(t))))))"))
  let t3863 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t3862 = @simp.rewrite_tac(@list.List([@topology.trivial_limit_at_posinfinity(), @topology.lim_const()]))
  let t3861 = @tactics.exists_tac(@term_syntax.parse_term("(y : Real) => Cx(Re(integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(t)))) / (Cx(real_of_num(1)) + Cx(drop(t))))))"))
  let t3860 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("at_posinfinity"), @topology.lim_unique()))
  let t3858 = @simp.gen_rewrite_tac(fn(x3857 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3857
  }, @list.List([@equal.gsym(@complexes.cx_inj())]))
  let t3854 = @equal.gsym(@complexes.cx_div())
  let t3855 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t3854, @complexes.real_cx()]))
  let t3853 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl(), @complexes.re_cx(), @real.real_lt_01()]))
  let t3852 = @tactics.match_mp_tac(lemma5)
  let t3856 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) + (x : Cart[Real, 2]) == pow(z + x, 1)"))])), t3852), t3853), t3855])
  let t3859 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.real_complex_integral()), @tactics.conj_tac), t3856), t3858])
  let t4053 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([@complexes.real_v1()]), @term_syntax.parse_term("real((z : Cart[Real, 2])) && Re(z) == (y : Real) → z == Cx(y)"))), @tactics.conj_tac), t3859), t3860), t3861), t3862), t3863), t3864), t3865), @tactics.conj_tac), t3874), t3875), t3879), t3880), @tactics.conj_tac), t3885), t3886), t3887), t3888), t3889), @tactics.conj_tac), t3915), t3916), t3917), t3918), @tactics.conj_tac), t3994), t3995), t3996), t3997), t3998), t3999), @tactics.conj_tac), t4000), t4004), t4005), t4006), t4010), t4011), @tactics.ants_tac), t4052)
  let lemma8 = @tactics.prove(@term_syntax.parse_term("integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(1, frac(drop(t)))) / (Cx(real_of_num(1)) + Cx(drop(t)))) == Cx(log(real_of_num(2) * pi) / real_of_num(2) - real_of_num(1))"), t4053)
  let t4071 = @simp.rewrite_tac(@list.List([@complexes.complex_add_sym()]))
  let t4070 = @simp.rewrite_tac(@list.List([@complexes.complex_sub(), @complexes.complex_neg_add(), @vectors.vector_neg_neg()]))
  let t4067 = @drule.match_mp(@integration.integral_unique())
  let t4069 = @tactics.disch_then(fn(x4068 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4064 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4065 = @tactics.subst1_tac(x4064)
      fn(x4066 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4065(x4066)
      }
    })(t4067(x4068))
  })
  let t4063 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t4062 = @term_syntax.parse_term("(p : Num)")
  let t4072 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2])"), t4062]), lemma4)), t4063), t4069), t4070), t4071)
  let t4061 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_1(), @complexes.complex_div_1(), @vectors.vector_add_lid()]))
  let t4060 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t4073 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vsum_clauses_numseg()])), t4060), t4061), t4072])
  let t4059 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0"))
  let t4058 = @simp.rewrite_tac(@list.List([@complexes.complex_sub(), @equal.gsym(@complexes.complex_add_assoc())]))
  let t4057 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(x : Cart[Real, 2]) + Cx(real_of_num(1)) + ((a : Cart[Real, 2]) - Cx(real_of_num(1)) - (b : Cart[Real, 2])) == x + a - b"))]))
  let t4056 = @simp.rewrite_tac(@list.List([lemma8, @complexes.cx_sub()]))
  let t4055 = @simp.asm_simp_tac(@list.List([lemma6]))
  let t4054 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4074 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.match_accept_tac(lemma5), @tactics.all_tac])), t4054), t4055), t4056), t4057), t4058), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t4059), t4073)
  let t4075 = (@term_syntax.parse_term("(∀ z : Cart[Real, 2], ∀ n : Num, 1 <= n && (Im(z) == real_of_num(0) → real_of_num(0) < Re(z)) → integrable_on((t : Cart[Real, Unit]) => Cx(bernoulli(n, frac(drop(t)))) / pow(z + Cx(drop(t)), n), {(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)})) && (∀ z : Cart[Real, 2], ∀ p : Num, (Im(z) == real_of_num(0) → real_of_num(0) < Re(z)) → lgamma(z) == (z - Cx(real_of_num(1)) / Cx(real_of_num(2))) * clog(z) - z + Cx(log(real_of_num(2) * pi) / real_of_num(2)) + (vsum(op_dot_dot(1, p), (k : Num) => Cx(bernoulli(2 * k, real_of_num(0)) / (real_of_num(4) * pow(real_of_num(k), 2) - real_of_num(2) * real_of_num(k))) / pow(z, 2 * k - 1)) - integral({(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)}, (t : Cart[Real, Unit]) => Cx(bernoulli(2 * p + 1, frac(drop(t)))) / pow(z + Cx(drop(t)), 2 * p + 1)) / Cx(real_of_num(2 * p + 1))))"), t4074)
  let (lgamma_stirling_integrals_exist, lgamma_stirling) = @bool.conj_pair((fn(x3345 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x3345.0, x3345.1)
  })(t4075))
  lgamma_stirling_integrals_exist_c.set(lgamma_stirling_integrals_exist)
  lgamma_stirling_c.set(lgamma_stirling)
}

///|
/// LOG_GAMMA_STIRLING
fn step_83() -> Unit raise {
  let t4157 = @meson.meson_tac(@list.List([@vectors.lift_drop()]))
  let t4156 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()]))
  let t4155 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t4151 = @equal.gsym(@complexes.re_def())
  let t4152 = @equal.gsym(@complexes.cx_div())
  let t4153 = @equal.gsym(@complexes.cx_pow())
  let t4154 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t4153, t4152, @complexes.re_cx(), t4151]))
  let t4150 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t4146 = @term_syntax.parse_term("1")
  let t4149 = @tactics.disch_then(fn(x4148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4144 = @tactics.mp_tac(x4143)
      fn(x4145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4144(x4145)
      }
    })(((x4147 : @kernel.Thm) => @bool.spec(t4146, x4147))(x4148))
  })
  let t4142 = @simp.gen_rewrite_tac(fn(x4139 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4140 = @equal.land_conv(x4139)
    fn(x4141 : @kernel.Term) -> @kernel.Thm raise {
      s4140(x4141)
    }
  }, @list.List([@integration.integrable_componentwise()]))
  let t4138 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx(), @int.arith_rule(@term_syntax.parse_term("1 <= 2 * (p : Num) + 1"))]))
  let t4136 = @term_syntax.parse_term("2 * (p : Num) + 1")
  let t4137 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("Cx((x : Real))"), t4136]), lgamma_stirling_integrals_exist()))
  let t4135 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_on_v1(), @trivia.o_def()]))
  let t4133 = @tactics.match_mp_tac(@equal.gsym(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@realanalysis.real_integral_v1())))
  let t4132 = @meson.meson_tac(@list.List([@vectors.lift_drop()]))
  let t4134 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()])), t4132), t4133])
  let t4131 = @tactics.subgoal_then(@term_syntax.parse_term("{(t : Cart[Real, Unit]) | real_of_num(0) <= drop(t)} == IMAGE(lift, {(t : Real) | real_of_num(0) <= t})"), fn(x4128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4129 = @tactics.subst1_tac(x4128)
    fn(x4130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4129(x4130)
    }
  })
  let t4127 = @simp.rewrite_tac(@list.List([@vectors.lift_num(), @integration.integral_0(), @vectors.drop_vec()]))
  let t4124 = @equal.gsym(@complexes.cx_div())
  let t4125 = @equal.gsym(@complexes.cx_pow())
  let t4126 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t4125, t4124, @complexes.re_cx(), @complexes.im_cx()]))
  let t4122 = @equal.gsym(@complexes.im_def())
  let t4123 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t4122]))
  let t4121 = @tactics.disch_then(fn(x4118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4119 = @tactics.subst1_tac(x4118)
    fn(x4120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4119(x4120)
    }
  })
  let t4117 = @simp.asm_simp_tac(@list.List([lgamma_stirling_integrals_exist(), @int.arith_rule(@term_syntax.parse_term("1 <= 2 * (p : Num) + 1")), @complexes.re_cx()]))
  let t4111 = @drule.part_match(fn(x4110 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x4110))
  }, @integration.integral_component())
  let t4106 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()]))
  let t4105 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_cx(), @complexes.im_cx()]))
  let t4104 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @complexes.cx_pow()]))
  let t4103 = @simp.rewrite_tac(@list.List([@complexes.cx_add(), @complexes.cx_sub(), @complexes.cx_div(), @complexes.cx_mul(), @equal.gsym(@complexes.vsum_cx())]))
  let t4102 = @tactics.disch_then(fn(x4099 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4100 = @tactics.subst1_tac(x4099)
    fn(x4101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4100(x4101)
    }
  })
  let t4098 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx(), cx_gamma()]))
  let t4096 = @term_syntax.parse_term("(p : Num)")
  let t4097 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx((x : Real))"), t4096]), lgamma_stirling()))
  let t4095 = @simp.rewrite_tac(@list.List([@transcendentals.cx_exp()]))
  let t4094 = @tactics.disch_then(fn(x4091 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4092 = @tactics.subst1_tac(x4091)
    fn(x4093 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4092(x4093)
    }
  })
  let t4089 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_cx()]))
  let t4086 = @term_syntax.parse_term("Re")
  let t4090 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.choose_then(fn(x4088 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4083 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4084 = @tactics.mp_tac(x4083)
      fn(x4085 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4084(x4085)
      }
    })(((x4087 : @kernel.Thm) => @equal.ap_term(t4086, x4087))(x4088))
  })), t4089), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4082 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("Cx((x : Real))"), cgamma_lgamma()))
  let t4081 = @simp.rewrite_tac(@list.List([cx_gamma()]))
  let t4080 = @simp.gen_rewrite_tac(fn(x4079 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4079
  }, @list.List([@equal.gsym(@complexes.cx_inj())]))
  let t4078 = @simp.asm_simp_tac(@list.List([@transcendentals.exp_log(), gamma_pos_lt()]))
  let t4077 = @simp.gen_rewrite_tac(fn(x4076 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4076
  }, @list.List([@equal.gsym(@transcendentals.real_exp_inj())]))
  let t4158 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4077), t4078), t4080), t4081), t4082), @class.cond_cases_tac), t4090), t4094), t4095), @tactics.ap_term_tac), t4097), t4098), t4102), t4103), t4104), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t4105), t4106), @tactics.conj_tac), fn(x4116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x4115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4113 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x4112 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x4107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s4108 = @tactics.mp_tac(x4107)
            fn(x4109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s4108(x4109)
            }
          })(t4111(x4112))
        })(@equal.lhand(x4113))
      })((fn(x4114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x4114.1
      })(x4115))
    })(x4116)(x4116)
  }), t4117), t4121), t4123), t4126), t4127), t4131), t4134), t4135), t4137), t4138), t4142), t4149), t4150), t4154), t4155), @tactics.ap_term_tac), t4156), t4157)
  log_gamma_stirling_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ p : Num, real_of_num(0) < x → log(gamma(x)) == (x - real_of_num(1) / real_of_num(2)) * log(x) - x + log(real_of_num(2) * pi) / real_of_num(2) + (sum(op_dot_dot(1, p), (k : Num) => bernoulli(2 * k, real_of_num(0)) / (real_of_num(4) * pow(real_of_num(k), 2) - real_of_num(2) * real_of_num(k)) / pow(x, 2 * k - 1)) - real_integral({(t : Real) | real_of_num(0) <= t}, (t : Real) => bernoulli(2 * p + 1, frac(t)) / pow(x + t, 2 * p + 1)) / real_of_num(2 * p + 1))"), t4158))
}

///|
let log_gamma_stirling_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOG_GAMMA_STIRLING")

///|
/// `LOG_GAMMA_STIRLING`
pub fn log_gamma_stirling() -> @kernel.Thm {
  log_gamma_stirling_c.get()
}

///|
/// CSIN_PRODUCT
fn step_84() -> Unit raise {
  let t4276 = @tactics.conv_tac(@complexes.complex_field)
  let t4277 = @list.List([@simp.asm_simp_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1()])), t4276])
  let t4275 = @tactics.subgoal_then(@term_syntax.parse_term("!(Cx(real_of_num((k : Num))) == Cx(real_of_num(0)))"), fn(x4272 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4273 = @tactics.mp_tac(x4272)
    fn(x4274 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4273(x4274)
    }
  })
  let t4271 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t4270 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t4269 = @tactics.match_mp_tac(@complexes.cproduct_eq())
  let t4266 = @equal.gsym(@complexes.cproduct_mul())
  let t4267 = @equal.gsym(@complexes.cproduct_inv())
  let t4268 = @simp.simp_tac(@list.List([@equal.gsym(@products.nproduct_fact()), @products.real_of_num_nproduct(), @complexes.cx_product(), @iterate.finite_numseg(), t4267, t4266]))
  let t4265 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid()]))
  let t4264 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_rinv(), @complexes.cx_inj(), @realax.real_of_num_eq(), @transcendentals.cpow_eq_0(), @arith.le_1()]))
  let t4262 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(n : Cart[Real, 2]) + (Cx(real_of_num(1)) - (z : Cart[Real, 2])) == n + Cx(real_of_num(1)) - z"))]))
  let t4261 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t4260 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t4256 = @term_syntax.parse_term("(norm : (Cart[Real, 2]) -> Real)")
  let t4259 = @tactics.disch_then(fn(x4258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4254 = @tactics.mp_tac(x4253)
      fn(x4255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4254(x4255)
      }
    })(((x4257 : @kernel.Thm) => @equal.ap_term(t4256, x4257))(x4258))
  })
  let t4263 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_sub_0(), @equal.gsym(@complexes.cx_add())])), t4259), t4260), t4261), @calc_rat.asm_real_arith_tac), t4262])
  let t4252 = @tactics.subgoal_then(@term_syntax.parse_term("!(Cx(real_of_num((n : Num))) + Cx(real_of_num(1)) - (z : Cart[Real, 2]) == Cx(real_of_num(0)))"), fn(x4249 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4250 = @tactics.assume_tac(x4249)
    fn(x4251 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4250(x4251)
    }
  })
  let t4248 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * ((c : Cart[Real, 2]) * ((d : Cart[Real, 2]) * ((e : Cart[Real, 2]) * ((f : Cart[Real, 2]) * ((g : Cart[Real, 2]) * ((h : Cart[Real, 2]) * ((i : Cart[Real, 2]) * ((j : Cart[Real, 2]) * (k : Cart[Real, 2])))))))))) == a * i * (j * e * (h * b * (c * (d * g * (f * k)))))"))]))
  let t4247 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc())]))
  let t4246 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_mul(), @complexes.complex_inv_inv()]))
  let t4245 = @simp.asm_simp_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1()]))
  let t4244 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_sub(), @transcendentals.cpow_n(), @complexes.complex_pow_1()]))
  let t4243 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(MAX((a : Num), (b : Num)) <= (c : Num)) == (a <= c && b <= c)"))]))
  let t4242 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4241 = @tactics.exists_tac(@term_syntax.parse_term("MAX(1, (N : Num))"))
  let t4238 = @term_syntax.parse_term("(N : Num)")
  let t4240 = @tactics.disch_then((x4239 : @kernel.Thm) => @tactics.x_choose_tac(t4238, x4239))
  let t4237 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("norm((z : Cart[Real, 2]))"), @real.real_arch_simple()))
  let t4236 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4235 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually()))
  let t4234 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid()]))
  let t4229 = @drule.match_mp(@canal.lim_complex_mul())
  let t4231 = @tactics.disch_then(fn(x4230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4227 = @tactics.mp_tac(x4226)
      fn(x4228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4227(x4228)
      }
    })(t4229(x4230))
  })
  let t4232 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_imp()])), t4231)
  let t4225 = @simp.simp_tac(@list.List([@complexes.complex_mul_rinv(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1()]))
  let t4224 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4223 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4222 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t4221 = @simp.simp_tac(@list.List([@transcendentals.lim_inv_n(), @canal.lim_null_complex_lmul()]))
  let t4220 = @tactics.match_mp_tac(@topology.lim_add())
  let t4219 = @simp.gen_rewrite_tac(fn(x4216 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4217 = @equal.land_conv(x4216)
    fn(x4218 : @kernel.Term) -> @kernel.Thm raise {
      s4217(x4218)
    }
  }, @list.List([@equal.gsym(@complexes.complex_add_rid())]))
  let t4215 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_add_rdistrib()]))
  let t4214 = @list.List([@tactics.all_tac, @tactics.conv_tac(@complexes.complex_ring)])
  let t4213 = @tactics.match_mp_tac(@canal.lim_complex_inv())
  let t4212 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_inv_div())]))
  let t4233 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x4209 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4210 = @equal.land_conv(x4209)
    fn(x4211 : @kernel.Term) -> @kernel.Thm raise {
      s4210(x4211)
    }
  }, @list.List([@equal.gsym(@complexes.complex_inv_1())])), t4212), t4213), @tactics.conj_tac), t4214), t4215), t4219), t4220), t4221), t4222), t4223), t4224), t4225), t4232])
  let t4208 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_gt((n : Num) => Cx(real_of_num(n)) / (Cx(real_of_num(n)) + (Cx(real_of_num(1)) - (z : Cart[Real, 2]))), Cx(real_of_num(1)), sequentially)"), fn(x4205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4206 = @tactics.mp_tac(x4205)
    fn(x4207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4206(x4207)
    }
  })
  let t4204 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @complexes.cx_add(), @arith.add_sub()]))
  let t4201 = @drule.match_mp(@canal.lim_complex_mul())
  let t4203 = @tactics.disch_then(fn(x4202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4199 = @tactics.mp_tac(x4198)
      fn(x4200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4199(x4200)
      }
    })(t4201(x4202))
  })
  let t4197 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses_right(), @int.arith_rule(@term_syntax.parse_term("0 < (n : Num) + 1 && 1 <= n + 1"))]))
  let t4196 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @complexes.complex_add_rid(), @equal.gsym(@theorems.imp_conj_alt())]))
  let t4195 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses_left(), @arith.le_0()]))
  let t4192 = @term_syntax.parse_term("1")
  let t4193 = @term_syntax.parse_term("(m : Num)")
  let t4194 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t4193, t4192]), @complexes.cproduct_offset()))]))
  let t4191 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), @realax.real_of_num_add()]))
  let t4190 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(1)) - (z : Cart[Real, 2]) + (m : Cart[Real, 2]) == m + Cx(real_of_num(1)) - z"))]))
  let t4189 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(1)) - (z : Cart[Real, 2])"), recip_cgamma()))
  let t4188 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), recip_cgamma()))
  let t4187 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t4181 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t4182 = @tactics.spec_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"), t4181)
  let t4180 = @tactics.pop_assum_list(fn(x4179 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t4178 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_div(), @complexes.complex_inv_mul()]))
  let t4177 = @simp.rewrite_tac(@list.List([@equal.gsym(cgamma_reflection())]))
  let t4176 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_inv_div())]))
  let t4175 = @tactics.match_mp_tac(@canal.lim_complex_lmul())
  let t4183 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc())])), t4175), t4176), t4177), t4178), t4180), t4182)
  let t4174 = @tactics.conv_tac(@complexes.complex_field)
  let t4173 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj())]))
  let t4184 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_nz()), t4173), t4174), t4183])
  let t4172 = @tactics.subgoal_then(@term_syntax.parse_term("csin(Cx(pi) * (w : Cart[Real, 2])) == Cx(pi) * (csin(Cx(pi) * w) / Cx(pi))"), fn(x4169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4170 = @tactics.subst1_tac(x4169)
    fn(x4171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4170(x4171)
    }
  })
  let t4185 = @tactics.thenl(@tactics.then_tac(@simp.expand_tac("z"), t4172), t4184)
  let t4168 = @tactics.conv_tac(@complexes.complex_field)
  let t4167 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj())]))
  let t4166 = @tactics.mp_tac(@transcendentals.pi_nz())
  let t4186 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("w"), t4166), t4167), t4168), t4185])
  let t4165 = @tactics.subgoal_then(@term_syntax.parse_term("Cx(pi) * (w : Cart[Real, 2]) == (z : Cart[Real, 2])"), fn(x4162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4163 = @tactics.assume_tac(x4162)
    fn(x4164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4163(x4164)
    }
  })
  let t4161 = @simp.abbrev_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) == (z : Cart[Real, 2]) / Cx(pi)"))
  let t4160 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t4159 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc()]))
  let t4278 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@complexes.cx_mul(), @complexes.complex_div(), @complexes.complex_inv_mul()]))), t4159), t4160), t4161), t4165), t4186), t4187), t4188), t4189), t4190), t4191), t4194), t4195), t4196), t4197), t4203), t4204), t4208), t4233), t4234), t4235), t4236), t4237), t4240), t4241), t4242), t4243), @tactics.strip_tac), t4244), t4245), t4246), t4247), t4248), t4252), t4263), t4264), t4265), @tactics.ap_term_tac), t4268), t4269), t4270), t4271), @tactics.strip_tac), t4275), t4277)
  csin_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], op_minus_minus_gt((n : Num) => z * cproduct(op_dot_dot(1, n), (m : Num) => Cx(real_of_num(1)) - pow(z / Cx(pi * real_of_num(m)), 2)), csin(z), sequentially)"), t4278))
}

///|
let csin_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CSIN_PRODUCT")

///|
/// `CSIN_PRODUCT`
pub fn csin_product() -> @kernel.Thm {
  csin_product_c.get()
}

///|
/// SIN_PRODUCT
fn step_85() -> Unit raise {
  let t4281 = @simp.rewrite_tac(@list.List([@complexes.cx_sub(), @complexes.cx_div(), @complexes.cx_pow(), @complexes.cx_mul()]))
  let t4280 = @simp.simp_tac(@list.List([@complexes.cx_mul(), @complexes.cx_product(), @iterate.finite_numseg(), @transcendentals.cx_sin()]))
  let t4279 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_complex(), @trivia.o_def()]))
  let t4282 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx((x : Real))"), csin_product()))), t4279), t4280), t4281)
  sin_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, op_minus_minus_minus_gt((n : Num) => x * product(op_dot_dot(1, n), (m : Num) => real_of_num(1) - pow(x / (pi * real_of_num(m)), 2)), sin(x), sequentially)"), t4282))
}

///|
let sin_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_PRODUCT")

///|
/// `SIN_PRODUCT`
pub fn sin_product() -> @kernel.Thm {
  sin_product_c.get()
}

///|
/// WALLIS_ALT
fn step_86() -> Unit raise {
  let t4306 = @tactics.conv_tac(@calc_rat.real_field)
  let t4305 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t4304 = @tactics.match_mp_tac(@products.product_eq_numseg())
  let t4303 = @simp.simp_tac(@list.List([@equal.gsym(@products.product_inv()), @iterate.finite_numseg()]))
  let t4302 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4301 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4300 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4299 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.reallim_transform_eventually()))
  let t4298 = @simp.simp_tac(@list.List([@realarith.real_mul_rid(), @transcendentals.pi_nz(), @calc_rat.real_field(@term_syntax.parse_term("!(pi == real_of_num(0)) → pi * (x : Real) * inv(pi) == x && inv(pi) * real_of_num(2) * (pi * inv(real_of_num(2)) * (y : Real)) == y"))]))
  let t4295 = @drule.match_mp(@realanalysis.reallim_lmul())
  let t4292 = @term_syntax.parse_term("inv(pi) * real_of_num(2)")
  let t4297 = @tactics.disch_then(fn(x4296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4290 = @tactics.mp_tac(x4289)
        fn(x4291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4290(x4291)
        }
      })(((x4293 : @kernel.Thm) => @bool.spec(t4292, x4293))(x4294))
    })(t4295(x4296))
  })
  let t4288 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @realax.real_mul_assoc(), @real.real_inv_inv()]))
  let t4287 = @simp.rewrite_tac(@list.List([@transcendentals.sin_pi2()]))
  let t4286 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("pi / real_of_num(2)"), sin_product()))
  let t4284 = @tactics.conv_tac(@calc_rat.real_field)
  let t4285 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), t4284)])
  let t4283 = @tactics.match_mp_tac(@realanalysis.reallim_inv())
  let t4307 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_inv_inv())])), t4283), @tactics.conj_tac), t4285), t4286), t4287), t4288), t4297), t4298), t4299), t4300), t4301), t4302), @tactics.disch_tac), t4303), t4304), t4305), t4306)
  wallis_alt_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => product(op_dot_dot(1, n), (k : Num) => real_of_num(2) * real_of_num(k) / (real_of_num(2) * real_of_num(k) - real_of_num(1)) * (real_of_num(2) * real_of_num(k) / (real_of_num(2) * real_of_num(k) + real_of_num(1)))), pi / real_of_num(2), sequentially)"), t4307))
}

///|
let wallis_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WALLIS_ALT")

///|
/// `WALLIS_ALT`
pub fn wallis_alt() -> @kernel.Thm {
  wallis_alt_c.get()
}

///|
/// WALLIS
fn step_87() -> Unit raise {
  let t4332 = @tactics.conv_tac(@calc_rat.real_field)
  let t4331 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t4329 = @term_syntax.parse_term("2 * (n : Num)")
  let t4330 = @tactics.map_every(fn(x4328 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4323 = @tactics.mp_tac(x4322)
      fn(x4324 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4323(x4324)
      }
    })((fn(x4327 : @kernel.Term) -> @kernel.Thm raise {
      (fn(x4325 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x4326 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.spec(x4325, x4326)
        }
      })(x4327)(@arith.fact_nz())
    })(x4328))
  }, @list.List([@term_syntax.parse_term("(n : Num)"), t4329]))
  let t4320 = @equal.gsym(@realax.real_of_num_mul())
  let t4321 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), t4320]))
  let t4319 = @simp.rewrite_tac(@list.List([@arith.fact(), @realax.real_pow(), @equal.gsym(@realax.real_of_num_mul())]))
  let t4317 = @int.arith_rule(@term_syntax.parse_term("2 * SUC((n : Num)) == SUC(SUC(2 * n))"))
  let t4318 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), t4317]))
  let t4316 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]))
  let t4315 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4314 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4313 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t4312 = @simp.rewrite_tac(@list.List([@products.product_clauses_numseg()]))
  let t4311 = @tactics.match_mp_tac(@nums.num_induction())
  let t4310 = @simp.rewrite_tac(@list.List([]))
  let t4309 = @tactics.match_mp_tac(@metric.always_eventually())
  let t4308 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.reallim_transform_eventually()))
  let t4333 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(wallis_alt()), t4308), t4309), t4310), t4311), t4312), t4313), t4314), t4315), @tactics.disch_tac), t4316), t4318), t4319), t4321), t4330), t4331), t4332)
  wallis_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => pow(pow(real_of_num(2), n) * real_of_num(FACT(n)), 4) / (real_of_num(FACT(2 * n)) * real_of_num(FACT(2 * n + 1))), pi / real_of_num(2), sequentially)"), t4333))
}

///|
let wallis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WALLIS")

///|
/// `WALLIS`
pub fn wallis() -> @kernel.Thm {
  wallis_c.get()
}

///|
/// GAUSSIAN_INTEGRAL
fn step_88() -> Unit raise {
  let t4478 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t4477 = @tactics.match_mp_tac(@real.real_pow_mono())
  let t4475 = @term_syntax.parse_term("pow((b : Real), 1)")
  let t4476 = @tactics.trans_tac(@realax.real_le_trans())(t4475)
  let t4474 = @simp.asm_rewrite_tac(@list.List([]))
  let t4473 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t4472 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Real)"))
  let t4471 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_max(), @real.real_max_le()]))
  let t4470 = @tactics.exists_tac(@term_syntax.parse_term("max((B : Real), real_of_num(1))"))
  let t4469 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t4468 = @simp.asm_rewrite_tac(@list.List([]))
  let t4464 = @term_syntax.parse_term("(e : Real)")
  let t4467 = @tactics.first_x_assum(fn(x4466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4462 = @tactics.mp_tac(x4461)
      fn(x4463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4462(x4463)
      }
    })(((x4465 : @kernel.Thm) => @bool.spec(t4464, x4465))(x4466))
  })
  let t4460 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4459 = @tactics.disch_then(fn(x4458 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t4457 = @simp.simp_tac(@list.List([]))
  let t4456 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (B : Real) && B <= (b : Real)) == (real_of_num(0) < B && B <= b && real_of_num(0) <= b)"))]))
  let t4455 = @simp.rewrite_tac(@list.List([@realax.real_le_refl(), @realanalysis.has_real_integral_integrable_integral()]))
  let t4451 = @term_syntax.parse_term("real_of_num(0)")
  let t4454 = @tactics.remove_then("*", fn(x4453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4449 = @tactics.mp_tac(x4448)
      fn(x4450 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4449(x4450)
      }
    })(((x4452 : @kernel.Thm) => @bool.spec(t4451, x4452))(x4453))
  })
  let t4447 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t4445 = @meson.asm_meson_tac(@list.List([]))
  let t4444 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_on()]))
  let t4443 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_on_null()]))
  let t4442 = @tactics.disj_cases_tac(@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) <= (a : Real) || a <= b")))
  let t4441 = @term_syntax.parse_term("(b : Real)")
  let t4446 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t4441])), @tactics.strip_tac), t4442), t4443), t4444), t4445), @tactics.all_tac])
  let t4438 = @tactics.disch_then(fn(x4435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4436 = ((x4434 : @kernel.Thm) => @tactics.label_tac("*", x4434))(x4435)
    fn(x4437 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4436(x4437)
    }
  })
  let t4430 = @term_syntax.parse_term("(b : Real)")
  let t4431 = @list.List([@term_syntax.parse_term("(a : Real)"), t4430])
  let t4439 = @tactics.then_tac(@tactics.first_x_assum(fn(x4433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x4432 : @kernel.Thm) => @bool.specl(t4431, x4432))(x4433))
  }), t4438)
  let t4426 = @tactics.conv_tac(@calc_rat.real_field)
  let t4425 = @tactics.undisch_tac(@term_syntax.parse_term("!((x : Real) == real_of_num(0))"))
  let t4424 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("pow((x : Real), 2)"), @transcendentals.real_exp_nz()))
  let t4423 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_neg(), @transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t4422 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4421 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_rpow()]))
  let t4420 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_neg(), @equal.gsym(@transcendentals.rpow_pow())]))
  let t4419 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (x : Real)"), fn(x4416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4417 = @tactics.assume_tac(x4416)
    fn(x4418 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4417(x4418)
    }
  })
  let t4415 = @simp.rewrite_tac(@list.List([@misc.in_real_interval(), @sets.in_diff(), @sets.in_sing()]))
  let t4414 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t4413 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing()]))
  let t4412 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t4411 = @simp.rewrite_rule(@list.List([@theorems.conj_assoc()]))(@realanalysis.has_real_integral_spike())
  let t4427 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(t4411)), t4412), t4413), t4414), t4415), @tactics.strip_tac), t4419), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4420), t4421), t4422), t4423), t4424), t4425), t4426)
  let t4405 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_pow_2(), @transcendentals.real_exp_nz()]))
  let t4406 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_withinreal()), @realanalysis.real_differentiable_tac), t4405)
  let t4407 = @list.List([@tactics.then_tac(@tactics.then_tac(@realanalysis.real_diff_tac, @tactics.conv_tac(@calc_num.num_reduce_conv)), @calc_rat.real_arith_tac), t4406])
  let t4404 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4408 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_sing(), @misc.in_real_interval()])), t4404), t4407)
  let t4403 = @simp.simp_tac(@list.List([@real.real_le_pow_2(), @equal.gsym(@real.real_le_square_abs())]))
  let t4409 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @misc.in_real_interval()])), t4403), @calc_rat.asm_real_arith_tac)
  let t4402 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4401 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_on_differentiable()]))
  let t4410 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_differentiable_on_imp_real_continuous_on()), t4401), t4402), @realanalysis.real_differentiable_tac), t4409, t4408])
  let t4428 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t4410), t4427])
  let t4400 = @simp.asm_simp_tac(@list.List([@realax.real_le_refl(), @real.real_le_pow_2(), @card.countable_sing(), @real.real_pow_le2()]))
  let t4399 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4398 = @simp.rewrite_tac(@list.List([]))
  let t4390 = @term_syntax.parse_term("{real_of_num(0)}")
  let t4391 = @term_syntax.parse_term("pow((b : Real), 2)")
  let t4392 = @term_syntax.parse_term("pow((a : Real), 2)")
  let t4393 = @term_syntax.parse_term("(b : Real)")
  let t4394 = @term_syntax.parse_term("(a : Real)")
  let t4395 = @term_syntax.parse_term("(x : Real) => real_of_num(2) * x")
  let t4396 = @term_syntax.parse_term("(x : Real) => pow(x, 2)")
  let t4397 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(t : Real) => rpow(t, real_of_num(1) / real_of_num(2) - real_of_num(1)) / exp(t) / real_of_num(2)"), t4396, t4395, t4394, t4393, t4392, t4391, t4390]), @realanalysis.has_real_integral_substitution_strong()))
  let t4440 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4397), t4398), t4399), t4400), @tactics.ants_tac), t4428), t4439])
  let t4389 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, real_of_num(0) <= a && a <= b → has_real_integral((x : Real) => exp(-pow(x, 2)), real_integral(real_interval([(pow(a, 2), pow(b, 2))]), (t : Real) => rpow(t, -real_of_num(1) / real_of_num(2)) / exp(t) / real_of_num(2)), real_interval([(a, b)]))"), fn(x4386 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4387 = @tactics.mp_tac(x4386)
    fn(x4388 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4387(x4388)
    }
  })
  let t4385 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm()]))
  let t4383 = @term_syntax.parse_term("(∀ a : Real, (P : (Real) -> Bool)(max(real_of_num(0), a))) == (∀ a : Real, real_of_num(0) <= a → P(a))")
  let t4384 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= max(a, (b : Real)) && (real_of_num(0) <= a → max(real_of_num(0), a) == a)"))]), t4383)]))
  let t4382 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@realax.real_le_refl()]), @term_syntax.parse_term("∃ a : Real, a <= (B : Real)"))]))
  let t4381 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm(), @theorems.left_forall_imp_thm()]))
  let t4380 = @simp.gen_rewrite_tac(fn(x4379 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x4373 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4374 = @equal.binop_conv(x4373)
      fn(x4375 : @kernel.Term) -> @kernel.Thm raise {
        s4374(x4375)
      }
    })((fn(x4376 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4377 = @equal.once_depth_conv(x4376)
      fn(x4378 : @kernel.Term) -> @kernel.Thm raise {
        s4377(x4378)
      }
    })(x4379))
  }, @list.List([@theorems.imp_conj()]))
  let t4372 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(max(real_of_num(0), (a : Real)) == real_of_num(0) && real_of_num(0) < (B : Real) && a <= -B && B <= (b : Real)) == (a <= -B && real_of_num(0) < B && B <= b)"))]))
  let t4371 = @simp.simp_tac(@list.List([]))
  let t4370 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= -(B : Real) && -B < B && B <= (b : Real)) == (max(real_of_num(0), a) == real_of_num(0) && real_of_num(0) < B && a <= -B && B <= b)"))]))
  let t4369 = @simp.rewrite_tac(@list.List([@equal.gsym(@misc.real_interval())]))
  let t4368 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real) && (a : Real) <= x && x <= (b : Real)) == (max(real_of_num(0), a) <= x && x <= b)"))]))
  let t4367 = @simp.rewrite_tac(@list.List([@class.not_imp(), @equal.gsym(@theorems.conj_assoc()), @sets.inter(), @misc.in_real_interval()]))
  let t4366 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (B : Real) → -B <= B && !(B <= -B)"))]))
  let t4365 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool)) == !(p → !q)"))]))
  let t4364 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t4363 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_restrict_inter(), @realanalysis.real_integrable_restrict_inter(), @realanalysis.real_integral_restrict_inter()]))
  let t4362 = @simp.once_rewrite_tac(@list.List([@realanalysis.has_real_integral_alt()]))
  let t4361 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t4358 = @drule.match_mp(@realanalysis.has_real_integral_rmul())
  let t4355 = @term_syntax.parse_term("inv(real_of_num(2))")
  let t4360 = @tactics.disch_then(fn(x4359 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4357 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4353 = @tactics.mp_tac(x4352)
        fn(x4354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4353(x4354)
        }
      })(((x4356 : @kernel.Thm) => @bool.spec(t4355, x4356))(x4357))
    })(t4358(x4359))
  })
  let t4351 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4350 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1) / real_of_num(2)"), euler_has_real_integral_gamma()))
  let t4348 = @simp.rewrite_tac(@list.List([@realanalysis.real_negligible_sing(), @sets.in_elim_thm(), @sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((s : (_) -> Bool), IMAGE((f : (_) -> _), s)), {(a : _)}) == (∀ x : _, IN(x, s) && IN(f(x), s) → f(x) == a)"))]))
  let t4347 = @tactics.exists_tac(@term_syntax.parse_term("{real_of_num(0)}"))
  let t4346 = @tactics.match_mp_tac(@realanalysis.real_negligible_subset())
  let t4345 = @simp.asm_simp_tac(@list.List([@calc_int.real_pow_neg(), @calc_num.arith(), @equal.gsym(gamma_half())]))
  let t4344 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.has_real_integral_reflect_gen())]))
  let t4343 = @tactics.match_mp_tac(@realanalysis.has_real_integral_union())
  let t4341 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("sqrt((x : Real)) == sqrt(x) / real_of_num(2) + sqrt(x) / real_of_num(2)"))]))
  let t4340 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == -(y : Real)) == (-x == y)")), @theorems.unwind_thm1()]))
  let t4342 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_image(), @sets.in_univ(), @sets.in_elim_thm()])), t4340), @calc_rat.real_arith_tac), t4341])
  let t4349 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("UNIV == UNION({(x : Real) | real_of_num(0) <= x}, IMAGE(op_minus_minus, {(x : Real) | real_of_num(0) <= x}))"), fn(x4337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4338 = @tactics.subst1_tac(x4337)
    fn(x4339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4338(x4339)
    }
  }), t4342), t4343), t4344), t4345), t4346), t4347), t4348), @calc_rat.real_arith_tac)])
  let t4479 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("has_real_integral((x : Real) => exp(-pow(x, 2)), gamma(real_of_num(1) / real_of_num(2)) / real_of_num(2), {(x : Real) | real_of_num(0) <= x})"), fn(x4334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4335 = @tactics.assume_tac(x4334)
    fn(x4336 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4335(x4336)
    }
  }), t4349), t4350), t4351), t4360), t4361), t4362), t4363), t4364), t4365), t4366), t4367), t4368), t4369), t4370), t4371), t4372), t4380), t4381), t4382), t4384), t4385), @tactics.strip_tac), t4389), t4440), @tactics.conj_tac), t4446), t4447), @tactics.disch_tac), t4454), t4455), t4456), t4457), t4459), t4460), t4467), t4468), t4469), t4470), t4471), t4472), @tactics.strip_tac), t4473), t4474), t4476), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4477), t4478)
  gaussian_integral_c.set(@tactics.prove(@term_syntax.parse_term("has_real_integral((x : Real) => exp(-pow(x, 2)), sqrt(pi), UNIV)"), t4479))
}

///|
let gaussian_integral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSSIAN_INTEGRAL")

///|
/// `GAUSSIAN_INTEGRAL`
pub fn gaussian_integral() -> @kernel.Thm {
  gaussian_integral_c.get()
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
}
