// Translated from upstream Examples/mangoldt.ml; edit this file directly.

///|
/// Examples/mangoldt.ml:8
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// LOG_FACT
fn step_2() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @calc_int.real_add_ac()]))
  let t2 = @simp.asm_rewrite_tac(@list.List([@arith.add1()]))
  let t1 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_of_num_mul()), @transcendentals.log_mul(), @real.real_of_num_lt(), @arith.fact_lt(), @arith.lt_0()]))
  let t4 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.simp_tac(@list.List([@arith.fact(), @iterate.sum_clauses_numseg(), @transcendentals.log_1(), @calc_num.arith(), @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]))), t1), t2), t3)
  log_fact_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, log(real_of_num(FACT(n))) == sum(op_dot_dot(1, n), (d : Num) => log(real_of_num(d)))"), t4))
}

///|
let log_fact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOG_FACT")

///|
/// `LOG_FACT`
pub fn log_fact() -> @kernel.Thm {
  log_fact_c.get()
}

///|
/// SUM_DIVISORS_FLOOR_LEMMA
fn step_3() -> Unit raise {
  let t35 = @meson.asm_meson_tac(@list.List([@arith.mult_clauses()]))
  let t34 = @simp.asm_simp_tac(@list.List([@arith.lt_mult_rcancel(), @int.arith_rule(@term_syntax.parse_term("((n : Num) < 1) == (n == 0)"))]))
  let t33 = @simp.gen_rewrite_tac(fn(x32 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x26 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s27 = @equal.rand_conv(x26)
      fn(x28 : @kernel.Term) -> @kernel.Thm raise {
        s27(x28)
      }
    })((fn(x29 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s30 = @equal.rand_conv(x29)
      fn(x31 : @kernel.Term) -> @kernel.Thm raise {
        s30(x31)
      }
    })(x32))
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(d : Num) == 1 * d"))]))
  let t25 = @simp.asm_simp_tac(@list.List([@arith.div_eq_0()]))
  let t24 = @tactics.first_x_assum(fn(x23 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s21 = @tactics.subst_all_tac(x20)
      fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s21(x22)
      }
    })(@equal.sym(x23))
  })
  let t19 = @list.List([@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), @int.arith_tac])
  let t18 = @simp.asm_simp_tac(@list.List([@arith.le_rdiv_eq(), @arith.mult_eq_0(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t17 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @iterate.in_numseg(), @arith.le_1(), @arith.div_mult(), @int.divides_div_mult(), @iterate.finite_numseg(), @simp.once_rewrite_rule(@list.List([@arith.mult_sym()]))(@arith.div_mult()), @arith.div_mono(), @arith.le_1()]))
  let t15 = @term_syntax.parse_term("(m : Num) => m * (d : Num)")
  let t16 = @tactics.map_every(fn(x12 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s13 = @tactics.exists_tac(x12)
    fn(x14 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s13(x14)
    }
  }, @list.List([@term_syntax.parse_term("(m : Num) => DIV(m, (d : Num))"), t15]))
  let t11 = @tactics.match_mp_tac(@sets.bijections_card_eq())
  let t10 = @simp.gen_rewrite_tac(fn(x7 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s8 = @equal.rand_conv(x7)
    fn(x9 : @kernel.Term) -> @kernel.Thm raise {
      s8(x9)
    }
  }, @list.List([@equal.gsym(@iterate.card_numseg_1())]))
  let t6 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.sum_restrict_set()), @iterate.finite_numseg(), @iterate.sum_const(), @sets.finite_restrict(), @realarith.real_mul_rid(), @realax.real_of_num_eq()]))
  let t5 = @simp.asm_simp_tac(@list.List([@floor.floor_div_div()]))
  let t36 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t5), t6), t10), t11), t16), t17), t18), @tactics.conj_tac), t19), t24), t25), t33), t34), t35)
  sum_divisors_floor_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ d : Num, !(d == 0) → sum(op_dot_dot(1, n), (m : Num) => if divides(d, m) { real_of_num(1) } else { real_of_num(0) }) == floor(real_of_num(n) / real_of_num(d))"), t36))
}

///|
let sum_divisors_floor_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_DIVISORS_FLOOR_LEMMA")

///|
/// `SUM_DIVISORS_FLOOR_LEMMA`
pub fn sum_divisors_floor_lemma() -> @kernel.Thm {
  sum_divisors_floor_lemma_c.get()
}

///|
/// LOG_2_BOUNDS
fn step_4() -> Unit raise {
  let t50 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_lt(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t49 = @tactics.match_mp_tac(@transcendentals.log_mono_le())
  let t48 = @tactics.conv_tac(@equal.sym_conv)
  let t47 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t46 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t44 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1)"), @transcendentals.real_exp_le_x()))
  let t45 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x41 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s42 = @equal.rand_conv(x41)
    fn(x43 : @kernel.Term) -> @kernel.Thm raise {
      s42(x43)
    }
  }, @list.List([@equal.gsym(@transcendentals.log_exp())])), t44)
  let t40 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("inv(real_of_num(2))"), @transcendentals.real_exp_bound_lemma()))
  let t51 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.gen_rewrite_tac(fn(x37 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s38 = @equal.land_conv(x37)
    fn(x39 : @kernel.Term) -> @kernel.Thm raise {
      s38(x39)
    }
  }, @list.List([@equal.gsym(@transcendentals.log_exp())])), t40), t45])), t46), t47), t48), t49), t50)
  log_2_bounds_c.set(@tactics.prove(@term_syntax.parse_term("real_of_num(1) / real_of_num(2) <= log(real_of_num(2)) && log(real_of_num(2)) <= real_of_num(1)"), t51))
}

///|
let log_2_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOG_2_BOUNDS")

///|
/// `LOG_2_BOUNDS`
pub fn log_2_bounds() -> @kernel.Thm {
  log_2_bounds_c.get()
}

///|
/// LOG_LE_REFL
fn step_5() -> Unit raise {
  let t63 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t62 = @simp.rewrite_tac(@list.List([@real.real_le_sub_ladd(), @realax.real_of_num_add(), @realax.real_of_num_le()]))
  let t61 = @tactics.match_mp_tac(@transcendentals.log_le())
  let t60 = @simp.gen_rewrite_tac(fn(x59 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x53 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s54 = @equal.land_conv(x53)
      fn(x55 : @kernel.Term) -> @kernel.Thm raise {
        s54(x55)
      }
    })((fn(x56 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s57 = @equal.rand_conv(x56)
      fn(x58 : @kernel.Term) -> @kernel.Thm raise {
        s57(x58)
      }
    })(x59))
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) == real_of_num(1) + (n - real_of_num(1))"))]))
  let t52 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) - real_of_num(1) → x <= y")))
  let t64 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t52), t60), t61), t62), t63), @int.arith_tac)
  log_le_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) → log(real_of_num(n)) <= real_of_num(n)"), t64))
}

///|
let log_le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOG_LE_REFL")

///|
/// `LOG_LE_REFL`
pub fn log_le_refl() -> @kernel.Thm {
  log_le_refl_c.get()
}

///|
/// LOG_FACT_BOUNDS
fn step_6() -> Unit raise {
  let t175 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t174 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t176 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= log(real_of_num((n : Num)))"), fn(x171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s172 = @tactics.mp_tac(x171)
    fn(x173 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s172(x173)
    }
  }), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t174), t175), @int.asm_arith_tac)
  let t170 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le(), @realax.real_of_num_le()]))
  let t169 = @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())
  let t168 = @simp.rewrite_tac(@list.List([log_2_bounds()]))
  let t167 = @tactics.exists_tac(@term_syntax.parse_term("log(real_of_num(2))"))
  let t166 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t165 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t164 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t162 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le(), @real.real_of_num_lt()]))
  let t163 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_inv2()), t162), @int.asm_arith_tac), @tactics.all_tac])
  let t161 = @tactics.exists_tac(@term_syntax.parse_term("inv(real_of_num(2))"))
  let t160 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t159 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_eq(), @real.real_le_radd(), @calc_rat.real_field(@term_syntax.parse_term("!((n : Real) == real_of_num(0)) → real_of_num(1) / n * (n + real_of_num(1)) == inv(n) + real_of_num(1)"))]))
  let t158 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(((n : Real) + real_of_num(1)) * ((l : Real) + (n' : Real)) <= (n + (k : Real)) * l + real_of_num(1)) == (n' * (n + real_of_num(1)) <= (k - real_of_num(1)) * l + real_of_num(1))"))]))
  let t156 = @simp.simp_tac(@list.List([@real.real_le_div(), @realarith.real_pos()]))
  let t155 = @tactics.match_mp_tac(@transcendentals.log_le())
  let t152 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) → (x + real_of_num(1)) / x == real_of_num(1) + real_of_num(1) / x"))
  let t153 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))
  let t154 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_div()), @real.real_of_num_lt(), @arith.lt_nz(), t153, t152]))
  let t151 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) <= (y : Real) + (z : Real)) == (x - y <= z)"))]))
  let t157 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t151), t154), t155), t156), @tactics.all_tac])
  let t150 = @tactics.exists_tac(@term_syntax.parse_term("(real_of_num((n : Num)) + real_of_num(1)) * (log(real_of_num(n)) + real_of_num(1) / real_of_num(n))"))
  let t149 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t177 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(((n : Real) + real_of_num(1)) * (l' : Real) - (n + real_of_num(1)) + real_of_num(1) <= n * (l : Real) - n + real_of_num(1) + (k : Real) * l) == ((n + real_of_num(1)) * l' <= (n + k) * l + real_of_num(1))"))])), t149), t150), @tactics.conj_tac), t157), t158), t159), t160), t161), @tactics.conj_tac), t163), t164), t165), t166), t167), t168), t169), t170), @int.asm_arith_tac), t176])
  let t148 = @simp.rewrite_tac(@list.List([@real.real_sub_rneg()]))
  let t147 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t144 = @equal.gsym(@complexes.cx_add())
  let t145 = @equal.gsym(@complexes.cx_sub())
  let t146 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), t145, t144, @complexes.re_cx()]))
  let t141 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))
  let t142 = @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 0 < n"))
  let t143 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @iterate.sum_eq_numseg(), @real.real_of_num_lt(), @arith.le_1(), @transcendentals.clog_1(), t142, @complexes.re_cx(), t141, @real.real_eq_imp_le()]))
  let t140 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) <= (x : Real) && (a : Real) <= (b : Real) → x <= a → y <= b")))
  let t139 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t133 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @complexes.re_cx(), @transcendentals.log_mono_le_imp()]))
  let t132 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (a : Real) && real_of_num(0) < (b : Real)"), fn(x129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s130 = @tactics.assume_tac(x129)
    fn(x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s130(x131)
    }
  })
  let t128 = @term_syntax.parse_term("(b : Real)")
  let t134 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t128])), @tactics.strip_tac), t132), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t133)
  let t124 = @simp.gen_rewrite_rule(fn(x123 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x123
  }, @list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t126 = @tactics.then_tac(@tactics.first_x_assum(fn(x125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s121 = @tactics.mp_tac(x120)
      fn(x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s121(x122)
      }
    })(t124(x125))
  }), @calc_rat.asm_real_arith_tac)
  let t118 = @tactics.conv_tac(@complexes.complex_field)
  let t119 = @list.List([@calc_rat.real_arith_tac, @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((x : Cart[Real, 2]) == Cx(real_of_num(0)))")), t118)])
  let t117 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx()]))
  let t116 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t115 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) <= Re((x : Cart[Real, 2]))"))
  let t127 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@canal.complex_diff_tac, @tactics.conj_tac), t115), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t116), t117), t119), t126])
  let t114 = @tactics.repeat_tac(@tactics.strip_tac)
  let t135 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.in_segment_cx_gen()])), t114), t127), t134])
  let t113 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t136 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s111 = @tactics.mp_tac(x110)
    fn(x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s111(x112)
    }
  }), @int.arith_tac), @tactics.all_tac])), t113), @tactics.conj_tac), t135), @tactics.all_tac])
  let t109 = @simp.rewrite_tac(@list.List([]))
  let t105 = @term_syntax.parse_term("(n : Num)")
  let t106 = @term_syntax.parse_term("2")
  let t107 = @term_syntax.parse_term("(z : Cart[Real, 2]) => z * clog(z) - z")
  let t108 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => clog(z)"), t107, t106, t105]), @canal.sum_integral_lbound_increasing()))
  let t103 = @simp.rewrite_tac(@list.List([@transcendentals.log_1(), @iterate.sum_clauses()]))
  let t102 = @tactics.conv_tac(@equal.once_depth_conv(@iterate.numseg_conv))
  let t104 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t102), t103), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t99 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n == 1 || 2 <= n")))
  let t101 = @tactics.first_assum(fn(x100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t99(x100))
  })
  let t98 = @simp.rewrite_tac(@list.List([@transcendentals.log_1(), @realax.real_add_lid(), @calc_num.arith()]))
  let t137 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@iterate.sum_clauses_left(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))])), t98), t101), t104), t108), t109), @tactics.ants_tac), t136)
  let t94 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @complexes.re_cx(), @transcendentals.log_mono_le_imp()]))
  let t93 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (a : Real) && real_of_num(0) < (b : Real)"), fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s91 = @tactics.assume_tac(x90)
    fn(x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s91(x92)
    }
  })
  let t89 = @term_syntax.parse_term("(b : Real)")
  let t95 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t89])), @tactics.strip_tac), t93), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t94)
  let t86 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_lt())]))
  let t84 = @simp.gen_rewrite_rule(fn(x83 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x83
  }, @list.List([@equal.gsym(@arith.lt_nz())]))
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x80 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s81 = @tactics.mp_tac(x80)
      fn(x82 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s81(x82)
      }
    })(t84(x85))
  }), t86), @calc_rat.asm_real_arith_tac)
  let t78 = @tactics.conv_tac(@complexes.complex_field)
  let t79 = @list.List([@calc_rat.real_arith_tac, @tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((x : Cart[Real, 2]) == Cx(real_of_num(0)))")), t78)])
  let t77 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx()]))
  let t76 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t75 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) <= Re((x : Cart[Real, 2]))"))
  let t88 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@canal.complex_diff_tac, @tactics.conj_tac), t75), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t76), t77), t79), t87])
  let t74 = @tactics.repeat_tac(@tactics.strip_tac)
  let t96 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.in_segment_cx_gen()])), t74), t88), t95])
  let t97 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@int.asm_arith_tac, @tactics.all_tac])), @tactics.conj_tac), t96), @tactics.all_tac])
  let t73 = @simp.rewrite_tac(@list.List([]))
  let t70 = @term_syntax.parse_term("(n : Num)")
  let t71 = @term_syntax.parse_term("1")
  let t72 = @term_syntax.parse_term("(z : Cart[Real, 2]) => z * clog(z) - z")
  let t138 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => clog(z)"), t72, t71, t70]), @canal.sum_integral_ubound_increasing())), t73), @tactics.ants_tac), t97), t137])
  let t69 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real) - (y : Real)) <= (e : Real)) == (x <= y + e && y - e <= x)"))]))
  let t68 = @simp.asm_simp_tac(@list.List([log_fact()]))
  let t66 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @transcendentals.log_1()]))
  let t67 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), @arith.fact()])), t66), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t65 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t178 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t65), t67), t68), t69), @tactics.conj_tac), t138), t139), t140), t143), t146), t147), t148), t177)
  log_fact_bounds_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) → abs(log(real_of_num(FACT(n))) - (real_of_num(n) * log(real_of_num(n)) - real_of_num(n) + real_of_num(1))) <= real_of_num(2) * log(real_of_num(n))"), t178))
}

///|
let log_fact_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOG_FACT_BOUNDS")

///|
/// `LOG_FACT_BOUNDS`
pub fn log_fact_bounds() -> @kernel.Thm {
  log_fact_bounds_c.get()
}

///|
/// mangoldt
fn step_7() -> Unit raise {
  mangoldt_c.set(@pair.new_definition(@term_syntax.parse_term("(mangoldt : (Num) -> Real)((n : Num)) == (if (∃ p : Num, ∃ k : Num, 1 <= k && prime(p) && n == EXP(p, k)) { log(real_of_num(select((p : Num) => prime(p) && divides(p, n)))) } else { real_of_num(0) })")))
}

///|
let mangoldt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mangoldt")

///|
/// `mangoldt`
pub fn mangoldt() -> @kernel.Thm {
  mangoldt_c.get()
}

///|
/// MANGOLDT_1
fn step_8() -> Unit raise {
  let t188 = @meson.meson_tac(@list.List([@prime.prime_1(), @int.arith_rule(@term_syntax.parse_term("!(1 <= 0)"))]))
  let t187 = @simp.rewrite_tac(@list.List([@arith.exp_eq_1()]))
  let t186 = @simp.gen_rewrite_tac(fn(x185 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x179 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s180 = @equal.land_conv(x179)
      fn(x181 : @kernel.Term) -> @kernel.Thm raise {
        s180(x181)
      }
    })((fn(x182 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s183 = @equal.once_depth_conv(x182)
      fn(x184 : @kernel.Term) -> @kernel.Thm raise {
        s183(x184)
      }
    })(x185))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t189 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mangoldt()])), t186), t187), t188)
  mangoldt_1_c.set(@tactics.prove(@term_syntax.parse_term("mangoldt(1) == real_of_num(0)"), t189))
}

///|
let mangoldt_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MANGOLDT_1")

///|
/// `MANGOLDT_1`
pub fn mangoldt_1() -> @kernel.Thm {
  mangoldt_1_c.get()
}

///|
/// MANGOLDT_PRIMEPOW
fn step_9() -> Unit raise {
  let t199 = @meson.asm_meson_tac(@list.List([@prime.prime_divexp(), @int.prime(), @prime.prime_1(), @prime.divides_refl(), @arith.exp_1()]))
  let t198 = @tactics.match_mp_tac(@class.select_unique())
  let t197 = @simp.asm_simp_tac(@list.List([@prime.divides_primepow()]))
  let t196 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t195 = @simp.asm_rewrite_tac(@list.List([]))
  let t194 = @simp.asm_rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t193 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool) → !((c : Bool) && (d : Bool))) == (d && c && a && b)"))]))
  let t192 = @simp.asm_simp_tac(@list.List([@prime.eq_prime_exp(), @arith.le_1()]))
  let t191 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool)) == !(a && b → !c)"))]))
  let t190 = @simp.asm_rewrite_tac(@list.List([mangoldt()]))
  let t200 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t190), t191), t192), t193), t194), @class.cond_cases_tac), t195), t196), t197), t198), t199)
  mangoldt_primepow_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ k : Num, prime(p) → mangoldt(EXP(p, k)) == (if 1 <= k { log(real_of_num(p)) } else { real_of_num(0) })"), t200))
}

///|
let mangoldt_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MANGOLDT_PRIMEPOW")

///|
/// `MANGOLDT_PRIMEPOW`
pub fn mangoldt_primepow() -> @kernel.Thm {
  mangoldt_primepow_c.get()
}

///|
/// MANGOLDT_POS_LE
fn step_10() -> Unit raise {
  let t210 = @simp.asm_rewrite_tac(@list.List([mangoldt(), @realax.real_le_refl()]))
  let t207 = @drule.match_mp(@prime.prime_ge_2())
  let t209 = @tactics.first_x_assum(fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s205 = @tactics.mp_tac(x204)
      fn(x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s205(x206)
      }
    })(t207(x208))
  })
  let t203 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t202 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t201 = @simp.asm_simp_tac(@list.List([mangoldt_primepow()]))
  let t211 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.repeat_tcl(@tactics.choose_then)(@tactics.strip_assume_tac)), t201), t202), t203), t209), @int.arith_tac), t210])
  let t212 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("∃ p : Num, ∃ k : Num, 1 <= k && prime(p) && (n : Num) == EXP(p, k)"))), t211)
  mangoldt_pos_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, real_of_num(0) <= mangoldt(n)"), t212))
}

///|
let mangoldt_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MANGOLDT_POS_LE")

///|
/// `MANGOLDT_POS_LE`
pub fn mangoldt_pos_le() -> @kernel.Thm {
  mangoldt_pos_le_c.get()
}

///|
/// LOG_MANGOLDT_SUM
fn step_11() -> Unit raise {
  let t261 = @simp.simp_tac(@list.List([@iterate.sum_const(), @iterate.card_numseg_1(), @iterate.finite_numseg()]))
  let t260 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pow(), @prime.prime_imp_nz(), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t259 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.numseg())]))
  let t258 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t257 = @simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.sum_restrict_set()), @sets.in_elim_thm(), @sets.finite_numseg_le()]))
  let t256 = @simp.asm_simp_tac(@list.List([mangoldt_primepow(), @trivia.o_def()]))
  let t255 = @simp.asm_simp_tac(@list.List([@arith.eq_exp(), @iterate.sum_image(), @prime.prime_ge_2(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → !(p == 0) && !(p == 1)"))]))
  let t254 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(d : Num) | ∃ i : Num, i <= (k : Num) && d == EXP((p : Num), i)} == IMAGE((i : Num) => EXP(p, i), {(i : Num) | i <= k})"))]))
  let t253 = @simp.asm_simp_tac(@list.List([@prime.divides_primepow(), @equal.gsym(@calc_int.real_of_num_pow())]))
  let t249 = @meson.asm_meson_tac(@list.List([@prime.prime_divprod_pow()]))
  let t248 = @simp.asm_rewrite_tac(@list.List([]))
  let t247 = @simp.rewrite_tac(@list.List([mangoldt()]))
  let t246 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t245 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @prime.divides_lmul(), @prime.divides_rmul()]))
  let t244 = @simp.rewrite_tac(@list.List([@sets.union_subset(), @sets.in_union()]))
  let t250 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_superset()), t244), t245), t246), @tactics.strip_tac), t247), @class.cond_cases_tac), t248), t249)
  let t243 = @meson.asm_meson_tac(@list.List([@int.coprime(), mangoldt_1()]))
  let t242 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t241 = @simp.asm_simp_tac(@list.List([@prime.finite_divisors(), @int.arith_rule(@term_syntax.parse_term("1 < (n : Num) → !(n == 0)"))]))
  let t240 = @simp.rewrite_tac(@list.List([@sets.in_inter()]))
  let t251 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_union_nonzero()), t240), t241), t242), t243), t250])
  let t239 = @tactics.conv_tac(@equal.sym_conv)
  let t238 = @tactics.exists_tac(@term_syntax.parse_term("sum(UNION({(d : Num) | divides(d, (a : Num))}, {(d : Num) | divides(d, (b : Num))}), (d : Num) => mangoldt(d))"))
  let t237 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t236 = @int.arith_rule(@term_syntax.parse_term("1 < (a : Num) → 0 < a"))
  let t252 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.log_mul(), @equal.gsym(@realax.real_of_num_mul()), @real.real_of_num_lt(), t236])), t237), t238), @tactics.conj_tac), t239), t251), @tactics.all_tac])
  let t235 = @tactics.repeat_tac(@tactics.strip_tac)
  let t234 = @tactics.match_mp_tac(@prime.induct_coprime())
  let t233 = @tactics.pop_assum_list(fn(x232 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t230 = @term_syntax.parse_term("(n : Num)")
  let t231 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t230)
  let t229 = @tactics.subgoal_then(@term_syntax.parse_term("1 < (n : Num)"), fn(x226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s227 = @tactics.mp_tac(x226)
    fn(x228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s227(x228)
    }
  })
  let t224 = @meson.meson_tac(@list.List([@prime.prime_1(), @int.arith_rule(@term_syntax.parse_term("!(1 <= 0)"))]))
  let t223 = @simp.rewrite_tac(@list.List([@arith.exp_eq_1()]))
  let t222 = @simp.gen_rewrite_tac(fn(x221 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x215 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s216 = @equal.rand_conv(x215)
      fn(x217 : @kernel.Term) -> @kernel.Thm raise {
        s216(x217)
      }
    })((fn(x218 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s219 = @equal.once_depth_conv(x218)
      fn(x220 : @kernel.Term) -> @kernel.Thm raise {
        s219(x220)
      }
    })(x221))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t214 = @simp.rewrite_tac(@list.List([@iterate.sum_sing(), mangoldt()]))
  let t225 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@transcendentals.log_1(), @int.divides_one(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}"))])), t214), t222), t223), t224), @tactics.all_tac])
  let t213 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t262 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t213), t225), t229), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t231), t233), t234), t235), t252), t253), t254), t255), t256), t257), t258), t259), t260), t261)
  log_mangoldt_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) → log(real_of_num(n)) == sum({(d : Num) | divides(d, n)}, (d : Num) => mangoldt(d))"), t262))
}

///|
let log_mangoldt_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOG_MANGOLDT_SUM")

///|
/// `LOG_MANGOLDT_SUM`
pub fn log_mangoldt_sum() -> @kernel.Thm {
  log_mangoldt_sum_c.get()
}

///|
/// MANGOLDT
fn step_12() -> Unit raise {
  let t284 = @simp.asm_simp_tac(@list.List([sum_divisors_floor_lemma(), @arith.le_1(), @iterate.sum_lmul()]))
  let t283 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t282 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t285 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x279 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s280 = @equal.land_conv(x279)
    fn(x281 : @kernel.Term) -> @kernel.Thm raise {
      s280(x281)
    }
  }, @list.List([@iterate.sum_swap_numseg()])), t282), t283), t284)
  let t276 = @drule.match_mp(@int.divides_le_strong())
  let t278 = @tactics.disch_then(fn(x277 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s274 = @tactics.mp_tac(x273)
      fn(x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s274(x275)
      }
    })(t276(x277))
  })
  let t272 = @simp.asm_simp_tac(@list.List([@arith.le_1(), @prime.finite_divisors(), @sets.in_elim_thm(), @calc_int.real_mul_rzero(), @realarith.real_mul_rid(), @sets.subset(), @iterate.in_numseg()]))
  let t271 = @tactics.match_mp_tac(@iterate.sum_eq_superset())
  let t270 = @tactics.conv_tac(@equal.sym_conv)
  let t269 = @simp.rewrite_tac(@list.List([]))
  let t268 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t286 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t268), @tactics.strip_tac), t269), t270), t271), t272), @tactics.gen_tac), t278), @int.asm_arith_tac), t285])
  let t267 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (n : Num)), (m : Num) => sum(op_dot_dot(1, n), (d : Num) => mangoldt(d) * (if divides(d, m) { real_of_num(1) } else { real_of_num(0) })))"))
  let t266 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t265 = @simp.simp_tac(@list.List([log_mangoldt_sum(), @iterate.sum_eq_numseg(), @arith.le_1()]))
  let t264 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (n : Num)), (m : Num) => sum({(d : Num) | divides(d, m)}, (d : Num) => mangoldt(d)))"))
  let t263 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t287 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([log_fact()]))), t263), t264), t265), t266), t267), @tactics.conj_tac), t286)
  mangoldt_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, log(real_of_num(FACT(n))) == sum(op_dot_dot(1, n), (d : Num) => mangoldt(d) * floor(real_of_num(n) / real_of_num(d)))"), t287))
}

///|
let mangoldt_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MANGOLDT")

///|
/// `MANGOLDT`
pub fn mangoldt_v1() -> @kernel.Thm {
  mangoldt_v1_c.get()
}

///|
/// PSI_BOUND_INDUCT
fn step_13() -> Unit raise {
  let t363 = @tactics.mp_tac(log_2_bounds())
  let t360 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t359 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t361 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_add_rdistrib())])), t359), t360)
  let t358 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t357 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t356 = @simp.asm_simp_tac(@list.List([log_le_refl(), @real.real_le_lmul(), @realarith.real_pos(), @real.real_le_radd()]))
  let t362 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_add2()), t356), t357), t358), t361])
  let t355 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(6) * real_of_num((n : Num)) + ((real_of_num(2) * log(real_of_num(2)) - real_of_num(1)) * real_of_num(n) + real_of_num(2) * log(real_of_num(2)) * real_of_num(n))"))
  let t354 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t353 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(6) * log(real_of_num((n : Num))) + ((real_of_num(2) * log(real_of_num(2)) - real_of_num(1)) * real_of_num(1) + real_of_num(2) * log(real_of_num(2)) * real_of_num(n))"))
  let t352 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t351 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_of_num_mul()), @transcendentals.log_mul(), @real.real_of_num_lt(), @arith.lt_nz(), @calc_num.arith()]))
  let t350 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a2 : Real) + ((e2 : Real) + real_of_num(2) * ((e1 : Real) - (a1 : Real))) <= (m : Real) → abs((f2 : Real) - a2) <= e2 → abs((f1 : Real) - a1) <= e1 → f2 - real_of_num(2) * f1 <= m")))
  let t349 = @simp.asm_rewrite_tac(@list.List([@arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t347 = @term_syntax.parse_term("2 * (n : Num)")
  let t348 = @tactics.map_every(fn(x346 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s341 = @tactics.mp_tac(x340)
      fn(x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s341(x342)
      }
    })((fn(x345 : @kernel.Term) -> @kernel.Thm raise {
      (fn(x343 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x344 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.spec(x343, x344)
        }
      })(x345)(log_fact_bounds())
    })(x346))
  }, @list.List([@term_syntax.parse_term("(n : Num)"), t347]))
  let t339 = @simp.rewrite_tac(@list.List([@equal.gsym(mangoldt_v1())]))
  let t337 = @simp.simp_tac(@list.List([@floor.floor_div_div(), @arith.le_1(), @floor.floor_num(), @realax.real_le_mul(), @realarith.real_pos(), mangoldt_pos_le()]))
  let t336 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.in_diff(), @iterate.in_numseg()]))
  let t335 = @tactics.match_mp_tac(@iterate.sum_subset())
  let t334 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t333 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t338 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(y' : Real) <= (y : Real) → (x : Real) - y <= x - y'"))), t333), t334), t335), t336), t337), @int.arith_tac), @tactics.all_tac])
  let t332 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, 2 * (n : Num)), (d : Num) => mangoldt(d) * floor(real_of_num(2 * n) / real_of_num(d))) - real_of_num(2) * sum(op_dot_dot(1, n), (d : Num) => mangoldt(d) * floor(real_of_num(n) / real_of_num(d)))"))
  let t331 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t330 = @simp.rewrite_tac(@list.List([@iterate.sum_sub_numseg(), @iterate.sum_lmul()]))
  let t329 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(m : Real) * ((f1 : Real) - real_of_num(2) * (f2 : Real)) == m * f1 - real_of_num(2) * (m * f2)"))]))
  let t327 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_mul(), @realax.real_of_num_le(), @arith.mult_div_le()]))
  let t326 = @simp.asm_simp_tac(@list.List([@floor.floor_div_div(), @realarith.real_neg_sub(), @realarith.real_sub_le()]))
  let t325 = @simp.rewrite_tac(@list.List([mangoldt_pos_le()]))
  let t324 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t323 = @tactics.subgoal_then(@term_syntax.parse_term("!((r : Num) == 0)"), fn(x320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s321 = @tactics.assume_tac(x320)
    fn(x322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s321(x322)
    }
  })
  let t319 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t318 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.in_diff(), @iterate.in_numseg()]))
  let t328 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_subset()), t318), @tactics.conj_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t319), @tactics.strip_tac), t323), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t324), t325), t326), t327), @tactics.all_tac])
  let t317 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, 2 * (n : Num)), (d : Num) => mangoldt(d) * (floor(real_of_num(2 * n) / real_of_num(d)) - real_of_num(2) * floor(real_of_num(n) / real_of_num(d))))"))
  let t316 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t314 = @simp.asm_simp_tac(@list.List([@arith.div_eq_0(), @arith.le_rdiv_eq()]))
  let t313 = @simp.asm_simp_tac(@list.List([@floor.floor_div_div(), @floor.floor_num(), @realax.real_of_num_le(), @realax.real_of_num_eq()]))
  let t312 = @tactics.subgoal_then(@term_syntax.parse_term("!((r : Num) == 0)"), fn(x309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s310 = @tactics.assume_tac(x309)
    fn(x311 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s310(x311)
    }
  })
  let t308 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (a : Real) && (b : Real) == real_of_num(0) → real_of_num(1) <= a - real_of_num(2) * b")))
  let t307 = @simp.rewrite_tac(@list.List([mangoldt_pos_le()]))
  let t306 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t305 = @simp.gen_rewrite_tac(fn(x302 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s303 = @equal.land_conv(x302)
    fn(x304 : @kernel.Term) -> @kernel.Thm raise {
      s303(x304)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t301 = @simp.rewrite_tac(@list.List([]))
  let t300 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t315 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_le_numseg()), t300), @tactics.strip_tac), t301), t305), t306), t307), t308), t312), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t313), t314), @int.asm_arith_tac), @tactics.all_tac])
  let t299 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot((n : Num) + 1, 2 * n), (d : Num) => mangoldt(d) * (floor(real_of_num(2 * n) / real_of_num(d)) - real_of_num(2) * floor(real_of_num(n) / real_of_num(d))))"))
  let t298 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t296 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty(), @iterate.in_numseg()]))
  let t295 = @simp.asm_simp_tac(@list.List([@iterate.numseg_combine_r(), @int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → 1 <= n + 1 && n <= 2 * n"))]))
  let t294 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t293 = @simp.once_rewrite_tac(@list.List([@sets.union_comm()]))
  let t292 = @tactics.match_mp_tac(@iterate.sum_union_eq())
  let t291 = @tactics.conv_tac(@equal.sym_conv)
  let t290 = @simp.rewrite_tac(@list.List([@real.real_eq_sub_radd()]))
  let t297 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_imp_le()), t290), t291), t292), t293), t294), t295), t296), @int.arith_tac), @tactics.all_tac])
  let t289 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot((n : Num) + 1, 2 * n), (d : Num) => mangoldt(d))"))
  let t288 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t364 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t288), t289), @tactics.conj_tac), t297), t298), t299), @tactics.conj_tac), t315), t316), t317), @tactics.conj_tac), t328), t329), t330), t331), t332), @tactics.conj_tac), t338), t339), t348), t349), t350), t351), t352), t353), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t354), t355), @tactics.conj_tac), t362), t363), @calc_rat.real_arith_tac)
  psi_bound_induct_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) → sum(op_dot_dot(1, 2 * n), (d : Num) => mangoldt(d)) - sum(op_dot_dot(1, n), (d : Num) => mangoldt(d)) <= real_of_num(9) * real_of_num(n)"), t364))
}

///|
let psi_bound_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSI_BOUND_INDUCT")

///|
/// `PSI_BOUND_INDUCT`
pub fn psi_bound_induct() -> @kernel.Thm {
  psi_bound_induct_c.get()
}

///|
/// PSI_BOUND_EXP
fn step_14() -> Unit raise {
  let t370 = @simp.rewrite_tac(@list.List([@arith.exp_eq_0(), @calc_num.arith()]))
  let t369 = @tactics.match_mp_tac(psi_bound_induct())
  let t366 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(s1 : Real) <= real_of_num(9) * (e : Real) → (s2 : Real) - s1 <= real_of_num(9) * e → s2 <= real_of_num(9) * (real_of_num(2) * e)")))
  let t368 = @tactics.first_x_assum(fn(x367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t366(x367))
  })
  let t365 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul())]))
  let t371 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.simp_tac(@list.List([@arith.exp(), @iterate.sum_sing_numseg(), mangoldt_1(), @realax.real_le_mul(), @realarith.real_pos()]))), t365), t368), t369), t370)
  psi_bound_exp_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, sum(op_dot_dot(1, EXP(2, n)), (d : Num) => mangoldt(d)) <= real_of_num(9) * real_of_num(EXP(2, n))"), t371))
}

///|
let psi_bound_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSI_BOUND_EXP")

///|
/// `PSI_BOUND_EXP`
pub fn psi_bound_exp() -> @kernel.Thm {
  psi_bound_exp_c.get()
}

///|
/// PSI_BOUND
fn step_15() -> Unit raise {
  let t405 = @simp.rewrite_tac(@list.List([@realax.real_of_num_mul(), @arith.exp(), @realax.real_of_num_le()]))
  let t401 = @term_syntax.parse_term("(k : Num) - 1")
  let t404 = @tactics.first_x_assum(fn(x403 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s399 = @tactics.mp_tac(x398)
      fn(x400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s399(x400)
      }
    })(((x402 : @kernel.Thm) => @bool.spec(t401, x402))(x403))
  })
  let t395 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((k : Num) == 0) → k == SUC(k - 1)")))
  let t397 = @tactics.first_assum(fn(x396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s393 = @tactics.subst1_tac(x392)
      fn(x394 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s393(x394)
      }
    })(t395(x396))
  })
  let t391 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s389 = @tactics.subst_all_tac(x388)
    fn(x390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s389(x390)
    }
  }), @int.asm_arith_tac), @tactics.all_tac])
  let t387 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t386 = @simp.rewrite_tac(@list.List([psi_bound_exp()]))
  let t385 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(9) * real_of_num(EXP(2, (k : Num)))"))
  let t406 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t385), t386), t387), t391), t397), t404), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t405), @int.arith_tac)
  let t384 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.in_diff(), @iterate.in_numseg(), mangoldt_pos_le()]))
  let t407 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_subset()), t384), @int.asm_arith_tac), t406])
  let t383 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, EXP(2, (k : Num))), (d : Num) => mangoldt(d))"))
  let t382 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t380 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t379 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), @arith.lt_pow2_refl()))
  let t378 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t381 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@arith.num_wop())])), t378), t379), t380), @int.arith_tac), @tactics.all_tac])
  let t377 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k : Num, (n : Num) <= EXP(2, k) && (∀ l : Num, l < k → !(n <= EXP(2, l)))"), @tactics.strip_assume_tac)
  let t375 = @simp.simp_tac(@list.List([mangoldt_pos_le(), mangoldt_1(), @realax.real_le_mul(), @realarith.real_pos()]))
  let t374 = @simp.rewrite_tac(@list.List([@iterate.sum_sing_numseg(), @iterate.finite_numseg(), @sets.in_diff(), @iterate.in_numseg()]))
  let t373 = @list.List([@tactics.match_mp_tac(@iterate.sum_subset()), @tactics.all_tac])
  let t372 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, 1), (d : Num) => mangoldt(d))"))
  let t376 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t372), @tactics.conj_tac), t373), t374), t375), @int.asm_arith_tac), @tactics.all_tac])
  let t408 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) <= 1"))), t376), t377), t381), t382), t383), @tactics.conj_tac), t407)
  psi_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, sum(op_dot_dot(1, n), (d : Num) => mangoldt(d)) <= real_of_num(18) * real_of_num(n)"), t408))
}

///|
let psi_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSI_BOUND")

///|
/// `PSI_BOUND`
pub fn psi_bound() -> @kernel.Thm {
  psi_bound_c.get()
}

///|
/// MERTENS_LEMMA
fn step_16() -> Unit raise {
  let t458 = @simp.asm_rewrite_tac(@list.List([psi_bound()]))
  let t457 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t456 = @simp.asm_simp_tac(@list.List([log_le_refl()]))
  let t455 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= ((k : Real) - real_of_num(2)) * (n : Real) && (l : Real) <= n → x <= k * n - real_of_num(2) * l")))
  let t453 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num((n : Num)) / real_of_num((i : Num))"), @floor.floor()))
  let t452 = @simp.asm_rewrite_tac(@list.List([mangoldt_pos_le(), @realarith.real_sub_le(), @real.real_le_sub_radd()]))
  let t449 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t448 = @simp.gen_rewrite_tac(fn(x445 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s446 = @equal.rand_conv(x445)
    fn(x447 : @kernel.Term) -> @kernel.Thm raise {
      s446(x447)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t444 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t443 = @simp.simp_tac(@list.List([]))
  let t450 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_le_numseg()), t443), t444), @tactics.strip_tac), t448), t449)
  let t442 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t441 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t440 = @simp.simp_tac(@list.List([]))
  let t451 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_pos_le_numseg()), t440), t441), @tactics.strip_tac), t442), t450])
  let t438 = @calc_rat.real_arith(@term_syntax.parse_term("-((a : Real) * ((x : Real) - (y : Real))) == a * (y - x)"))
  let t439 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_neg()), t438]))
  let t454 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= -(x : Real) && -x <= (y : Real) → abs(x) <= y"))), t439), @tactics.conj_tac), t451), t452), t453), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t437 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (n : Num)), (i : Num) => mangoldt(i))"))
  let t436 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t435 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sub_ldistrib())]))
  let t434 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) * ((i : Real) / (x : Real)) == i * (n / x)"))]))
  let t433 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t432 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_sub_numseg())]))
  let t430 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t431 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → abs(x - real_of_num(1)) <= x"))), t430), @int.asm_arith_tac), @tactics.all_tac])
  let t429 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((n : Real) - real_of_num(1)) <= n && abs((s' : Real) - (s : Real)) <= ((k : Real) - real_of_num(1)) * n - (a : Real) → abs(s' - ((nl : Real) - n + real_of_num(1))) <= a → abs(s - nl) <= n * k")))
  let t428 = @simp.rewrite_tac(@list.List([mangoldt_v1()]))
  let t425 = @drule.match_mp(log_fact_bounds())
  let t427 = @tactics.first_assum(fn(x426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x422 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s423 = @tactics.mp_tac(x422)
      fn(x424 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s423(x424)
      }
    })(t425(x426))
  })
  let t420 = @equal.gsym(@iterate.sum_lmul())
  let t421 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_mul()), @real.real_sub_ldistrib(), t420]))
  let t419 = @simp.gen_rewrite_tac(fn(x418 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x412 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s413 = @equal.land_conv(x412)
      fn(x414 : @kernel.Term) -> @kernel.Thm raise {
        s413(x414)
      }
    })((fn(x415 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s416 = @equal.land_conv(x415)
      fn(x417 : @kernel.Term) -> @kernel.Thm raise {
        s416(x417)
      }
    })(x418))
  }, @list.List([@equal.gsym(@calc_int.real_abs_num())]))
  let t411 = @simp.asm_simp_tac(@list.List([@real.real_of_num_lt(), @arith.lt_nz()]))
  let t410 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((n : Num))"))
  let t409 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t459 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t409), t410), t411), t419), t421), t427), t428), t429), @tactics.conj_tac), t431), t432), t433), t434), t435), t436), t437), @tactics.conj_tac), t454), t455), t456), t457), t458)
  mertens_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) → abs(sum(op_dot_dot(1, n), (d : Num) => mangoldt(d) / real_of_num(d)) - log(real_of_num(n))) <= real_of_num(21)"), t459))
}

///|
let mertens_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MERTENS_LEMMA")

///|
/// `MERTENS_LEMMA`
pub fn mertens_lemma() -> @kernel.Thm {
  mertens_lemma_c.get()
}

///|
/// MERTENS_MANGOLDT_VERSUS_LOG
fn step_17() -> Unit raise {
  let t763 = @int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → 1 <= n && 1 < n"))
  let t764 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realarith.real_sub_le(), @transcendentals.log_pos(), @realax.real_of_num_le(), @real.real_of_num_lt(), @transcendentals.log_mono_le_imp(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - real_of_num(1) <= x")), @realarith.real_sub_lt(), @arith.le_0(), t763]))
  let t762 = @simp.rewrite_tac(@list.List([@real.real_sub_refl(), @calc_rat.real_arith(@term_syntax.parse_term("(-(x : Real) <= real_of_num(0)) == (real_of_num(0) <= x)"))]))
  let t761 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) && -(c : Real) <= (e : Real) → a - b - c <= e")))
  let t760 = @simp.rewrite_tac(@list.List([log_2_bounds()]))
  let t759 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (e : Real) - real_of_num(2) && (x : Real) <= real_of_num(1) → a + real_of_num(2) * x <= e")))
  let t758 = @simp.rewrite_tac(@list.List([@transcendentals.log_1(), @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (real_of_num(0) - (x : Real) - x / real_of_num(1)) == a + real_of_num(2) * x"))]))
  let t757 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t752 = @equal.gsym(@complexes.cx_pow())
  let t753 = @int.arith_rule(@term_syntax.parse_term("3 <= (n : Num) → 0 < n && 1 < n"))
  let t754 = @equal.gsym(@complexes.cx_div())
  let t755 = @equal.gsym(@transcendentals.cx_log())
  let t756 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cx_sub()), t755, t754, @realarith.real_sub_lt(), @calc_num.arith(), @complexes.re_cx(), @real.real_of_num_lt(), t753, t752]))
  let t751 = @list.List([@tactics.match_mp_tac(@iterate.sum_eq_numseg()), @tactics.all_tac])
  let t750 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) && (a : Real) <= (b : Real) → x <= a → y <= b")))
  let t749 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t747 = @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())
  let t746 = @simp.rewrite_tac(@list.List([log_2_bounds()]))
  let t745 = @tactics.exists_tac(@term_syntax.parse_term("log(real_of_num(2))"))
  let t744 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t743 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq()]))
  let t742 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) <= real_of_num(1) && real_of_num(1) / real_of_num(2) <= (c : Real) → b * a <= real_of_num(2) * c")))
  let t741 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_rdiv_eq(), @realarith.real_sub_lt()]))
  let t740 = @simp.asm_simp_tac(@list.List([@real.real_le_rmul_eq(), @real.real_lt_inv_eq(), @realarith.real_sub_lt()]))
  let t739 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realax.real_div(), @real.real_inv_mul(), @realax.real_mul_assoc(), @calc_rat.real_ring(@term_syntax.parse_term("pow((x : Real), 3) == x * pow(x, 2)"))]))
  let t733 = @equal.gsym(@complexes.cx_inv())
  let t734 = @equal.gsym(@complexes.cx_mul())
  let t735 = @equal.gsym(@complexes.cx_div())
  let t736 = @equal.gsym(@complexes.cx_pow())
  let t737 = @equal.gsym(@complexes.cx_sub())
  let t738 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), t737, t736, t735, t734, t733, @complexes.re_cx()]))
  let t732 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (u : Real) && real_of_num(1) < u && real_of_num(2) <= u"), @tactics.strip_assume_tac)
  let t731 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) → (x <= (u : Real) && u <= y || y <= u && u <= x) == (x <= u && u <= y)"))]))
  let t728 = @simp.gen_rewrite_rule(fn(x727 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x727
  }, @list.List([@complexes.in_segment_cx()]))
  let t730 = @tactics.first_x_assum(fn(x729 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x724 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s725 = @tactics.mp_tac(x724)
      fn(x726 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s725(x726)
      }
    })(t728(x729))
  })
  let t723 = @simp.abbrev_tac(@term_syntax.parse_term("(u : Real) == Re((w : Cart[Real, 2]))"))
  let t720 = @simp.gen_rewrite_rule(fn(x719 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x719
  }, @list.List([@complexes.real_v1()]))
  let t722 = @tactics.first_x_assum(fn(x721 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x715 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s716 = @tactics.subst_all_tac(x715)
        fn(x717 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s716(x717)
        }
      })(@equal.sym(x718))
    })(t720(x721))
  })
  let t714 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.real_segment(), @complexes.real_cx()])), @tactics.all_tac])
  let t713 = @tactics.subgoal_then(@term_syntax.parse_term("real((w : Cart[Real, 2]))"), fn(x710 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s711 = @tactics.assume_tac(x710)
    fn(x712 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s711(x712)
    }
  })
  let t709 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @realarith.real_neg_sub(), @realarith.real_sub_le()]))
  let t708 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_le()]))
  let t707 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t706 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) * ((y : Real) - (x : Real)) <= real_of_num(0)) == (real_of_num(0) <= -a * (y - x))"))]))
  let t705 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub()), @complexes.re_mul_cx()]))
  let t703 = @tactics.conjuncts_then2(fn(x697 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s698 = @tactics.assume_tac(x697)
    fn(x699 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s698(x699)
    }
  }, fn(x700 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s701 = @tactics.subst1_tac(x700)
    fn(x702 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s701(x702)
    }
  })
  let t704 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w : Cart[Real, 2])"))(t703))
  let t696 = @simp.gen_rewrite_tac(fn(x693 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s694 = @equal.rand_conv(x693)
    fn(x695 : @kernel.Term) -> @kernel.Thm raise {
      s694(x695)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) <= (y : Real)) == (x - y <= real_of_num(0))"))]))
  let t691 = @simp.rewrite_tac(@list.List([@complexes.re_cx(), @complexes.im_cx()]))
  let t690 = @tactics.repeat_tac(@tactics.pop_assum(fn(x687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s688 = @tactics.mp_tac(x687)
    fn(x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s688(x689)
    }
  }))
  let t686 = @tactics.disch_then(fn(x683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s684 = @tactics.subst_all_tac(x683)
    fn(x685 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s684(x685)
    }
  })
  let t682 = @list.List([@tactics.all_tac, @tactics.conv_tac(@complexes.complex_field)])
  let t681 = @tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0))) && !(z == Cx(real_of_num(1)))"), fn(x678 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s679 = @tactics.mp_tac(x678)
    fn(x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s679(x680)
    }
  })
  let t677 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t676 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t675 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= (x : Real) && x <= (b : Real) || b <= x && x <= a) == (a <= x && x <= b || b < a && b <= x && x <= a)"))]))
  let t674 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t692 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.in_segment_cx_gen()])), t674), t675), @tactics.strip_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), @canal.complex_diff_tac), t676), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t677), t681), t682), @tactics.conj_tac), t686), t690), t691), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t673 = @simp.rewrite_tac(@list.List([]))
  let t669 = @term_syntax.parse_term("Cx((y : Real))")
  let t670 = @term_syntax.parse_term("Cx((x : Real))")
  let t671 = @term_syntax.parse_term("(z : Cart[Real, 2]) => inv(z * pow(z - Cx(real_of_num(1)), 2)) - Cx(real_of_num(2)) * (clog(z) / pow(z - Cx(real_of_num(1)), 3))")
  let t672 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => clog(z) / pow(z - Cx(real_of_num(1)), 2)"), t671, t670, t669]), @canal.complex_mvt_line()))
  let t667 = @term_syntax.parse_term("(y : Real)")
  let t668 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Real)"), t667]))
  let t665 = @tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())]))), @int.asm_arith_tac)
  let t664 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx()]))
  let t663 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(2) <= Re((z : Cart[Real, 2]))"))
  let t662 = @tactics.repeat_tac(@tactics.strip_tac)
  let t661 = @list.List([@tactics.all_tac, @tactics.conv_tac(@complexes.complex_field)])
  let t660 = @tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0))) && !(z == Cx(real_of_num(1)))"), fn(x657 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s658 = @tactics.mp_tac(x657)
    fn(x659 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s658(x659)
    }
  })
  let t656 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) <= (x : Real) → real_of_num(1) < x && real_of_num(0) < x"))]))
  let t655 = @simp.asm_simp_tac(@list.List([@complexes.re_sub(), @complexes.re_cx(), @realarith.real_sub_lt()]))
  let t666 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@canal.complex_diff_tac, @simp.simp_tac(@list.List([@complexes.complex_sub_rzero(), @complexes.complex_mul_lid()]))), t655), t656), t660), t661), t662), t663), t664), @calc_rat.real_arith_tac), t665])
  let t654 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t748 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.in_segment_cx_gen()])), t654), @tactics.strip_tac), t666), @tactics.all_tac])), t668), @tactics.strip_tac), t672), t673), @tactics.ants_tac), t692), t696), t704), t705), t706), t707), t708), t709), t713), t714), t722), t723), t730), t731), @tactics.strip_tac), t732), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t738), t739), t740), t741), t742), t743), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t744), t745), t746), t747), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t653 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t652 = @simp.asm_rewrite_tac(@list.List([]))
  let t648 = @term_syntax.parse_term("(n : Num)")
  let t649 = @term_syntax.parse_term("3")
  let t650 = @term_syntax.parse_term("(z : Cart[Real, 2]) => clog(z - Cx(real_of_num(1))) - clog(z) - clog(z) / (z - Cx(real_of_num(1)))")
  let t651 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => clog(z) / pow(z - Cx(real_of_num(1)), 2)"), t650, t649, t648]), @canal.sum_integral_ubound_decreasing()))
  let t647 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t646 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses()]))
  let t644 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@arith.not_lt()])))
  let t645 = @list.List([@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@iterate.numseg_empty())]))), t644])
  let t643 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) < 3"))
  let t642 = @list.List([@tactics.then_tac(@tactics.mp_tac(log_2_bounds()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t641 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= real_of_num(1) && (y : Real) <= (e : Real) - real_of_num(1) → x + y <= e")))
  let t640 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses_left(), @calc_num.arith()]))
  let t639 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t638 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses()]))
  let t636 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@arith.not_lt()])))
  let t637 = @list.List([@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@iterate.numseg_empty())]))), t636])
  let t635 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) < 2"))
  let t632 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - real_of_num(1) <= x"))
  let t633 = @simp.asm_simp_tac(@list.List([@realarith.real_pow_2(), @real.real_le_rmul_eq(), @real.real_lt_mul(), @realarith.real_lt_imp_le(), @realarith.real_sub_lt(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(1 < (p : Num)) == (2 <= p)")), t632]))
  let t631 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t630 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p"))]))
  let t629 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t628 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t627 = @tactics.repeat_tac(@tactics.strip_tac)
  let t634 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_le_numseg()), t627), t628), t629), t630), t631), t633), @tactics.all_tac])
  let t626 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(2, (n : Num)), (m : Num) => log(real_of_num(m)) / pow(real_of_num(m) - real_of_num(1), 2))"))
  let t625 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t623 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p")), @realax.real_le_mul(), @realarith.real_pos(), @realarith.real_sub_le(), @real.real_le_div()]))
  let t622 = @list.List([@meson.meson_tac(@list.List([@prime.prime_ge_2()])), @tactics.all_tac])
  let t621 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @iterate.in_numseg(), @sets.in_elim_thm()]))
  let t620 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_restrict()]))
  let t624 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_subset()), t620), t621), @tactics.conj_tac), t622), t623), @tactics.all_tac])
  let t619 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(2, (n : Num)), (p : Num) => log(real_of_num(p)) / (real_of_num(p) * (real_of_num(p) - real_of_num(1))))"))
  let t618 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t616 = @tactics.conv_tac(@calc_rat.real_field)
  let t615 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t612 = @drule.match_mp(@prime.prime_ge_2())
  let t614 = @tactics.first_assum(fn(x613 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x609 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s610 = @tactics.mp_tac(x609)
      fn(x611 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s610(x611)
      }
    })(t612(x613))
  })
  let t608 = @tactics.match_mp_tac(@real.real_eq_imp_le())
  let t606 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t605 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t604 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @real.real_le_inv_eq(), @realarith.real_pos(), @realarith.real_sub_le()]))
  let t607 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), t604), t605), t606), @tactics.all_tac])
  let t603 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) * (z : Real) && (x : Real) * z <= (a : Real) → (x - y) * z <= a")))
  let t602 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le()]))
  let t601 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t600 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t599 = @simp.asm_simp_tac(@list.List([@calc_int.real_mul_rzero(), @real.real_le_div(), @realax.real_le_mul(), @realarith.real_sub_le(), @realax.real_of_num_le(), @transcendentals.log_pos(), @arith.le_0()]))
  let t598 = @simp.asm_simp_tac(@list.List([@real.real_inv_eq_1(), @realax.real_of_num_eq(), @prime.prime_ge_2(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → !(p == 1)"))]))
  let t597 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @iterate.in_numseg()]))
  let t596 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t595 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.finite_restrict()]))
  let t617 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_le()), t595), t596), t597), t598), @tactics.strip_tac), @class.cond_cases_tac), t599), t600), t601), t602), t603), @tactics.conj_tac), t607), t608), t614), t615), t616), @tactics.all_tac])
  let t594 = @tactics.exists_tac(@term_syntax.parse_term("sum({(p : Num) | IN(p, op_dot_dot(1, (n : Num))) && prime(p)}, (p : Num) => log(real_of_num(p)) / (real_of_num(p) * (real_of_num(p) - real_of_num(1))))"))
  let t593 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t592 = @simp.rewrite_tac(@list.List([@realax.real_div(), @iterate.sum_lmul(), @equal.gsym(@real.real_pow_inv()), @misc.sum_gp()]))
  let t588 = @simp.asm_simp_tac(@list.List([@arith.lt_pow2_refl(), @arith.lt_imp_le(), @arith.exp_mono_le(), @prime.prime_ge_2()]))
  let t587 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2, (k : Num))"))
  let t586 = @tactics.match_mp_tac(@arith.le_trans())
  let t585 = @simp.asm_simp_tac(@list.List([]))
  let t584 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (k : Num))"))
  let t589 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t584), t585), t586), t587), t588)
  let t583 = @simp.asm_simp_tac(@list.List([@prime.prime_imp_nz(), @arith.le_exp()]))
  let t582 = @simp.gen_rewrite_tac(fn(x579 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s580 = @equal.land_conv(x579)
    fn(x581 : @kernel.Term) -> @kernel.Thm raise {
      s580(x581)
    }
  }, @list.List([@equal.gsym(@arith.exp_1())]))
  let t578 = @simp.asm_simp_tac(@list.List([]))
  let t577 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (k : Num))"))
  let t590 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t577), t578), t582), t583), @int.asm_arith_tac), t589])
  let t576 = @simp.asm_simp_tac(@list.List([@prime.prime_imp_nz(), @int.arith_rule(@term_syntax.parse_term("(1 <= (k : Num)) == !(k == 0)"))]))
  let t574 = @int.arith_rule(@term_syntax.parse_term("(k : Num) >= 2 → 1 <= k && 2 <= k"))
  let t575 = @simp.asm_simp_tac(@list.List([mangoldt_primepow(), @equal.gsym(@calc_int.real_of_num_pow()), @realax.real_le_refl(), t574]))
  let t573 = @tactics.first_x_assum(fn(x570 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s571 = @tactics.subst_all_tac(x570)
    fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s571(x572)
    }
  })
  let t569 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t568 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t567 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t566 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t565 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t564 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @iterate.in_numseg(), @real.real_le_div(), @real.real_pow_le(), @realarith.real_pos(), @transcendentals.log_pos(), @realax.real_of_num_le()]))
  let t563 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm(), @pair.exists_pair_thm()]))
  let t561 = @meson.meson_tac(@list.List([]))
  let t560 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @iterate.finite_numseg(), @iterate.in_numseg(), @arith.le_0()]))
  let t559 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t562 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t559), t560), t561), @tactics.all_tac])
  let t558 = @simp.simp_tac(@list.List([@sets.finite_product(), @iterate.finite_numseg(), @sets.finite_restrict()]))
  let t557 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> Num) => ∀ p : Num, ∀ k : Num, GEQ(f((p, k)), EXP(p, k)))"))
  let t556 = @tactics.match_mp_tac(@iterate.sum_le_included())
  let t591 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@iterate.sum_sum_product(), @iterate.finite_numseg(), @sets.finite_restrict()])), t556), t557), t558), @tactics.conj_tac), t562), t563), t564), t565), t566), t567), t568), t569), @tactics.strip_tac), t573), t575), t576), @tactics.conj_tac), t590), @tactics.all_tac])
  let t555 = @tactics.exists_tac(@term_syntax.parse_term("sum({(p : Num) | IN(p, op_dot_dot(1, (n : Num))) && prime(p)}, (p : Num) => sum(op_dot_dot(2, n), (k : Num) => log(real_of_num(p)) / pow(real_of_num(p), k)))"))
  let t554 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t552 = @meson.meson_tac(@list.List([]))
  let t551 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @iterate.finite_numseg(), @iterate.in_numseg(), @arith.le_0()]))
  let t550 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t549 = @tactics.match_mp_tac(@sets.finite_subset())
  let t548 = @simp.simp_tac(@list.List([@real.real_le_div(), @realarith.real_pos(), mangoldt_pos_le()]))
  let t553 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_pos_le()), t548), t549), t550), t551), t552), @tactics.all_tac])
  let t547 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (y : Real) → abs(x) <= y")))
  let t543 = @meson.meson_tac(@list.List([@arith.exp_1()]))
  let t542 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_elim_thm()]))
  let t544 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((k : Num) >= 1) == (k >= 2 || k == 1)"))])), t542), t543)
  let t541 = @meson.meson_tac(@list.List([@prime.prime_exp(), @int.arith_rule(@term_syntax.parse_term("!(1 >= 2)"))]))
  let t545 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_elim_thm(), @sets.not_in_empty()])), t541), t544])
  let t539 = @meson.meson_tac(@list.List([]))
  let t538 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @iterate.finite_numseg(), @iterate.in_numseg(), @arith.le_0()]))
  let t537 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t540 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t537), t538), t539), @tactics.all_tac])
  let t536 = @tactics.match_mp_tac(@iterate.sum_union_eq())
  let t535 = @tactics.conv_tac(@equal.sym_conv)
  let t533 = @meson.asm_meson_tac(@list.List([@arith.ge()]))
  let t532 = @simp.rewrite_tac(@list.List([mangoldt()]))
  let t531 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realarith.real_entire()]))
  let t530 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0()])), @tactics.all_tac])
  let t529 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")), @arith.exp_eq_0()]))
  let t528 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @sets.subset(), @iterate.in_numseg()]))
  let t534 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_superset()), t528), @tactics.conj_tac), @tactics.gen_tac), @tactics.strip_tac), t529), t530), t531), @tactics.disj1_tac), t532), t533), @tactics.all_tac])
  let t527 = @tactics.exists_tac(@term_syntax.parse_term("sum({EXP((p : Num), (k : Num)) | prime(p) && EXP(p, k) <= (n : Num) && k >= 1}, (d : Num) => mangoldt(d) / real_of_num(d))"))
  let t526 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t525 = @simp.rewrite_tac(@list.List([@real.real_eq_sub_radd()]))
  let t523 = @simp.asm_simp_tac(@list.List([mangoldt_primepow(), @calc_num.arith()]))
  let t522 = @simp.gen_rewrite_tac(fn(x521 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x517 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x511 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s512 = @equal.rand_conv(x511)
        fn(x513 : @kernel.Term) -> @kernel.Thm raise {
          s512(x513)
        }
      })((fn(x514 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s515 = @equal.land_conv(x514)
        fn(x516 : @kernel.Term) -> @kernel.Thm raise {
          s515(x516)
        }
      })(x517))
    })((fn(x518 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s519 = @equal.rand_conv(x518)
      fn(x520 : @kernel.Term) -> @kernel.Thm raise {
        s519(x520)
      }
    })(x521))
  }, @list.List([@equal.gsym(@arith.exp_1())]))
  let t510 = @tactics.repeat_tac(@tactics.strip_tac)
  let t509 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t524 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq()), t509), t510), t522), t523), @tactics.all_tac])
  let t546 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("sum({(p : Num) | prime(p) && p <= (n : Num)}, (p : Num) => log(real_of_num(p)) / real_of_num(p)) == sum({(p : Num) | prime(p) && p <= n}, (d : Num) => mangoldt(d) / real_of_num(d))"), fn(x506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s507 = @tactics.subst1_tac(x506)
    fn(x508 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s507(x508)
    }
  }), t524), t525), t526), t527), @tactics.conj_tac), t534), t535), t536), @tactics.conj_tac), t540), @tactics.conj_tac), t545), @tactics.all_tac])
  let t505 = @tactics.subgoal_then(@term_syntax.parse_term("sum(op_dot_dot(1, (n : Num)), (d : Num) => mangoldt(d) / real_of_num(d)) - sum({(p : Num) | prime(p) && p <= n}, (p : Num) => log(real_of_num(p)) / real_of_num(p)) == sum({EXP((p : Num), (k : Num)) | prime(p) && EXP(p, k) <= n && k >= 2}, (d : Num) => mangoldt(d) / real_of_num(d))"), fn(x502 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s503 = @tactics.subst1_tac(x502)
    fn(x504 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s503(x504)
    }
  })
  let t500 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p")), @prime.prime_ge_2()]))
  let t501 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @iterate.in_numseg()])), t500), @tactics.all_tac])
  let t499 = @tactics.subgoal_then(@term_syntax.parse_term("{(p : Num) | prime(p) && IN(p, op_dot_dot(1, (n : Num)))} == {(p : Num) | prime(p) && p <= n}"), fn(x496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s497 = @tactics.subst1_tac(x496)
    fn(x498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s497(x498)
    }
  })
  let t494 = @simp.asm_simp_tac(@list.List([mangoldt_primepow(), @arith.le_refl(), @realax.real_le_refl()]))
  let t493 = @simp.gen_rewrite_tac(fn(x492 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x488 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x482 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s483 = @equal.rand_conv(x482)
        fn(x484 : @kernel.Term) -> @kernel.Thm raise {
          s483(x484)
        }
      })((fn(x485 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s486 = @equal.land_conv(x485)
        fn(x487 : @kernel.Term) -> @kernel.Thm raise {
          s486(x487)
        }
      })(x488))
    })((fn(x489 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s490 = @equal.rand_conv(x489)
      fn(x491 : @kernel.Term) -> @kernel.Thm raise {
        s490(x491)
      }
    })(x492))
  }, @list.List([@equal.gsym(@arith.exp_1())]))
  let t481 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), mangoldt_pos_le(), @realarith.real_pos()]))
  let t480 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t479 = @simp.asm_simp_tac(@list.List([@sets.in_diff(), @iterate.finite_numseg(), @realarith.real_sub_le()]))
  let t477 = @tactics.match_mp_tac(@iterate.sum_subset_simple())
  let t478 = @list.List([@tactics.match_mp_tac(@iterate.sum_pos_le()), t477])
  let t476 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (y : Real) → abs(x) <= abs(y)")))
  let t475 = @simp.asm_simp_tac(@list.List([@equal.gsym(@iterate.sum_sub()), @iterate.finite_numseg()]))
  let t474 = @simp.asm_simp_tac(@list.List([@iterate.sum_restrict_set(), @iterate.finite_numseg()]))
  let t473 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t472 = @list.List([@meson.asm_meson_tac(@list.List([@sets.finite_subset(), @iterate.finite_numseg()])), @tactics.all_tac])
  let t495 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("FINITE((s : (Num) -> Bool))"), fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s470 = @tactics.assume_tac(x469)
    fn(x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s470(x471)
    }
  }), t472), t473), t474), t475), t476), @tactics.conj_tac), t478), t479), t480), @tactics.strip_tac), @class.cond_cases_tac), t481), t493), t494), @tactics.all_tac])
  let t468 = @tactics.exists_tac(@term_syntax.parse_term("abs(sum(op_dot_dot(1, (n : Num)), (d : Num) => mangoldt(d) / real_of_num(d)) - sum({(p : Num) | prime(p) && IN(p, op_dot_dot(1, n))}, (p : Num) => log(real_of_num(p)) / real_of_num(p)))"))
  let t467 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t465 = @simp.rewrite_tac(@list.List([@sets.not_in_empty(), @sets.empty_gspec(), @iterate.sum_clauses()]))
  let t464 = @tactics.disch_then(fn(x461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s462 = @tactics.subst_all_tac(x461)
    fn(x463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s462(x463)
    }
  })
  let t466 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@iterate.numseg_clauses(), @calc_num.arith(), @sets.subset_empty()])), t464), t465), @calc_rat.real_arith_tac), @tactics.disch_tac])
  let t460 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t765 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t460), t466), t467), t468), @tactics.conj_tac), t495), t499), t501), t505), t546), t547), @tactics.conj_tac), t553), t554), t555), @tactics.conj_tac), t591), t592), t593), t594), @tactics.conj_tac), t617), t618), t619), @tactics.conj_tac), t624), t625), t626), @tactics.conj_tac), t634), t635), t637), t638), t639), t640), t641), @tactics.conj_tac), t642), t643), t645), t646), t647), t651), t652), t653), @tactics.ants_tac), t748), t749), t750), @tactics.conj_tac), t751), t756), t757), t758), t759), t760), t761), t762), t764)
  mertens_mangoldt_versus_log_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : (Num) -> Bool, SUBSET(s, op_dot_dot(1, n)) → abs(sum(s, (d : Num) => mangoldt(d) / real_of_num(d)) - sum({(p : Num) | prime(p) && IN(p, s)}, (p : Num) => log(real_of_num(p)) / real_of_num(p))) <= real_of_num(3)"), t765))
}

///|
let mertens_mangoldt_versus_log_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MERTENS_MANGOLDT_VERSUS_LOG")

///|
/// `MERTENS_MANGOLDT_VERSUS_LOG`
pub fn mertens_mangoldt_versus_log() -> @kernel.Thm {
  mertens_mangoldt_versus_log_c.get()
}

///|
/// MERTENS
fn step_18() -> Unit raise {
  let t780 = @simp.asm_rewrite_tac(@list.List([@sets.subset_refl()]))
  let t779 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t781 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(mertens_mangoldt_versus_log()), t779), t780)
  let t778 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p")), @prime.prime_ge_2()]))
  let t782 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @iterate.in_numseg()])), t778), t781])
  let t777 = @tactics.subgoal_then(@term_syntax.parse_term("{(p : Num) | prime(p) && p <= (n : Num)} == {(p : Num) | prime(p) && IN(p, op_dot_dot(1, n))}"), fn(x774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s775 = @tactics.subst1_tac(x774)
    fn(x776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s775(x776)
    }
  })
  let t773 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t772 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((s1 : Real) - (s2 : Real)) <= (k : Real) - (e : Real) → abs(s1 - (l : Real)) <= e → abs(s2 - l) <= k")))
  let t769 = @drule.match_mp(mertens_lemma())
  let t771 = @tactics.first_assum(fn(x770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x766 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s767 = @tactics.mp_tac(x766)
      fn(x768 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s767(x768)
      }
    })(t769(x770))
  })
  let t783 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t771), t772), t773), t777), t782)
  mertens_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !(n == 0) → abs(sum({(p : Num) | prime(p) && p <= n}, (p : Num) => log(real_of_num(p)) / real_of_num(p)) - log(real_of_num(n))) <= real_of_num(24)"), t783))
}

///|
let mertens_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MERTENS")

///|
/// `MERTENS`
pub fn mertens() -> @kernel.Thm {
  mertens_c.get()
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
}
