// Translated from upstream 100/dirichlet.ml; edit this file directly.

///|
/// 100/dirichlet.ml:12
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// 100/dirichlet.ml:13
fn step_2() -> Unit raise {
  @complexes.prioritize_complex(())
}

///|
/// VSUM_VSUM_DIVISORS
fn step_3() -> Unit raise {
  let t1 = @simp.simp_tac(@list.List([@vectors.vsum_v1(), @iterate.finite_numseg(), @pocklington.iterate_iterate_divisors(), @vectors.monoidal_vector_add()]))
  let t2 = @tactics.then_tac(@simp.simp_tac(@list.List([@vectors.vsum_v1(), @prime.finite_divisors(), @arith.le_1()])), t1)
  vsum_vsum_divisors_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, Num) -> Cart[Real, _], ∀ x : Num, vsum(op_dot_dot(1, x), (n : Num) => vsum({(d : Num) | divides(d, n)}, f(n))) == vsum(op_dot_dot(1, x), (n : Num) => vsum(op_dot_dot(1, DIV(x, n)), (k : Num) => f(k * n, n)))"), t2))
}

///|
let vsum_vsum_divisors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_VSUM_DIVISORS")

///|
/// `VSUM_VSUM_DIVISORS`
pub fn vsum_vsum_divisors() -> @kernel.Thm {
  vsum_vsum_divisors_c.get()
}

///|
/// REAL_EXP_1_LE_4
fn step_4() -> Unit raise {
  let t6 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1) / real_of_num(2)"), @transcendentals.real_exp_bound_lemma()))
  let t5 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_le()]))
  let t4 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(4) == real_of_num(2) * real_of_num(2)")), @transcendentals.real_exp_add()]))
  let t7 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("real_of_num(1) == real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2)")), @transcendentals.real_exp_add()])), t3), t4), t5), t6), @calc_rat.real_arith_tac)
  real_exp_1_le_4_c.set(@tactics.prove(@term_syntax.parse_term("exp(real_of_num(1)) <= real_of_num(4)"), t7))
}

///|
let real_exp_1_le_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_EXP_1_LE_4")

///|
/// `REAL_EXP_1_LE_4`
pub fn real_exp_1_le_4() -> @kernel.Thm {
  real_exp_1_le_4_c.get()
}

///|
/// DECREASING_LOG_OVER_N
fn step_5() -> Unit raise {
  let t62 = @tactics.mp_tac(real_exp_1_le_4())
  let t61 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_lt()]))
  let t60 = @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())
  let t59 = @simp.gen_rewrite_tac(fn(x56 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s57 = @equal.land_conv(x56)
    fn(x58 : @kernel.Term) -> @kernel.Thm raise {
      s57(x58)
    }
  }, @list.List([@equal.gsym(@transcendentals.log_exp())]))
  let t55 = @simp.rewrite_tac(@list.List([@realarith.real_sub_le()]))
  let t54 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square()]))
  let t53 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t47 = @equal.gsym(@real.real_pow_inv())
  let t48 = @equal.gsym(@calc_int.real_mul_lneg())
  let t49 = @equal.gsym(@complexes.cx_div())
  let t50 = @equal.gsym(@complexes.cx_pow())
  let t51 = @equal.gsym(@complexes.cx_sub())
  let t52 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), t51, t50, t49, @complexes.re_cx(), @realax.real_div(), t48, @realarith.real_neg_sub(), t47]))
  let t46 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (u : Real)"), fn(x43 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s44 = @tactics.assume_tac(x43)
    fn(x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s44(x45)
    }
  })
  let t42 = @tactics.undisch_then(@term_syntax.parse_term("true"), fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t40 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.im_cx(), @complexes.re_cx()])))
  let t39 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.real_v1(), @complexes.real()])), @tactics.all_tac])
  let t37 = @tactics.choose_then(fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s35 = @tactics.subst_all_tac(x34)
    fn(x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s35(x36)
    }
  })
  let t38 = @tactics.subgoal_then(@term_syntax.parse_term("∃ u : Real, (z : Cart[Real, 2]) == Cx(u)"), t37)
  let t33 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t32 = @simp.rewrite_tac(@list.List([@complexes.re_mul_cx(), @equal.gsym(@calc_int.real_mul_lneg())]))
  let t31 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= -(x : Real) → (a : Real) - (b : Real) == x → a <= b")))
  let t28 = @equal.gsym(@complexes.cx_sub())
  let t29 = @equal.gsym(@complexes.cx_div())
  let t30 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), t29, @complexes.re_cx(), t28]))
  let t27 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) && real_of_num(0) < real_of_num(n) + real_of_num(1)"), @tactics.strip_assume_tac)
  let t26 = @tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x23 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s24 = @tactics.mp_tac(x23)
    fn(x25 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s24(x25)
    }
  })
  let t63 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Cart[Real, 2])"))(t26)), t27), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t30), t31), t32), t33), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t38), t39), t40), t42), t46), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t52), t53), t54), t55), t59), t60), t61), t62), @calc_rat.asm_real_arith_tac)
  let t22 = @tactics.conv_tac(@complexes.complex_field)
  let t21 = @tactics.undisch_tac(@term_syntax.parse_term("!((w : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t20 = @simp.asm_simp_tac(@list.List([@complexes.re_cx(), @realarith.real_lt_refl()]))
  let t19 = @class.asm_cases_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t18 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < Re((w : Cart[Real, 2]))"), fn(x15 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s16 = @tactics.mp_tac(x15)
    fn(x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s16(x17)
    }
  })
  let t64 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), @tactics.strip_tac), @canal.complex_diff_tac), t18), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t19), t20), @tactics.disch_tac), t21), t22), t63])
  let t14 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!((n : Real) + real_of_num(1) <= (x : Real) && x <= n)"))]))
  let t13 = @simp.rewrite_tac(@list.List([@complexes.in_segment_cx_gen()]))
  let t9 = @term_syntax.parse_term("Cx(real_of_num((n : Num)) + real_of_num(1))")
  let t10 = @term_syntax.parse_term("Cx(real_of_num((n : Num)))")
  let t11 = @term_syntax.parse_term("(z : Cart[Real, 2]) => (Cx(real_of_num(1)) - clog(z)) / pow(z, 2)")
  let t12 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => clog(z) / z"), t11, t10, t9]), @canal.complex_mvt_line()))
  let t8 = @tactics.repeat_tac(@tactics.strip_tac)
  let t65 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())])), t8), t12), t13), t14), @tactics.ants_tac), t64)
  decreasing_log_over_n_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 4 <= n → log(real_of_num(n) + real_of_num(1)) / (real_of_num(n) + real_of_num(1)) <= log(real_of_num(n)) / real_of_num(n)"), t65))
}

///|
let decreasing_log_over_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DECREASING_LOG_OVER_N")

///|
/// `DECREASING_LOG_OVER_N`
pub fn decreasing_log_over_n() -> @kernel.Thm {
  decreasing_log_over_n_c.get()
}

///|
/// EXISTS_COMPLEX_ROOT_NONTRIVIAL
fn step_6() -> Unit raise {
  let t81 = @simp.asm_simp_tac(@list.List([@transcendentals.cexp_clog()]))
  let t80 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cexp_n()), @complexes.complex_div_lmul(), @complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t79 = @tactics.exists_tac(@term_syntax.parse_term("cexp(clog((a : Cart[Real, 2])) / Cx(real_of_num((n : Num))))"))
  let t78 = @simp.asm_simp_tac(@list.List([@complexes.complex_pow_one()]))
  let t82 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, !(Q : (_) -> Bool)(x) → !(P : (_) -> Bool)(x)) && (∃ x : _, P(x)) → (∃ x : _, P(x) && Q(x))"))), t78), t79), t80), t81)
  let t77 = @simp.asm_simp_tac(@list.List([@transcendentals.complex_root_unity_eq_1(), @int.divides_one(), @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 1)")), @transcendentals.complex_root_unity()]))
  let t83 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("cexp(Cx(real_of_num(2)) * (Cx(pi) * (ii * Cx(real_of_num(1) / real_of_num((n : Num))))))")), t77), t82])
  let t76 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) == Cx(real_of_num(1))"))
  let t74 = @tactics.conv_tac(@complexes.complex_ring)
  let t73 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_pow_zero()]))
  let t75 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(0))")), t73), t74), @tactics.all_tac])
  let t72 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t69 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)")))
  let t71 = @tactics.first_assum(fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x66 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s67 = @tactics.assume_tac(x66)
      fn(x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s67(x68)
      }
    })(t69(x70))
  })
  let t84 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t71), t72), t75), t76), t83)
  exists_complex_root_nontrivial_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ n : Num, 2 <= n → (∃ z : Cart[Real, 2], pow(z, n) == a && !(z == Cx(real_of_num(1))))"), t84))
}

///|
let exists_complex_root_nontrivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_COMPLEX_ROOT_NONTRIVIAL")

///|
/// `EXISTS_COMPLEX_ROOT_NONTRIVIAL`
pub fn exists_complex_root_nontrivial() -> @kernel.Thm {
  exists_complex_root_nontrivial_c.get()
}

///|
/// dirichlet_character
fn step_7() -> Unit raise {
  dirichlet_character_c.set(@pair.new_definition(@term_syntax.parse_term("(dirichlet_character : (Num, (Num) -> Cart[Real, 2]) -> Bool)((d : Num), (c : (Num) -> Cart[Real, 2])) == ((∀ n : Num, c(n + d) == c(n)) && (∀ n : Num, (c(n) == Cx(real_of_num(0))) == !coprime((n, d))) && (∀ m : Num, ∀ n : Num, c(m * n) == c(m) * c(n)))")))
}

///|
let dirichlet_character_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dirichlet_character")

///|
/// `dirichlet_character`
pub fn dirichlet_character() -> @kernel.Thm {
  dirichlet_character_c.get()
}

///|
/// DIRICHLET_CHARACTER_PERIODIC
fn step_8() -> Unit raise {
  let t85 = @simp.simp_tac(@list.List([dirichlet_character()]))
  dirichlet_character_periodic_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, dirichlet_character(d, c) → c(n + d) == c(n)"), t85))
}

///|
let dirichlet_character_periodic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_PERIODIC")

///|
/// `DIRICHLET_CHARACTER_PERIODIC`
pub fn dirichlet_character_periodic() -> @kernel.Thm {
  dirichlet_character_periodic_c.get()
}

///|
/// DIRICHLET_CHARACTER_EQ_0
fn step_9() -> Unit raise {
  let t86 = @simp.simp_tac(@list.List([dirichlet_character()]))
  dirichlet_character_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, dirichlet_character(d, c) → (c(n) == Cx(real_of_num(0))) == !coprime((n, d))"), t86))
}

///|
let dirichlet_character_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_EQ_0")

///|
/// `DIRICHLET_CHARACTER_EQ_0`
pub fn dirichlet_character_eq_0() -> @kernel.Thm {
  dirichlet_character_eq_0_c.get()
}

///|
/// DIRICHLET_CHARACTER_MUL
fn step_10() -> Unit raise {
  let t87 = @simp.simp_tac(@list.List([dirichlet_character()]))
  dirichlet_character_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, dirichlet_character(d, c) → c(m * n) == c(m) * c(n)"), t87))
}

///|
let dirichlet_character_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_MUL")

///|
/// `DIRICHLET_CHARACTER_MUL`
pub fn dirichlet_character_mul() -> @kernel.Thm {
  dirichlet_character_mul_c.get()
}

///|
/// DIRICHLET_CHARACTER_EQ_1
fn step_11() -> Unit raise {
  let t105 = @meson.meson_tac(@list.List([@prime.coprime_1(), @prime.coprime_sym()]))
  let t104 = @simp.asm_simp_tac(@list.List([dirichlet_character_eq_0()]))
  let t103 = @simp.rewrite_tac(@list.List([@complexes.complex_field(@term_syntax.parse_term("((a : Cart[Real, 2]) == a * a) == (a == Cx(real_of_num(0)) || a == Cx(real_of_num(1)))"))]))
  let t102 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t97 = @term_syntax.parse_term("1")
  let t101 = @tactics.disch_then(fn(x100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s95 = @tactics.mp_tac(x94)
      fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s95(x96)
      }
    })(((x99 : @kernel.Thm) => @lib.repeat((x98 : @kernel.Thm) => @bool.spec(t97, x98), x99))(x100))
  })
  let t91 = @drule.match_mp(dirichlet_character_mul())
  let t93 = @tactics.first_assum(fn(x92 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x88 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s89 = @tactics.mp_tac(x88)
      fn(x90 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s89(x90)
      }
    })(t91(x92))
  })
  let t106 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t93), t101), t102), t103), t104), t105)
  dirichlet_character_eq_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) → c(1) == Cx(real_of_num(1))"), t106))
}

///|
let dirichlet_character_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_EQ_1")

///|
/// `DIRICHLET_CHARACTER_EQ_1`
pub fn dirichlet_character_eq_1() -> @kernel.Thm {
  dirichlet_character_eq_1_c.get()
}

///|
/// DIRICHLET_CHARACTER_POW
fn step_12() -> Unit raise {
  let t113 = @simp.asm_rewrite_tac(@list.List([]))
  let t112 = @tactics.first_assum(fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x110
    @simp.rewrite_tac(@list.List([@drule.match_mp(dirichlet_character_mul())(th)]))
  })
  let t109 = @list.List([@meson.asm_meson_tac(@list.List([dirichlet_character_eq_1()])), @tactics.all_tac])
  let t108 = @simp.asm_simp_tac(@list.List([@arith.exp(), @complexes.complex_pow()]))
  let t107 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t114 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.replicate_tac(3, @tactics.gen_tac), t107), @tactics.disch_tac), @nums.induct_tac), t108), t109), t112), t113)
  dirichlet_character_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, dirichlet_character(d, c) → c(EXP(m, n)) == pow(c(m), n)"), t114))
}

///|
let dirichlet_character_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_POW")

///|
/// `DIRICHLET_CHARACTER_POW`
pub fn dirichlet_character_pow() -> @kernel.Thm {
  dirichlet_character_pow_c.get()
}

///|
/// DIRICHLET_CHARACTER_PERIODIC_GEN
fn step_13() -> Unit raise {
  let t124 = @simp.asm_simp_tac(@list.List([dirichlet_character_periodic()]))
  let t123 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(mk : Num) + (d : Num) + (n : Num) == mk + n + d"))]))
  let t122 = @tactics.first_x_assum(fn(x117 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x117
    @simp.gen_rewrite_tac(fn(x119 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s120 = @equal.rand_conv(x119)
      fn(x121 : @kernel.Term) -> @kernel.Thm raise {
        s120(x121)
      }
    }, @list.List([@equal.gsym(th)]))
  })
  let t116 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses()]))
  let t115 = @tactics.repeat_tac(@tactics.gen_tac)
  let t125 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), t115), @tactics.disch_tac), @nums.induct_tac), t116), @tactics.gen_tac), t122), t123), t124)
  dirichlet_character_periodic_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, dirichlet_character(d, c) → c(m * d + n) == c(n)"), t125))
}

///|
let dirichlet_character_periodic_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_PERIODIC_GEN")

///|
/// `DIRICHLET_CHARACTER_PERIODIC_GEN`
pub fn dirichlet_character_periodic_gen() -> @kernel.Thm {
  dirichlet_character_periodic_gen_c.get()
}

///|
/// DIRICHLET_CHARACTER_CONG
fn step_14() -> Unit raise {
  let t127 = @simp.asm_simp_tac(@list.List([dirichlet_character_periodic_gen()]))
  let t126 = @tactics.repeat_tac(@tactics.strip_tac)
  let t128 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pocklington.cong_cases()])), t126), t127)
  dirichlet_character_cong_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ m : Num, ∀ n : Num, dirichlet_character(d, c) && op_eq_eq(m, n, mod(d)) → c(m) == c(n)"), t128))
}

///|
let dirichlet_character_cong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_CONG")

///|
/// `DIRICHLET_CHARACTER_CONG`
pub fn dirichlet_character_cong() -> @kernel.Thm {
  dirichlet_character_cong_c.get()
}

///|
/// DIRICHLET_CHARACTER_ROOT
fn step_15() -> Unit raise {
  let t143 = @meson.asm_meson_tac(@list.List([@prime.coprime_sym()]))
  let t142 = @tactics.match_mp_tac(@pocklington.fermat_little())
  let t141 = @simp.asm_rewrite_tac(@list.List([]))
  let t140 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num)"))
  let t139 = @tactics.match_mp_tac(dirichlet_character_cong())
  let t138 = @tactics.first_assum(fn(x136 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x136
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(dirichlet_character_pow())(th))]))
  })
  let t133 = @drule.match_mp(dirichlet_character_eq_1())
  let t135 = @tactics.first_assum(fn(x134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s130 = @tactics.subst1_tac(x129)
        fn(x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s130(x131)
        }
      })(@equal.gsym(x132))
    })(t133(x134))
  })
  let t144 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t135), t138), t139), t140), t141), t142), t143)
  dirichlet_character_root_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, dirichlet_character(d, c) && coprime((d, n)) → pow(c(n), phi(d)) == Cx(real_of_num(1))"), t144))
}

///|
let dirichlet_character_root_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_ROOT")

///|
/// `DIRICHLET_CHARACTER_ROOT`
pub fn dirichlet_character_root() -> @kernel.Thm {
  dirichlet_character_root_c.get()
}

///|
/// DIRICHLET_CHARACTER_NORM
fn step_16() -> Unit raise {
  let t164 = @meson.asm_meson_tac(@list.List([@pocklington.phi_lowerbound_1_strong(), @arith.le_1()]))
  let t163 = @simp.asm_rewrite_tac(@list.List([@vectors.real_abs_norm()]))
  let t161 = @term_syntax.parse_term("phi((d : Num))")
  let t162 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("norm((c : (Num) -> Cart[Real, 2])((n : Num)))"), t161]), @real.real_pow_eq_1_imp()))
  let t160 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_pow(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t156 = @term_syntax.parse_term("(norm : (Cart[Real, 2]) -> Real)")
  let t159 = @tactics.disch_then(fn(x158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s154 = @tactics.mp_tac(x153)
      fn(x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s154(x155)
      }
    })(((x157 : @kernel.Thm) => @equal.ap_term(t156, x157))(x158))
  })
  let t152 = @simp.asm_rewrite_tac(@list.List([]))
  let t149 = @term_syntax.parse_term("(n : Num)")
  let t150 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t151 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t150, t149]), dirichlet_character_root()))
  let t148 = @list.List([@meson.asm_meson_tac(@list.List([dirichlet_character_eq_1(), @complexes.complex_norm_cx(), @calc_int.real_abs_num(), @prime.coprime_0(), @prime.coprime_sym()])), @tactics.all_tac])
  let t147 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t145 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_0(), @prime.coprime_sym()]))
  let t146 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_zero()])), t145)])
  let t165 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t146), t147), t148), t151), t152), t159), t160), @tactics.disch_tac), t162), t163), t164)
  dirichlet_character_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, dirichlet_character(d, c) → norm(c(n)) == (if coprime((d, n)) { real_of_num(1) } else { real_of_num(0) })"), t165))
}

///|
let dirichlet_character_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_NORM")

///|
/// `DIRICHLET_CHARACTER_NORM`
pub fn dirichlet_character_norm() -> @kernel.Thm {
  dirichlet_character_norm_c.get()
}

///|
/// chi_0
fn step_17() -> Unit raise {
  chi_0_c.set(@pair.new_definition(@term_syntax.parse_term("(chi_0 : (Num, Num) -> Cart[Real, 2])((d : Num), (n : Num)) == (if coprime((n, d)) { Cx(real_of_num(1)) } else { Cx(real_of_num(0)) })")))
}

///|
let chi_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("chi_0")

///|
/// `chi_0`
pub fn chi_0() -> @kernel.Thm {
  chi_0_c.get()
}

///|
/// DIRICHLET_CHARACTER_CHI_0
fn step_18() -> Unit raise {
  let t168 = @tactics.conv_tac(@complexes.complex_ring)
  let t166 = @int.number_rule(@term_syntax.parse_term("coprime(((m : Num) * (n : Num), (d : Num))) == (coprime((m, d)) && coprime((n, d)))"))
  let t167 = @simp.rewrite_tac(@list.List([@int.number_rule(@term_syntax.parse_term("coprime(((n : Num) + (d : Num), d)) == coprime((n, d))")), t166]))
  let t169 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([dirichlet_character(), chi_0()])), t167), t168)
  dirichlet_character_chi_0_c.set(@tactics.prove(@term_syntax.parse_term("dirichlet_character((d : Num), chi_0(d))"), t169))
}

///|
let dirichlet_character_chi_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_CHI_0")

///|
/// `DIRICHLET_CHARACTER_CHI_0`
pub fn dirichlet_character_chi_0() -> @kernel.Thm {
  dirichlet_character_chi_0_c.get()
}

///|
/// DIRICHLET_CHARACTER_EQ_PRINCIPAL
fn step_19() -> Unit raise {
  let t171 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_0()]))
  let t170 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), chi_0()]))
  let t172 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t170), t171)
  dirichlet_character_eq_principal_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) → (c == chi_0(d)) == (∀ n : Num, coprime((n, d)) → c(n) == Cx(real_of_num(1)))"), t172))
}

///|
let dirichlet_character_eq_principal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_EQ_PRINCIPAL")

///|
/// `DIRICHLET_CHARACTER_EQ_PRINCIPAL`
pub fn dirichlet_character_eq_principal() -> @kernel.Thm {
  dirichlet_character_eq_principal_c.get()
}

///|
/// DIRICHLET_CHARACTER_NONPRINCIPAL
fn step_20() -> Unit raise {
  let t173 = @meson.meson_tac(@list.List([dirichlet_character_eq_principal(), dirichlet_character_eq_0()]))
  dirichlet_character_nonprincipal_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → (∃ n : Num, coprime((n, d)) && !(c(n) == Cx(real_of_num(0))) && !(c(n) == Cx(real_of_num(1))))"), t173))
}

///|
let dirichlet_character_nonprincipal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_NONPRINCIPAL")

///|
/// `DIRICHLET_CHARACTER_NONPRINCIPAL`
pub fn dirichlet_character_nonprincipal() -> @kernel.Thm {
  dirichlet_character_nonprincipal_c.get()
}

///|
/// DIRICHLET_CHARACTER_0
fn step_21() -> Unit raise {
  let t178 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_1(), dirichlet_character_eq_0(), @prime.coprime_0()]))
  let t177 = @simp.asm_rewrite_tac(@list.List([]))
  let t176 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t175 = @simp.rewrite_tac(@list.List([chi_0(), @class.fun_eq_thm(), @prime.coprime_0()]))
  let t174 = @simp.simp_tac(@list.List([dirichlet_character_chi_0()]))
  let t179 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t174), @tactics.disch_tac), t175), t176), @class.cond_cases_tac), t177), t178)
  dirichlet_character_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : (Num) -> Cart[Real, 2], dirichlet_character(0, c) == (c == chi_0(0))"), t179))
}

///|
let dirichlet_character_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_0")

///|
/// `DIRICHLET_CHARACTER_0`
pub fn dirichlet_character_0() -> @kernel.Thm {
  dirichlet_character_0_c.get()
}

///|
/// DIRICHLET_CHARACTER_1
fn step_22() -> Unit raise {
  let t198 = @tactics.conv_tac(@complexes.complex_ring)
  let t199 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([]))), t198)
  let t197 = @tactics.conv_tac(@complexes.complex_ring)
  let t196 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t192 = @term_syntax.parse_term("0")
  let t195 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x194 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s190 = @tactics.mp_tac(x189)
      fn(x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s190(x191)
      }
    })(((x193 : @kernel.Thm) => @bool.spec(t192, x193))(x194))
  }))
  let t188 = @simp.asm_rewrite_tac(@list.List([@arith.add1()]))
  let t187 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith(), @complexes.complex_ring(@term_syntax.parse_term("((x : Cart[Real, 2]) == x * x) == (x == Cx(real_of_num(0)) || x == Cx(real_of_num(1)))"))]))
  let t183 = @term_syntax.parse_term("1")
  let t184 = @list.List([@term_syntax.parse_term("1"), t183])
  let t200 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.first_x_assum(fn(x186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s181 = @tactics.mp_tac(x180)
      fn(x182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s181(x182)
      }
    })(((x185 : @kernel.Thm) => @bool.specl(t184, x185))(x186))
  })), t187), @tactics.disch_tac), @nums.induct_tac), t188), t195), t196), t197), t199])
  let t201 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([dirichlet_character(), @prime.coprime_1()]))), @tactics.eq_tac), t200)
  dirichlet_character_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : (Num) -> Cart[Real, 2], dirichlet_character(1, c) == (∀ n : Num, c(n) == Cx(real_of_num(1)))"), t201))
}

///|
let dirichlet_character_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_1")

///|
/// `DIRICHLET_CHARACTER_1`
pub fn dirichlet_character_1() -> @kernel.Thm {
  dirichlet_character_1_c.get()
}

///|
/// DIRICHLET_CHARACTER_NONPRINCIPAL_NONTRIVIAL
fn step_23() -> Unit raise {
  let t206 = @tactics.conv_tac(@class.taut)
  let t205 = @simp.asm_rewrite_tac(@list.List([dirichlet_character_1(), chi_0(), @class.fun_eq_thm(), @prime.coprime_1()]))
  let t204 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 1"))
  let t203 = @simp.asm_rewrite_tac(@list.List([dirichlet_character_0(), @class.taut(@term_syntax.parse_term("!((p : Bool) && !p)"))]))
  let t202 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t207 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t202), t203), t204), t205), t206)
  dirichlet_character_nonprincipal_nontrivial_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → !(d == 0) && !(d == 1)"), t207))
}

///|
let dirichlet_character_nonprincipal_nontrivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_NONPRINCIPAL_NONTRIVIAL")

///|
/// `DIRICHLET_CHARACTER_NONPRINCIPAL_NONTRIVIAL`
pub fn dirichlet_character_nonprincipal_nontrivial() -> @kernel.Thm {
  dirichlet_character_nonprincipal_nontrivial_c.get()
}

///|
/// DIRICHLET_CHARACTER_ZEROSUM
fn step_24() -> Unit raise {
  let t244 = @meson.asm_meson_tac(@list.List([dirichlet_character_cong()]))
  let t243 = @simp.simp_tac(@list.List([@vectors.monoidal_vector_add()]))
  let t242 = @tactics.match_mp_tac(@pocklington.iterate_over_coprime())
  let t241 = @simp.simp_tac(@list.List([@vectors.vsum_v1(), @pocklington.phi_finite_lemma()]))
  let t240 = @tactics.first_assum(fn(x237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x237
    let t239 = @bool.conjunct1(th)
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(dirichlet_character_mul())(t239))]))
  })
  let t231 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_0(), @complexes.complex_mul_rzero()]))
  let t232 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_vec_0()])), t231)
  let t230 = @list.List([@meson.asm_meson_tac(@list.List([@prime.coprime_refl()])), @int.asm_arith_tac])
  let t229 = @simp.asm_rewrite_tac(@list.List([@arith.lt_refl()]))
  let t233 = @list.List([@tactics.thenl(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == (d : Num)")), t229), t230), t232])
  let t228 = @simp.asm_rewrite_tac(@list.List([]))
  let t234 = @tactics.thenl(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("coprime(((r : Num), (d : Num)))")), t228), t233)
  let t227 = @simp.asm_rewrite_tac(@list.List([@prime.coprime_0()]))
  let t226 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t235 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == 0")), @list.List([@tactics.all_tac, @int.asm_arith_tac])), t226), t227), t234])
  let t225 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t224 = @simp.simp_tac(@list.List([@sets.subset(), @iterate.in_numseg(), @arith.lt_imp_le(), @sets.in_elim_thm()]))
  let t223 = @tactics.match_mp_tac(@vectors.vsum_superset())
  let t236 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t223), t224), @tactics.conj_tac), t225), t235), @tactics.all_tac])))
  let t222 = @tactics.exists_tac(@term_syntax.parse_term("{(n : Num) | coprime((n, (d : Num))) && n < d}"))
  let t221 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("∀ t : (_) -> Bool, vsum(t, (f : (_) -> Cart[Real, _])) == vsum((s : (_) -> Bool), f) && vsum(t, (g : (_) -> Cart[Real, _])) == vsum(s, g) && vsum(t, f) == vsum(t, g) → vsum(s, f) == vsum(s, g)")))
  let t220 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.vsum_complex_lmul()), @iterate.finite_numseg()]))
  let t219 = @tactics.exists_tac(@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])((m : Num))"))
  let t218 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("∀ x : Cart[Real, 2], x * (c : Cart[Real, 2]) == c && !(x == Cx(real_of_num(1))) → c == Cx(real_of_num(0))")))
  let t217 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(@tactics.strip_assume_tac))
  let t214 = @drule.match_mp(dirichlet_character_nonprincipal())
  let t216 = @tactics.first_assum(fn(x215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s212 = @tactics.mp_tac(x211)
      fn(x213 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s212(x213)
      }
    })(t214(x215))
  })
  let t208 = @drule.match_mp(dirichlet_character_nonprincipal_nontrivial())
  let t210 = @tactics.first_assum(fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t208(x209))
  })
  let t245 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t210), t216), t217), t218), t219), t220), t221), t222), t236), t240), t241), t242), t243), t244)
  dirichlet_character_zerosum_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → vsum(op_dot_dot(1, d), c) == Cx(real_of_num(0))"), t245))
}

///|
let dirichlet_character_zerosum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_ZEROSUM")

///|
/// `DIRICHLET_CHARACTER_ZEROSUM`
pub fn dirichlet_character_zerosum() -> @kernel.Thm {
  dirichlet_character_zerosum_c.get()
}

///|
/// DIRICHLET_CHARACTER_ZEROSUM_MUL
fn step_25() -> Unit raise {
  let t265 = @simp.asm_rewrite_tac(@list.List([]))
  let t264 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num)"))
  let t263 = @tactics.match_mp_tac(dirichlet_character_cong())
  let t262 = @simp.rewrite_tac(@list.List([]))
  let t261 = @tactics.repeat_tac(@tactics.strip_tac)
  let t260 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t257 = @drule.match_mp(dirichlet_character_zerosum())
  let t259 = @tactics.first_assum(fn(x258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s254 = @tactics.subst1_tac(x253)
        fn(x255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s254(x255)
        }
      })(@equal.sym(x256))
    })(t257(x258))
  })
  let t252 = @simp.rewrite_tac(@list.List([@vectors.vsum_offset()]))
  let t251 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t250 = @simp.asm_simp_tac(@list.List([@vectors.vsum_add_split(), @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) + 1")), @complexes.complex_add_lid()]))
  let t249 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t248 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @complexes.complex_vec_0()]))
  let t247 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @vectors.vsum_clauses_numseg()]))
  let t246 = @tactics.repeat_tac(@tactics.gen_tac)
  let t266 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), t246), @tactics.disch_tac), @nums.induct_tac), t247), t248), t249), t250), t251), t252), t259), t260), t261), t262), t263), t264), t265), @int.number_tac)
  dirichlet_character_zerosum_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, dirichlet_character(d, c) && !(c == chi_0(d)) → vsum(op_dot_dot(1, d * n), c) == Cx(real_of_num(0))"), t266))
}

///|
let dirichlet_character_zerosum_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_ZEROSUM_MUL")

///|
/// `DIRICHLET_CHARACTER_ZEROSUM_MUL`
pub fn dirichlet_character_zerosum_mul() -> @kernel.Thm {
  dirichlet_character_zerosum_mul_c.get()
}

///|
/// DIRICHLET_CHARACTER_SUM_MOD
fn step_26() -> Unit raise {
  let t314 = @tactics.conv_tac(@int.number_rule)
  let t313 = @simp.asm_rewrite_tac(@list.List([]))
  let t312 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num)"))
  let t311 = @tactics.match_mp_tac(dirichlet_character_cong())
  let t310 = @simp.rewrite_tac(@list.List([]))
  let t309 = @tactics.repeat_tac(@tactics.strip_tac)
  let t308 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t305 = @drule.match_mp(dirichlet_character_zerosum())
  let t307 = @tactics.first_assum(fn(x306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x301 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s302 = @tactics.subst1_tac(x301)
        fn(x303 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s302(x303)
        }
      })(@equal.sym(x304))
    })(t305(x306))
  })
  let t300 = @simp.rewrite_tac(@list.List([@vectors.vsum_offset()]))
  let t299 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t298 = @simp.asm_simp_tac(@list.List([dirichlet_character_zerosum_mul(), @complexes.complex_add_lid()]))
  let t297 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t296 = @simp.simp_tac(@list.List([@vectors.vsum_add_split(), @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) + 1"))]))
  let t295 = @tactics.disch_then(fn(x286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x286
    @simp.gen_rewrite_tac(fn(x294 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x288 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s289 = @equal.land_conv(x288)
        fn(x290 : @kernel.Term) -> @kernel.Thm raise {
          s289(x290)
        }
      })((fn(x291 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s292 = @equal.once_depth_conv(x291)
        fn(x293 : @kernel.Term) -> @kernel.Thm raise {
          s292(x293)
        }
      })(x294))
    }, @list.List([th]))
  })
  let t285 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x279 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s280 = @tactics.mp_tac(x279)
    fn(x281 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s280(x281)
    }
  }, fn(x282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s283 = @tactics.assume_tac(x282)
    fn(x284 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s283(x284)
    }
  }))
  let t276 = @drule.match_mp(@arith.division())
  let t273 = @term_syntax.parse_term("(n : Num)")
  let t278 = @tactics.first_assum(fn(x277 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s271 = @tactics.mp_tac(x270)
        fn(x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s271(x272)
        }
      })(((x274 : @kernel.Thm) => @bool.spec(t273, x274))(x275))
    })(t276(x277))
  })
  let t267 = @drule.match_mp(dirichlet_character_nonprincipal_nontrivial())
  let t269 = @tactics.first_assum(fn(x268 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t267(x268))
  })
  let t315 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t269), t278), t285), t295), t296), t297), t298), t299), t300), t307), t308), t309), t310), t311), t312), t313), t314)
  dirichlet_character_sum_mod_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → vsum(op_dot_dot(1, (n : Num)), c) == vsum(op_dot_dot(1, MOD(n, d)), c)"), t315))
}

///|
let dirichlet_character_sum_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_SUM_MOD")

///|
/// `DIRICHLET_CHARACTER_SUM_MOD`
pub fn dirichlet_character_sum_mod() -> @kernel.Thm {
  dirichlet_character_sum_mod_c.get()
}

///|
/// FINITE_DIRICHLET_CHARACTERS
fn step_27() -> Unit raise {
  let t333 = @meson.asm_meson_tac(@list.List([dirichlet_character_root(), @prime.coprime_sym(), dirichlet_character_eq_0()]))
  let t332 = @meson.asm_meson_tac(@list.List([@pocklington.cong_mod(), @pocklington.cong_sym()]))
  let t331 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num)"))
  let t334 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(dirichlet_character_cong()), t331), t332), t333])
  let t330 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t329 = @simp.asm_simp_tac(@list.List([@arith.division(), @class.fun_eq_thm()]))
  let t328 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => if n < (d : Num) { (c : (Num) -> Cart[Real, 2])(n) } else { Cx(real_of_num(0)) }"))
  let t327 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm(), @sets.in_insert()]))
  let t326 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])"))
  let t325 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t323 = @simp.asm_simp_tac(@list.List([@pocklington.phi_lowerbound_1_strong(), @arith.le_1()]))
  let t322 = @tactics.match_mp_tac(@transcendentals.finite_complex_roots_unity())
  let t321 = @simp.asm_simp_tac(@list.List([@sets.finite_numseg_lt(), @sets.finite_insert()]))
  let t320 = @tactics.match_mp_tac(@sets.finite_funspace())
  let t324 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_image()), t320), t321), t322), t323), @tactics.all_tac])
  let t319 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((c : (Num) -> Cart[Real, 2]) => (n : Num) => c(MOD(n, (d : Num))), {(c : (Num) -> Cart[Real, 2]) | (∀ m : Num, IN(m, {(m : Num) | m < d}) → IN(c(m), INSERT(Cx(real_of_num(0)), {(z : Cart[Real, 2]) | pow(z, phi(d)) == Cx(real_of_num(1))}))) && (∀ m : Num, !IN(m, {(m : Num) | m < d}) → c(m) == Cx(real_of_num(0)))})"))
  let t318 = @tactics.match_mp_tac(@sets.finite_subset())
  let t316 = @simp.simp_tac(@list.List([@sets.finite_rules()]))
  let t317 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([dirichlet_character_0(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}"))])), t316), @tactics.all_tac])
  let t335 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))), t317), t318), t319), @tactics.conj_tac), t324), t325), t326), @tactics.disch_tac), t327), t328), t329), @tactics.conj_tac), t330), t334)
  finite_dirichlet_characters_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, FINITE({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)})"), t335))
}

///|
let finite_dirichlet_characters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_DIRICHLET_CHARACTERS")

///|
/// `FINITE_DIRICHLET_CHARACTERS`
pub fn finite_dirichlet_characters() -> @kernel.Thm {
  finite_dirichlet_characters_c.get()
}

///|
/// DIRICHLET_CHARACTER_MUL_CNJ
fn step_28() -> Unit raise {
  let t349 = @simp.rewrite_tac(@list.List([@complexes.complex_div_1()]))
  let t348 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl(), @complexes.complex_pow_one()]))
  let t347 = @tactics.first_assum(fn(x345 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x345
    @simp.rewrite_tac(@list.List([@drule.match_mp(dirichlet_character_norm())(th)]))
  })
  let t342 = @simp.gen_rewrite_rule(fn(x341 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x341
  }, @list.List([@equal.gsym(@complexes.complex_norm_nz())]))
  let t344 = @tactics.first_assum(fn(x343 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s339 = @tactics.mp_tac(x338)
      fn(x340 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s339(x340)
      }
    })(t342(x343))
  })
  let t337 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_inv_cnj()]))
  let t336 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("inv((z : Cart[Real, 2])) == (w : Cart[Real, 2]) && !(z == Cx(real_of_num(0))) → w * z == Cx(real_of_num(1)) && z * w == Cx(real_of_num(1))")))
  let t350 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t336), t337), t344), t347), @class.cond_cases_tac), t348), t349)
  dirichlet_character_mul_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, dirichlet_character(d, c) && !(c(n) == Cx(real_of_num(0))) → cnj(c(n)) * c(n) == Cx(real_of_num(1)) && c(n) * cnj(c(n)) == Cx(real_of_num(1))"), t350))
}

///|
let dirichlet_character_mul_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_MUL_CNJ")

///|
/// `DIRICHLET_CHARACTER_MUL_CNJ`
pub fn dirichlet_character_mul_cnj() -> @kernel.Thm {
  dirichlet_character_mul_cnj_c.get()
}

///|
/// DIRICHLET_CHARACTER_CNJ
fn step_29() -> Unit raise {
  let t351 = @simp.simp_tac(@list.List([dirichlet_character(), @complexes.cnj_mul(), @complexes.cnj_eq_cx()]))
  dirichlet_character_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) → dirichlet_character(d, (n : Num) => cnj(c(n)))"), t351))
}

///|
let dirichlet_character_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_CNJ")

///|
/// `DIRICHLET_CHARACTER_CNJ`
pub fn dirichlet_character_cnj() -> @kernel.Thm {
  dirichlet_character_cnj_c.get()
}

///|
/// DIRICHLET_CHARACTER_GROUPMUL
fn step_30() -> Unit raise {
  let t352 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_ac()]))
  let t353 = @tactics.then_tac(@simp.simp_tac(@list.List([dirichlet_character(), @complexes.complex_entire()])), t352)
  dirichlet_character_groupmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c1 : (Num) -> Cart[Real, 2], ∀ c2 : (Num) -> Cart[Real, 2], dirichlet_character(d, c1) && dirichlet_character(d, c2) → dirichlet_character(d, (n : Num) => c1(n) * c2(n))"), t353))
}

///|
let dirichlet_character_groupmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_GROUPMUL")

///|
/// `DIRICHLET_CHARACTER_GROUPMUL`
pub fn dirichlet_character_groupmul() -> @kernel.Thm {
  dirichlet_character_groupmul_c.get()
}

///|
/// DIRICHLET_CHARACTER_GROUPINV
fn step_31() -> Unit raise {
  let t356 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_0(), @complexes.complex_mul_rzero()]))
  let t357 = @list.List([@meson.asm_meson_tac(@list.List([dirichlet_character_mul_cnj(), dirichlet_character_eq_0()])), t356])
  let t355 = @tactics.repeat_tac(@tactics.strip_tac)
  let t354 = @simp.rewrite_tac(@list.List([chi_0(), @class.fun_eq_thm()]))
  let t358 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t354), t355), @class.cond_cases_tac), t357)
  dirichlet_character_groupinv_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) → ((n : Num) => cnj(c(n)) * c(n)) == chi_0(d)"), t358))
}

///|
let dirichlet_character_groupinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_GROUPINV")

///|
/// `DIRICHLET_CHARACTER_GROUPINV`
pub fn dirichlet_character_groupinv() -> @kernel.Thm {
  dirichlet_character_groupinv_c.get()
}

///|
/// DIRICHLET_CHARACTER_SUM_OVER_NUMBERS
fn step_32() -> Unit raise {
  let t382 = @simp.asm_rewrite_tac(@list.List([]))
  let t381 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((x : Num), (d : Num)))"))
  let t380 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t379 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @iterate.in_numseg()]))
  let t378 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul(), @complexes.complex_mul_rid()]))
  let t377 = @simp.simp_tac(@list.List([@pocklington.phi(), @vectors.vsum_const(), @sets.finite_restrict(), @iterate.finite_numseg()]))
  let t375 = @equal.gsym(@complexes.complex_vec_0())
  let t376 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_restrict_set()), @iterate.finite_numseg(), t375]))
  let t374 = @simp.rewrite_tac(@list.List([chi_0()]))
  let t373 = @simp.gen_rewrite_tac(fn(x372 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x366 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s367 = @equal.land_conv(x366)
      fn(x368 : @kernel.Term) -> @kernel.Thm raise {
        s367(x368)
      }
    })((fn(x369 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s370 = @equal.rand_conv(x369)
      fn(x371 : @kernel.Term) -> @kernel.Thm raise {
        s370(x371)
      }
    })(x372))
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t365 = @tactics.pop_assum(fn(x364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t363 = @tactics.first_x_assum(fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s361 = @tactics.subst1_tac(x360)
    fn(x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s361(x362)
    }
  })
  let t359 = @simp.asm_simp_tac(@list.List([dirichlet_character_zerosum()]))
  let t383 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t359), t363), t365), t373), t374), t376), t377), t378), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t379), t380), t381), t382), @int.arith_tac)
  dirichlet_character_sum_over_numbers_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) → vsum(op_dot_dot(1, d), c) == (if c == chi_0(d) { Cx(real_of_num(phi(d))) } else { Cx(real_of_num(0)) })"), t383))
}

///|
let dirichlet_character_sum_over_numbers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_SUM_OVER_NUMBERS")

///|
/// `DIRICHLET_CHARACTER_SUM_OVER_NUMBERS`
pub fn dirichlet_character_sum_over_numbers() -> @kernel.Thm {
  dirichlet_character_sum_over_numbers_c.get()
}

///|
/// DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS_WEAK
fn step_33() -> Unit raise {
  let t419 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_0(), dirichlet_character_mul_cnj()]))
  let t418 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * (b : Cart[Real, 2]) == Cx(real_of_num(1)) → a * (b * (x : Cart[Real, 2])) == a * (b * (y : Cart[Real, 2])) → x == y")))
  let t414 = @term_syntax.parse_term("(m : Num)")
  let t417 = @tactics.first_x_assum(fn(x416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s412 = @tactics.mp_tac(x411)
      fn(x413 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s412(x413)
      }
    })(((x415 : @kernel.Thm) => @bool.spec(t414, x415))(x416))
  })
  let t410 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([dirichlet_character_eq_0()]))])
  let t409 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((m : Num), (d : Num)))"))
  let t408 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t407 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t403 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2]) => (n : Num) => cnj((c' : (Num) -> Cart[Real, 2])(n)) * c(n)")
  let t406 = @tactics.first_x_assum(fn(x405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s401 = @tactics.mp_tac(x400)
      fn(x402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s401(x402)
      }
    })(((x404 : @kernel.Thm) => @equal.ap_term(t403, x404))(x405))
  })
  let t399 = @tactics.repeat_tac(@tactics.strip_tac)
  let t398 = @simp.asm_simp_tac(@list.List([dirichlet_character_groupmul()]))
  let t397 = @simp.rewrite_tac(@list.List([finite_dirichlet_characters(), @sets.in_elim_thm()]))
  let t396 = @tactics.match_mp_tac(@vectors.vsum_injection())
  let t395 = @tactics.repeat_tac(@tactics.strip_tac)
  let t393 = @meson.asm_meson_tac(@list.List([]))
  let t392 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((a : Cart[Real, 2]) * (x : Cart[Real, 2]) == x) == (a == Cx(real_of_num(1)) || x == Cx(real_of_num(0)))"))]))
  let t394 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@trivia.o_def(), finite_dirichlet_characters(), @complexes.vsum_complex_lmul()])), t392), t393)])
  let t391 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c' : (Num) -> Cart[Real, 2], dirichlet_character((d : Num), c') → vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)}, o((c : (Num) -> Cart[Real, 2]) => c((n : Num)), (c : (Num) -> Cart[Real, 2]) => (n : Num) => c'(n) * c(n))) == vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)}, (c : (Num) -> Cart[Real, 2]) => c(n))"), fn(x388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s389 = @tactics.mp_tac(x388)
    fn(x390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s389(x390)
    }
  })
  let t386 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @complexes.complex_vec_0(), dirichlet_character_eq_0()]))
  let t385 = @tactics.match_mp_tac(@vectors.vsum_eq_0())
  let t387 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())]))), t385), t386)])
  let t384 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((n : Num), (d : Num)))"))
  let t420 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t384), t387), t391), t394), t395), t396), t397), t398), t399), t406), t407), @tactics.disch_tac), t408), t409), t410), t417), t418), t419)
  dirichlet_character_sum_over_characters_weak_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ n : Num, vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)}, (x : (Num) -> Cart[Real, 2]) => x(n)) == Cx(real_of_num(0)) || coprime((n, d)) && (∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) → c(n) == Cx(real_of_num(1)))"), t420))
}

///|
let dirichlet_character_sum_over_characters_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS_WEAK")

///|
/// `DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS_WEAK`
pub fn dirichlet_character_sum_over_characters_weak() -> @kernel.Thm {
  dirichlet_character_sum_over_characters_weak_c.get()
}

///|
/// DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS_POS
fn step_34() -> Unit raise {
  let t427 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t426 = @simp.asm_simp_tac(@list.List([finite_dirichlet_characters(), @sets.in_elim_thm(), @complexes.real_cx(), @complexes.re_cx()]))
  let t423 = @tactics.match_mp_tac(@iterate.sum_pos_le())
  let t424 = @tactics.then_tac(@simp.simp_tac(@list.List([finite_dirichlet_characters(), @complexes.re_vsum()])), t423)
  let t425 = @list.List([@tactics.match_mp_tac(@complexes.real_vsum()), t424])
  let t422 = @simp.asm_rewrite_tac(@list.List([@complexes.real_cx(), @complexes.re_cx(), @realax.real_le_refl()]))
  let t421 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t428 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(dirichlet_character_sum_over_characters_weak()), t421), @tactics.strip_tac), t422), @tactics.conj_tac), t425), t426), t427)
  dirichlet_character_sum_over_characters_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ n : Num, real(vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)}, (c : (Num) -> Cart[Real, 2]) => c(n))) && real_of_num(0) <= Re(vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)}, (c : (Num) -> Cart[Real, 2]) => c(n)))"), t428))
}

///|
let dirichlet_character_sum_over_characters_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS_POS")

///|
/// `DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS_POS`
pub fn dirichlet_character_sum_over_characters_pos() -> @kernel.Thm {
  dirichlet_character_sum_over_characters_pos_c.get()
}

///|
/// CHARACTER_EXTEND_FROM_SUBGROUP
fn step_35() -> Unit raise {
  let t818 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_add(), @complexes.complex_mul_ac()]))
  let t817 = @simp.asm_simp_tac(@list.List([]))
  let t815 = @simp.rewrite_tac(@list.List([@arith.exp_add(), @arith.mult_ac()]))
  let t816 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.asm_simp_tac(@list.List([@arith.mod_mult_lmod(), @arith.mod_mult_rmod(), @arith.le_1()]))), t815), @tactics.all_tac])
  let t814 = @tactics.exists_tac(@term_syntax.parse_term("(g : (Num) -> Cart[Real, 2])(MOD(MOD((x : Num) * (y : Num), (d : Num)) * EXP((a : Num), (k : Num) + (j : Num)), d))"))
  let t813 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t812 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x809 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s810 = @tactics.subst_all_tac(x809)
    fn(x811 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s810(x811)
    }
  }))
  let t803 = @term_syntax.parse_term("(j : Num)")
  let t804 = @term_syntax.parse_term("(y : Num)")
  let t805 = @term_syntax.parse_term("(k : Num)")
  let t806 = @term_syntax.parse_term("(x : Num)")
  let t807 = @term_syntax.parse_term("(s : Num)")
  let t808 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(r : Num)"), t807, t806, t805, t804, t803]))
  let t802 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t819 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_univ(), @theorems.left_and_exists_thm()])), t802), t808), @tactics.strip_tac), t812), t813), t814), @tactics.conj_tac), t816), t817), t818)
  let t801 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t800 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_eq_0()]))
  let t799 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("pow((z : Cart[Real, 2]), (m : Num)) == (f : (Num) -> Cart[Real, 2])((am : Num))"))))
  let t798 = @simp.asm_rewrite_tac(@list.List([]))
  let t794 = @term_syntax.parse_term("(am : Num)")
  let t797 = @tactics.disch_then(fn(x796 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x791 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s792 = @tactics.mp_tac(x791)
      fn(x793 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s792(x793)
      }
    })(((x795 : @kernel.Thm) => @bool.spec(t794, x795))(x796))
  })
  let t790 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Num, IN(x, (h : (Num) -> Bool)) → !((f : (Num) -> Cart[Real, 2])(x) == Cx(real_of_num(0)))"))
  let t789 = @simp.asm_simp_tac(@list.List([@complexes.complex_entire(), @complexes.complex_pow_eq_0()]))
  let t788 = @tactics.repeat_tac(@tactics.gen_tac)
  let t820 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_univ()])), t788), @tactics.strip_tac), t789), t790), t797), t798), t799), t800), t801)
  let t787 = @simp.asm_simp_tac(@list.List([@pocklington.fermat_little()]))
  let t786 = @tactics.match_mp_tac(@pocklington.cong_exp())
  let t785 = @tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(k : Num)"), @arith.exp_one())))
  let t784 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())]))
  let t782 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @pocklington.phi_lowerbound_1_strong()]))
  let t783 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) + (a : Num) * k == (a + 1) * k"))])), @tactics.ap_thm_tac), @tactics.ap_term_tac), t782), @tactics.all_tac])
  let t781 = @tactics.subgoal_then(@term_syntax.parse_term("(k : Num) + (phi((d : Num)) - 1) * k == phi(d) * k"), fn(x778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s779 = @tactics.subst1_tac(x778)
    fn(x780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s779(x780)
    }
  })
  let t777 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_add())]))
  let t776 = @simp.asm_rewrite_tac(@list.List([]))
  let t775 = @tactics.match_mp_tac(@pocklington.cong_mult())
  let t774 = @simp.gen_rewrite_tac(fn(x771 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s772 = @equal.land_conv(x771)
    fn(x773 : @kernel.Term) -> @kernel.Thm raise {
      s772(x773)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("1 == 1 * 1"))]))
  let t770 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) * (a : Num) * ((z : Num) * (ak : Num)) == x * z * (a * ak)"))]))
  let t768 = @simp.asm_simp_tac(@list.List([@pocklington.cong_mod(), @arith.le_1()]))
  let t769 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@pocklington.cong_mult()), t768), @tactics.all_tac])
  let t767 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num) * EXP((a : Num), (k : Num)) * ((z : Num) * EXP(a, (phi((d : Num)) - 1) * k))"))
  let t766 = @tactics.match_mp_tac(@pocklington.cong_trans())
  let t765 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t764 = @simp.rewrite_tac(@list.List([@theorems.left_exists_and_thm()]))
  let t763 = @tactics.exists_tac(@term_syntax.parse_term("MOD((z : Num) * EXP((a : Num), (phi((d : Num)) - 1) * (k : Num)), d)"))
  let t762 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Num)"))(@tactics.strip_assume_tac))
  let t761 = @simp.asm_rewrite_tac(@list.List([]))
  let t757 = @term_syntax.parse_term("(x : Num)")
  let t760 = @tactics.disch_then(fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x754 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s755 = @tactics.mp_tac(x754)
      fn(x756 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s755(x756)
      }
    })(((x758 : @kernel.Thm) => @bool.spec(t757, x758))(x759))
  })
  let t753 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Num, IN(x, (h : (Num) -> Bool)) → (∃ y : Num, IN(y, h) && op_eq_eq(x * y, 1, mod((d : Num))))"))
  let t752 = @tactics.first_x_assum(fn(x749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s750 = @tactics.subst_all_tac(x749)
    fn(x751 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s750(x751)
    }
  })
  let t746 = @term_syntax.parse_term("(k : Num)")
  let t747 = @term_syntax.parse_term("(x : Num)")
  let t748 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Num)"), t747, t746]))
  let t821 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_univ(), @theorems.left_imp_exists_thm()])), t748), @tactics.strip_tac), t752), t753), t760), t761), t762), t763), t764), @tactics.conj_tac), t765), t766), t767), @tactics.conj_tac), t769), t770), t774), t775), t776), t777), t781), t783), t784), t785), t786), t787)
  let t745 = @simp.rewrite_tac(@list.List([@arith.exp_add(), @arith.mult_ac()]))
  let t744 = @simp.asm_simp_tac(@list.List([@arith.mod_mult_lmod(), @arith.mod_mult_rmod(), @arith.le_1()]))
  let t742 = @term_syntax.parse_term("(j : Num) + (k : Num)")
  let t743 = @tactics.map_every(fn(x739 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s740 = @tactics.exists_tac(x739)
    fn(x741 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s740(x741)
    }
  }, @list.List([@term_syntax.parse_term("MOD((x : Num) * (y : Num), (d : Num))"), t742]))
  let t738 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x735 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s736 = @tactics.subst_all_tac(x735)
    fn(x737 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s736(x737)
    }
  }))
  let t729 = @term_syntax.parse_term("(j : Num)")
  let t730 = @term_syntax.parse_term("(y : Num)")
  let t731 = @term_syntax.parse_term("(k : Num)")
  let t732 = @term_syntax.parse_term("(x : Num)")
  let t733 = @term_syntax.parse_term("(s : Num)")
  let t734 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(r : Num)"), t733, t732, t731, t730, t729]))
  let t728 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t822 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_univ(), @theorems.left_and_exists_thm()])), t728), t734), @tactics.strip_tac), t738), t743), t744), t745)
  let t727 = @simp.asm_simp_tac(@list.List([@arith.exp(), @arith.mult_clauses(), @arith.mod_lt()]))
  let t725 = @term_syntax.parse_term("0")
  let t726 = @tactics.map_every(fn(x722 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s723 = @tactics.exists_tac(x722)
    fn(x724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s723(x724)
    }
  }, @list.List([@term_syntax.parse_term("1"), t725]))
  let t823 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_univ()])), t726), t727)
  let t721 = @tactics.conv_tac(@complexes.complex_ring)
  let t720 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(1)))"))
  let t719 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @arith.mod_lt()]))
  let t714 = @term_syntax.parse_term("1")
  let t715 = @list.List([@term_syntax.parse_term("1"), t714])
  let t718 = @tactics.disch_then(fn(x717 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s712 = @tactics.mp_tac(x711)
      fn(x713 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s712(x713)
      }
    })(((x716 : @kernel.Thm) => @bool.specl(t715, x716))(x717))
  })
  let t710 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, IN(x, (h : (Num) -> Bool)) && IN(y, h) → (f : (Num) -> Cart[Real, 2])(MOD(x * y, (d : Num))) == f(x) * f(y)"))
  let t709 = @simp.asm_simp_tac(@list.List([@arith.exp_1(), @arith.mult_clauses(), @arith.mod_lt(), @complexes.complex_pow_1()]))
  let t705 = @term_syntax.parse_term("1")
  let t706 = @list.List([@term_syntax.parse_term("1"), t705])
  let t824 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("*", fn(x708 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s703 = @tactics.mp_tac(x702)
      fn(x704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s703(x704)
      }
    })(((x707 : @kernel.Thm) => @bool.specl(t706, x707))(x708))
  }), t709), t710), t718), t719), t720), t721)
  let t701 = @simp.asm_simp_tac(@list.List([@arith.mod_lt(), @arith.exp(), @arith.mult_clauses(), @complexes.complex_pow(), @complexes.complex_mul_rid()]))
  let t696 = @term_syntax.parse_term("0")
  let t697 = @list.List([@term_syntax.parse_term("(x : Num)"), t696])
  let t700 = @tactics.remove_then("*", fn(x699 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x693 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s694 = @tactics.mp_tac(x693)
      fn(x695 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s694(x695)
      }
    })(((x698 : @kernel.Thm) => @bool.specl(t697, x698))(x699))
  })
  let t825 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)")), @tactics.disch_tac), t700), t701)
  let t692 = @meson.asm_meson_tac(@list.List([@prime.coprime_exp(), @prime.coprime_sym()]))
  let t691 = @simp.asm_simp_tac(@list.List([@arith.division(), @arith.le_1(), @int.coprime_lmod(), @prime.coprime_lmul()]))
  let t690 = @tactics.first_x_assum(fn(x687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s688 = @tactics.subst_all_tac(x687)
    fn(x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s688(x689)
    }
  })
  let t684 = @term_syntax.parse_term("(k : Num)")
  let t685 = @term_syntax.parse_term("(x : Num)")
  let t686 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Num)"), t685, t684]))
  let t826 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()])), t686), @tactics.strip_tac), t690), t691), t692)
  let t683 = @simp.asm_simp_tac(@list.List([@arith.exp_1(), @arith.mult_clauses(), @arith.exp(), @arith.mod_lt()]))
  let t680 = @term_syntax.parse_term("0")
  let t681 = @tactics.map_every(fn(x677 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s678 = @tactics.exists_tac(x677)
    fn(x679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s678(x679)
    }
  }, @list.List([@term_syntax.parse_term("(x : Num)"), t680]))
  let t676 = @term_syntax.parse_term("1")
  let t682 = @list.List([@tactics.map_every(fn(x673 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s674 = @tactics.exists_tac(x673)
    fn(x675 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s674(x675)
    }
  }, @list.List([@term_syntax.parse_term("1"), t676])), t681])
  let t672 = @simp.asm_rewrite_tac(@list.List([]))
  let t671 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t827 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_insert(), @sets.in_univ()])), t671), @tactics.strip_tac), t672), t682), t683), t826, t825, t824, t823, t822, t821, t820, t819])
  let t670 = @tactics.repeat_tac(@tactics.conj_tac)
  let t669 = @simp.rewrite_tac(@list.List([]))
  let t668 = @tactics.exists_tac(@term_syntax.parse_term("{MOD((x : Num) * EXP((a : Num), (k : Num)), (d : Num)) | IN(x, (h : (Num) -> Bool)) && IN(k, UNIV)}"))
  let t667 = @tactics.disch_then(fn(x664 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s665 = ((x663 : @kernel.Thm) => @tactics.label_tac("*", x663))(x664)
    fn(x666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s665(x666)
    }
  })
  let t662 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (Num) -> Cart[Real, 2])"))
  let t661 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t659 = @simp.asm_simp_tac(@list.List([@arith.mod_mult_rmod(), @kernel.assume_rule(@term_syntax.parse_term("1 <= (d : Num)")), @arith.le_1()]))
  let t658 = @list.List([@tactics.all_tac, @simp.asm_simp_tac(@list.List([]))])
  let t657 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])(MOD((am : Num) * MOD(EXP(am, (s : Num)), (d : Num)), d))"))
  let t656 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t654 = @tactics.conv_tac(@complexes.complex_ring)
  let t653 = @simp.asm_rewrite_tac(@list.List([]))
  let t649 = @term_syntax.parse_term("1")
  let t652 = @tactics.disch_then(fn(x651 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x646 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s647 = @tactics.mp_tac(x646)
      fn(x648 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s647(x648)
      }
    })(((x650 : @kernel.Thm) => @bool.spec(t649, x650))(x651))
  })
  let t645 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Num, IN(x, (h : (Num) -> Bool)) → !((f : (Num) -> Cart[Real, 2])(x) == Cx(real_of_num(0)))"))
  let t644 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @arith.mod_lt()]))
  let t639 = @term_syntax.parse_term("1")
  let t640 = @list.List([@term_syntax.parse_term("1"), t639])
  let t643 = @tactics.disch_then(fn(x642 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x636 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s637 = @tactics.mp_tac(x636)
      fn(x638 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s637(x638)
      }
    })(((x641 : @kernel.Thm) => @bool.specl(t640, x641))(x642))
  })
  let t655 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, IN(x, (h : (Num) -> Bool)) && IN(y, h) → (f : (Num) -> Cart[Real, 2])(MOD(x * y, (d : Num))) == f(x) * f(y)")), t643), t644), t645), t652), t653), t654), @tactics.all_tac])
  let t635 = @simp.asm_simp_tac(@list.List([@arith.exp(), @arith.mod_lt(), @complexes.complex_pow(), @complexes.complex_mul_rid()]))
  let t633 = @term_syntax.parse_term("(s : Num)")
  let t634 = @tactics.spec_tac(@term_syntax.parse_term("(r : Num)"), t633)
  let t632 = @simp.asm_simp_tac(@list.List([]))
  let t630 = @tactics.conv_tac(@int.number_rule)
  let t629 = @simp.rewrite_tac(@list.List([@arith.exp_add(), @arith.exp_exp()]))
  let t628 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((x : Num) * EXP((a : Num), (k : Num)), (y : Num) * EXP(a, k + (m : Num) * (r : Num)), mod((d : Num)))"))
  let t627 = @list.List([@meson.asm_meson_tac(@list.List([@prime.coprime_exp(), @prime.coprime_sym()])), @tactics.all_tac])
  let t626 = @tactics.exists_tac(@term_syntax.parse_term("EXP((a : Num), (k : Num))"))
  let t625 = @tactics.match_mp_tac(@pocklington.cong_mult_lcancel())
  let t623 = @meson.asm_meson_tac(@list.List([@pocklington.cong_sym()]))
  let t622 = @tactics.match_mp_tac(@pocklington.cong_exp())
  let t621 = @simp.asm_simp_tac(@list.List([@pocklington.cong_mult(), @int.cong_lmod(), @pocklington.cong_refl(), @arith.le_1()]))
  let t624 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@pocklington.cong_mult()), t621), t622), t623), @tactics.all_tac])
  let t620 = @tactics.exists_tac(@term_syntax.parse_term("(y : Num) * EXP(EXP((a : Num), (m : Num)), (r : Num))"))
  let t619 = @tactics.match_mp_tac(@pocklington.cong_trans())
  let t618 = @simp.asm_simp_tac(@list.List([@pocklington.cong_mod_lt()]))
  let t631 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.conv_tac(@equal.sym_conv)), t618), t619), t620), @tactics.conj_tac), t624), t625), t626), @tactics.conj_tac), t627), t628), t629), t630), @tactics.all_tac])
  let t617 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])(MOD((y : Num) * MOD(EXP((am : Num), (r : Num)), (d : Num)), d))"))
  let t616 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t615 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_pow_pow())]))
  let t614 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Num)"))(fn(x611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s612 = @tactics.subst_all_tac(x611)
    fn(x613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s612(x613)
    }
  }))
  let t610 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t608 = @tactics.conv_tac(@int.number_rule)
  let t607 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((y : Num) * (z : Num), 1, mod((d : Num)))"))
  let t606 = @simp.rewrite_tac(@list.List([@arith.exp_add()]))
  let t605 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((x : Num) * EXP((a : Num), (k : Num)), (y : Num) * EXP(a, k + (i : Num)), mod((d : Num)))"))
  let t604 = @list.List([@meson.asm_meson_tac(@list.List([@prime.coprime_exp(), @prime.coprime_sym()])), @tactics.all_tac])
  let t603 = @simp.rewrite_tac(@list.List([@prime.coprime_lmul()]))
  let t602 = @tactics.exists_tac(@term_syntax.parse_term("(y : Num) * EXP((a : Num), (k : Num))"))
  let t601 = @tactics.match_mp_tac(@pocklington.cong_mult_lcancel())
  let t600 = @simp.asm_simp_tac(@list.List([@int.cong_rmod(), @arith.le_1()]))
  let t599 = @tactics.exists_tac(@term_syntax.parse_term("MOD((z : Num) * (x : Num), (d : Num))"))
  let t598 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Num)"))(@tactics.strip_assume_tac))
  let t597 = @simp.asm_rewrite_tac(@list.List([]))
  let t593 = @term_syntax.parse_term("(y : Num)")
  let t596 = @tactics.disch_then(fn(x595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s591 = @tactics.mp_tac(x590)
      fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s591(x592)
      }
    })(((x594 : @kernel.Thm) => @bool.spec(t593, x594))(x595))
  })
  let t589 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Num, IN(x, (h : (Num) -> Bool)) → (∃ y : Num, IN(y, h) && op_eq_eq(x * y, 1, mod((d : Num))))"))
  let t609 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t589), t596), t597), t598), t599), t600), t601), t602), t603), @tactics.conj_tac), t604), t605), t606), t607), t608), @tactics.all_tac])
  let t588 = @tactics.subgoal_then(@term_syntax.parse_term("divides((m : Num), (i : Num))"), fn(x585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s586 = @tactics.mp_tac(x585)
    fn(x587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s586(x587)
    }
  })
  let t584 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_add(), @complexes.complex_mul_assoc()]))
  let t583 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t582 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(i : Num)"))(fn(x579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s580 = @tactics.subst_all_tac(x579)
    fn(x581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s580(x581)
    }
  }))
  let t578 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t577 = @tactics.undisch_tac(@term_syntax.parse_term("(k : Num) <= (j : Num)"))
  let t576 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.cong_v1()), @arith.le_1()]))
  let t574 = @term_syntax.parse_term("(y : Num)")
  let t575 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t574]))
  let t572 = @term_syntax.parse_term("(j : Num)")
  let t573 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : Num)"), t572]))
  let t571 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t570 = @tactics.match_mp_tac(@arith.wlog_le())
  let t569 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ k : _, ∀ y : _, ∀ j : _, (P : (_, _, _, _) -> Bool)(x, k, y, j)) == (∀ k : _, ∀ j : _, ∀ x : _, ∀ y : _, P(x, k, y, j))"))]))
  let t568 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ y : _, ∃ z : _, ∀ x : _, ∀ k : _, (p : (_) -> Bool)(x) && (f : (_, _) -> _)(x, k) == y → z == (g : (_, _) -> _)(x, k)) == (∀ x : _, ∀ k : _, ∀ x' : _, ∀ k' : _, p(x) && p(x') && f(x, k) == f(x', k') → g(x, k) == g(x', k'))"))]))
  let t567 = @simp.rewrite_tac(@list.List([@equal.gsym(@class.skolem_thm())]))
  let t660 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ g : (_) -> _, ∀ x : _, ∀ a : _, (p : (_) -> Bool)(x) → g((f : (_, _) -> _)(a, x)) == (h : (_, _) -> _)(a, x)) == (∃ g : (_) -> _, ∀ y : _, ∀ x : _, ∀ a : _, p(x) && f(a, x) == y → g(y) == h(a, x))"))])), t567), t568), t569), t570), @tactics.conj_tac), t571), t573), @tactics.disch_tac), t575), t576), @tactics.strip_tac), t577), t578), t582), t583), t584), @tactics.ap_thm_tac), @tactics.ap_term_tac), t588), t609), t610), t614), t615), t616), t617), @tactics.conj_tac), t631), t632), @tactics.ap_term_tac), t634), @nums.induct_tac), t635), t655), t656), t657), @tactics.conj_tac), t658), @tactics.ap_term_tac), t659), @tactics.all_tac])
  let t566 = @tactics.subgoal_then(@term_syntax.parse_term("∃ g : (Num) -> Cart[Real, 2], ∀ x : Num, ∀ k : Num, IN(x, (h : (Num) -> Bool)) → g(MOD(x * EXP((a : Num), k), (d : Num))) == (f : (Num) -> Cart[Real, 2])(x) * pow((z : Cart[Real, 2]), k)"), fn(x563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s564 = @tactics.mp_tac(x563)
    fn(x565 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s564(x565)
    }
  })
  let t562 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t561 = @simp.asm_simp_tac(@list.List([]))
  let t559 = @term_syntax.parse_term("(m : Num)")
  let t560 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])((am : Num))"), t559]), exists_complex_root_nontrivial()))
  let t557 = @simp.asm_simp_tac(@list.List([@int.cong_v1(), @arith.le_1()]))
  let t555 = @simp.asm_simp_tac(@list.List([@pocklington.cong_mult(), @pocklington.cong_refl(), @int.cong_rmod(), @arith.le_1()]))
  let t554 = @tactics.exists_tac(@term_syntax.parse_term("MOD(EXP((a : Num), (m : Num) * DIV((r : Num), m)), (d : Num)) * (y : Num)"))
  let t556 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@pocklington.cong_trans()), t554), t555), @tactics.all_tac])
  let t551 = @drule.match_mp(@int.number_rule(@term_syntax.parse_term("op_eq_eq((y : Num) * ((e : Num) * (a : Num)), (z : Num), mod((n : Num))) → op_eq_eq(e * y, 1, mod(n)) → op_eq_eq(a, z, mod(n))")))
  let t553 = @tactics.disch_then(fn(x552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s549 = @tactics.mp_tac(x548)
      fn(x550 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s549(x550)
      }
    })(t551(x552))
  })
  let t545 = @drule.match_mp(@int.number_rule(@term_syntax.parse_term("∀ a : Num, op_eq_eq((x : Num), (y : Num), mod((n : Num))) → op_eq_eq(a * x, a * y, mod(n))")))
  let t542 = @term_syntax.parse_term("(y : Num)")
  let t547 = @tactics.disch_then(fn(x546 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s540 = @tactics.mp_tac(x539)
        fn(x541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s540(x541)
        }
      })(((x543 : @kernel.Thm) => @bool.spec(t542, x543))(x544))
    })(t545(x546))
  })
  let t538 = @simp.rewrite_tac(@list.List([@arith.exp_add()]))
  let t537 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t536 = @tactics.disch_then(fn(x527 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x527
    @simp.gen_rewrite_tac(fn(x535 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x529 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s530 = @equal.land_conv(x529)
        fn(x531 : @kernel.Term) -> @kernel.Thm raise {
          s530(x531)
        }
      })((fn(x532 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s533 = @equal.once_depth_conv(x532)
        fn(x534 : @kernel.Term) -> @kernel.Thm raise {
          s533(x534)
        }
      })(x535))
    }, @list.List([th_1]))
  })
  let t526 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t524 = @term_syntax.parse_term("(m : Num)")
  let t525 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(r : Num)"), t524]), @arith.division()))
  let t523 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), (r : Num)), (x : Num), mod((d : Num)))"))
  let t522 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))(@tactics.strip_assume_tac))
  let t520 = @simp.asm_simp_tac(@list.List([@int.cong_lmod(), @pocklington.cong_exp(), @arith.le_1()]))
  let t519 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.cong_v1()), @arith.le_1()]))
  let t518 = @tactics.subgoal_then(@term_syntax.parse_term("MOD(EXP(EXP((a : Num), (m : Num)), DIV((r : Num), m)), (d : Num)) == MOD(EXP((am : Num), DIV(r, m)), d)"), fn(x516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x516
    @simp.asm_simp_tac(@list.List([th]))
  })
  let t521 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@arith.exp_exp())])), t518), t519), t520), @tactics.all_tac])
  let t512 = @term_syntax.parse_term("MOD(EXP((a : Num), (m : Num) * DIV((r : Num), m)), (d : Num))")
  let t515 = @tactics.disch_then(fn(x514 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x509 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s510 = @tactics.mp_tac(x509)
      fn(x511 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s510(x511)
      }
    })(((x513 : @kernel.Thm) => @bool.spec(t512, x513))(x514))
  })
  let t508 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Num, IN(x, (h : (Num) -> Bool)) → (∃ y : Num, IN(y, h) && op_eq_eq(x * y, 1, mod((d : Num))))"))
  let t507 = @simp.asm_simp_tac(@list.List([@int.cong_rmod(), @arith.le_1(), @pocklington.cong_refl()]))
  let t506 = @tactics.exists_tac(@term_syntax.parse_term("MOD(EXP((a : Num), MOD((r : Num), (m : Num))), (d : Num))"))
  let t505 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t504 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) == 0) == !(0 < n)"))]))
  let t503 = @simp.asm_simp_tac(@list.List([@int.divides_mod(), @arith.le_1()]))
  let t558 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t503), t504), t505), t506), t507), t508), t515), @tactics.ants_tac), t521), t522), t523), t525), t526), t536), t537), t538), t547), t553), @tactics.ants_tac), t556), t557), @tactics.all_tac])
  let t502 = @tactics.subgoal_then(@term_syntax.parse_term("∀ r : Num, ∀ x : Num, IN(x, (h : (Num) -> Bool)) && op_eq_eq(EXP((a : Num), r), x, mod((d : Num))) → divides((m : Num), r)"), fn(x499 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s500 = @tactics.assume_tac(x499)
    fn(x501 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s500(x501)
    }
  })
  let t498 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool) && (c : Bool)) == (b && c → !a)"))]))
  let t497 = @simp.asm_simp_tac(@list.List([@arith.division(), @arith.le_1(), @class.not_exists_thm()]))
  let t493 = @term_syntax.parse_term("MOD((r : Num), (m : Num))")
  let t490 = @term_syntax.parse_term("(r : Num)")
  let t496 = @tactics.disch_then(fn(x495 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s488 = @tactics.mp_tac(x487)
        fn(x489 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s488(x489)
        }
      })(((x491 : @kernel.Thm) => @bool.gen(t490, x491))(x492))
    })(((x494 : @kernel.Thm) => @bool.spec(t493, x494))(x495))
  })
  let t485 = @meson.asm_meson_tac(@list.List([]))
  let t484 = @simp.asm_simp_tac(@list.List([@arith.exp_1(), @equal.gsym(@pocklington.cong_mod_lt()), @arith.mod_lt()]))
  let t483 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq(EXP((a : Num), 1), (am : Num), mod((d : Num)))"))
  let t486 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x480 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s481 = @tactics.subst_all_tac(x480)
    fn(x482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s481(x482)
    }
  }), t483), t484), t485), @tactics.all_tac])
  let t477 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("0 < (m : Num) → m == 1 || 2 <= m")))
  let t479 = @tactics.first_assum(fn(x478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t477(x478))
  })
  let t476 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(am : Num)"))(@tactics.strip_assume_tac), fn(x473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s474 = @tactics.mp_tac(x473)
    fn(x475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s474(x475)
    }
  }))
  let t472 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s470 = @tactics.mp_tac(x469)
    fn(x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s470(x471)
    }
  }))
  let t468 = @simp.gen_rewrite_tac(fn(x465 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s466 = @equal.land_conv(x465)
    fn(x467 : @kernel.Term) -> @kernel.Thm raise {
      s466(x467)
    }
  }, @list.List([@arith.num_wop()]))
  let t463 = @meson.asm_meson_tac(@list.List([@arith.mod_mult_rmod(), @kernel.assume_rule(@term_syntax.parse_term("1 <= (d : Num)")), @arith.le_1()]))
  let t462 = @tactics.subgoal_then(@term_syntax.parse_term("IN(MOD((x : Num) * MOD(EXP(x, (s : Num)), (d : Num)), d), (h : (Num) -> Bool))"), fn(x459 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s460 = @tactics.mp_tac(x459)
    fn(x461 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s460(x461)
    }
  })
  let t458 = @simp.asm_simp_tac(@list.List([@arith.exp(), @arith.mod_lt()]))
  let t464 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), @tactics.gen_tac), @tactics.disch_tac), @nums.induct_tac), t458), t462), t463), @tactics.all_tac])
  let t457 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Num, ∀ s : Num, IN(x, (h : (Num) -> Bool)) → IN(MOD(EXP(x, s), (d : Num)), h)"), fn(x454 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s455 = @tactics.assume_tac(x454)
    fn(x456 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s455(x456)
    }
  })
  let t452 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t451 = @tactics.match_mp_tac(@pocklington.fermat_little())
  let t450 = @list.List([@meson.asm_meson_tac(@list.List([@pocklington.phi_lowerbound_1_strong(), @arith.le_1()])), @tactics.all_tac])
  let t449 = @simp.asm_rewrite_tac(@list.List([]))
  let t448 = @term_syntax.parse_term("1")
  let t453 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x445 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s446 = @tactics.exists_tac(x445)
    fn(x447 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s446(x447)
    }
  }, @list.List([@term_syntax.parse_term("phi((d : Num))"), t448])), t449), @tactics.conj_tac), t450), t451), t452), @tactics.all_tac])
  let t444 = @tactics.subgoal_then(@term_syntax.parse_term("∃ m : Num, ∃ x : Num, 0 < m && IN(x, (h : (Num) -> Bool)) && op_eq_eq(EXP((a : Num), m), x, mod((d : Num)))"), fn(x441 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s442 = @tactics.mp_tac(x441)
    fn(x443 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s442(x443)
    }
  })
  let t438 = @drule.match_mp(@arith.lt_imp_le())
  let t440 = @tactics.first_assum(fn(x439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s436 = @tactics.assume_tac(x435)
      fn(x437 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s436(x437)
      }
    })(t438(x439))
  })
  let t434 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t433 = @tactics.subgoal_then(@term_syntax.parse_term("1 < (d : Num)"), fn(x430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s431 = @tactics.assume_tac(x430)
    fn(x432 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s431(x432)
    }
  })
  let t429 = @tactics.repeat_tac(@tactics.strip_tac)
  let t828 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_diff(), @sets.subset()])), t429), t433), t434), t440), t444), t453), t457), t464), t468), t472), t476), t479), t486), t496), t497), t498), @tactics.disch_tac), t502), t558), t560), t561), t562), t566), t660), t661), t662), t667), t668), t669), t670), t827)
  character_extend_from_subgroup_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ h : (Num) -> Bool, ∀ a : Num, ∀ d : Num, SUBSET(h, {(x : Num) | x < d && coprime((x, d))}) && IN(1, h) && (∀ x : Num, ∀ y : Num, IN(x, h) && IN(y, h) → IN(MOD(x * y, d), h)) && (∀ x : Num, IN(x, h) → (∃ y : Num, IN(y, h) && op_eq_eq(x * y, 1, mod(d)))) && (∀ x : Num, IN(x, h) → !(f(x) == Cx(real_of_num(0)))) && (∀ x : Num, ∀ y : Num, IN(x, h) && IN(y, h) → f(MOD(x * y, d)) == f(x) * f(y)) && IN(a, DIFF({(x : Num) | x < d && coprime((x, d))}, h)) → (∃ f' : (Num) -> Cart[Real, 2], ∃ h' : (Num) -> Bool, SUBSET(INSERT(a, h), h') && SUBSET(h', {(x : Num) | x < d && coprime((x, d))}) && (∀ x : Num, IN(x, h) → f'(x) == f(x)) && !(f'(a) == Cx(real_of_num(1))) && IN(1, h') && (∀ x : Num, ∀ y : Num, IN(x, h') && IN(y, h') → IN(MOD(x * y, d), h')) && (∀ x : Num, IN(x, h') → (∃ y : Num, IN(y, h') && op_eq_eq(x * y, 1, mod(d)))) && (∀ x : Num, IN(x, h') → !(f'(x) == Cx(real_of_num(0)))) && (∀ x : Num, ∀ y : Num, IN(x, h') && IN(y, h') → f'(MOD(x * y, d)) == f'(x) * f'(y)))"), t828))
}

///|
let character_extend_from_subgroup_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CHARACTER_EXTEND_FROM_SUBGROUP")

///|
/// `CHARACTER_EXTEND_FROM_SUBGROUP`
pub fn character_extend_from_subgroup() -> @kernel.Thm {
  character_extend_from_subgroup_c.get()
}

///|
/// DIRICHLET_CHARACTER_DISCRIMINATOR
fn step_36() -> Unit raise {
  let t975 = @simp.asm_simp_tac(@list.List([@arith.division(), @int.coprime_lmod(), @arith.le_1()]))
  let t976 = @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t975)
  let t977 = @list.List([@tactics.then_tac(@tactics.ap_term_tac, @simp.asm_simp_tac(@list.List([@arith.mod_mult_mod2(), @arith.le_1()]))), t976])
  let t974 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])(MOD(MOD((x : Num), (d : Num)) * MOD((y : Num), d), d))"))
  let t973 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t972 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_mul_rzero()]))
  let t970 = @term_syntax.parse_term("coprime(((y : Num), (d : Num)))")
  let t971 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("coprime(((x : Num), (d : Num)))"), t970]))
  let t969 = @simp.rewrite_tac(@list.List([@prime.coprime_lmul()]))
  let t978 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)")), t969), t971), t972), t973), t974), @tactics.conj_tac), t977)
  let t968 = @simp.asm_simp_tac(@list.List([@int.coprime_lmod(), @arith.division(), @arith.le_1()]))
  let t967 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t979 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))), t967), t968)
  let t966 = @tactics.conv_tac(@int.number_rule)
  let t965 = @simp.asm_simp_tac(@list.List([@equal.gsym(@int.cong_v1()), @arith.le_1()]))
  let t964 = @simp.asm_rewrite_tac(@list.List([]))
  let t980 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.number_rule(@term_syntax.parse_term("coprime(((x : Num) + (d : Num), d)) == coprime((x, d))"))])), @class.cond_cases_tac), t964), @tactics.ap_term_tac), t965), t966), t979, t978])
  let t963 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t962 = @tactics.repeat_tac(@tactics.conj_tac)
  let t961 = @simp.rewrite_tac(@list.List([dirichlet_character()]))
  let t960 = @simp.asm_rewrite_tac(@list.List([]))
  let t959 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => if coprime((n, (d : Num))) { (f : (Num) -> Cart[Real, 2])(MOD(n, d)) } else { Cx(real_of_num(0)) }"))
  let t958 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t957 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t956 = @tactics.first_x_assum(fn(x953 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s954 = @tactics.subst_all_tac(x953)
    fn(x955 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s954(x955)
    }
  })
  let t951 = @sets.set_tac(@list.List([]))
  let t950 = @simp.simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_numseg_lt()]))
  let t949 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Num) | x < (d : Num)}"))
  let t948 = @tactics.match_mp_tac(@sets.finite_subset())
  let t947 = @simp.asm_rewrite_tac(@list.List([@sets.psubset()]))
  let t946 = @tactics.match_mp_tac(@sets.card_psubset())
  let t945 = @simp.rewrite_tac(@list.List([@arith.not_le()]))
  let t944 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(b : Bool) → (a : Bool) && b → (c : Bool)")))
  let t943 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t952 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x937 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s938 = @tactics.assume_tac(x937)
    fn(x939 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s938(x939)
    }
  }, fn(x940 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s941 = @tactics.mp_tac(x940)
    fn(x942 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s941(x942)
    }
  })), t943), t944), t945), t946), t947), t948), t949), t950), t951)])
  let t936 = @class.asm_cases_tac(@term_syntax.parse_term("(h : (Num) -> Bool) == {(x : Num) | x < (d : Num) && coprime((x, d))}"))
  let t934 = @term_syntax.parse_term("(h : (Num) -> Bool)")
  let t935 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t934]))
  let t933 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t932 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t928 = @term_syntax.parse_term("CARD({(x : Num) | x < (d : Num) && coprime((x, d))})")
  let t931 = @tactics.disch_then(fn(x930 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s926 = @tactics.mp_tac(x925)
      fn(x927 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s926(x927)
      }
    })(((x929 : @kernel.Thm) => @bool.spec(t928, x929))(x930))
  })
  let t921 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t920 = @simp.simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_numseg_lt()]))
  let t919 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Num) | IN(x, {(x : Num) | x < (d : Num)}) && coprime((x, d))}"))
  let t918 = @tactics.match_mp_tac(@sets.finite_subset())
  let t917 = @simp.asm_rewrite_tac(@list.List([]))
  let t922 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.card_subset()), t917), t918), t919), t920), t921)
  let t916 = @tactics.undisch_tac(@term_syntax.parse_term("(m : Num) - 1 <= CARD((h : (Num) -> Bool))"))
  let t923 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.card_clauses()])), t916), @int.arith_tac), t922])
  let t914 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t913 = @simp.simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_numseg_lt()]))
  let t912 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Num) | IN(x, {(x : Num) | x < (d : Num)}) && coprime((x, d))}"))
  let t915 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t912), t913), t914), @tactics.all_tac])
  let t911 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((h : (Num) -> Bool))"), fn(x908 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s909 = @tactics.assume_tac(x908)
    fn(x910 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s909(x910)
    }
  })
  let t907 = @tactics.exists_tac(@term_syntax.parse_term("CARD(INSERT((a : Num), (h : (Num) -> Bool)))"))
  let t906 = @tactics.match_mp_tac(@arith.le_trans())
  let t905 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])))
  let t904 = @simp.asm_rewrite_tac(@list.List([]))
  let t903 = @tactics.x_gen_tac(@term_syntax.parse_term("(hh : (Num) -> Bool)"))
  let t902 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t901 = @tactics.x_gen_tac(@term_syntax.parse_term("(ff : (Num) -> Cart[Real, 2])"))
  let t900 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t899 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @sets.in_elim_thm()]))
  let t895 = @term_syntax.parse_term("(d : Num)")
  let t896 = @term_syntax.parse_term("(a : Num)")
  let t897 = @term_syntax.parse_term("(h : (Num) -> Bool)")
  let t898 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t897, t896, t895]), character_extend_from_subgroup()))
  let t894 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : Num)"))(@tactics.strip_assume_tac))
  let t892 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t893 = @list.List([@meson.asm_meson_tac(@list.List([])), t892])
  let t889 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → !(s == t) → (∃ a : _, IN(a, t) && !IN(a, s))")))
  let t891 = @tactics.disch_then(fn(x890 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s887 = @tactics.mp_tac(x886)
      fn(x888 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s887(x888)
      }
    })(t889(x890))
  })
  let t885 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("SUBSET((h : (Num) -> Bool), {(x : Num) | x < (d : Num) && coprime((x, d))})")))
  let t883 = @simp.asm_rewrite_tac(@list.List([]))
  let t882 = @term_syntax.parse_term("(h : (Num) -> Bool)")
  let t884 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x879 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s880 = @tactics.exists_tac(x879)
    fn(x881 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s880(x881)
    }
  }, @list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t882])), t883), @tactics.all_tac])
  let t878 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) <= CARD((h : (Num) -> Bool))"))
  let t876 = @term_syntax.parse_term("(h : (Num) -> Bool)")
  let t877 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Num) -> Cart[Real, 2])"), t876]))
  let t875 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (n : Num) → x - 1 <= n")), @theorems.left_imp_exists_thm()]))
  let t870 = @kernel.assume_rule(@term_syntax.parse_term("!((m : Num) == 0)"))
  let t871 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((m : Num) == 0) → m - 1 < m")))(t870)
  let t874 = @tactics.first_assum(fn(x873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x867 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s868 = @tactics.mp_tac(x867)
      fn(x869 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s868(x869)
      }
    })((fn(x872 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x872)(t871)
    })(x873))
  })
  let t865 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t864 = @simp.asm_rewrite_tac(@list.List([@arith.le_0()]))
  let t863 = @term_syntax.parse_term("(h0 : (Num) -> Bool)")
  let t866 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x860 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s861 = @tactics.exists_tac(x860)
    fn(x862 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s861(x862)
    }
  }, @list.List([@term_syntax.parse_term("(f0 : (Num) -> Cart[Real, 2])"), t863])), t864), t865), @tactics.all_tac])
  let t859 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t858 = @tactics.disch_then(fn(x855 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s856 = ((x854 : @kernel.Thm) => @tactics.label_tac("*", x854))(x855)
    fn(x857 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s856(x857)
    }
  })
  let t853 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t924 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.num_wf()), t853), t858), @tactics.disch_tac), t859), t866), t874), t875), t877), @tactics.strip_tac), t878), t884), t885), t891), @tactics.ants_tac), t893), t894), t898), t899), t900), t901), t902), t903), @tactics.strip_tac), t904), t905), t906), t907), t911), t915), @tactics.conj_tac), t923), @tactics.all_tac])
  let t852 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, m <= CARD({(x : Num) | x < (d : Num) && coprime((x, d))}) → (∃ f : (Num) -> Cart[Real, 2], ∃ h : (Num) -> Bool, SUBSET(h, {(x : Num) | x < d && coprime((x, d))}) && IN(1, h) && IN(MOD((n : Num), d), h) && (∀ x : Num, ∀ y : Num, IN(x, h) && IN(y, h) → IN(MOD(x * y, d), h)) && (∀ x : Num, IN(x, h) → (∃ y : Num, IN(y, h) && op_eq_eq(x * y, 1, mod(d)))) && !(f(MOD(n, d)) == Cx(real_of_num(1))) && (∀ x : Num, IN(x, h) → !(f(x) == Cx(real_of_num(0)))) && (∀ x : Num, ∀ y : Num, IN(x, h) && IN(y, h) → f(MOD(x * y, d)) == f(x) * f(y)) && m <= CARD(h))"), fn(x849 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s850 = @tactics.mp_tac(x849)
    fn(x851 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s850(x851)
    }
  })
  let t847 = @term_syntax.parse_term("(h0 : (Num) -> Bool)")
  let t848 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f0 : (Num) -> Cart[Real, 2])"), t847]))
  let t846 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t844 = @meson.asm_meson_tac(@list.List([@prime.coprime_1(), @prime.coprime_sym(), @pocklington.cong_refl()]))
  let t845 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.subset(), @arith.mult_clauses(), @arith.mod_lt(), @arith.le_1(), @sets.in_sing(), @sets.in_elim_thm(), @arith.division(), @int.coprime_lmod(), @pocklington.cong_mod_lt(), @complexes.complex_mul_lid(), @complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith()])), t844), @tactics.all_tac])
  let t843 = @simp.asm_simp_tac(@list.List([@sets.in_sing(), @sets.in_elim_thm(), @sets.in_diff()]))
  let t839 = @term_syntax.parse_term("(d : Num)")
  let t840 = @term_syntax.parse_term("MOD((n : Num), (d : Num))")
  let t841 = @term_syntax.parse_term("{1}")
  let t842 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => Cx(real_of_num(1))"), t841, t840, t839]), character_extend_from_subgroup()))
  let t837 = @tactics.conv_tac(@complexes.complex_ring)
  let t836 = @simp.asm_rewrite_tac(@list.List([dirichlet_character_chi_0(), chi_0()]))
  let t838 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("chi_0((d : Num))")), t836), t837)])
  let t835 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((n : Num), (d : Num)))"))
  let t832 = @drule.match_mp(@arith.lt_imp_le())
  let t834 = @tactics.first_assum(fn(x833 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x829 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s830 = @tactics.assume_tac(x829)
      fn(x831 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s830(x831)
      }
    })(t832(x833))
  })
  let t981 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t834), t835), t838), t842), t843), @tactics.ants_tac), t845), t846), t848), @tactics.strip_tac), t852), t924), t931), t932), t933), t935), t936), t952), t956), t957), t958), @tactics.strip_tac), t959), t960), t961), t962), t963), t980)
  dirichlet_character_discriminator_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ n : Num, 1 < d && !op_eq_eq(n, 1, mod(d)) → (∃ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c(n) == Cx(real_of_num(1))))"), t981))
}

///|
let dirichlet_character_discriminator_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_DISCRIMINATOR")

///|
/// `DIRICHLET_CHARACTER_DISCRIMINATOR`
pub fn dirichlet_character_discriminator() -> @kernel.Thm {
  dirichlet_character_discriminator_c.get()
}

///|
/// DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS_INEXPLICIT
fn step_37() -> Unit raise {
  let t1000 = @meson.asm_meson_tac(@list.List([dirichlet_character_discriminator(), @int.arith_rule(@term_syntax.parse_term("!((d : Num) == 0) && !(d == 1) → 1 < d"))]))
  let t999 = @term_syntax.parse_term("(n : Num)")
  let t1001 = @tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t999]), dirichlet_character_sum_over_characters_weak())), t1000)
  let t996 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul(), @complexes.complex_mul_rid()]))
  let t997 = @tactics.then_tac(@simp.simp_tac(@list.List([finite_dirichlet_characters(), @vectors.vsum_const()])), t996)
  let t995 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_1(), dirichlet_character_cong()]))
  let t994 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t998 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_eq()), t994), t995), t997])
  let t993 = @tactics.exists_tac(@term_syntax.parse_term("vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character((d : Num), c)}, (c : (Num) -> Cart[Real, 2]) => Cx(real_of_num(1)))"))
  let t1002 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t993), @tactics.conj_tac), t998), t1001])
  let t991 = @simp.rewrite_tac(@list.List([@vectors.vector_add_rid(), @calc_num.arith()]))
  let t990 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.card_clauses(), @sets.finite_rules(), @sets.not_in_empty()]))
  let t989 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}"))]))
  let t988 = @simp.rewrite_tac(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))
  let t992 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@pocklington.cong_mod_1(), dirichlet_character_1()])), t988), t989), t990), t991), @tactics.all_tac])
  let t987 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 1"))
  let t985 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t984 = @simp.rewrite_tac(@list.List([chi_0(), @prime.coprime_0(), @vectors.vector_add_rid()]))
  let t983 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.card_clauses(), @sets.finite_rules(), @sets.not_in_empty()]))
  let t986 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@pocklington.cong_mod_0(), dirichlet_character_0(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}"))])), t983), t984), t985), @tactics.all_tac])
  let t982 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t1003 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t982), t986), t987), t992), @class.cond_cases_tac), t1002)
  dirichlet_character_sum_over_characters_inexplicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ n : Num, vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)}, (c : (Num) -> Cart[Real, 2]) => c(n)) == (if op_eq_eq(n, 1, mod(d)) { Cx(real_of_num(CARD({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)}))) } else { Cx(real_of_num(0)) })"), t1003))
}

///|
let dirichlet_character_sum_over_characters_inexplicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS_INEXPLICIT")

///|
/// `DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS_INEXPLICIT`
pub fn dirichlet_character_sum_over_characters_inexplicit() -> @kernel.Thm {
  dirichlet_character_sum_over_characters_inexplicit_c.get()
}

///|
/// DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS
fn step_38() -> Unit raise {
  let t1028 = @simp.asm_rewrite_tac(@list.List([@arith.lt_le()]))
  let t1027 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num)"))
  let t1029 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.match_mp_tac(@pocklington.cong_imp_eq())), t1027), t1028)
  let t1026 = @simp.asm_rewrite_tac(@list.List([@int.divides_one()]))
  let t1030 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@int.number_rule(@term_syntax.parse_term("op_eq_eq((d : Num), 1, mod(d)) == divides(d, 1)"))])), t1026), t1029])
  let t1025 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == (d : Num)"))
  let t1024 = @simp.asm_simp_tac(@list.List([@pocklington.cong_mod_1(), @arith.le_antisym()]))
  let t1023 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 1"))
  let t1022 = @simp.asm_simp_tac(@list.List([@arith.le_refl(), @pocklington.cong_refl()]))
  let t1021 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1020 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_sing(), @sets.in_elim_thm(), @iterate.in_numseg()]))
  let t1019 = @tactics.subgoal_then(@term_syntax.parse_term("{(j : Num) | IN(j, op_dot_dot(1, (d : Num))) && op_eq_eq(j, 1, mod(d))} == {1}"), fn(x1017 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1017
    @simp.simp_tac(@list.List([th, @vectors.vsum_sing()]))
  })
  let t1016 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_restrict_set()), @iterate.finite_numseg()]))
  let t1015 = @tactics.disch_then(fn(x1012 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1013 = @tactics.subst1_tac(x1012)
    fn(x1014 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1013(x1014)
    }
  })
  let t1011 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), dirichlet_character_chi_0()]))
  let t1010 = @simp.rewrite_tac(@list.List([@vectors.vsum_delta(), @equal.gsym(@complexes.complex_vec_0())]))
  let t1009 = @simp.simp_tac(@list.List([dirichlet_character_sum_over_characters_inexplicit(), dirichlet_character_sum_over_numbers(), @iterate.finite_numseg(), finite_dirichlet_characters(), @class.eta_ax()]))
  let t1006 = @term_syntax.parse_term("op_dot_dot(1, (d : Num))")
  let t1007 = @term_syntax.parse_term("{(c : (Num) -> Cart[Real, 2]) | dirichlet_character((d : Num), c)}")
  let t1008 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2]) => (n : Num) => c(n)"), t1007, t1006]), @vectors.vsum_swap()))
  let t1005 = @simp.asm_rewrite_tac(@list.List([]))
  let t1004 = @simp.rewrite_tac(@list.List([dirichlet_character_sum_over_characters_inexplicit()]))
  let t1031 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1004), @class.cond_cases_tac), t1005), t1008), t1009), t1010), t1011), t1015), t1016), t1019), t1020), t1021), @tactics.eq_tac), t1022), t1023), t1024), t1025), t1030)
  dirichlet_character_sum_over_characters_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ n : Num, 1 <= d → vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)}, (c : (Num) -> Cart[Real, 2]) => c(n)) == (if op_eq_eq(n, 1, mod(d)) { Cx(real_of_num(phi(d))) } else { Cx(real_of_num(0)) })"), t1031))
}

///|
let dirichlet_character_sum_over_characters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS")

///|
/// `DIRICHLET_CHARACTER_SUM_OVER_CHARACTERS`
pub fn dirichlet_character_sum_over_characters() -> @kernel.Thm {
  dirichlet_character_sum_over_characters_c.get()
}

///|
/// Lfunction_DEF
fn step_39() -> Unit raise {
  lfunction_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Lfunction : ((Num) -> Cart[Real, 2]) -> Cart[Real, 2])((c : (Num) -> Cart[Real, 2])) == infsum(from(1), (n : Num) => c(n) / Cx(real_of_num(n)))")))
}

///|
let lfunction_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Lfunction_DEF")

///|
/// `Lfunction_DEF`
pub fn lfunction_def() -> @kernel.Thm {
  lfunction_def_c.get()
}

///|
/// BOUNDED_LFUNCTION_PARTIAL_SUMS
fn step_40() -> Unit raise {
  let t1043 = @meson.asm_meson_tac(@list.List([@arith.lt_imp_le(), @arith.division(), dirichlet_character_nonprincipal_nontrivial()]))
  let t1042 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @arith.le_0()]))
  let t1041 = @tactics.exists_tac(@term_syntax.parse_term("MOD((n : Num), (d : Num))"))
  let t1040 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @sets.in_image()]))
  let t1039 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1038 = @simp.rewrite_tac(@list.List([@sets.simple_image(), @sets.subset(), @sets.forall_in_image()]))
  let t1037 = @simp.simp_tac(@list.List([@topology.finite_imp_bounded(), @sets.finite_image(), @iterate.finite_numseg()]))
  let t1036 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((n : Num) => vsum(op_dot_dot(1, n), (c : (Num) -> Cart[Real, 2])), op_dot_dot(0, (d : Num)))"))
  let t1035 = @tactics.match_mp_tac(@topology.bounded_subset())
  let t1034 = @tactics.first_assum(fn(x1032 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1032
    @simp.once_rewrite_tac(@list.List([@drule.match_mp(dirichlet_character_sum_mod())(th)]))
  })
  let t1044 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1034), t1035), t1036), t1037), t1038), t1039), t1040), t1041), t1042), t1043)
  bounded_lfunction_partial_sums_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → bounded({vsum(op_dot_dot(1, (n : Num)), c) | IN(n, UNIV)})"), t1044))
}

///|
let bounded_lfunction_partial_sums_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_LFUNCTION_PARTIAL_SUMS")

///|
/// `BOUNDED_LFUNCTION_PARTIAL_SUMS`
pub fn bounded_lfunction_partial_sums() -> @kernel.Thm {
  bounded_lfunction_partial_sums_c.get()
}

///|
/// LFUNCTION
fn step_41() -> Unit raise {
  let t1053 = @simp.simp_tac(@list.List([@real.real_le_inv2(), @realax.real_of_num_le(), @real.real_of_num_lt(), @arith.le_1(), @arith.le_add()]))
  let t1052 = @simp.rewrite_tac(@list.List([@transcendentals.lim_inv_n(), @equal.gsym(@complexes.cx_inv()), @complexes.real_cx(), @complexes.re_cx()]))
  let t1051 = @tactics.first_assum(fn(x1049 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1049
    @simp.rewrite_tac(@list.List([@drule.match_mp(bounded_lfunction_partial_sums())(th)]))
  })
  let t1048 = @tactics.repeat_tac(@tactics.exists_tac(@term_syntax.parse_term("1")))
  let t1047 = @tactics.match_mp_tac(@canal.series_dirichlet_complex())
  let t1046 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t1045 = @simp.simp_tac(@list.List([lfunction_def(), @topology.sums_infsum()]))
  let t1054 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1045), t1046), t1047), t1048), t1051), t1052), t1053)
  lfunction_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → sums((n : Num) => c(n) / Cx(real_of_num(n)), Lfunction(c), from(1))"), t1054))
}

///|
let lfunction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LFUNCTION")

///|
/// `LFUNCTION`
pub fn lfunction() -> @kernel.Thm {
  lfunction_c.get()
}

///|
/// CNJ_CHI_0
fn step_42() -> Unit raise {
  let t1056 = @simp.asm_rewrite_tac(@list.List([@complexes.cnj_cx()]))
  let t1055 = @simp.rewrite_tac(@list.List([chi_0()]))
  let t1057 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1055), @class.cond_cases_tac), t1056)
  cnj_chi_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ n : Num, cnj(chi_0(d, n)) == chi_0(d, n)"), t1057))
}

///|
let cnj_chi_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_CHI_0")

///|
/// `CNJ_CHI_0`
pub fn cnj_chi_0() -> @kernel.Thm {
  cnj_chi_0_c.get()
}

///|
/// LFUNCTION_CNJ
fn step_43() -> Unit raise {
  let t1063 = @meson.asm_meson_tac(@list.List([lfunction()]))
  let t1062 = @simp.rewrite_tac(@list.List([@canal.sums_cnj(), @complexes.cnj_cx(), @equal.gsym(lfunction_def())]))
  let t1061 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cnj_div())]))
  let t1060 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.cnj_cx())]))
  let t1059 = @tactics.match_mp_tac(@topology.infsum_unique())
  let t1058 = @simp.rewrite_tac(@list.List([lfunction_def()]))
  let t1064 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1058), t1059), t1060), t1061), t1062), t1063)
  lfunction_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → Lfunction((n : Num) => cnj(c(n))) == cnj(Lfunction(c))"), t1064))
}

///|
let lfunction_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LFUNCTION_CNJ")

///|
/// `LFUNCTION_CNJ`
pub fn lfunction_cnj() -> @kernel.Thm {
  lfunction_cnj_c.get()
}

///|
/// LFUNCTION_PARTIAL_SUM
fn step_44() -> Unit raise {
  let t1115 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (k : Num) + 1")), @realax.real_of_num_add()]))
  let t1116 = @tactics.then_tac(@tactics.match_mp_tac(@metric.always_eventually()), t1115)
  let t1114 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1113 = @simp.asm_simp_tac(@list.List([@vectors.vsum_add_split(), @int.arith_rule(@term_syntax.parse_term("1 <= (k : Num) → 1 <= k + 1"))]))
  let t1112 = @simp.simp_tac(@list.List([@arith.le_exists(), @theorems.left_imp_exists_thm()]))
  let t1109 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(k : Num) + 1 <= (m : Num) → k <= m")))
  let t1111 = @tactics.first_assum(fn(x1110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1107 = @tactics.mp_tac(x1106)
      fn(x1108 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1107(x1108)
      }
    })(t1109(x1110))
  })
  let t1105 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1104 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) + 1"))
  let t1103 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1102 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t1101 = @simp.rewrite_tac(@list.List([]))
  let t1100 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform()))
  let t1097 = @drule.match_mp(@topology.lim_sub())
  let t1099 = @tactics.disch_then(fn(x1098 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1094 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1095 = @tactics.mp_tac(x1094)
      fn(x1096 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1095(x1096)
      }
    })(t1097(x1098))
  })
  let t1093 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.imp_conj_alt()), @topology.sums(), @misc.from_inter_numseg()]))
  let t1091 = @term_syntax.parse_term("vsum(op_dot_dot(1, (k : Num)), (n : Num) => (c : (Num) -> Cart[Real, 2])(n) / Cx(real_of_num(n)))")
  let t1092 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("sequentially"), t1091]), @topology.lim_const()))
  let t1089 = @drule.match_mp(lfunction())
  let t1117 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1090 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1086 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1087 = @tactics.mp_tac(x1086)
      fn(x1088 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1087(x1088)
      }
    })(t1089(x1090))
  }), t1092), t1093), t1099), t1100), t1101), t1102), t1103), t1104), t1105), @tactics.disch_tac), t1111), t1112), t1113), t1114), @vectors.vector_arith_tac), t1116])
  let t1085 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t1084 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => vsum(op_dot_dot((k : Num) + 1, n), (n : Num) => (c : (Num) -> Cart[Real, 2])(n) / Cx(real_of_num(n)))"))
  let t1083 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_norm_ubound()))
  let t1082 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1081 = @simp.asm_rewrite_tac(@list.List([]))
  let t1080 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : Real)"))
  let t1079 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1077 = @equal.gsym(@realax.real_div())
  let t1078 = @simp.rewrite_tac(@list.List([@complexes.cx_inv(), @equal.gsym(@complexes.complex_div()), t1077]))
  let t1076 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @real.real_abs_inv(), @calc_int.real_abs_num()]))
  let t1075 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t1074 = @simp.simp_tac(@list.List([@real.real_le_inv2(), @realax.real_of_num_le(), @real.real_of_num_lt(), @arith.le_1(), @arith.le_add()]))
  let t1073 = @simp.rewrite_tac(@list.List([@transcendentals.lim_inv_n(), @equal.gsym(@complexes.cx_inv()), @complexes.real_cx(), @complexes.re_cx()]))
  let t1072 = @tactics.first_assum(fn(x1070 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1070
    @simp.rewrite_tac(@list.List([@drule.match_mp(bounded_lfunction_partial_sums())(th)]))
  })
  let t1069 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t1065 = @term_syntax.parse_term("1")
  let t1066 = @term_syntax.parse_term("1")
  let t1067 = @term_syntax.parse_term("(n : Num) => inv(Cx(real_of_num(n)))")
  let t1068 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])"), t1067, t1066, t1065]), @canal.series_dirichlet_complex_explicit()))
  let t1118 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1068), t1069), t1072), t1073), t1074), t1075), t1076), t1078), t1079), t1080), @tactics.strip_tac), t1081), t1082), @tactics.disch_tac), t1083), t1084), t1085), @tactics.conj_tac), t1117)
  lfunction_partial_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → (∃ B : Real, real_of_num(0) < B && (∀ n : Num, 1 <= n → norm(Lfunction(c) - vsum(op_dot_dot(1, n), (n : Num) => c(n) / Cx(real_of_num(n)))) <= B / (real_of_num(n) + real_of_num(1))))"), t1118))
}

///|
let lfunction_partial_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LFUNCTION_PARTIAL_SUM")

///|
/// `LFUNCTION_PARTIAL_SUM`
pub fn lfunction_partial_sum() -> @kernel.Thm {
  lfunction_partial_sum_c.get()
}

///|
/// LFUNCTION_PARTIAL_SUM_STRONG
fn step_45() -> Unit raise {
  let t1138 = @simp.asm_simp_tac(@list.List([@real.real_le_div2_eq(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))]))
  let t1137 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t1136 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t1133 = @term_syntax.parse_term("(n : Num)")
  let t1139 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1131 = @tactics.mp_tac(x1130)
      fn(x1132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1131(x1132)
      }
    })(((x1134 : @kernel.Thm) => @bool.spec(t1133, x1134))(x1135))
  }), t1136), t1137), t1138), @calc_rat.real_arith_tac)
  let t1140 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vsum_clauses_numseg(), @vectors.vector_sub_rzero(), @calc_num.arith()])), @calc_rat.real_arith_tac), t1139])
  let t1129 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1128 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1127 = @simp.asm_simp_tac(@list.List([@real.real_lt_max()]))
  let t1126 = @tactics.exists_tac(@term_syntax.parse_term("max((B : Real), norm(Lfunction((c : (Num) -> Cart[Real, 2]))))"))
  let t1125 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t1122 = @drule.match_mp(lfunction_partial_sum())
  let t1124 = @tactics.first_assum(fn(x1123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1120 = @tactics.mp_tac(x1119)
      fn(x1121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1120(x1121)
      }
    })(t1122(x1123))
  })
  let t1141 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1124), t1125), t1126), t1127), t1128), t1129), t1140)
  lfunction_partial_sum_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → (∃ B : Real, real_of_num(0) < B && (∀ n : Num, norm(Lfunction(c) - vsum(op_dot_dot(1, n), (n : Num) => c(n) / Cx(real_of_num(n)))) <= B / (real_of_num(n) + real_of_num(1))))"), t1141))
}

///|
let lfunction_partial_sum_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LFUNCTION_PARTIAL_SUM_STRONG")

///|
/// `LFUNCTION_PARTIAL_SUM_STRONG`
pub fn lfunction_partial_sum_strong() -> @kernel.Thm {
  lfunction_partial_sum_strong_c.get()
}

///|
/// BOUNDED_LFUNCTION_DIRICHLET_MANGOLDT_LEMMA
fn step_46() -> Unit raise {
  let t1213 = @term_syntax.parse_term("(n : Num)")
  let t1214 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t1213]), @arith.division()))
  let t1212 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_mul(), @realax.real_of_num_le()]))
  let t1211 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1210 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_lt_div(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1209 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (x : Num)"), fn(x1206 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1207 = @tactics.assume_tac(x1206)
    fn(x1208 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1207(x1208)
    }
  })
  let t1205 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1204 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t1203 = @simp.gen_rewrite_tac(fn(x1202 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1196 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1197 = @equal.rand_conv(x1196)
      fn(x1198 : @kernel.Term) -> @kernel.Thm raise {
        s1197(x1198)
      }
    })((fn(x1199 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1200 = @equal.rand_conv(x1199)
      fn(x1201 : @kernel.Term) -> @kernel.Thm raise {
        s1200(x1201)
      }
    })(x1202))
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t1195 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq()]))
  let t1194 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t1193 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t1192 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real) / (real_of_num(DIV((x : Num), (n : Num))) + real_of_num(1))"))
  let t1191 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1190 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1189 = @simp.rewrite_tac(@list.List([@mangoldt.mangoldt_pos_le()]))
  let t1188 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1187 = @simp.rewrite_tac(@list.List([@realax.real_div(), @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) * ((b : Real) * (c : Real)) <= (d : Real)) == (a * c * b <= d)"))]))
  let t1186 = @simp.asm_simp_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @realarith.real_mul_rid(), @realax.real_le_mul(), @real.real_le_div(), @realarith.real_pos(), @realarith.real_lt_imp_le(), @mangoldt.mangoldt_pos_le()]))
  let t1185 = @tactics.first_assum(fn(x1183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1183
    @simp.rewrite_tac(@list.List([@drule.match_mp(dirichlet_character_norm())(th_1)]))
  })
  let t1182 = @simp.asm_rewrite_tac(@list.List([]))
  let t1181 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1180 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t1177 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) → (B : Real) / x * (real_of_num(18) * x) == real_of_num(18) * B")), @realax.real_of_num_eq(), @realax.real_le_refl()]))
  let t1176 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@class.eta_ax()]))(@mangoldt.psi_bound())]))
  let t1175 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realarith.real_pos(), @realarith.real_lt_imp_le()]))
  let t1178 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t1175), t1176), t1177])
  let t1174 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real) / real_of_num((x : Num)) * (real_of_num(18) * real_of_num(x))"))
  let t1173 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1179 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_lmul()])), t1173), t1174), @tactics.conj_tac), t1178)])
  let t1172 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (x : Num)), (n : Num) => (B : Real) / real_of_num(x) * mangoldt(n))"))
  let t1171 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1170 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses_numseg(), @calc_num.arith(), @realax.real_le_mul(), @realarith.real_lt_imp_le(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t1169 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 0"))
  let t1168 = @simp.rewrite_tac(@list.List([@realax.real_abs(), @mangoldt.mangoldt_pos_le()]))
  let t1167 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t1166 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t1165 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t1164 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @complexes.complex_norm_mul()]))
  let t1163 = @tactics.match_mp_tac(@vectors.vsum_norm_triangle())
  let t1162 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t1161 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t1160 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(18) * (B : Real)"))
  let t1159 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t1158 = @simp.asm_rewrite_tac(@list.List([]))
  let t1156 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t1157 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t1156]), lfunction_partial_sum_strong()))
  let t1155 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_rdistrib())]))
  let t1154 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_sub()), @iterate.finite_numseg()]))
  let t1153 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.vsum_complex_lmul()), @iterate.finite_numseg()]))
  let t1152 = @simp.simp_tac(@list.List([@complexes.vsum_complex_rmul(), @iterate.finite_numseg()]))
  let t1151 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(ck : Cart[Real, 2]) * (cn : Cart[Real, 2]) * ((cm : Cart[Real, 2]) * ((k : Cart[Real, 2]) * (n : Cart[Real, 2]))) == ck * k * (cn * (cm * n))"))]))
  let t1150 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul()), @complexes.complex_inv_mul(), @complexes.cx_mul(), @complexes.cx_inv()]))
  let t1149 = @tactics.first_assum(fn(x1147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1147
    @simp.rewrite_tac(@list.List([@drule.match_mp(dirichlet_character_mul())(th)]))
  })
  let t1146 = @simp.rewrite_tac(@list.List([vsum_vsum_divisors()]))
  let t1143 = @equal.gsym(@complexes.vsum_complex_rmul())
  let t1144 = @equal.gsym(@complexes.vsum_complex_lmul())
  let t1145 = @simp.simp_tac(@list.List([@mangoldt.log_mangoldt_sum(), @realax.real_div(), @complexes.cx_mul(), @equal.gsym(@complexes.vsum_cx()), @prime.finite_divisors(), @arith.le_1(), t1144, t1143]))
  let t1142 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1215 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.bounded_pos(), @sets.simple_image(), @sets.forall_in_image(), @sets.in_univ()])), t1142), t1145), t1146), t1149), t1150), t1151), t1152), t1153), t1154), t1155), t1157), t1158), t1159), t1160), t1161), t1162), t1163), t1164), t1165), t1166), t1167), t1168), t1169), t1170), t1171), t1172), @tactics.conj_tac), t1179), t1180), t1181), @tactics.strip_tac), t1182), t1185), @class.cond_cases_tac), t1186), t1187), t1188), t1189), t1190), t1191), t1192), t1193), t1194), t1195), t1203), t1204), t1205), t1209), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1210), t1211), t1212), t1214), @int.asm_arith_tac)
  bounded_lfunction_dirichlet_mangoldt_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → bounded({Lfunction(c) * vsum(op_dot_dot(1, (x : Num)), (n : Num) => c(n) * Cx(mangoldt(n) / real_of_num(n))) - vsum(op_dot_dot(1, x), (n : Num) => c(n) * Cx(log(real_of_num(n)) / real_of_num(n))) | IN(x, UNIV)})"), t1215))
}

///|
let bounded_lfunction_dirichlet_mangoldt_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_LFUNCTION_DIRICHLET_MANGOLDT_LEMMA")

///|
/// `BOUNDED_LFUNCTION_DIRICHLET_MANGOLDT_LEMMA`
pub fn bounded_lfunction_dirichlet_mangoldt_lemma() -> @kernel.Thm {
  bounded_lfunction_dirichlet_mangoldt_lemma_c.get()
}

///|
/// SUMMABLE_CHARACTER_LOG_OVER_N
fn step_47() -> Unit raise {
  let t1229 = @simp.asm_simp_tac(@list.List([@transcendentals.cx_log(), @complexes.cx_div(), @arith.le_1(), @real.real_of_num_lt()]))
  let t1228 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1227 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1226 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually()))
  let t1230 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@transcendentals.lim_log_over_n()), t1226), t1227), t1228), t1229)
  let t1231 = @list.List([@simp.simp_tac(@list.List([decreasing_log_over_n(), @equal.gsym(@realax.real_of_num_add()), @complexes.re_cx()])), t1230])
  let t1225 = @tactics.first_assum(fn(x1223 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1223
    @simp.rewrite_tac(@list.List([@drule.match_mp(bounded_lfunction_partial_sums())(th)]))
  })
  let t1222 = @simp.rewrite_tac(@list.List([@complexes.real_cx()]))
  let t1220 = @term_syntax.parse_term("1")
  let t1221 = @tactics.map_every(fn(x1217 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1218 = @tactics.exists_tac(x1217)
    fn(x1219 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1218(x1219)
    }
  }, @list.List([@term_syntax.parse_term("4"), t1220]))
  let t1216 = @tactics.match_mp_tac(@canal.series_dirichlet_complex())
  let t1232 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1216), t1221), t1222), t1225), @tactics.conj_tac), t1231)
  summable_character_log_over_n_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : (Num) -> Cart[Real, 2], ∀ d : Num, dirichlet_character(d, c) && !(c == chi_0(d)) → summable(from(1), (n : Num) => c(n) * Cx(log(real_of_num(n)) / real_of_num(n)))"), t1232))
}

///|
let summable_character_log_over_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_CHARACTER_LOG_OVER_N")

///|
/// `SUMMABLE_CHARACTER_LOG_OVER_N`
pub fn summable_character_log_over_n() -> @kernel.Thm {
  summable_character_log_over_n_c.get()
}

///|
/// BOUNDED_LFUNCTION_DIRICHLET_MANGOLDT
fn step_48() -> Unit raise {
  let t1262 = @tactics.repeat_tac(@tactics.exists_tac(@term_syntax.parse_term("(n : Num)")))
  let t1261 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1260 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @sets.in_elim_thm(), @theorems.right_exists_and_thm(), @sets.exists_in_image(), @equal.gsym(@theorems.conj_assoc())]))
  let t1259 = @simp.rewrite_tac(@list.List([@sets.simple_image(), @sets.subset(), @sets.forall_in_image()]))
  let t1258 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.bounded_subset()))
  let t1255 = @drule.match_mp(@topology.bounded_sums())
  let t1257 = @tactics.disch_then(fn(x1256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1252 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1253 = @tactics.mp_tac(x1252)
      fn(x1254 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1253(x1254)
      }
    })(t1255(x1256))
  })
  let t1251 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1248 = @drule.match_mp(@topology.summable_imp_sums_bounded())
  let t1250 = @tactics.disch_then(fn(x1249 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1246 = @tactics.mp_tac(x1245)
      fn(x1247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1246(x1247)
      }
    })(t1248(x1249))
  })
  let t1242 = @drule.match_mp(summable_character_log_over_n())
  let t1244 = @tactics.first_assum(fn(x1243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1240 = @tactics.mp_tac(x1239)
      fn(x1241 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1240(x1241)
      }
    })(t1242(x1243))
  })
  let t1236 = @drule.match_mp(bounded_lfunction_dirichlet_mangoldt_lemma())
  let t1238 = @tactics.first_assum(fn(x1237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1233 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1234 = @tactics.mp_tac(x1233)
      fn(x1235 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1234(x1235)
      }
    })(t1236(x1237))
  })
  let t1263 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1238), t1244), t1250), t1251), t1257), t1258), t1259), t1260), t1261), t1262), @vectors.vector_arith_tac)
  bounded_lfunction_dirichlet_mangoldt_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → bounded({Lfunction(c) * vsum(op_dot_dot(1, (x : Num)), (n : Num) => c(n) * Cx(mangoldt(n) / real_of_num(n))) | IN(x, UNIV)})"), t1263))
}

///|
let bounded_lfunction_dirichlet_mangoldt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_LFUNCTION_DIRICHLET_MANGOLDT")

///|
/// `BOUNDED_LFUNCTION_DIRICHLET_MANGOLDT`
pub fn bounded_lfunction_dirichlet_mangoldt() -> @kernel.Thm {
  bounded_lfunction_dirichlet_mangoldt_c.get()
}

///|
/// BOUNDED_DIRICHLET_MANGOLDT_NONZERO
fn step_49() -> Unit raise {
  let t1282 = @meson.asm_meson_tac(@list.List([@complexes.complex_norm_nz(), @real.real_lt_div()]))
  let t1281 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_rdiv_eq()), @complexes.complex_norm_nz()]))
  let t1280 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t1279 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t1278 = @simp.rewrite_tac(@list.List([@topology.bounded_pos(), @sets.simple_image(), @sets.forall_in_image(), @sets.in_univ()]))
  let t1275 = @drule.match_mp(bounded_lfunction_dirichlet_mangoldt())
  let t1277 = @tactics.disch_then(fn(x1276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1272 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1273 = @tactics.mp_tac(x1272)
      fn(x1274 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1273(x1274)
      }
    })(t1275(x1276))
  })
  let t1271 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1265 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1266 = @tactics.mp_tac(x1265)
    fn(x1267 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1266(x1267)
    }
  }, fn(x1268 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1269 = @tactics.assume_tac(x1268)
    fn(x1270 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1269(x1270)
    }
  }))
  let t1264 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t1283 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1264), t1271), t1277), t1278), t1279), t1280), t1281), t1282)
  bounded_dirichlet_mangoldt_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) && !(Lfunction(c) == Cx(real_of_num(0))) → bounded({vsum(op_dot_dot(1, (x : Num)), (n : Num) => c(n) * Cx(mangoldt(n) / real_of_num(n))) | IN(x, UNIV)})"), t1283))
}

///|
let bounded_dirichlet_mangoldt_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_DIRICHLET_MANGOLDT_NONZERO")

///|
/// `BOUNDED_DIRICHLET_MANGOLDT_NONZERO`
pub fn bounded_dirichlet_mangoldt_nonzero() -> @kernel.Thm {
  bounded_dirichlet_mangoldt_nonzero_c.get()
}

///|
/// MANGOLDT_LOG_SUM
fn step_50() -> Unit raise {
  let t1305 = @simp.asm_rewrite_tac(@list.List([@transcendentals.log_1()]))
  let t1304 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == real_of_num(0) → a - (b : Real) == -b")))
  let t1303 = @simp.asm_simp_tac(@list.List([@iterate.sum_rmul(), @simp.rewrite_rule(@list.List([@class.eta_ax()]))(@multiplicative.divisorsum_mobius())]))
  let t1306 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_sub_ldistrib(), @iterate.sum_sub(), @prime.finite_divisors(), @arith.le_1()])), t1303), t1304), @class.cond_cases_tac), t1305), @calc_rat.real_arith_tac)
  let t1302 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_of_num_mul()), @transcendentals.log_mul(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1301 = @tactics.disch_then(fn(x1300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1298 = @tactics.subst_all_tac(x1297)
      fn(x1299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1298(x1299)
      }
    })(@equal.sym(x1300))
  })
  let t1296 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @arith.le_1()]))
  let t1294 = @term_syntax.parse_term("(d : Num) == 0")
  let t1295 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(q : Num) == 0"), t1294]))
  let t1293 = @simp.abbrev_tac(@term_syntax.parse_term("(q : Num) == DIV((n : Num), (d : Num))"))
  let t1292 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @int.divides_div_mult()]))
  let t1291 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1307 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq()), t1291), t1292), t1293), t1295), t1296), t1301), t1302), @calc_rat.real_arith_tac), t1306])
  let t1290 = @tactics.exists_tac(@term_syntax.parse_term("sum({(d : Num) | divides(d, (n : Num))}, (x : Num) => mobius(x) * (log(real_of_num(n)) - log(real_of_num(x))))"))
  let t1289 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1288 = @tactics.disch_then(fn(x1287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1286 = @simp.asm_simp_tac(@list.List([@mangoldt.log_mangoldt_sum(), @arith.le_1()]))
  let t1284 = @term_syntax.parse_term("(n : Num) => log(real_of_num(n))")
  let t1285 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => mangoldt(n)"), t1284]), @multiplicative.mobius_inversion()))
  let t1308 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1285), t1286), t1288), t1289), t1290), @tactics.conj_tac), t1307)
  mangoldt_log_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n → mangoldt(n) == -sum({(d : Num) | divides(d, n)}, (d : Num) => mobius(d) * log(real_of_num(d)))"), t1308))
}

///|
let mangoldt_log_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MANGOLDT_LOG_SUM")

///|
/// `MANGOLDT_LOG_SUM`
pub fn mangoldt_log_sum() -> @kernel.Thm {
  mangoldt_log_sum_c.get()
}

///|
/// BOUNDED_DIRICHLET_MANGOLDT_LEMMA
fn step_51() -> Unit raise {
  let t1332 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_lid(), @complexes.complex_div_1()]))
  let t1330 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t1331 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t1330]), dirichlet_character_eq_1()))
  let t1329 = @simp.asm_simp_tac(@list.List([@vectors.vsum_delta(), @equal.gsym(@complexes.complex_vec_0()), @iterate.in_numseg(), @arith.le_refl()]))
  let t1328 = @simp.simp_tac(@list.List([@class.cond_rand(), @class.cond_rator(), @complexes.complex_mul_lzero(), @complexes.complex_mul_rzero()]))
  let t1327 = @simp.simp_tac(@list.List([@simp.rewrite_rule(@list.List([@class.eta_ax()]))(@multiplicative.divisorsum_mobius())]))
  let t1333 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@prime.finite_divisors(), @complexes.cx_mul(), @iterate.sum_rmul(), @arith.le_1(), @complexes.vsum_cx()])), t1327), t1328), t1329), t1331), t1332)
  let t1326 = @simp.asm_simp_tac(@list.List([@transcendentals.log_div(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1325 = @list.List([@meson.asm_meson_tac(@list.List([@prime.divides_zero(), @arith.le_1()])), @tactics.all_tac])
  let t1324 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1323 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), @complexes.cx_inj()]))
  let t1322 = @simp.rewrite_tac(@list.List([@complexes.cx_mul(), @equal.gsym(@complexes.complex_add_ldistrib())]))
  let t1321 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1320 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1319 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t1318 = @simp.rewrite_tac(@list.List([]))
  let t1317 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1334 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_eq_numseg()), t1317), @tactics.strip_tac), t1318), @tactics.ap_term_tac), t1319), t1320), t1321), @tactics.disch_tac), t1322), @tactics.ap_term_tac), t1323), t1324), t1325), t1326), @calc_rat.real_arith_tac), t1333])
  let t1316 = @tactics.exists_tac(@term_syntax.parse_term("vsum(op_dot_dot(1, (x : Num)), (n : Num) => (c : (Num) -> Cart[Real, 2])(n) / Cx(real_of_num(n)) * vsum({(d : Num) | divides(d, n)}, (d : Num) => Cx(mobius(d) * log(real_of_num(x)))))"))
  let t1315 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1314 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_add()), @prime.finite_divisors(), @arith.le_1()]))
  let t1313 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("(c : Cart[Real, 2]) / (d : Cart[Real, 2]) * (x : Cart[Real, 2]) - c * (-(y : Cart[Real, 2]) / d) == c / d * (x + y)"))]))
  let t1312 = @simp.simp_tac(@list.List([@complexes.cx_neg(), @complexes.cx_div(), @equal.gsym(@complexes.vsum_cx()), @iterate.finite_numseg(), @prime.finite_divisors(), @arith.le_1()]))
  let t1311 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_sub()), @iterate.finite_numseg()]))
  let t1310 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(c : Cart[Real, 2]) - (b : Cart[Real, 2]) == (a : Cart[Real, 2]) → a + b == c")))
  let t1309 = @simp.asm_simp_tac(@list.List([mangoldt_log_sum()]))
  let t1335 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1309), t1310), t1311), t1312), t1313), t1314), t1315), t1316), @tactics.conj_tac), t1334)
  bounded_dirichlet_mangoldt_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ x : Num, dirichlet_character(d, c) && !(c == chi_0(d)) && 1 <= x → Cx(log(real_of_num(x))) + vsum(op_dot_dot(1, x), (n : Num) => c(n) * Cx(mangoldt(n) / real_of_num(n))) == vsum(op_dot_dot(1, x), (n : Num) => c(n) / Cx(real_of_num(n)) * vsum({(d : Num) | divides(d, n)}, (d : Num) => Cx(mobius(d) * log(real_of_num(x) / real_of_num(d)))))"), t1335))
}

///|
let bounded_dirichlet_mangoldt_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_DIRICHLET_MANGOLDT_LEMMA")

///|
/// `BOUNDED_DIRICHLET_MANGOLDT_LEMMA`
pub fn bounded_dirichlet_mangoldt_lemma() -> @kernel.Thm {
  bounded_dirichlet_mangoldt_lemma_c.get()
}

///|
/// SUM_LOG_OVER_X_BOUND
fn step_52() -> Unit raise {
  let t1354 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_le(), @arith.le_1(), @mangoldt.log_le_refl()]))
  let t1353 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) && (l : Real) <= x → real_of_num(2) * l + (abs(x) + real_of_num(1)) <= real_of_num(4) * x")))
  let t1352 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * (l : Real) + (abs((x : Real)) + real_of_num(1)) <= (b : Real) → abs((lf : Real) - ((xl : Real) - x + real_of_num(1))) <= real_of_num(2) * l → xl - lf <= b")))
  let t1349 = @drule.match_mp(@mangoldt.log_fact_bounds())
  let t1351 = @tactics.first_assum(fn(x1350 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1347 = @tactics.mp_tac(x1346)
      fn(x1348 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1347(x1348)
      }
    })(t1349(x1350))
  })
  let t1345 = @simp.rewrite_tac(@list.List([@iterate.sum_const_numseg(), @arith.add_sub()]))
  let t1344 = @simp.rewrite_tac(@list.List([@iterate.sum_sub_numseg(), @equal.gsym(@mangoldt.log_fact())]))
  let t1343 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @transcendentals.log_pos(), @real.real_le_rdiv_eq(), @real.real_of_num_lt(), @arith.le_1(), @realax.real_mul_lid(), @realax.real_of_num_le(), @transcendentals.log_div()]))
  let t1342 = @simp.rewrite_tac(@list.List([@iterate.sum_abs_numseg()]))
  let t1341 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (x : Num)), (n : Num) => abs(log(real_of_num(x) / real_of_num(n))))"))
  let t1340 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1339 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1338 = @simp.simp_tac(@list.List([@realax.real_div(), @iterate.sum_rmul(), @real.real_abs_mul(), @real.real_abs_inv(), @calc_int.real_abs_num()]))
  let t1337 = @list.List([@simp.asm_simp_tac(@list.List([@iterate.sum_clauses_numseg(), @calc_num.arith_eq(), @calc_int.real_abs_num(), @realarith.real_pos()])), @tactics.all_tac])
  let t1336 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 0"))
  let t1355 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)")), t1336), t1337), t1338), t1339), t1340), t1341), t1342), t1343), t1344), t1345), t1351), t1352), t1353), t1354)
  sum_log_over_x_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, abs(sum(op_dot_dot(1, x), (n : Num) => log(real_of_num(x) / real_of_num(n)) / real_of_num(x))) <= real_of_num(4)"), t1355))
}

///|
let sum_log_over_x_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_LOG_OVER_X_BOUND")

///|
/// `SUM_LOG_OVER_X_BOUND`
pub fn sum_log_over_x_bound() -> @kernel.Thm {
  sum_log_over_x_bound_c.get()
}

///|
/// BOUNDED_DIRICHLET_MANGOLDT_ZERO
fn step_53() -> Unit raise {
  let t1432 = @term_syntax.parse_term("(n : Num)")
  let t1433 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t1432]), @arith.division()))
  let t1431 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_mul(), @realax.real_of_num_le()]))
  let t1430 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1429 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_lt_div(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1428 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1427 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t1426 = @simp.gen_rewrite_tac(fn(x1425 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1419 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1420 = @equal.rand_conv(x1419)
      fn(x1421 : @kernel.Term) -> @kernel.Thm raise {
        s1420(x1421)
      }
    })((fn(x1422 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1423 = @equal.rand_conv(x1422)
      fn(x1424 : @kernel.Term) -> @kernel.Thm raise {
        s1423(x1424)
      }
    })(x1425))
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t1418 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1417 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @transcendentals.log_pos(), @real.real_le_rdiv_eq(), @real.real_of_num_lt(), @arith.le_1(), @realax.real_mul_lid(), @realax.real_of_num_le()]))
  let t1416 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1415 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t1414 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1413 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t1412 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (a : Real) → x <= a")), sum_log_over_x_bound()]))
  let t1411 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (x : Num)), (n : Num) => log(real_of_num(x) / real_of_num(n)) / real_of_num(x))"))
  let t1410 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1409 = @simp.asm_simp_tac(@list.List([@real.real_le_rmul_eq()]))
  let t1408 = @simp.rewrite_tac(@list.List([@iterate.sum_rmul()]))
  let t1407 = @simp.simp_tac(@list.List([@realax.real_div(), @calc_rat.real_ring(@term_syntax.parse_term("(a : Real) * ((l : Real) * ((B : Real) * (i : Real))) == l * i * a * B"))]))
  let t1403 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @real.real_le_rdiv_eq(), @real.real_of_num_lt(), @arith.le_1(), @realax.real_mul_lid(), @realax.real_of_num_le()]))
  let t1402 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= x) == (real_of_num(0) <= x)"))]))
  let t1401 = @simp.asm_rewrite_tac(@list.List([]))
  let t1400 = @simp.simp_tac(@list.List([@real.real_abs_pos(), @vectors.norm_pos_le()]))
  let t1399 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1398 = @simp.simp_tac(@list.List([@complexes.complex_norm_cx(), @complexes.complex_norm_mul()]))
  let t1404 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@transcendentals.cx_log(), @real.real_lt_div(), @real.real_of_num_lt(), @arith.le_1()])), t1398), t1399), t1400), t1401), t1402), t1403)
  let t1397 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(1) <= (n : Real) → inv(n) * n == real_of_num(1)")), @realax.real_of_num_le(), @multiplicative.real_abs_mobius()]))
  let t1396 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1395 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @calc_int.real_abs_num()]))
  let t1394 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @real.real_le_inv_eq(), @realarith.real_pos()]))
  let t1393 = @tactics.first_assum(fn(x1391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x1391
    @simp.simp_tac(@list.List([@drule.match_mp(dirichlet_character_norm())(t)]))
  })
  let t1405 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_div(), @complexes.complex_norm_cx()])), t1393), @class.cond_cases_tac), t1394), t1395), t1396), t1397), t1404])
  let t1390 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t1389 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1388 = @simp.once_rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t1387 = @simp.rewrite_tac(@list.List([]))
  let t1386 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1406 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_le_numseg()), t1386), @tactics.strip_tac), t1387), t1388), t1389), t1390), @tactics.conj_tac), t1405), @tactics.all_tac])
  let t1385 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (x : Num)), (n : Num) => inv(real_of_num(n)) * (log(real_of_num(x) / real_of_num(n)) * ((B : Real) / (real_of_num(DIV(x, n)) + real_of_num(1)))))"))
  let t1384 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1383 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t1382 = @tactics.match_mp_tac(@vectors.vsum_norm_triangle())
  let t1381 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t1380 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t1379 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) * (B : Real)"))
  let t1378 = @simp.simp_tac(@list.List([@complexes.vsum_complex_lmul(), @iterate.finite_numseg()]))
  let t1377 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t1376 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(ck : Cart[Real, 2]) * (cn : Cart[Real, 2]) * ((k' : Cart[Real, 2]) * (n' : Cart[Real, 2])) * ((m : Cart[Real, 2]) * (l : Cart[Real, 2])) == cn * (m * n') * (l * (ck * k'))"))]))
  let t1375 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul()), @complexes.cx_mul(), @complexes.complex_div(), @complexes.complex_inv_mul()]))
  let t1374 = @tactics.first_assum(fn(x1372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1372
    @simp.rewrite_tac(@list.List([@drule.match_mp(dirichlet_character_mul())(th)]))
  })
  let t1371 = @simp.rewrite_tac(@list.List([vsum_vsum_divisors()]))
  let t1370 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.vsum_complex_lmul()), @prime.finite_divisors(), @arith.le_1()]))
  let t1369 = @tactics.disch_then(fn(x1368 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1367 = @simp.asm_simp_tac(@list.List([]))
  let t1365 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t1366 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t1365]), bounded_dirichlet_mangoldt_lemma()))
  let t1364 = @simp.rewrite_tac(@list.List([@topology.bounded_pos(), @sets.forall_in_image(), @sets.in_elim_thm()]))
  let t1363 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t1362 = @simp.rewrite_tac(@list.List([@topology.bounded_insert(), @int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) == (1 <= n)"))]))
  let t1361 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (Num) -> _)((x : Num)) | IN(x, UNIV)} == INSERT(f(0), {f((x : Num)) | !(x == 0)})"))]))
  let t1360 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t1359 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t1357 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t1358 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t1357]), lfunction_partial_sum_strong()))
  let t1356 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1434 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@complexes.complex_add_sym()])), t1356), t1358), t1359), t1360), t1361), t1362), t1363), t1364), t1366), t1367), t1369), t1370), t1371), t1374), t1375), t1376), t1377), t1378), t1379), t1380), t1381), @tactics.disch_tac), t1382), t1383), t1384), t1385), @tactics.conj_tac), t1406), t1407), t1408), t1409), t1410), t1411), t1412), t1413), t1414), @tactics.strip_tac), t1415), t1416), t1417), t1418), t1426), t1427), t1428), t1429), t1430), t1431), t1433), @int.asm_arith_tac)
  bounded_dirichlet_mangoldt_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) && Lfunction(c) == Cx(real_of_num(0)) → bounded({vsum(op_dot_dot(1, (x : Num)), (n : Num) => c(n) * Cx(mangoldt(n) / real_of_num(n))) + Cx(log(real_of_num(x))) | IN(x, UNIV)})"), t1434))
}

///|
let bounded_dirichlet_mangoldt_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_DIRICHLET_MANGOLDT_ZERO")

///|
/// `BOUNDED_DIRICHLET_MANGOLDT_ZERO`
pub fn bounded_dirichlet_mangoldt_zero() -> @kernel.Thm {
  bounded_dirichlet_mangoldt_zero_c.get()
}

///|
/// BOUNDED_DIRICHLET_MANGOLDT_PRINCIPAL_LEMMA
fn step_54() -> Unit raise {
  let t1562 = @list.List([@int.asm_arith_tac, @simp.simp_tac(@list.List([@arith.exp(), @prime.divides_rmul(), @prime.divides_refl()]))])
  let t1561 = @tactics.subgoal_then(@term_syntax.parse_term("(k : Num) == SUC(k - 1)"), fn(x1558 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1559 = @tactics.subst1_tac(x1558)
    fn(x1560 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1559(x1560)
    }
  })
  let t1557 = @simp.asm_rewrite_tac(@list.List([]))
  let t1563 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1554 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1555 = @tactics.subst1_tac(x1554)
    fn(x1556 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1555(x1556)
    }
  }), t1557), t1561), t1562)
  let t1564 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_divexp(), @prime.divides_prime_prime()])), t1563])
  let t1553 = @simp.rewrite_tac(@list.List([]))
  let t1552 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t1551 = @tactics.match_mp_tac(@class.select_unique())
  let t1550 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le(), @prime.prime_imp_nz(), @arith.le_1()]))
  let t1549 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && (x : Real) == y → abs(x) == y")))
  let t1548 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_of_num_pow()), @real.real_abs_div(), @real.real_abs_pow(), @calc_int.real_abs_num()]))
  let t1546 = @meson.asm_meson_tac(@list.List([]))
  let t1547 = @list.List([@meson.asm_meson_tac(@list.List([@arith.exp_eq_0(), @arith.le_1(), @prime.prime_0()])), t1546, @tactics.all_tac])
  let t1545 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1544 = @simp.asm_simp_tac(@list.List([@simp.once_rewrite_rule(@list.List([@prime.coprime_sym()]))(@prime.coprime_primepow()), @arith.le_1()]))
  let t1542 = @term_syntax.parse_term("(k : Num)")
  let t1543 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Num)"), t1542]))
  let t1540 = @simp.asm_simp_tac(@list.List([@prime.eq_prime_exp()]))
  let t1539 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x1536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1537 = @tactics.mp_tac(x1536)
    fn(x1538 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1537(x1538)
    }
  })))
  let t1534 = @term_syntax.parse_term("(j : Num)")
  let t1535 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(q : Num)"), t1534]))
  let t1533 = @simp.asm_simp_tac(@list.List([@simp.once_rewrite_rule(@list.List([@prime.coprime_sym()]))(@prime.coprime_primepow()), @arith.le_1()]))
  let t1532 = @tactics.undisch_tac(@term_syntax.parse_term("!coprime((EXP((p : Num), (k : Num)), (d : Num)))"))
  let t1531 = @tactics.first_x_assum(fn(x1528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1529 = @tactics.subst_all_tac(x1528)
    fn(x1530 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1529(x1530)
    }
  })
  let t1527 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1526 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1525 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1524 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1523 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x1520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1521 = @tactics.mp_tac(x1520)
    fn(x1522 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1521(x1522)
    }
  })))
  let t1541 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)")), t1523), t1524), t1525), t1526), t1527), @tactics.strip_tac), t1531), t1532), t1533), @tactics.disch_tac), t1535), t1539), t1540), @int.asm_arith_tac), @tactics.all_tac])
  let t1519 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @iterate.in_numseg(), @pair.pair_eq()]))
  let t1518 = @simp.rewrite_tac(@list.List([@sets.in_elim_pair_thm()]))
  let t1517 = @simp.rewrite_tac(@list.List([@theorems.exists_unique(), @pair.exists_pair_thm(), @pair.forall_pair_thm()]))
  let t1516 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> Num) => ∀ p : Num, ∀ k : Num, GEQ(f((p, k)), EXP(p, k)))"))
  let t1515 = @tactics.match_mp_tac(@iterate.sum_eq_general())
  let t1514 = @tactics.conv_tac(@equal.sym_conv)
  let t1513 = @tactics.match_mp_tac(@real.real_eq_imp_le())
  let t1511 = @equal.gsym(@iterate.sum_restrict_set())
  let t1512 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_div()), t1511, @iterate.finite_numseg()]))
  let t1510 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(if (a : Bool) { real_of_num(0) } else { if (b : Bool) { (x : Real) } else { real_of_num(0) } }) == (if !a && b { x } else { real_of_num(0) })"))]))
  let t1509 = @simp.rewrite_tac(@list.List([@realax.real_div(), @calc_int.real_mul_lzero(), @calc_int.real_abs_num()]))
  let t1508 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t1507 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t1506 = @simp.rewrite_tac(@list.List([@mangoldt.mangoldt(), @class.cond_rand()]))
  let t1505 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @realax.real_mul_lid()]))
  let t1504 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @vectors.norm_neg(), @calc_int.real_abs_num()]))
  let t1503 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_refl(), @complexes.complex_sub_lzero()]))
  let t1502 = @simp.rewrite_tac(@list.List([chi_0(), @class.cond_rand(), @class.cond_rator()]))
  let t1501 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @complexes.complex_norm_mul(), @complexes.complex_norm_cx()]))
  let t1500 = @tactics.match_mp_tac(@vectors.vsum_norm_triangle())
  let t1499 = @tactics.disch_then(fn(x1496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1497 = @tactics.subst1_tac(x1496)
    fn(x1498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1497(x1498)
    }
  })
  let t1494 = @simp.asm_simp_tac(@list.List([@arith.lt_pow2_refl(), @arith.lt_imp_le(), @arith.exp_mono_le(), @prime.prime_ge_2()]))
  let t1493 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2, (k : Num))"))
  let t1492 = @tactics.match_mp_tac(@arith.le_trans())
  let t1491 = @simp.asm_rewrite_tac(@list.List([]))
  let t1490 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (k : Num))"))
  let t1489 = @tactics.match_mp_tac(@arith.le_trans())
  let t1488 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1487 = @simp.simp_tac(@list.List([@sets.subset(), @iterate.finite_numseg(), @iterate.in_numseg(), @sets.in_elim_thm()]))
  let t1486 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(1, (x : Num))"))
  let t1485 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1484 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1483 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1495 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@prime.finite_special_divisors(), @arith.le_1()])), t1483), t1484), @tactics.strip_tac), t1485), t1486), t1487), t1488), @tactics.strip_tac), t1489), t1490), t1491), t1492), t1493), t1494), @tactics.all_tac])
  let t1477 = @drule.part_match(fn(x1476 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x1476))
  }, @iterate.sum_sum_product())
  let t1469 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @realax.real_mul_lid(), @real.real_of_num_lt(), @realax.real_of_num_le(), @arith.le_1()]))
  let t1468 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t1467 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t1466 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @real.real_pow_le(), @realarith.real_pos(), @realax.real_le_mul()]))
  let t1465 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) * (y : Real) && real_of_num(2) * x <= real_of_num(1) → pow(x, 1) - x * y <= real_of_num(1) - x")))
  let t1464 = @simp.rewrite_tac(@list.List([@realax.real_pow()]))
  let t1463 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @realarith.real_sub_lt(), @real.real_lt_ldiv_eq(), @realax.real_mul_lid(), @real.real_of_num_lt(), @arith.le_1()]))
  let t1462 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1461 = @simp.simp_tac(@list.List([@equal.gsym(@real.real_pow_inv()), @misc.sum_gp(), @real.real_inv_eq_1(), @realax.real_of_num_eq()]))
  let t1460 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq(), @transcendentals.log_pos_lt(), @real.real_of_num_lt()]))
  let t1459 = @simp.gen_rewrite_tac(fn(x1456 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1457 = @equal.rand_conv(x1456)
    fn(x1458 : @kernel.Term) -> @kernel.Thm raise {
      s1457(x1458)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t1470 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @iterate.sum_lmul()])), t1459), t1460), t1461), @class.cond_cases_tac), t1462), @class.cond_cases_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1463), t1464), t1465), t1466), t1467), t1468), t1469)
  let t1455 = @simp.asm_simp_tac(@list.List([@arith.lt_pow2_refl(), @arith.lt_imp_le(), @arith.exp_mono_le()]))
  let t1454 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2, (k : Num))"))
  let t1453 = @tactics.match_mp_tac(@arith.le_trans())
  let t1452 = @simp.asm_rewrite_tac(@list.List([]))
  let t1451 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (k : Num))"))
  let t1450 = @tactics.match_mp_tac(@arith.le_trans())
  let t1449 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1448 = @simp.asm_simp_tac(@list.List([@sets.in_diff(), @iterate.in_numseg(), @sets.in_elim_thm(), @sets.subset(), @real.real_pow_le(), @realarith.real_pos(), @real.real_le_div(), @transcendentals.log_pos(), @realax.real_of_num_le(), @prime.prime_ge_2(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p"))]))
  let t1447 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t1471 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_subset_simple()), t1447), t1448), t1449), @tactics.strip_tac), t1450), t1451), t1452), t1453), t1454), t1455), t1470])
  let t1446 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (x : Num)), (k : Num) => log(real_of_num((p : Num))) / pow(real_of_num(p), k))"))
  let t1445 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1444 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_ge_2(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 < p && 1 <= p"))])), @tactics.all_tac])
  let t1443 = @tactics.subgoal_then(@term_syntax.parse_term("2 <= (p : Num) && 1 <= p && 1 < p"), fn(x1440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1441 = @tactics.assume_tac(x1440)
    fn(x1442 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1441(x1442)
    }
  })
  let t1439 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1438 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1437 = @simp.asm_simp_tac(@list.List([@prime.finite_special_divisors(), @arith.le_1()]))
  let t1472 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_le()), t1437), t1438), t1439), @tactics.strip_tac), t1443), t1444), t1445), t1446), @tactics.conj_tac), t1471)])
  let t1436 = @tactics.exists_tac(@term_syntax.parse_term("sum({(p : Num) | prime(p) && divides(p, (d : Num))}, (p : Num) => sum({(k : Num) | 1 <= k && EXP(p, k) <= (x : Num)}, (k : Num) => log(real_of_num(p)) / pow(real_of_num(p), k)))"))
  let t1435 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1565 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1435), t1436), @tactics.conj_tac), t1472), fn(x1482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1481 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1479 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1478 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1474 = @tactics.mp_tac(x1473)
            fn(x1475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1474(x1475)
            }
          })(t1477(x1478))
        })(@kernel.rand(x1479))
      })((fn(x1480 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1480.1
      })(x1481))
    })(x1482)(x1482)
  }), @tactics.ants_tac), t1495), t1499), t1500), t1501), t1502), t1503), t1504), t1505), t1506), t1507), t1508), t1509), t1510), t1512), t1513), t1514), t1515), t1516), t1517), t1518), t1519), @tactics.conj_tac), t1541), t1543), t1544), t1545), t1547), t1548), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1549), t1550), @tactics.ap_term_tac), @tactics.ap_term_tac), t1551), t1552), t1553), @tactics.eq_tac), t1564)
  bounded_dirichlet_mangoldt_principal_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, 1 <= d → norm(vsum(op_dot_dot(1, (x : Num)), (n : Num) => (chi_0(d, n) - Cx(real_of_num(1))) * Cx(mangoldt(n) / real_of_num(n)))) <= sum({(p : Num) | prime(p) && divides(p, d)}, (p : Num) => log(real_of_num(p)))"), t1565))
}

///|
let bounded_dirichlet_mangoldt_principal_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_DIRICHLET_MANGOLDT_PRINCIPAL_LEMMA")

///|
/// `BOUNDED_DIRICHLET_MANGOLDT_PRINCIPAL_LEMMA`
pub fn bounded_dirichlet_mangoldt_principal_lemma() -> @kernel.Thm {
  bounded_dirichlet_mangoldt_principal_lemma_c.get()
}

///|
/// BOUNDED_DIRICHLET_MANGOLDT_PRINCIPAL
fn step_55() -> Unit raise {
  let t1580 = @simp.asm_rewrite_tac(@list.List([]))
  let t1579 = @tactics.match_mp_tac(@mangoldt.mertens_lemma())
  let t1578 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.cx_sub()), @complexes.vsum_cx(), @iterate.finite_numseg(), @complexes.complex_norm_cx()]))
  let t1577 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(c : Cart[Real, 2]) * (x : Cart[Real, 2]) - (c - Cx(real_of_num(1))) * x == x"))]))
  let t1576 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_sub()), @iterate.finite_numseg()]))
  let t1575 = @simp.asm_simp_tac(@list.List([bounded_dirichlet_mangoldt_principal_lemma()]))
  let t1574 = @tactics.exists_tac(@term_syntax.parse_term("vsum(op_dot_dot(1, (x : Num)), (n : Num) => (chi_0((d : Num), n) - Cx(real_of_num(1))) * Cx(mangoldt(n) / real_of_num(n)))"))
  let t1573 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("∀ s' : Cart[Real, 2], norm(s') <= (p : Real) && norm((s : Cart[Real, 2]) - s' - (l : Cart[Real, 2])) <= real_of_num(21) → norm(s - l) <= abs(p) + real_of_num(21)")))
  let t1572 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (a : Real) + (b : Real) → x <= a + (abs((y : Real)) + b)")))
  let t1570 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @complexes.complex_norm_cx()]))
  let t1571 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@vectors.vsum_clauses_numseg(), @calc_num.arith(), @vectors.vector_sub_lzero()])), t1570), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1569 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 0"))
  let t1568 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t1567 = @tactics.exists_tac(@term_syntax.parse_term("abs(sum({(p : Num) | prime(p) && divides(p, (d : Num))}, (p : Num) => log(real_of_num(p)))) + (abs(log(real_of_num(0))) + real_of_num(21))"))
  let t1566 = @simp.rewrite_tac(@list.List([@topology.bounded(), @sets.simple_image(), @sets.forall_in_image(), @sets.in_univ()]))
  let t1581 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1566), t1567), t1568), t1569), t1571), t1572), t1573), t1574), t1575), t1576), t1577), t1578), t1579), t1580)
  bounded_dirichlet_mangoldt_principal_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, 1 <= d → bounded({vsum(op_dot_dot(1, (x : Num)), (n : Num) => chi_0(d, n) * Cx(mangoldt(n) / real_of_num(n))) - Cx(log(real_of_num(x))) | IN(x, UNIV)})"), t1581))
}

///|
let bounded_dirichlet_mangoldt_principal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_DIRICHLET_MANGOLDT_PRINCIPAL")

///|
/// `BOUNDED_DIRICHLET_MANGOLDT_PRINCIPAL`
pub fn bounded_dirichlet_mangoldt_principal() -> @kernel.Thm {
  bounded_dirichlet_mangoldt_principal_c.get()
}

///|
/// SUM_OF_NUMBERS
fn step_56() -> Unit raise {
  let t1582 = @tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([@iterate.nsum_clauses_numseg()]))), @int.arith_tac)
  sum_of_numbers_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, nsum(op_dot_dot(0, n), (i : Num) => i) == DIV(n * (n + 1), 2)"), t1582))
}

///|
let sum_of_numbers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_OF_NUMBERS")

///|
/// `SUM_OF_NUMBERS`
pub fn sum_of_numbers() -> @kernel.Thm {
  sum_of_numbers_c.get()
}

///|
/// PRODUCT_POW_NSUM
fn step_57() -> Unit raise {
  let t1583 = @simp.simp_tac(@list.List([@iterate.product_clauses(), @iterate.nsum_clauses(), @realax.real_pow(), @real.real_pow_add()]))
  let t1584 = @tactics.then_tac(@tactics.match_mp_tac(@sets.finite_induct_strong()), t1583)
  product_pow_nsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, FINITE(s) → product(s, (i : _) => pow((z : Real), (f : (_) -> Num)(i))) == pow(z, nsum(s, f))"), t1584))
}

///|
let product_pow_nsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_POW_NSUM")

///|
/// `PRODUCT_POW_NSUM`
pub fn product_pow_nsum() -> @kernel.Thm {
  product_pow_nsum_c.get()
}

///|
/// PRODUCT_SPECIAL
fn step_58() -> Unit raise {
  let t1585 = @simp.simp_tac(@list.List([product_pow_nsum(), @iterate.finite_numseg(), sum_of_numbers()]))
  product_special_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Real, ∀ i : _, product(op_dot_dot(0, (n : Num)), (i : Num) => pow(z, i)) == pow(z, DIV(n * (n + 1), 2))"), t1585))
}

///|
let product_special_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRODUCT_SPECIAL")

///|
/// `PRODUCT_SPECIAL`
pub fn product_special() -> @kernel.Thm {
  product_special_c.get()
}

///|
/// AGM_SPECIAL
fn step_59() -> Unit raise {
  let t1632 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t1631 = @simp.asm_simp_tac(@list.List([@real.real_pow_div(), @real.real_le_rdiv_eq(), @real.real_pow_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))]))
  let t1629 = @equal.gsym(@realax.real_of_num_add())
  let t1630 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), t1629]))
  let t1628 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq(), @realarith.real_pow_2(), @realarith.real_le_square()]))
  let t1625 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@real.real_pow_le2_rev()))
  let t1627 = @tactics.disch_then(fn(x1626 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1622 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1623 = @tactics.mp_tac(x1622)
      fn(x1624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1623(x1624)
      }
    })(t1625(x1626))
  })
  let t1633 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_pow())])), t1627), t1628), t1630), t1631), t1632)
  let t1620 = @simp.simp_tac(@list.List([@arith.even_exists(), @theorems.left_imp_exists_thm(), @arith.div_mult(), @calc_num.arith()]))
  let t1619 = @tactics.conv_tac(@class.taut)
  let t1621 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith_even()])), t1619), t1620])
  let t1634 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("EVEN((n : Num) * (n + 1))"), fn(x1616 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1617 = @tactics.mp_tac(x1616)
    fn(x1618 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1617(x1618)
    }
  }), t1621), t1633])
  let t1615 = @tactics.subgoal_then(@term_syntax.parse_term("2 * DIV((n : Num) * (n + 1), 2) == n * (n + 1)"), fn(x1612 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1613 = @tactics.subst1_tac(x1612)
    fn(x1614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1613(x1614)
    }
  })
  let t1611 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1610 = @simp.rewrite_tac(@list.List([@real.real_pow_pow()]))
  let t1609 = @simp.asm_simp_tac(@list.List([@products.product_pos_le_numseg(), @real.real_pow_le()]))
  let t1605 = @term_syntax.parse_term("2")
  let t1608 = @tactics.disch_then(fn(x1607 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1603 = @tactics.mp_tac(x1602)
      fn(x1604 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1603(x1604)
      }
    })(((x1606 : @kernel.Thm) => @bool.spec(t1605, x1606))(x1607))
  })
  let t1599 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@real.real_pow_le2()))
  let t1601 = @tactics.disch_then(fn(x1600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1596 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1597 = @tactics.mp_tac(x1596)
      fn(x1598 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1597(x1598)
      }
    })(t1599(x1600))
  })
  let t1595 = @simp.rewrite_tac(@list.List([product_special()]))
  let t1594 = @simp.rewrite_tac(@list.List([@iterate.sum_offset(), @products.product_offset(), @arith.add_sub()]))
  let t1593 = @list.List([@simp.rewrite_tac(@list.List([@arith.add_clauses()])), @tactics.all_tac])
  let t1592 = @tactics.subgoal_then(@term_syntax.parse_term("op_dot_dot(1, (n : Num) + 1) == op_dot_dot(0 + 1, n + 1)"), fn(x1589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1590 = @tactics.subst1_tac(x1589)
    fn(x1591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1590(x1591)
    }
  })
  let t1588 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) + 1"))]))
  let t1586 = @term_syntax.parse_term("(k : Num) => pow((t : Real), k - 1)")
  let t1587 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t1586]), @agm.agm()))
  let t1635 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1587), t1588), t1592), t1593), t1594), t1595), t1601), t1608), t1609), t1610), t1611), t1615), t1634)
  agm_special_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ t : Real, real_of_num(0) <= t → pow(real_of_num(n) + real_of_num(1), 2) * pow(t, n) <= pow(sum(op_dot_dot(0, n), (k : Num) => pow(t, k)), 2)"), t1635))
}

///|
let agm_special_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AGM_SPECIAL")

///|
/// `AGM_SPECIAL`
pub fn agm_special() -> @kernel.Thm {
  agm_special_c.get()
}

///|
/// DIVISORSUM_PRIMEPOW
fn step_60() -> Unit raise {
  let t1648 = @meson.asm_meson_tac(@list.List([@prime.prime_0(), @prime.prime_1()]))
  let t1647 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @arith.eq_exp(), @sets.finite_numseg_le()]))
  let t1646 = @tactics.match_mp_tac(@iterate.sum_image())
  let t1645 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.numseg_le())]))
  let t1644 = @simp.gen_rewrite_tac(fn(x1643 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1637 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1638 = @equal.rand_conv(x1637)
      fn(x1639 : @kernel.Term) -> @kernel.Thm raise {
        s1638(x1639)
      }
    })((fn(x1640 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1641 = @equal.rand_conv(x1640)
      fn(x1642 : @kernel.Term) -> @kernel.Thm raise {
        s1641(x1642)
      }
    })(x1643))
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t1636 = @simp.asm_simp_tac(@list.List([@prime.divides_primepow(), @sets.set_rule(@term_syntax.parse_term("{(m : _) | ∃ i : _, (P : (_) -> Bool)(i) && m == (f : (_) -> _)(i)} == IMAGE(f, {(i : _) | P(i)})"))]))
  let t1649 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1636), t1644), t1645), t1646), t1647), t1648)
  divisorsum_primepow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : _, ∀ p : Num, ∀ k : Num, prime(p) → sum({(m : Num) | divides(m, EXP(p, k))}, (c : (Num) -> Real)) == sum(op_dot_dot(0, k), (i : Num) => c(EXP(p, i)))"), t1649))
}

///|
let divisorsum_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVISORSUM_PRIMEPOW")

///|
/// `DIVISORSUM_PRIMEPOW`
pub fn divisorsum_primepow() -> @kernel.Thm {
  divisorsum_primepow_c.get()
}

///|
/// DIVISORVSUM_PRIMEPOW
fn step_61() -> Unit raise {
  let t1662 = @meson.asm_meson_tac(@list.List([@prime.prime_0(), @prime.prime_1()]))
  let t1661 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @arith.eq_exp(), @sets.finite_numseg_le()]))
  let t1660 = @tactics.match_mp_tac(@vectors.vsum_image())
  let t1659 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.numseg_le())]))
  let t1658 = @simp.gen_rewrite_tac(fn(x1657 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1651 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1652 = @equal.rand_conv(x1651)
      fn(x1653 : @kernel.Term) -> @kernel.Thm raise {
        s1652(x1653)
      }
    })((fn(x1654 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1655 = @equal.rand_conv(x1654)
      fn(x1656 : @kernel.Term) -> @kernel.Thm raise {
        s1655(x1656)
      }
    })(x1657))
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t1650 = @simp.asm_simp_tac(@list.List([@prime.divides_primepow(), @sets.set_rule(@term_syntax.parse_term("{(m : _) | ∃ i : _, (P : (_) -> Bool)(i) && m == (f : (_) -> _)(i)} == IMAGE(f, {(i : _) | P(i)})"))]))
  let t1663 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1650), t1658), t1659), t1660), t1661), t1662)
  divisorvsum_primepow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : _, ∀ p : Num, ∀ k : Num, prime(p) → vsum({(m : Num) | divides(m, EXP(p, k))}, (c : (Num) -> Cart[Real, _])) == vsum(op_dot_dot(0, k), (i : Num) => c(EXP(p, i)))"), t1663))
}

///|
let divisorvsum_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVISORVSUM_PRIMEPOW")

///|
/// `DIVISORVSUM_PRIMEPOW`
pub fn divisorvsum_primepow() -> @kernel.Thm {
  divisorvsum_primepow_c.get()
}

///|
/// DIRICHLET_CHARACTER_DIVISORSUM_EQ_1
fn step_62() -> Unit raise {
  let t1689 = @meson.asm_meson_tac(@list.List([@prime.coprime_sym(), @prime.prime_coprime_eq()]))
  let t1688 = @simp.asm_rewrite_tac(@list.List([@arith.exp()]))
  let t1687 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == 0"))
  let t1686 = @simp.rewrite_tac(@list.List([@prime.coprime_rexp()]))
  let t1685 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1684 = @tactics.first_assum(fn(x1682 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1682
    @simp.simp_tac(@list.List([@drule.match_mp(dirichlet_character_eq_0())(th)]))
  })
  let t1681 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0()]))
  let t1680 = @tactics.first_x_assum(fn(x1677 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1678 = @tactics.subst_all_tac(x1677)
    fn(x1679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1678(x1679)
    }
  })
  let t1676 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x1673 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1674 = @tactics.mp_tac(x1673)
    fn(x1675 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1674(x1675)
    }
  }))
  let t1671 = @term_syntax.parse_term("(i : Num)")
  let t1672 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Num)"), t1671]))
  let t1670 = @simp.asm_simp_tac(@list.List([@prime.divides_primepow(), @theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t1669 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_sing(), @sets.in_elim_thm(), @prime.divides_1()]))
  let t1668 = @tactics.match_mp_tac(@vectors.vsum_superset())
  let t1666 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_1()]))
  let t1667 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vsum_sing()])), t1666)])
  let t1665 = @tactics.exists_tac(@term_syntax.parse_term("vsum({1}, (c : (Num) -> Cart[Real, 2]))"))
  let t1664 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1690 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1664), t1665), @tactics.conj_tac), t1667), t1668), t1669), t1670), t1672), t1676), t1680), t1681), t1684), t1685), t1686), t1687), t1688), t1689)
  dirichlet_character_divisorsum_eq_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ p : Num, ∀ k : Num, dirichlet_character(d, c) && prime(p) && divides(p, d) → vsum({(m : Num) | divides(m, EXP(p, k))}, c) == Cx(real_of_num(1))"), t1690))
}

///|
let dirichlet_character_divisorsum_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_DIVISORSUM_EQ_1")

///|
/// `DIRICHLET_CHARACTER_DIVISORSUM_EQ_1`
pub fn dirichlet_character_divisorsum_eq_1() -> @kernel.Thm {
  dirichlet_character_divisorsum_eq_1_c.get()
}

///|
/// DIRICHLET_CHARACTER_REAL_CASES
fn step_63() -> Unit raise {
  let t1713 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @equal.gsym(@complexes.cx_neg()), @complexes.cx_inj()]))
  let t1712 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : Real)"))(fn(x1709 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1710 = @tactics.subst1_tac(x1709)
    fn(x1711 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1710(x1711)
    }
  }))
  let t1708 = @simp.rewrite_tac(@list.List([@complexes.real_exists()]))
  let t1704 = @term_syntax.parse_term("(n : Num)")
  let t1707 = @tactics.first_x_assum(fn(x1706 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1701 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1702 = @tactics.mp_tac(x1701)
      fn(x1703 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1702(x1703)
      }
    })(((x1705 : @kernel.Thm) => @bool.spec(t1704, x1705))(x1706))
  })
  let t1698 = @drule.match_mp(dirichlet_character_norm())
  let t1695 = @term_syntax.parse_term("(n : Num)")
  let t1700 = @tactics.first_assum(fn(x1699 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1697 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1692 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1693 = @tactics.mp_tac(x1692)
        fn(x1694 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1693(x1694)
        }
      })(((x1696 : @kernel.Thm) => @bool.spec(t1695, x1696))(x1697))
    })(t1698(x1699))
  })
  let t1691 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1714 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1691), t1700), t1707), t1708), t1712), t1713), @calc_rat.real_arith_tac)
  dirichlet_character_real_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && (∀ n : Num, real(c(n))) → (∀ n : Num, c(n) == -Cx(real_of_num(1)) || c(n) == Cx(real_of_num(0)) || c(n) == Cx(real_of_num(1)))"), t1714))
}

///|
let dirichlet_character_real_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_REAL_CASES")

///|
/// `DIRICHLET_CHARACTER_REAL_CASES`
pub fn dirichlet_character_real_cases() -> @kernel.Thm {
  dirichlet_character_real_cases_c.get()
}

///|
/// DIRICHLET_CHARACTER_DIVISORSUM_PRIMEPOW_POS
fn step_64() -> Unit raise {
  let t1736 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_pow_neg(), @complexes.complex_pow_one(), @complexes.complex_mul_lneg(), @complexes.complex_mul_rneg(), @complexes.complex_neg_neg(), @complexes.complex_mul_lid(), @complexes.re_neg(), @complexes.re_cx()]))
  let t1735 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_pow(), @complexes.re_cx(), @arith.le_0()]))
  let t1734 = @simp.rewrite_tac(@list.List([@arith.even(), @iterate.sum_clauses_numseg()]))
  let t1732 = @term_syntax.parse_term("(r : Num)")
  let t1733 = @tactics.spec_tac(@term_syntax.parse_term("(k : Num)"), t1732)
  let t1731 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) == (if EVEN((k : Num)) { real_of_num(1) } else { real_of_num(0) }) → real_of_num(0) <= s")))
  let t1730 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cx_pow()), @complexes.re_cx(), @iterate.sum_pos_le_numseg(), @real.real_pow_le(), @realarith.real_pos()]))
  let t1726 = @term_syntax.parse_term("(p : Num)")
  let t1729 = @tactics.disch_then(fn(x1728 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1723 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1724 = @tactics.mp_tac(x1723)
      fn(x1725 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1724(x1725)
      }
    })(((x1727 : @kernel.Thm) => @bool.spec(t1726, x1727))(x1728))
  })
  let t1722 = @simp.asm_rewrite_tac(@list.List([]))
  let t1720 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t1721 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t1720]), dirichlet_character_real_cases()))
  let t1719 = @tactics.first_assum(fn(x1717 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1717
    @simp.simp_tac(@list.List([@drule.match_mp(dirichlet_character_pow())(th)]))
  })
  let t1716 = @simp.asm_simp_tac(@list.List([divisorsum_primepow()]))
  let t1715 = @simp.asm_simp_tac(@list.List([@complexes.re_vsum(), @prime.finite_divisors(), @arith.exp_eq_0(), @prime.prime_imp_nz()]))
  let t1737 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1715), t1716), t1719), t1721), t1722), t1729), @tactics.strip_tac), t1730), t1731), t1733), @nums.induct_tac), t1734), t1735), @class.cond_cases_tac), t1736), @calc_rat.real_arith_tac)
  dirichlet_character_divisorsum_primepow_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ p : Num, ∀ k : Num, dirichlet_character(d, c) && (∀ n : Num, real(c(n))) && prime(p) → real_of_num(0) <= Re(vsum({(m : Num) | divides(m, EXP(p, k))}, c))"), t1737))
}

///|
let dirichlet_character_divisorsum_primepow_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_DIVISORSUM_PRIMEPOW_POS")

///|
/// `DIRICHLET_CHARACTER_DIVISORSUM_PRIMEPOW_POS`
pub fn dirichlet_character_divisorsum_primepow_pos() -> @kernel.Thm {
  dirichlet_character_divisorsum_primepow_pos_c.get()
}

///|
/// DIRICHLET_CHARACTER_DIVISORSUM_POS
fn step_65() -> Unit raise {
  let t1763 = @int.arith_rule(@term_syntax.parse_term("1 < (n : Num) → !(n == 0)"))
  let t1764 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.re_vsum()), @prime.finite_divisors(), @arith.mult_eq_0(), t1763, @realax.real_le_mul()]))
  let t1758 = @term_syntax.parse_term("(b : Num)")
  let t1759 = @list.List([@term_syntax.parse_term("(a : Num)"), t1758])
  let t1765 = @tactics.then_tac(@tactics.disch_then(fn(x1762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1761 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1755 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1756 = @tactics.mp_tac(x1755)
        fn(x1757 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1756(x1757)
        }
      })(((x1760 : @kernel.Thm) => @bool.specl(t1759, x1760))(x1761))
    })(@bool.conjunct2(x1762))
  }), t1764)
  let t1754 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_1(), @complexes.re_cx(), @complexes.real_v1(), @complexes.cx_mul()]))
  let t1766 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x1752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1752
    @simp.rewrite_tac(@list.List([@drule.match_mp(dirichlet_character_mul())(th)]))
  }), t1754), t1765])
  let t1751 = @simp.rewrite_tac(@list.List([@multiplicative.real_multiplicative()]))
  let t1750 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(m : Num) => Re((c : (Num) -> Cart[Real, 2])(m))"), @multiplicative.real_multiplicative_divisorsum()))
  let t1748 = @term_syntax.parse_term("(b : Num)")
  let t1749 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Num)"), t1748]))
  let t1747 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([dirichlet_character_divisorsum_primepow_pos()]))])
  let t1746 = @tactics.match_mp_tac(@prime.induct_coprime_strong())
  let t1744 = @term_syntax.parse_term("(n : Num)")
  let t1745 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1744)
  let t1743 = @tactics.undisch_tac(@term_syntax.parse_term("1 < (n : Num)"))
  let t1741 = @meson.asm_meson_tac(@list.List([dirichlet_character_eq_1(), @complexes.re_cx(), @realarith.real_pos()]))
  let t1742 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@int.divides_one(), @sets.sing_gspec(), @vectors.vsum_sing()])), t1741), @tactics.all_tac])
  let t1738 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n == 1 || 1 < n")))
  let t1740 = @tactics.first_x_assum(fn(x1739 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t1738(x1739))
  })
  let t1767 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1740), t1742), t1743), t1745), t1746), @tactics.conj_tac), t1747), t1749), @tactics.strip_tac), t1750), t1751), @tactics.ants_tac), t1766)
  dirichlet_character_divisorsum_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], ∀ n : Num, dirichlet_character(d, c) && (∀ n : Num, real(c(n))) && !(n == 0) → real_of_num(0) <= Re(vsum({(m : Num) | divides(m, n)}, c))"), t1767))
}

///|
let dirichlet_character_divisorsum_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_CHARACTER_DIVISORSUM_POS")

///|
/// `DIRICHLET_CHARACTER_DIVISORSUM_POS`
pub fn dirichlet_character_divisorsum_pos() -> @kernel.Thm {
  dirichlet_character_divisorsum_pos_c.get()
}

///|
/// lemma
fn step_66() -> Unit raise {
  let t1773 = @simp.simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_pos(), @realarith.real_le_square()]))
  let t1772 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (n : Real) * ((x : Real) * x) → real_of_num(1) - (n + real_of_num(1)) * x <= (real_of_num(1) - x) * (real_of_num(1) - n * x)")))
  let t1771 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul(), @realarith.real_sub_le(), @equal.gsym(@real.real_of_num_suc())]))
  let t1770 = @tactics.exists_tac(@term_syntax.parse_term("(real_of_num(1) - (x : Real)) * (real_of_num(1) - real_of_num((n : Num)) * x)"))
  let t1769 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1768 = @simp.rewrite_tac(@list.List([@realax.real_pow()]))
  let t1774 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), @tactics.gen_tac), @tactics.disch_tac), @nums.induct_tac), t1768), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t1769), t1770), t1771), t1772), t1773)
  lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ n : Num, real_of_num(0) <= x && x <= real_of_num(1) → real_of_num(1) - real_of_num(n) * x <= pow(real_of_num(1) - x, n)"), t1774))
}

///|
let lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma")

///|
/// `lemma`
pub fn lemma() -> @kernel.Thm {
  lemma_c.get()
}

///|
/// LFUNCTION_NONZERO_REAL
fn step_67() -> Unit raise {
  let t2247 = @simp.asm_rewrite_tac(@list.List([]))
  let t2246 = @tactics.match_mp_tac(@real.real_pow_mono_inv())
  let t2248 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add()), @real.real_pow_pow()])), t2246), t2247), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @int.arith_tac]))
  let t2245 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t2249 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realax.real_div(), @real.real_inv_mul(), @real.real_pow_mul()])), t2245), t2248])
  let t2244 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) && (a : Real) <= (b : Real) → b <= x → a <= y")))
  let t2243 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @realax.real_le_mul(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= real_of_num((n : Num)) + real_of_num(1)"))]))
  let t2240 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) → (e : Bool)) == (b && d → a && c → e)"))]))(@real.real_le_mul2()))
  let t2242 = @tactics.disch_then(fn(x2241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2238 = @tactics.mp_tac(x2237)
      fn(x2239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2238(x2239)
      }
    })(t2240(x2241))
  })
  let t2235 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))
  let t2236 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_rdiv_eq()), @real.real_pow_lt(), @real.real_of_num_lt(), @arith.le_1(), t2235]))
  let t2234 = @simp.gen_rewrite_tac(fn(x2233 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2227 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2228 = @equal.land_conv(x2227)
      fn(x2229 : @kernel.Term) -> @kernel.Thm raise {
        s2228(x2229)
      }
    })((fn(x2230 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2231 = @equal.once_depth_conv(x2230)
      fn(x2232 : @kernel.Term) -> @kernel.Thm raise {
        s2231(x2232)
      }
    })(x2233))
  }, @list.List([@realax.real_mul_sym()]))
  let t2226 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t2225 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_of_num_sub()), @real.real_sub_add()]))
  let t2223 = @term_syntax.parse_term("(t : Real)")
  let t2224 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) - 1"), t2223]), agm_special()))
  let t2221 = @term_syntax.parse_term("(t : Real)")
  let t2222 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t2221]), agm_special()))
  let t2219 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @iterate.sum_pos_le_numseg()]))
  let t2218 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t2220 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), @tactics.conj_tac), t2218)), t2219), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2217 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t2216 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t2215 = @tactics.match_mp_tac(@real.real_pow_le2_rev())
  let t2213 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(1) <= (n : Real) → inv(n) - inv(n + real_of_num(1)) == inv(n * (n + real_of_num(1)))"))
  let t2214 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_lt_mul(), @equal.gsym(@realax.real_of_num_add()), @realax.real_of_num_le(), t2213]))
  let t2211 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (y : Real) - y == x"))]))
  let t2210 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @real.real_pow_add()]))
  let t2209 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @arith.le_0(), @equal.gsym(@iterate.sum_lmul()), @arith.add_clauses()]))
  let t2208 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.spec(@term_syntax.parse_term("1"), @iterate.sum_offset())), @arith.sub_add(), @arith.add_clauses()]))
  let t2207 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + (x : Num) == n + (x + 1)"))]))
  let t2206 = @equal.gsym(@real.real_pow_add())
  let t2212 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul()), t2206])), t2207), t2208), t2209), t2210), t2211), @tactics.all_tac])
  let t2205 = @tactics.subgoal_then(@term_syntax.parse_term("pow((t : Real), (n : Num)) * sum(op_dot_dot(0, n), (m : Num) => pow(t, m)) - pow(t, n + 1) * sum(op_dot_dot(0, n - 1), (m : Num) => pow(t, m)) == pow(t, n)"), fn(x2202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2203 = @tactics.subst1_tac(x2202)
    fn(x2204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2203(x2204)
    }
  })
  let t2200 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (y : Real) && real_of_num(0) < (z : Real) → (x : Real) / y - (w : Real) / z == (x * z - w * y) / (y * z)"))
  let t2201 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), t2200]))
  let t2199 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t2198 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t2197 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) * (t : Real) - (y : Real) * (t * (z : Real)) <= (u : Real) * t - (v : Real) * (t * (w : Real))) == (t * (v * w - y * z) <= t * (u - x))"))]))
  let t2196 = @simp.rewrite_tac(@list.List([@arith.add_sub(), @real.real_inv_mul(), @realax.real_div()]))
  let t2195 = @simp.asm_simp_tac(@list.List([@iterate.real_sub_pow_l1(), @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) + 1"))]))
  let t2191 = @tactics.try_tac(@calc_rat.asm_real_arith_tac)
  let t2190 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2189 = @tactics.match_mp_tac(@real.real_pow_mono_inv())
  let t2188 = @simp.rewrite_tac(@list.List([]))
  let t2187 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t2192 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_mul_lid()])), t2187), @tactics.gen_tac), @tactics.strip_tac), t2188), t2189), t2190), t2191), @int.asm_arith_tac)
  let t2193 = @list.List([@simp.asm_simp_tac(@list.List([@iterate.sum_const_numseg(), @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → n - 1 + 1 == n")), @arith.sub_0(), @realax.real_le_refl()])), t2192])
  let t2186 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(0, (n : Num) - 1), (m : Num) => pow((t : Real), n))"))
  let t2185 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2184 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq()]))
  let t2183 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) / (y : Real) * real_of_num((n : Num)) == real_of_num(n) * x / y"))]))
  let t2182 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_rdiv_eq(), @real.real_of_num_lt(), @arith.le_1()]))
  let t2181 = @simp.gen_rewrite_tac(fn(x2178 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2179 = @equal.rand_conv(x2178)
    fn(x2180 : @kernel.Term) -> @kernel.Thm raise {
      s2179(x2180)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t2177 = @simp.asm_simp_tac(@list.List([@realax.real_div(), @calc_rat.real_field(@term_syntax.parse_term("abs((t : Real)) < real_of_num(1) → (x : Real) * (inv(real_of_num(1) - t) * (y : Real)) * (real_of_num(1) - t) == x * y"))]))
  let t2175 = @calc_rat.real_arith(@term_syntax.parse_term("abs((t : Real)) < real_of_num(1) → real_of_num(0) < real_of_num(1) - t"))
  let t2176 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_rdiv_eq(), @real.real_lt_mul(), @real.real_of_num_lt(), @arith.le_1(), t2175]))
  let t2174 = @simp.asm_rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul()]))
  let t2194 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@iterate.real_sub_pow_l1(), @realarith.real_sub_le()])), t2174), t2176), t2177), t2181), t2182), t2183), t2184), t2185), t2186), @tactics.conj_tac), t2193), @tactics.all_tac])
  let t2169 = @equal.gsym(@complexes.cx_inv())
  let t2170 = @equal.gsym(@complexes.cx_mul())
  let t2171 = @equal.gsym(@complexes.cx_div())
  let t2172 = @equal.gsym(@complexes.cx_pow())
  let t2173 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub()), t2172, t2171, t2170, t2169, @complexes.real_cx(), @complexes.re_cx()]))
  let t2168 = @simp.expand_tac("b")
  let t2167 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2165 = @simp.asm_simp_tac(@list.List([@iterate.sum_pos_le_numseg(), @real.real_pow_le()]))
  let t2164 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(0) < real_of_num(1) + x")))
  let t2166 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.simp_tac(@list.List([@arith.le_0(), @iterate.sum_clauses_left(), @realax.real_pow()]))), t2164), t2165), @tactics.all_tac])
  let t2163 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, real_of_num(0) < sum(op_dot_dot(0, n), (m : Num) => pow((t : Real), m))"), fn(x2160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2161 = @tactics.assume_tac(x2160)
    fn(x2162 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2161(x2162)
    }
  })
  let t2159 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.re_cx(), @complexes.complex_norm_cx()])))
  let t2155 = @simp.gen_rewrite_rule(fn(x2154 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2154
  }, @list.List([@complexes.real_exists()]))
  let t2156 = @tactics.x_choose_then(@term_syntax.parse_term("(t : Real)"))(fn(x2151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2152 = @tactics.subst_all_tac(x2151)
    fn(x2153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2152(x2153)
    }
  })
  let t2158 = @tactics.first_x_assum(fn(x2157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t2156(t2155(x2157))
  })
  let t2149 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t2148 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2147 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_num(), @realarith.real_mul_rid()]))
  let t2145 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @realarith.real_lt_refl(), @calc_int.real_abs_num()]))
  let t2144 = @tactics.undisch_tac(@term_syntax.parse_term("norm(Cx(real_of_num(1))) < real_of_num(1)"))
  let t2143 = @tactics.disch_then(fn(x2142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2140 = @tactics.subst_all_tac(x2139)
      fn(x2141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2140(x2141)
      }
    })(@equal.sym(x2142))
  })
  let t2138 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_0()]))
  let t2137 = @tactics.match_mp_tac(@complexes.complex_mul_rinv())
  let t2136 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_rdistrib()), @complexes.complex_inv_1()]))
  let t2135 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_1(), @complexes.complex_inv_mul(), @complexes.complex_div()]))
  let t2146 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("b"), t2135), t2136), t2137), t2138), t2143), t2144), t2145), @tactics.all_tac])
  let t2134 = @tactics.subgoal_then(@term_syntax.parse_term("(b : (Cart[Real, 2], Num) -> Cart[Real, 2])((z : Cart[Real, 2]), 1) == Cx(real_of_num(1))"), fn(x2131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2132 = @tactics.subst1_tac(x2131)
    fn(x2133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2132(x2133)
    }
  })
  let t2128 = @term_syntax.parse_term("1")
  let t2150 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_then(fn(x2130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2126 = @tactics.mp_tac(x2125)
      fn(x2127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2126(x2127)
      }
    })(((x2129 : @kernel.Thm) => @bool.spec(t2128, x2129))(x2130))
  }), t2134), t2146), t2147), t2148), t2149)])
  let t2124 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl()]))
  let t2120 = @term_syntax.parse_term("1")
  let t2121 = @term_syntax.parse_term("(B : Real)")
  let t2122 = @term_syntax.parse_term("(b : (Cart[Real, 2], Num) -> Cart[Real, 2])((z : Cart[Real, 2]))")
  let t2123 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])"), t2122, t2121, t2120]), @canal.series_dirichlet_complex_very_explicit()))
  let t2119 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2118 = @tactics.match_mp_tac(@metric.always_eventually())
  let t2117 = @simp.rewrite_tac(@list.List([@misc.from_inter_numseg()]))
  let t2116 = @simp.asm_simp_tac(@list.List([@metric.trivial_limit_sequentially(), @equal.gsym(@topology.sums())]))
  let t2115 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => vsum(INTER(from(1), op_dot_dot(0, n)), (k : Num) => (c : (Num) -> Cart[Real, 2])(k) * (b : (Cart[Real, 2], Num) -> Cart[Real, 2])((z : Cart[Real, 2]), k))"))
  let t2114 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_norm_ubound()))
  let t2113 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.norm_neg())]))
  let t2112 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2111 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t2110 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * (B : Real)"))
  let t2109 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : Real)"))
  let t2108 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ a : _, ∀ b : _, x == (f : (_, _) -> _)(a, b) → (p : (_, _) -> Bool)(a, b)) == (∀ a : _, ∀ b : _, p(a, b))"))]))
  let t2107 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @sets.in_univ(), @theorems.left_imp_exists_thm()]))
  let t2106 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t2105 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t2104 = @simp.rewrite_tac(@list.List([@topology.bounded_pos()]))
  let t2101 = @drule.match_mp(@topology.bounded_partial_sums())
  let t2103 = @tactics.disch_then(fn(x2102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2098 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2099 = @tactics.mp_tac(x2098)
      fn(x2100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2099(x2100)
      }
    })(t2101(x2102))
  })
  let t2097 = @simp.asm_rewrite_tac(@list.List([]))
  let t2095 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t2096 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t2095]), bounded_lfunction_partial_sums()))
  let t2093 = @meson.asm_meson_tac(@list.List([@prime.prime_0()]))
  let t2092 = @simp.asm_rewrite_tac(@list.List([@realax.real_mul_lid(), @realax.real_of_num_le(), @arith.le_exp()]))
  let t2091 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq(), @real.real_of_num_lt(), @arith.le_1(), @arith.exp_eq_0(), @prime.prime_imp_nz()]))
  let t2090 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (y : Real) <= real_of_num(1) → real_of_num(1) / real_of_num(2) <= real_of_num(1) - x * (y / real_of_num(2))")))
  let t2089 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) <= (a : Real) → a <= (x : Real) → b <= x")))
  let t2087 = @simp.asm_simp_tac(@list.List([@arith.exp_eq_0(), @arith.mult_eq_0(), @calc_num.arith(), @prime.prime_imp_nz()]))
  let t2086 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t2085 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t2084 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t2088 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@real.real_inv_mul()), @realax.real_of_num_mul()])), t2084), t2085), t2086), t2087), @tactics.all_tac])
  let t2083 = @simp.asm_rewrite_tac(@list.List([]))
  let t2081 = @term_syntax.parse_term("EXP((p : Num), (k : Num))")
  let t2082 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("inv(real_of_num(EXP((p : Num), (N : Num)))) / real_of_num(2)"), t2081]), lemma()))
  let t2079 = @simp.asm_simp_tac(@list.List([@class.eta_ax(), @complexes.re_cx(), @realax.real_le_refl()]))
  let t2076 = @term_syntax.parse_term("(k : Num)")
  let t2077 = @term_syntax.parse_term("(p : Num)")
  let t2078 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t2080 = @list.List([@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t2078, t2077, t2076]), dirichlet_character_divisorsum_eq_1())), t2079), @tactics.all_tac])
  let t2075 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2074 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2073 = @simp.rewrite_tac(@list.List([]))
  let t2072 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t2071 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t2070 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_const_numseg(), @arith.sub_0(), @equal.gsym(@realax.real_of_num_add())])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2069 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(0, (N : Num)), (k : Num) => real_of_num(1) * (real_of_num(1) / real_of_num(2)))"))
  let t2068 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2067 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t2066 = @tactics.disch_then(fn(x2063 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2064 = @tactics.subst1_tac(x2063)
    fn(x2065 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2064(x2065)
    }
  })
  let t2061 = @meson.asm_meson_tac(@list.List([@prime.prime_0(), @prime.prime_1()]))
  let t2062 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.eq_exp()])), t2061), @tactics.all_tac])
  let t2055 = @drule.part_match(fn(x2054 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2054))
  }, @iterate.sum_image())
  let t2049 = @simp.asm_simp_tac(@list.List([@arith.le_exp(), @prime.prime_imp_nz()]))
  let t2048 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (N : Num))"))
  let t2047 = @tactics.match_mp_tac(@arith.le_trans())
  let t2046 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t2045 = @simp.asm_simp_tac(@list.List([@arith.exp_eq_0(), @prime.prime_imp_nz()]))
  let t2044 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t2043 = @tactics.disch_then(fn(x2042 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2041 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @realax.real_le_mul(), @arith.le_1(), @class.eta_ax()]))
  let t2039 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t2040 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t2039]), dirichlet_character_divisorsum_pos()))
  let t2038 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg(), @sets.in_diff(), @sets.subset(), @sets.in_elim_thm(), @sets.forall_in_image()]))
  let t2050 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_subset_simple()), t2038), t2040), t2041), t2043), t2044), t2045), t2046), @tactics.strip_tac), t2047), t2048), t2049)])
  let t2037 = @tactics.exists_tac(@term_syntax.parse_term("sum(IMAGE((k : Num) => EXP((p : Num), k), op_dot_dot(0, (N : Num))), (x : Num) => Re(vsum({(d : Num) | divides(d, x)}, (d : Num) => (c : (Num) -> Cart[Real, 2])(d))) * pow((t : Real), x))"))
  let t2036 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2035 = @simp.simp_tac(@list.List([@complexes.re_vsum(), @iterate.finite_numseg(), @complexes.re_mul_cx(), @equal.gsym(@complexes.cx_pow())]))
  let t2034 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_ge_re_im()]))
  let t2033 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= Re((z : Cart[Real, 2])) && abs(Re(z)) <= norm(z) → a <= norm(z)")))
  let t2032 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("(B : Real) + real_of_num(1) <= norm((x : Cart[Real, _])) → norm((y : Cart[Real, _])) <= B → !(distance((x, y)) < real_of_num(1))")))
  let t2031 = @tactics.undisch_tac(@term_syntax.parse_term("norm((f : (Cart[Real, 2]) -> Cart[Real, 2])(Cx((t : Real)))) <= (B : Real)"))
  let t2030 = @simp.asm_rewrite_tac(@list.List([]))
  let t2026 = @term_syntax.parse_term("(n : Num)")
  let t2029 = @tactics.disch_then(fn(x2028 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2023 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2024 = @tactics.mp_tac(x2023)
      fn(x2025 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2024(x2025)
      }
    })(((x2027 : @kernel.Thm) => @bool.spec(t2026, x2027))(x2028))
  })
  let t2022 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (N : Num)) + ((M : Num) + 1)")), @int.arith_tac), @tactics.all_tac])
  let t2021 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Num, (M : Num) <= n && 1 <= n && EXP((p : Num), (N : Num)) <= n"), @tactics.strip_assume_tac)
  let t2020 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(M : Num)"))(fn(x2017 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2018 = @tactics.mp_tac(x2017)
    fn(x2019 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2018(x2019)
    }
  }))
  let t2016 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t2012 = @term_syntax.parse_term("real_of_num(1)")
  let t2015 = @tactics.disch_then(fn(x2014 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2009 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2010 = @tactics.mp_tac(x2009)
      fn(x2011 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2010(x2011)
      }
    })(((x2013 : @kernel.Thm) => @bool.spec(t2012, x2013))(x2014))
  })
  let t2008 = @simp.rewrite_tac(@list.List([@topology.series_from(), @topology.lim_sequentially()]))
  let t2007 = @simp.asm_rewrite_tac(@list.List([]))
  let t2003 = @term_syntax.parse_term("(t : Real)")
  let t2006 = @tactics.first_x_assum(fn(x2005 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2000 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2001 = @tactics.mp_tac(x2000)
      fn(x2002 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2001(x2002)
      }
    })(((x2004 : @kernel.Thm) => @bool.spec(t2003, x2004))(x2005))
  })
  let t1999 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @class.not_imp()]))
  let t1995 = @term_syntax.parse_term("Cx((t : Real))")
  let t1998 = @tactics.remove_then("+", fn(x1997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1992 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1993 = @tactics.mp_tac(x1992)
      fn(x1994 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1993(x1994)
      }
    })(((x1996 : @kernel.Thm) => @bool.spec(t1995, x1996))(x1997))
  })
  let t1990 = @simp.asm_simp_tac(@list.List([@real.real_inv_le_1(), @real.real_lt_inv_eq(), @realax.real_of_num_le(), @real.real_of_num_lt(), @arith.le_1(), @arith.exp_eq_0(), @prime.prime_imp_nz()]))
  let t1989 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (y : Real) && y <= real_of_num(1) → real_of_num(0) <= real_of_num(1) - y / real_of_num(2) && real_of_num(1) - y / real_of_num(2) < real_of_num(1)")))
  let t1991 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("t"), t1989), t1990), @tactics.all_tac])
  let t1988 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (t : Real) && t < real_of_num(1)"), @tactics.strip_assume_tac)
  let t1987 = @simp.abbrev_tac(@term_syntax.parse_term("(t : Real) == real_of_num(1) - inv(real_of_num(EXP((p : Num), (N : Num)))) / real_of_num(2)"))
  let t1986 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_lt())])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1985 = @tactics.subgoal_then(@term_syntax.parse_term("0 < (N : Num)"), fn(x1982 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1983 = @tactics.assume_tac(x1982)
    fn(x1984 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1983(x1984)
    }
  })
  let t1980 = @bool.spec(@term_syntax.parse_term("real_of_num(2) * ((B : Real) + real_of_num(1))"), @real.real_arch_simple())
  let t1981 = @tactics.x_choose_tac(@term_syntax.parse_term("(N : Num)"), t1980)
  let t1976 = @drule.match_mp(@prime.prime_factor())
  let t1977 = @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac)
  let t1979 = @tactics.first_assum(fn(x1978 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t1977(t1976(x1978))
  })
  let t1975 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t1974 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real) && abs(x) < real_of_num(1)) == (real_of_num(0) <= x && x < real_of_num(1))"))]))
  let t1973 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @complexes.re_cx(), @theorems.imp_imp()]))
  let t1972 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @complexes.forall_real()]))
  let t1971 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @sets.in_elim_thm()]))
  let t1970 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t2094 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.bounded_pos()])), t1970), t1971), t1972), t1973), t1974), t1975), t1979), t1981), t1985), t1986), t1987), t1988), t1991), t1998), t1999), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2006), t2007), @tactics.disch_tac), t2008), t2015), t2016), t2020), t2021), t2022), t2029), t2030), t2031), t2032), t2033), t2034), t2035), t2036), t2037), @tactics.conj_tac), t2050), fn(x2060 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2059 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2057 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2056 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x2051 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s2052 = @tactics.mp_tac(x2051)
            fn(x2053 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s2052(x2053)
            }
          })(t2055(x2056))
        })(@kernel.rand(x2057))
      })((fn(x2058 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2058.1
      })(x2059))
    })(x2060)(x2060)
  }), @tactics.ants_tac), t2062), t2066), t2067), t2068), t2069), @tactics.conj_tac), t2070), t2071), t2072), @tactics.strip_tac), t2073), t2074), t2075), @tactics.conj_tac), t2080), t2082), t2083), @tactics.ants_tac), t2088), t2089), t2090), t2091), t2092), t2093), @tactics.all_tac])
  let t1969 = @tactics.subgoal_then(@term_syntax.parse_term("!bounded({(f : (Cart[Real, 2]) -> Cart[Real, 2])((t : Cart[Real, 2])) | real(t) && real_of_num(0) <= Re(t) && norm(t) < real_of_num(1)})"), fn(x1966 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1967 = @tactics.mp_tac(x1966)
    fn(x1968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1967(x1968)
    }
  })
  let t1964 = @simp.asm_simp_tac(@list.List([@transcendentals.lim_n_times_pown()]))
  let t1963 = @tactics.match_mp_tac(@canal.lim_null_complex_lmul())
  let t1961 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @vectors.norm_pos_le()]))
  let t1960 = @tactics.match_mp_tac(@real.real_pow_mono_inv())
  let t1959 = @simp.gen_rewrite_tac(fn(x1956 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1957 = @equal.rand_conv(x1956)
    fn(x1958 : @kernel.Term) -> @kernel.Thm raise {
      s1957(x1958)
    }
  }, @list.List([@equal.gsym(@real.real_pow_1())]))
  let t1955 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_num(), @complexes.complex_norm_pow()]))
  let t1954 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((w : Cart[Real, 2])) == real_of_num(1) && norm((z : Cart[Real, _])) < real_of_num(1) && norm((zn : Cart[Real, 2])) <= norm(z) → abs(real_of_num(1) - norm(z)) <= norm(w - zn)")))
  let t1953 = @list.List([@meson.asm_meson_tac(@list.List([@realarith.real_lt_refl()])), @tactics.all_tac])
  let t1952 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < abs((x : Real) - (a : Real))) == !(a == x)"))]))
  let t1951 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1949 = @simp.asm_simp_tac(@list.List([@arith.division(), @arith.le_1()]))
  let t1948 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(m : Num) < (r : Num) → 1 <= r - m")))
  let t1947 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @vectors.norm_pos_le()]))
  let t1946 = @tactics.match_mp_tac(@real.real_pow_mono_inv())
  let t1945 = @simp.gen_rewrite_tac(fn(x1942 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1943 = @equal.rand_conv(x1942)
    fn(x1944 : @kernel.Term) -> @kernel.Thm raise {
      s1943(x1944)
    }
  }, @list.List([@equal.gsym(@real.real_pow_1())]))
  let t1950 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_pow()])), t1945), t1946), t1947), t1948), t1949), @tactics.all_tac])
  let t1941 = @simp.simp_tac(@list.List([@vectors.norm_pos_le(), @real.real_le_inv_eq()]))
  let t1940 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1939 = @simp.simp_tac(@list.List([@complexes.complex_div(), @realax.real_div(), @complexes.complex_norm_mul(), @complexes.complex_norm_inv()]))
  let t1938 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t1937 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1936 = @simp.gen_rewrite_tac(fn(x1933 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1934 = @equal.rand_conv(x1933)
    fn(x1935 : @kernel.Term) -> @kernel.Thm raise {
      s1934(x1935)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t1932 = @simp.asm_simp_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @real.real_le_div(), @real.real_abs_pos(), @vectors.norm_pos_le(), @realax.real_le_mul(), @realax.real_mul_lid(), @vectors.real_abs_norm()]))
  let t1931 = @tactics.first_assum(fn(x1929 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x1929
    @simp.simp_tac(@list.List([@drule.match_mp(dirichlet_character_norm())(t)]))
  })
  let t1928 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t1927 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1926 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t1925 = @tactics.match_mp_tac(@iterate.sum_bound())
  let t1924 = @simp.gen_rewrite_tac(fn(x1923 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1919 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1913 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1914 = @equal.rand_conv(x1913)
        fn(x1915 : @kernel.Term) -> @kernel.Thm raise {
          s1914(x1915)
        }
      })((fn(x1916 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1917 = @equal.land_conv(x1916)
        fn(x1918 : @kernel.Term) -> @kernel.Thm raise {
          s1917(x1918)
        }
      })(x1919))
    })((fn(x1920 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1921 = @equal.rand_conv(x1920)
      fn(x1922 : @kernel.Term) -> @kernel.Thm raise {
        s1921(x1922)
      }
    })(x1923))
  }, @list.List([@equal.gsym(@iterate.card_numseg_1())]))
  let t1912 = @simp.gen_rewrite_tac(fn(x1909 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1910 = @equal.rand_conv(x1909)
    fn(x1911 : @kernel.Term) -> @kernel.Thm raise {
      s1910(x1911)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (real_of_num((x : Num)) * (b : Real)) == real_of_num(x) * (a * b)"))]))
  let t1908 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @complexes.complex_norm_mul(), @complexes.complex_norm_cx(), @real.real_abs_div(), @calc_int.real_abs_num()]))
  let t1907 = @tactics.match_mp_tac(@vectors.vsum_norm_triangle())
  let t1906 = @simp.rewrite_tac(@list.List([]))
  let t1905 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t1962 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.always_eventually()), t1905), t1906), t1907), t1908), t1912), t1924), t1925), t1926), t1927), t1928), @tactics.strip_tac), t1931), @class.cond_cases_tac), t1932), t1936), t1937), t1938), t1939), t1940), t1941), @tactics.conj_tac), t1950), t1951), t1952), @tactics.conj_tac), t1953), t1954), t1955), t1959), t1960), t1961), @tactics.all_tac])
  let t1904 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num) => Cx(norm((z : Cart[Real, 2])) / (real_of_num(1) - norm(z))) * (Cx(real_of_num(x)) * pow(z, x))"))
  let t1903 = @tactics.match_mp_tac(@canal.lim_null_comparison_complex())
  let t1902 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0()]))
  let t1900 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t1898 = @term_syntax.parse_term("(n : Num)")
  let t1899 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t1898]), @arith.division()))
  let t1897 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1896 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_pow_add())]))
  let t1895 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(zx : Cart[Real, 2]) * (cn : Cart[Real, 2]) * (zn : Cart[Real, 2]) == cn * (zx * zn)"))]))
  let t1894 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_mul(), @complexes.complex_mul_assoc()]))
  let t1893 = @simp.rewrite_tac(@list.List([]))
  let t1892 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1891 = @tactics.match_mp_tac(@vectors.vsum_eq_numseg())
  let t1890 = @simp.rewrite_tac(@list.List([]))
  let t1889 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t1901 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.always_eventually()), t1889), t1890), t1891), t1892), @tactics.strip_tac), t1893), t1894), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1895), @tactics.ap_term_tac), t1896), @tactics.ap_term_tac), t1897), t1899), t1900), @int.arith_tac), @tactics.all_tac])
  let t1888 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num) => vsum(op_dot_dot(1, x), (n : Num) => pow((z : Cart[Real, 2]), x) * ((c : (Num) -> Cart[Real, 2])(n) * (pow(z, n - MOD(x, n)) / (Cx(real_of_num(1)) - pow(z, n)))))"))
  let t1887 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t1886 = @simp.simp_tac(@list.List([@complexes.complex_pow_pow()]))
  let t1885 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(zx : Cart[Real, 2]) * (i : Cart[Real, 2]) - (zx - (w : Cart[Real, 2])) * i == w * i"))]))
  let t1884 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_1(), @complexes.complex_div()]))
  let t1883 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_pow_eq_1(), @arith.le_1(), @realarith.real_lt_refl()])), @tactics.all_tac])
  let t1882 = @tactics.subgoal_then(@term_syntax.parse_term("∀ k : Num, 1 <= k → !(pow((z : Cart[Real, 2]), k) == Cx(real_of_num(1)))"), fn(x1880 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1880
    @simp.simp_tac(@list.List([th_1]))
  })
  let t1879 = @simp.simp_tac(@list.List([@equal.gsym(@arith.not_le())]))
  let t1878 = @simp.simp_tac(@list.List([@arith.div_eq_0(), @arith.le_1()]))
  let t1877 = @simp.rewrite_tac(@list.List([@complexes.vsum_gp(), @int.arith_rule(@term_syntax.parse_term("((n : Num) < 1) == (n == 0)"))]))
  let t1876 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_pow_pow())]))
  let t1875 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1874 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_ldistrib())]))
  let t1873 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_sub()), @iterate.finite_numseg()]))
  let t1872 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform()))
  let t1871 = @simp.simp_tac(@list.List([@complexes.vsum_complex_lmul(), @iterate.finite_numseg(), @topology.sums(), @misc.from_inter_numseg()]))
  let t1870 = @simp.asm_rewrite_tac(@list.List([]))
  let t1866 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1869 = @tactics.remove_then("+", fn(x1868 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1863 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1864 = @tactics.mp_tac(x1863)
      fn(x1865 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1864(x1865)
      }
    })(((x1867 : @kernel.Thm) => @bool.spec(t1866, x1867))(x1868))
  })
  let t1862 = @simp.rewrite_tac(@list.List([vsum_vsum_divisors()]))
  let t1861 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.vsum_complex_rmul()), @prime.finite_divisors(), @arith.le_1()]))
  let t1860 = @simp.rewrite_tac(@list.List([@topology.sums(), @misc.from_inter_numseg()]))
  let t1965 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1860), t1861), t1862), t1869), t1870), t1871), t1872), t1873), t1874), t1875), t1876), t1877), t1878), t1879), t1882), t1883), t1884), t1885), t1886), t1887), t1888), @tactics.conj_tac), t1901), t1902), t1903), t1904), @tactics.conj_tac), t1962), t1963), t1964), @tactics.all_tac])
  let t1859 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], norm(z) < real_of_num(1) → sums((n : Num) => vsum({(d : Num) | divides(d, n)}, (d : Num) => (c : (Num) -> Cart[Real, 2])(d)) * pow(z, n), (f : (Cart[Real, 2]) -> Cart[Real, 2])(z), from(1))"), fn(x1856 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1857 = ((x1855 : @kernel.Thm) => @tactics.label_tac("+", x1855))(x1856)
    fn(x1858 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1857(x1858)
    }
  })
  let t1853 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_div()]))
  let t1851 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t1852 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t1851]), lfunction()))
  let t1850 = @tactics.match_mp_tac(@canal.series_complex_rmul())
  let t1849 = @tactics.subst1_tac(@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(0)) == Cx(real_of_num(0)) * inv(Cx(real_of_num(1)) - (z : Cart[Real, 2]))")))
  let t1848 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_mul(), @complexes.complex_mul_assoc()]))
  let t1847 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_sub_ldistrib())]))
  let t1846 = @tactics.match_mp_tac(@topology.series_sub())
  let t1845 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_ldistrib(), @equal.gsym(@complexes.complex_sub_lzero())]))
  let t1844 = @simp.expand_tac("b")
  let t1854 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1844), t1845), t1846), t1847), t1848), t1849), t1850), t1852), t1853), @tactics.all_tac])
  let t1843 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], norm(z) < real_of_num(1) → sums((n : Num) => (c : (Num) -> Cart[Real, 2])(n) * (b : (Cart[Real, 2], Num) -> Cart[Real, 2])(z, n), -(f : (Cart[Real, 2]) -> Cart[Real, 2])(z), from(1))"), fn(x1840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1841 = ((x1839 : @kernel.Thm) => @tactics.label_tac("*", x1839))(x1840)
    fn(x1842 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1841(x1842)
    }
  })
  let t1838 = @simp.abbrev_tac(@term_syntax.parse_term("(b : (Cart[Real, 2], Num) -> Cart[Real, 2]) == ((z : Cart[Real, 2]) => (n : Num) => inv(Cx(real_of_num(n)) * (Cx(real_of_num(1)) - z)) - pow(z, n) / (Cx(real_of_num(1)) - pow(z, n)))"))
  let t1837 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"))(fn(x1834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1835 = ((x1833 : @kernel.Thm) => @tactics.label_tac("+", x1833))(x1834)
    fn(x1836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1835(x1836)
    }
  }))
  let t1832 = @simp.rewrite_tac(@list.List([@topology.summable(), @class.right_imp_exists_thm(), @class.skolem_thm()]))
  let t1830 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @vectors.norm_pos_le()]))
  let t1829 = @tactics.match_mp_tac(@real.real_pow_mono_inv())
  let t1828 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_pow()]))
  let t1827 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t1826 = @tactics.exists_tac(@term_syntax.parse_term("pow(norm((z : Cart[Real, 2])), (N : Num))"))
  let t1825 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1824 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1823 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t1822 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((z : Cart[Real, 2])) <= norm((w : Cart[Real, 2])) - (h : Real) → h <= norm(w - z)")))
  let t1821 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1820 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1819 = @tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) == inv(real_of_num(1) / real_of_num(2))")))
  let t1818 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv()]))
  let t1817 = @simp.simp_tac(@list.List([@real.real_pow_le(), @vectors.norm_pos_le()]))
  let t1816 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1815 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_norm_mul(), @complexes.complex_norm_pow()]))
  let t1814 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t1813 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @vectors.real_abs_norm(), @calc_int.real_abs_num(), @real.real_abs_pow()]))
  let t1812 = @simp.rewrite_tac(@list.List([@arith.ge()]))
  let t1811 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1810 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1809 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1808 = @simp.asm_rewrite_tac(@list.List([]))
  let t1807 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1805 = @term_syntax.parse_term("real_of_num(1) / real_of_num(2)")
  let t1806 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("norm((z : Cart[Real, 2]))"), t1805]), @real.real_arch_pow_inv()))
  let t1804 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (if (q : Bool) { (x : Bool) } else { true })) == (p && q → x)"))]))
  let t1803 = @simp.simp_tac(@list.List([@calc_int.real_mul_lzero(), @realax.real_mul_lid(), @real.real_abs_pos(), @realax.real_le_mul()]))
  let t1802 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t1801 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t1800 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t1799 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t1798 = @tactics.first_assum(fn(x1796 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1796
    @simp.simp_tac(@list.List([@drule.match_mp(dirichlet_character_norm())(th)]))
  })
  let t1795 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t1794 = @simp.asm_simp_tac(@list.List([@complexes.cx_mul(), @complexes.cx_pow(), @canal.summable_complex_lmul(), @complexes.complex_norm_cx(), @vectors.real_abs_norm(), @canal.summable_gp()]))
  let t1793 = @simp.simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_pos(), @real.real_pow_le(), @vectors.norm_pos_le()]))
  let t1792 = @simp.rewrite_tac(@list.List([@complexes.real_cx(), @complexes.re_cx()]))
  let t1791 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => Cx(real_of_num(2) * pow(norm((z : Cart[Real, 2])), n))"))
  let t1790 = @tactics.match_mp_tac(@canal.series_comparison_complex())
  let t1788 = @tactics.conv_tac(@complexes.complex_ring)
  let t1787 = @simp.asm_simp_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_pow_zero(), @misc.in_from(), @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → !(n == 0)"))]))
  let t1786 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0()), @topology.summable_0()]))
  let t1785 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => Cx(real_of_num(0))"))
  let t1784 = @tactics.match_mp_tac(@topology.summable_eq())
  let t1783 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t1789 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.summable_from_elsewhere()), t1783), t1784), t1785), t1786), t1787), t1788), @tactics.all_tac])
  let t1782 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t1831 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1782), t1789), t1790), t1791), t1792), t1793), t1794), t1795), t1798), t1799), t1800), t1801), t1802), t1803), t1804), t1806), t1807), t1808), t1809), t1810), @tactics.disch_tac), t1811), t1812), @tactics.strip_tac), t1813), t1814), t1815), t1816), t1817), t1818), t1819), t1820), t1821), t1822), t1823), t1824), t1825), t1826), t1827), t1828), t1829), t1830), @tactics.all_tac])
  let t1781 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], norm(z) < real_of_num(1) → summable(from(1), (n : Num) => (c : (Num) -> Cart[Real, 2])(n) * (pow(z, n) / (Cx(real_of_num(1)) - pow(z, n))))"), fn(x1778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1779 = @tactics.mp_tac(x1778)
    fn(x1780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1779(x1780)
    }
  })
  let t1777 = @simp.asm_rewrite_tac(@list.List([]))
  let t1775 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t1776 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t1775]), dirichlet_character_nonprincipal_nontrivial()))
  let t2250 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1776), t1777), @tactics.strip_tac), t1781), t1831), t1832), t1837), t1838), t1843), t1854), t1859), t1965), t1969), t2094), t2096), t2097), t2103), t2104), t2105), t2106), t2107), t2108), t2109), @tactics.strip_tac), t2110), t2111), t2112), @tactics.strip_tac), t2113), t2114), t2115), t2116), t2117), t2118), t2119), t2123), t2124), @tactics.ants_tac), t2150), t2158), t2159), t2163), t2166), @tactics.conj_tac), t2167), @tactics.disch_tac), t2168), t2173), t2194), t2195), t2196), t2197), t2198), t2199), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2201), t2205), t2212), t2214), t2215), t2216), t2217), @tactics.conj_tac), t2220), t2222), t2224), t2225), t2226), t2234), t2236), t2242), t2243), t2244), @tactics.conj_tac), t2249)
  lfunction_nonzero_real_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) && (∀ n : Num, real(c(n))) → !(Lfunction(c) == Cx(real_of_num(0)))"), t2250))
}

///|
let lfunction_nonzero_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LFUNCTION_NONZERO_REAL")

///|
/// `LFUNCTION_NONZERO_REAL`
pub fn lfunction_nonzero_real() -> @kernel.Thm {
  lfunction_nonzero_real_c.get()
}

///|
/// BOUNDED_DIFF_LOGMUL
fn step_68() -> Unit raise {
  let t2268 = @simp.asm_rewrite_tac(@list.List([@transcendentals.real_exp_pos_lt()]))
  let t2269 = @tactics.then_tac(@tactics.match_mp_tac(@transcendentals.log_mono_le_imp()), t2268)
  let t2270 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.log_exp(), @real.real_neg_gt0(), @real.real_lt_div2_eq()])), @calc_rat.real_arith_tac), t2269])
  let t2267 = @tactics.exists_tac(@term_syntax.parse_term("log(exp(((B : Real) + real_of_num(1)) / -Re((a : Cart[Real, 2]))))"))
  let t2266 = @tactics.match_mp_tac(@realarith.real_lte_trans())
  let t2265 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_ldiv_eq()), @real.real_neg_gt0()]))
  let t2264 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(B : Real) < (l : Real) * -(a : Real) && real_of_num(0) <= (f : Real) → B < abs(f - l * a)")))
  let t2263 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @complexes.re_mul_cx(), @real.real_not_le()]))
  let t2262 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_norm_ge_re_im(), @realax.real_le_trans()])), @tactics.all_tac])
  let t2261 = @tactics.subgoal_then(@term_syntax.parse_term("abs(Re((f : (Num) -> Cart[Real, 2])((n : Num)) - Cx(log(real_of_num(n))) * (a : Cart[Real, 2]))) <= (B : Real)"), fn(x2258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2259 = @tactics.mp_tac(x2258)
    fn(x2260 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2259(x2260)
    }
  })
  let t2255 = @term_syntax.parse_term("(n : Num)")
  let t2257 = @tactics.disch_then((x2256 : @kernel.Thm) => @tactics.x_choose_tac(t2255, x2256))
  let t2254 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("exp(((B : Real) + real_of_num(1)) / -Re((a : Cart[Real, 2])))"), @real.real_arch_simple()))
  let t2253 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt())]))
  let t2252 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t2251 = @simp.rewrite_tac(@list.List([@topology.bounded_pos(), @sets.simple_image(), @sets.forall_in_image(), @sets.in_univ()]))
  let t2271 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2251), t2252), @tactics.disch_tac), t2253), @tactics.disch_tac), t2254), t2257), t2261), t2262), t2263), t2264), t2265), t2266), t2267), @tactics.conj_tac), t2270)
  bounded_diff_logmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 2], ∀ a : Cart[Real, 2], bounded({f((x : Num)) - Cx(log(real_of_num(x))) * a | IN(x, UNIV)}) → (∀ x : Num, real_of_num(0) <= Re(f(x))) → real_of_num(0) <= Re(a)"), t2271))
}

///|
let bounded_diff_logmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_DIFF_LOGMUL")

///|
/// `BOUNDED_DIFF_LOGMUL`
pub fn bounded_diff_logmul() -> @kernel.Thm {
  bounded_diff_logmul_c.get()
}

///|
/// LFUNCTION_NONZERO_NONPRINCIPAL
fn step_69() -> Unit raise {
  let t2275 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2274 = @simp.asm_rewrite_tac(@list.List([]))
  let t2273 = @tactics.match_mp_tac(@iterate.sum_union_eq())
  let t2272 = @tactics.conv_tac(@equal.sym_conv)
  let t2276 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2272), t2273), t2274), t2275)
  let lemma_1 = @tactics.prove(@term_syntax.parse_term("SUBSET({(a : _), (b : _), (c : _)}, (s : (_) -> Bool)) → FINITE(s) → (∀ f : (_) -> Real, sum(s, f) == sum(DIFF(s, {a, b, c}), f) + sum({a, b, c}, f))"), t2276)
  let t2378 = @simp.asm_simp_tac(@list.List([@complexes.cnj_eq_cx()]))
  let t2376 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t2377 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t2376]), lfunction_cnj()))
  let t2374 = @meson.asm_meson_tac(@list.List([lfunction_nonzero_real()]))
  let t2373 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.real_cnj()), @class.fun_eq_thm()]))
  let t2375 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.eq_sym_eq()])), t2373), t2374), @tactics.all_tac])
  let t2372 = @tactics.subgoal_then(@term_syntax.parse_term("!((c : (Num) -> Cart[Real, 2]) == ((n : Num) => cnj(c(n))))"), fn(x2369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2370 = @tactics.assume_tac(x2369)
    fn(x2371 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2370(x2371)
    }
  })
  let t2367 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))
  let t2366 = @simp.rewrite_tac(@list.List([@complexes.cnj_cnj(), @class.fun_eq_thm(), cnj_chi_0()]))
  let t2363 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2]) => (n : Num) => cnj(c(n))")
  let t2368 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2361 = @tactics.mp_tac(x2360)
      fn(x2362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2361(x2362)
      }
    })(((x2364 : @kernel.Thm) => @equal.ap_term(t2363, x2364))(x2365))
  }), t2366), t2367), @tactics.all_tac])
  let t2359 = @tactics.subgoal_then(@term_syntax.parse_term("!(chi_0((d : Num)) == ((n : Num) => cnj((c : (Num) -> Cart[Real, 2])(n))))"), fn(x2356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2357 = @tactics.assume_tac(x2356)
    fn(x2358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2357(x2358)
    }
  })
  let t2355 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses(), @sets.finite_insert(), @sets.in_insert(), @sets.not_in_empty(), @sets.finite_rules()]))
  let t2353 = @simp.simp_tac(@list.List([@sets.in_diff(), @sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm()]))
  let t2352 = @simp.simp_tac(@list.List([finite_dirichlet_characters(), @sets.finite_diff()]))
  let t2351 = @tactics.match_mp_tac(@iterate.sum_pos_le())
  let t2350 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_neg())]))
  let t2354 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= -(x : Real) → x <= real_of_num(0)"))), t2350), t2351), t2352), t2353), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2349 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) <= real_of_num(0) && (t : Real) < real_of_num(0) → s + t < real_of_num(0)")))
  let t2348 = @tactics.disch_then(fn(x2346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2346
    @simp.rewrite_tac(@list.List([th]))
  })
  let t2345 = @simp.rewrite_tac(@list.List([finite_dirichlet_characters()]))
  let t2342 = @drule.match_mp(lemma_1)
  let t2344 = @tactics.disch_then(fn(x2343 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2340 = @tactics.mp_tac(x2339)
      fn(x2341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2340(x2341)
      }
    })(t2342(x2343))
  })
  let t2337 = @simp.asm_simp_tac(@list.List([dirichlet_character_chi_0(), dirichlet_character_cnj()]))
  let t2336 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2338 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_insert(), @sets.not_in_empty()])), t2336), t2337), @tactics.all_tac])
  let t2335 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET({chi_0((d : Num)), (c : (Num) -> Cart[Real, 2]), (n : Num) => cnj(c(n))}, {(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)})"), fn(x2332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2333 = @tactics.mp_tac(x2332)
    fn(x2334 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2333(x2334)
    }
  })
  let t2331 = @simp.rewrite_tac(@list.List([]))
  let t2328 = @simp.gen_rewrite_rule(fn(x2327 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2327
  }, @list.List([@equal.gsym(@realarith.real_not_lt())]))
  let t2330 = @tactics.first_x_assum(fn(x2329 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2325 = @tactics.mp_tac(x2324)
      fn(x2326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2325(x2326)
      }
    })(t2328(x2329))
  })
  let t2323 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])"))
  let t2322 = @simp.rewrite_tac(@list.List([@complexes.re_neg(), @complexes.re_cx()]))
  let t2321 = @tactics.replicate_tac(2, @simp.once_rewrite_tac(@list.List([@class.cond_rand()])))
  let t2320 = @simp.simp_tac(@list.List([@complexes.re_vsum(), finite_dirichlet_characters()]))
  let t2318 = @simp.simp_tac(@list.List([dirichlet_character_sum_over_characters_pos(), @real.real_le_div(), @realarith.real_pos(), @mangoldt.mangoldt_pos_le()]))
  let t2317 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2316 = @simp.rewrite_tac(@list.List([]))
  let t2315 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2314 = @tactics.match_mp_tac(@iterate.sum_pos_le_numseg())
  let t2313 = @simp.simp_tac(@list.List([@complexes.re_vsum(), @iterate.finite_numseg(), @complexes.re_mul_cx()]))
  let t2312 = @simp.simp_tac(@list.List([@complexes.vsum_complex_rmul(), finite_dirichlet_characters()]))
  let t2311 = @tactics.disch_then(fn(x2308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2309 = @tactics.subst1_tac(x2308)
    fn(x2310 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2309(x2310)
    }
  })
  let t2307 = @simp.rewrite_tac(@list.List([finite_dirichlet_characters(), @iterate.finite_numseg()]))
  let t2300 = @drule.part_match(fn(x2299 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2299))
  }, @vectors.vsum_swap())
  let t2319 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)")), fn(x2306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2305 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2303 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2301 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x2296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s2297 = @tactics.mp_tac(x2296)
            fn(x2298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s2297(x2298)
            }
          })(t2300(x2301))
        })(((x2302 : @kernel.Term) => @lib.funpow(2, @kernel.rand, x2302))(x2303))
      })((fn(x2304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2304.1
      })(x2305))
    })(x2306)(x2306)
  }), t2307), t2311), t2312), t2313), t2314), t2315), @tactics.strip_tac), t2316), t2317), t2318), @tactics.all_tac])
  let t2295 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t2292 = @drule.match_mp(bounded_diff_logmul())
  let t2294 = @tactics.disch_then(fn(x2293 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2290 = @tactics.mp_tac(x2289)
      fn(x2291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2290(x2291)
      }
    })(t2292(x2293))
  })
  let t2288 = @simp.simp_tac(@list.List([@vectors.vsum_sub(), finite_dirichlet_characters(), @complexes.vsum_complex_lmul()]))
  let t2286 = @meson.asm_meson_tac(@list.List([bounded_dirichlet_mangoldt_zero(), bounded_dirichlet_mangoldt_nonzero(), @arith.le_1()]))
  let t2285 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_rzero(), @complexes.complex_mul_rneg(), @complexes.complex_mul_rzero(), @complexes.complex_mul_rid(), @complexes.complex_sub_rneg()]))
  let t2284 = @class.asm_cases_tac(@term_syntax.parse_term("Lfunction((c : (Num) -> Cart[Real, 2])) == Cx(real_of_num(0))"))
  let t2283 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_rid(), bounded_dirichlet_mangoldt_principal(), @arith.le_1()]))
  let t2282 = @class.asm_cases_tac(@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2]) == chi_0((d : Num))"))
  let t2281 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])"))
  let t2287 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([finite_dirichlet_characters(), @sets.in_elim_thm()])), t2281), t2282), t2283), t2284), t2285), t2286), @tactics.all_tac])
  let t2278 = @term_syntax.parse_term("{(c : (Num) -> Cart[Real, 2]) | dirichlet_character((d : Num), c)}")
  let t2279 = @term_syntax.parse_term("(UNIV : (Num) -> Bool)")
  let t2280 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Num) => (c : (Num) -> Cart[Real, 2]) => vsum(op_dot_dot(1, x), (n : Num) => c(n) * Cx(mangoldt(n) / real_of_num(n))) - Cx(log(real_of_num(x))) * (if c == chi_0((d : Num)) { Cx(real_of_num(1)) } else { if Lfunction(c) == Cx(real_of_num(0)) { -Cx(real_of_num(1)) } else { Cx(real_of_num(0)) } })"), t2279, t2278]), @topology.bounded_sums_images()))
  let t2277 = @list.List([@meson.asm_meson_tac(@list.List([dirichlet_character_0()])), @tactics.all_tac])
  let t2379 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))), t2277), t2280), @tactics.ants_tac), t2287), t2288), t2294), t2295), @tactics.ants_tac), t2319), t2320), t2321), t2322), @tactics.disch_tac), t2323), @tactics.strip_tac), @tactics.strip_tac), t2330), t2331), t2335), t2338), t2344), t2345), t2348), t2349), @tactics.conj_tac), t2354), t2355), t2359), t2368), t2372), t2375), t2377), t2378), @calc_rat.real_arith_tac)
  lfunction_nonzero_nonprincipal_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → !(Lfunction(c) == Cx(real_of_num(0)))"), t2379))
}

///|
let lfunction_nonzero_nonprincipal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LFUNCTION_NONZERO_NONPRINCIPAL")

///|
/// `LFUNCTION_NONZERO_NONPRINCIPAL`
pub fn lfunction_nonzero_nonprincipal() -> @kernel.Thm {
  lfunction_nonzero_nonprincipal_c.get()
}

///|
/// BOUNDED_DIRICHLET_MANGOLDT_NONPRINCIPAL
fn step_70() -> Unit raise {
  let t2382 = @meson.asm_meson_tac(@list.List([lfunction_nonzero_nonprincipal()]))
  let t2381 = @tactics.exists_tac(@term_syntax.parse_term("(d : Num)"))
  let t2380 = @tactics.match_mp_tac(bounded_dirichlet_mangoldt_nonzero())
  let t2383 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2380), t2381), t2382)
  bounded_dirichlet_mangoldt_nonprincipal_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ c : (Num) -> Cart[Real, 2], dirichlet_character(d, c) && !(c == chi_0(d)) → bounded({vsum(op_dot_dot(1, (x : Num)), (n : Num) => c(n) * Cx(mangoldt(n) / real_of_num(n))) | IN(x, UNIV)})"), t2383))
}

///|
let bounded_dirichlet_mangoldt_nonprincipal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_DIRICHLET_MANGOLDT_NONPRINCIPAL")

///|
/// `BOUNDED_DIRICHLET_MANGOLDT_NONPRINCIPAL`
pub fn bounded_dirichlet_mangoldt_nonprincipal() -> @kernel.Thm {
  bounded_dirichlet_mangoldt_nonprincipal_c.get()
}

///|
/// BOUNDED_SUM_OVER_DIRICHLET_CHARACTERS
fn step_71() -> Unit raise {
  let t2419 = @tactics.first_assum(fn(x2417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2417
    @simp.simp_tac(@list.List([@drule.match_mp(dirichlet_character_norm())(th_1)]))
  })
  let t2416 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2415 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2414 = @simp.gen_rewrite_tac(fn(x2411 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2412 = @equal.rand_conv(x2411)
    fn(x2413 : @kernel.Term) -> @kernel.Thm raise {
      s2412(x2413)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t2410 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2409 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2408 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t2407 = @simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()]))
  let t2406 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2405 = @simp.rewrite_tac(@list.List([@topology.bounded_pos()]))
  let t2404 = @simp.asm_rewrite_tac(@list.List([]))
  let t2402 = @term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])")
  let t2403 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t2402]), bounded_dirichlet_mangoldt_nonprincipal()))
  let t2420 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_sub_rzero()])), t2403), t2404), t2405), t2406), t2407), t2408), t2409), t2410), t2414), t2415), t2416), t2419), @calc_rat.real_arith_tac)
  let t2401 = @simp.asm_rewrite_tac(@list.List([chi_0(), @complexes.complex_mul_lid()]))
  let t2399 = @drule.match_mp(bounded_dirichlet_mangoldt_principal())
  let t2421 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x2400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2397 = @tactics.mp_tac(x2396)
      fn(x2398 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2397(x2398)
      }
    })(t2399(x2400))
  }), t2401), t2420])
  let t2395 = @simp.asm_rewrite_tac(@list.List([]))
  let t2394 = @class.asm_cases_tac(@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2]) == chi_0((d : Num))"))
  let t2393 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Num) -> Cart[Real, 2])"))
  let t2392 = @simp.rewrite_tac(@list.List([finite_dirichlet_characters(), @sets.in_elim_thm()]))
  let t2391 = @tactics.match_mp_tac(@topology.bounded_sums_images())
  let t2390 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.vsum_sub()), finite_dirichlet_characters()]))
  let t2388 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), dirichlet_character_chi_0()]))
  let t2389 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@vectors.vsum_delta(), @equal.gsym(@complexes.complex_vec_0())])), t2388), @tactics.all_tac])
  let t2387 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Num, Cx(log(real_of_num(x))) == vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character((d : Num), c)}, (c : (Num) -> Cart[Real, 2]) => if c == chi_0(d) { Cx(log(real_of_num(x))) } else { Cx(real_of_num(0)) })"), fn(x2385 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2385
    @simp.once_rewrite_tac(@list.List([th]))
  })
  let t2384 = @simp.rewrite_tac(@list.List([]))
  let t2422 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2384), t2387), t2389), t2390), t2391), t2392), t2393), @tactics.disch_tac), t2394), t2395), t2421)
  bounded_sum_over_dirichlet_characters_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ l : Num, 1 <= d && coprime((l, d)) → bounded({vsum({(c : (Num) -> Cart[Real, 2]) | dirichlet_character(d, c)}, (c : (Num) -> Cart[Real, 2]) => c(l) * vsum(op_dot_dot(1, (x : Num)), (n : Num) => c(n) * Cx(mangoldt(n) / real_of_num(n)))) - Cx(log(real_of_num(x))) | IN(x, UNIV)})"), t2422))
}

///|
let bounded_sum_over_dirichlet_characters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_SUM_OVER_DIRICHLET_CHARACTERS")

///|
/// `BOUNDED_SUM_OVER_DIRICHLET_CHARACTERS`
pub fn bounded_sum_over_dirichlet_characters() -> @kernel.Thm {
  bounded_sum_over_dirichlet_characters_c.get()
}

///|
/// DIRICHLET_MANGOLDT
fn step_72() -> Unit raise {
  let t2466 = @tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_vec_0()])))
  let t2465 = @tactics.conv_tac(@int.number_rule)
  let t2467 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((k : Num) * (l : Num), 1, mod((d : Num)))")), t2465), t2466])
  let t2464 = @tactics.subgoal_then(@term_syntax.parse_term("op_eq_eq((l : Num) * (n : Num), 1, mod((d : Num))) == op_eq_eq(n, (k : Num), mod(d))"), fn(x2461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2462 = @tactics.subst1_tac(x2461)
    fn(x2463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2462(x2463)
    }
  })
  let t2460 = @simp.asm_simp_tac(@list.List([dirichlet_character_sum_over_characters()]))
  let t2459 = @simp.simp_tac(@list.List([@complexes.vsum_complex_rmul(), finite_dirichlet_characters()]))
  let t2458 = @tactics.disch_then(fn(x2457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2456 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t2455 = @tactics.mp_tac(@equal.gsym(@bool.spec(@term_syntax.parse_term("(d : Num)"), dirichlet_character_mul())))
  let t2454 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc()]))
  let t2453 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2452 = @tactics.match_mp_tac(@vectors.vsum_eq_numseg())
  let t2451 = @tactics.disch_then(fn(x2448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2449 = @tactics.subst1_tac(x2448)
    fn(x2450 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2449(x2450)
    }
  })
  let t2447 = @simp.rewrite_tac(@list.List([finite_dirichlet_characters(), @iterate.finite_numseg()]))
  let t2441 = @drule.part_match(fn(x2440 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2440))
  }, @vectors.vsum_swap())
  let t2436 = @simp.simp_tac(@list.List([@vectors.vsum_restrict_set(), @iterate.finite_numseg()]))
  let t2435 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.vsum_complex_lmul()), @iterate.finite_numseg(), @sets.finite_restrict()]))
  let t2434 = @tactics.disch_then(fn(x2433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2432 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t2431 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (f : (_) -> _)(x) == (g : (_) -> _)(x)) → {f((x : _)) | IN(x, s)} == {g((x : _)) | IN(x, s)}")))
  let t2430 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2428 = @tactics.conv_tac(@int.number_rule)
  let t2427 = @tactics.undisch_tac(@term_syntax.parse_term("op_eq_eq((k : Num) * (l : Num), 1, mod((d : Num)))"))
  let t2429 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2427), t2428), @tactics.all_tac])
  let t2425 = @term_syntax.parse_term("(l : Num)")
  let t2426 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t2425]), bounded_sum_over_dirichlet_characters()))
  let t2424 = @list.List([@meson.asm_meson_tac(@list.List([@pocklington.cong_solve()])), @tactics.all_tac])
  let t2423 = @tactics.subgoal_then(@term_syntax.parse_term("∃ l : Num, op_eq_eq((k : Num) * l, 1, mod((d : Num)))"), @tactics.choose_tac)
  let t2468 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2423), t2424), t2426), @tactics.ants_tac), t2429), t2430), @tactics.ap_term_tac), t2431), t2432), t2434), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2435), t2436), fn(x2446 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2443 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2442 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x2437 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s2438 = @tactics.mp_tac(x2437)
            fn(x2439 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s2438(x2439)
            }
          })(t2441(x2442))
        })(@equal.lhand(x2443))
      })((fn(x2444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2444.1
      })(x2445))
    })(x2446)(x2446)
  }), t2447), t2451), t2452), t2453), @tactics.disch_tac), t2454), t2455), t2456), t2458), t2459), t2460), t2464), t2467)
  dirichlet_mangoldt_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ k : Num, 1 <= d && coprime((k, d)) → bounded({Cx(real_of_num(phi(d))) * vsum({(n : Num) | IN(n, op_dot_dot(1, (x : Num))) && op_eq_eq(n, k, mod(d))}, (n : Num) => Cx(mangoldt(n) / real_of_num(n))) - Cx(log(real_of_num(x))) | IN(x, UNIV)})"), t2468))
}

///|
let dirichlet_mangoldt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_MANGOLDT")

///|
/// `DIRICHLET_MANGOLDT`
pub fn dirichlet_mangoldt() -> @kernel.Thm {
  dirichlet_mangoldt_c.get()
}

///|
/// DIRICHLET_MANGOLDT_EXPLICIT
fn step_73() -> Unit raise {
  let t2493 = @simp.asm_simp_tac(@list.List([@real.real_sub_ldistrib(), @real.real_div_lmul(), @arith.le_1(), @pocklington.phi_lowerbound_1_strong(), @realax.real_of_num_eq()]))
  let t2492 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t2491 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_mul())]))
  let t2490 = @simp.gen_rewrite_tac(fn(x2489 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2483 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2484 = @equal.land_conv(x2483)
      fn(x2485 : @kernel.Term) -> @kernel.Thm raise {
        s2484(x2485)
      }
    })((fn(x2486 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2487 = @equal.rand_conv(x2486)
      fn(x2488 : @kernel.Term) -> @kernel.Thm raise {
        s2487(x2488)
      }
    })(x2489))
  }, @list.List([@equal.gsym(@calc_int.real_abs_num())]))
  let t2482 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2481 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @arith.le_1(), @pocklington.phi_lowerbound_1_strong(), @real.real_le_rdiv_eq()]))
  let t2480 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real) / real_of_num(phi((d : Num)))"))
  let t2479 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t2477 = @equal.gsym(@complexes.cx_mul())
  let t2478 = @simp.simp_tac(@list.List([@complexes.vsum_cx(), @sets.finite_restrict(), @iterate.finite_numseg(), @equal.gsym(@complexes.cx_sub()), t2477, @complexes.complex_norm_cx()]))
  let t2476 = @simp.simp_tac(@list.List([@sets.simple_image(), @sets.forall_in_image(), @sets.in_univ()]))
  let t2475 = @simp.rewrite_tac(@list.List([@topology.bounded_pos()]))
  let t2472 = @drule.match_mp(dirichlet_mangoldt())
  let t2474 = @tactics.first_assum(fn(x2473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2470 = @tactics.mp_tac(x2469)
      fn(x2471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2470(x2471)
      }
    })(t2472(x2473))
  })
  let t2494 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t2474), t2475), t2476), t2478), t2479), t2480), t2481), t2482), t2490), t2491), t2492), t2493)
  dirichlet_mangoldt_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ k : Num, 1 <= d && coprime((k, d)) → (∃ B : Real, real_of_num(0) < B && (∀ x : Num, abs(sum({(n : Num) | IN(n, op_dot_dot(1, x)) && op_eq_eq(n, k, mod(d))}, (n : Num) => mangoldt(n) / real_of_num(n)) - log(real_of_num(x)) / real_of_num(phi(d))) <= B))"), t2494))
}

///|
let dirichlet_mangoldt_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_MANGOLDT_EXPLICIT")

///|
/// `DIRICHLET_MANGOLDT_EXPLICIT`
pub fn dirichlet_mangoldt_explicit() -> @kernel.Thm {
  dirichlet_mangoldt_explicit_c.get()
}

///|
/// DIRICHLET_STRONG
fn step_74() -> Unit raise {
  let t2512 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t2511 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t2509 = @term_syntax.parse_term("{(n : Num) | IN(n, op_dot_dot(1, (x : Num))) && op_eq_eq(n, (k : Num), mod((d : Num)))}")
  let t2510 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t2509]), @mangoldt.mertens_mangoldt_versus_log()))
  let t2508 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (y : Real)) <= (a : Real) → abs(x - (z : Real)) <= (b : Real) → abs(y - z) <= b + a")))
  let t2504 = @term_syntax.parse_term("(x : Num)")
  let t2507 = @tactics.first_x_assum(fn(x2506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2501 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2502 = @tactics.mp_tac(x2501)
      fn(x2503 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2502(x2503)
      }
    })(((x2505 : @kernel.Thm) => @bool.spec(t2504, x2505))(x2506))
  })
  let t2500 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t2499 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real) + real_of_num(3)"))
  let t2495 = @drule.match_mp(dirichlet_mangoldt_explicit())
  let t2496 = @tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac)
  let t2498 = @tactics.first_assum(fn(x2497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t2496(t2495(x2497))
  })
  let t2513 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t2498), t2499), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2500), t2507), t2508), t2510), t2511), t2512)
  dirichlet_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ k : Num, 1 <= d && coprime((k, d)) → (∃ B : Real, real_of_num(0) < B && (∀ x : Num, abs(sum({(p : Num) | IN(p, op_dot_dot(1, x)) && prime(p) && op_eq_eq(p, k, mod(d))}, (p : Num) => log(real_of_num(p)) / real_of_num(p)) - log(real_of_num(x)) / real_of_num(phi(d))) <= B))"), t2513))
}

///|
let dirichlet_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET_STRONG")

///|
/// `DIRICHLET_STRONG`
pub fn dirichlet_strong() -> @kernel.Thm {
  dirichlet_strong_c.get()
}

///|
/// DIRICHLET
fn step_75() -> Unit raise {
  let t2555 = @simp.asm_simp_tac(@list.List([]))
  let t2554 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @iterate.in_numseg()]))
  let t2553 = @tactics.replicate_tac(4, @tactics.ap_term_tac)
  let t2550 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (a : Real) → x == (y : Real) → y <= a")))
  let t2552 = @tactics.first_x_assum(fn(x2551 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2550(x2551))
  })
  let t2549 = @simp.asm_simp_tac(@list.List([@transcendentals.exp_log(), @real.real_of_num_lt(), @arith.le_1()]))
  let t2548 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_mono_le())]))
  let t2547 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t2546 = @simp.asm_simp_tac(@list.List([@realarith.real_not_lt(), @real.real_le_rdiv_eq(), @pocklington.phi_lowerbound_1_strong(), @real.real_of_num_lt(), @arith.le_1()]))
  let t2543 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (y : Real)) <= (b : Real) → y < real_of_num(1) + (b + x)")))
  let t2545 = @tactics.disch_then(fn(x2544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2540 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2541 = @tactics.mp_tac(x2540)
      fn(x2542 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2541(x2542)
      }
    })(t2543(x2544))
  })
  let t2536 = @term_syntax.parse_term("(m : Num)")
  let t2539 = @tactics.first_x_assum(fn(x2538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2533 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2534 = @tactics.mp_tac(x2533)
      fn(x2535 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2534(x2535)
      }
    })(((x2537 : @kernel.Thm) => @bool.spec(t2536, x2537))(x2538))
  })
  let t2532 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t2531 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @real.real_max_le(), @realax.real_of_num_le()]))
  let t2530 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("max(exp(real_of_num(phi((d : Num))) * (real_of_num(1) + ((B : Real) + sum({(p : Num) | IN(p, op_dot_dot(1, (n : Num))) && prime(p) && op_eq_eq(p, (k : Num), mod(d))}, (p : Num) => log(real_of_num(p)) / real_of_num(p))))), max(real_of_num(n), real_of_num(1)))"), @real.real_arch_simple()))
  let t2529 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t2528 = @simp.asm_rewrite_tac(@list.List([]))
  let t2526 = @term_syntax.parse_term("(k : Num)")
  let t2527 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Num)"), t2526]), dirichlet_strong()))
  let t2525 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2524 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @class.not_exists_thm()]))
  let t2521 = @drule.match_mp(@misc.upper_bound_finite_set())
  let t2518 = @term_syntax.parse_term("(n : Num) => n")
  let t2523 = @tactics.first_assum(fn(x2522 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2515 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2516 = @tactics.mp_tac(x2515)
        fn(x2517 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2516(x2517)
        }
      })(((x2519 : @kernel.Thm) => @bool.spec(t2518, x2519))(x2520))
    })(t2521(x2522))
  })
  let t2514 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2556 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.infinite()])), t2514), t2523), t2524), t2525), @tactics.disch_tac), t2527), t2528), t2529), t2530), t2531), t2532), @tactics.strip_tac), t2539), t2545), t2546), t2547), t2548), t2549), t2552), t2553), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2554), @tactics.gen_tac), @tactics.eq_tac), t2555), @int.asm_arith_tac)
  dirichlet_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Num, ∀ k : Num, 1 <= d && coprime((k, d)) → INFINITE({(p : Num) | prime(p) && op_eq_eq(p, k, mod(d))})"), t2556))
}

///|
let dirichlet_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRICHLET")

///|
/// `DIRICHLET`
pub fn dirichlet() -> @kernel.Thm {
  dirichlet_c.get()
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
}
