// Translated from upstream 100/pnt.ml; edit this file directly.

///|
/// 100/pnt.ml:9
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// 100/pnt.ml:10
fn step_2() -> Unit raise {
  @complexes.prioritize_complex(())
}

///|
/// LT_NORM_CPOW_NUM
fn step_3() -> Unit raise {
  let t2 = @simp.simp_tac(@list.List([@real.real_lt_mul(), @transcendentals.log_pos_lt(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 1 < n"))]))
  let t1 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_0()), @transcendentals.real_exp_mono_lt()]))
  let t3 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 0 < n"))])), t1), t2)
  lt_norm_cpow_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], real_of_num(0) < Re(s) && 2 <= n → real_of_num(1) < norm(cpow(Cx(real_of_num(n)), s))"), t3))
}

///|
let lt_norm_cpow_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_NORM_CPOW_NUM")

///|
/// `LT_NORM_CPOW_NUM`
pub fn lt_norm_cpow_num() -> @kernel.Thm {
  lt_norm_cpow_num_c.get()
}

///|
/// CPOW_NUM_NE_1
fn step_4() -> Unit raise {
  let t12 = @simp.asm_simp_tac(@list.List([lt_norm_cpow_num(), @complexes.complex_norm_cx(), @calc_int.real_abs_num(), @real.real_lt_imp_ne()]))
  let t8 = @term_syntax.parse_term("(norm : (Cart[Real, 2]) -> Real)")
  let t11 = @tactics.first_x_assum(fn(x10 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x7 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s5 = @tactics.mp_tac(x4)
        fn(x6 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s5(x6)
        }
      })(@equal.sym(x7))
    })(((x9 : @kernel.Thm) => @equal.ap_term(t8, x9))(x10))
  })
  let t13 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t11), t12)
  cpow_num_ne_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], real_of_num(0) < Re(s) && 2 <= n → !(cpow(Cx(real_of_num(n)), s) == Cx(real_of_num(1)))"), t13))
}

///|
let cpow_num_ne_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CPOW_NUM_NE_1")

///|
/// `CPOW_NUM_NE_1`
pub fn cpow_num_ne_1() -> @kernel.Thm {
  cpow_num_ne_1_c.get()
}

///|
/// FINITE_ATMOST
fn step_5() -> Unit raise {
  let t16 = @simp.simp_tac(@list.List([@arith.le_0(), @iterate.finite_numseg(), @sets.subset(), @sets.in_elim_thm(), @iterate.in_numseg()]))
  let t15 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t14 = @tactics.match_mp_tac(@sets.finite_subset())
  let t17 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t14), t15), t16)
  finite_atmost_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ n : Num, FINITE({(m : Num) | P(m) && m <= n})"), t17))
}

///|
let finite_atmost_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_ATMOST")

///|
/// `FINITE_ATMOST`
pub fn finite_atmost() -> @kernel.Thm {
  finite_atmost_c.get()
}

///|
/// PRIME_ATMOST_ALT
fn step_6() -> Unit raise {
  let t24 = @drule.match_mp(@prime.prime_imp_nz())
  let t26 = @tactics.first_assum(fn(x25 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s22 = @tactics.mp_tac(x21)
      fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s22(x23)
      }
    })(t24(x25))
  })
  let t20 = @simp.asm_rewrite_tac(@list.List([]))
  let t19 = @class.asm_cases_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t18 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t27 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @iterate.in_numseg()])), t18), t19), t20), t26), @int.arith_tac)
  prime_atmost_alt_c.set(@tactics.prove(@term_syntax.parse_term("{(p : Num) | prime(p) && p <= (n : Num)} == {(p : Num) | IN(p, op_dot_dot(1, n)) && prime(p)}"), t27))
}

///|
let prime_atmost_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIME_ATMOST_ALT")

///|
/// `PRIME_ATMOST_ALT`
pub fn prime_atmost_alt() -> @kernel.Thm {
  prime_atmost_alt_c.get()
}

///|
/// nearzeta
fn step_7() -> Unit raise {
  nearzeta_c.set(@pair.new_definition(@term_syntax.parse_term("(nearzeta : (Num, Cart[Real, 2]) -> Cart[Real, 2])((n : Num), (s : Cart[Real, 2])) == infsum(from(n), (m : Num) => (s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(m)), s) - (Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), s - Cx(real_of_num(1))) - Cx(real_of_num(1)) / cpow(Cx(real_of_num(m + 1)), s - Cx(real_of_num(1)))))")))
}

///|
let nearzeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nearzeta")

///|
/// `nearzeta`
pub fn nearzeta() -> @kernel.Thm {
  nearzeta_c.get()
}

///|
/// genzeta
fn step_8() -> Unit raise {
  genzeta_c.set(@pair.new_definition(@term_syntax.parse_term("(genzeta : (Num, Cart[Real, 2]) -> Cart[Real, 2])((n : Num), (s : Cart[Real, 2])) == (if s == Cx(real_of_num(1)) { complex_derivative(nearzeta(n), Cx(real_of_num(1))) } else { (nearzeta(n, s) + Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), s - Cx(real_of_num(1)))) / (s - Cx(real_of_num(1))) })")))
}

///|
let genzeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("genzeta")

///|
/// `genzeta`
pub fn genzeta() -> @kernel.Thm {
  genzeta_c.get()
}

///|
/// zeta
fn step_9() -> Unit raise {
  zeta_c.set(@pair.new_definition(@term_syntax.parse_term("(zeta : (Cart[Real, 2]) -> Cart[Real, 2])((s : Cart[Real, 2])) == genzeta(1, s)")))
}

///|
let zeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("zeta")

///|
/// `zeta`
pub fn zeta() -> @kernel.Thm {
  zeta_c.get()
}

///|
/// NEARZETA_BOUND_LEMMA
fn step_10() -> Unit raise {
  let t119 = @tactics.conv_tac(@complexes.complex_ring)
  let t118 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @complexes.cx_add(), @complexes.complex_div()]))
  let t117 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t116 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_num(), @real.real_pow_one(), @real.real_div_1(), @realarith.real_mul_rid()]))
  let t115 = @simp.rewrite_tac(@list.List([@vectors.vector_add_rid(), @complexes.complex_mul_lid()]))
  let t114 = @simp.rewrite_tac(@list.List([@topology.ends_in_segment(), @complexes.complex_norm_cx(), @complexes.complex_add_sub()]))
  let t109 = @term_syntax.parse_term("Cx(real_of_num((n : Num))) + Cx(real_of_num(1))")
  let t110 = @list.List([@term_syntax.parse_term("Cx(real_of_num((n : Num)))"), t109])
  let t113 = @tactics.disch_then(fn(x112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s107 = @tactics.mp_tac(x106)
      fn(x108 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s107(x108)
      }
    })(((x111 : @kernel.Thm) => @bool.specl(t110, x111))(x112))
  })
  let t105 = @simp.rewrite_tac(@list.List([@complexes.complex_pow(), @complexes.complex_pow_1(), @complexes.complex_div_1(), @complexes.complex_mul_rid()]))
  let t104 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t103 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith()]))
  let t102 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.finite_insert(), @sets.finite_rules()]))
  let t101 = @simp.rewrite_tac(@list.List([@iterate.numseg_conv(@term_syntax.parse_term("op_dot_dot(0, 1)"))]))
  let t99 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) <= (u : Real)"))
  let t98 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cmul(), @complexes.re_add(), @complexes.re_cx()]))
  let t97 = @simp.rewrite_tac(@list.List([@topology.segment(), @sets.in_elim_thm()]))
  let t96 = @tactics.undisch_tac(@term_syntax.parse_term("IN((z : Cart[Real, 2]), segment([(Cx(real_of_num((n : Num))), Cx(real_of_num(n)) + Cx(real_of_num(1)))]))"))
  let t95 = @simp.asm_simp_tac(@list.List([@transcendentals.exp_log(), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t94 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_mono_le())]))
  let t93 = @simp.asm_rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_cx()]))
  let t92 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t91 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()]))
  let t90 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t88 = @simp.asm_simp_tac(@list.List([@complexes.real_cx(), @complexes.real_add()]))
  let t86 = @term_syntax.parse_term("Cx(real_of_num((n : Num))) + Cx(real_of_num(1))")
  let t87 = @tactics.map_every(fn(x83 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s84 = @tactics.exists_tac(x83)
    fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s84(x85)
    }
  }, @list.List([@term_syntax.parse_term("Cx(real_of_num((n : Num)))"), t86]))
  let t89 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@complexes.real_segment()), t87), t88), @tactics.all_tac])
  let t82 = @tactics.subgoal_then(@term_syntax.parse_term("real((z : Cart[Real, 2]))"), fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s80 = @tactics.assume_tac(x79)
    fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s80(x81)
    }
  })
  let t78 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_nz(), @transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t77 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t76 = @simp.simp_tac(@list.List([@realax.real_le_mul(), @vectors.norm_pos_le()]))
  let t75 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t74 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc()]))
  let t73 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_div(), @complexes.complex_norm_pow()]))
  let t71 = @tactics.conv_tac(@complexes.complex_field)
  let t68 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t69 = @list.List([@simp.asm_rewrite_tac(@list.List([@transcendentals.cpow_eq_0()])), t68])
  let t70 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!(cpow((z : Cart[Real, 2]), (s : Cart[Real, 2])) == Cx(real_of_num(0)))"), fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s66 = @tactics.mp_tac(x65)
    fn(x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s66(x67)
    }
  }), t69)
  let t64 = @simp.simp_tac(@list.List([@complexes.complex_pow_2(), @transcendentals.cpow_add(), @transcendentals.cpow_sub(), @transcendentals.cpow_n(), @complexes.complex_pow_1()]))
  let t63 = @simp.asm_rewrite_tac(@list.List([@transcendentals.cpow_eq_0()]))
  let t62 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t59 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(i : Num) <= 1 → i == 0 || i == 1")))
  let t60 = @tactics.disj_cases_then(fn(x56 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s57 = @tactics.subst_all_tac(x56)
    fn(x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s57(x58)
    }
  })
  let t72 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x61 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t60(t59(x61))
  }), t62), @canal.complex_diff_tac), t63), t64), t70), t71), @tactics.all_tac])
  let t53 = @meson.asm_meson_tac(@list.List([@complexes.re_cx(), @realarith.real_lt_refl()]))
  let t54 = @list.List([@tactics.then_tac(@tactics.disch_then(fn(x50 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s51 = @tactics.subst_all_tac(x50)
    fn(x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s51(x52)
    }
  }), t53), @tactics.all_tac])
  let t49 = @tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"), fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s47 = @tactics.assume_tac(x46)
    fn(x48 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s47(x48)
    }
  })
  let t44 = @simp.asm_rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_cx(), @realax.real_of_num_add(), @real.real_of_num_lt()]))
  let t42 = @term_syntax.parse_term("Cx(real_of_num((n : Num))) + Cx(real_of_num(1))")
  let t43 = @tactics.map_every(fn(x39 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s40 = @tactics.exists_tac(x39)
    fn(x41 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s40(x41)
    }
  }, @list.List([@term_syntax.parse_term("Cx(real_of_num((n : Num)))"), t42]))
  let t45 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@complexes.re_pos_segment()), t43), t44), @int.asm_arith_tac), @tactics.all_tac])
  let t55 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < Re((z : Cart[Real, 2]))"), fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s37 = @tactics.assume_tac(x36)
    fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s37(x38)
    }
  }), t45), t49), t54)
  let t34 = @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac)
  let t33 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t35 = @list.List([@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(i : Num)"), t33])), @tactics.strip_tac), t34])
  let t100 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.convex_segment()])), @tactics.conj_tac), t35), t55), t72), t73), t74), t75), t76), t77), t78), t82), t89), t90), t91), t92), t93), t94), t95), t96), t97), @tactics.strip_tac), t98), t99), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t32 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t28 = @term_syntax.parse_term("norm((s : Cart[Real, 2]) * ((s - Cx(real_of_num(1))) / cpow(Cx(real_of_num((n : Num))), s + Cx(real_of_num(1)))))")
  let t29 = @term_syntax.parse_term("segment([(Cx(real_of_num((n : Num))), Cx(real_of_num(n)) + Cx(real_of_num(1)))])")
  let t30 = @term_syntax.parse_term("1")
  let t31 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (z : Cart[Real, 2]) => if n == 0 { Cx(real_of_num(1)) / cpow(z, (s : Cart[Real, 2]) - Cx(real_of_num(1))) } else { if n == 1 { (Cx(real_of_num(1)) - s) / cpow(z, s) } else { s * ((s - Cx(real_of_num(1))) / cpow(z, s + Cx(real_of_num(1)))) } }"), t30, t29, t28]), @canal.complex_taylor()))
  let t120 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t31), t32), @tactics.ants_tac), t100), t101), t102), t103), t104), t105), t113), t114), t115), t116), t117), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t118), t119)
  nearzeta_bound_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], ∀ n : Num, !(n == 0) && real_of_num(0) <= Re(s) + real_of_num(1) → norm((s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(n)), s) - (Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), s - Cx(real_of_num(1))) - Cx(real_of_num(1)) / cpow(Cx(real_of_num(n + 1)), s - Cx(real_of_num(1))))) <= norm(s * ((s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(n)), s + Cx(real_of_num(1)))))"), t120))
}

///|
let nearzeta_bound_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEARZETA_BOUND_LEMMA")

///|
/// `NEARZETA_BOUND_LEMMA`
pub fn nearzeta_bound_lemma() -> @kernel.Thm {
  nearzeta_bound_lemma_c.get()
}

///|
/// NORM_CPOW_LOWERBOUND
fn step_11() -> Unit raise {
  let t128 = @simp.simp_tac(@list.List([@realax.real_of_num_le()]))
  let t127 = @simp.asm_simp_tac(@list.List([@transcendentals.real_exp_0(), @transcendentals.exp_log(), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t126 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_mono_le())]))
  let t125 = @simp.asm_rewrite_tac(@list.List([]))
  let t124 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t129 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()])), t124), t125), t126), t127), t128), @int.asm_arith_tac)
  let t130 = @list.List([@simp.asm_simp_tac(@list.List([@transcendentals.real_exp_n(), @transcendentals.exp_log(), @real.real_of_num_lt(), @arith.lt_nz(), @realax.real_le_refl()])), t129])
  let t123 = @tactics.exists_tac(@term_syntax.parse_term("exp(real_of_num((m : Num)) * log(real_of_num((n : Num))))"))
  let t122 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t121 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t131 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t121), t122), t123), @tactics.conj_tac), t130)
  norm_cpow_lowerbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ s : Cart[Real, 2], ∀ n : Num, real_of_num(m) <= Re(s) && !(n == 0) → pow(real_of_num(n), m) <= norm(cpow(Cx(real_of_num(n)), s))"), t131))
}

///|
let norm_cpow_lowerbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_CPOW_LOWERBOUND")

///|
/// `NORM_CPOW_LOWERBOUND`
pub fn norm_cpow_lowerbound() -> @kernel.Thm {
  norm_cpow_lowerbound_c.get()
}

///|
/// ZETATERM_BOUND
fn step_12() -> Unit raise {
  let t135 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), norm_cpow_lowerbound(), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t134 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t133 = @tactics.repeat_tac(@tactics.strip_tac)
  let t132 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t136 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()])), t132), t133), t134), t135)
  zetaterm_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], ∀ n : Num, ∀ m : Num, real_of_num(m) <= Re(s) && !(n == 0) → norm(Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), s)) <= inv(pow(real_of_num(n), m))"), t136))
}

///|
let zetaterm_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETATERM_BOUND")

///|
/// `ZETATERM_BOUND`
pub fn zetaterm_bound() -> @kernel.Thm {
  zetaterm_bound_c.get()
}

///|
/// ZETA_CONVERGES_LEMMA
fn step_13() -> Unit raise {
  let t166 = @simp.asm_rewrite_tac(@list.List([]))
  let t165 = @tactics.match_mp_tac(norm_cpow_lowerbound())
  let t164 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num((n : Num)), 2) <= (x : Real) → real_of_num(n) * (real_of_num(n) - real_of_num(1)) <= x")))
  let t162 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t161 = @tactics.repeat_tac(@tactics.pop_assum(fn(x158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s159 = @tactics.mp_tac(x158)
    fn(x160 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s159(x160)
    }
  }))
  let t163 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_mul()), t161), t162), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t157 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t156 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t155 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t153 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(2) <= (x : Real) → inv(x - real_of_num(1)) - inv(x + real_of_num(1) - real_of_num(1)) == inv(x * (x - real_of_num(1)))"))
  let t154 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @realax.real_of_num_le(), t153]))
  let t152 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t151 = @simp.rewrite_tac(@list.List([@arith.ge(), @misc.in_from()]))
  let t150 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t148 = @simp.rewrite_tac(@list.List([@topology.seq_harmonic()]))
  let t146 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) - real_of_num(1) == x"))
  let t147 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t146]))
  let t145 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t144 = @tactics.match_mp_tac(@topology.seq_offset_rev())
  let t143 = @tactics.disch_then(@tactics.match_mp_tac)
  let t142 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_sub()]))
  let t140 = @term_syntax.parse_term("(n : Num)")
  let t141 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => lift(inv(real_of_num(n) - real_of_num(1)))"), t140]), @topology.series_diffs()))
  let t149 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("lift(inv(real_of_num((n : Num)) - real_of_num(1)))")), t141), t142), t143), t144), t145), t147), t148), @tactics.all_tac])
  let t139 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => inv(real_of_num(n) - real_of_num(1)) - inv(real_of_num(n + 1) - real_of_num(1))"))
  let t138 = @tactics.match_mp_tac(@topology.series_comparison())
  let t137 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t167 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t137), t138), t139), @tactics.conj_tac), t149), t150), t151), t152), @tactics.strip_tac), t154), t155), t156), t157), @tactics.conj_tac), t163), t164), t165), t166), @int.asm_arith_tac)
  zeta_converges_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], real_of_num(2) <= Re(s) → summable(from(n), (m : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), s))"), t167))
}

///|
let zeta_converges_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETA_CONVERGES_LEMMA")

///|
/// `ZETA_CONVERGES_LEMMA`
pub fn zeta_converges_lemma() -> @kernel.Thm {
  zeta_converges_lemma_c.get()
}

///|
/// ZETADIFF_CONVERGES
fn step_14() -> Unit raise {
  let t228 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt()]))
  let t227 = @tactics.match_mp_tac(@transcendentals.exp_log())
  let t226 = @tactics.conv_tac(@equal.sym_conv)
  let t225 = @tactics.match_mp_tac(@real.real_eq_imp_le())
  let t224 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(N : Num) + 2 <= (n : Num) → N <= n"))]))
  let t223 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_le()]))
  let t222 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((n : Num))"))
  let t221 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t220 = @simp.asm_rewrite_tac(@list.List([]))
  let t219 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((N : Num))"))
  let t218 = @tactics.match_mp_tac(@realarith.real_lte_trans())
  let t217 = @simp.asm_rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@real.real_inv_mul())]))
  let t216 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_mono_lt())]))
  let t215 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_ldiv_eq())]))
  let t214 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t213 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq(), @realax.real_mul_lid()]))
  let t212 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t211 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul()]))
  let t210 = @simp.asm_simp_tac(@list.List([@real.real_abs_div(), @calc_int.real_abs_num(), @real.real_abs_mul(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x"))]))
  let t208 = @tactics.undisch_tac(@term_syntax.parse_term("(N : Num) + 2 <= (n : Num)"))
  let t207 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt()]))
  let t209 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.log_pos_lt()), t207), t208), @int.arith_tac), @tactics.all_tac])
  let t206 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < log(real_of_num((n : Num)))"), fn(x203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s204 = @tactics.assume_tac(x203)
    fn(x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s204(x205)
    }
  })
  let t202 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.vector_sub_rzero(), @vectors.norm_lift()]))
  let t201 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t200 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 2"))
  let t197 = @term_syntax.parse_term("(N : Num)")
  let t199 = @tactics.disch_then((x198 : @kernel.Thm) => @tactics.x_choose_tac(t197, x198))
  let t196 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t194 = @drule.match_mp(@real.real_arch())(@real.real_lt_01())
  let t195 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("exp(inv(Re((s : Cart[Real, 2])) * (e : Real)))"), t194))
  let t193 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t192 = @simp.rewrite_tac(@list.List([@topology.lim_sequentially()]))
  let t190 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos_lt(), @real.real_lt_mul(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("2 <= (n : Num) → 1 < n"))]))
  let t189 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_le_x()]))
  let t188 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) && (real_of_num(0) <= x → real_of_num(1) + (u : Real) <= (v : Real)) → real_of_num(0) < x && u <= v")))
  let t187 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t186 = @simp.rewrite_tac(@list.List([@real.real_abs_inv(), @transcendentals.real_abs_exp(), @realax.real_div(), @realax.real_mul_lid()]))
  let t185 = @simp.rewrite_tac(@list.List([@vectors.norm_lift()]))
  let t184 = @tactics.repeat_tac(@tactics.strip_tac)
  let t183 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t191 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t183), t184), t185), t186), t187), t188), t189), t190), @tactics.all_tac])
  let t182 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_of_num(1) / (Re((s : Cart[Real, 2])) * log(real_of_num(n)))"))
  let t181 = @tactics.match_mp_tac(@topology.lim_null_comparison())
  let t179 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @vectors.vector_sub_refl(), @arith.le_1()]))
  let t178 = @tactics.repeat_tac(@tactics.strip_tac)
  let t177 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t176 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t180 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.lim_eventually()), t176), t177), t178), t179), @tactics.all_tac])
  let t175 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => lift(real_of_num(1) / exp(Re((s : Cart[Real, 2])) * log(real_of_num(n))))"))
  let t174 = @tactics.match_mp_tac(@topology.lim_transform())
  let t173 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t172 = @simp.once_rewrite_tac(@list.List([@topology.lim_null_norm()]))
  let t171 = @tactics.disch_then(@tactics.match_mp_tac)
  let t170 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_1(), @complexes.complex_div_1()]))
  let t168 = @term_syntax.parse_term("(n : Num)")
  let t169 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(m : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), (s : Cart[Real, 2]))"), t168]), @topology.series_diffs()))
  let t229 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t169), t170), t171), t172), t173), t174), t175), @tactics.conj_tac), t180), t181), t182), @tactics.conj_tac), t191), t192), t193), @tactics.strip_tac), t195), t196), t199), t200), t201), @tactics.strip_tac), t202), t206), t209), t210), t211), t212), t213), t214), t215), t216), t217), t218), t219), t220), t221), t222), t223), t224), t225), t226), t227), t228), @int.asm_arith_tac)
  zetadiff_converges_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], real_of_num(0) < Re(s) → sums((m : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), s) - Cx(real_of_num(1)) / cpow(Cx(real_of_num(m + 1)), s), Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), s), from(n))"), t229))
}

///|
let zetadiff_converges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETADIFF_CONVERGES")

///|
/// `ZETADIFF_CONVERGES`
pub fn zetadiff_converges() -> @kernel.Thm {
  zetadiff_converges_c.get()
}

///|
/// NEARZETA_CONVERGES_LEMMA
fn step_15() -> Unit raise {
  let t259 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inv()), @complexes.re_cx(), @complexes.re_add()]))
  let t258 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.le_1()]))
  let t257 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @realax.real_mul_lid(), @complexes.complex_norm_inv()]))
  let t256 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc()), @complexes.re_mul_cx(), @complexes.complex_div()]))
  let t255 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def())]))
  let t254 = @simp.rewrite_tac(@list.List([@misc.in_from(), @trivia.o_thm()]))
  let t253 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t252 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t251 = @tactics.match_mp_tac(@topology.summable_iff_eventually())
  let t250 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t249 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.summable())]))
  let t247 = @tactics.pop_assum(fn(x244 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s245 = @tactics.mp_tac(x244)
    fn(x246 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s245(x246)
    }
  })
  let t243 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t242 = @tactics.match_mp_tac(zeta_converges_lemma())
  let t241 = @tactics.match_mp_tac(@canal.summable_complex_lmul())
  let t240 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t248 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.summable_component()), t240), t241), t242), t243), t247), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t239 = @tactics.subgoal_then(@term_syntax.parse_term("summable(from((n : Num)), (m : Num) => lift(op_dollar(Cx(norm((s : Cart[Real, 2]))) * Cx(norm(s - Cx(real_of_num(1)))) * (Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), Cx(Re(s) + real_of_num(1)))), 1)))"), fn(x236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s237 = @tactics.mp_tac(x236)
    fn(x238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s237(x238)
    }
  })
  let t234 = @simp.asm_simp_tac(@list.List([@misc.in_from(), @arith.ge(), @arith.le_1(), nearzeta_bound_lemma(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (s : Real) → real_of_num(0) <= s + real_of_num(1)"))]))
  let t235 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t234)])
  let t233 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => norm((s : Cart[Real, 2]) * ((s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(m)), s + Cx(real_of_num(1)))))"))
  let t232 = @tactics.match_mp_tac(@topology.series_comparison())
  let t231 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t230 = @simp.rewrite_tac(@list.List([nearzeta(), @topology.sums_infsum()]))
  let t260 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t230), t231), t232), t233), @tactics.conj_tac), t235), t239), t248), t249), t250), t251), t252), t253), t254), @tactics.disch_tac), @tactics.ap_term_tac), t255), t256), t257), @tactics.ap_term_tac), @tactics.ap_term_tac), t258), t259)
  nearzeta_converges_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], real_of_num(1) <= Re(s) → sums((m : Num) => (s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(m)), s) - (Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), s - Cx(real_of_num(1))) - Cx(real_of_num(1)) / cpow(Cx(real_of_num(m + 1)), s - Cx(real_of_num(1)))), nearzeta(n, s), from(n))"), t260))
}

///|
let nearzeta_converges_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEARZETA_CONVERGES_LEMMA")

///|
/// `NEARZETA_CONVERGES_LEMMA`
pub fn nearzeta_converges_lemma() -> @kernel.Thm {
  nearzeta_converges_lemma_c.get()
}

///|
/// GENZETA_CONVERGES
fn step_16() -> Unit raise {
  let t313 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_ac(), @complexes.complex_add_ac()]))
  let t312 = @simp.asm_simp_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_assoc(), @complexes.complex_mul_linv()]))
  let t310 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t309 = @tactics.pop_assum(fn(x306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s307 = @tactics.mp_tac(x306)
    fn(x308 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s307(x308)
    }
  })
  let t305 = @tactics.disch_then(fn(x302 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s303 = @tactics.subst_all_tac(x302)
    fn(x304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s303(x304)
    }
  })
  let t311 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_sub_0()])), t305), t309), t310), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t301 = @tactics.subgoal_then(@term_syntax.parse_term("!((s : Cart[Real, 2]) - Cx(real_of_num(1)) == Cx(real_of_num(0)))"), fn(x298 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s299 = @tactics.assume_tac(x298)
    fn(x300 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s299(x300)
    }
  })
  let t295 = @drule.match_mp(@canal.series_complex_lmul())
  let t292 = @term_syntax.parse_term("inv((s : Cart[Real, 2]) - Cx(real_of_num(1)))")
  let t297 = @tactics.disch_then(fn(x296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s290 = @tactics.mp_tac(x289)
        fn(x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s290(x291)
        }
      })(((x293 : @kernel.Thm) => @bool.spec(t292, x293))(x294))
    })(t295(x296))
  })
  let t287 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx()]))
  let t288 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) < Re((s : Cart[Real, 2]))")), t287), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t286 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) + ((b : Cart[Real, 2]) - a) == b")), genzeta()]))
  let t283 = @drule.match_mp(@topology.series_add())
  let t285 = @tactics.disch_then(fn(x284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s281 = @tactics.mp_tac(x280)
      fn(x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s281(x282)
      }
    })(t283(x284))
  })
  let t279 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t277 = @tactics.pop_assum(fn(x274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s275 = @tactics.mp_tac(x274)
    fn(x276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s275(x276)
    }
  })
  let t278 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re_sub(), @complexes.re_cx()])), t277), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t272 = @term_syntax.parse_term("(s : Cart[Real, 2]) - Cx(real_of_num(1))")
  let t273 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t272]), zetadiff_converges()))
  let t269 = @drule.match_mp(@realarith.real_lt_imp_le())
  let t267 = @drule.match_mp(nearzeta_converges_lemma())
  let t264 = @term_syntax.parse_term("(n : Num)")
  let t271 = @tactics.first_assum(fn(x270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x268 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x261 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s262 = @tactics.mp_tac(x261)
          fn(x263 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s262(x263)
          }
        })(((x265 : @kernel.Thm) => @bool.spec(t264, x265))(x266))
      })(t267(x268))
    })(t269(x270))
  })
  let t314 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t271), t273), @tactics.ants_tac), t278), t279), t285), t286), @class.cond_cases_tac), t288), t297), t301), t311), t312), t313)
  genzeta_converges_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → sums((m : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), s), genzeta(n, s), from(n))"), t314))
}

///|
let genzeta_converges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GENZETA_CONVERGES")

///|
/// `GENZETA_CONVERGES`
pub fn genzeta_converges() -> @kernel.Thm {
  genzeta_converges_c.get()
}

///|
/// ZETA_CONVERGES
fn step_17() -> Unit raise {
  let t315 = @simp.rewrite_tac(@list.List([zeta(), genzeta_converges()]))
  zeta_converges_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → sums((n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), s), zeta(s), from(1))"), t315))
}

///|
let zeta_converges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETA_CONVERGES")

///|
/// `ZETA_CONVERGES`
pub fn zeta_converges() -> @kernel.Thm {
  zeta_converges_c.get()
}

///|
/// COMPLEX_DERIVATIVE_ZETA_CONVERGES
fn step_18() -> Unit raise {
  let t404 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t403 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2]) - (s : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t402 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(1) < Re((z : Cart[Real, 2]))"), fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x400
    @simp.asm_simp_tac(@list.List([th, zeta_converges()]))
  })
  let t398 = @term_syntax.parse_term("from(1)")
  let t399 = @tactics.map_every(fn(x395 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s396 = @tactics.exists_tac(x395)
    fn(x397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s396(x397)
    }
  }, @list.List([@term_syntax.parse_term("(n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), (z : Cart[Real, 2]))"), t398]))
  let t394 = @tactics.match_mp_tac(@topology.series_unique())
  let t393 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t392 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_lt()]))
  let t391 = @tactics.exists_tac(@term_syntax.parse_term("Re((s : Cart[Real, 2])) - real_of_num(1)"))
  let t390 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((b : Bool) && (c : Bool) && (d : Bool) → (e : Bool)) == (b && c → d → e)"))]))(@canal.has_complex_derivative_transform_at()))
  let t389 = @tactics.disch_then(fn(x388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x384 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s385 = @tactics.mp_tac(x384)
        fn(x386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s385(x386)
        }
      })(@bool.conjunct2(x387))
    })(@bool.conjunct2(x388))
  })
  let t383 = @simp.simp_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("real_of_num(1) < Re((s : Cart[Real, 2]))"))]))
  let t379 = @term_syntax.parse_term("(s : Cart[Real, 2])")
  let t382 = @tactics.first_assum(fn(x381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s377 = @tactics.mp_tac(x376)
      fn(x378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s377(x378)
      }
    })(((x380 : @kernel.Thm) => @bool.spec(t379, x380))(x381))
  })
  let t375 = @tactics.match_mp_tac(@canal.has_complex_derivative_derivative())
  let t374 = @tactics.conv_tac(@equal.sym_conv)
  let t373 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t372 = @tactics.disch_then(fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x370 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s368 = @tactics.mp_tac(x367)
        fn(x369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s368(x369)
        }
      })(@bool.conjunct1(x370))
    })(@bool.conjunct2(x371))
  })
  let t366 = @simp.simp_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("real_of_num(1) < Re((s : Cart[Real, 2]))"))]))
  let t362 = @term_syntax.parse_term("(s : Cart[Real, 2])")
  let t365 = @tactics.first_assum(fn(x364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x359 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s360 = @tactics.mp_tac(x359)
      fn(x361 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s360(x361)
      }
    })(((x363 : @kernel.Thm) => @bool.spec(t362, x363))(x364))
  })
  let t357 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t358 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t357]))
  let t356 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @realax.real_gt()]))
  let t354 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t353 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2]) - (y : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t350 = @simp.gen_rewrite_rule(fn(x349 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x349
  }, @list.List([@topology.in_ball()]))
  let t352 = @tactics.first_x_assum(fn(x351 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s347 = @tactics.mp_tac(x346)
      fn(x348 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s347(x348)
      }
    })(t350(x351))
  })
  let t345 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le()]))
  let t344 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t343 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-((a : Real) * (x : Real)) <= -((b : Real) * x)) == (b * x <= a * x)"))]))
  let t342 = @tactics.repeat_tac(@tactics.strip_tac)
  let t341 = @simp.rewrite_tac(@list.List([@transcendentals.real_abs_exp(), @equal.gsym(@transcendentals.real_exp_neg()), @transcendentals.real_exp_mono_le()]))
  let t340 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_div()), @complexes.complex_norm_cx(), @calc_int.real_abs_num(), @complexes.real_cx(), @complexes.re_cx(), @realax.real_div(), @realax.real_mul_lid(), @real.real_le_inv_eq(), @transcendentals.real_exp_pos_le()]))
  let t339 = @simp.asm_simp_tac(@list.List([@misc.in_from(), @transcendentals.cpow_real_real(), @real.real_of_num_lt(), @complexes.re_cx(), @complexes.real_cx(), @arith.le_1(), @complexes.complex_norm_div(), @transcendentals.norm_cpow_real()]))
  let t337 = @meson.meson_tac(@list.List([@topology.summable()]))
  let t336 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re_cx()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t338 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(1) + (Re((z : Cart[Real, 2])) - real_of_num(1)) / real_of_num(2))"), zeta_converges())), @tactics.ants_tac), t336), t337), @tactics.all_tac])
  let t335 = @simp.asm_simp_tac(@list.List([@misc.real_half(), @realarith.real_sub_lt()]))
  let t332 = @term_syntax.parse_term("42")
  let t333 = @term_syntax.parse_term("(n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), Cx(real_of_num(1) + (Re((z : Cart[Real, 2])) - real_of_num(1)) / real_of_num(2)))")
  let t334 = @tactics.map_every(fn(x329 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s330 = @tactics.exists_tac(x329)
    fn(x331 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s330(x331)
    }
  }, @list.List([@term_syntax.parse_term("(Re((z : Cart[Real, 2])) - real_of_num(1)) / real_of_num(2)"), t333, t332]))
  let t328 = @simp.rewrite_tac(@list.List([@realax.real_gt()]))
  let t327 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t326 = @tactics.pop_assum(fn(x325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t324 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.le_1()]))
  let t323 = @list.List([@tactics.conv_tac(@complexes.complex_field), @tactics.all_tac])
  let t322 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && a → a && b")))
  let t321 = @tactics.repeat_tac(@tactics.strip_tac)
  let t355 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_from()])), t321), @canal.complex_diff_tac), t322), @tactics.conj_tac), t323), t324), @tactics.all_tac])), t326), t327), t328), @tactics.strip_tac), t334), t335), @tactics.conj_tac), t338), t339), t340), t341), t342), t343), t344), t345), t352), t353), t354), @vectors.asm_norm_arith_tac), @tactics.all_tac])
  let t320 = @simp.rewrite_tac(@list.List([@canal.open_halfspace_re_gt(), @sets.in_elim_thm()]))
  let t316 = @term_syntax.parse_term("from(1)")
  let t317 = @term_syntax.parse_term("{(s : Cart[Real, 2]) | Re(s) > real_of_num(1)}")
  let t318 = @term_syntax.parse_term("(n : Num) => (z : Cart[Real, 2]) => -clog(Cx(real_of_num(n))) / cpow(Cx(real_of_num(n)), z)")
  let t319 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (z : Cart[Real, 2]) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), z)"), t318, t317, t316]), @cauchy.series_and_derivative_comparison_complex()))
  let t405 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t319), t320), @tactics.ants_tac), t355), t356), t358), @tactics.disch_tac), t365), t366), t372), t373), @tactics.ap_thm_tac), @tactics.ap_term_tac), t374), t375), t382), t383), t389), t390), t391), t392), t393), @tactics.disch_tac), t394), t399), t402), t403), t404), @vectors.asm_norm_arith_tac)
  complex_derivative_zeta_converges_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → sums((n : Num) => -clog(Cx(real_of_num(n))) / cpow(Cx(real_of_num(n)), s), complex_derivative(zeta, s), from(1))"), t405))
}

///|
let complex_derivative_zeta_converges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_ZETA_CONVERGES")

///|
/// `COMPLEX_DERIVATIVE_ZETA_CONVERGES`
pub fn complex_derivative_zeta_converges() -> @kernel.Thm {
  complex_derivative_zeta_converges_c.get()
}

///|
/// HOLOMORPHIC_NEARZETA_LEMMA
fn step_19() -> Unit raise {
  let t471 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t470 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Cart[Real, 2]) - (z : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t469 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le(), @complexes.re_add(), @complexes.re_cx()]))
  let t468 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t467 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()]))
  let t466 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_lt()]))
  let t465 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t464 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_inv(), @transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.le_1()]))
  let t462 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t461 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((w : Cart[Real, 2])) == real_of_num(1) && norm((z : Cart[Real, 2])) <= (x : Real) + real_of_num(1) → norm(z) <= abs(x + real_of_num(2)) && norm(z - w) <= abs(x + real_of_num(2))")))
  let t460 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t459 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t458 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t463 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_pow_2()])), t458), t459), t460), t461), t462), @vectors.asm_norm_arith_tac), @tactics.all_tac])
  let t457 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t456 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t455 = @simp.once_rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t454 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_assoc()]))
  let t453 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t451 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t450 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Cart[Real, 2]) - (z : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t452 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@int.asm_arith_tac, @tactics.all_tac])), t450), t451), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t444 = @drule.part_match(fn(x443 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x443))
  }, nearzeta_bound_lemma())
  let t439 = @simp.rewrite_tac(@list.List([@topology.in_ball(), @vectors.dist()]))
  let t438 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t436 = @tactics.match_mp_tac(@real.real_pow_le())
  let t435 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_le()]))
  let t434 = @tactics.match_mp_tac(@real.real_le_div())
  let t432 = @equal.gsym(@complexes.cx_pow())
  let t433 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.le_1(), @equal.gsym(@complexes.cx_div()), t432]))
  let t437 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("1 <= (m : Num)"), fn(x429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s430 = @tactics.assume_tac(x429)
    fn(x431 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s430(x431)
    }
  })), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t433), t434), t435), t436), @vectors.norm_arith_tac), @tactics.all_tac])
  let t428 = @simp.rewrite_tac(@list.List([@misc.from(), @sets.in_elim_thm()]))
  let t427 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t425 = @meson.meson_tac(@list.List([@topology.summable()]))
  let t424 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lid()]))
  let t423 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t421 = @term_syntax.parse_term("Cx(Re((s : Cart[Real, 2])) / real_of_num(2) + real_of_num(1))")
  let t422 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t421]), genzeta_converges()))
  let t420 = @tactics.match_mp_tac(@canal.summable_complex_lmul())
  let t426 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div()])), t420), t422), t423), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t424), t425), @tactics.all_tac])
  let t419 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t418 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => pow(Cx(norm((s : Cart[Real, 2])) + real_of_num(2)), 2) / cpow(Cx(real_of_num(n)), Cx(Re(s) / real_of_num(2) + real_of_num(1)))"))
  let t417 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min(), @real.real_lt_01(), @misc.real_half()]))
  let t416 = @tactics.exists_tac(@term_syntax.parse_term("min(Re((s : Cart[Real, 2])) / real_of_num(2), real_of_num(1))"))
  let t415 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_gt()]))
  let t414 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : Cart[Real, 2])"))
  let t412 = @simp.asm_rewrite_tac(@list.List([@transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t411 = @list.List([@tactics.all_tac, @tactics.conv_tac(@complexes.complex_field)])
  let t410 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t409 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_gt(), @misc.from()]))
  let t408 = @term_syntax.parse_term("(s : Cart[Real, 2])")
  let t413 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(m : Num)"), t408])), t409), @tactics.strip_tac), @canal.complex_diff_tac), t410), @tactics.conj_tac), t411), t412), @int.asm_arith_tac), @tactics.all_tac])
  let t407 = @simp.rewrite_tac(@list.List([@canal.open_halfspace_re_gt()]))
  let t406 = @tactics.match_mp_tac(@cauchy.series_and_derivative_comparison_complex())
  let t472 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t406), t407), @tactics.conj_tac), t413), t414), t415), @tactics.disch_tac), t416), t417), t418), t419), @tactics.conj_tac), t426), @tactics.conj_tac), t427), t428), t437), t438), t439), @tactics.strip_tac), fn(x449 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x448 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x446 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x445 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s441 = @tactics.mp_tac(x440)
            fn(x442 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s441(x442)
            }
          })(t444(x445))
        })(@equal.lhand(x446))
      })((fn(x447 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x447.1
      })(x448))
    })(x449)(x449)
  }), @tactics.ants_tac), t452), t453), t454), t455), t456), t457), @tactics.conj_tac), t463), t464), t465), t466), t467), t468), t469), t470), t471), @calc_rat.asm_real_arith_tac)
  holomorphic_nearzeta_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n → (∃ g : (Cart[Real, 2]) -> Cart[Real, 2], ∃ g' : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : Cart[Real, 2], IN(s, {(s : Cart[Real, 2]) | Re(s) > real_of_num(0)}) → sums((m : Num) => (s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(m)), s) - (Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), s - Cx(real_of_num(1))) - Cx(real_of_num(1)) / cpow(Cx(real_of_num(m + 1)), s - Cx(real_of_num(1)))), g(s), from(n)) && sums((m : Num) => (Cx(real_of_num(1)) - (s - Cx(real_of_num(1))) * clog(Cx(real_of_num(m)))) / cpow(Cx(real_of_num(m)), s) - (clog(Cx(real_of_num(m + 1))) / cpow(Cx(real_of_num(m + 1)), s - Cx(real_of_num(1))) - clog(Cx(real_of_num(m))) / cpow(Cx(real_of_num(m)), s - Cx(real_of_num(1)))), g'(s), from(n)) && has_complex_derivative(g, g'(s), at(s)))"), t472))
}

///|
let holomorphic_nearzeta_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_NEARZETA_LEMMA")

///|
/// `HOLOMORPHIC_NEARZETA_LEMMA`
pub fn holomorphic_nearzeta_lemma() -> @kernel.Thm {
  holomorphic_nearzeta_lemma_c.get()
}

///|
/// HOLOMORPHIC_NEARZETA_STRONG
fn step_20() -> Unit raise {
  let t520 = @meson.asm_meson_tac(@list.List([@canal.has_complex_derivative_derivative()]))
  let t518 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t517 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(w : Cart[Real, 2]) - (z : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t516 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t515 = @tactics.conv_tac(@equal.sym_conv)
  let t514 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t513 = @simp.asm_simp_tac(@list.List([@vectors.dist()]))
  let t511 = @term_syntax.parse_term("Re((z : Cart[Real, 2]))")
  let t512 = @tactics.map_every(fn(x508 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s509 = @tactics.exists_tac(x508)
    fn(x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s509(x510)
    }
  }, @list.List([@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])"), t511]))
  let t507 = @tactics.match_mp_tac(@canal.has_complex_derivative_transform_at())
  let t519 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t507), t512), t513), t514), @tactics.disch_tac), t515), t516), t517), t518), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t506 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(z) → has_complex_derivative(nearzeta((n : Num)), (g' : (Cart[Real, 2]) -> Cart[Real, 2])(z), at(z))"), fn(x503 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s504 = @tactics.assume_tac(x503)
    fn(x505 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s504(x505)
    }
  })
  let t502 = @simp.asm_simp_tac(@list.List([]))
  let t501 = @list.List([@meson.asm_meson_tac(@list.List([@topology.series_unique()])), @tactics.all_tac])
  let t500 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) < Re(z) → nearzeta((n : Num), z) == (g : (Cart[Real, 2]) -> Cart[Real, 2])(z)"), fn(x497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s498 = @tactics.assume_tac(x497)
    fn(x499 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s498(x499)
    }
  })
  let t495 = @meson.asm_meson_tac(@list.List([@topology.summable()]))
  let t494 = @simp.rewrite_tac(@list.List([nearzeta(), @topology.sums_infsum()]))
  let t496 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t494), t495), @tactics.all_tac])
  let t493 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(0) < Re(s) → sums((m : Num) => (s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(m)), s) - (Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), s - Cx(real_of_num(1))) - Cx(real_of_num(1)) / cpow(Cx(real_of_num(m + 1)), s - Cx(real_of_num(1)))), nearzeta((n : Num), s), from(n))"), fn(x490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s491 = @tactics.assume_tac(x490)
    fn(x492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s491(x492)
    }
  })
  let t489 = @simp.gen_rewrite_tac(fn(x488 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x482 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s483 = @equal.land_conv(x482)
      fn(x484 : @kernel.Term) -> @kernel.Thm raise {
        s483(x484)
      }
    })((fn(x485 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s486 = @equal.top_depth_conv(x485)
      fn(x487 : @kernel.Term) -> @kernel.Thm raise {
        s486(x487)
      }
    })(x488))
  }, @list.List([@theorems.forall_and_thm(), @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) && (c : Bool)) == ((a → b) && (a → c))"))]))
  let t480 = @term_syntax.parse_term("(g' : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t481 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])"), t480]))
  let t479 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_gt(), @theorems.left_imp_exists_thm()]))
  let t476 = @drule.match_mp(holomorphic_nearzeta_lemma())
  let t478 = @tactics.first_assum(fn(x477 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s474 = @tactics.mp_tac(x473)
      fn(x475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s474(x475)
      }
    })(t476(x477))
  })
  let t521 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t478), t479), t481), t489), @tactics.strip_tac), t493), t496), t500), t501), t502), t506), t519), t520)
  holomorphic_nearzeta_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], 1 <= n && real_of_num(0) < Re(s) → sums((m : Num) => (s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(m)), s) - (Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), s - Cx(real_of_num(1))) - Cx(real_of_num(1)) / cpow(Cx(real_of_num(m + 1)), s - Cx(real_of_num(1)))), nearzeta(n, s), from(n)) && sums((m : Num) => (Cx(real_of_num(1)) - (s - Cx(real_of_num(1))) * clog(Cx(real_of_num(m)))) / cpow(Cx(real_of_num(m)), s) - (clog(Cx(real_of_num(m + 1))) / cpow(Cx(real_of_num(m + 1)), s - Cx(real_of_num(1))) - clog(Cx(real_of_num(m))) / cpow(Cx(real_of_num(m)), s - Cx(real_of_num(1)))), complex_derivative(nearzeta(n), s), from(n)) && has_complex_derivative(nearzeta(n), complex_derivative(nearzeta(n), s), at(s))"), t521))
}

///|
let holomorphic_nearzeta_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_NEARZETA_STRONG")

///|
/// `HOLOMORPHIC_NEARZETA_STRONG`
pub fn holomorphic_nearzeta_strong() -> @kernel.Thm {
  holomorphic_nearzeta_strong_c.get()
}

///|
/// NEARZETA_CONVERGES
fn step_21() -> Unit raise {
  let t530 = @list.List([@int.arith_tac, @meson.meson_tac(@list.List([]))])
  let t529 = @simp.asm_rewrite_tac(@list.List([@topology.summable()]))
  let t528 = @term_syntax.parse_term("(s : Cart[Real, 2])")
  let t531 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t528]), holomorphic_nearzeta_strong())), t529), @tactics.ants_tac), t530)
  let t532 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@sets.extension(), @sets.in_diff(), @sets.in_union(), @misc.in_from(), @sets.in_sing()])), @int.arith_tac), t531])
  let t527 = @tactics.subgoal_then(@term_syntax.parse_term("UNION(DIFF(from((n : Num) + 1), from(n)), DIFF(from(n), from(n + 1))) == {n}"), fn(x525 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x525
    @simp.rewrite_tac(@list.List([th, @sets.finite_insert(), @sets.finite_rules()]))
  })
  let t524 = @tactics.exists_tac(@term_syntax.parse_term("from((n : Num) + 1)"))
  let t523 = @tactics.match_mp_tac(@topology.summable_eq_cofinite())
  let t522 = @simp.rewrite_tac(@list.List([nearzeta(), @topology.sums_infsum()]))
  let t533 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t522), t523), t524), t527), t532)
  nearzeta_converges_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], real_of_num(0) < Re(s) → sums((m : Num) => (s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(m)), s) - (Cx(real_of_num(1)) / cpow(Cx(real_of_num(m)), s - Cx(real_of_num(1))) - Cx(real_of_num(1)) / cpow(Cx(real_of_num(m + 1)), s - Cx(real_of_num(1)))), nearzeta(n, s), from(n))"), t533))
}

///|
let nearzeta_converges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEARZETA_CONVERGES")

///|
/// `NEARZETA_CONVERGES`
pub fn nearzeta_converges() -> @kernel.Thm {
  nearzeta_converges_c.get()
}

///|
/// SUMS_COMPLEX_DERIVATIVE_NEARZETA
fn step_22() -> Unit raise {
  let t534 = @simp.simp_tac(@list.List([holomorphic_nearzeta_strong()]))
  sums_complex_derivative_nearzeta_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], 1 <= n && real_of_num(0) < Re(s) → sums((m : Num) => (Cx(real_of_num(1)) - (s - Cx(real_of_num(1))) * clog(Cx(real_of_num(m)))) / cpow(Cx(real_of_num(m)), s) - (clog(Cx(real_of_num(m + 1))) / cpow(Cx(real_of_num(m + 1)), s - Cx(real_of_num(1))) - clog(Cx(real_of_num(m))) / cpow(Cx(real_of_num(m)), s - Cx(real_of_num(1)))), complex_derivative(nearzeta(n), s), from(n))"), t534))
}

///|
let sums_complex_derivative_nearzeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMS_COMPLEX_DERIVATIVE_NEARZETA")

///|
/// `SUMS_COMPLEX_DERIVATIVE_NEARZETA`
pub fn sums_complex_derivative_nearzeta() -> @kernel.Thm {
  sums_complex_derivative_nearzeta_c.get()
}

///|
/// HOLOMORPHIC_NEARZETA
fn step_23() -> Unit raise {
  let t536 = @meson.meson_tac(@list.List([holomorphic_nearzeta_strong()]))
  let t535 = @simp.rewrite_tac(@list.List([@realax.real_gt()]))
  let t537 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@canal.holomorphic_on_open(), @canal.open_halfspace_re_gt(), @sets.in_elim_thm()])), t535), t536)
  holomorphic_nearzeta_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n → holomorphic_on(nearzeta(n), {(s : Cart[Real, 2]) | Re(s) > real_of_num(0)})"), t537))
}

///|
let holomorphic_nearzeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_NEARZETA")

///|
/// `HOLOMORPHIC_NEARZETA`
pub fn holomorphic_nearzeta() -> @kernel.Thm {
  holomorphic_nearzeta_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_NEARZETA
fn step_24() -> Unit raise {
  let t544 = @meson.meson_tac(@list.List([@canal.complex_differentiable()]))
  let t541 = @drule.match_mp(holomorphic_nearzeta_strong())
  let t543 = @tactics.disch_then(fn(x542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s539 = @tactics.mp_tac(x538)
      fn(x540 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s539(x540)
      }
    })(t541(x542))
  })
  let t545 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t543), t544)
  complex_differentiable_nearzeta_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], 1 <= n && real_of_num(0) < Re(s) → complex_differentiable(nearzeta(n), at(s))"), t545))
}

///|
let complex_differentiable_nearzeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_NEARZETA")

///|
/// `COMPLEX_DIFFERENTIABLE_NEARZETA`
pub fn complex_differentiable_nearzeta() -> @kernel.Thm {
  complex_differentiable_nearzeta_c.get()
}

///|
/// NEARZETA_1
fn step_25() -> Unit raise {
  let t559 = @tactics.conv_tac(@complexes.complex_ring)
  let t558 = @simp.rewrite_tac(@list.List([@complexes.complex_pow()]))
  let t557 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_n(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.add_eq_0(), @calc_num.arith_eq()]))
  let t556 = @tactics.subgoal_then(@term_syntax.parse_term("!((m : Num) == 0)"), fn(x553 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s554 = @tactics.assume_tac(x553)
    fn(x555 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s554(x555)
    }
  })
  let t552 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t551 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0(), @misc.in_from(), @complexes.complex_div()]))
  let t550 = @simp.rewrite_tac(@list.List([@topology.series_0(), @equal.gsym(@complexes.complex_vec_0())]))
  let t549 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (vec : (Num) -> Cart[Real, 2])(0)"))
  let t548 = @tactics.match_mp_tac(@topology.sums_eq())
  let t547 = @tactics.match_mp_tac(@topology.infsum_unique())
  let t546 = @simp.rewrite_tac(@list.List([nearzeta(), @complexes.complex_sub_refl()]))
  let t560 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t546), t547), t548), t549), t550), t551), t552), @tactics.disch_tac), t556), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t557), t558), t559)
  nearzeta_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, 1 <= n → nearzeta(n, Cx(real_of_num(1))) == Cx(real_of_num(0))"), t560))
}

///|
let nearzeta_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEARZETA_1")

///|
/// `NEARZETA_1`
pub fn nearzeta_1() -> @kernel.Thm {
  nearzeta_1_c.get()
}

///|
/// HOLOMORPHIC_ZETA
fn step_26() -> Unit raise {
  let t575 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t574 = @tactics.repeat_tac(@tactics.strip_tac)
  let t576 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@canal.holomorphic_on(), @equal.gsym(@canal.complex_differentiable())])), t574), @canal.complex_differentiable_tac), t575)
  let t573 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t572 = @simp.simp_tac(@list.List([holomorphic_nearzeta(), @arith.le_refl(), @class.eta_ax()]))
  let t571 = @tactics.exists_tac(@term_syntax.parse_term("{(s : Cart[Real, 2]) | Re(s) > real_of_num(0)}"))
  let t577 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.holomorphic_on_subset()), t571), t572), t573), @calc_rat.real_arith_tac), t576])
  let t570 = @tactics.match_mp_tac(@canal.holomorphic_on_add())
  let t569 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @complexes.complex_sub_0(), @canal.holomorphic_on_sub(), @canal.holomorphic_on_const(), @canal.holomorphic_on_id()]))
  let t568 = @tactics.match_mp_tac(@canal.holomorphic_on_div())
  let t567 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t566 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => (nearzeta(1, z) + Cx(real_of_num(1)) / cpow(Cx(real_of_num(1)), z - Cx(real_of_num(1)))) / (z - Cx(real_of_num(1)))"))
  let t565 = @tactics.match_mp_tac(@canal.holomorphic_transform())
  let t564 = @simp.rewrite_tac(@list.List([zeta(), genzeta()]))
  let t578 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x561 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s562 = @equal.land_conv(x561)
    fn(x563 : @kernel.Term) -> @kernel.Thm raise {
      s562(x563)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())])), t564), t565), t566), t567), t568), t569), t570), @tactics.conj_tac), t577)
  holomorphic_zeta_c.set(@tactics.prove(@term_syntax.parse_term("holomorphic_on(zeta, {(s : Cart[Real, 2]) | Re(s) > real_of_num(0) && !(s == Cx(real_of_num(1)))})"), t578))
}

///|
let holomorphic_zeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ZETA")

///|
/// `HOLOMORPHIC_ZETA`
pub fn holomorphic_zeta() -> @kernel.Thm {
  holomorphic_zeta_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_AT_ZETA
fn step_27() -> Unit raise {
  let t581 = @simp.rewrite_tac(@list.List([@canal.complex_differentiable(), @sets.in_elim_thm(), @sets.in_delete(), @realax.real_gt()]))
  let t580 = @simp.simp_tac(@list.List([@canal.holomorphic_on_open(), @topology.open_delete(), @canal.open_halfspace_re_gt()]))
  let t579 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(s : _) | (P : (_) -> Bool)(s) && !(s == (a : _))} == DELETE({(s : _) | P(s)}, a)"))]))
  let t582 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(holomorphic_zeta()), t579), t580), t581)
  complex_differentiable_at_zeta_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(0) < Re(s) && !(s == Cx(real_of_num(1))) → complex_differentiable(zeta, at(s))"), t582))
}

///|
let complex_differentiable_at_zeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_AT_ZETA")

///|
/// `COMPLEX_DIFFERENTIABLE_AT_ZETA`
pub fn complex_differentiable_at_zeta() -> @kernel.Thm {
  complex_differentiable_at_zeta_c.get()
}

///|
/// SERIES_DIVISORS_LEMMA
fn step_28() -> Unit raise {
  let t627 = @meson.asm_meson_tac(@list.List([]))
  let t626 = @simp.asm_simp_tac(@list.List([@arith.le_rdiv_eq(), @int.divides(), @arith.le_0()]))
  let t625 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm(), @sets.in_inter(), @iterate.in_numseg()]))
  let t624 = @tactics.disch_then(fn(x623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x620 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s621 = @tactics.subst1_tac(x620)
      fn(x622 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s621(x622)
      }
    })(@equal.sym(x623))
  })
  let t619 = @simp.asm_simp_tac(@list.List([@misc.finite_inter_numseg(), @arith.eq_mult_lcancel()]))
  let t613 = @simp.gen_rewrite_tac(fn(x612 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x606 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s607 = @equal.land_conv(x606)
      fn(x608 : @kernel.Term) -> @kernel.Thm raise {
        s607(x608)
      }
    })((fn(x609 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s610 = @equal.rand_conv(x609)
      fn(x611 : @kernel.Term) -> @kernel.Thm raise {
        s610(x611)
      }
    })(x612))
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t605 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t604 = @simp.asm_simp_tac(@list.List([@arith.le_rdiv_eq()]))
  let t600 = @term_syntax.parse_term("DIV((n : Num), (p : Num))")
  let t603 = @tactics.first_x_assum(fn(x602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x597 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s598 = @tactics.mp_tac(x597)
      fn(x599 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s598(x599)
      }
    })(((x601 : @kernel.Thm) => @bool.spec(t600, x601))(x602))
  })
  let t596 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t595 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) * (N : Num)"))
  let t592 = @term_syntax.parse_term("(N : Num)")
  let t594 = @tactics.disch_then((x593 : @kernel.Thm) => @tactics.x_choose_tac(t592, x593))
  let t591 = @simp.asm_rewrite_tac(@list.List([]))
  let t590 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t589 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t588 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t587 = @simp.rewrite_tac(@list.List([@topology.sums(), @topology.lim_sequentially()]))
  let t586 = @tactics.disch_then(fn(x583 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x583
    let t585 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t585)
  })
  let t628 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t586), t587), t588), t589), t590), t591), t594), t595), t596), @tactics.disch_tac), t603), t604), t605), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t613), fn(x618 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x614
      let t617 = @equal.lhand(w)
      @tactics.mp_tac(@drule.part_match(fn(x616 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@kernel.rand(x616))
      }, @vectors.vsum_image())(t617))
    })(x618)(x618)
  }), t619), t624), @tactics.ap_thm_tac), @tactics.ap_term_tac), t625), t626), t627)
  series_divisors_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Cart[Real, _], ∀ p : Num, ∀ l : Cart[Real, _], ∀ k : (Num) -> Bool, sums((n : Num) => x(p * n), l, k) → !(p == 0) && (∀ n : Num, IN(p * n, k) == IN(n, k)) → sums(x, l, {(n : Num) | IN(n, k) && divides(p, n)})"), t628))
}

///|
let series_divisors_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_DIVISORS_LEMMA")

///|
/// `SERIES_DIVISORS_LEMMA`
pub fn series_divisors_lemma() -> @kernel.Thm {
  series_divisors_lemma_c.get()
}

///|
/// EULER_PRODUCT_LEMMA
fn step_29() -> Unit raise {
  let t650 = @sets.set_tac(@list.List([]))
  let t649 = @simp.rewrite_tac(@list.List([@misc.finite_inter_numseg()]))
  let t648 = @tactics.match_mp_tac(@vectors.vsum_diff())
  let t647 = @tactics.conv_tac(@equal.sym_conv)
  let t646 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {} → INTER(t, (u : (_) -> Bool)) == DIFF(INTER(UNION(s, t), u), INTER(s, u))"))]))
  let t645 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t644 = @simp.rewrite_tac(@list.List([@vectors.vector_add_sub()]))
  let t641 = @drule.match_mp(@topology.lim_sub())
  let t643 = @tactics.disch_then(fn(x642 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s639 = @tactics.mp_tac(x638)
      fn(x640 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s639(x640)
      }
    })(t641(x642))
  })
  let t637 = @simp.rewrite_tac(@list.List([@topology.sums()]))
  let t636 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t635 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x629 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s630 = @tactics.mp_tac(x629)
    fn(x631 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s630(x631)
    }
  }, fn(x632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s633 = @tactics.assume_tac(x632)
    fn(x634 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s633(x634)
    }
  }))
  let t651 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t635), t636), t637), t643), t644), t645), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.abs_tac), t646), t647), t648), t649), t650)
  let lemma = @tactics.prove(@term_syntax.parse_term("sums((x : (Num) -> Cart[Real, 2]), (k : Cart[Real, 2]) + (l : Cart[Real, 2]), UNION((s : (Num) -> Bool), (t : (Num) -> Bool))) && INTER(s, t) == {} → sums(x, k, s) → sums(x, l, t)"), t651)
  let t705 = @sets.set_tac(@list.List([]))
  let t704 = @tactics.first_x_assum(fn(x701 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x701
    let t703 = @tactics.match_mp_tac(@theorems.eq_imp())
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(th_1), t703), @tactics.ap_term_tac)
  })
  let t700 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t699 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * (x : Cart[Real, 2]) + (Cx(real_of_num(1)) - a) * x == x"))]))
  let t698 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc())]))
  let t697 = @tactics.match_mp_tac(lemma)
  let t695 = @meson.asm_meson_tac(@list.List([@prime.prime_prime_factor(), @prime.prime_1()]))
  let t694 = @simp.asm_rewrite_tac(@list.List([]))
  let t693 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t692 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t691 = @simp.asm_rewrite_tac(@list.List([@arith.mult_eq_0(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t690 = @simp.asm_simp_tac(@list.List([@prime.prime_divprod_eq()]))
  let t689 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t688 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0()])), @tactics.all_tac])
  let t696 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 0)"), fn(x685 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s686 = @tactics.assume_tac(x685)
    fn(x687 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s686(x687)
    }
  }), t688), t689), t690), t691), t692), t693), t694), t695), @tactics.all_tac])
  let t681 = @bool.ispec(@term_syntax.parse_term("(n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), (s : Cart[Real, 2]))"), series_divisors_lemma())
  let t682 = @drule.match_mp(@simp.rewrite_rule(@list.List([]))(t681))
  let t684 = @tactics.disch_then(fn(x683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x678 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s679 = @tactics.mp_tac(x678)
      fn(x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s679(x680)
      }
    })(t682(x683))
  })
  let t677 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), @realax.real_of_num_mul()]))
  let t676 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cpow_mul_real()), @complexes.real_cx(), @complexes.re_cx(), @realarith.real_pos()]))
  let t675 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t674 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_inv_mul())]))
  let t673 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(x : Cart[Real, 2]) * (Cx(real_of_num(1)) * (y : Cart[Real, 2])) == Cx(real_of_num(1)) * (x * y)"))]))
  let t672 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t669 = @drule.match_mp(@canal.series_complex_lmul())
  let t666 = @term_syntax.parse_term("inv(cpow(Cx(real_of_num((p : Num))), (s : Cart[Real, 2])))")
  let t671 = @tactics.first_assum(fn(x670 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x663 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s664 = @tactics.mp_tac(x663)
        fn(x665 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s664(x665)
        }
      })(((x667 : @kernel.Thm) => @bool.spec(t666, x667))(x668))
    })(t669(x670))
  })
  let t662 = @simp.asm_rewrite_tac(@list.List([]))
  let t661 = @tactics.disch_then(fn(x659 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x659
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t658 = @simp.simp_tac(@list.List([@theorems.forall_and_thm(), @theorems.left_forall_imp_thm(), @theorems.exists_refl()]))
  let t657 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t655 = @term_syntax.parse_term("(ps : (Num) -> Bool)")
  let t656 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Num)"), t655]))
  let t654 = @simp.asm_simp_tac(@list.List([zeta_converges(), @complexes.complex_mul_lid(), @sets.not_in_empty(), @equal.gsym(@misc.from())]))
  let t653 = @simp.simp_tac(@list.List([@complexes.cproduct_clauses()]))
  let t652 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t706 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), @tactics.gen_tac), @tactics.disch_tac), t652), t653), t654), t656), t657), t658), t661), t662), @tactics.strip_tac), t671), t672), t673), t674), t675), t676), t677), t684), @tactics.ants_tac), t696), t697), t698), t699), @tactics.conj_tac), t700), t704), t705)
  euler_product_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], ∀ ps : (Num) -> Bool, real_of_num(1) < Re(s) && FINITE(ps) && (∀ p : Num, IN(p, ps) → prime(p)) → sums((n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), s), cproduct(ps, (p : Num) => Cx(real_of_num(1)) - inv(cpow(Cx(real_of_num(p)), s))) * zeta(s), {(n : Num) | 1 <= n && (∀ p : Num, prime(p) && divides(p, n) → !IN(p, ps))})"), t706))
}

///|
let euler_product_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_PRODUCT_LEMMA")

///|
/// `EULER_PRODUCT_LEMMA`
pub fn euler_product_lemma() -> @kernel.Thm {
  euler_product_lemma_c.get()
}

///|
/// SUMMABLE_SUBZETA
fn step_30() -> Unit raise {
  let t720 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_div(), @transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @realax.real_le_refl(), @real.real_of_num_lt(), @arith.le_1()]))
  let t719 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_0(), @vectors.norm_pos_le()]))
  let t718 = @tactics.repeat_tac(@tactics.strip_tac)
  let t717 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_0(), @misc.in_from()]))
  let t721 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t717), t718), @class.cond_cases_tac), t719), t720)
  let t722 = @simp.simp_tac(@list.List([@misc.in_from(), @arith.le_1(), @transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @equal.gsym(@complexes.cx_div()), @real.real_le_div(), @realarith.real_pos(), @transcendentals.real_exp_pos_le()]))
  let t716 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx()]))
  let t715 = @tactics.match_mp_tac(zeta_converges())
  let t714 = @tactics.exists_tac(@term_syntax.parse_term("zeta(Cx(Re((s : Cart[Real, 2]))))"))
  let t723 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.summable()])), t714), t715), t716), t722, t721])
  let t713 = @tactics.repeat_tac(@tactics.conj_tac)
  let t712 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), Cx(Re((s : Cart[Real, 2]))))"))
  let t711 = @tactics.match_mp_tac(@canal.series_comparison_complex())
  let t709 = @meson.asm_meson_tac(@list.List([@arith.le_1()]))
  let t710 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @misc.in_from()])), t709), @tactics.all_tac])
  let t708 = @tactics.exists_tac(@term_syntax.parse_term("from(1)"))
  let t707 = @tactics.match_mp_tac(@topology.summable_subset())
  let t724 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t707), t708), @tactics.conj_tac), t710), t711), t712), t713), t723)
  summable_subzeta_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], ∀ t : (Num) -> Bool, real_of_num(1) < Re(s) && !IN(0, t) → summable(t, (n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), s))"), t724))
}

///|
let summable_subzeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_SUBZETA")

///|
/// `SUMMABLE_SUBZETA`
pub fn summable_subzeta() -> @kernel.Thm {
  summable_subzeta_c.get()
}

///|
/// EULER_PRODUCT_MULTIPLY
fn step_31() -> Unit raise {
  let t812 = @simp.simp_tac(@list.List([@complexes.real_inv(), @complexes.real_cx(), @equal.gsym(@complexes.cx_inv()), @complexes.re_cx(), @realax.real_le_refl()]))
  let t811 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.le_1(), @transcendentals.norm_cpow_real()]))
  let t810 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lid(), @complexes.complex_norm_inv()]))
  let t809 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @misc.in_from()]))
  let t808 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t806 = @meson.asm_meson_tac(@list.List([@prime.prime_factor(), @int.divides_le(), @calc_num.num_reduce_conv(@term_syntax.parse_term("1 <= 0")), @arith.lt_imp_le(), @arith.le_trans()]))
  let t807 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@sets.subset(), @sets.in_delete(), @sets.in_inter(), @sets.in_elim_thm(), @iterate.in_numseg(), @misc.in_from()])), t806), @tactics.all_tac])
  let t805 = @simp.rewrite_tac(@list.List([@misc.finite_inter_numseg()]))
  let t804 = @tactics.match_mp_tac(@complexes.complex_norm_vsum_bound_subset())
  let t802 = @simp.rewrite_tac(@list.List([@prime.prime_1(), @iterate.in_numseg(), @calc_num.arith(), @int.arith_rule(@term_syntax.parse_term("1 <= (a : Num) + ((b : Num) + 1)"))]))
  let t801 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : Num, (P : (Num) -> Bool)(x) && x == 1 → (Q : (Num) -> Bool)(x)) == (P(1) → Q(1))"))]))
  let t800 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_1(), @complexes.complex_div_1()]))
  let t799 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @int.divides_one(), @sets.in_inter()]))
  let t803 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@vectors.vsum_delete_cases(), @misc.finite_inter_numseg()])), t799), t800), t801), t802), @tactics.all_tac])
  let t798 = @tactics.subgoal_then(@term_syntax.parse_term("vsum(INTER({(m : Num) | 1 <= m && (∀ p : Num, prime(p) && divides(p, m) → (n : Num) < p)}, op_dot_dot(0, (N1 : Num) + ((N2 : Num) + 1))), (n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), (s : Cart[Real, 2]))) - Cx(real_of_num(1)) == vsum(DELETE(INTER({(m : Num) | 1 <= m && (∀ p : Num, prime(p) && divides(p, m) → n < p)}, op_dot_dot(0, N1 + (N2 + 1))), 1), (n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), s))"), fn(x795 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s796 = @tactics.subst1_tac(x795)
    fn(x797 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s796(x797)
    }
  })
  let t794 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t793 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) → y < (e : Real) → x < e")))
  let t789 = @term_syntax.parse_term("(N1 : Num) + ((N2 : Num) + 1)")
  let t792 = @tactics.first_x_assum(fn(x791 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x786 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s787 = @tactics.mp_tac(x786)
      fn(x788 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s787(x788)
      }
    })(((x790 : @kernel.Thm) => @bool.spec(t789, x790))(x791))
  })
  let t785 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@vectors.dist_triangle(), @vectors.dist_sym()]))])
  let t784 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("distance(((x : Cart[Real, _]), (z : Cart[Real, _]))) < (e : Real) / real_of_num(2) && distance(((y : Cart[Real, _]), z)) <= distance((x, y)) + distance((x, z)) → distance((x, y)) < e / real_of_num(2) → distance((y, z)) < e")))
  let t783 = @simp.simp_tac(@list.List([@arith.not_le()]))
  let t779 = @term_syntax.parse_term("(N1 : Num) + ((N2 : Num) + 1)")
  let t782 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N2 : Num)"))(fn(x781 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x776 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s777 = @tactics.mp_tac(x776)
      fn(x778 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s777(x778)
      }
    })(((x780 : @kernel.Thm) => @bool.spec(t779, x780))(x781))
  }))
  let t775 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t771 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t774 = @tactics.disch_then(fn(x773 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s769 = @tactics.mp_tac(x768)
      fn(x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s769(x770)
      }
    })(((x772 : @kernel.Thm) => @bool.spec(t771, x772))(x773))
  })
  let t767 = @simp.rewrite_tac(@list.List([@topology.sums(), @topology.lim_sequentially()]))
  let t766 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.sums_infsum())]))
  let t765 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @calc_num.arith()]))
  let t763 = @term_syntax.parse_term("{(m : Num) | 1 <= m && (∀ p : Num, prime(p) && divides(p, m) → (n : Num) < p)}")
  let t764 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : Cart[Real, 2])"), t763]), summable_subzeta()))
  let t762 = @simp.asm_rewrite_tac(@list.List([]))
  let t761 = @tactics.disch_then(fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x759
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t758 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t757 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t756 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t755 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t754 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @arith.ge()]))
  let t750 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t753 = @tactics.disch_then(fn(x752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s748 = @tactics.mp_tac(x747)
      fn(x749 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s748(x749)
      }
    })(((x751 : @kernel.Thm) => @bool.spec(t750, x751))(x752))
  })
  let t746 = @simp.rewrite_tac(@list.List([@topology.series_cauchy()]))
  let t744 = @meson.meson_tac(@list.List([]))
  let t743 = @simp.asm_simp_tac(@list.List([@complexes.re_cx()]))
  let t745 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(Re((s : Cart[Real, 2])))"), zeta_converges())), t743), t744), @tactics.all_tac])
  let t742 = @tactics.subgoal_then(@term_syntax.parse_term("∃ l : Cart[Real, 2], sums((n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), Cx(Re((s : Cart[Real, 2])))), l, from(1))"), fn(x739 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s740 = @tactics.mp_tac(x739)
    fn(x741 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s740(x741)
    }
  })
  let t738 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t737 = @simp.rewrite_tac(@list.List([@topology.lim_sequentially()]))
  let t735 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @arith.le_0(), @iterate.in_numseg()]))
  let t734 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t733 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t732 = @tactics.match_mp_tac(@sets.finite_subset())
  let t731 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t730 = @tactics.match_mp_tac(euler_product_lemma())
  let t729 = @tactics.match_mp_tac(@topology.infsum_unique())
  let t728 = @simp.rewrite_tac(@list.List([]))
  let t727 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t736 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.always_eventually()), t727), t728), t729), t730), t731), t732), t733), t734), t735), @tactics.all_tac])
  let t726 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => infsum({(m : Num) | 1 <= m && (∀ p : Num, prime(p) && divides(p, m) → !IN(p, {(p : Num) | prime(p) && p <= n}))}, (n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), (s : Cart[Real, 2])))"))
  let t725 = @tactics.match_mp_tac(@topology.lim_transform_eventually())
  let t813 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t725), t726), @tactics.conj_tac), t736), t737), t738), @tactics.strip_tac), t742), t745), t746), t753), t754), t755), t756), t757), t758), t761), t762), @tactics.disch_tac), t764), t765), t766), t767), t774), t775), t782), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t783), t784), @tactics.conj_tac), t785), t792), t793), t794), t798), t803), t804), t805), @tactics.conj_tac), t807), t808), t809), @tactics.strip_tac), t810), t811), t812)
  euler_product_multiply_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → op_minus_minus_gt((n : Num) => cproduct({(p : Num) | prime(p) && p <= n}, (p : Num) => Cx(real_of_num(1)) - inv(cpow(Cx(real_of_num(p)), s))) * zeta(s), Cx(real_of_num(1)), sequentially)"), t813))
}

///|
let euler_product_multiply_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_PRODUCT_MULTIPLY")

///|
/// `EULER_PRODUCT_MULTIPLY`
pub fn euler_product_multiply() -> @kernel.Thm {
  euler_product_multiply_c.get()
}

///|
/// ZETA_NONZERO_LEMMA
fn step_32() -> Unit raise {
  let t838 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t837 = @simp.rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_lzero(), @vectors.norm_neg(), @complexes.complex_norm_cx()]))
  let t836 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_rzero(), @arith.le_refl()]))
  let t832 = @term_syntax.parse_term("(n : Num)")
  let t835 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x829 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s830 = @tactics.mp_tac(x829)
      fn(x831 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s830(x831)
      }
    })(((x833 : @kernel.Thm) => @bool.spec(t832, x833))(x834))
  }))
  let t828 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t824 = @term_syntax.parse_term("real_of_num(1) / real_of_num(2)")
  let t827 = @tactics.disch_then(fn(x826 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x821 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s822 = @tactics.mp_tac(x821)
      fn(x823 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s822(x823)
      }
    })(((x825 : @kernel.Thm) => @bool.spec(t824, x825))(x826))
  })
  let t820 = @simp.rewrite_tac(@list.List([@topology.lim_sequentially()]))
  let t817 = @drule.match_mp(euler_product_multiply())
  let t819 = @tactics.first_assum(fn(x818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x814 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s815 = @tactics.mp_tac(x814)
      fn(x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s815(x816)
      }
    })(t817(x818))
  })
  let t839 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t819), t820), t827), t828), t835), t836), t837), t838)
  zeta_nonzero_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → !(zeta(s) == Cx(real_of_num(0)))"), t839))
}

///|
let zeta_nonzero_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETA_NONZERO_LEMMA")

///|
/// `ZETA_NONZERO_LEMMA`
pub fn zeta_nonzero_lemma() -> @kernel.Thm {
  zeta_nonzero_lemma_c.get()
}

///|
/// EULER_PRODUCT
fn step_33() -> Unit raise {
  let t863 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cproduct_inv()), finite_atmost(), @complexes.complex_inv_inv()]))
  let t862 = @simp.asm_simp_tac(@list.List([zeta_nonzero_lemma(), @complexes.complex_mul_rinv(), @complexes.complex_mul_rid()]))
  let t861 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t858 = @drule.match_mp(@canal.lim_complex_rmul())
  let t855 = @term_syntax.parse_term("inv(zeta((s : Cart[Real, 2])))")
  let t860 = @tactics.disch_then(fn(x859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s853 = @tactics.mp_tac(x852)
        fn(x854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s853(x854)
        }
      })(((x856 : @kernel.Thm) => @bool.spec(t855, x856))(x857))
    })(t858(x859))
  })
  let t849 = @drule.match_mp(euler_product_multiply())
  let t851 = @tactics.first_assum(fn(x850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s847 = @tactics.mp_tac(x846)
      fn(x848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s847(x848)
      }
    })(t849(x850))
  })
  let t845 = @simp.asm_simp_tac(@list.List([@complexes.complex_inv_eq_0(), zeta_nonzero_lemma()]))
  let t844 = @tactics.match_mp_tac(@canal.lim_complex_inv())
  let t842 = @list.List([@equal.gsym(@complexes.complex_inv_inv())])
  let t840 = @term_syntax.parse_term("(x : Cart[Real, _]) => op_minus_minus_gt((n : _) => x, x, (sq : Net[_]))")
  let t843 = @simp.gen_rewrite_tac((x841 : (@kernel.Term) -> @kernel.Thm raise) => @equal.pat_conv(t840, x841), t842)
  let t864 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t843), t844), t845), t851), t860), t861), t862), t863)
  euler_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → op_minus_minus_gt((n : Num) => cproduct({(p : Num) | prime(p) && p <= n}, (p : Num) => inv(Cx(real_of_num(1)) - inv(cpow(Cx(real_of_num(p)), s)))), zeta(s), sequentially)"), t864))
}

///|
let euler_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_PRODUCT")

///|
/// `EULER_PRODUCT`
pub fn euler_product() -> @kernel.Thm {
  euler_product_c.get()
}

///|
/// SUMS_GAMMA
fn step_34() -> Unit raise {
  let t877 = @equal.gsym(@complexes.cx_sub())
  let t878 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_div()), t877, @real.real_div_1()]))
  let t876 = @simp.rewrite_tac(@list.List([@complexes.complex_pow(), @complexes.complex_pow_1(), @complexes.complex_sub_rzero()]))
  let t873 = @int.arith_rule(@term_syntax.parse_term("0 < (i : Num) + 1"))
  let t874 = @equal.gsym(@transcendentals.cx_log())
  let t875 = @simp.simp_tac(@list.List([@iterate.in_numseg(), @complexes.cx_inj(), @realax.real_of_num_eq(), @arith.add_eq_0(), @calc_num.arith(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) → 0 < i && !(i == 0)")), t874, t873]))
  let t872 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t871 = @simp.rewrite_tac(@list.List([@misc.from_inter_numseg()]))
  let t870 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t869 = @tactics.match_mp_tac(@metric.always_eventually())
  let t868 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually()))
  let t867 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_refl(), @complexes.complex_mul_lzero(), @transcendentals.cpow_n(), @topology.sums()]))
  let t866 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.vsum_cx()), @iterate.finite_numseg(), @complexes.re_cx(), @real.real_lt_01(), @arith.le_refl()]))
  let t865 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t879 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("1"), t865]), sums_complex_derivative_nearzeta())), t866), t867), t868), t869), t870), t871), t872), t875), t876), t878)
  sums_gamma_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_gt((n : Num) => Cx(sum(op_dot_dot(1, n), (i : Num) => real_of_num(1) / real_of_num(i) - (log(real_of_num(i + 1)) - log(real_of_num(i))))), complex_derivative(nearzeta(1), Cx(real_of_num(1))), sequentially)"), t879))
}

///|
let sums_gamma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMS_GAMMA")

///|
/// `SUMS_GAMMA`
pub fn sums_gamma() -> @kernel.Thm {
  sums_gamma_c.get()
}

///|
/// ZETA_1_NZ
fn step_35() -> Unit raise {
  let t911 = @simp.simp_tac(@list.List([@equal.gsym(@transcendentals.real_exp_n()), @real.real_div_lmul(), @realax.real_of_num_eq(), @calc_num.arith()]))
  let t909 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_le_x()]))
  let t908 = @list.List([@tactics.conv_tac(@calc_rat.real_rat_reduce_conv), @tactics.all_tac])
  let t910 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le2()), @tactics.conj_tac), t908), t909), @tactics.all_tac])
  let t907 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num(1) + real_of_num(1) / real_of_num(2), 2) <= pow(exp(real_of_num(1) / real_of_num(2)), 2)"), fn(x904 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s905 = @tactics.mp_tac(x904)
    fn(x906 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s905(x906)
    }
  })
  let t903 = @simp.simp_tac(@list.List([@transcendentals.exp_log(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t902 = @simp.gen_rewrite_tac(fn(x901 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x901
  }, @list.List([@equal.gsym(@transcendentals.real_exp_mono_lt())]))
  let t912 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@complexes.re_cx(), @real.real_not_le(), @realarith.real_sub_lt()])), t902), t903), t907), t910), t911), @calc_rat.real_arith_tac)
  let t900 = @simp.simp_tac(@list.List([@transcendentals.log_le(), @real.real_le_div(), @realarith.real_pos()]))
  let t898 = @int.arith_rule(@term_syntax.parse_term("2 <= (x : Num) → 0 < x"))
  let t899 = @simp.simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) → (x + real_of_num(1)) / x == real_of_num(1) + real_of_num(1) / x")), @real.real_of_num_lt(), t898]))
  let t897 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t895 = @int.arith_rule(@term_syntax.parse_term("2 <= (x : Num) → 0 < x && 0 < x + 1"))
  let t896 = @simp.simp_tac(@list.List([@realarith.real_sub_le(), @equal.gsym(@transcendentals.log_div()), @real.real_of_num_lt(), t895]))
  let t894 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t893 = @tactics.match_mp_tac(@iterate.sum_pos_le())
  let t892 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) <= a - (b - real_of_num(0)) + (c : Real)) == (real_of_num(0) <= c)"))]))
  let t891 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses_left(), @calc_num.arith(), @real.real_div_1(), @transcendentals.log_1()]))
  let t890 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), @complexes.re_cx()]))
  let t889 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t888 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t887 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t886 = @simp.rewrite_tac(@list.List([sums_gamma(), @metric.trivial_limit_sequentially(), @cart.dimindex_2(), @calc_num.arith()]))
  let t885 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => Cx(sum(op_dot_dot(1, n), (i : Num) => real_of_num(1) / real_of_num(i) - (log(real_of_num(i + 1)) - log(real_of_num(i)))))"))
  let t884 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_component_lbound()))
  let t913 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re_def()])), t884), t885), t886), t887), t888), t889), @tactics.disch_tac), t890), t891), t892), t893), t894), t896), t897), t899), t900), t912])
  let t883 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(1) - log(real_of_num(2)) <= Re(complex_derivative(nearzeta(1), Cx(real_of_num(1))))"), fn(x880 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s881 = @tactics.mp_tac(x880)
    fn(x882 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s881(x882)
    }
  })
  let t914 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([zeta(), genzeta()])), @tactics.disch_tac), t883), t913)
  zeta_1_nz_c.set(@tactics.prove(@term_syntax.parse_term("!(zeta(Cx(real_of_num(1))) == Cx(real_of_num(0)))"), t914))
}

///|
let zeta_1_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETA_1_NZ")

///|
/// `ZETA_1_NZ`
pub fn zeta_1_nz() -> @kernel.Thm {
  zeta_1_nz_c.get()
}

///|
/// ZETA_MULTIPLE_BOUND
fn step_36() -> Unit raise {
  let t926 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square()]))
  let t925 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t924 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow((a : Real), 2) * (b : Real) <= pow(real_of_num(2) * a + b, 3) / real_of_num(27)) == (real_of_num(0) <= (real_of_num(8) / real_of_num(27) * a + real_of_num(1) / real_of_num(27) * b) * pow(a - b, 2))"))]))
  let t923 = @simp.asm_rewrite_tac(@list.List([]))
  let t922 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t921 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → b <= (x : Real) → a <= x")))
  let t927 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x915 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s916 = @tactics.assume_tac(x915)
    fn(x917 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s916(x917)
    }
  }, fn(x918 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s919 = @tactics.mp_tac(x918)
    fn(x920 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s919(x920)
    }
  }))), t921), t922), t923), t924), t925), t926), @calc_rat.asm_real_arith_tac)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("real_of_num(0) <= (a : Real) && real_of_num(0) <= (b : Real) && real_of_num(0) <= (c : Real) && c * (pow(real_of_num(2) * a + b, 3) / real_of_num(27)) <= (x : Real) → c * (pow(a, 2) * b) <= x"), t927)
  let t930 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t929 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square()]))
  let t928 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (real_of_num(1) - (t : Real)) * (real_of_num(1) + t) && real_of_num(0) <= pow((r : Real) - t, 2) → real_of_num(0) <= real_of_num(1) + (pow(r, 2) - real_of_num(2) * (r * t))")))
  let t931 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t928), t929), t930), @calc_rat.asm_real_arith_tac)
  let lemma2 = @tactics.prove(@term_syntax.parse_term("-real_of_num(1) <= (t : Real) && t <= real_of_num(1) → real_of_num(0) <= real_of_num(1) + (pow((r : Real), 2) - real_of_num(2) * (r * t))"), t931)
  let t1079 = @list.List([@simp.asm_simp_tac(@list.List([@real.real_pow_le()])), @calc_rat.real_arith_tac])
  let t1078 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= pow((r : Real), 3)"), fn(x1075 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1076 = @tactics.mp_tac(x1075)
    fn(x1077 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1076(x1077)
    }
  })
  let t1073 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square()]))
  let t1072 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= real_of_num(2) * (real_of_num(2) * pow((t : Real), 2) + (real_of_num(2) * t - real_of_num(1))) + real_of_num(3)) == (real_of_num(0) <= pow(t + real_of_num(1) / real_of_num(2), 2))"))]))
  let t1071 = @simp.asm_rewrite_tac(@list.List([]))
  let t1070 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t1069 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((c : Real) - real_of_num(2) * ((r : Real) * (y : Real)) <= c + real_of_num(3) * r) == (real_of_num(0) <= r * (real_of_num(2) * y + real_of_num(3)))"))]))
  let t1068 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_le()]))
  let t1074 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t1068), t1069), t1070), t1071), t1072), t1073), @tactics.all_tac])
  let t1067 = @tactics.exists_tac(@term_syntax.parse_term("(real_of_num(1) - (r : Real)) * (real_of_num(3) + real_of_num(3) * pow(r, 2) + real_of_num(3) * r)"))
  let t1066 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1065 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * (real_of_num(1) + (pow((r : Real), 2) - real_of_num(2) * (r * (t : Real)))) + (real_of_num(1) + (pow(r, 2) + (real_of_num(2) * r - real_of_num(4) * (r * pow(t, 2))))) == real_of_num(3) + real_of_num(3) * pow(r, 2) - real_of_num(2) * (r * (real_of_num(2) * pow(t, 2) + (real_of_num(2) * t - real_of_num(1))))"))]))
  let t1064 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t1063 = @tactics.match_mp_tac(@real.real_pow_le2_odd())
  let t1062 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow((x : Real), 3) * (pow((y : Real), 3) / real_of_num(27)) <= real_of_num(1)) == (pow(x * y, 3) <= pow(real_of_num(3), 3))"))]))
  let t1060 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t1059 = @simp.gen_rewrite_tac(fn(x1056 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1057 = @equal.land_conv(x1056)
    fn(x1058 : @kernel.Term) -> @kernel.Thm raise {
      s1057(x1058)
    }
  }, @list.List([@equal.gsym(@real.real_pow2_abs())]))
  let t1054 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * pow((t : Real), 2) - real_of_num(1) <= real_of_num(1)) == (pow(t, 2) <= pow(real_of_num(1), 2))"))
  let t1055 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-real_of_num(1) <= real_of_num(2) * pow((x : Real), 2) - real_of_num(1)) == (real_of_num(0) <= x * x)")), t1054, @realarith.real_le_square()]))
  let t1053 = @simp.asm_rewrite_tac(@list.List([]))
  let t1052 = @tactics.match_mp_tac(lemma2)
  let t1061 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) + ((s : Real) + (real_of_num(2) * (r : Real) - real_of_num(4) * (r * (t : Real)))) == real_of_num(1) + (s - real_of_num(2) * (r * (real_of_num(2) * t - real_of_num(1))))"))])), t1052), t1053), t1055), t1059), t1060), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1051 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @realarith.real_sub_le(), lemma2]))
  let t1050 = @tactics.match_mp_tac(lemma1)
  let t1047 = @drule.match_mp(@realarith.real_lt_imp_le())
  let t1049 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1048 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1044 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1045 = @tactics.assume_tac(x1044)
      fn(x1046 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1045(x1046)
      }
    })(t1047(x1048))
  }))
  let t1043 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1042 = @tactics.pop_assum_list(fn(x1041 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1040 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(r : Real) < real_of_num(1) → abs(real_of_num(1) - r) == real_of_num(1) - r"))]))
  let t1038 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos_lt(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(1 < (t : Num)) == (2 <= t)")), @prime.prime_ge_2()]))
  let t1037 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t1036 = @simp.rewrite_tac(@list.List([@real.real_lt_lneg(), @calc_int.real_add_rid()]))
  let t1035 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_lt()]))
  let t1034 = @tactics.subst1_tac(@equal.gsym(@transcendentals.real_exp_0()))
  let t1033 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_lt()]))
  let t1039 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("r"), t1033), t1034), t1035), t1036), t1037), t1038), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1032 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (r : Real) && r < real_of_num(1)"), fn(x1029 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1030 = @tactics.mp_tac(x1029)
    fn(x1031 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1030(x1031)
    }
  })
  let t1028 = @simp.asm_rewrite_tac(@list.List([]))
  let t1027 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Re((y : Cart[Real, 2])) * log(real_of_num((p : Num)))"), @transcendentals.cos_bounds()))
  let t1026 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - real_of_num(2) * ((r : Real) * (real_of_num(2) * (y : Real) - real_of_num(1))) == x + (real_of_num(2) * r - real_of_num(4) * (r * y))"))]))
  let t1025 = @simp.abbrev_tac(@term_syntax.parse_term("(t : Real) == cos(Re((y : Cart[Real, 2])) * log(real_of_num((p : Num))))"))
  let t1024 = @simp.rewrite_tac(@list.List([@transcendentals.cos_double_cos(), @transcendentals.cos_neg(), @equal.gsym(@complexes.cx_sub()), @complexes.complex_norm_cx()]))
  let t1023 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Real) == exp(-(Re((x : Cart[Real, 2])) * log(real_of_num((p : Num)))))"))
  let t1022 = @simp.rewrite_tac(@list.List([@transcendentals.sin_circle(), @calc_int.real_pow_neg(), @calc_num.arith()]))
  let t1021 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("pow(real_of_num(1) - (r : Real) * (c : Real), 2) + pow(-(r * (s : Real)), 2) == real_of_num(1) + (pow(r, 2) * (pow(s, 2) + pow(c, 2)) - real_of_num(2) * (r * c))"))]))
  let t1020 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_0(), @calc_int.real_add_rid(), @real.real_sub_lzero(), @realax.real_add_lid()]))
  let t1019 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @complexes.re_cx(), @complexes.re_mul_cx(), @complexes.re_add(), @complexes.re_mul_ii(), @complexes.im_sub(), @complexes.im_cx(), @complexes.im_mul_cx(), @complexes.im_add(), @complexes.im_mul_ii()]))
  let t1018 = @simp.rewrite_tac(@list.List([@complexes.complex_sqnorm()]))
  let t1017 = @simp.simp_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("pow((z : Real), 4) == pow(pow(z, 2), 2)")), @complexes.complex_sqnorm()]))
  let t1016 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_pow()]))
  let t1012 = @equal.gsym(@complexes.cx_mul())
  let t1013 = @equal.gsym(@complexes.cx_neg())
  let t1014 = @equal.gsym(@transcendentals.cx_cos())
  let t1015 = @simp.rewrite_tac(@list.List([@transcendentals.ccos_neg(), @transcendentals.csin_neg(), @equal.gsym(@transcendentals.cx_sin()), t1014, t1013, t1012]))
  let t1011 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_euler()]))
  let t1010 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(Cx(real_of_num(2)) * (ii * (x : Cart[Real, 2]))) == ii * (Cx(real_of_num(2)) * -x)"))]))
  let t1009 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(ii * (x : Cart[Real, 2])) == ii * -x"))]))
  let t1005 = @equal.gsym(@complexes.complex_mul_assoc())
  let t1006 = @equal.gsym(@transcendentals.cx_exp())
  let t1007 = @equal.gsym(@complexes.cx_neg())
  let t1008 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.cx_mul()), t1007, t1006, t1005]))
  let t1001 = @simp.rewr_conv(@complexes.real_v1())
  let t1004 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1003 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1000 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s998 = @tactics.subst1_tac(x997)
        fn(x999 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s998(x999)
        }
      })(@equal.sym(x1000))
    })(((x1002 : @kernel.Thm) => @equal.conv_rule(t1001, x1002))(x1003))
  }))
  let t995 = @equal.gsym(@transcendentals.cexp_n())
  let t996 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cexp_neg()), t995]))
  let t994 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t993 = @simp.asm_rewrite_tac(@list.List([@transcendentals.cpow(), @complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t990 = @drule.match_mp(@prime.prime_imp_nz())
  let t992 = @tactics.first_assum(fn(x991 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x987 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s988 = @tactics.assume_tac(x987)
      fn(x989 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s988(x989)
      }
    })(t990(x991))
  })
  let t986 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_mul()]))
  let t985 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_add(), @complexes.complex_mul_2(), @equal.gsym(@complexes.complex_pow_2())]))
  let t984 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t983 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t982 = @simp.simp_tac(@list.List([@vectors.norm_pos_le(), finite_atmost()]))
  let t981 = @tactics.match_mp_tac(@products.product_le_1())
  let t980 = @simp.simp_tac(@list.List([@complexes.norm_cproduct(), finite_atmost(), @real.real_inv_1()]))
  let t979 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_mul(), @equal.gsym(@complexes.complex_pow_inv()), @complexes.complex_inv_inv()]))
  let t978 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.cproduct_inv()), @complexes.complex_inv_inv(), finite_atmost()]))
  let t976 = @equal.gsym(@complexes.cproduct_mul())
  let t977 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cproduct_pow()), finite_atmost(), t976]))
  let t974 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt()]))
  let t971 = @drule.match_mp(@prime.prime_ge_2())
  let t973 = @tactics.first_assum(fn(x972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x968 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s969 = @tactics.mp_tac(x968)
      fn(x970 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s969(x970)
      }
    })(t971(x972))
  })
  let t967 = @tactics.match_mp_tac(@transcendentals.log_pos_lt())
  let t966 = @simp.asm_rewrite_tac(@list.List([]))
  let t965 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (x : Real) && real_of_num(0) < (y : Real) → !(x == real_of_num(0) || y == real_of_num(0))")))
  let t964 = @simp.asm_rewrite_tac(@list.List([@realarith.real_entire(), @complexes.re_add(), @complexes.re_mul_cx(), @complexes.re_mul_ii(), @calc_int.real_neg_0(), @calc_int.real_add_rid(), @calc_int.real_mul_rzero()]))
  let t963 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.real()])))
  let t962 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @real.real_of_num_lt(), @prime.prime_imp_nz(), @arith.lt_nz(), @transcendentals.real_exp_eq_1(), @complexes.real_cx(), @complexes.re_cx()]))
  let t961 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv(), @trivia.o_thm(), @complexes.complex_norm_cx(), @calc_int.real_abs_num(), @real.real_inv_inv(), @real.real_inv_1()]))
  let t957 = @term_syntax.parse_term("o(norm, inv)")
  let t960 = @tactics.disch_then(fn(x959 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x954 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s955 = @tactics.mp_tac(x954)
      fn(x956 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s955(x956)
      }
    })(((x958 : @kernel.Thm) => @equal.ap_term(t957, x958))(x959))
  })
  let t953 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t952 = @tactics.repeat_tac(@tactics.conj_tac)
  let t975 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((!(p : Bool) || !(q : Bool)) || !(r : Bool)) == (p && q → !r)"))])), t952), t953), @tactics.strip_tac), t960), t961), t962), t963), t964), t965), t966), t967), t973), t974), @int.arith_tac), @tactics.all_tac])
  let t951 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @class.not_exists_thm()]))
  let t950 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(Cx(real_of_num(1)) - (x : Cart[Real, 2]) == Cx(real_of_num(0))) == (x == Cx(real_of_num(1)))"))]))
  let t949 = @simp.asm_simp_tac(@list.List([@complexes.complex_entire(), @complexes.complex_pow_eq_0(), @calc_num.arith(), @complexes.complex_inv_eq_0(), @complexes.cproduct_eq_0(), @sets.in_elim_thm(), finite_atmost()]))
  let t948 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_norm_inv()), @complexes.complex_norm_nz(), @complexes.complex_inv_eq_0()]))
  let t947 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t946 = @simp.gen_rewrite_tac(fn(x943 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s944 = @equal.binop_conv(x943)
    fn(x945 : @kernel.Term) -> @kernel.Thm raise {
      s944(x945)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t942 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t941 = @simp.rewrite_tac(@list.List([@arith.le_0()]))
  let t940 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t938 = @simp.asm_rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_mul_cx(), @complexes.re_mul_ii(), @calc_int.real_neg_0(), @calc_int.real_add_rid(), @calc_int.real_mul_rzero()]))
  let t937 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.real()])))
  let t936 = @tactics.match_mp_tac(euler_product())
  let t935 = @tactics.match_mp_tac(@canal.lim_complex_pow())
  let t939 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.lim_complex_mul()), @tactics.conj_tac)), t935), t936), t937), t938), @tactics.all_tac])
  let t934 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially(), @metric.trivial_limit_sequentially()]))
  let t933 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => pow(cproduct({(p : Num) | prime(p) && p <= n}, (p : Num) => inv(Cx(real_of_num(1)) - inv(cpow(Cx(real_of_num(p)), (x : Cart[Real, 2]))))), 3) * (pow(cproduct({(p : Num) | prime(p) && p <= n}, (p : Num) => inv(Cx(real_of_num(1)) - inv(cpow(Cx(real_of_num(p)), x + ii * (y : Cart[Real, 2]))))), 4) * pow(cproduct({(p : Num) | prime(p) && p <= n}, (p : Num) => inv(Cx(real_of_num(1)) - inv(cpow(Cx(real_of_num(p)), x + Cx(real_of_num(2)) * (ii * y))))), 2))"))
  let t932 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_norm_lbound()))
  let t1080 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t932), t933), t934), @tactics.conj_tac), t939), t940), t941), t942), t946), t947), t948), t949), t950), t951), @tactics.conj_tac), t975), t977), t978), t979), t980), t981), t982), t983), t984), @tactics.strip_tac), t985), t986), t992), t993), t994), t996), t1004), t1008), t1009), t1010), t1011), t1015), t1016), t1017), t1018), t1019), t1020), t1021), t1022), t1023), t1024), t1025), t1026), t1027), t1028), t1032), t1039), t1040), t1042), t1043), t1049), t1050), t1051), @tactics.conj_tac), t1061), t1062), t1063), t1064), t1065), t1066), t1067), @tactics.conj_tac), t1074), t1078), t1079)
  zeta_multiple_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], real(x) && real(y) && real_of_num(1) < Re(x) → real_of_num(1) <= norm(pow(zeta(x), 3) * (pow(zeta(x + ii * y), 4) * pow(zeta(x + Cx(real_of_num(2)) * (ii * y)), 2)))"), t1080))
}

///|
let zeta_multiple_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETA_MULTIPLE_BOUND")

///|
/// `ZETA_MULTIPLE_BOUND`
pub fn zeta_multiple_bound() -> @kernel.Thm {
  zeta_multiple_bound_c.get()
}

///|
/// ZETA_NONZERO
fn step_37() -> Unit raise {
  let t1167 = @simp.asm_simp_tac(@list.List([@class.eta_ax(), complex_differentiable_nearzeta(), @complexes.re_cx(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t1166 = @tactics.match_mp_tac(@canal.complex_differentiable_imp_continuous_at())
  let t1165 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.continuous_at())]))
  let t1164 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t1163 = @tactics.match_mp_tac(@topology.lim_add())
  let t1162 = @tactics.match_mp_tac(@canal.lim_complex_pow())
  let t1161 = @simp.simp_tac(@list.List([@topology.lim_sub(), @topology.lim_const(), @topology.lim_at_id()]))
  let t1160 = @tactics.match_mp_tac(@canal.lim_complex_mul())
  let t1159 = @tactics.subst1_tac(@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(0)) == pow(nearzeta(1, Cx(real_of_num(1))) + Cx(real_of_num(1)), 3) * (Cx(real_of_num(1)) - Cx(real_of_num(1)))")))
  let t1158 = @tactics.match_mp_tac(@topology.lim_at_within())
  let t1156 = @meson.meson_tac(@list.List([@real.real_lt_01()]))
  let t1155 = @simp.simp_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_mul_lzero(), @complexes.complex_norm_0()]))
  let t1154 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.vector_sub_rzero(), @vectors.vector_sub_refl()]))
  let t1153 = @complexes.complex_field(@term_syntax.parse_term("!((x : Cart[Real, 2]) == (a : Cart[Real, 2])) → (b : Cart[Real, 2]) * (x - a) - pow((c : Cart[Real, 2]) / (x - a), 3) * pow(x - a, 4) == (b - pow(c, 3)) * (x - a)"))
  let t1157 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@topology.lim_within(), @transcendentals.cpow_1(), @equal.gsym(@vectors.dist_nz()), zeta(), genzeta(), @complexes.complex_div_1(), t1153])), t1154), t1155), t1156), @tactics.all_tac])
  let t1152 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) => pow(nearzeta(1, x) + Cx(real_of_num(1)), 3) * (x - Cx(real_of_num(1)))"))
  let t1151 = @tactics.match_mp_tac(@topology.lim_transform())
  let t1149 = @simp.asm_rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_mul_ii(), @complexes.complex_ring(@term_syntax.parse_term("((x : Cart[Real, 2]) + (y : Cart[Real, 2]) == x) == (y == Cx(real_of_num(0)))")), @complexes.im_cx(), @complexes.complex_entire(), @complexes.ii_nz(), @complexes.re_cx(), @complexes.cx_inj()]))
  let t1148 = @tactics.match_mp_tac(complex_differentiable_at_zeta())
  let t1147 = @simp.simp_tac(@list.List([@canal.complex_differentiable_add(), @canal.complex_differentiable_const(), @canal.complex_differentiable_id()]))
  let t1146 = @tactics.match_mp_tac(@canal.complex_differentiable_compose_at())
  let t1145 = @simp.gen_rewrite_tac(fn(x1142 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1143 = @equal.land_conv(x1142)
    fn(x1144 : @kernel.Term) -> @kernel.Thm raise {
      s1143(x1144)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t1141 = @simp.rewrite_tac(@list.List([@canal.has_complex_derivative_differentiable()]))
  let t1140 = @tactics.match_mp_tac(@canal.has_complex_derivative_at_within())
  let t1139 = @list.List([@tactics.all_tac, @simp.asm_rewrite_tac(@list.List([@canal.has_complex_derivative_within(), @complexes.complex_sub_rzero()]))])
  let t1138 = @tactics.subgoal_then(@term_syntax.parse_term("has_complex_derivative((x : Cart[Real, 2]) => zeta(x + ii * Cx((y : Real))), complex_derivative((x : Cart[Real, 2]) => zeta(x + ii * Cx(y)), Cx(real_of_num(1))), within(at(Cx(real_of_num(1))), {(s : Cart[Real, 2]) | real(s) && real_of_num(1) < Re(s)}))"), fn(x1135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1136 = @tactics.mp_tac(x1135)
    fn(x1137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1136(x1137)
    }
  })
  let t1150 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.lim_complex_pow()), t1138), t1139), t1140), t1141), t1145), t1146), t1147), t1148), t1149), @calc_rat.real_arith_tac)])
  let t1134 = @tactics.match_mp_tac(@canal.lim_complex_mul())
  let t1132 = @meson.meson_tac(@list.List([@real.real_lt_01()]))
  let t1131 = @simp.simp_tac(@list.List([@vectors.dist(), @complexes.complex_vec_0(), @complexes.complex_sub_refl(), @complexes.complex_norm_0()]))
  let t1130 = @complexes.complex_field(@term_syntax.parse_term("!((x : Cart[Real, 2]) == Cx(real_of_num(0))) → (y : Cart[Real, 2]) * pow(x, 4) * pow((z : Cart[Real, 2]) / x, 4) - y * pow(z, 4) == Cx(real_of_num(0))"))
  let t1133 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@topology.lim_within(), @equal.gsym(@vectors.dist_nz()), @complexes.complex_sub_0(), t1130])), t1131), t1132), @tactics.all_tac])
  let t1129 = @simp.rewrite_tac(@list.List([]))
  let t1128 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) => pow(zeta(x), 3) * pow(x - Cx(real_of_num(1)), 4) * pow(zeta(x + ii * Cx((y : Real))) / (x - Cx(real_of_num(1))), 4)"))
  let t1127 = @tactics.match_mp_tac(@topology.lim_transform())
  let t1125 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_entire(), @complexes.ii_nz(), @complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith()]))
  let t1124 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((x : Cart[Real, 2]) + (y : Cart[Real, 2]) == x) == (y == Cx(real_of_num(0)))"))]))
  let t1123 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_mul_cx(), @complexes.re_mul_ii(), @complexes.re_ii(), @complexes.re_cx()]))
  let t1122 = @tactics.match_mp_tac(complex_differentiable_at_zeta())
  let t1121 = @tactics.match_mp_tac(@canal.complex_differentiable_imp_continuous_at())
  let t1120 = @simp.simp_tac(@list.List([@topology.continuous_add(), @topology.continuous_const(), @topology.continuous_at_id()]))
  let t1119 = @tactics.match_mp_tac(@topology.continuous_at_compose())
  let t1118 = @simp.gen_rewrite_tac(fn(x1115 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1116 = @equal.land_conv(x1115)
    fn(x1117 : @kernel.Term) -> @kernel.Thm raise {
      s1116(x1117)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t1114 = @tactics.match_mp_tac(@canal.continuous_complex_pow())
  let t1113 = @tactics.match_mp_tac(@topology.continuous_at_within())
  let t1126 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@topology.continuous_within())])), t1113), t1114), t1118), t1119), t1120), t1121), t1122), t1123), t1124), t1125), @calc_rat.real_arith_tac)])
  let t1112 = @tactics.match_mp_tac(@canal.lim_complex_mul())
  let t1111 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc()]))
  let t1109 = @simp.simp_tac(@list.List([zeta_multiple_bound(), @complexes.real_cx()]))
  let t1108 = @simp.rewrite_tac(@list.List([@real.real_lt_01(), @sets.in_elim_thm()]))
  let t1110 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)")), t1108), t1109)])
  let t1107 = @simp.asm_rewrite_tac(@list.List([]))
  let t1105 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (e : Real)"))
  let t1104 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub()), @real.real_add_sub(), @complexes.complex_norm_cx()]))
  let t1103 = @simp.rewrite_tac(@list.List([@vectors.dist(), @complexes.cx_inj(), @sets.in_elim_thm(), @complexes.real_cx(), @complexes.re_cx()]))
  let t1102 = @tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(1) + (e : Real))"))
  let t1101 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1106 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.limpt_approachable_le()])), t1101), @tactics.disch_tac), t1102), t1103), t1104), t1105), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1100 = @tactics.subgoal_then(@term_syntax.parse_term("limit_point_of(Cx(real_of_num(1)), {(s : Cart[Real, 2]) | real(s) && real_of_num(1) < Re(s)})"), fn(x1097 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1098 = @tactics.assume_tac(x1097)
    fn(x1099 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1098(x1099)
    }
  })
  let t1096 = @simp.rewrite_tac(@list.List([@topology.eventually_within(), @topology.trivial_limit_within()]))
  let t1095 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) => pow(zeta(x), 3) * (pow(zeta(x + ii * Cx((y : Real))), 4) * pow(zeta(x + Cx(real_of_num(2)) * (ii * Cx(y))), 2))"))
  let t1094 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("within(at(Cx(real_of_num(1))), {(s : Cart[Real, 2]) | real(s) && real_of_num(1) < Re(s)})"), @topology.lim_norm_lbound()))
  let t1092 = @simp.simp_tac(@list.List([]))
  let t1093 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @complexes.complex_mul_lzero()])), @calc_rat.real_arith_tac), t1092])
  let t1091 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num(1) <= norm(Cx(real_of_num(0)) * pow(complex_derivative((x : Cart[Real, 2]) => zeta(x + ii * Cx((y : Real))), Cx(real_of_num(1))), 4) * pow(zeta(Cx(real_of_num(1)) + Cx(real_of_num(2)) * (ii * Cx(y))), 2)))"), fn(x1088 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1089 = @tactics.mp_tac(x1088)
    fn(x1090 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1089(x1090)
    }
  })
  let t1087 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_rzero(), @complexes.complex_add_rid(), zeta_1_nz()]))
  let t1086 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Real) == real_of_num(0)"))
  let t1085 = @simp.abbrev_tac(@term_syntax.parse_term("(y : Real) == Im((s : Cart[Real, 2]))"))
  let t1084 = @simp.asm_rewrite_tac(@list.List([]))
  let t1083 = @tactics.subst1_tac(@bool.spec(@term_syntax.parse_term("(s : Cart[Real, 2])"), @complexes.complex_expand()))
  let t1082 = @simp.asm_simp_tac(@list.List([zeta_nonzero_lemma()]))
  let t1081 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1168 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) <= (x : Real)) == (real_of_num(1) < x || x == real_of_num(1))"))])), t1081), @tactics.strip_tac), t1082), t1083), t1084), t1085), t1086), t1087), @tactics.disch_tac), t1091), t1093), t1094), t1095), t1096), t1100), t1106), t1107), @tactics.conj_tac), t1110), t1111), t1112), @tactics.conj_tac), t1126), t1127), t1128), t1129), @tactics.conj_tac), t1133), t1134), @tactics.conj_tac), t1150), t1151), t1152), @tactics.conj_tac), t1157), t1158), t1159), t1160), t1161), t1162), t1163), t1164), t1165), t1166), t1167)
  zeta_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) <= Re(s) → !(zeta(s) == Cx(real_of_num(0)))"), t1168))
}

///|
let zeta_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZETA_NONZERO")

///|
/// `ZETA_NONZERO`
pub fn zeta_nonzero() -> @kernel.Thm {
  zeta_nonzero_c.get()
}

///|
/// NEARZETA_NONZERO
fn step_38() -> Unit raise {
  let t1181 = @tactics.conv_tac(@complexes.complex_field)
  let t1180 = @tactics.repeat_tac(@tactics.pop_assum(fn(x1177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1178 = @tactics.mp_tac(x1177)
    fn(x1179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1178(x1179)
    }
  }))
  let t1176 = @simp.asm_simp_tac(@list.List([nearzeta_1(), @calc_num.arith(), @transcendentals.cpow_1()]))
  let t1175 = @simp.rewrite_tac(@list.List([zeta(), genzeta()]))
  let t1172 = @drule.match_mp(zeta_nonzero())
  let t1174 = @tactics.first_assum(fn(x1173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1170 = @tactics.mp_tac(x1169)
      fn(x1171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1170(x1171)
      }
    })(t1172(x1173))
  })
  let t1182 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1174), t1175), @class.cond_cases_tac), t1176), t1180), t1181)
  nearzeta_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) <= Re(s) → !(nearzeta(1, s) + Cx(real_of_num(1)) == Cx(real_of_num(0)))"), t1182))
}

///|
let nearzeta_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEARZETA_NONZERO")

///|
/// `NEARZETA_NONZERO`
pub fn nearzeta_nonzero() -> @kernel.Thm {
  nearzeta_nonzero_c.get()
}

///|
/// NORM_CLOG_BOUND
fn step_39() -> Unit raise {
  let t1213 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("1"), @complexes.complex_norm_num()))
  let t1212 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t1211 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv()]))
  let t1210 = @tactics.subst1_tac(@equal.sym(@calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("inv(real_of_num(1) / real_of_num(2))"))))
  let t1208 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @complexes.re_cx()]))
  let t1207 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(w : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t1206 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @realarith.real_sub_lt()]))
  let t1205 = @tactics.disch_then(fn(x1204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1203 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_inv(), @complexes.complex_neg_sub()]))
  let t1209 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@canal.complex_diff_tac, @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(Cx(real_of_num(0)) - Cx(real_of_num(1))) * (x : Cart[Real, 2]) == -x"))]))), t1203), t1205), t1206), t1207), t1208), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1202 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t1201 = @simp.rewrite_tac(@list.List([@convex.convex_cball(), @topology.in_cball(), @vectors.dist(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t1199 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1198 = @simp.asm_rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t1197 = @simp.rewrite_tac(@list.List([@topology.in_cball()]))
  let t1196 = @simp.asm_rewrite_tac(@list.List([@topology.centre_in_cball()]))
  let t1195 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1194 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_rzero(), @transcendentals.clog_1()]))
  let t1190 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t1191 = @list.List([@term_syntax.parse_term("(z : Cart[Real, 2])"), t1190])
  let t1200 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1188 = @tactics.mp_tac(x1187)
      fn(x1189 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1188(x1189)
      }
    })(((x1192 : @kernel.Thm) => @bool.specl(t1191, x1192))(x1193))
  }), t1194), t1195), t1196), t1197), t1198), t1199)])
  let t1183 = @term_syntax.parse_term("real_of_num(2)")
  let t1184 = @term_syntax.parse_term("cball((Cx(real_of_num(0)), real_of_num(1) / real_of_num(2)))")
  let t1185 = @term_syntax.parse_term("(z : Cart[Real, 2]) => inv(z - Cx(real_of_num(1)))")
  let t1186 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => clog(Cx(real_of_num(1)) - z)"), t1185, t1184, t1183]), @canal.complex_differentiable_bound()))
  let t1214 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1186), @tactics.ants_tac), t1200), t1201), t1202), @tactics.disch_tac), @tactics.conj_tac), t1209), t1210), t1211), t1212), t1213), @vectors.asm_norm_arith_tac)
  norm_clog_bound_c.set(@tactics.prove(@term_syntax.parse_term("norm((z : Cart[Real, 2])) <= real_of_num(1) / real_of_num(2) → norm(clog(Cx(real_of_num(1)) - z)) <= real_of_num(2) * norm(z)"), t1214))
}

///|
let norm_clog_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_CLOG_BOUND")

///|
/// `NORM_CLOG_BOUND`
pub fn norm_clog_bound() -> @kernel.Thm {
  norm_clog_bound_c.get()
}

///|
/// LOGZETA_EXISTS
fn step_40() -> Unit raise {
  let t1309 = @simp.rewrite_tac(@list.List([@complexes.re_neg(), @complexes.re_cx()]))
  let t1306 = @drule.match_mp(@canal.in_ball_re())
  let t1308 = @tactics.first_assum(fn(x1307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1304 = @tactics.mp_tac(x1303)
      fn(x1305 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1304(x1305)
      }
    })(t1306(x1307))
  })
  let t1302 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real_mono(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @prime.prime_ge_2(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 < p"))]))
  let t1301 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cpow_neg())]))
  let t1298 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t1297 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1299 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@complexes.complex_div(), @complexes.complex_norm_mul(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()])), t1297), t1298)
  let t1296 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lid()]))
  let t1293 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (a : Real) → (y : Real) <= x → y <= a")))
  let t1295 = @tactics.first_x_assum(fn(x1294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1293(x1294))
  })
  let t1300 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(norm_clog_bound()), t1295), t1296), t1299])
  let t1292 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * norm(inv(cpow(Cx(real_of_num((p : Num))), (y : Cart[Real, 2]))))"))
  let t1291 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1290 = @simp.asm_simp_tac(@list.List([@misc.in_from(), @prime.prime_imp_nz(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t1289 = @tactics.disch_then(fn(x1286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1286
    let t1288 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), @tactics.strip_tac), t1288)
  })
  let t1285 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1284 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1283 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1282 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1281 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1280 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1277 = @drule.match_mp(@topology.series_goestozero())
  let t1274 = @term_syntax.parse_term("real_of_num(1) / real_of_num(2)")
  let t1279 = @tactics.disch_then(fn(x1278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1271 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1272 = @tactics.mp_tac(x1271)
        fn(x1273 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1272(x1273)
        }
      })(((x1275 : @kernel.Thm) => @bool.spec(t1274, x1275))(x1276))
    })(t1277(x1278))
  })
  let t1269 = @tactics.pop_assum(fn(x1266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1267 = @tactics.mp_tac(x1266)
    fn(x1268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1267(x1268)
    }
  })
  let t1265 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t1264 = @tactics.match_mp_tac(zeta_converges())
  let t1263 = @tactics.exists_tac(@term_syntax.parse_term("zeta(Cx(real_of_num(1) + (Re((s : Cart[Real, 2])) - real_of_num(1)) / real_of_num(2)))"))
  let t1270 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.summable()])), t1263), t1264), t1265), t1269), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1262 = @tactics.subgoal_then(@term_syntax.parse_term("summable(from(1), (n : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(n)), Cx(real_of_num(1) + (Re((s : Cart[Real, 2])) - real_of_num(1)) / real_of_num(2))))"), fn(x1259 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1260 = @tactics.mp_tac(x1259)
    fn(x1261 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1260(x1261)
    }
  })
  let t1258 = @list.List([@simp.simp_tac(@list.List([@transcendentals.cpow_real_real(), @misc.in_from(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.lt_nz(), @prime.prime_imp_nz(), @equal.gsym(@complexes.cx_div()), @complexes.real_cx(), @real.real_le_div(), @realarith.real_pos(), @transcendentals.real_exp_pos_le()])), @tactics.all_tac])
  let t1256 = @tactics.pop_assum(fn(x1253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1254 = @tactics.mp_tac(x1253)
    fn(x1255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1254(x1255)
    }
  })
  let t1252 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t1251 = @tactics.match_mp_tac(zeta_converges())
  let t1250 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t1249 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("inv((x : Cart[Real, 2])) == Cx(real_of_num(1)) * inv(x)"))]))
  let t1248 = @tactics.exists_tac(@term_syntax.parse_term("zeta(Cx(real_of_num(1) + (Re((s : Cart[Real, 2])) - real_of_num(1)) / real_of_num(2)))"))
  let t1247 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t1246 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @misc.in_from(), @prime.prime_ge_2(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p"))]))
  let t1244 = @equal.gsym(@complexes.cx_inv())
  let t1245 = @simp.simp_tac(@list.List([@transcendentals.cpow_real_real(), @misc.in_from(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(0 < (n : Num)) == (1 <= n)")), t1244, @real.real_le_inv_eq(), @transcendentals.real_exp_pos_le()]))
  let t1243 = @tactics.exists_tac(@term_syntax.parse_term("from(1)"))
  let t1242 = @tactics.match_mp_tac(@canal.summable_subset_complex())
  let t1241 = @tactics.match_mp_tac(@canal.summable_complex_lmul())
  let t1257 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div()])), t1241), t1242), t1243), t1245), t1246), t1247), t1248), t1249), t1250), t1251), t1252), t1256), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1240 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @realarith.real_sub_lt(), @theorems.right_exists_and_thm()]))
  let t1239 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) => Cx(real_of_num(2)) / cpow(Cx(real_of_num(p)), Cx(real_of_num(1) + (Re((s : Cart[Real, 2])) - real_of_num(1)) / real_of_num(2)))"))
  let t1238 = @tactics.exists_tac(@term_syntax.parse_term("(Re((s : Cart[Real, 2])) - real_of_num(1)) / real_of_num(2)"))
  let t1237 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : Cart[Real, 2])"))
  let t1236 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_gt()]))
  let t1234 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos_lt(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(1 < (p : Num)) == (2 <= p)")), @prime.prime_ge_2()]))
  let t1233 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t1232 = @simp.rewrite_tac(@list.List([@real.real_lt_lneg(), @calc_int.real_add_rid()]))
  let t1230 = @equal.gsym(@transcendentals.real_exp_0())
  let t1231 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_neg()), t1230, @transcendentals.real_exp_mono_lt()]))
  let t1229 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_inv(), @transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.lt_nz(), @prime.prime_imp_nz()]))
  let t1228 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t1227 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_ge_re_im()]))
  let t1226 = @tactics.exists_tac(@term_syntax.parse_term("norm(inv(cpow(Cx(real_of_num((p : Num))), (s : Cart[Real, 2]))))"))
  let t1225 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ y : Real, abs((x : Real)) <= y && y < (w : Real) → x < w")))
  let t1224 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @realarith.real_sub_lt()]))
  let t1223 = @tactics.disch_then(fn(x1222 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1221 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @prime.prime_imp_nz(), @complexes.complex_field(@term_syntax.parse_term("!((y : Cart[Real, 2]) == Cx(real_of_num(0))) → y * (Cx(real_of_num(1)) - inv(y)) == y - Cx(real_of_num(1))"))]))
  let t1219 = @equal.gsym(@complexes.complex_inv_mul())
  let t1220 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc()), t1219]))
  let t1218 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lneg(), @complexes.complex_neg_neg()]))
  let t1217 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @prime.prime_imp_nz(), @complexes.complex_sub_lzero(), @complexes.complex_mul_lid(), @complexes.complex_field(@term_syntax.parse_term("!((x : Cart[Real, 2]) == Cx(real_of_num(0))) → -((a : Cart[Real, 2]) * x) / pow(x, 2) == -(a / x)"))]))
  let t1216 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1235 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_gt()])), t1216), @canal.complex_diff_tac), t1217), t1218), t1220), t1221), t1223), t1224), t1225), t1226), t1227), t1228), t1229), t1231), t1232), t1233), t1234), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1215 = @simp.rewrite_tac(@list.List([@canal.open_halfspace_re_gt()]))
  let t1310 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.series_and_derivative_comparison_complex()), t1215), @tactics.conj_tac), t1235), t1236), t1237), @tactics.disch_tac), t1238), t1239), t1240), @tactics.conj_tac), t1257), @tactics.conj_tac), t1258), t1262), t1270), t1279), t1280), t1281), t1282), t1283), t1284), t1285), t1289), t1290), @tactics.disch_tac), t1291), t1292), @tactics.conj_tac), t1300), t1301), t1302), t1308), t1309), @calc_rat.real_arith_tac)
  logzeta_exists_c.set(@tactics.prove(@term_syntax.parse_term("∃ logzeta : (Cart[Real, 2]) -> Cart[Real, 2], ∃ logzeta' : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : Cart[Real, 2], IN(s, {(s : Cart[Real, 2]) | Re(s) > real_of_num(1)}) → sums((p : Num) => clog(Cx(real_of_num(1)) - inv(cpow(Cx(real_of_num(p)), s))), logzeta(s), {(p : Num) | prime(p)}) && sums((p : Num) => clog(Cx(real_of_num(p))) / (cpow(Cx(real_of_num(p)), s) - Cx(real_of_num(1))), logzeta'(s), {(p : Num) | prime(p)}) && has_complex_derivative(logzeta, logzeta'(s), at(s))"), t1310))
}

///|
let logzeta_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOGZETA_EXISTS")

///|
/// `LOGZETA_EXISTS`
pub fn logzeta_exists() -> @kernel.Thm {
  logzeta_exists_c.get()
}

///|
/// LOGZETA_PROPERTIES
fn step_41() -> Unit raise {
  logzeta_properties_c.set(@nums.new_specification(@list.List(["logzeta", "logzeta'"]))(logzeta_exists()))
}

///|
let logzeta_properties_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOGZETA_PROPERTIES")

///|
/// `LOGZETA_PROPERTIES`
pub fn logzeta_properties() -> @kernel.Thm {
  logzeta_properties_c.get()
}

///|
let logzeta_converges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOGZETA_CONVERGES")

///|
/// `LOGZETA_CONVERGES`
pub fn logzeta_converges() -> @kernel.Thm {
  logzeta_converges_c.get()
}

///|
let logzeta_p_converges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOGZETA'_CONVERGES")

///|
/// `LOGZETA'_CONVERGES`
pub fn logzeta_p_converges() -> @kernel.Thm {
  logzeta_p_converges_c.get()
}

///|
let has_complex_derivative_logzeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_LOGZETA")

///|
/// `HAS_COMPLEX_DERIVATIVE_LOGZETA`
pub fn has_complex_derivative_logzeta() -> @kernel.Thm {
  has_complex_derivative_logzeta_c.get()
}

///|
/// LOGZETA_CONVERGES, LOGZETA'_CONVERGES, HAS_COMPLEX_DERIVATIVE_LOGZETA
fn step_42() -> Unit raise {
  match @bool.conjuncts_rule(@simp.rewrite_rule(@list.List([@sets.in_elim_thm(), @theorems.forall_and_thm(), @realax.real_gt(), @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) && (c : Bool)) == ((a → b) && (a → c))"))]))(logzeta_properties())) {
    More(logzeta_converges, tail=More(logzeta_p_converges, tail=More(has_complex_derivative_logzeta, tail=Empty))) => {
      logzeta_converges_c.set(logzeta_converges)
      logzeta_p_converges_c.set(logzeta_p_converges)
      has_complex_derivative_logzeta_c.set(has_complex_derivative_logzeta)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:1176:4")
  }
}

///|
/// CEXP_LOGZETA
fn step_43() -> Unit raise {
  let t1355 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt()]))
  let t1352 = @drule.match_mp(@prime.prime_ge_2())
  let t1354 = @tactics.first_assum(fn(x1353 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1349 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1350 = @tactics.mp_tac(x1349)
      fn(x1351 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1350(x1351)
      }
    })(t1352(x1353))
  })
  let t1348 = @tactics.match_mp_tac(@transcendentals.log_pos_lt())
  let t1347 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t1346 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (s : Real) → !(s == real_of_num(0))"))]))
  let t1345 = @simp.rewrite_tac(@list.List([@real.real_neg_eq_0(), @realarith.real_entire()]))
  let t1343 = @equal.gsym(@transcendentals.real_exp_neg())
  let t1344 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_0()), t1343, @transcendentals.real_exp_inj()]))
  let t1342 = @tactics.conv_tac(@equal.rand_conv(@equal.sym_conv))
  let t1341 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @complexes.real_cx(), @real.real_of_num_lt(), @complexes.re_cx(), @calc_int.real_abs_num(), @complexes.complex_norm_inv(), @prime.prime_imp_nz(), @arith.lt_nz(), @complexes.complex_norm_cx(), @transcendentals.real_exp_eq_1()]))
  let t1337 = @term_syntax.parse_term("(norm : (Cart[Real, 2]) -> Real)")
  let t1340 = @tactics.disch_then(fn(x1339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1335 = @tactics.mp_tac(x1334)
      fn(x1336 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1335(x1336)
      }
    })(((x1338 : @kernel.Thm) => @equal.ap_term(t1337, x1338))(x1339))
  })
  let t1333 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_0()]))
  let t1332 = @tactics.match_mp_tac(@transcendentals.cexp_clog())
  let t1331 = @tactics.conv_tac(@equal.sym_conv)
  let t1330 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @transcendentals.cexp_neg()]))
  let t1329 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1328 = @tactics.match_mp_tac(@complexes.cproduct_eq())
  let t1327 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER({(x : _) | (P : (_) -> Bool)(x)}, {(x : _) | (Q : (_) -> Bool)(x)}) == {(x : _) | P(x) && Q(x)}"))]))
  let t1326 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_eq(), @iterate.numseg(), @arith.le_0()]))
  let t1325 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1324 = @tactics.match_mp_tac(@metric.always_eventually())
  let t1323 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t1322 = @simp.asm_simp_tac(@list.List([euler_product()]))
  let t1321 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => cproduct({(p : Num) | prime(p) && p <= n}, (p : Num) => inv(Cx(real_of_num(1)) - inv(cpow(Cx(real_of_num(p)), (s : Cart[Real, 2])))))"))
  let t1320 = @tactics.match_mp_tac(@topology.lim_transform())
  let t1356 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@transcendentals.cexp_vsum(), @misc.finite_inter_numseg()])), t1320), t1321), t1322), t1323), t1324), t1325), t1326), t1327), t1328), t1329), t1330), @tactics.strip_tac), @tactics.ap_term_tac), t1331), t1332), t1333), t1340), t1341), t1342), t1344), t1345), t1346), t1347), t1348), t1354), t1355), @int.arith_tac)
  let t1319 = @simp.asm_simp_tac(@list.List([logzeta_converges()]))
  let t1318 = @tactics.match_mp_tac(@topology.series_neg())
  let t1317 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.sums())]))
  let t1316 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1315 = @simp.rewrite_tac(@list.List([@transcendentals.continuous_at_cexp(), @trivia.o_def()]))
  let t1314 = @term_syntax.parse_term("-logzeta((s : Cart[Real, 2]))")
  let t1357 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("cexp"), t1314]), @topology.continuous_at_sequentially())), t1315), t1316), t1317), t1318), t1319), t1356])
  let t1313 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t1312 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => cexp(vsum(INTER({(p : Num) | prime(p)}, op_dot_dot(0, n)), (p : Num) => -clog(Cx(real_of_num(1)) - inv(cpow(Cx(real_of_num(p)), (s : Cart[Real, 2]))))))"))
  let t1311 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_unique()))
  let t1358 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1311), t1312), t1313), @tactics.conj_tac), t1357)
  cexp_logzeta_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → cexp(-logzeta(s)) == zeta(s)"), t1358))
}

///|
let cexp_logzeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CEXP_LOGZETA")

///|
/// `CEXP_LOGZETA`
pub fn cexp_logzeta() -> @kernel.Thm {
  cexp_logzeta_c.get()
}

///|
/// HAS_COMPLEX_DERIVATIVE_ZETA
fn step_44() -> Unit raise {
  let t1389 = @simp.asm_simp_tac(@list.List([has_complex_derivative_logzeta()]))
  let t1388 = @tactics.match_mp_tac(@canal.has_complex_derivative_neg())
  let t1387 = @simp.asm_simp_tac(@list.List([@equal.gsym(cexp_logzeta()), @transcendentals.has_complex_derivative_cexp()]))
  let t1386 = @tactics.match_mp_tac(@canal.complex_diff_chain_at())
  let t1385 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t1384 = @simp.gen_rewrite_tac(fn(x1383 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1377 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1378 = @equal.rator_conv(x1377)
      fn(x1379 : @kernel.Term) -> @kernel.Thm raise {
        s1378(x1379)
      }
    })((fn(x1380 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1381 = @equal.land_conv(x1380)
      fn(x1382 : @kernel.Term) -> @kernel.Thm raise {
        s1381(x1382)
      }
    })(x1383))
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t1375 = @tactics.pop_assum(fn(x1372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1373 = @tactics.mp_tac(x1372)
    fn(x1374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1373(x1374)
    }
  })
  let t1369 = @drule.match_mp(@canal.in_ball_re())
  let t1371 = @tactics.first_x_assum(fn(x1370 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1367 = @tactics.mp_tac(x1366)
      fn(x1368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1367(x1368)
      }
    })(t1369(x1370))
  })
  let t1365 = @tactics.match_mp_tac(cexp_logzeta())
  let t1364 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1363 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.in_ball())]))
  let t1376 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@vectors.dist_sym()])), t1363), t1364), t1365), t1371), t1375), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1362 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_lt()]))
  let t1361 = @tactics.exists_tac(@term_syntax.parse_term("Re((s : Cart[Real, 2])) - real_of_num(1)"))
  let t1360 = @tactics.exists_tac(@term_syntax.parse_term("(s : Cart[Real, 2]) => cexp(-logzeta(s))"))
  let t1359 = @tactics.match_mp_tac(@canal.has_complex_derivative_transform_at())
  let t1390 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1359), t1360), t1361), t1362), @tactics.conj_tac), t1376), t1384), t1385), t1386), t1387), t1388), t1389)
  has_complex_derivative_zeta_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → has_complex_derivative(zeta, -logzeta'(s) * zeta(s), at(s))"), t1390))
}

///|
let has_complex_derivative_zeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_ZETA")

///|
/// `HAS_COMPLEX_DERIVATIVE_ZETA`
pub fn has_complex_derivative_zeta() -> @kernel.Thm {
  has_complex_derivative_zeta_c.get()
}

///|
/// COMPLEX_DERIVATIVE_ZETA
fn step_45() -> Unit raise {
  let t1392 = @simp.asm_simp_tac(@list.List([has_complex_derivative_zeta()]))
  let t1391 = @tactics.match_mp_tac(@canal.has_complex_derivative_derivative())
  let t1393 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1391), t1392)
  complex_derivative_zeta_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → complex_derivative(zeta, s) == -logzeta'(s) * zeta(s)"), t1393))
}

///|
let complex_derivative_zeta_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_ZETA")

///|
/// `COMPLEX_DERIVATIVE_ZETA`
pub fn complex_derivative_zeta_v1() -> @kernel.Thm {
  complex_derivative_zeta_v1_c.get()
}

///|
/// CONVERGES_LOGZETA''
fn step_46() -> Unit raise {
  let t1400 = @simp.simp_tac(@list.List([@transcendentals.cx_log(), @real.real_of_num_lt(), @arith.lt_nz(), @prime.prime_imp_nz()]))
  let t1399 = @simp.asm_simp_tac(@list.List([logzeta_p_converges(), @sets.in_elim_thm()]))
  let t1398 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) => clog(Cx(real_of_num(p))) / (cpow(Cx(real_of_num(p)), (s : Cart[Real, 2])) - Cx(real_of_num(1)))"))
  let t1401 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.sums_eq()), t1398), t1399), t1400)
  let t1402 = @list.List([@simp.asm_simp_tac(@list.List([zeta_nonzero_lemma(), complex_derivative_zeta_v1(), @complexes.complex_field(@term_syntax.parse_term("!((b : Cart[Real, 2]) == Cx(real_of_num(0))) → (-((a : Cart[Real, 2]) / b) == (c : Cart[Real, 2])) == (a == -c * b)"))])), t1401])
  let t1397 = @tactics.subgoal_then(@term_syntax.parse_term("-(complex_derivative(zeta, (s : Cart[Real, 2])) / zeta(s)) == logzeta'(s)"), fn(x1394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1395 = @tactics.subst1_tac(x1394)
    fn(x1396 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1395(x1396)
    }
  })
  let t1403 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1397), t1402)
  converges_logzeta_p_p_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → sums((p : Num) => Cx(log(real_of_num(p))) / (cpow(Cx(real_of_num(p)), s) - Cx(real_of_num(1))), -(complex_derivative(zeta, s) / zeta(s)), {(p : Num) | prime(p)})"), t1403))
}

///|
let converges_logzeta_p_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVERGES_LOGZETA''")

///|
/// `CONVERGES_LOGZETA''`
pub fn converges_logzeta_p_p() -> @kernel.Thm {
  converges_logzeta_p_p_c.get()
}

///|
/// VALID_PATH_NEGATEPATH
fn step_47() -> Unit raise {
  let t1404 = @simp.asm_simp_tac(@list.List([@cauchy.piecewise_differentiable_neg()]))
  let t1405 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cauchy.valid_path(), @trivia.o_def()])), t1404)
  valid_path_negatepath_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], valid_path(g) → valid_path(o(op_minus_minus, g))"), t1405))
}

///|
let valid_path_negatepath_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALID_PATH_NEGATEPATH")

///|
/// `VALID_PATH_NEGATEPATH`
pub fn valid_path_negatepath() -> @kernel.Thm {
  valid_path_negatepath_c.get()
}

///|
/// PATHSTART_NEGATEPATH
fn step_48() -> Unit raise {
  let t1406 = @simp.rewrite_tac(@list.List([@paths.pathstart(), @trivia.o_thm()]))
  pathstart_negatepath_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], pathstart(o(op_minus_minus, g)) == -pathstart(g)"), t1406))
}

///|
let pathstart_negatepath_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATHSTART_NEGATEPATH")

///|
/// `PATHSTART_NEGATEPATH`
pub fn pathstart_negatepath() -> @kernel.Thm {
  pathstart_negatepath_c.get()
}

///|
/// PATHFINISH_NEGATEPATH
fn step_49() -> Unit raise {
  let t1407 = @simp.rewrite_tac(@list.List([@paths.pathfinish(), @trivia.o_thm()]))
  pathfinish_negatepath_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], pathfinish(o(op_minus_minus, g)) == -pathfinish(g)"), t1407))
}

///|
let pathfinish_negatepath_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATHFINISH_NEGATEPATH")

///|
/// `PATHFINISH_NEGATEPATH`
pub fn pathfinish_negatepath() -> @kernel.Thm {
  pathfinish_negatepath_c.get()
}

///|
/// PATH_IMAGE_NEGATEPATH
fn step_50() -> Unit raise {
  let t1408 = @simp.rewrite_tac(@list.List([@paths.path_image(), @sets.image_o()]))
  path_image_negatepath_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], path_image(o(op_minus_minus, g)) == IMAGE(op_minus_minus, path_image(g))"), t1408))
}

///|
let path_image_negatepath_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATH_IMAGE_NEGATEPATH")

///|
/// `PATH_IMAGE_NEGATEPATH`
pub fn path_image_negatepath() -> @kernel.Thm {
  path_image_negatepath_c.get()
}

///|
/// HAS_PATH_INTEGRAL_NEGATEPATH
fn step_51() -> Unit raise {
  let t1458 = @simp.asm_simp_tac(@list.List([@equal.gsym(@derivatives.vector_derivative_works()), @derivatives.differentiable_at_within()]))
  let t1457 = @tactics.match_mp_tac(@derivatives.has_vector_derivative_neg())
  let t1456 = @simp.asm_rewrite_tac(@list.List([@vectors.drop_vec(), @real.real_lt_01()]))
  let t1455 = @tactics.match_mp_tac(@derivatives.vector_derivative_within_closed_interval())
  let t1454 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @equal.gsym(@complexes.complex_mul_rneg())]))
  let t1453 = @simp.asm_rewrite_tac(@list.List([]))
  let t1452 = @tactics.disch_then(fn(x1450 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1450
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t1449 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t1448 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t1447 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1446 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1441 = @tactics.assume_tac(x1440)
    fn(x1442 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1441(x1442)
    }
  }, fn(x1443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1444 = @tactics.mp_tac(x1443)
    fn(x1445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1444(x1445)
    }
  }))
  let t1439 = @simp.simp_tac(@list.List([@integration.negligible_finite()]))
  let t1438 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1437 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1431 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1432 = @tactics.assume_tac(x1431)
    fn(x1433 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1432(x1433)
    }
  }, fn(x1434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1435 = @tactics.mp_tac(x1434)
    fn(x1436 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1435(x1436)
    }
  }))
  let t1430 = @simp.rewrite_tac(@list.List([@cauchy.valid_path(), @cauchy.piecewise_differentiable_on()]))
  let t1429 = @tactics.first_assum(fn(x1426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1427 = @tactics.mp_tac(x1426)
    fn(x1428 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1427(x1428)
    }
  })
  let t1425 = @tactics.match_mp_tac(@integration.has_integral_spike_eq())
  let t1424 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1423 = @simp.rewrite_tac(@list.List([@vectors.vector_neg_neg()]))
  let t1420 = @drule.match_mp(@integration.has_integral_neg())
  let t1422 = @tactics.disch_then(fn(x1421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1418 = @tactics.mp_tac(x1417)
      fn(x1419 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1418(x1419)
      }
    })(t1420(x1421))
  })
  let t1416 = @simp.rewrite_tac(@list.List([@cauchy.has_path_integral()]))
  let t1415 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1409 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1410 = @tactics.assume_tac(x1409)
    fn(x1411 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1410(x1411)
    }
  }, fn(x1412 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1413 = @tactics.mp_tac(x1412)
    fn(x1414 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1413(x1414)
    }
  }))
  let t1459 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1415), t1416), t1422), t1423), t1424), t1425), t1429), t1430), t1437), t1438), t1439), @tactics.gen_tac), t1446), t1447), t1448), t1449), t1452), t1453), @tactics.disch_tac), t1454), @tactics.ap_term_tac), t1455), t1456), t1457), t1458)
  has_path_integral_negatepath_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ z : _, valid_path(g) && has_path_integral((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])(-z), -(i : Cart[Real, 2]), g) → has_path_integral(f, i, o(op_minus_minus, g))"), t1459))
}

///|
let has_path_integral_negatepath_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_PATH_INTEGRAL_NEGATEPATH")

///|
/// `HAS_PATH_INTEGRAL_NEGATEPATH`
pub fn has_path_integral_negatepath() -> @kernel.Thm {
  has_path_integral_negatepath_c.get()
}

///|
/// WINDING_NUMBER_NEGATEPATH
fn step_52() -> Unit raise {
  let t1467 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_div()), @cauchy.path_integrable_inversediff()]))
  let t1466 = @tactics.match_mp_tac(@cauchy.has_path_integral_integral())
  let t1465 = @tactics.match_mp_tac(@cauchy.has_path_integral_neg())
  let t1464 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_neg(), @complexes.complex_mul_rneg()]))
  let t1463 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(z : Cart[Real, 2]) - Cx(real_of_num(0)) == -(z - Cx(real_of_num(0)))"))]))
  let t1462 = @tactics.match_mp_tac(has_path_integral_negatepath())
  let t1461 = @tactics.match_mp_tac(@cauchy.path_integral_unique())
  let t1460 = @simp.asm_simp_tac(@list.List([@cauchy.winding_number_valid_path(), valid_path_negatepath(), path_image_negatepath(), @sets.in_image(), @theorems.unwind_thm2(), @complexes.complex_ring(@term_syntax.parse_term("(Cx(real_of_num(0)) == -(x : Cart[Real, 2])) == (x == Cx(real_of_num(0)))"))]))
  let t1468 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1460), @tactics.ap_term_tac), t1461), t1462), t1463), t1464), t1465), t1466), t1467)
  winding_number_negatepath_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ z : _, valid_path(g) && !IN(Cx(real_of_num(0)), path_image(g)) → winding_number((o(op_minus_minus, g), Cx(real_of_num(0)))) == winding_number((g, Cx(real_of_num(0))))"), t1468))
}

///|
let winding_number_negatepath_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WINDING_NUMBER_NEGATEPATH")

///|
/// `WINDING_NUMBER_NEGATEPATH`
pub fn winding_number_negatepath() -> @kernel.Thm {
  winding_number_negatepath_c.get()
}

///|
/// PATH_INTEGRABLE_NEGATEPATH
fn step_53() -> Unit raise {
  let t1469 = @meson.meson_tac(@list.List([has_path_integral_negatepath(), @complexes.complex_neg_neg()]))
  let t1470 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cauchy.path_integrable_on()])), t1469)
  path_integrable_negatepath_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ z : _, valid_path(g) && path_integrable_on((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])(-z), g) → path_integrable_on(f, o(op_minus_minus, g))"), t1470))
}

///|
let path_integrable_negatepath_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATH_INTEGRABLE_NEGATEPATH")

///|
/// `PATH_INTEGRABLE_NEGATEPATH`
pub fn path_integrable_negatepath() -> @kernel.Thm {
  path_integrable_negatepath_c.get()
}

///|
/// BOUND_LEMMA_0
fn step_54() -> Unit raise {
  let t1477 = @simp.rewrite_tac(@list.List([@complexes.cx_mul(), @complexes.cx_div(), @complexes.cx_pow(), @complexes.complex_div(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t1476 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @complexes.complex_norm_inv(), @complexes.complex_norm_pow()]))
  let t1475 = @simp.rewrite_tac(@list.List([@complexes.complex_add_cnj(), @complexes.complex_norm_mul()]))
  let t1474 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_add_rdistrib())]))
  let t1473 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_inv_cnj()]))
  let t1472 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t1471 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lid()]))
  let t1478 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1471), t1472), t1473), t1474), t1475), t1476), t1477)
  bound_lemma_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ R : Real, norm(z) == R → Cx(real_of_num(1)) / z + z / pow(Cx(R), 2) == Cx(real_of_num(2) * (Re(z) / pow(R, 2)))"), t1478))
}

///|
let bound_lemma_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUND_LEMMA_0")

///|
/// `BOUND_LEMMA_0`
pub fn bound_lemma_0() -> @kernel.Thm {
  bound_lemma_0_c.get()
}

///|
/// BOUND_LEMMA_1
fn step_55() -> Unit raise {
  let t1481 = @meson.asm_meson_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("norm((z : Cart[Real, _])) == (R : Real) → abs(R) == R"))]))
  let t1480 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_div(), @real.real_abs_pow(), @calc_int.real_abs_num()]))
  let t1479 = @simp.asm_simp_tac(@list.List([bound_lemma_0(), @complexes.complex_norm_cx()]))
  let t1482 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1479), t1480), t1481)
  bound_lemma_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ R : Real, norm(z) == R → norm(Cx(real_of_num(1)) / z + z / pow(Cx(R), 2)) == real_of_num(2) * (abs(Re(z)) / pow(R, 2))"), t1482))
}

///|
let bound_lemma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUND_LEMMA_1")

///|
/// `BOUND_LEMMA_1`
pub fn bound_lemma_1() -> @kernel.Thm {
  bound_lemma_1_c.get()
}

///|
/// BOUND_LEMMA_2
fn step_56() -> Unit raise {
  let t1517 = @simp.asm_simp_tac(@list.List([@realarith.real_pos(), @real.real_pow_le(), @realarith.real_lt_imp_le()]))
  let t1516 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), @tactics.conj_tac))
  let t1515 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_le_add()), @tactics.conj_tac))
  let t1514 = @tactics.conv_tac(@equal.rand_conv(@calc_rat.real_poly_conv))
  let t1513 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t1512 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_pow_lt()]))
  let t1511 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @real.real_pow_le(), @realarith.real_lt_imp_le()]))
  let t1510 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1509 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < pow((R : Real), 2) → pow(real_of_num(2) * ((x : Real) / pow(R, 2)), 2) == real_of_num(4) * (pow(x, 2) / pow(R, 4))"))]))
  let t1508 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < pow((R : Real), 2) && real_of_num(0) < pow((x : Real), 2) + pow(R, 2) → pow(x, 2) * pow(inv(pow(x, 2) + pow(R, 2)) + inv(pow(R, 2)), 2) + pow(R, 2) * pow(inv(pow(R, 2)) - inv(pow(x, 2) + pow(R, 2)), 2) == (pow(x, 4) + (real_of_num(5) * (pow(R, 2) * pow(x, 2)) + real_of_num(4) * pow(R, 4))) / pow(pow(x, 2) + pow(R, 2), 2) * (pow(x, 2) / pow(R, 4))"))]))
  let t1507 = @list.List([@meson.asm_meson_tac(@list.List([@real.real_pow2_abs()])), @tactics.all_tac])
  let t1506 = @tactics.subgoal_then(@term_syntax.parse_term("pow(Im((z : Cart[Real, 2])), 2) == pow((R : Real), 2)"), fn(x1503 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1504 = @tactics.subst1_tac(x1503)
    fn(x1505 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1504(x1505)
    }
  })
  let t1501 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square()]))
  let t1500 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt()]))
  let t1502 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) < (y : Real) → real_of_num(0) < x + y"))), t1500), t1501), @tactics.all_tac])
  let t1499 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < pow((x : Real), 2) + pow((R : Real), 2)"), fn(x1496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1497 = @tactics.assume_tac(x1496)
    fn(x1498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1497(x1498)
    }
  })
  let t1493 = @calc_rat.real_ring(@term_syntax.parse_term("pow(-(R : Real) * (a : Real) + R * (b : Real), 2) == pow(R, 2) * pow(b - a, 2)"))
  let t1494 = @calc_rat.real_ring(@term_syntax.parse_term("pow(-(x : Real) * (a : Real) + -x * (b : Real), 2) == pow(x, 2) * pow(a + b, 2)"))
  let t1495 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("pow(-(x : Real), 2) == pow(x, 2)")), t1494, t1493]))
  let t1492 = @simp.rewrite_tac(@list.List([@complexes.complex_mul(), @complexes.complex_add(), @complexes.re(), @complexes.im(), @complexes.re_cx(), @complexes.im_cx(), @calc_int.real_mul_rzero(), @real.real_sub_rzero(), @realax.real_add_lid()]))
  let t1491 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inv()), @complexes.complex_div()]))
  let t1490 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("pow(-(x : Real), 2) == pow(x, 2)"))]))
  let t1489 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_pow()), @complexes.complex_sqnorm(), @complexes.re(), @complexes.im()]))
  let t1488 = @simp.asm_simp_tac(@list.List([@complexes.cnj(), @complexes.re(), @complexes.im(), @complexes.complex_mul_lid(), @realax.real_le_mul(), @realarith.real_pos()]))
  let t1487 = @tactics.subst1_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), @complexes.complex_inv_cnj()))
  let t1486 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t1485 = @simp.asm_simp_tac(@list.List([@realarith.real_pos(), @real.real_le_div(), @realarith.real_lt_imp_le(), @real.real_pow_lt()]))
  let t1484 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= real_of_num(2) * (x : Real)) == (real_of_num(0) <= x)"))]))
  let t1483 = @simp.rewrite_tac(@list.List([@vectors.norm_le_square(), @complexes.complex_sqnorm(), @vectors.dot_square_norm()]))
  let t1518 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1483), t1484), t1485), t1486), t1487), t1488), t1489), t1490), t1491), t1492), t1495), t1499), t1502), t1506), t1507), t1508), t1509), t1510), t1511), t1512), t1513), t1514), t1515), t1516), t1517)
  bound_lemma_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : Real, ∀ x : Real, ∀ z : Cart[Real, 2], Re(z) == -x && abs(Im(z)) == R && real_of_num(0) <= x && real_of_num(0) < R → norm(Cx(real_of_num(1)) / z + z / pow(Cx(R), 2)) <= real_of_num(2) * (x / pow(R, 2))"), t1518))
}

///|
let bound_lemma_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUND_LEMMA_2")

///|
/// `BOUND_LEMMA_2`
pub fn bound_lemma_2() -> @kernel.Thm {
  bound_lemma_2_c.get()
}

///|
/// BOUND_LEMMA_3
fn step_57() -> Unit raise {
  let t1572 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) <= (x : Real)"))
  let t1571 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @real.real_le_inv_eq()]))
  let t1570 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) → (x : Real) - y <= x")))
  let t1568 = @equal.gsym(@complexes.cx_sub())
  let t1569 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_div()), t1568, @complexes.re_cx()]))
  let t1567 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_1()]))
  let t1565 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))
  let t1566 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(0 < (n : Num)) == (1 <= n)")), t1565]))
  let t1563 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub())]))
  let t1564 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t1563), @tactics.all_tac])
  let t1562 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) && (u : Real) <= (v : Real) → x <= u → y <= v")))
  let t1560 = @list.List([@tactics.all_tac, @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())])
  let t1559 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1558 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()]))
  let t1556 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(0) < x"))
  let t1557 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cx_sub()), @transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), t1556]))
  let t1555 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(1) <= (b : Real)"), fn(x1552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1553 = @tactics.assume_tac(x1552)
    fn(x1554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1553(x1554)
    }
  })
  let t1550 = @term_syntax.parse_term("(b : Real)")
  let t1551 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t1550]))
  let t1548 = @tactics.conv_tac(@complexes.complex_field)
  let t1547 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) <= (x : Real)"))
  let t1549 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_inj()])), t1547), @calc_rat.real_arith_tac), t1548])
  let t1546 = @tactics.subgoal_then(@term_syntax.parse_term("!(Cx((x : Real)) == Cx(real_of_num(0)))"), fn(x1543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1544 = @tactics.mp_tac(x1543)
    fn(x1545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1544(x1545)
    }
  })
  let t1541 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t1538 = @simp.gen_rewrite_rule(fn(x1537 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1537
  }, @list.List([@complexes.in_segment_cx()]))
  let t1540 = @tactics.first_x_assum(fn(x1539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1534 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1535 = @tactics.mp_tac(x1534)
      fn(x1536 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1535(x1536)
      }
    })(t1538(x1539))
  })
  let t1533 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.real_segment(), @complexes.real_cx(), @complexes.real_v1()])), @tactics.all_tac])
  let t1532 = @tactics.choose_then(fn(x1529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1530 = @tactics.subst_all_tac(x1529)
    fn(x1531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1530(x1531)
    }
  })
  let t1542 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ y : Real, (u : Cart[Real, 2]) == Cx(y)"), t1532), t1533), t1540), t1541), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1561 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, 2])")), @tactics.strip_tac), @canal.complex_diff_tac), @tactics.conj_tac), t1542), t1546), t1549), @tactics.all_tac])), t1551), @tactics.strip_tac), t1555), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1557), t1558), t1559), @tactics.conj_tac), t1560), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1528 = @simp.asm_rewrite_tac(@list.List([]))
  let t1524 = @term_syntax.parse_term("(n : Num)")
  let t1525 = @term_syntax.parse_term("1")
  let t1526 = @term_syntax.parse_term("(n : Cart[Real, 2]) => cpow(n, Cx((x : Real))) / Cx(x)")
  let t1527 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Cart[Real, 2]) => cpow(n, Cx((x : Real)) - Cx(real_of_num(1)))"), t1526, t1525, t1524]), @canal.sum_integral_ubound_increasing()))
  let t1522 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) <= (x : Real)"))
  let t1521 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_le()]))
  let t1520 = @tactics.match_mp_tac(@real.real_le_div())
  let t1523 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@iterate.numseg_clauses(), @calc_num.arith(), @iterate.sum_clauses()])), t1520), t1521), t1522), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1519 = @tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) == 0 || 1 <= n")))
  let t1573 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1519), t1523), t1527), t1528), @tactics.ants_tac), t1561), t1562), @tactics.conj_tac), t1564), t1566), t1567), t1569), t1570), t1571), t1572), @calc_rat.real_arith_tac)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ x : Real, real_of_num(1) <= x → sum(op_dot_dot(1, n), (n : Num) => exp((x - real_of_num(1)) * log(real_of_num(n)))) <= exp(x * log(real_of_num(n) + real_of_num(1))) / x"), t1573)
  let t1651 = @simp.asm_simp_tac(@list.List([@real.real_inv_1_le(), @realax.real_div(), @realax.real_mul_lid()]))
  let t1650 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(1) + ((a : Real) - x) <= a")))
  let t1648 = @equal.gsym(@complexes.cx_sub())
  let t1649 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_div()), t1648, @complexes.re_cx()]))
  let t1647 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("2 <= (i : Num) → 0 < i"))]))
  let t1645 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub())]))
  let t1646 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t1645), @tactics.all_tac])
  let t1644 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_1()]))
  let t1643 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1642 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) && real_of_num(1) + (u : Real) <= (v : Real) → x <= u → real_of_num(1) + y <= v")))
  let t1640 = @list.List([@tactics.all_tac, @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())])
  let t1639 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1638 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (x : Real)) * (a : Real) <= (real_of_num(1) - x) * (b : Real) → (x - real_of_num(1)) * b <= (x - real_of_num(1)) * a")))
  let t1637 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()]))
  let t1635 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(0) < x"))
  let t1636 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cx_sub()), @transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), t1635]))
  let t1634 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(1) <= (b : Real)"), fn(x1631 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1632 = @tactics.assume_tac(x1631)
    fn(x1633 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1632(x1633)
    }
  })
  let t1629 = @term_syntax.parse_term("(b : Real)")
  let t1630 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t1629]))
  let t1626 = @tactics.conv_tac(@complexes.complex_field)
  let t1625 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (x : Real)"))
  let t1627 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_inj()])), t1625), @calc_rat.real_arith_tac), t1626])
  let t1624 = @tactics.subgoal_then(@term_syntax.parse_term("!(Cx((x : Real)) == Cx(real_of_num(0)))"), fn(x1621 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1622 = @tactics.mp_tac(x1621)
    fn(x1623 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1622(x1623)
    }
  })
  let t1617 = @simp.gen_rewrite_rule(fn(x1616 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1616
  }, @list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t1619 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1613 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1614 = @tactics.mp_tac(x1613)
      fn(x1615 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1614(x1615)
      }
    })(t1617(x1618))
  }))
  let t1612 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t1609 = @simp.gen_rewrite_rule(fn(x1608 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1608
  }, @list.List([@complexes.in_segment_cx()]))
  let t1611 = @tactics.first_x_assum(fn(x1610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1605 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1606 = @tactics.mp_tac(x1605)
      fn(x1607 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1606(x1607)
      }
    })(t1609(x1610))
  })
  let t1604 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.real_segment(), @complexes.real_cx(), @complexes.real_v1()])), @tactics.all_tac])
  let t1603 = @tactics.choose_then(fn(x1600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1601 = @tactics.subst_all_tac(x1600)
    fn(x1602 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1601(x1602)
    }
  })
  let t1620 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ y : Real, (u : Cart[Real, 2]) == Cx(y)"), t1603), t1604), t1611), t1612), t1619), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1628 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, 2])")), @tactics.strip_tac), @canal.complex_diff_tac), @tactics.conj_tac), t1620), t1624), t1627), @tactics.all_tac])
  let t1641 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.conv_tac(@calc_rat.real_rat_reduce_conv), @tactics.conj_tac), t1628), t1630), @tactics.strip_tac), t1634), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1636), t1637), t1638), t1639), @tactics.conj_tac), t1640), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1599 = @simp.asm_rewrite_tac(@list.List([]))
  let t1595 = @term_syntax.parse_term("(n : Num)")
  let t1596 = @term_syntax.parse_term("2")
  let t1597 = @term_syntax.parse_term("(n : Cart[Real, 2]) => cpow(n, Cx((x : Real))) / Cx(x)")
  let t1598 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Cart[Real, 2]) => cpow(n, Cx((x : Real)) - Cx(real_of_num(1)))"), t1597, t1596, t1595]), @canal.sum_integral_ubound_decreasing()))
  let t1593 = @simp.asm_simp_tac(@list.List([@transcendentals.log_1(), @calc_int.real_mul_rzero(), @transcendentals.real_exp_0(), @realax.real_div(), @realax.real_mul_lid(), @calc_int.real_add_rid(), @real.real_inv_1_le()]))
  let t1592 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == 1"), fn(x1589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1590 = @tactics.subst1_tac(x1589)
    fn(x1591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1590(x1591)
    }
  })
  let t1588 = @tactics.disch_then(fn(x1587 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1586 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.numseg_empty()), @iterate.sum_clauses()]))
  let t1584 = @simp.gen_rewrite_rule(fn(x1583 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1583
  }, @list.List([@arith.not_le()]))
  let t1594 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1580 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1581 = @tactics.mp_tac(x1580)
      fn(x1582 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1581(x1582)
      }
    })(t1584(x1585))
  }), t1586), t1588), t1592), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1593)])
  let t1579 = @class.asm_cases_tac(@term_syntax.parse_term("2 <= (n : Num)"))
  let t1578 = @simp.rewrite_tac(@list.List([@transcendentals.log_1(), @calc_int.real_mul_rzero(), @transcendentals.real_exp_0(), @calc_num.arith()]))
  let t1577 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses_left()]))
  let t1575 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @transcendentals.real_exp_pos_le(), @realarith.real_lt_imp_le()]))
  let t1576 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@iterate.numseg_clauses(), @calc_num.arith(), @iterate.sum_clauses()])), t1575), @tactics.all_tac])
  let t1574 = @tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) == 0 || 1 <= n")))
  let t1652 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1574), t1576), t1577), t1578), t1579), t1594), t1598), t1599), @tactics.ants_tac), t1641), t1642), t1643), t1644), @tactics.conj_tac), t1646), t1647), t1649), t1650), t1651)
  let lemma1_p = @tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ x : Real, real_of_num(0) < x && x <= real_of_num(1) → sum(op_dot_dot(1, n), (n : Num) => exp((x - real_of_num(1)) * log(real_of_num(n)))) <= exp(x * log(real_of_num(n))) / x"), t1652)
  let t1686 = @simp.rewrite_tac(@list.List([@realax.real_le_refl(), @realax.real_div(), @realax.real_mul_lid()]))
  let t1685 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → n - 1 + 1 == n"))]))
  let t1684 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add()]))
  let t1683 = @simp.asm_simp_tac(@list.List([lemma1]))
  let t1682 = @tactics.exists_tac(@term_syntax.parse_term("exp((x : Real) * log(real_of_num((n : Num) - 1) + real_of_num(1))) / x"))
  let t1681 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1679 = @simp.asm_simp_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @transcendentals.exp_log(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(0 < (n : Num)) == (1 <= n)")), @realax.real_le_refl()]))
  let t1680 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_sub_rdistrib(), @transcendentals.real_exp_sub(), @realax.real_mul_lid()])), t1679), @tactics.all_tac])
  let t1678 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) <= (x : Real) * (a : Real) && (c : Real) <= x * (d : Real) → c + b <= x * (a + d)")))
  let t1687 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@iterate.sum_clauses_right(), @arith.le_1()])), t1678), @tactics.conj_tac), t1680), t1681), t1682), @tactics.conj_tac), t1683), t1684), t1685), t1686)
  let t1677 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @transcendentals.real_exp_pos_le(), @real.real_le_inv_eq(), @realarith.real_pos()]))
  let t1676 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) <= (a : Real) + x) == (real_of_num(0) <= a)"))]))
  let t1675 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @realax.real_add_ldistrib()]))
  let t1674 = @simp.asm_simp_tac(@list.List([lemma1_p]))
  let t1673 = @tactics.exists_tac(@term_syntax.parse_term("exp((x : Real) * log(real_of_num((n : Num)))) / x"))
  let t1688 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t1673), t1674), t1675), t1676), t1677), t1687])
  let t1672 = @tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("(x : Real) <= real_of_num(1) || real_of_num(1) <= x")))
  let t1671 = @simp.abbrev_tac(@term_syntax.parse_term("(x : Real) == Re((z : Cart[Real, 2]))"))
  let t1669 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) <= Re((w : Cart[Real, 2]))"))
  let t1668 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t1667 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le(), @equal.gsym(@complexes.re_neg()), @complexes.complex_neg_sub()]))
  let t1666 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1665 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_lneg())]))
  let t1664 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @transcendentals.real_exp_pos_le(), @transcendentals.real_exp_mono_le()]))
  let t1663 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1662 = @simp.gen_rewrite_tac(fn(x1659 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1660 = @equal.rand_conv(x1659)
    fn(x1661 : @kernel.Term) -> @kernel.Thm raise {
      s1660(x1661)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t1658 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@transcendentals.real_exp_neg())]))
  let t1657 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_div(), @transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(0 < (k : Num)) == (1 <= k)"))]))
  let t1656 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1655 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t1670 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_norm_le()), t1655), t1656), @tactics.strip_tac), t1657), t1658), t1662), t1663), t1664), t1665), t1666), t1667), t1668), t1669), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1654 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, (n : Num)), (n : Num) => exp((Re((z : Cart[Real, 2])) - real_of_num(1)) * log(real_of_num(n))))"))
  let t1653 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1689 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1653), t1654), @tactics.conj_tac), t1670), t1671), t1672), t1688)
  bound_lemma_3_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, 2], ∀ n : Num, (∀ m : Num, 1 <= m → norm(a(m)) <= real_of_num(1)) && 1 <= n && real_of_num(1) <= Re((w : Cart[Real, 2])) && real_of_num(0) < Re((z : Cart[Real, 2])) → norm(vsum(op_dot_dot(1, n), (n : Num) => a(n) / cpow(Cx(real_of_num(n)), w - z))) <= exp(Re(z) * log(real_of_num(n))) * (real_of_num(1) / real_of_num(n) + real_of_num(1) / Re(z))"), t1689))
}

///|
let bound_lemma_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUND_LEMMA_3")

///|
/// `BOUND_LEMMA_3`
pub fn bound_lemma_3() -> @kernel.Thm {
  bound_lemma_3_c.get()
}

///|
/// BOUND_LEMMA_4
fn step_58() -> Unit raise {
  let t1808 = @simp.asm_simp_tac(@list.List([@real.real_le_inv_eq(), @realax.real_le_mul(), @realarith.real_lt_imp_le(), @transcendentals.real_exp_pos_le()]))
  let t1807 = @list.List([@simp.rewrite_tac(@list.List([@real.real_mul_ac()])), @tactics.all_tac])
  let t1806 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (z : Real) && real_of_num(0) <= (y : Real) → x - y <= z")))
  let t1805 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t1804 = @simp.rewrite_tac(@list.List([@realax.real_div(), @calc_int.real_mul_lneg(), @real.real_sub_neg2(), @realax.real_mul_lid()]))
  let t1800 = @equal.gsym(@complexes.cx_neg())
  let t1801 = @equal.gsym(@complexes.cx_div())
  let t1802 = @equal.gsym(@complexes.cx_sub())
  let t1803 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inv()), t1802, @complexes.re_cx(), t1801, t1800]))
  let t1799 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.re_cx(), @complexes.real_cx(), @real.real_of_num_lt()]))
  let t1796 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) → 0 < n")))
  let t1798 = @tactics.first_assum(fn(x1797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1794 = @tactics.assume_tac(x1793)
      fn(x1795 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1794(x1795)
      }
    })(t1796(x1797))
  })
  let t1790 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 <= (m : Num) → 0 < m")))
  let t1792 = @tactics.first_assum(fn(x1791 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1787 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1788 = @tactics.assume_tac(x1787)
      fn(x1789 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1788(x1789)
      }
    })(t1790(x1791))
  })
  let t1786 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_neg()]))
  let t1784 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg(), @realax.real_le_refl()]))
  let t1783 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @equal.gsym(@transcendentals.real_exp_neg())]))
  let t1782 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.re_cx(), @complexes.real_cx()]))
  let t1781 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt()])), @int.asm_arith_tac), @tactics.all_tac])
  let t1780 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < real_of_num((k : Num))"), fn(x1777 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1778 = @tactics.assume_tac(x1777)
    fn(x1779 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1778(x1779)
    }
  })
  let t1775 = @equal.gsym(@complexes.cx_neg())
  let t1776 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t1775]))
  let t1774 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1785 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t1774), @tactics.strip_tac), t1776), t1780), t1781), t1782), t1783), t1784), @tactics.all_tac])
  let t1773 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) && (u : Real) <= (v : Real) → x <= u → y <= v")))
  let t1771 = @list.List([@tactics.all_tac, @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())])
  let t1770 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1769 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (a : Real) <= x * (b : Real) → -x * b <= -x * a")))
  let t1768 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()]))
  let t1767 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx()]))
  let t1765 = @equal.gsym(@complexes.cx_neg())
  let t1766 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t1765]))
  let t1762 = @simp.gen_rewrite_rule(fn(x1761 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1761
  }, @list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t1764 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.first_x_assum(fn(x1763 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1758 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1759 = @tactics.mp_tac(x1758)
      fn(x1760 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1759(x1760)
      }
    })(t1762(x1763))
  })), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1757 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (a : Real) && real_of_num(0) < (b : Real)"), @tactics.strip_assume_tac)
  let t1755 = @term_syntax.parse_term("(b : Real)")
  let t1756 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t1755]))
  let t1752 = @tactics.conv_tac(@complexes.complex_field)
  let t1751 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (x : Real)"))
  let t1753 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_inj()])), t1751), @calc_rat.real_arith_tac), t1752])
  let t1750 = @tactics.subgoal_then(@term_syntax.parse_term("!(Cx((x : Real)) == Cx(real_of_num(0)))"), fn(x1747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1748 = @tactics.mp_tac(x1747)
    fn(x1749 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1748(x1749)
    }
  })
  let t1746 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(x : Cart[Real, 2]) - Cx(real_of_num(1)) == -(x + Cx(real_of_num(1)))"))]))
  let t1744 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t1741 = @simp.gen_rewrite_rule(fn(x1740 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1740
  }, @list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t1743 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1737 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1738 = @tactics.mp_tac(x1737)
      fn(x1739 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1738(x1739)
      }
    })(t1741(x1742))
  }))
  let t1736 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t1733 = @simp.gen_rewrite_rule(fn(x1732 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1732
  }, @list.List([@complexes.in_segment_cx()]))
  let t1735 = @tactics.first_x_assum(fn(x1734 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1729 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1730 = @tactics.mp_tac(x1729)
      fn(x1731 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1730(x1731)
      }
    })(t1733(x1734))
  })
  let t1728 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.real_segment(), @complexes.real_cx(), @complexes.real_v1()])), @tactics.all_tac])
  let t1727 = @tactics.choose_then(fn(x1724 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1725 = @tactics.subst_all_tac(x1724)
    fn(x1726 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1725(x1726)
    }
  })
  let t1745 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ y : Real, (u : Cart[Real, 2]) == Cx(y)"), t1727), t1728), t1735), t1736), t1743), t1744), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1754 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, 2])")), @tactics.strip_tac), @canal.complex_diff_tac), @tactics.conj_tac), t1745), t1746), t1750), t1753), @tactics.all_tac])
  let t1772 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.conv_tac(@calc_rat.real_rat_reduce_conv), @tactics.conj_tac), t1754), t1756), @tactics.strip_tac), t1757), t1764), t1766), t1767), t1768), t1769), t1770), @tactics.conj_tac), t1771), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1722 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) - real_of_num(1) == x"))
  let t1723 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t1722]))
  let t1718 = @term_syntax.parse_term("(m : Num)")
  let t1719 = @term_syntax.parse_term("(n : Num) + 1")
  let t1720 = @term_syntax.parse_term("(n : Cart[Real, 2]) => -cpow(n, -Cx((x : Real))) / Cx(x)")
  let t1721 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Cart[Real, 2]) => cpow(n, -(Cx((x : Real)) + Cx(real_of_num(1))))"), t1720, t1719, t1718]), @canal.sum_integral_ubound_decreasing()))
  let t1716 = @simp.asm_simp_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @real.real_le_inv_eq(), @realax.real_le_mul(), @transcendentals.real_exp_pos_le(), @realarith.real_lt_imp_le()]))
  let t1715 = @tactics.disch_then(fn(x1714 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1713 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.numseg_empty()), @iterate.sum_clauses()]))
  let t1711 = @simp.gen_rewrite_rule(fn(x1710 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1710
  }, @list.List([@arith.not_le()]))
  let t1717 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1712 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1708 = @tactics.mp_tac(x1707)
      fn(x1709 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1708(x1709)
      }
    })(t1711(x1712))
  }), t1713), t1715), t1716)])
  let t1706 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) + 1 <= (m : Num)"))
  let t1705 = @simp.abbrev_tac(@term_syntax.parse_term("(x : Real) == Re((z : Cart[Real, 2]))"))
  let t1703 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) <= Re((w : Cart[Real, 2]))"))
  let t1702 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @calc_int.real_le_neg2()]))
  let t1701 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le(), @complexes.re_neg(), @complexes.complex_neg_sub()]))
  let t1700 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t1699 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_lneg())]))
  let t1698 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @transcendentals.real_exp_pos_le(), @transcendentals.real_exp_mono_le()]))
  let t1697 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t1696 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@transcendentals.real_exp_neg())]))
  let t1695 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_div(), @transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt()]))
  let t1694 = @tactics.subgoal_then(@term_syntax.parse_term("0 < (r : Num) && 1 <= r"), @tactics.strip_assume_tac)
  let t1693 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t1692 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t1704 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_norm_le()), t1692), t1693), @tactics.strip_tac), t1694), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1695), t1696), t1697), t1698), t1699), t1700), t1701), t1702), t1703), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1691 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot((n : Num) + 1, (m : Num)), (n : Num) => real_of_num(1) / exp((Re((z : Cart[Real, 2])) + real_of_num(1)) * log(real_of_num(n))))"))
  let t1690 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1809 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1690), t1691), @tactics.conj_tac), t1704), t1705), t1706), t1717), t1721), t1723), @tactics.ants_tac), t1772), t1773), @tactics.conj_tac), t1785), t1786), t1792), t1798), t1799), t1803), t1804), t1805), t1806), @tactics.conj_tac), t1807), t1808)
  bound_lemma_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Cart[Real, 2], ∀ n : Num, ∀ m : Num, (∀ m : Num, 1 <= m → norm(a(m)) <= real_of_num(1)) && 1 <= n && real_of_num(1) <= Re((w : Cart[Real, 2])) && real_of_num(0) < Re((z : Cart[Real, 2])) → norm(vsum(op_dot_dot(n + 1, m), (n : Num) => a(n) / cpow(Cx(real_of_num(n)), w + z))) <= real_of_num(1) / (Re(z) * exp(Re(z) * log(real_of_num(n))))"), t1809))
}

///|
let bound_lemma_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUND_LEMMA_4")

///|
/// `BOUND_LEMMA_4`
pub fn bound_lemma_4() -> @kernel.Thm {
  bound_lemma_4_c.get()
}

///|
/// OVERALL_BOUND_LEMMA
fn step_59() -> Unit raise {
  let t1825 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_log()]))
  let t1824 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t1823 = @simp.rewrite_tac(@list.List([@real.real_inv_mul(), @calc_num.arith()]))
  let t1826 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_null_pow()), t1823), t1824), t1825)
  let t1822 = @simp.simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.re_cx(), @complexes.real_cx(), @real.real_of_num_lt(), @complexes.cx_inv(), @arith.le_1(), @complexes.complex_div(), @complexes.complex_mul_lid()]))
  let t1821 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1820 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1819 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually()))
  let t1818 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_complex(), @trivia.o_def()]))
  let t1817 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx()]))
  let t1827 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx((d : Real))"), @transcendentals.lim_1_over_power())), t1817), t1818), t1819), t1820), t1821), t1822), t1826])
  let t1816 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_n()]))
  let t1815 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t1814 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc(), @equal.gsym(@real.real_pow_inv())]))
  let t1813 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_null_add()), @tactics.conj_tac))
  let t1812 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul()]))
  let t1811 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1810 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.reallim_sequentially())]))
  let t1828 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) == abs(x - real_of_num(0))"))])), t1810), t1811), t1812), t1813), t1814), t1815), t1816), t1827)
  overall_bound_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Real, ∀ M : Real, ∀ R : Real, real_of_num(0) < d → (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, N <= n → abs(real_of_num(2) * (pi / real_of_num(n)) + (real_of_num(6) * (M * (R / (d * exp(d * log(real_of_num(n)))))) + real_of_num(4) * (M / pow(R * log(real_of_num(n)), 2)))) < e))"), t1828))
}

///|
let overall_bound_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OVERALL_BOUND_LEMMA")

///|
/// `OVERALL_BOUND_LEMMA`
pub fn overall_bound_lemma() -> @kernel.Thm {
  overall_bound_lemma_c.get()
}

///|
/// NEWMAN_INGHAM_THEOREM
fn step_60() -> Unit raise {
  let t2946 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (R : Real)"))
  let t2945 = @simp.rewrite_tac(@list.List([@complexes.re_mul_ii(), @complexes.im_mul_ii(), @complexes.re_sub(), @complexes.im_sub(), @complexes.re_cx(), @complexes.im_cx(), @complexes.complex_mul_lneg(), @complexes.re_neg(), @complexes.im_neg()]))
  let t2944 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @realax.real_le_mul()]))
  let t2943 = @tactics.match_mp_tac(bound_lemma_2())
  let t2941 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_lt_imp_le(), @real.real_le_lmul_eq()]))
  let t2939 = @term_syntax.parse_term("(d : Real) <= (R : Real)")
  let t2940 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.map_every(fn(x2936 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2937 = @tactics.undisch_tac(x2936)
    fn(x2938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2937(x2938)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0) < (d : Real)"), t2939])), @calc_rat.real_arith_tac)])
  let t2935 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (d : Real) * (x : Real) && d * x <= d * real_of_num(1)"), fn(x2932 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2933 = @tactics.mp_tac(x2932)
    fn(x2934 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2933(x2934)
    }
  })
  let t2931 = @simp.rewrite_tac(@list.List([@complexes.re_mul_ii(), @complexes.im_mul_ii(), @complexes.re_sub(), @complexes.im_sub(), @complexes.re_cx(), @complexes.im_cx(), @complexes.complex_mul_lneg(), @complexes.re_neg(), @complexes.im_neg()]))
  let t2942 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2931), t2935), t2940), t2941), @tactics.all_tac])
  let t2930 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le(), @equal.gsym(@realax.real_div())]))
  let t2929 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2928 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * ((M : Real) * ((r : Real) * ((d : Real) * (x : Real)))) == M * (real_of_num(2) * (d * x * r))"))]))
  let t2927 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t2926 = @simp.asm_simp_tac(@list.List([@real.real_le_rmul_eq(), @transcendentals.real_exp_pos_lt()]))
  let t2925 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_neg()), @calc_int.real_mul_lneg()]))
  let t2924 = @simp.gen_rewrite_tac(fn(x2921 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2922 = @equal.land_conv(x2921)
    fn(x2923 : @kernel.Term) -> @kernel.Thm raise {
      s2922(x2923)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) == a * c * b"))]))
  let t2920 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (d : Real) → abs(d) == d")), @real.real_le_rmul_eq(), @realax.real_mul_assoc()]))
  let t2919 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @complexes.complex_norm_cx()]))
  let t2915 = @equal.gsym(@complexes.cx_div())
  let t2916 = @equal.gsym(@complexes.cx_pow())
  let t2917 = @equal.gsym(@complexes.cx_inv())
  let t2918 = @simp.gen_rewrite_tac(fn(x2914 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2908 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2909 = @equal.rand_conv(x2908)
      fn(x2910 : @kernel.Term) -> @kernel.Thm raise {
        s2909(x2910)
      }
    })((fn(x2911 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2912 = @equal.top_depth_conv(x2911)
      fn(x2913 : @kernel.Term) -> @kernel.Thm raise {
        s2912(x2913)
      }
    })(x2914))
  }, @list.List([@equal.gsym(@complexes.cx_mul()), t2917, t2916, t2915, @complexes.re_cx()]))
  let t2907 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_neg_0(), @complexes.complex_sub_rzero(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) - (d : Real) * (x : Real) == -(d * x)"))]))
  let t2906 = @simp.rewrite_tac(@list.List([@complexes.re_mul_ii(), @complexes.re_neg(), @complexes.re_ii(), @complexes.re_mul_cx(), @complexes.re_sub(), @complexes.re_cx(), @complexes.im_cx()]))
  let t2905 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @transcendentals.cpow_real_real(), @arith.lt_nz()]))
  let t2904 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2903 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t2902 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @equal.gsym(@vectors.forall_drop()), @vectors.drop_vec()]))
  let t2901 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t2899 = @simp.asm_rewrite_tac(@list.List([@real.real_pow_inv()]))
  let t2898 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_le(), @realax.real_le_mul(), @real.real_pow_le(), @real.real_le_inv_eq(), @realarith.real_lt_imp_le()]))
  let t2897 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2896 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (M : Real) * (R : Real) * ((b : Real) - (i : Real)) → real_of_num(2) * (M * R) * i <= real_of_num(2) * (M * (R * b))")))
  let t2895 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@real.real_pow_inv()), @real.real_pow_mul(), @real.real_inv_mul()]))
  let t2892 = @equal.gsym(@complexes.cx_div())
  let t2893 = @equal.gsym(@complexes.cx_mul())
  let t2894 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_pow()), t2893, t2892, @complexes.re_cx()]))
  let t2900 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b"))), t2894), t2895), t2896), t2897), t2898), t2899)])
  let t2891 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def())]))
  let t2887 = @term_syntax.parse_term("1")
  let t2890 = @tactics.disch_then(fn(x2889 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2884 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2885 = @tactics.mp_tac(x2884)
      fn(x2886 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2885(x2886)
      }
    })(((x2888 : @kernel.Thm) => @bool.spec(t2887, x2888))(x2889))
  })
  let t2881 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) && (e : Bool) → (f : Bool)) == (c && d → a && b && e → f)"))]))(@integration.has_integral_norm_bound_integral_component()))
  let t2883 = @tactics.disch_then(fn(x2882 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2878 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2879 = @tactics.mp_tac(x2878)
      fn(x2880 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2879(x2880)
      }
    })(t2881(x2882))
  })
  let t2877 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t2876 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.linepath(), @complexes.complex_eq(), @complexes.im_cmul(), @complexes.re_cmul(), @complexes.im(), @complexes.re(), @complexes.re_sub(), @complexes.im_sub(), @complexes.im_add(), @complexes.re_add(), @complexes.re_mul_ii(), @complexes.im_mul_ii(), @complexes.re_mul_cx(), @complexes.re_ii(), @complexes.im_ii(), @complexes.im_mul_cx(), @complexes.im_cx(), @complexes.re_cx(), @complexes.re_neg(), @complexes.im_neg(), @vectors.drop_sub(), @vectors.drop_vec()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2947 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(∀ x : Cart[Real, Unit], linepath((complex((real_of_num(0), (R : Real))), complex((-(d : Real), R))), x) == ii * Cx(R) - Cx(d * drop(x))) && (∀ x : Cart[Real, Unit], linepath((Cx(real_of_num(0)), Cx(d)), x) == Cx(d * drop(x))) && complex((-d, R)) - complex((real_of_num(0), R)) == -Cx(d) && (∀ x : Cart[Real, Unit], linepath((complex((-d, -R)), complex((real_of_num(0), -R))), vec(1) - x) == -ii * Cx(R) - Cx(d * drop(x))) && complex((real_of_num(0), -R)) - complex((-d, -R)) == Cx(d)"), fn(x2874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2874
    @simp.rewrite_tac(@list.List([th_2]))
  }), t2876), t2877), t2883), t2890), t2891), @tactics.ants_tac), t2900), t2901), t2902), t2903), @tactics.strip_tac), t2904), t2905), t2906), t2907), t2918), t2919), t2920), t2924), t2925), t2926), t2927), t2928), t2929), t2930), @tactics.conj_tac), t2942), t2943), t2944), t2945), t2946), @calc_rat.real_arith_tac)
  let t2872 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("-(x : Cart[Real, Unit]) + (y : Cart[Real, Unit]) == y - x")), @vectors.vector_sub_refl()]))
  let t2871 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lid(), @vectors.vector_mul_lneg(), @vectors.vector_neg_0(), @vectors.vector_add_lid(), @vectors.vector_neg_neg(), @real.real_pow_one(), @real.real_inv_1()]))
  let t2870 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2869 = @simp.rewrite_tac(@list.List([@topology.interval_eq_empty_1(), @vectors.drop_vec()]))
  let t2868 = @simp.rewrite_tac(@list.List([@topology.image_affinity_interval()]))
  let t2865 = @drule.match_mp(@integration.has_integral_affinity())
  let t2862 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(1)")
  let t2867 = @tactics.disch_then(fn(x2866 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2864 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2860 = @tactics.mp_tac(x2859)
        fn(x2861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2860(x2861)
        }
      })(((x2863 : @kernel.Thm) => @bool.spec(t2862, x2863))(x2864))
    })(t2865(x2866))
  })
  let t2856 = @int.arith_rule(@term_syntax.parse_term("!(-real_of_num(1) == real_of_num(0))"))
  let t2873 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2851 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2852 = @tactics.mp_tac(x2851)
      fn(x2853 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2852(x2853)
      }
    })((fn(x2857 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x2854 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x2855 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.conj(x2854, x2855)
        }
      })(x2857)(t2856)
    })(x2858))
  }), t2867), t2868), t2869), t2870), t2871), t2872)])
  let t2850 = @simp.rewrite_tac(@list.List([@cauchy.has_path_integral_v1(), @cauchy.vector_derivative_linepath_at()]))
  let t2848 = @tactics.undisch_tac(@term_syntax.parse_term("has_path_integral((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2))), (integral_fC' : Cart[Real, 2]), linepath((complex((-(d : Real), -R)), complex((real_of_num(0), -R)))))"))
  let t2849 = @list.List([@tactics.undisch_tac(@term_syntax.parse_term("has_path_integral((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2))), (integral_fC : Cart[Real, 2]), linepath((complex((real_of_num(0), R)), complex((-(d : Real), R)))))")), t2848])
  let t2847 = @tactics.disch_then(fn(x2845 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2845
    @tactics.then_tac(@tactics.conj_tac, @tactics.mp_tac(th_1))
  })
  let t2841 = @term_syntax.parse_term("Cx(real_of_num(2)) * (Cx((M : Real)) / pow(Cx((R : Real)), 2))")
  let t2844 = @tactics.disch_then(fn(x2843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2838 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2839 = @tactics.mp_tac(x2838)
      fn(x2840 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2839(x2840)
      }
    })(((x2842 : @kernel.Thm) => @bool.spec(t2841, x2842))(x2843))
  })
  let t2835 = @drule.match_mp(@cauchy.has_path_integral_complex_lmul())
  let t2837 = @tactics.disch_then(fn(x2836 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2832 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2833 = @tactics.mp_tac(x2832)
      fn(x2834 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2833(x2834)
      }
    })(t2835(x2836))
  })
  let t2830 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_lt_imp_le(), @transcendentals.log_pos_lt(), @real.real_of_num_lt()]))
  let t2828 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_le_x()]))
  let t2827 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t2829 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_le_add()), t2827), t2828])
  let t2826 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @calc_int.real_mul_lzero()]))
  let t2825 = @simp.simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_le_ldiv_eq(), @transcendentals.real_exp_pos_lt()]))
  let t2824 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) * (x : Real) <= real_of_num(1) - (y : Real) && real_of_num(1) - y <= real_of_num(1)) == (real_of_num(0) <= y && y <= real_of_num(1))"))]))
  let t2823 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_div2_eq(), @real.real_le_rdiv_eq(), @real.real_pow_lt(), @transcendentals.log_pos_lt(), @real.real_of_num_lt()]))
  let t2822 = @simp.gen_rewrite_tac(fn(x2821 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2815 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2816 = @equal.rand_conv(x2815)
      fn(x2817 : @kernel.Term) -> @kernel.Thm raise {
        s2816(x2817)
      }
    })((fn(x2818 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2819 = @equal.rand_conv(x2818)
      fn(x2820 : @kernel.Term) -> @kernel.Thm raise {
        s2819(x2820)
      }
    })(x2821))
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t2814 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t2831 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("integral_bound"), t2814), t2822), t2823), t2824), t2825), t2826), @tactics.conj_tac), t2829), t2830), @tactics.all_tac])
  let t2813 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (integral_bound : Real) && integral_bound <= inv(pow(log(real_of_num((N : Num))), 2))"), @tactics.strip_assume_tac)
  let t2812 = @simp.abbrev_tac(@term_syntax.parse_term("(integral_bound : Real) == inv(pow(log(real_of_num((N : Num))), 2)) * (real_of_num(1) - (real_of_num(1) + (d : Real) * log(real_of_num(N))) * inv(exp(d * log(real_of_num(N)))))"))
  let t2811 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) - (real_of_num(1) + (d : Real)) == -d"))]))
  let t2805 = @equal.gsym(@complexes.cx_pow())
  let t2806 = @equal.gsym(@complexes.cx_sub())
  let t2807 = @equal.gsym(@complexes.cx_add())
  let t2808 = @equal.gsym(@complexes.cx_inv())
  let t2809 = @equal.gsym(@complexes.cx_mul())
  let t2810 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_neg(), @transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.lt_nz(), @equal.gsym(@transcendentals.cx_log()), t2809, t2808, t2807, t2806, t2805]))
  let t2804 = @simp.asm_rewrite_tac(@list.List([@transcendentals.cpow_n(), @complexes.cx_inj(), @realax.real_of_num_eq(), @complexes.complex_pow()]))
  let t2803 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("-(x : Cart[Real, 2]) * (y : Cart[Real, 2]) - -x * (z : Cart[Real, 2]) == x * (z - y)"))]))
  let t2802 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_0(), @complexes.complex_mul_lid(), @complexes.complex_mul_lzero(), @complexes.complex_add_rid()]))
  let t2801 = @simp.rewrite_tac(@list.List([@paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t2799 = @simp.asm_rewrite_tac(@list.List([@real.real_of_num_lt()]))
  let t2798 = @tactics.match_mp_tac(@transcendentals.log_pos_lt())
  let t2797 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t2796 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @arith.lt_nz(), @complexes.cx_inj()]))
  let t2795 = @list.List([@tactics.all_tac, @tactics.conv_tac(@complexes.complex_field)])
  let t2794 = @tactics.subgoal_then(@term_syntax.parse_term("!(clog(Cx(real_of_num((N : Num)))) == Cx(real_of_num(0)))"), fn(x2791 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2792 = @tactics.mp_tac(x2791)
    fn(x2793 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2792(x2793)
    }
  })
  let t2790 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t2789 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid(), @complexes.complex_add_lid(), @complexes.complex_mul_lneg()]))
  let t2800 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @canal.complex_diff_tac), t2789), t2790), t2794), t2795), t2796), t2797), t2798), t2799), @tactics.all_tac])
  let t2788 = @simp.rewrite_tac(@list.List([@cauchy.valid_path_linepath(), @sets.subset_univ(), @sets.in_univ()]))
  let t2784 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t2785 = @term_syntax.parse_term("linepath((Cx(real_of_num(0)), Cx((d : Real))))")
  let t2786 = @term_syntax.parse_term("(z : Cart[Real, 2]) => z * cpow(Cx(real_of_num((N : Num))), -z)")
  let t2787 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => -inv(pow(clog(Cx(real_of_num((N : Num)))), 2)) * ((Cx(real_of_num(1)) + z * clog(Cx(real_of_num(N)))) * cpow(Cx(real_of_num(N)), -z))"), t2786, t2785, t2784]), @cauchy.path_integral_primitive()))
  let t2782 = @simp.asm_rewrite_tac(@list.List([]))
  let t2781 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_ge_re_im()]))
  let t2780 = @tactics.exists_tac(@term_syntax.parse_term("abs(Re((z : Cart[Real, 2])))"))
  let t2779 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2778 = @simp.asm_rewrite_tac(@list.List([]))
  let t2777 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2776 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv()]))
  let t2771 = @term_syntax.parse_term("abs(Im((z : Cart[Real, 2]))) <= (R : Real)")
  let t2772 = @term_syntax.parse_term("(d : Real) <= (R : Real)")
  let t2773 = @term_syntax.parse_term("real_of_num(0) < (R : Real)")
  let t2774 = @tactics.map_every(fn(x2768 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2769 = @tactics.undisch_tac(x2768)
    fn(x2770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2769(x2770)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0) < (d : Real)"), t2773, t2772, t2771]))
  let t2767 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_le_square_abs())]))
  let t2766 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("pow((d : Real), 2) <= pow((R : Real), 2) && pow((i : Real), 2) <= pow(R, 2) → pow(-d, 2) + pow(i, 2) <= real_of_num(2) * pow(R, 2)")))
  let t2765 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sqnorm()]))
  let t2764 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @real.real_pow2_abs()]))
  let t2763 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @complexes.complex_norm_nz(), @real.real_pow_lt(), @complexes.cx_inj(), @real.real_lt_imp_nz()]))
  let t2762 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @real.real_pow_div()]))
  let t2761 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @complexes.complex_norm_pow(), @calc_int.real_abs_num()]))
  let t2775 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((i : Cart[Real, 2])) == real_of_num(1) && norm((z : Cart[Real, 2])) <= real_of_num(2) → norm(i + z) <= real_of_num(3)"))), t2761), t2762), t2763), t2764), t2765), t2766), t2767), t2774), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2760 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2759 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2758 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t2757 = @simp.once_rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2756 = @simp.asm_simp_tac(@list.List([@complexes.cx_inj(), @real.real_lt_imp_nz(), @complexes.complex_field(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0))) && !((R : Cart[Real, 2]) == Cx(real_of_num(0))) → Cx(real_of_num(1)) / z + z / pow(R, 2) == (Cx(real_of_num(1)) + pow(z / R, 2)) * inv(z)"))]))
  let t2754 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (d : Real)"))
  let t2753 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx()]))
  let t2755 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("Re((z : Cart[Real, 2])) == -(d : Real)"))), t2753), t2754), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2752 = @tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"), fn(x2749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2750 = @tactics.assume_tac(x2749)
    fn(x2751 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2750(x2751)
    }
  })
  let t2747 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg(), @transcendentals.real_exp_neg(), @realax.real_le_refl()]))
  let t2748 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.lt_nz()])), t2747), @tactics.all_tac])
  let t2746 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2745 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2744 = @simp.once_rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2741 = @term_syntax.parse_term("real_of_num(0) < (d : Real)")
  let t2742 = @tactics.map_every(fn(x2738 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2739 = @tactics.undisch_tac(x2738)
    fn(x2740 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2739(x2740)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0) < (R : Real)"), t2741]))
  let t2737 = @simp.asm_rewrite_tac(@list.List([@realax.real_ge(), @realax.real_le_refl()]))
  let t2743 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2737), t2742), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2736 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2735 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2734 = @simp.once_rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2733 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2729 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t2732 = @tactics.disch_then(fn(x2731 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2726 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2727 = @tactics.mp_tac(x2726)
      fn(x2728 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2727(x2728)
      }
    })(((x2730 : @kernel.Thm) => @bool.spec(t2729, x2730))(x2731))
  })
  let t2725 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t2723 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (R : Real)"))
  let t2722 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_inter(), @complexes.im()]))
  let t2721 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET({(a : _), (b : _)}, (s : (_) -> Bool)) == (IN(a, s) && IN(b, s))"))]))
  let t2720 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})")), @convex.convex_inter(), @canal.convex_halfspace_im_le(), @canal.convex_halfspace_im_ge()]))
  let t2719 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= (r : Real)) == (x >= -r && x <= r)"))]))
  let t2718 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2724 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.segment_convex_hull()])), t2718), t2719), t2720), t2721), t2722), t2723), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2717 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(segment([(complex((-(d : Real), (R : Real))), complex((-d, -R)))]), {(z : Cart[Real, 2]) | abs(Im(z)) <= R})"), fn(x2714 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2715 = @tactics.mp_tac(x2714)
    fn(x2716 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2715(x2716)
    }
  })
  let t2712 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cmul(), @complexes.re_add(), @complexes.re()]))
  let t2711 = @simp.rewrite_tac(@list.List([@topology.segment(), @sets.in_elim_thm()]))
  let t2713 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((z : Cart[Real, 2]), segment([(complex((-(d : Real), (R : Real))), complex((-d, -R)))]))")), t2711), @tactics.strip_tac), t2712), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2710 = @tactics.subgoal_then(@term_syntax.parse_term("Re((z : Cart[Real, 2])) == -(d : Real)"), fn(x2707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2708 = @tactics.assume_tac(x2707)
    fn(x2709 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2708(x2709)
    }
  })
  let t2706 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2704 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @real.real_le_inv_eq(), @transcendentals.real_exp_pos_le(), @real.real_le_div(), @realarith.real_pos()]))
  let t2705 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), @tactics.conj_tac)), t2704), @tactics.all_tac])
  let t2702 = @tactics.conv_tac(@calc_rat.real_field)
  let t2701 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (R : Real) → abs(-R) == R")), @calc_int.real_abs_num()]))
  let t2700 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_cx(), @complexes.complex_norm_ii()]))
  let t2699 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == (b : Real) → (x : Real) <= a → x <= b")))
  let t2698 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_sub(), @complexes.im_sub(), @complexes.re_mul_cx(), @complexes.im_mul_cx(), @complexes.re_cx(), @complexes.im_cx(), @complexes.re_mul_ii(), @complexes.im_mul_ii(), @complexes.re(), @complexes.im()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2703 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("complex((-(d : Real), -(R : Real))) - complex((-d, R)) == Cx(real_of_num(2)) * (ii * Cx(-R))"), fn(x2695 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2696 = @tactics.subst1_tac(x2695)
    fn(x2697 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2696(x2697)
    }
  }), t2698), t2699), t2700), t2701), t2702)])
  let t2694 = @simp.asm_rewrite_tac(@list.List([]))
  let t2690 = @term_syntax.parse_term("(M : Real) * (inv(exp((d : Real) * log(real_of_num((N : Num))))) * (real_of_num(3) / d))")
  let t2691 = @term_syntax.parse_term("complex((-(d : Real), -(R : Real)))")
  let t2692 = @term_syntax.parse_term("complex((-(d : Real), (R : Real)))")
  let t2693 = @term_syntax.parse_term("(integral_fD : Cart[Real, 2])")
  let t2783 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2)))"), t2693, t2692, t2691, t2690]), @cauchy.has_path_integral_bound_linepath())), t2694), @tactics.ants_tac), t2703), @tactics.conj_tac), t2705), t2706), @tactics.disch_tac), t2710), t2713), t2717), t2724), t2725), t2732), t2733), @tactics.disch_tac), t2734), t2735), t2736), @tactics.conj_tac), t2743), t2744), t2745), t2746), @tactics.conj_tac), t2748), t2752), t2755), t2756), t2757), t2758), t2759), t2760), @tactics.conj_tac), t2775), t2776), t2777), t2778), t2779), t2780), t2781), t2782), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2689 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((y : Cart[Real, 2])) <= (a : Real) && norm((x : Cart[Real, 2])) <= real_of_num(2) * (b : Real) && norm((z : Cart[Real, 2])) <= real_of_num(2) * b → norm(x + (y + z)) <= a + real_of_num(4) * b")))
  let t2686 = @simp.asm_simp_tac(@list.List([@cauchy.valid_path_join(), @paths.pathstart_join(), @paths.pathfinish_linepath(), @paths.pathfinish_join(), @cauchy.valid_path_linepath(), @paths.pathstart_linepath()]))
  let t2687 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.has_path_integral_join()), t2686))
  let t2685 = @simp.expand_tac("B")
  let t2684 = @simp.asm_simp_tac(@list.List([]))
  let t2682 = @term_syntax.parse_term("(B : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t2683 = @tactics.map_every(fn(x2679 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2680 = @tactics.exists_tac(x2679)
    fn(x2681 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2680(x2681)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2)))"), t2682]))
  let t2688 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.has_path_integral_unique()), t2683), t2684), t2685), t2687), @tactics.all_tac])
  let t2678 = @tactics.subgoal_then(@term_syntax.parse_term("(integral_fB : Cart[Real, 2]) == (integral_fC : Cart[Real, 2]) + ((integral_fD : Cart[Real, 2]) + (integral_fC' : Cart[Real, 2]))"), fn(x2675 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2676 = @tactics.subst1_tac(x2675)
    fn(x2677 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2676(x2677)
    }
  })
  let t2674 = @tactics.x_gen_tac(@term_syntax.parse_term("(integral_fC' : Cart[Real, 2])"))
  let t2673 = @tactics.x_gen_tac(@term_syntax.parse_term("(integral_fD : Cart[Real, 2])"))
  let t2672 = @tactics.x_gen_tac(@term_syntax.parse_term("(integral_fC : Cart[Real, 2])"))
  let t2671 = @simp.rewrite_tac(@list.List([@cauchy.path_integrable_on(), @theorems.imp_conj(), @theorems.left_imp_exists_thm()]))
  let t2670 = @simp.simp_tac(@list.List([@cauchy.path_integrable_join(), @cauchy.valid_path_join(), @paths.pathstart_join(), @paths.pathfinish_join(), @cauchy.valid_path_linepath(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t2669 = @simp.expand_tac("B")
  let t2668 = @list.List([@meson.asm_meson_tac(@list.List([@cauchy.path_integrable_on()])), @tactics.all_tac])
  let t2667 = @tactics.subgoal_then(@term_syntax.parse_term("path_integrable_on((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2))), (B : (Cart[Real, Unit]) -> Cart[Real, 2]))"), fn(x2664 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2665 = @tactics.mp_tac(x2664)
    fn(x2666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2665(x2666)
    }
  })
  let t2661 = @simp.rewrite_tac(@list.List([@complexes.re_neg(), @calc_int.real_mul_lneg(), @transcendentals.real_exp_neg(), @realax.real_le_refl()]))
  let t2660 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @realax.real_le_refl(), @transcendentals.norm_cpow_real(), bound_lemma_1(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t2659 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2658 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2656 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_refl(), @int.arith_rule(@term_syntax.parse_term("(1 <= (N : Num)) == !(N == 0)"))]))
  let t2655 = @tactics.match_mp_tac(bound_lemma_3())
  let t2657 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("∀ w : Cart[Real, 2], vsum(op_dot_dot(1, (N : Num)), (n : Num) => (a : (Num) -> Cart[Real, 2])(n) / cpow(Cx(real_of_num(n)), w)) == (S_N : (Cart[Real, 2]) -> Cart[Real, 2])(w)")))])), t2655), t2656), @tactics.all_tac])
  let t2654 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2653 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2652 = @simp.once_rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2650 = @simp.asm_rewrite_tac(@list.List([]))
  let t2649 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t2648 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq()]))
  let t2647 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= real_of_num(1) → real_of_num(2) * x <= real_of_num(2)")))
  let t2646 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_lt_mul(), @real.real_of_num_lt(), @arith.lt_nz(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (n : Real) && real_of_num(0) < (r : Real) → real_of_num(2) * ((z : Real) * (real_of_num(1) / n / pow(r, 2))) * (n * r) == real_of_num(2) * (z / r)"))]))
  let t2645 = @simp.rewrite_tac(@list.List([@real.real_le_ladd()]))
  let t2644 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) → ((n : Real) + real_of_num(1) / x) * (real_of_num(2) * (x / (y : Real))) == real_of_num(2) / y + real_of_num(2) * (x * (n / y))"))]))
  let t2643 = @simp.asm_simp_tac(@list.List([@transcendentals.real_exp_nz(), @calc_rat.real_field(@term_syntax.parse_term("!((e : Real) == real_of_num(0)) → e * (x : Real) * (inv(e) * (y : Real)) == x * y"))]))
  let t2651 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (z : Real) → abs(z) == z"))])), t2643), t2644), t2645), t2646), t2647), t2648), t2649), t2650), @calc_rat.real_arith_tac)])
  let t2642 = @tactics.exists_tac(@term_syntax.parse_term("exp(Re((z : Cart[Real, 2])) * log(real_of_num((N : Num)))) * (real_of_num(1) / real_of_num(N) + real_of_num(1) / Re(z)) * (inv(exp(Re(z) * log(real_of_num(N)))) * (real_of_num(2) * (abs(Re(z)) / pow((R : Real), 2))))"))
  let t2641 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2639 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re(), @complexes.im()]))
  let t2638 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == complex((real_of_num(0), (R : Real))))"))
  let t2637 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == complex((real_of_num(0), -(R : Real))))"))
  let t2636 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t2635 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("(pow(real_of_num(0), 2) + pow((x : Real), 2) == pow((y : Real), 2)) == (x == y || x == -y)"))]))
  let t2634 = @tactics.disch_then(fn(x2633 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2632 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2629 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2630 = @tactics.mp_tac(x2629)
        fn(x2631 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2630(x2631)
        }
      })(@lib.last(x2632))
    })(@bool.conjuncts_rule(x2633))
  })
  let t2628 = @simp.asm_rewrite_tac(@list.List([]))
  let t2627 = @class.asm_cases_tac(@term_syntax.parse_term("Re((z : Cart[Real, 2])) == real_of_num(0)"))
  let t2626 = @simp.rewrite_tac(@list.List([@vectors.norm_eq_square(), @vectors.dot_square_norm(), @complexes.complex_sqnorm()]))
  let t2625 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_le()]))
  let t2621 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t2624 = @tactics.disch_then(fn(x2623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2619 = @tactics.mp_tac(x2618)
      fn(x2620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2619(x2620)
      }
    })(((x2622 : @kernel.Thm) => @bool.spec(t2621, x2622))(x2623))
  })
  let t2617 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @realax.real_ge()]))
  let t2640 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET(path_image((A : (Cart[Real, Unit]) -> Cart[Real, 2])), {(z : Cart[Real, 2]) | Re(z) >= real_of_num(0) && norm(z) == (R : Real)})")), t2617), t2624), t2625), t2626), t2627), t2628), t2634), t2635), t2636), @tactics.strip_tac), t2637), t2638), t2639), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2616 = @tactics.subgoal_then(@term_syntax.parse_term("norm((z : Cart[Real, 2])) == (R : Real) && real_of_num(0) < Re(z)"), @tactics.strip_assume_tac)
  let t2615 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm()]))
  let t2614 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2613 = @simp.asm_simp_tac(@list.List([@transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → -(x / real_of_num(2)) <= x / real_of_num(2)"))]))
  let t2611 = @simp.asm_simp_tac(@list.List([@real.real_pow_le(), @real.real_le_div(), @realax.real_le_mul(), @realarith.real_pos(), @realarith.real_lt_imp_le()]))
  let t2612 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_le_add()), t2611), @tactics.all_tac])
  let t2610 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_rules()]))
  let t2609 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2608 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_eq(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (R : Real) && !((N : Real) == real_of_num(0)) → (real_of_num(2) / pow(R, 2) + real_of_num(2) / (N * R)) * (R * ((p : Real) / real_of_num(2) - -(p / real_of_num(2)))) == real_of_num(2) * (p / R) + real_of_num(2) * (p / N)"))]))
  let t2601 = @term_syntax.parse_term("{complex((real_of_num(0), (R : Real))), complex((real_of_num(0), -R))}")
  let t2602 = @term_syntax.parse_term("real_of_num(2) / pow((R : Real), 2) + real_of_num(2) / (real_of_num((N : Num)) * R)")
  let t2603 = @term_syntax.parse_term("pi / real_of_num(2)")
  let t2604 = @term_syntax.parse_term("-(pi / real_of_num(2))")
  let t2605 = @term_syntax.parse_term("(R : Real)")
  let t2606 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t2607 = @term_syntax.parse_term("(integral_sA' : Cart[Real, 2])")
  let t2662 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (S_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) - z) * (cpow(Cx(real_of_num((N : Num))), -z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2)))"), t2607, t2606, t2605, t2604, t2603, t2602, t2601]), @cauchy.has_path_integral_bound_partcirclepath_strong())), t2608), t2609), t2610), @tactics.conj_tac), t2612), t2613), t2614), t2615), @tactics.strip_tac), t2616), t2640), t2641), t2642), @tactics.conj_tac), t2651), t2652), t2653), t2654), @tactics.conj_tac), t2657), t2658), t2659), t2660), t2661)
  let t2600 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.disjoint_numseg()]))
  let t2599 = @tactics.match_mp_tac(@vectors.vsum_union())
  let t2598 = @tactics.conv_tac(@equal.sym_conv)
  let t2597 = @tactics.disch_then(fn(x2596 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2594 = @tactics.subst1_tac(x2593)
      fn(x2595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2594(x2595)
      }
    })(@equal.sym(x2596))
  })
  let t2591 = @term_syntax.parse_term("(N : Num) + 1 <= (n : Num)")
  let t2592 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x2588 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2589 = @tactics.undisch_tac(x2588)
    fn(x2590 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2589(x2590)
    }
  }, @list.List([@term_syntax.parse_term("!((N : Num) == 0)"), t2591])), @int.arith_tac), @tactics.all_tac])
  let t2585 = @term_syntax.parse_term("(n : Num)")
  let t2586 = @term_syntax.parse_term("(N : Num)")
  let t2587 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("1"), t2586, t2585]), @iterate.numseg_combine_r()))
  let t2584 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("(y : Cart[Real, 2]) + (z : Cart[Real, 2]) == (x : Cart[Real, 2]) → norm(x - y) <= norm(z)")))
  let t2582 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (N : Num)) == !(N == 0)"))]))
  let t2581 = @simp.asm_simp_tac(@list.List([@realax.real_le_refl()]))
  let t2583 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(bound_lemma_4()), t2581), t2582)])
  let t2580 = @tactics.exists_tac(@term_syntax.parse_term("norm(vsum(op_dot_dot((N : Num) + 1, (n : Num)), (n : Num) => (a : (Num) -> Cart[Real, 2])(n) / cpow(Cx(real_of_num(n)), (w : Cart[Real, 2]) + (z : Cart[Real, 2]))))"))
  let t2579 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2578 = @simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("∀ w : Cart[Real, 2], vsum(op_dot_dot(1, (N : Num)), (n : Num) => (a : (Num) -> Cart[Real, 2])(n) / cpow(Cx(real_of_num(n)), w)) == (S_N : (Cart[Real, 2]) -> Cart[Real, 2])(w)")))]))
  let t2577 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2576 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1"))
  let t2574 = @simp.rewrite_tac(@list.List([@topology.sums(), @misc.from_inter_numseg()]))
  let t2571 = @kernel.assume_rule(@term_syntax.parse_term("real_of_num(0) < Re((z : Cart[Real, 2]))"))
  let t2572 = @kernel.assume_rule(@term_syntax.parse_term("Re((w : Cart[Real, 2])) == real_of_num(1)"))
  let t2573 = @simp.simp_tac(@list.List([@complexes.re_add(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (z : Real) → real_of_num(1) + z > real_of_num(1)")), t2572, t2571]))
  let t2569 = @kernel.assume_rule(@term_syntax.parse_term("∀ z : Cart[Real, 2], Re(z) > real_of_num(1) → sums((n : Num) => (a : (Num) -> Cart[Real, 2])(n) / cpow(Cx(real_of_num(n)), z), (f : (Cart[Real, 2]) -> Cart[Real, 2])(z), from(1))"))
  let t2570 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(w : Cart[Real, 2]) + (z : Cart[Real, 2])"), t2569))
  let t2568 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t2567 = @tactics.match_mp_tac(@topology.lim_sub())
  let t2575 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("∀ w : Cart[Real, 2], (f : (Cart[Real, 2]) -> Cart[Real, 2])(w) - (S_N : (Cart[Real, 2]) -> Cart[Real, 2])(w) == (r_N : (Cart[Real, 2]) -> Cart[Real, 2])(w)")))])), t2567), t2568), t2570), t2573), t2574), @tactics.all_tac])
  let t2566 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially(), @metric.trivial_limit_sequentially()]))
  let t2565 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => vsum(op_dot_dot(1, n), (n : Num) => (a : (Num) -> Cart[Real, 2])(n) / cpow(Cx(real_of_num(n)), (w : Cart[Real, 2]) + (z : Cart[Real, 2]))) - (S_N : (Cart[Real, 2]) -> Cart[Real, 2])(w + z)"))
  let t2564 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_norm_ubound()))
  let t2562 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @realax.real_le_refl(), @transcendentals.norm_cpow_real(), bound_lemma_1(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t2561 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2563 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()])), t2561), t2562)])
  let t2560 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2559 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t2558 = @simp.once_rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2556 = @simp.asm_simp_tac(@list.List([@transcendentals.real_exp_nz(), @realax.real_le_refl(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (z : Real) && !((e : Real) == real_of_num(0)) → real_of_num(1) / (z * e) * (e * (real_of_num(2) * (z / pow((R : Real), 2)))) == real_of_num(2) / pow(R, 2)"))]))
  let t2557 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (z : Real) → abs(z) == z"))])), t2556)])
  let t2555 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) / (Re((z : Cart[Real, 2])) * exp(Re(z) * log(real_of_num((N : Num))))) * (exp(Re(z) * log(real_of_num(N))) * (real_of_num(2) * (abs(Re(z)) / pow((R : Real), 2))))"))
  let t2554 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2552 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re(), @complexes.im()]))
  let t2551 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == complex((real_of_num(0), (R : Real))))"))
  let t2550 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == complex((real_of_num(0), -(R : Real))))"))
  let t2549 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t2548 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("(pow(real_of_num(0), 2) + pow((x : Real), 2) == pow((y : Real), 2)) == (x == y || x == -y)"))]))
  let t2547 = @tactics.disch_then(fn(x2546 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2545 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2543 = @tactics.mp_tac(x2542)
        fn(x2544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2543(x2544)
        }
      })(@lib.last(x2545))
    })(@bool.conjuncts_rule(x2546))
  })
  let t2541 = @simp.asm_rewrite_tac(@list.List([]))
  let t2540 = @class.asm_cases_tac(@term_syntax.parse_term("Re((z : Cart[Real, 2])) == real_of_num(0)"))
  let t2539 = @simp.rewrite_tac(@list.List([@vectors.norm_eq_square(), @vectors.dot_square_norm(), @complexes.complex_sqnorm()]))
  let t2538 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_le()]))
  let t2534 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t2537 = @tactics.disch_then(fn(x2536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2531 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2532 = @tactics.mp_tac(x2531)
      fn(x2533 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2532(x2533)
      }
    })(((x2535 : @kernel.Thm) => @bool.spec(t2534, x2535))(x2536))
  })
  let t2530 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @realax.real_ge()]))
  let t2553 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET(path_image((A : (Cart[Real, Unit]) -> Cart[Real, 2])), {(z : Cart[Real, 2]) | Re(z) >= real_of_num(0) && norm(z) == (R : Real)})")), t2530), t2537), t2538), t2539), t2540), t2541), t2547), t2548), t2549), @tactics.strip_tac), t2550), t2551), t2552), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2529 = @tactics.subgoal_then(@term_syntax.parse_term("norm((z : Cart[Real, 2])) == (R : Real) && real_of_num(0) < Re(z)"), @tactics.strip_assume_tac)
  let t2528 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm()]))
  let t2527 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2526 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2525 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((r : Real) == real_of_num(0)) → real_of_num(2) / pow(r, 2) * (r * (x : Real)) == real_of_num(2) * (x / r)")), @real.real_lt_imp_nz()]))
  let t2523 = @calc_rat.real_arith(@term_syntax.parse_term("(-((p : Real) / real_of_num(2)) <= p / real_of_num(2)) == (real_of_num(0) <= p)"))
  let t2524 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(p : Real) / real_of_num(2) - -(p / real_of_num(2)) == p")), @transcendentals.pi_pos_le(), t2523]))
  let t2522 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), @real.real_le_div(), @realarith.real_pos(), @realarith.real_lt_imp_le()]))
  let t2521 = @simp.asm_rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_rules()]))
  let t2514 = @term_syntax.parse_term("{complex((real_of_num(0), (R : Real))), complex((real_of_num(0), -R))}")
  let t2515 = @term_syntax.parse_term("real_of_num(2) / pow((R : Real), 2)")
  let t2516 = @term_syntax.parse_term("pi / real_of_num(2)")
  let t2517 = @term_syntax.parse_term("-(pi / real_of_num(2))")
  let t2518 = @term_syntax.parse_term("(R : Real)")
  let t2519 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t2520 = @term_syntax.parse_term("(integral_rA : Cart[Real, 2])")
  let t2663 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (r_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2)))"), t2520, t2519, t2518, t2517, t2516, t2515, t2514]), @cauchy.has_path_integral_bound_partcirclepath_strong())), t2521), t2522), t2524), t2525), t2526), t2527), t2528), @tactics.strip_tac), t2529), t2553), t2554), t2555), @tactics.conj_tac), t2557), t2558), t2559), t2560), @tactics.conj_tac), t2563), t2564), t2565), t2566), @tactics.conj_tac), t2575), t2576), t2577), @tactics.strip_tac), t2578), t2579), t2580), @tactics.conj_tac), t2583), t2584), t2587), @tactics.ants_tac), t2592), t2597), t2598), t2599), t2600), @int.arith_tac), t2662, @tactics.all_tac])
  let t2513 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2512 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((x : Cart[Real, 2])) <= real_of_num(2) * (a : Real) && norm((y : Cart[Real, 2])) <= real_of_num(2) * a + (b : Real) && norm((z : Cart[Real, 2])) <= (c : Real) → norm(x - y + z) <= real_of_num(4) * a + (b + c)")))
  let t2510 = @simp.expand_tac("R")
  let t2509 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t2508 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t2507 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_inv_div())]))
  let t2506 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t2505 = @simp.simp_tac(@list.List([@realax.real_div(), @real.real_le_lmul_eq(), @real.real_of_num_lt(), @calc_num.arith(), @transcendentals.pi_pos()]))
  let t2504 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) < (e : Real) → x < e"))]))
  let t2511 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(4) * (pi / (R : Real)) <= real_of_num(4) * (pi * ((e : Real) / real_of_num(3))) && (y : Real) < real_of_num(2) / real_of_num(3) * (e * pi) → real_of_num(4) * (pi / R) + y < e * (real_of_num(2) * pi)"))), t2504), t2505), t2506), t2507), t2508), t2509), t2510), @calc_rat.real_arith_tac)])
  let t2503 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) * (pi / (R : Real)) + (real_of_num(2) * (pi / real_of_num((N : Num))) + (real_of_num(6) * ((M : Real) * (R / ((d : Real) * exp(d * log(real_of_num(N)))))) + real_of_num(4) * (M / pow(R * log(real_of_num(N)), 2))))"))
  let t2502 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t2501 = @simp.simp_tac(@list.List([@real.real_lt_ldiv_eq(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (p : Real)) == (real_of_num(0) < p)"))]))
  let t2500 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @complexes.complex_norm_mul(), @complexes.complex_norm_cx(), @complexes.complex_norm_ii(), @realarith.real_mul_rid(), @transcendentals.real_abs_pi(), @calc_int.real_abs_num()]))
  let t2498 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x2497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2491 = @tactics.mp_tac(x2490)
      fn(x2492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2491(x2492)
      }
    })(((x2496 : @kernel.Thm) => @lib.check(fn(x2495 : @kernel.Thm) -> Bool raise {
      (fn(x2493 : @kernel.Term) -> Bool raise {
        @basics.is_eq(x2493)
      })((fn(x2494 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x2494)
      })(x2495))
    }, x2496))(x2497))
  }))
  let t2489 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_ldistrib(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t2488 = @simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("∀ w : Cart[Real, 2], (f : (Cart[Real, 2]) -> Cart[Real, 2])(w) - (S_N : (Cart[Real, 2]) -> Cart[Real, 2])(w) == (r_N : (Cart[Real, 2]) -> Cart[Real, 2])(w)")))]))
  let t2499 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@complexes.complex_field(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0))) → ((x : Cart[Real, 2]) == (y : Cart[Real, 2]) / z) == (z * x == y)")), @cauchy.cx_2pii_nz()])), t2488), t2489), t2498), @complexes.simple_complex_arith_tac), @tactics.all_tac])
  let t2487 = @tactics.subgoal_then(@term_syntax.parse_term("(r_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2])) == ((integral_rA : Cart[Real, 2]) - (integral_sA' : Cart[Real, 2]) + (integral_fB : Cart[Real, 2])) / (Cx(real_of_num(2)) * (Cx(pi) * ii))"), fn(x2484 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2485 = @tactics.subst1_tac(x2484)
    fn(x2486 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2485(x2486)
    }
  })
  let t2482 = @simp.asm_rewrite_tac(@list.List([]))
  let t2481 = @tactics.match_mp_tac(@cauchy.has_path_integral_sub())
  let t2480 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_rdistrib()]))
  let t2479 = @simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("∀ w : Cart[Real, 2], (f : (Cart[Real, 2]) -> Cart[Real, 2])(w) - (S_N : (Cart[Real, 2]) -> Cart[Real, 2])(w) == (r_N : (Cart[Real, 2]) -> Cart[Real, 2])(w)")))]))
  let t2478 = @simp.asm_rewrite_tac(@list.List([]))
  let t2476 = @term_syntax.parse_term("(A : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t2477 = @tactics.map_every(fn(x2473 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2474 = @tactics.exists_tac(x2473)
    fn(x2475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2474(x2475)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (r_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2)))"), t2476]))
  let t2483 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.has_path_integral_unique()), t2477), t2478), t2479), t2480), t2481), t2482), @tactics.all_tac])
  let t2472 = @tactics.subgoal_then(@term_syntax.parse_term("(integral_fA : Cart[Real, 2]) - (integral_sA : Cart[Real, 2]) == (integral_rA : Cart[Real, 2])"), fn(x2469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2470 = @tactics.assume_tac(x2469)
    fn(x2471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2470(x2471)
    }
  })
  let t2468 = @tactics.disch_then(fn(x2465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2466 = ((x2464 : @kernel.Thm) => @tactics.label_tac("rA", x2464))(x2465)
    fn(x2467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2466(x2467)
    }
  })
  let t2463 = @tactics.x_gen_tac(@term_syntax.parse_term("(integral_rA : Cart[Real, 2])"))
  let t2462 = @simp.rewrite_tac(@list.List([@cauchy.path_integrable_on(), @theorems.left_imp_exists_thm()]))
  let t2460 = @meson.asm_meson_tac(@list.List([]))
  let t2459 = @simp.rewrite_tac(@list.List([@cauchy.path_integrable_on()]))
  let t2458 = @tactics.match_mp_tac(@cauchy.path_integrable_sub())
  let t2457 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_rdistrib()]))
  let t2461 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("∀ w : Cart[Real, 2], (f : (Cart[Real, 2]) -> Cart[Real, 2])(w) - (S_N : (Cart[Real, 2]) -> Cart[Real, 2])(w) == (r_N : (Cart[Real, 2]) -> Cart[Real, 2])(w)")))])), t2457), t2458), t2459), t2460), @tactics.all_tac])
  let t2456 = @tactics.subgoal_then(@term_syntax.parse_term("path_integrable_on((z : Cart[Real, 2]) => (r_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2))), (A : (Cart[Real, Unit]) -> Cart[Real, 2]))"), fn(x2453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2454 = @tactics.mp_tac(x2453)
    fn(x2455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2454(x2455)
    }
  })
  let t2451 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_neg()]))
  let t2450 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_neg_add()), @complexes.complex_mul_lneg(), @complexes.complex_mul_rneg()]))
  let t2449 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_neg(), @complexes.complex_mul_lid()]))
  let t2448 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.complex_sub_rneg(), @complexes.complex_neg_neg()]))
  let t2447 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2446 = @tactics.remove_then("sA'", fn(x2443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2444 = @tactics.mp_tac(x2443)
    fn(x2445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2444(x2445)
    }
  })
  let t2442 = @tactics.match_mp_tac(@cauchy.has_path_integral_neg())
  let t2441 = @simp.gen_rewrite_tac(fn(x2440 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2436 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2430 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2431 = @equal.rator_conv(x2430)
        fn(x2432 : @kernel.Term) -> @kernel.Thm raise {
          s2431(x2432)
        }
      })((fn(x2433 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2434 = @equal.land_conv(x2433)
        fn(x2435 : @kernel.Term) -> @kernel.Thm raise {
          s2434(x2435)
        }
      })(x2436))
    })((fn(x2437 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2438 = @equal.abs_conv(x2437)
      fn(x2439 : @kernel.Term) -> @kernel.Thm raise {
        s2438(x2439)
      }
    })(x2440))
  }, @list.List([@equal.gsym(@complexes.complex_neg_neg())]))
  let t2429 = @simp.asm_rewrite_tac(@list.List([]))
  let t2428 = @tactics.match_mp_tac(has_path_integral_negatepath())
  let t2427 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_def(), @complexes.complex_neg_neg()])), @tactics.all_tac])
  let t2452 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(A : (Cart[Real, Unit]) -> Cart[Real, 2]) == o(op_minus_minus, o(op_minus_minus, A))"), fn(x2424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2425 = @tactics.subst1_tac(x2424)
    fn(x2426 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2425(x2426)
    }
  }), t2427), t2428), t2429), t2441), t2442), t2446), t2447), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2448), t2449), t2450), t2451), @tactics.all_tac])
  let t2423 = @tactics.subgoal_then(@term_syntax.parse_term("has_path_integral((z : Cart[Real, 2]) => (S_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) - z) * (cpow(Cx(real_of_num((N : Num))), -z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2))), (integral_sA' : Cart[Real, 2]), (A : (Cart[Real, Unit]) -> Cart[Real, 2]))"), fn(x2420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2421 = ((x2419 : @kernel.Thm) => @tactics.label_tac("s'A", x2419))(x2420)
    fn(x2422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2421(x2422)
    }
  })
  let t2417 = @simp.asm_simp_tac(@list.List([@cauchy.has_path_integral_join()]))
  let t2415 = @term_syntax.parse_term("op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (A' : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t2416 = @tactics.map_every(fn(x2412 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2413 = @tactics.exists_tac(x2412)
    fn(x2414 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2413(x2414)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (S_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2)))"), t2415]))
  let t2418 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.has_path_integral_unique()), t2416), t2417), @tactics.all_tac])
  let t2411 = @tactics.subgoal_then(@term_syntax.parse_term("(integral_sA : Cart[Real, 2]) + (integral_sA' : Cart[Real, 2]) == Cx(real_of_num(2)) * (Cx(pi) * (ii * (S_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]))))"), fn(x2408 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2409 = @tactics.assume_tac(x2408)
    fn(x2410 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2409(x2410)
    }
  })
  let t2407 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(integral_sA' : Cart[Real, 2])"))(fn(x2404 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2405 = ((x2403 : @kernel.Thm) => @tactics.label_tac("sA'", x2403))(x2404)
    fn(x2406 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2405(x2406)
    }
  }))
  let t2402 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(integral_sA : Cart[Real, 2])"))(fn(x2399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2400 = ((x2398 : @kernel.Thm) => @tactics.label_tac("sA", x2398))(x2399)
    fn(x2401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2400(x2401)
    }
  }))
  let t2397 = @simp.rewrite_tac(@list.List([@cauchy.path_integrable_on()]))
  let t2396 = @simp.asm_simp_tac(@list.List([@cauchy.path_integrable_join(), @theorems.imp_conj()]))
  let t2393 = @drule.match_mp(@cauchy.has_path_integral_integrable())
  let t2395 = @tactics.disch_then(fn(x2394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2391 = @tactics.mp_tac(x2390)
      fn(x2392 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2391(x2392)
      }
    })(t2393(x2394))
  })
  let t2389 = @tactics.disch_then(fn(x2386 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2386
    let t2388 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(th), t2388)
  })
  let t2384 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @topology.in_cball(), @vectors.dist(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t2381 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.subset_trans()))
  let t2383 = @tactics.first_x_assum(fn(x2382 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2381(x2382))
  })
  let t2380 = @simp.asm_rewrite_tac(@list.List([]))
  let t2379 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!IN((x : _), (s : (_) -> Bool)) && SUBSET(s, (t : (_) -> Bool)) → SUBSET(s, DELETE(t, x))")))
  let t2378 = @simp.asm_rewrite_tac(@list.List([@sets.union_subset()]))
  let t2377 = @list.List([@meson.asm_meson_tac(@list.List([@canal.holomorphic_on_subset(), @sets.subset_univ()])), @tactics.all_tac])
  let t2375 = @tactics.conv_tac(@complexes.complex_field)
  let t2374 = @simp.abbrev_tac(@term_syntax.parse_term("(wever : Cart[Real, 2]) == inv(pow(Cx((R : Real)), 2))"))
  let t2373 = @simp.rewrite_tac(@list.List([]))
  let t2372 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t2371 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2370 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t2369 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2376 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@cauchy.has_path_integral_eq())), t2369), @tactics.disch_tac), t2370), t2371), t2372), t2373), t2374), t2375)])
  let t2368 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rid()]))
  let t2367 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(1)) + pow(Cx(real_of_num(0)), 2) * (z : Cart[Real, 2]) == Cx(real_of_num(1))"))]))
  let t2366 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_add_rid(), @complexes.complex_pow()]))
  let t2365 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @complexes.complex_div()]))
  let t2364 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_rzero(), @complexes.complex_mul_lid(), @transcendentals.cpow_n()]))
  let t2363 = @simp.asm_rewrite_tac(@list.List([@convex.convex_cball(), @topology.interior_cball(), @topology.centre_in_ball()]))
  let t2360 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t2361 = @term_syntax.parse_term("op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (A' : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t2362 = @term_syntax.parse_term("cball((Cx(real_of_num(0)), (R : Real)))")
  let t2385 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (S_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) + pow(z, 2) / pow(Cx((R : Real)), 2)))"), t2362, t2361, t2360]), @cauchy.cauchy_integral_formula_convex_simple())), t2363), t2364), t2365), t2366), t2367), t2368), @tactics.ants_tac), t2376), @tactics.conj_tac), t2377), t2378), @tactics.conj_tac), t2379), t2380), t2383), t2384), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2359 = @tactics.subgoal_then(@term_syntax.parse_term("has_path_integral((z : Cart[Real, 2]) => (S_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2))), Cx(real_of_num(2)) * (Cx(pi) * (ii * S_N(w))), op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (A' : (Cart[Real, Unit]) -> Cart[Real, 2])))"), fn(x2356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2357 = @tactics.mp_tac(x2356)
    fn(x2358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2357(x2358)
    }
  })
  let t2354 = @simp.asm_simp_tac(@list.List([@transcendentals.holomorphic_on_cpow_right(), @canal.holomorphic_on_id(), @transcendentals.cpow_eq_0(), @canal.holomorphic_on_const(), @realax.real_of_num_eq(), @canal.holomorphic_on_mul(), @int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) == (1 <= n)")), @canal.holomorphic_on_add(), @canal.holomorphic_on_pow(), @complexes.cx_inj()]))
  let t2352 = @tactics.match_mp_tac(@canal.holomorphic_on_mul())
  let t2351 = @tactics.match_mp_tac(@canal.holomorphic_on_div())
  let t2350 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2349 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @iterate.finite_numseg()]))
  let t2348 = @tactics.match_mp_tac(@canal.holomorphic_on_vsum())
  let t2353 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@kernel.assume_rule(@term_syntax.parse_term("∀ w : Cart[Real, 2], vsum(op_dot_dot(1, (N : Num)), (n : Num) => (a : (Num) -> Cart[Real, 2])(n) / cpow(Cx(real_of_num(n)), w)) == (S_N : (Cart[Real, 2]) -> Cart[Real, 2])(w)")))])), t2348), t2349), t2350), t2351), t2352])
  let t2355 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.holomorphic_on_mul()), @tactics.conj_tac), t2353), t2354), @tactics.all_tac])
  let t2347 = @tactics.subgoal_then(@term_syntax.parse_term("holomorphic_on((z : Cart[Real, 2]) => (S_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) + pow(z, 2) * inv(pow(Cx((R : Real)), 2)))), UNIV)"), fn(x2344 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2345 = @tactics.assume_tac(x2344)
    fn(x2346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2345(x2346)
    }
  })
  let t2342 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (t : Real)"))
  let t2341 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t2340 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rneg(), @equal.gsym(@complexes.cx_mul()), @complexes.re_cx(), @complexes.im_cx(), @complexes.re_neg()]))
  let t2339 = @simp.rewrite_tac(@list.List([@complexes.complex_add_lid(), @complexes.complex_sub_rzero(), @sets.in_elim_thm()]))
  let t2336 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → !IN((x : _), t) → !IN(x, s)")))
  let t2338 = @tactics.first_x_assum(fn(x2337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2336(x2337))
  })
  let t2335 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t2334 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.conv_tac(@complexes.complex_field), @tactics.all_tac]))
  let t2333 = @simp.asm_simp_tac(@list.List([]))
  let t2331 = @tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(1))"))
  let t2332 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("-Cx(real_of_num(1))")), t2331])
  let t2330 = @tactics.match_mp_tac(@cauchy.winding_number_lt_1())
  let t2329 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(1) && (y : Real) < real_of_num(1) → x + y < real_of_num(2)")))
  let t2328 = @simp.asm_simp_tac(@list.List([@cauchy.valid_path_imp_path(), @sets.in_union(), @cauchy.valid_path_join(), @paths.pathstart_join(), @paths.pathfinish_join(), @cauchy.winding_number_join(), @realarith.real_lt_add(), @complexes.re_add()]))
  let t2343 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.winding_number_eq_1()), t2328), t2329), @tactics.conj_tac), t2330), t2332), t2333), t2334), t2335), @tactics.disch_tac), t2338), t2339), t2340), t2341), t2342), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2327 = @tactics.subgoal_then(@term_syntax.parse_term("winding_number((op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (A' : (Cart[Real, Unit]) -> Cart[Real, 2])), Cx(real_of_num(0)))) == Cx(real_of_num(1))"), fn(x2324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2325 = @tactics.assume_tac(x2324)
    fn(x2326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2325(x2326)
    }
  })
  let t2322 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @complexes.re_neg(), @vectors.norm_neg()]))
  let t2319 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → (∀ x : _, IN(x, t) → (P : (_) -> Bool)(x)) → (∀ x : _, IN(x, s) → P(x))")))
  let t2321 = @tactics.first_x_assum(fn(x2320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2319(x2320))
  })
  let t2318 = @simp.rewrite_tac(@list.List([@equal.gsym(@paths.path_image())]))
  let t2317 = @simp.once_rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t2316 = @simp.rewrite_tac(@list.List([@paths.path_image(), @sets.image_o(), @sets.subset()]))
  let t2323 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("A'"), t2316), t2317), t2318), t2321), t2322), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2315 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(path_image((A' : (Cart[Real, Unit]) -> Cart[Real, 2])), {(z : Cart[Real, 2]) | Re(z) <= real_of_num(0) && norm(z) == (R : Real)})"), fn(x2312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2313 = @tactics.assume_tac(x2312)
    fn(x2314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2313(x2314)
    }
  })
  let t2311 = @list.List([@simp.asm_simp_tac(@list.List([@cauchy.valid_path_join(), @paths.pathstart_join(), @paths.pathfinish_join(), @sets.in_union(), @paths.path_image_join(), @cauchy.valid_path_imp_path()])), @tactics.all_tac])
  let t2310 = @tactics.subgoal_then(@term_syntax.parse_term("valid_path(op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (A' : (Cart[Real, Unit]) -> Cart[Real, 2]))) && pathstart(op_plus_plus(A, A')) == complex((real_of_num(0), -(R : Real))) && pathfinish(op_plus_plus(A, A')) == complex((real_of_num(0), -R)) && !IN(Cx(real_of_num(0)), path_image(op_plus_plus(A, A'))) && path_image(op_plus_plus(A, A')) == UNION(path_image(A), path_image(A'))"), @tactics.strip_assume_tac)
  let t2308 = @simp.simp_tac(@list.List([@complexes.complex_eq(), @complexes.re_neg(), @complexes.im_neg(), @complexes.re(), @complexes.im(), @calc_int.real_neg_0(), @calc_int.real_neg_neg()]))
  let t2307 = @simp.asm_rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t2306 = @simp.rewrite_tac(@list.List([@sets.in_image(), @complexes.complex_ring(@term_syntax.parse_term("(Cx(real_of_num(0)) == -(x : Cart[Real, 2])) == (x == Cx(real_of_num(0)))"))]))
  let t2305 = @simp.asm_simp_tac(@list.List([valid_path_negatepath(), pathstart_negatepath(), pathfinish_negatepath(), winding_number_negatepath(), path_image_negatepath()]))
  let t2309 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("A'"), t2305), t2306), t2307), t2308), @tactics.all_tac])
  let t2304 = @tactics.subgoal_then(@term_syntax.parse_term("valid_path((A' : (Cart[Real, Unit]) -> Cart[Real, 2])) && pathstart(A') == complex((real_of_num(0), (R : Real))) && pathfinish(A') == complex((real_of_num(0), -R)) && !IN(Cx(real_of_num(0)), path_image(A')) && real_of_num(0) < Re(winding_number((A', Cx(real_of_num(0)))))"), @tactics.strip_assume_tac)
  let t2303 = @simp.abbrev_tac(@term_syntax.parse_term("(A' : (Cart[Real, Unit]) -> Cart[Real, 2]) == o(op_minus_minus, (A : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t2301 = @simp.asm_simp_tac(@list.List([@cauchy.has_path_integral_join()]))
  let t2299 = @term_syntax.parse_term("op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (B : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t2300 = @tactics.map_every(fn(x2296 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2297 = @tactics.exists_tac(x2296)
    fn(x2298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2297(x2298)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2)))"), t2299]))
  let t2302 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.has_path_integral_unique()), t2300), t2301), @tactics.all_tac])
  let t2295 = @tactics.subgoal_then(@term_syntax.parse_term("(integral_fA : Cart[Real, 2]) + (integral_fB : Cart[Real, 2]) == Cx(real_of_num(2)) * (Cx(pi) * (ii * (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]))))"), fn(x2292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2293 = @tactics.assume_tac(x2292)
    fn(x2294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2293(x2294)
    }
  })
  let t2291 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(integral_fB : Cart[Real, 2])"))(fn(x2288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2289 = ((x2287 : @kernel.Thm) => @tactics.label_tac("fB", x2287))(x2288)
    fn(x2290 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2289(x2290)
    }
  }))
  let t2286 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(integral_fA : Cart[Real, 2])"))(fn(x2283 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2284 = ((x2282 : @kernel.Thm) => @tactics.label_tac("fA", x2282))(x2283)
    fn(x2285 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2284(x2285)
    }
  }))
  let t2281 = @simp.rewrite_tac(@list.List([@cauchy.path_integrable_on()]))
  let t2280 = @simp.asm_simp_tac(@list.List([@cauchy.path_integrable_join(), @theorems.imp_conj()]))
  let t2277 = @drule.match_mp(@cauchy.has_path_integral_integrable())
  let t2279 = @tactics.first_assum(fn(x2278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2275 = @tactics.mp_tac(x2274)
      fn(x2276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2275(x2276)
      }
    })(t2277(x2278))
  })
  let t2272 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (d : Real)"))
  let t2271 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t2270 = @tactics.mp_tac(@complexes.complex_norm_ge_re_im())
  let t2269 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t2266 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.subset_trans()))
  let t2268 = @tactics.first_x_assum(fn(x2267 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2266(x2267))
  })
  let t2265 = @simp.asm_rewrite_tac(@list.List([]))
  let t2264 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!IN((x : _), (s : (_) -> Bool)) && SUBSET(s, (t : (_) -> Bool)) → SUBSET(s, DELETE(t, x))")))
  let t2263 = @simp.asm_simp_tac(@list.List([@paths.path_image_join(), @cauchy.valid_path_imp_path(), @sets.union_subset()]))
  let t2261 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_ge_re_im()]))
  let t2260 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((n1 : Real)) <= (n : Real) && abs((n2 : Real)) <= n → n < min((d : Real), (R : Real)) → n1 >= -d && abs(n2) <= R")))
  let t2259 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2258 = @simp.rewrite_tac(@list.List([@sets.subset(), @topology.in_ball(), @vectors.dist(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t2257 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @real.real_lt_min()]))
  let t2256 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), (R : Real))"))
  let t2262 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_interior()])), t2256), t2257), t2258), t2259), @tactics.gen_tac), t2260), t2261), @tactics.all_tac])
  let t2254 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t2253 = @tactics.match_mp_tac(@transcendentals.has_complex_derivative_cpow_right())
  let t2252 = @tactics.match_mp_tac(@canal.has_complex_derivative_at_within())
  let t2251 = @tactics.exists_tac(@term_syntax.parse_term("clog(Cx(real_of_num((N : Num)))) * cpow(Cx(real_of_num(N)), (z : Cart[Real, 2]))"))
  let t2250 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2249 = @simp.rewrite_tac(@list.List([@canal.holomorphic_on()]))
  let t2248 = @simp.simp_tac(@list.List([@canal.holomorphic_on_mul(), @canal.holomorphic_on_pow(), @canal.holomorphic_on_id(), @canal.holomorphic_on_const(), @canal.holomorphic_on_add()]))
  let t2247 = @tactics.match_mp_tac(@canal.holomorphic_on_mul())
  let t2246 = @simp.asm_rewrite_tac(@list.List([]))
  let t2245 = @simp.once_rewrite_tac(@list.List([@complexes.complex_add_sym()]))
  let t2244 = @simp.asm_rewrite_tac(@list.List([]))
  let t2255 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.holomorphic_on_mul()), t2244), t2245), t2246), t2247), t2248), t2249), t2250), @tactics.disch_tac), t2251), t2252), t2253), t2254), @tactics.all_tac])
  let t2242 = @simp.rewrite_tac(@list.List([@canal.convex_halfspace_im_ge(), @canal.convex_halfspace_im_le()]))
  let t2241 = @tactics.match_mp_tac(@convex.convex_inter())
  let t2240 = @simp.rewrite_tac(@list.List([@canal.convex_halfspace_re_ge()]))
  let t2239 = @tactics.match_mp_tac(@convex.convex_inter())
  let t2238 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))]))
  let t2243 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= (a : Real)) == (x >= -a && x <= a)"))])), t2238), t2239), t2240), t2241), t2242), @tactics.all_tac])
  let t2236 = @tactics.conv_tac(@complexes.complex_field)
  let t2235 = @simp.abbrev_tac(@term_syntax.parse_term("(wever : Cart[Real, 2]) == inv(pow(Cx((R : Real)), 2))"))
  let t2234 = @simp.rewrite_tac(@list.List([]))
  let t2233 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"))
  let t2232 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2231 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t2230 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2237 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@cauchy.has_path_integral_eq())), t2230), @tactics.disch_tac), t2231), t2232), t2233), t2234), t2235), t2236)])
  let t2229 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rid()]))
  let t2228 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("Cx(real_of_num(1)) + pow(Cx(real_of_num(0)), 2) * (z : Cart[Real, 2]) == Cx(real_of_num(1))"))]))
  let t2227 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_add_rid(), @complexes.complex_pow()]))
  let t2226 = @simp.asm_rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @complexes.complex_div()]))
  let t2225 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_rzero(), @complexes.complex_mul_lid(), @transcendentals.cpow_n()]))
  let t2222 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t2223 = @term_syntax.parse_term("op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (B : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t2224 = @term_syntax.parse_term("{(z : Cart[Real, 2]) | Re(z) >= -(d : Real) && abs(Im(z)) <= (R : Real)}")
  let t2273 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) + pow(z, 2) / pow(Cx((R : Real)), 2)))"), t2224, t2223, t2222]), @cauchy.cauchy_integral_formula_convex_simple())), t2225), t2226), t2227), t2228), t2229), @tactics.ants_tac), t2237), @tactics.conj_tac), t2243), @tactics.conj_tac), t2255), @tactics.conj_tac), t2262), t2263), @tactics.conj_tac), t2264), t2265), t2268), t2269), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t2270), t2271), t2272), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2221 = @tactics.subgoal_then(@term_syntax.parse_term("has_path_integral((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z) * (cpow(Cx(real_of_num((N : Num))), z) * (Cx(real_of_num(1)) / z + z / pow(Cx((R : Real)), 2))), Cx(real_of_num(2)) * (Cx(pi) * (ii * f(w))), op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (B : (Cart[Real, Unit]) -> Cart[Real, 2])))"), fn(x2218 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2219 = @tactics.assume_tac(x2218)
    fn(x2220 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2219(x2220)
    }
  })
  let t2216 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (t : Real)"))
  let t2215 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t2214 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rneg(), @equal.gsym(@complexes.cx_mul()), @complexes.re_cx(), @complexes.im_cx(), @complexes.re_neg()]))
  let t2213 = @simp.rewrite_tac(@list.List([@complexes.complex_add_lid(), @complexes.complex_sub_rzero(), @sets.in_elim_thm()]))
  let t2210 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → !IN((x : _), t) → !IN(x, s)")))
  let t2212 = @tactics.first_x_assum(fn(x2211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2210(x2211))
  })
  let t2209 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)"))
  let t2208 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.conv_tac(@complexes.complex_field), @tactics.all_tac]))
  let t2207 = @simp.asm_simp_tac(@list.List([]))
  let t2205 = @tactics.exists_tac(@term_syntax.parse_term("Cx(real_of_num(1))"))
  let t2206 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("-Cx(real_of_num(1))")), t2205])
  let t2204 = @tactics.match_mp_tac(@cauchy.winding_number_lt_1())
  let t2203 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(1) && (y : Real) < real_of_num(1) → x + y < real_of_num(2)")))
  let t2202 = @simp.asm_simp_tac(@list.List([@cauchy.valid_path_imp_path(), @paths.path_image_join(), @sets.in_union(), @cauchy.winding_number_join(), @realarith.real_lt_add(), @complexes.re_add()]))
  let t2217 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.winding_number_eq_1()), t2202), t2203), @tactics.conj_tac), t2204), t2206), t2207), t2208), t2209), @tactics.disch_tac), t2212), t2213), t2214), t2215), t2216), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2201 = @tactics.subgoal_then(@term_syntax.parse_term("winding_number((op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (B : (Cart[Real, Unit]) -> Cart[Real, 2])), Cx(real_of_num(0)))) == Cx(real_of_num(1))"), fn(x2198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2199 = @tactics.assume_tac(x2198)
    fn(x2200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2199(x2200)
    }
  })
  let t2197 = @list.List([@simp.asm_simp_tac(@list.List([@cauchy.valid_path_join(), @paths.pathstart_join(), @paths.pathfinish_join(), @paths.path_image_join(), @sets.in_union(), @cauchy.valid_path_imp_path()])), @tactics.all_tac])
  let t2196 = @tactics.subgoal_then(@term_syntax.parse_term("valid_path(op_plus_plus((A : (Cart[Real, Unit]) -> Cart[Real, 2]), (B : (Cart[Real, Unit]) -> Cart[Real, 2]))) && pathstart(op_plus_plus(A, B)) == complex((real_of_num(0), -(R : Real))) && pathfinish(op_plus_plus(A, B)) == complex((real_of_num(0), -R)) && !IN(Cx(real_of_num(0)), path_image(op_plus_plus(A, B)))"), @tactics.strip_assume_tac)
  let t2193 = @term_syntax.parse_term("real_of_num(0) < (R : Real)")
  let t2194 = @tactics.map_every(fn(x2190 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2191 = @tactics.undisch_tac(x2190)
    fn(x2192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2191(x2192)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0) < (d : Real)"), t2193]))
  let t2189 = @simp.asm_rewrite_tac(@list.List([@complexes.re(), @complexes.im()]))
  let t2188 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2187 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2186 = @simp.asm_rewrite_tac(@list.List([]))
  let t2185 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2184 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath(), @convex.segment_convex_hull()]))
  let t2182 = @simp.rewrite_tac(@list.List([@paths.path_image_join_subset()]))
  let t2183 = @tactics.repeat_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET(path_image(op_plus_plus((p1 : (Cart[Real, Unit]) -> Cart[Real, _]), (p2 : (Cart[Real, Unit]) -> Cart[Real, _]))), UNION(path_image(p1), path_image(p2))) && SUBSET(path_image(p1), (s : (Cart[Real, _]) -> Bool)) && SUBSET(path_image(p2), s) → SUBSET(path_image(op_plus_plus(p1, p2)), s)"))), t2182), @tactics.conj_tac))
  let t2181 = @simp.expand_tac("B")
  let t2178 = @simp.rewrite_rule(@list.List([@realax.real_ge()]))(@canal.convex_halfspace_im_ge())
  let t2179 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@realax.real_ge()]))(@canal.convex_halfspace_re_ge()), t2178, @canal.convex_halfspace_re_le(), @canal.convex_halfspace_im_le()]))
  let t2177 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@convex.convex_inter()), @tactics.conj_tac))
  let t2176 = @sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))
  let t2180 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_bounds_le()), t2176])), t2177), t2179), @tactics.all_tac])
  let t2195 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("convex({(z : Cart[Real, 2]) | -(d : Real) <= Re(z) && Re(z) <= real_of_num(0) && abs(Im(z)) <= (R : Real)})"), fn(x2173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2174 = @tactics.assume_tac(x2173)
    fn(x2175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2174(x2175)
    }
  }), t2180), t2181), t2183), t2184), t2185), t2186), t2187), t2188), t2189), t2194), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2172 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(path_image((B : (Cart[Real, Unit]) -> Cart[Real, 2])), {(z : Cart[Real, 2]) | -(d : Real) <= Re(z) && Re(z) <= real_of_num(0) && abs(Im(z)) <= (R : Real)})"), fn(x2169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2170 = @tactics.assume_tac(x2169)
    fn(x2171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2170(x2171)
    }
  })
  let t2167 = @simp.simp_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t2168 = @list.List([@tactics.then_tac(@simp.expand_tac("B"), t2167), @tactics.all_tac])
  let t2166 = @tactics.subgoal_then(@term_syntax.parse_term("pathstart((B : (Cart[Real, Unit]) -> Cart[Real, 2])) == complex((real_of_num(0), (R : Real))) && pathfinish(B) == complex((real_of_num(0), -R))"), @tactics.strip_assume_tac)
  let t2164 = @simp.asm_simp_tac(@list.List([@real.real_neg_eq_0(), @real.real_lt_imp_nz()]))
  let t2163 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) == (real_of_num(1) - (u : Real)) * (x : Real) + u * x) == (x == real_of_num(0))"))]))
  let t2162 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_cmul(), @complexes.re_add(), @complexes.re_cx(), @complexes.re(), @complexes.im_cmul(), @complexes.im_add(), @complexes.im_cx(), @complexes.im()]))
  let t2161 = @simp.rewrite_tac(@list.List([@paths.path_image_linepath(), @topology.segment(), @sets.in_elim_thm()]))
  let t2158 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t2157 = @tactics.conv_tac(@equal.rand_conv(@calc_rat.real_poly_conv))
  let t2156 = @simp.rewrite_tac(@list.List([@complexes.complex_mul(), @complexes.re(), @complexes.im(), @complexes.re_sub(), @complexes.re_cnj(), @complexes.im_sub(), @complexes.im_cnj(), @complexes.re_cx(), @complexes.im_cx()]))
  let t2159 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.winding_number_linepath_pos_lt()), t2156), t2157), t2158)])
  let t2160 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cauchy.valid_path_linepath()])), @tactics.conj_tac), t2159)
  let t2154 = @simp.rewrite_tac(@list.List([@paths.pathstart_join(), @paths.pathfinish_join(), @paths.pathstart_linepath(), @paths.pathfinish_linepath()]))
  let t2155 = @tactics.repeat_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.winding_number_join_pos_combined()), t2154), @tactics.conj_tac))
  let t2165 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("B"), t2155), t2160), t2161), t2162), t2163), t2164), @tactics.all_tac])
  let t2153 = @tactics.subgoal_then(@term_syntax.parse_term("valid_path((B : (Cart[Real, Unit]) -> Cart[Real, 2])) && !IN(Cx(real_of_num(0)), path_image(B)) && real_of_num(0) < Re(winding_number((B, Cx(real_of_num(0)))))"), @tactics.strip_assume_tac)
  let t2152 = @simp.abbrev_tac(@term_syntax.parse_term("(B : (Cart[Real, Unit]) -> Cart[Real, 2]) == op_plus_plus(linepath((complex((real_of_num(0), (R : Real))), complex((-(d : Real), R)))), op_plus_plus(linepath((complex((-d, R)), complex((-d, -R)))), linepath((complex((-d, -R)), complex((real_of_num(0), -R))))))"))
  let t2150 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (R : Real)"))
  let t2149 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @complexes.complex_norm_0()]))
  let t2147 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → !IN((x : _), t) → !IN(x, s)")))
  let t2151 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x2148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2147(x2148))
  }), t2149), t2150), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2146 = @tactics.subgoal_then(@term_syntax.parse_term("!IN(Cx(real_of_num(0)), path_image((A : (Cart[Real, Unit]) -> Cart[Real, 2])))"), fn(x2143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2144 = @tactics.assume_tac(x2143)
    fn(x2145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2144(x2145)
    }
  })
  let t2141 = @simp.asm_simp_tac(@list.List([@transcendentals.cos_pos_pi_le()]))
  let t2140 = @simp.rewrite_tac(@list.List([@complexes.im_mul_ii(), @complexes.re_cx()]))
  let t2139 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_le()]))
  let t2138 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2137 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t2136 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2135 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (r : Real) → abs(r) == r")), @realax.real_ge()]))
  let t2134 = @simp.rewrite_tac(@list.List([@complexes.im_cx(), @calc_int.real_neg_0(), @transcendentals.real_exp_0(), @realarith.real_mul_rid()]))
  let t2133 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @transcendentals.norm_cexp(), @complexes.complex_norm_cx(), @complexes.re_mul_ii()]))
  let t2132 = @simp.asm_rewrite_tac(@list.List([@complexes.re_mul_cx(), @transcendentals.re_cexp()]))
  let t2131 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2130 = @simp.rewrite_tac(@list.List([@sets.subset(), @complexes.complex_add_lid(), @sets.in_elim_thm()]))
  let t2129 = @simp.asm_simp_tac(@list.List([@cauchy.path_image_partcirclepath(), @realarith.real_lt_imp_le(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("(-(p : Real) < p) == (real_of_num(0) < p)")), @misc.real_half()]))
  let t2142 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("A"), t2129), t2130), t2131), t2132), t2133), t2134), t2135), t2136), t2137), t2138), t2139), t2140), t2141), @tactics.all_tac])
  let t2128 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(path_image((A : (Cart[Real, Unit]) -> Cart[Real, 2])), {(z : Cart[Real, 2]) | Re(z) >= real_of_num(0) && norm(z) == (R : Real)})"), fn(x2125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2126 = @tactics.assume_tac(x2125)
    fn(x2127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2126(x2127)
    }
  })
  let t2123 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t2122 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_0(), @complexes.complex_sub_refl()]))
  let t2121 = @tactics.match_mp_tac(@cauchy.winding_number_partcirclepath_pos_lt())
  let t2120 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])))
  let t2119 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_mul_cx(), @complexes.re_ii(), @complexes.im_ii(), @complexes.im_mul_cx(), @complexes.re(), @complexes.im()]))
  let t2118 = @simp.rewrite_tac(@list.List([@complexes.complex_add_lid(), @complexes.complex_mul_rid()]))
  let t2116 = @equal.gsym(@transcendentals.cx_cos())
  let t2117 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_euler(), @transcendentals.sin_neg(), @transcendentals.cos_neg(), @transcendentals.sin_pi2(), @transcendentals.cos_pi2(), @equal.gsym(@transcendentals.cx_sin()), t2116]))
  let t2115 = @simp.rewrite_tac(@list.List([@cauchy.pathstart_partcirclepath(), @cauchy.pathfinish_partcirclepath()]))
  let t2114 = @simp.rewrite_tac(@list.List([@cauchy.valid_path_partcirclepath()]))
  let t2124 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("A"), t2114), t2115), t2117), t2118), t2119), t2120), t2121), t2122), t2123), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2113 = @tactics.subgoal_then(@term_syntax.parse_term("valid_path((A : (Cart[Real, Unit]) -> Cart[Real, 2])) && pathstart(A) == complex((real_of_num(0), -(R : Real))) && pathfinish(A) == complex((real_of_num(0), R)) && real_of_num(0) < Re(winding_number((A, Cx(real_of_num(0)))))"), @tactics.strip_assume_tac)
  let t2112 = @simp.abbrev_tac(@term_syntax.parse_term("(A : (Cart[Real, Unit]) -> Cart[Real, 2]) == partcirclepath((Cx(real_of_num(0)), (R : Real), -(pi / real_of_num(2)), pi / real_of_num(2)))"))
  let t2111 = @simp.abbrev_tac(@term_syntax.parse_term("(r_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2])) == (f : (Cart[Real, 2]) -> Cart[Real, 2])(w) - (S_N : (Cart[Real, 2]) -> Cart[Real, 2])(w)"))
  let t2110 = @simp.once_rewrite_tac(@list.List([@vectors.norm_sub()]))
  let t2109 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t2108 = @simp.abbrev_tac(@term_syntax.parse_term("(S_N : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2])) == vsum(op_dot_dot(1, (N : Num)), (n : Num) => (a : (Num) -> Cart[Real, 2])(n) / cpow(Cx(real_of_num(n)), w))"))
  let t2107 = @simp.rewrite_tac(@list.List([@misc.from_inter_numseg()]))
  let t2106 = @tactics.subgoal_then(@term_syntax.parse_term("!((N : Num) == 0) && 1 < N"), @tactics.strip_assume_tac)
  let t2105 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(N0 : Num) + 2 <= (N : Num) → N0 <= N"))]))
  let t2101 = @term_syntax.parse_term("(N : Num)")
  let t2104 = @tactics.remove_then("X", fn(x2103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2098 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2099 = @tactics.mp_tac(x2098)
      fn(x2100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2099(x2100)
      }
    })(((x2102 : @kernel.Thm) => @bool.spec(t2101, x2102))(x2103))
  })
  let t2097 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t2096 = @tactics.exists_tac(@term_syntax.parse_term("(N0 : Num) + 2"))
  let t2095 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N0 : Num)"))(fn(x2092 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2093 = ((x2091 : @kernel.Thm) => @tactics.label_tac("X", x2091))(x2092)
    fn(x2094 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2093(x2094)
    }
  }))
  let t2090 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2) / real_of_num(3)"))]))
  let t2086 = @term_syntax.parse_term("real_of_num(2) / real_of_num(3) * ((e : Real) * pi)")
  let t2089 = @tactics.disch_then(fn(x2088 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2083 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2084 = @tactics.mp_tac(x2083)
      fn(x2085 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2084(x2085)
      }
    })(((x2087 : @kernel.Thm) => @bool.spec(t2086, x2087))(x2088))
  })
  let t2082 = @simp.asm_rewrite_tac(@list.List([]))
  let t2079 = @term_syntax.parse_term("(R : Real)")
  let t2080 = @term_syntax.parse_term("(M : Real)")
  let t2081 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(d : Real)"), t2080, t2079]), overall_bound_lemma()))
  let t2077 = @simp.rewrite_tac(@list.List([@canal.closed_halfspace_re_le(), @canal.closed_halfspace_im_le(), @canal.closed_halfspace_re_ge(), @canal.closed_halfspace_im_ge()]))
  let t2076 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.closed_inter()), @tactics.conj_tac))
  let t2075 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))]))
  let t2073 = @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) <= Im((z : Cart[Real, 2]))) == (Im(z) >= x)"))
  let t2074 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_bounds_le()), t2073]))
  let t2071 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (d : Real)"))
  let t2070 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t2069 = @tactics.mp_tac(@complexes.complex_norm_le_re_im())
  let t2068 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_lzero(), @vectors.norm_neg(), @sets.in_elim_thm()]))
  let t2067 = @simp.rewrite_tac(@list.List([@topology.bounded_cball(), @sets.subset(), @topology.in_cball(), @vectors.dist()]))
  let t2066 = @tactics.exists_tac(@term_syntax.parse_term("cball((Cx(real_of_num(0)), real_of_num(2) * (R : Real) + (d : Real)))"))
  let t2072 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.bounded_subset()), t2066), t2067), t2068), t2069), t2070), t2071), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2065 = @simp.rewrite_tac(@list.List([@topology.compact_eq_bounded_closed()]))
  let t2063 = @sets.set_tac(@list.List([]))
  let t2062 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) → (c : Bool)) == (b → a → c)"))]))(@topology.continuous_on_subset()))
  let t2060 = @drule.match_mp(@canal.holomorphic_on_imp_continuous_on())
  let t2064 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x2061 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2057 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2058 = @tactics.mp_tac(x2057)
      fn(x2059 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2058(x2059)
      }
    })(t2060(x2061))
  }), t2062), t2063), @tactics.all_tac])
  let t2056 = @tactics.match_mp_tac(@topology.compact_continuous_image())
  let t2055 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2054 = @simp.rewrite_tac(@list.List([@topology.bounded_pos(), @sets.forall_in_image(), @sets.in_elim_thm()]))
  let t2078 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("IMAGE((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z), {(z : Cart[Real, 2]) | Re(z) >= -(d : Real) && abs(Im(z)) <= (R : Real) && Re(z) <= R})"), @topology.compact_imp_bounded())), t2054), t2055), t2056), @tactics.conj_tac), t2064), t2065), @tactics.conj_tac), t2072), t2074), t2075), t2076), t2077), @tactics.all_tac])
  let t2051 = @tactics.conjuncts_then2(fn(x2044 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2045 = @tactics.assume_tac(x2044)
    fn(x2046 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2045(x2046)
    }
  }, fn(x2048 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2049 = ((x2047 : @kernel.Thm) => @tactics.label_tac("2a", x2047))(x2048)
    fn(x2050 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2049(x2050)
    }
  })
  let t2052 = @tactics.x_choose_then(@term_syntax.parse_term("(M : Real)"))(t2051)
  let t2053 = @tactics.subgoal_then(@term_syntax.parse_term("∃ M : Real, real_of_num(0) < M && (∀ z : Cart[Real, 2], Re(z) >= -(d : Real) && abs(Im(z)) <= (R : Real) && Re(z) <= R → norm((f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z)) <= M)"), t2052)
  let t2042 = @tactics.undisch_tac(@term_syntax.parse_term("!(real_of_num(0) <= Re((z : Cart[Real, 2])))"))
  let t2041 = @simp.asm_rewrite_tac(@list.List([]))
  let t2037 = @term_syntax.parse_term("(v : Cart[Real, 2])")
  let t2040 = @tactics.disch_then(fn(x2039 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2034 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2035 = @tactics.mp_tac(x2034)
      fn(x2036 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2035(x2036)
      }
    })(((x2038 : @kernel.Thm) => @bool.spec(t2037, x2038))(x2039))
  })
  let t2033 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t2032 = @simp.asm_simp_tac(@list.List([@sets.real_le_inf_finite(), @sets.finite_image(), @sets.image_eq_empty()]))
  let t2029 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("-((x : Real) / real_of_num(2)) <= (z : Real) → real_of_num(2) * -z <= x")))
  let t2031 = @tactics.first_x_assum(fn(x2030 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2026 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2027 = @tactics.mp_tac(x2026)
      fn(x2028 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2027(x2028)
      }
    })(t2029(x2030))
  })
  let t2025 = @simp.asm_simp_tac(@list.List([@complexes.re_sub(), @realarith.real_lt_imp_le()]))
  let t2024 = @simp.asm_simp_tac(@list.List([@complexes.im_sub(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (b : Real) → abs(b / real_of_num(2)) == b / real_of_num(2)"))]))
  let t2023 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @equal.gsym(@real.real_le_square_abs())]))
  let t2022 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (b : Real) * b && (x : Real) <= pow(b / real_of_num(2), 2) && (y : Real) <= pow(b / real_of_num(2), 2) → x + y < pow(b, 2)")))
  let t2021 = @tactics.match_mp_tac(@real.sqrt_mono_lt())
  let t2020 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.pow_2_sqrt_abs())]))
  let t2019 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (e : Real) && (x : Real) < abs(e) → x < e")))
  let t2018 = @simp.rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_norm()]))
  let t2017 = @simp.rewrite_tac(@list.List([@topology.in_ball()]))
  let t2016 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2015 = @simp.simp_tac(@list.List([@canal.holomorphic_on_open(), @topology.open_ball(), @equal.gsym(@canal.complex_differentiable())]))
  let t2014 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2008 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2009 = @tactics.assume_tac(x2008)
    fn(x2010 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2009(x2010)
    }
  }, fn(x2011 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2012 = @tactics.mp_tac(x2011)
    fn(x2013 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2012(x2013)
    }
  }))
  let t2007 = @simp.asm_simp_tac(@list.List([@realax.real_le_refl()]))
  let t2003 = @term_syntax.parse_term("(v : Cart[Real, 2])")
  let t2006 = @tactics.disch_then(fn(x2005 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2000 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2001 = @tactics.mp_tac(x2000)
      fn(x2002 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2001(x2002)
      }
    })(((x2004 : @kernel.Thm) => @bool.spec(t2003, x2004))(x2005))
  })
  let t1999 = @tactics.undisch_tac(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) <= Re(z) → real_of_num(0) < (bs : (Cart[Real, 2]) -> Real)(z) && holomorphic_on((g : (Cart[Real, 2]) -> Cart[Real, 2]), ball((z, bs(z))))"))
  let t1998 = @tactics.disch_then(fn(x1997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1994 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1995 = @tactics.assume_tac(x1994)
      fn(x1996 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1995(x1996)
      }
    })(@bool.conjunct2(x1997))
  })
  let t1993 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @complexes.re_sub(), @complexes.im_sub(), @complexes.re(), @complexes.im()]))
  let t1991 = @simp.rewrite_tac(@list.List([@complexes.re()]))
  let t1990 = @simp.rewrite_tac(@list.List([@vectors.in_interval(), @vectors.forall_2(), @equal.gsym(@complexes.re_def()), @cart.dimindex_2()]))
  let t1987 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((t : (_) -> Bool), (s : (_) -> Bool)) → (IN((x : _), s) → (P : (_) -> Bool)(x)) → IN(x, t) → P(x)")))
  let t1989 = @tactics.first_assum(fn(x1988 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1987(x1988))
  })
  let t1992 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((v : Cart[Real, 2]), (t : (Cart[Real, 2]) -> Bool))")), t1989), t1990), t1991), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1986 = @tactics.subgoal_then(@term_syntax.parse_term("Re((v : Cart[Real, 2])) == real_of_num(0)"), fn(x1983 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1984 = @tactics.assume_tac(x1983)
    fn(x1985 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1984(x1985)
    }
  })
  let t1982 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1976 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1977 = @tactics.assume_tac(x1976)
    fn(x1978 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1977(x1978)
    }
  }, fn(x1979 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1980 = @tactics.mp_tac(x1979)
    fn(x1981 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1980(x1981)
    }
  }))
  let t1975 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(v : Cart[Real, 2])"))(fn(x1972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1973 = @tactics.mp_tac(x1972)
    fn(x1974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1973(x1974)
    }
  }))
  let t1971 = @simp.rewrite_tac(@list.List([@sets.in_unions(), @sets.exists_in_image()]))
  let t1969 = @tactics.undisch_tac(@term_syntax.parse_term("abs(Im((z : Cart[Real, 2]))) <= (R : Real)"))
  let t1967 = @equal.gsym(@complexes.im_def())
  let t1968 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t1967, @complexes.re(), @complexes.im()]))
  let t1970 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_2(), @vectors.forall_2()])), t1968), t1969), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1964 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((i : (_) -> Bool), UNIONS((s : ((_) -> Bool) -> Bool))) → (∀ x : _, IN(x, i) → IN(x, UNIONS(s)))")))
  let t1961 = @term_syntax.parse_term("complex((real_of_num(0), Im((z : Cart[Real, 2]))))")
  let t1966 = @tactics.first_assum(fn(x1965 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1963 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1958 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1959 = @tactics.mp_tac(x1958)
        fn(x1960 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1959(x1960)
        }
      })(((x1962 : @kernel.Thm) => @bool.spec(t1961, x1962))(x1963))
    })(t1964(x1965))
  })
  let t1957 = @list.List([@meson.asm_meson_tac(@list.List([@canal.holomorphic_on_open(), @canal.complex_differentiable(), @topology.open_ball(), @topology.centre_in_ball()])), @tactics.all_tac])
  let t1956 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= Re((z : Cart[Real, 2]))"))
  let t1955 = @tactics.match_mp_tac(@canal.complex_differentiable_at_within())
  let t1954 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_ge()]))
  let t1953 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1952 = @simp.rewrite_tac(@list.List([@canal.holomorphic_on_differentiable()]))
  let t1950 = @meson.asm_meson_tac(@list.List([]))
  let t1949 = @simp.rewrite_tac(@list.List([@complexes.re()]))
  let t1948 = @simp.rewrite_tac(@list.List([@vectors.in_interval(), @vectors.forall_2(), @equal.gsym(@complexes.re_def()), @cart.dimindex_2()]))
  let t1946 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((t : (_) -> Bool), (s : (_) -> Bool)) → (∀ x : _, IN(x, s) → (P : (_) -> Bool)(x)) → (∀ x : _, IN(x, t) → P(x))")))
  let t1951 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1947 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1946(x1947))
  }), t1948), t1949), t1950), @tactics.all_tac])
  let t1945 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t1944 = @simp.asm_simp_tac(@list.List([@sets.real_lt_inf_finite(), @sets.finite_image(), @sets.image_eq_empty()]))
  let t1943 = @simp.rewrite_tac(@list.List([@misc.real_half()]))
  let t1941 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (R : Real)"))
  let t1939 = @equal.gsym(@complexes.im_def())
  let t1940 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t1939, @complexes.re(), @complexes.im()]))
  let t1938 = @simp.rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_2(), @vectors.forall_2()]))
  let t1937 = @tactics.exists_tac(@term_syntax.parse_term("complex((real_of_num(0), real_of_num(0)))"))
  let t1942 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty())])), t1937), t1938), t1940), t1941), @calc_rat.real_arith_tac), @tactics.disch_tac])
  let t1934 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), UNIONS(IMAGE((g : (_, _) -> Bool), (t : (_) -> Bool)))) → !(s == {}) → !(t == {})")))
  let t1936 = @tactics.first_assum(fn(x1935 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1932 = @tactics.mp_tac(x1931)
      fn(x1933 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1932(x1933)
      }
    })(t1934(x1935))
  })
  let t1930 = @tactics.exists_tac(@term_syntax.parse_term("inf(IMAGE((bs : (Cart[Real, 2]) -> Real), (t : (Cart[Real, 2]) -> Bool))) / real_of_num(2)"))
  let t1929 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : (Cart[Real, 2]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1928 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t1927 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t1926 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool)) == (d && a && b && c)"))]))
  let t1925 = @simp.rewrite_tac(@list.List([@sets.finite_subset_image(), @theorems.right_and_exists_thm()]))
  let t1924 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool)) == (c && b && a)"))]))
  let t1922 = @meson.asm_meson_tac(@list.List([@misc.real_half()]))
  let t1920 = @equal.gsym(@complexes.im_def())
  let t1921 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t1920, @complexes.re(), @complexes.im()]))
  let t1919 = @simp.rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_2(), @vectors.forall_2()]))
  let t1918 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx(), @complexes.im_cx(), @calc_int.real_abs_num()]))
  let t1917 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_refl(), @complexes.complex_norm_0(), @sets.in_elim_thm()]))
  let t1916 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → IN(x, (g : (_, _) -> Bool)(x))) → SUBSET(s, UNIONS(IMAGE(g, s)))")))
  let t1915 = @simp.rewrite_tac(@list.List([@canal.open_halfspace_im_gt(), @canal.open_halfspace_im_lt(), @canal.open_halfspace_re_gt(), @canal.open_halfspace_re_lt()]))
  let t1914 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.open_inter()), @tactics.strip_tac))
  let t1913 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))]))
  let t1912 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @complexes.im_sub(), @calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real) - (a : Real)) < (e : Real) && abs((y : Real) - (b : Real)) < e) == (a < x + e && a > x - e && b < y + e && b > y - e)"))]))
  let t1911 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1923 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.forall_in_image()])), t1911), t1912), t1913), t1914), t1915), @tactics.all_tac])), t1916), t1917), t1918), t1919), t1921), t1922), @tactics.all_tac])
  let t1907 = @term_syntax.parse_term("IMAGE((z : Cart[Real, 2]) => {(w : Cart[Real, 2]) | abs(Re(z - w)) < (bs : (Cart[Real, 2]) -> Real)(z) / real_of_num(2) && abs(Im(z - w)) < bs(z) / real_of_num(2)}, interval([(complex((real_of_num(0), -(R : Real))), complex((real_of_num(0), R)))]))")
  let t1910 = @tactics.disch_then(fn(x1909 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1904 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1905 = @tactics.mp_tac(x1904)
      fn(x1906 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1905(x1906)
      }
    })(((x1908 : @kernel.Thm) => @bool.spec(t1907, x1908))(x1909))
  })
  let t1903 = @simp.rewrite_tac(@list.List([@topology.compact_eq_heine_borel()]))
  let t1901 = @term_syntax.parse_term("complex((real_of_num(0), (R : Real)))")
  let t1902 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("complex((real_of_num(0), -(R : Real)))"), t1901]), @topology.compact_interval()))
  let t1898 = @term_syntax.parse_term("(bs : (Cart[Real, 2]) -> Real)")
  let t1900 = @tactics.disch_then((x1899 : @kernel.Thm) => @tactics.x_choose_tac(t1898, x1899))
  let t1897 = @simp.rewrite_tac(@list.List([@class.skolem_thm()]))
  let t1896 = @simp.gen_rewrite_tac(fn(x1895 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1889 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1890 = @equal.land_conv(x1889)
      fn(x1891 : @kernel.Term) -> @kernel.Thm raise {
        s1890(x1891)
      }
    })((fn(x1892 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1893 = @equal.once_depth_conv(x1892)
      fn(x1894 : @kernel.Term) -> @kernel.Thm raise {
        s1893(x1894)
      }
    })(x1895))
  }, @list.List([@class.right_imp_exists_thm()]))
  let t1887 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t1886 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((x : Cart[Real, 2]) == (w : Cart[Real, 2]) + (y : Cart[Real, 2])) == (x - w == y)"))]))
  let t1885 = @simp.rewrite_tac(@list.List([@sets.extension(), @topology.in_ball(), @sets.in_image()]))
  let t1884 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1883 = @tactics.undisch_tac(@term_syntax.parse_term("holomorphic_on((f : (Cart[Real, 2]) -> Cart[Real, 2]), ball(((w : Cart[Real, 2]) + (z : Cart[Real, 2]), (d : Real))))"))
  let t1882 = @simp.simp_tac(@list.List([@canal.holomorphic_on_add(), @canal.holomorphic_on_id(), @canal.holomorphic_on_const()]))
  let t1881 = @tactics.match_mp_tac(@canal.holomorphic_on_compose())
  let t1880 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@trivia.o_def())]))
  let t1879 = @simp.expand_tac("g")
  let t1878 = @simp.asm_rewrite_tac(@list.List([]))
  let t1877 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Real)"))
  let t1876 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1875 = @simp.asm_simp_tac(@list.List([@complexes.re_add(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (z : Real) → real_of_num(1) <= real_of_num(1) + z"))]))
  let t1871 = @term_syntax.parse_term("(w : Cart[Real, 2]) + (z : Cart[Real, 2])")
  let t1874 = @tactics.disch_then(fn(x1873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1868 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1869 = @tactics.mp_tac(x1868)
      fn(x1870 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1869(x1870)
      }
    })(((x1872 : @kernel.Thm) => @bool.spec(t1871, x1872))(x1873))
  })
  let t1867 = @tactics.undisch_tac(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(1) <= Re(z) → (∃ e : Real, real_of_num(0) < e && holomorphic_on((f : (Cart[Real, 2]) -> Cart[Real, 2]), ball((z, e))))"))
  let t1888 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), t1867), t1874), t1875), t1876), t1877), @tactics.strip_tac), t1878), t1879), t1880), t1881), t1882), t1883), t1884), @tactics.ap_term_tac), t1885), t1886), t1887), @vectors.norm_arith_tac), @tactics.all_tac])
  let t1866 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], real_of_num(0) <= Re(z) → (∃ e : Real, real_of_num(0) < e && holomorphic_on((g : (Cart[Real, 2]) -> Cart[Real, 2]), ball((z, e))))"), fn(x1863 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1864 = @tactics.mp_tac(x1863)
    fn(x1865 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1864(x1865)
    }
  })
  let t1862 = @simp.abbrev_tac(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2]) == ((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z))"))
  let t1860 = @simp.asm_rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t1859 = @tactics.exists_tac(@term_syntax.parse_term("{(z : Cart[Real, 2]) | Re(z) >= -(d : Real) && abs(Im(z)) <= (R : Real)}"))
  let t1858 = @tactics.match_mp_tac(@canal.holomorphic_on_subset())
  let t1857 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min()]))
  let t1861 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("min((d : Real), (R : Real))")), t1857), @tactics.conj_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t1858), t1859), t1860), @calc_rat.real_arith_tac)])
  let t1856 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac)
  let t2043 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ d : Real, real_of_num(0) < d && holomorphic_on((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z), {(z : Cart[Real, 2]) | Re(z) >= -d && abs(Im(z)) <= (R : Real)})"), t1856), t1861), t1862), t1866), t1888), t1896), t1897), t1900), t1902), t1903), t1910), @tactics.ants_tac), t1923), t1924), t1925), t1926), t1927), t1928), t1929), t1930), t1936), @tactics.ants_tac), t1942), t1943), t1944), t1945), @tactics.conj_tac), t1951), t1952), t1953), t1954), @tactics.strip_tac), t1955), t1956), t1957), t1966), @tactics.ants_tac), t1970), t1971), t1975), t1982), t1986), t1992), t1993), t1998), t1999), t2006), t2007), t2014), t2015), t2016), t2017), t2018), t2019), t2020), t2021), t2022), t2023), t2024), t2025), t2031), t2032), t2033), t2040), t2041), t2042), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1853 = @tactics.conjuncts_then2(fn(x1843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1844 = @tactics.assume_tac(x1843)
    fn(x1845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1844(x1845)
    }
  }, @tactics.conjuncts_then2(fn(x1846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1847 = @tactics.assume_tac(x1846)
    fn(x1848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1847(x1848)
    }
  }, fn(x1850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1851 = ((x1849 : @kernel.Thm) => @tactics.label_tac("2", x1849))(x1850)
    fn(x1852 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1851(x1852)
    }
  }))
  let t1854 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(t1853)
  let t1855 = @tactics.subgoal_then(@term_syntax.parse_term("∃ d : Real, real_of_num(0) < d && d <= (R : Real) && holomorphic_on((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + z), {(z : Cart[Real, 2]) | Re(z) >= -d && abs(Im(z)) <= R})"), t1854)
  let t1842 = @list.List([@tactics.then_tac(@simp.expand_tac("R"), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1841 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (R : Real)"), fn(x1838 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1839 = @tactics.assume_tac(x1838)
    fn(x1840 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1839(x1840)
    }
  })
  let t1837 = @simp.abbrev_tac(@term_syntax.parse_term("(R : Real) == max(real_of_num(3) / (e : Real), real_of_num(1))"))
  let t1836 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1835 = @simp.rewrite_tac(@list.List([@topology.sums(), @topology.lim_sequentially()]))
  let t1834 = @simp.asm_simp_tac(@list.List([]))
  let t1831 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (w : Real) → w > real_of_num(1) || w == real_of_num(1)")))
  let t1833 = @tactics.first_x_assum(fn(x1832 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t1831(x1832))
  })
  let t1830 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t1829 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2948 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_ge(), @canal.analytic_on(), @sets.in_elim_thm()])), t1829), @tactics.strip_tac), t1830), @tactics.disch_tac), t1833), t1834), t1835), t1836), @tactics.strip_tac), t1837), t1841), t1842), t1855), t2043), t2053), t2078), t2081), t2082), t2089), t2090), t2095), t2096), t2097), @tactics.disch_tac), t2104), t2105), @tactics.disch_tac), t2106), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t2107), t2108), t2109), t2110), t2111), t2112), t2113), t2124), t2128), t2142), t2146), t2151), t2152), t2153), t2165), t2166), t2168), t2172), t2195), t2196), t2197), t2201), t2217), t2221), t2273), t2279), t2280), t2281), t2286), t2291), t2295), t2302), t2303), t2304), t2309), t2310), t2311), t2315), t2323), t2327), t2343), t2347), t2355), t2359), t2385), t2389), t2395), t2396), t2397), t2402), t2407), t2411), t2418), t2423), t2452), t2456), t2461), t2462), t2463), t2468), t2472), t2483), t2487), t2499), t2500), t2501), t2502), t2503), @tactics.conj_tac), t2511), t2512), t2513), t2663), t2667), t2668), t2669), t2670), t2671), t2672), @tactics.disch_tac), t2673), @tactics.disch_tac), t2674), @tactics.disch_tac), t2678), t2688), t2689), @tactics.conj_tac), t2783), t2787), t2788), @tactics.ants_tac), t2800), t2801), t2802), t2803), t2804), t2810), t2811), t2812), t2813), t2831), t2837), t2844), t2847), t2849), t2850), t2873), t2947)
  newman_ingham_theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ a : (Num) -> Cart[Real, 2], (∀ n : Num, 1 <= n → norm(a(n)) <= real_of_num(1)) && analytic_on(f, {(z : Cart[Real, 2]) | Re(z) >= real_of_num(1)}) && (∀ z : Cart[Real, 2], Re(z) > real_of_num(1) → sums((n : Num) => a(n) / cpow(Cx(real_of_num(n)), z), f(z), from(1))) → (∀ z : Cart[Real, 2], Re(z) >= real_of_num(1) → sums((n : Num) => a(n) / cpow(Cx(real_of_num(n)), z), f(z), from(1)))"), t2948))
}

///|
let newman_ingham_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEWMAN_INGHAM_THEOREM")

///|
/// `NEWMAN_INGHAM_THEOREM`
pub fn newman_ingham_theorem() -> @kernel.Thm {
  newman_ingham_theorem_c.get()
}

///|
/// NEWMAN_INGHAM_THEOREM_BOUND
fn step_61() -> Unit raise {
  let t2973 = @simp.asm_simp_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_assoc(), @complexes.complex_mul_rinv(), @complexes.cx_inj(), @real.real_lt_imp_nz(), @complexes.complex_mul_lid()]))
  let t2970 = @drule.match_mp(@canal.series_complex_lmul())
  let t2967 = @term_syntax.parse_term("Cx((b : Real))")
  let t2972 = @tactics.disch_then(fn(x2971 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2969 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2964 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2965 = @tactics.mp_tac(x2964)
        fn(x2966 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2965(x2966)
        }
      })(((x2968 : @kernel.Thm) => @bool.spec(t2967, x2968))(x2969))
    })(t2970(x2971))
  })
  let t2963 = @simp.asm_rewrite_tac(@list.List([]))
  let t2962 = @tactics.disch_then(fn(x2960 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2960
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t2959 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2958 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t2957 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_cx(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (b : Real) → abs(b) == b")), @real.real_le_ldiv_eq(), @realax.real_mul_lid()]))
  let t2956 = @simp.rewrite_tac(@list.List([@equal.gsym(@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@realax.real_div()))]))
  let t2955 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_inv()]))
  let t2954 = @simp.asm_simp_tac(@list.List([@canal.series_complex_lmul()]))
  let t2953 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t2952 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_mul_assoc())]))
  let t2951 = @simp.asm_simp_tac(@list.List([@canal.analytic_on_mul(), @canal.analytic_on_const()]))
  let t2949 = @term_syntax.parse_term("(n : Num) => inv(Cx((b : Real))) * (a : (Num) -> Cart[Real, 2])(n)")
  let t2950 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => inv(Cx((b : Real))) * (f : (Cart[Real, 2]) -> Cart[Real, 2])(z)"), t2949]), newman_ingham_theorem()))
  let t2974 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t2950), t2951), t2952), t2953), t2954), t2955), t2956), t2957), t2958), t2959), t2962), t2963), t2972), t2973)
  newman_ingham_theorem_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ a : (Num) -> Cart[Real, 2], ∀ b : Real, real_of_num(0) < b && (∀ n : Num, 1 <= n → norm(a(n)) <= b) && analytic_on(f, {(z : Cart[Real, 2]) | Re(z) >= real_of_num(1)}) && (∀ z : Cart[Real, 2], Re(z) > real_of_num(1) → sums((n : Num) => a(n) / cpow(Cx(real_of_num(n)), z), f(z), from(1))) → (∀ z : Cart[Real, 2], Re(z) >= real_of_num(1) → sums((n : Num) => a(n) / cpow(Cx(real_of_num(n)), z), f(z), from(1)))"), t2974))
}

///|
let newman_ingham_theorem_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEWMAN_INGHAM_THEOREM_BOUND")

///|
/// `NEWMAN_INGHAM_THEOREM_BOUND`
pub fn newman_ingham_theorem_bound() -> @kernel.Thm {
  newman_ingham_theorem_bound_c.get()
}

///|
/// NEWMAN_INGHAM_THEOREM_STRONG
fn step_62() -> Unit raise {
  let t2978 = @meson.asm_meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (b : Real) → x <= abs(b) + real_of_num(1)"))]))
  let t2977 = @simp.asm_rewrite_tac(@list.List([]))
  let t2976 = @tactics.exists_tac(@term_syntax.parse_term("abs((b : Real)) + real_of_num(1)"))
  let t2975 = @tactics.match_mp_tac(newman_ingham_theorem_bound())
  let t2979 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t2975), t2976), t2977), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t2978)
  newman_ingham_theorem_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ a : (Num) -> Cart[Real, 2], ∀ b : Real, (∀ n : Num, 1 <= n → norm(a(n)) <= b) && analytic_on(f, {(z : Cart[Real, 2]) | Re(z) >= real_of_num(1)}) && (∀ z : Cart[Real, 2], Re(z) > real_of_num(1) → sums((n : Num) => a(n) / cpow(Cx(real_of_num(n)), z), f(z), from(1))) → (∀ z : Cart[Real, 2], Re(z) >= real_of_num(1) → sums((n : Num) => a(n) / cpow(Cx(real_of_num(n)), z), f(z), from(1)))"), t2979))
}

///|
let newman_ingham_theorem_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEWMAN_INGHAM_THEOREM_STRONG")

///|
/// `NEWMAN_INGHAM_THEOREM_STRONG`
pub fn newman_ingham_theorem_strong() -> @kernel.Thm {
  newman_ingham_theorem_strong_c.get()
}

///|
/// GENZETA_BOUND_LEMMA
fn step_63() -> Unit raise {
  let t3069 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg(), @transcendentals.real_exp_neg(), @realax.real_le_refl()]))
  let t3068 = @simp.asm_simp_tac(@list.List([@transcendentals.exp_log(), @real.real_of_num_lt(), @arith.lt_nz(), @transcendentals.real_exp_pos_lt(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) && real_of_num(0) < (z : Real) → inv(x) * (x / z) == inv(z)"))]))
  let t3067 = @simp.rewrite_tac(@list.List([@real.real_sub_rdistrib(), @transcendentals.real_exp_sub(), @realax.real_mul_lid()]))
  let t3066 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (n : Real) * (e : Real) → (i : Real) * e <= (n + i) * e - x")))
  let t3065 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_lneg()), @realarith.real_neg_sub()]))
  let t3064 = @simp.rewrite_tac(@list.List([@real.real_inv_mul(), @equal.gsym(@transcendentals.real_exp_neg())]))
  let t3063 = @simp.asm_simp_tac(@list.List([@real.real_le_inv_eq(), @realax.real_le_mul(), @transcendentals.real_exp_pos_le(), @realarith.real_sub_le(), @realarith.real_lt_imp_le()]))
  let t3062 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_lneg()), @realarith.real_neg_sub()]))
  let t3061 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @equal.gsym(@real.real_inv_neg())]))
  let t3060 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t3058 = @equal.gsym(@complexes.cx_div())
  let t3059 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), t3058, @complexes.re_cx()]))
  let t3057 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cx_sub()), @transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @complexes.complex_norm_div(), @real.real_of_num_lt(), @transcendentals.norm_cpow_real(), @arith.lt_nz()]))
  let t3054 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 <= (m : Num) → 0 < m")))
  let t3056 = @tactics.first_assum(fn(x3055 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3051 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3052 = @tactics.assume_tac(x3051)
      fn(x3053 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3052(x3053)
      }
    })(t3054(x3055))
  })
  let t3050 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= -(x : Real) && -(y : Real) <= (e : Real) → x - y <= e")))
  let t3049 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t3047 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @equal.gsym(@complexes.cx_div()), @complexes.re_cx(), @calc_int.real_abs_num()]))
  let t3046 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @complexes.complex_norm_div(), @transcendentals.norm_cpow_real()]))
  let t3045 = @tactics.subgoal_then(@term_syntax.parse_term("0 < (r : Num)"), fn(x3042 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3043 = @tactics.assume_tac(x3042)
    fn(x3044 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3043(x3044)
    }
  })
  let t3041 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t3048 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_numseg()), t3041), @tactics.strip_tac), t3045), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t3046), t3047), @tactics.all_tac])
  let t3040 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) && (a : Real) <= (b : Real) → x <= a → y <= b")))
  let t3038 = @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())
  let t3037 = @simp.rewrite_tac(@list.List([@realarith.real_sub_le()]))
  let t3036 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t3035 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (s : Real) * ((y : Real) - (x : Real)) → -(s * y) <= -(s * x)")))
  let t3034 = @simp.simp_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @equal.gsym(@transcendentals.real_exp_neg()), @transcendentals.real_exp_mono_le()]))
  let t3033 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.re_cx(), @complexes.real_cx(), @equal.gsym(@complexes.cx_div())]))
  let t3031 = @equal.gsym(@arith.lt_nz())
  let t3032 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@real.real_of_num_lt()), t3031]))), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3030 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (x : Real) && real_of_num(0) < (y : Real)"), @tactics.strip_assume_tac)
  let t3028 = @term_syntax.parse_term("(y : Real)")
  let t3029 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Real)"), t3028]))
  let t3025 = @simp.rewrite_tac(@list.List([@complexes.cx_inj()]))
  let t3026 = @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@complexes.complex_inv_eq_0(), @transcendentals.cpow_eq_0(), @complexes.complex_sub_0()])), t3025), @calc_rat.asm_real_arith_tac)
  let t3024 = @tactics.conv_tac(@complexes.complex_field)
  let t3027 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))")), t3024), t3026])
  let t3023 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && a → a && b")))
  let t3022 = @simp.rewrite_tac(@list.List([@complexes.complex_entire(), @complexes.complex_div()]))
  let t3021 = @simp.asm_rewrite_tac(@list.List([@transcendentals.cpow_n(), @transcendentals.cpow_sub(), @complexes.complex_pow_1()]))
  let t3020 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.re_cx(), @realarith.real_lt_refl()])), @tactics.all_tac])
  let t3019 = @tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"), fn(x3016 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3017 = @tactics.assume_tac(x3016)
    fn(x3018 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3017(x3018)
    }
  })
  let t3014 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_lt())]))
  let t3012 = @simp.gen_rewrite_rule(fn(x3011 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3011
  }, @list.List([@equal.gsym(@arith.lt_nz())]))
  let t3015 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3013 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3008 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3009 = @tactics.mp_tac(x3008)
      fn(x3010 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3009(x3010)
      }
    })(t3012(x3013))
  }), t3014), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3007 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < Re((z : Cart[Real, 2]))"), fn(x3004 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3005 = @tactics.assume_tac(x3004)
    fn(x3006 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3005(x3006)
    }
  })
  let t3002 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t3000 = @simp.gen_rewrite_rule(fn(x2999 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2999
  }, @list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t3003 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3001 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2996 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2997 = @tactics.mp_tac(x2996)
      fn(x2998 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2997(x2998)
      }
    })(t3000(x3001))
  }), t3002), @calc_rat.asm_real_arith_tac)])
  let t2993 = @simp.gen_rewrite_rule(fn(x2992 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2992
  }, @list.List([@complexes.in_segment_cx_gen()]))
  let t2995 = @tactics.first_assum(fn(x2994 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2990 = @tactics.mp_tac(x2989)
      fn(x2991 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2990(x2991)
      }
    })(t2993(x2994))
  })
  let t3039 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), @canal.complex_diff_tac), t2995), @tactics.strip_tac), t3003), t3007), t3015), t3019), t3020), t3021), t3022), t3023), @tactics.conj_tac), t3027), @tactics.all_tac])), t3029), @tactics.strip_tac), t3030), t3032), t3033), t3034), t3035), t3036), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3037), t3038), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2987 = @calc_rat.real_arith(@term_syntax.parse_term("(n : Real) + real_of_num(1) - real_of_num(1) == n"))
  let t2988 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t2987]))
  let t2983 = @term_syntax.parse_term("(m : Num)")
  let t2984 = @term_syntax.parse_term("(n : Num) + 1")
  let t2985 = @term_syntax.parse_term("(z : Cart[Real, 2]) => Cx(real_of_num(1)) / ((Cx(real_of_num(1)) - Cx(Re((s : Cart[Real, 2])))) * cpow(z, Cx(Re(s)) - Cx(real_of_num(1))))")
  let t2986 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => Cx(real_of_num(1)) / cpow(z, Cx(Re((s : Cart[Real, 2]))))"), t2985, t2984, t2983]), @canal.sum_integral_ubound_decreasing()))
  let t2982 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) <= (a : Real) - (x : Real) → x + y <= a")))
  let t2980 = @kernel.assume_rule(@term_syntax.parse_term("(n : Num) + 1 <= (m : Num)"))
  let t2981 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 <= (m : Num) → n <= m")))(t2980)]))
  let t3070 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2981), t2982), t2986), t2988), @tactics.ants_tac), t3039), t3040), @tactics.conj_tac), t3048), t3049), t3050), t3056), t3057), t3059), t3060), t3061), t3062), t3063), t3064), t3065), t3066), t3067), t3068), t3069)
  genzeta_bound_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], ∀ m : Num, !(n == 0) && real_of_num(1) < Re(s) && n + 1 <= m → sum(op_dot_dot(n, m), (x : Num) => norm(Cx(real_of_num(1)) / cpow(Cx(real_of_num(x)), s))) <= (real_of_num(1) / real_of_num(n) + real_of_num(1) / (Re(s) - real_of_num(1))) * exp((real_of_num(1) - Re(s)) * log(real_of_num(n)))"), t3070))
}

///|
let genzeta_bound_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GENZETA_BOUND_LEMMA")

///|
/// `GENZETA_BOUND_LEMMA`
pub fn genzeta_bound_lemma() -> @kernel.Thm {
  genzeta_bound_lemma_c.get()
}

///|
/// GENZETA_BOUND
fn step_64() -> Unit raise {
  let t3098 = @simp.asm_simp_tac(@list.List([genzeta_bound_lemma()]))
  let t3097 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t3096 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t3090 = @drule.part_match(fn(x3089 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x3089))
  }, @vectors.vsum_norm())
  let t3085 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t3084 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) + 1"))
  let t3083 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3082 = @simp.simp_tac(@list.List([@topology.sums(), @misc.from_inter_numseg(), @metric.trivial_limit_sequentially()]))
  let t3079 = @drule.match_mp(genzeta_converges())
  let t3076 = @term_syntax.parse_term("(n : Num)")
  let t3081 = @tactics.first_assum(fn(x3080 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3078 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3073 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3074 = @tactics.mp_tac(x3073)
        fn(x3075 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3074(x3075)
        }
      })(((x3077 : @kernel.Thm) => @bool.spec(t3076, x3077))(x3078))
    })(t3079(x3080))
  })
  let t3072 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => vsum(op_dot_dot((n : Num), m), (r : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(r)), (s : Cart[Real, 2])))"))
  let t3071 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_norm_ubound()))
  let t3099 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3071), t3072), t3081), t3082), @tactics.disch_tac), t3083), t3084), t3085), @tactics.disch_tac), fn(x3095 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x3094 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3092 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x3091 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x3086 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s3087 = @tactics.mp_tac(x3086)
            fn(x3088 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s3087(x3088)
            }
          })(t3090(x3091))
        })(@equal.lhand(x3092))
      })((fn(x3093 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x3093.1
      })(x3094))
    })(x3095)(x3095)
  }), t3096), t3097), t3098)
  genzeta_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], !(n == 0) && real_of_num(1) < Re(s) → norm(genzeta(n, s)) <= (real_of_num(1) / real_of_num(n) + real_of_num(1) / (Re(s) - real_of_num(1))) * exp((real_of_num(1) - Re(s)) * log(real_of_num(n)))"), t3099))
}

///|
let genzeta_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GENZETA_BOUND")

///|
/// `GENZETA_BOUND`
pub fn genzeta_bound() -> @kernel.Thm {
  genzeta_bound_c.get()
}

///|
/// NEARZETA_BOUND_SHARP
fn step_65() -> Unit raise {
  let t3151 = @simp.rewrite_tac(@list.List([@realax.real_div(), @transcendentals.real_exp_neg(), @realax.real_le_refl()]))
  let t3149 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - ((s : Real) + real_of_num(1))) * (x : Real) == -(s * x)"))
  let t3150 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) - real_of_num(1) == x")), t3149]))
  let t3148 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t3147 = @simp.asm_rewrite_tac(@list.List([@complexes.re_add(), @real.real_lt_addl(), @complexes.re_cx()]))
  let t3141 = @drule.part_match(fn(x3140 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x3140))
  }, genzeta_bound_lemma())
  let t3135 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t3136 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t3135))
  let t3134 = @simp.rewrite_tac(@list.List([@iterate.sum_lmul(), @complexes.complex_norm_mul(), @equal.gsym(@realax.real_mul_assoc())]))
  let t3133 = @simp.once_rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("(a : Cart[Real, 2]) / (b : Cart[Real, 2]) == a * (Cx(real_of_num(1)) / b)"))]))
  let t3131 = @tactics.match_mp_tac(nearzeta_bound_lemma())
  let t3130 = @simp.rewrite_tac(@list.List([]))
  let t3129 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3132 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_le_numseg()), t3129), t3130), t3131), @tactics.conj_tac), @list.List([@int.asm_arith_tac, @calc_rat.asm_real_arith_tac])), @tactics.all_tac])
  let t3128 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot((n : Num), (m : Num)), (r : Num) => norm((s : Cart[Real, 2]) * ((s - Cx(real_of_num(1))) / cpow(Cx(real_of_num(r)), s + Cx(real_of_num(1))))))"))
  let t3127 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t3126 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t3125 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t3119 = @drule.part_match(fn(x3118 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x3118))
  }, @vectors.vsum_norm())
  let t3114 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t3113 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) + 1"))
  let t3112 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3111 = @simp.simp_tac(@list.List([@topology.sums(), @misc.from_inter_numseg(), @metric.trivial_limit_sequentially()]))
  let t3108 = @drule.match_mp(nearzeta_converges())
  let t3105 = @term_syntax.parse_term("(n : Num)")
  let t3110 = @tactics.first_assum(fn(x3109 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3103 = @tactics.mp_tac(x3102)
        fn(x3104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3103(x3104)
        }
      })(((x3106 : @kernel.Thm) => @bool.spec(t3105, x3106))(x3107))
    })(t3108(x3109))
  })
  let t3101 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num) => vsum(op_dot_dot((n : Num), m), (r : Num) => ((s : Cart[Real, 2]) - Cx(real_of_num(1))) / cpow(Cx(real_of_num(r)), s) - (Cx(real_of_num(1)) / cpow(Cx(real_of_num(r)), s - Cx(real_of_num(1))) - Cx(real_of_num(1)) / cpow(Cx(real_of_num(r + 1)), s - Cx(real_of_num(1)))))"))
  let t3100 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_norm_ubound()))
  let t3152 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3100), t3101), t3110), t3111), @tactics.disch_tac), t3112), t3113), t3114), @tactics.disch_tac), fn(x3124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x3123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3121 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x3120 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x3115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s3116 = @tactics.mp_tac(x3115)
            fn(x3117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s3116(x3117)
            }
          })(t3119(x3120))
        })(@equal.lhand(x3121))
      })((fn(x3122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x3122.1
      })(x3123))
    })(x3124)(x3124)
  }), t3125), t3126), t3127), t3128), @tactics.conj_tac), t3132), t3133), t3134), t3136), fn(x3146 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x3145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3143 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x3142 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x3137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s3138 = @tactics.mp_tac(x3137)
            fn(x3139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s3138(x3139)
            }
          })(t3141(x3142))
        })(@equal.lhand(x3143))
      })((fn(x3144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x3144.1
      })(x3145))
    })(x3146)(x3146)
  }), t3147), t3148), t3150), t3151)
  nearzeta_bound_sharp_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], !(n == 0) && real_of_num(0) < Re(s) → norm(nearzeta(n, s)) <= norm(s * (s - Cx(real_of_num(1)))) * ((real_of_num(1) / real_of_num(n) + real_of_num(1) / Re(s)) / exp(Re(s) * log(real_of_num(n))))"), t3152))
}

///|
let nearzeta_bound_sharp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEARZETA_BOUND_SHARP")

///|
/// `NEARZETA_BOUND_SHARP`
pub fn nearzeta_bound_sharp() -> @kernel.Thm {
  nearzeta_bound_sharp_c.get()
}

///|
/// NEARZETA_BOUND
fn step_66() -> Unit raise {
  let t3176 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t3175 = @simp.asm_simp_tac(@list.List([@real.real_inv_1(), @equal.gsym(@realax.real_div()), @real.real_le_rdiv_eq()]))
  let t3174 = @simp.asm_simp_tac(@list.List([@real.real_le_inv2(), @realax.real_of_num_le(), @real.real_of_num_lt(), @calc_num.arith(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t3173 = @tactics.exists_tac(@term_syntax.parse_term("inv(real_of_num(1))"))
  let t3172 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t3171 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (y : Real) <= ((x : Real) + real_of_num(1)) * y) == (a <= x * y)"))]))
  let t3169 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t3170 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((y : Cart[Real, 2])) == (b : Real) → norm((x : Cart[Real, 2]) - y) <= norm(x) + b"))), t3169), @tactics.all_tac])
  let t3168 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @vectors.norm_pos_le(), @realarith.real_le_add(), @real.real_le_inv_eq(), @realarith.real_pos(), @realarith.real_lt_imp_le()]))
  let t3167 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3166 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @vectors.norm_pos_le(), @realarith.real_le_add(), @real.real_le_inv_eq(), @realarith.real_pos(), @realarith.real_lt_imp_le()]))
  let t3165 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3164 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @equal.gsym(@realax.real_mul_assoc())]))
  let t3163 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("pow((x : Real), 3) == x * (x * x)"))]))
  let t3162 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @transcendentals.real_exp_pos_le(), @realax.real_mul_lid()]))
  let t3161 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t3160 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc()]))
  let t3159 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t3156 = @drule.match_mp(nearzeta_bound_sharp())
  let t3158 = @tactics.first_assum(fn(x3157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3154 = @tactics.mp_tac(x3153)
      fn(x3155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3154(x3155)
      }
    })(t3156(x3157))
  })
  let t3177 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t3158), t3159), t3160), t3161), t3162), t3163), t3164), t3165), t3166), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t3167), t3168), @tactics.conj_tac), t3170), t3171), t3172), t3173), t3174), t3175), t3176), @calc_rat.real_arith_tac)
  nearzeta_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : Cart[Real, 2], !(n == 0) && real_of_num(0) < Re(s) → norm(nearzeta(n, s)) <= pow(norm(s) + real_of_num(1), 3) / Re(s) / exp(Re(s) * log(real_of_num(n)))"), t3177))
}

///|
let nearzeta_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEARZETA_BOUND")

///|
/// `NEARZETA_BOUND`
pub fn nearzeta_bound() -> @kernel.Thm {
  nearzeta_bound_c.get()
}

///|
/// NEARNEWMAN_EXISTS
fn step_67() -> Unit raise {
  let t3333 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @complexes.re_add()]))
  let t3332 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Cart[Real, 2]) - (z : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t3331 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p")), @prime.prime_ge_2()]))
  let t3330 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t3329 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-((a : Real) * (p : Real)) <= -((b : Real) * p)) == (b * p <= a * p)"))]))
  let t3328 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_neg()), @transcendentals.real_exp_mono_le()]))
  let t3327 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("5 <= (p : Num) → 0 < p"))]))
  let t3326 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t3325 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t3324 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @realax.real_div()]))
  let t3322 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t3321 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Cart[Real, 2]) - (z : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t3320 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realarith.real_pos(), @transcendentals.log_pos(), @realax.real_of_num_le(), @calc_num.arith(), @transcendentals.log_mono_le_imp(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("5 <= (p : Num) → 4 <= p"))]))
  let t3319 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3318 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t3317 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3315 = @equal.gsym(@transcendentals.log_pow())
  let t3316 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((l : Real) <= real_of_num(1) / real_of_num(2) * (x : Real)) == (real_of_num(2) * l <= x)")), t3315, @real.real_of_num_lt(), @calc_num.arith()]))
  let t3314 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) / real_of_num(2) * log(real_of_num(4))"))
  let t3313 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t3312 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()]))
  let t3310 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)"))
  let t3311 = @tactics.subst1_tac(@equal.sym(@drule.match_mp(@transcendentals.exp_log())(t3310)))
  let t3309 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("5 <= (p : Num) → 0 < p"))]))
  let t3308 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t3307 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("real_of_num(2) <= norm((a : Cart[Real, 2])) && norm((b : Cart[Real, 2])) == real_of_num(1) → norm(a) * inv(real_of_num(2)) <= norm(a - b)")))
  let t3306 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @prime.prime_imp_nz(), @complexes.complex_vec_0()]))
  let t3305 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (x : Real) * inv(real_of_num(2))) == (real_of_num(0) < x)")), @complexes.complex_norm_nz()]))
  let t3304 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3303 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul())]))
  let t3302 = @simp.gen_rewrite_tac(fn(x3301 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3295 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3296 = @equal.rand_conv(x3295)
      fn(x3297 : @kernel.Term) -> @kernel.Thm raise {
        s3296(x3297)
      }
    })((fn(x3298 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3299 = @equal.rand_conv(x3298)
      fn(x3300 : @kernel.Term) -> @kernel.Thm raise {
        s3299(x3300)
      }
    })(x3301))
  }, @list.List([@equal.gsym(@real.real_inv_inv())]))
  let t3294 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t3293 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t3292 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t3291 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t3290 = @simp.once_rewrite_tac(@list.List([@complexes.complex_norm_div()]))
  let t3289 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t3323 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.cpow_add(), @complexes.complex_div(), @complexes.complex_mul_assoc(), @complexes.complex_inv_mul()])), t3289), t3290), t3291), t3292), t3293), t3294), t3302), t3303), t3304), t3305), t3306), t3307), t3308), t3309), t3311), t3312), t3313), t3314), t3316), t3317), t3318), t3319), t3320), t3321), t3322), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3288 = @tactics.exists_tac(@term_syntax.parse_term("clog(Cx(real_of_num((p : Num)))) / cpow(Cx(real_of_num(p)), (z : Cart[Real, 2]) + z)"))
  let t3287 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ y : Cart[Real, 2], norm((x : Cart[Real, _])) <= real_of_num(2) * norm(y) && norm(y) <= (a : Real) → norm(x) <= real_of_num(2) * a")))
  let t3285 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t3284 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Cart[Real, 2]) - (z : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t3283 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p")), @prime.prime_ge_2()]))
  let t3282 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t3281 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-((a : Real) * (p : Real)) <= -((b : Real) * p)) == (b * p <= a * p)"))]))
  let t3280 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_neg()), @transcendentals.real_exp_mono_le()]))
  let t3279 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @prime.prime_imp_nz(), @arith.lt_nz()]))
  let t3277 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t3276 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Cart[Real, 2]) - (z : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t3275 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3278 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x3272 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3273 = @equal.rand_conv(x3272)
    fn(x3274 : @kernel.Term) -> @kernel.Thm raise {
      s3273(x3274)
    }
  }, @list.List([@equal.gsym(@real.real_inv_inv())])), t3275), t3276), t3277), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3271 = @simp.asm_simp_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_lt_imp_le(), @transcendentals.real_exp_pos_le()]))
  let t3270 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3269 = @simp.rewrite_tac(@list.List([@real.real_inv_mul()]))
  let t3268 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le2()), @vectors.asm_norm_arith_tac), @tactics.all_tac])
  let t3267 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @real.real_pow_le(), @real.real_le_inv_eq(), @realax.real_le_mul(), @realarith.real_lt_imp_le(), @realarith.real_pos(), @realarith.real_le_add(), @equal.gsym(@real.real_inv_mul()), @transcendentals.real_exp_pos_le()]))
  let t3266 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3265 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t3264 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * (x : Real) * (y : Real) == x * (real_of_num(2) * y)"))]))
  let t3263 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t3261 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t3260 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Cart[Real, 2]) - (z : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im()))
  let t3262 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@prime.prime_imp_nz()])), t3260), t3261), @calc_rat.asm_real_arith_tac), @tactics.disch_tac])
  let t3259 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool) → (c : Bool)) → (a → b) → c")))
  let t3258 = @simp.asm_simp_tac(@list.List([@prime.prime_imp_nz()]))
  let t3252 = @drule.part_match(fn(x3251 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x3251))
  }, nearzeta_bound())
  let t3247 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t3246 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t3244 = @term_syntax.parse_term("(x : Real) * ((a : Real) * (b : Real)) == a * (x * b)")
  let t3245 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t3244)]))
  let t3243 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_1(), @realax.real_div()]))
  let t3242 = @simp.once_rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_div()]))
  let t3241 = @simp.asm_simp_tac(@list.List([@prime.prime_imp_nz(), @equal.gsym(@complexes.complex_div())]))
  let t3240 = @simp.asm_simp_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_mul(), @complexes.complex_mul_assoc()]))
  let t3286 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.cpow_add(), @complexes.cx_add(), @transcendentals.cpow_n(), @complexes.cx_inj(), @realax.real_of_num_eq()])), t3240), t3241), t3242), t3243), t3245), t3246), t3247), fn(x3257 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x3256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3254 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x3253 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x3248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s3249 = @tactics.mp_tac(x3248)
            fn(x3250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s3249(x3250)
            }
          })(t3252(x3253))
        })(@equal.lhand(x3254))
      })((fn(x3255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x3255.1
      })(x3256))
    })(x3257)(x3257)
  }), t3258), t3259), @tactics.conj_tac), t3262), t3263), t3264), t3265), t3266), t3267), @tactics.conj_tac), t3268), t3269), t3270), t3271), @tactics.conj_tac), t3278), t3279), t3280), t3281), t3282), t3283), t3284), t3285), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3239 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((x : Cart[Real, 2])) <= (a : Real) && norm((y : Cart[Real, 2])) <= (b : Real) → norm(x - y) <= a + b")))
  let t3238 = @simp.gen_rewrite_tac(fn(x3235 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3236 = @equal.rand_conv(x3235)
    fn(x3237 : @kernel.Term) -> @kernel.Thm raise {
      s3236(x3237)
    }
  }, @list.List([@real.real_add_rdistrib()]))
  let t3234 = @simp.simp_tac(@list.List([@real.real_le_rmul(), @vectors.norm_pos_le(), @real.real_abs_le()]))
  let t3233 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (a : Real) * (b : Real) && a * b <= abs(a) * b → x <= abs(a) * b")))
  let t3232 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_cx()]))
  let t3231 = @simp.rewrite_tac(@list.List([@topology.in_ball(), @real.real_lt_min(), @vectors.dist()]))
  let t3230 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3226 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 <= p")), @prime.prime_ge_2()]))
  let t3225 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_le()]))
  let t3227 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_div()), t3225), t3226)
  let t3224 = @tactics.match_mp_tac(@real.real_pow_le())
  let t3228 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(0) <= real_of_num(2) * x + real_of_num(2)"))), t3224), @vectors.norm_arith_tac), t3227])
  let t3223 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t3221 = @equal.gsym(@complexes.cx_mul())
  let t3222 = @equal.gsym(@complexes.cx_div())
  let t3229 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@transcendentals.cpow_real_real(), @complexes.real_cx(), @complexes.re_cx(), @equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @arith.lt_nz(), @prime.prime_imp_nz(), t3222, t3221])), @tactics.disch_tac), t3223), @tactics.conj_tac), t3228), @tactics.all_tac])
  let t3220 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t3218 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t3217 = @tactics.match_mp_tac(complex_derivative_zeta_converges())
  let t3216 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t3215 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_mul_lneg())]))
  let t3214 = @tactics.match_mp_tac(@topology.series_neg())
  let t3213 = @simp.gen_rewrite_tac(fn(x3212 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3208 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x3202 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3203 = @equal.rator_conv(x3202)
        fn(x3204 : @kernel.Term) -> @kernel.Thm raise {
          s3203(x3204)
        }
      })((fn(x3205 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3206 = @equal.land_conv(x3205)
        fn(x3207 : @kernel.Term) -> @kernel.Thm raise {
          s3206(x3207)
        }
      })(x3208))
    })((fn(x3209 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3210 = @equal.abs_conv(x3209)
      fn(x3211 : @kernel.Term) -> @kernel.Thm raise {
        s3210(x3211)
      }
    })(x3212))
  }, @list.List([@equal.gsym(@complexes.complex_neg_neg())]))
  let t3201 = @tactics.exists_tac(@term_syntax.parse_term("-complex_derivative(zeta, Cx(real_of_num(1) + (Re((s : Cart[Real, 2])) - real_of_num(1) / real_of_num(2)) / real_of_num(4)))"))
  let t3200 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t3199 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.cx_div()), @complexes.real_cx(), @complexes.re_cx(), @transcendentals.log_pos(), @realax.real_of_num_le(), @real.real_le_div(), @transcendentals.real_exp_pos_le()]))
  let t3198 = @simp.simp_tac(@list.List([@misc.in_from(), @sets.subset(), @sets.in_elim_thm(), @equal.gsym(@transcendentals.cx_log()), @transcendentals.cpow_real_real(), @complexes.re_cx(), @complexes.real_cx(), @real.real_of_num_lt(), @arith.le_1(), @prime.prime_imp_nz()]))
  let t3197 = @tactics.exists_tac(@term_syntax.parse_term("from(1)"))
  let t3196 = @tactics.match_mp_tac(@canal.summable_subset_complex())
  let t3219 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.summable_complex_lmul()), t3196), t3197), t3198), t3199), t3200), t3201), t3213), t3214), t3215), t3216), t3217), t3218), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3195 = @tactics.exists_tac(@term_syntax.parse_term("5"))
  let t3194 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) => Cx(real_of_num(2) * pow(norm((s : Cart[Real, 2])) + real_of_num(2), 3) + real_of_num(2)) * (clog(Cx(real_of_num(p))) / cpow(Cx(real_of_num(p)), Cx(real_of_num(1) + (Re(s) - real_of_num(1) / real_of_num(2)) / real_of_num(4))))"))
  let t3193 = @tactics.exists_tac(@term_syntax.parse_term("min(real_of_num(1) / real_of_num(2), (Re((s : Cart[Real, 2])) - real_of_num(1) / real_of_num(2)) / real_of_num(2))"))
  let t3192 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : Cart[Real, 2])"))
  let t3190 = @simp.asm_simp_tac(@list.List([@complexes.complex_entire(), @transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @complexes.complex_sub_0(), @prime.prime_imp_nz(), @prime.prime_ge_2(), cpow_num_ne_1(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) / real_of_num(2) < (x : Real) → real_of_num(0) < x"))]))
  let t3185 = @drule.match_mp(@prime.prime_imp_nz())
  let t3187 = @tactics.first_assum(fn(x3186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3182 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3183 = @tactics.mp_tac(x3182)
      fn(x3184 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3183(x3184)
      }
    })(t3185(x3186))
  })
  let t3181 = @tactics.match_mp_tac(complex_differentiable_nearzeta())
  let t3188 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.eta_ax()])), t3181), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t3187), @int.arith_tac)])
  let t3189 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.complex_differentiable_mul_at()), @tactics.conj_tac), t3188), @tactics.all_tac])
  let t3180 = @tactics.match_mp_tac(@canal.complex_differentiable_sub())
  let t3191 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3180), @tactics.conj_tac), t3189), @canal.complex_differentiable_tac), t3190), @tactics.all_tac])
  let t3179 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_gt()]))
  let t3178 = @simp.rewrite_tac(@list.List([@canal.open_halfspace_re_gt()]))
  let t3334 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.series_differentiable_comparison_complex()), t3178), t3179), @tactics.conj_tac), t3191), t3192), @tactics.strip_tac), t3193), t3194), t3195), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.conj_tac), t3219), @tactics.conj_tac), t3220), t3229), t3230), t3231), @tactics.strip_tac), t3232), t3233), t3234), t3238), t3239), @tactics.conj_tac), t3286), t3287), t3288), @tactics.conj_tac), t3323), t3324), t3325), t3326), t3327), t3328), t3329), t3330), t3331), t3332), t3333), @calc_rat.asm_real_arith_tac)
  nearnewman_exists_c.set(@tactics.prove(@term_syntax.parse_term("∃ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : Cart[Real, 2], IN(s, {(s : Cart[Real, 2]) | Re(s) > real_of_num(1) / real_of_num(2)}) → sums((p : Num) => clog(Cx(real_of_num(p))) / Cx(real_of_num(p)) * nearzeta(p, s) - clog(Cx(real_of_num(p))) / (cpow(Cx(real_of_num(p)), s) * (cpow(Cx(real_of_num(p)), s) - Cx(real_of_num(1)))), f(s), {(p : Num) | prime(p)}) && complex_differentiable(f, at(s))"), t3334))
}

///|
let nearnewman_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEARNEWMAN_EXISTS")

///|
/// `NEARNEWMAN_EXISTS`
pub fn nearnewman_exists() -> @kernel.Thm {
  nearnewman_exists_c.get()
}

///|
/// nearnewman
fn step_68() -> Unit raise {
  nearnewman_c.set(@nums.new_specification(@list.List(["nearnewman"]))(nearnewman_exists()))
}

///|
let nearnewman_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nearnewman")

///|
/// `nearnewman`
pub fn nearnewman() -> @kernel.Thm {
  nearnewman_c.get()
}

///|
let converges_nearnewman_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVERGES_NEARNEWMAN")

///|
/// `CONVERGES_NEARNEWMAN`
pub fn converges_nearnewman() -> @kernel.Thm {
  converges_nearnewman_c.get()
}

///|
let complex_differentiable_nearnewman_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_NEARNEWMAN")

///|
/// `COMPLEX_DIFFERENTIABLE_NEARNEWMAN`
pub fn complex_differentiable_nearnewman() -> @kernel.Thm {
  complex_differentiable_nearnewman_c.get()
}

///|
/// CONVERGES_NEARNEWMAN, COMPLEX_DIFFERENTIABLE_NEARNEWMAN
fn step_69() -> Unit raise {
  match @bool.conjuncts_rule(@simp.rewrite_rule(@list.List([@theorems.forall_and_thm(), @sets.in_elim_thm(), @realax.real_gt(), @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) && (c : Bool)) == ((a → b) && (a → c))"))]))(nearnewman())) {
    More(converges_nearnewman, tail=More(complex_differentiable_nearnewman, tail=Empty)) => {
      converges_nearnewman_c.set(converges_nearnewman)
      complex_differentiable_nearnewman_c.set(complex_differentiable_nearnewman)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:2990:4")
  }
}

///|
/// newman
fn step_70() -> Unit raise {
  newman_c.set(@pair.new_definition(@term_syntax.parse_term("(newman : (Cart[Real, 2]) -> Cart[Real, 2])((s : Cart[Real, 2])) == (nearnewman(s) - complex_derivative(zeta, s) / zeta(s)) / (s - Cx(real_of_num(1)))")))
}

///|
let newman_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("newman")

///|
/// `newman`
pub fn newman() -> @kernel.Thm {
  newman_c.get()
}

///|
/// COMPLEX_DERIVATIVE_ZETA
fn step_71() -> Unit raise {
  let t3368 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @equal.gsym(@canal.complex_differentiable()), @realax.real_gt()]))
  let t3367 = @simp.simp_tac(@list.List([@calc_num.arith(), @canal.holomorphic_on_open(), @canal.open_halfspace_re_gt()]))
  let t3366 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("1"), holomorphic_nearzeta()))
  let t3365 = @simp.rewrite_tac(@list.List([@canal.has_complex_derivative_differentiable(), @class.eta_ax()]))
  let t3364 = @simp.rewrite_tac(@list.List([@canal.has_complex_derivative_const()]))
  let t3363 = @tactics.match_mp_tac(@canal.has_complex_derivative_add())
  let t3362 = @simp.gen_rewrite_tac(fn(x3359 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3360 = @equal.land_conv(x3359)
    fn(x3361 : @kernel.Term) -> @kernel.Thm raise {
      s3360(x3361)
    }
  }, @list.List([@equal.gsym(@complexes.complex_add_rid())]))
  let t3357 = @tactics.conv_tac(@complexes.complex_field)
  let t3358 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@canal.complex_diff_tac, @tactics.repeat_tac(@tactics.pop_assum(fn(x3354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3355 = @tactics.mp_tac(x3354)
    fn(x3356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3355(x3356)
    }
  }))), t3357)])
  let t3353 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_imp()), @tactics.ap_thm_tac), @tactics.ap_term_tac), @complexes.simple_complex_arith_tac)])
  let t3352 = @simp.rewrite_tac(@list.List([]))
  let t3347 = @term_syntax.parse_term("(s : Cart[Real, 2])")
  let t3348 = @term_syntax.parse_term("-Cx(real_of_num(1)) / pow((s : Cart[Real, 2]) - Cx(real_of_num(1)), 2)")
  let t3349 = @term_syntax.parse_term("(z : Cart[Real, 2]) => inv(z - Cx(real_of_num(1)))")
  let t3350 = @term_syntax.parse_term("complex_derivative(nearzeta(1), (s : Cart[Real, 2]))")
  let t3351 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => nearzeta(1, z) + Cx(real_of_num(1))"), t3350, t3349, t3348, t3347]), @canal.has_complex_derivative_mul_at()))
  let t3345 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl()]))
  let t3346 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), @class.cond_cases_tac), t3345), @tactics.all_tac])
  let t3344 = @simp.asm_simp_tac(@list.List([@vectors.dist_pos_lt()]))
  let t3343 = @tactics.exists_tac(@term_syntax.parse_term("distance((Cx(real_of_num(1)), (s : Cart[Real, 2])))"))
  let t3342 = @tactics.exists_tac(@term_syntax.parse_term("(s : Cart[Real, 2]) => (nearzeta(1, s) + Cx(real_of_num(1))) * inv(s - Cx(real_of_num(1)))"))
  let t3341 = @tactics.match_mp_tac(@canal.has_complex_derivative_transform_at())
  let t3340 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_1(), @complexes.complex_div(), @complexes.complex_mul_lid(), @complexes.complex_inv_1()]))
  let t3337 = @bool.gen_all(genzeta())
  let t3338 = @simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(t3337)
  let t3336 = @bool.gen_all(zeta())
  let t3339 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm()), @class.eta_ax()]))(t3336), t3338]))
  let t3335 = @tactics.match_mp_tac(@canal.has_complex_derivative_derivative())
  let t3369 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3335), t3339), t3340), t3341), t3342), t3343), t3344), @tactics.conj_tac), t3346), t3351), t3352), @tactics.ants_tac), t3353), @tactics.conj_tac), t3358), t3362), t3363), t3364), t3365), t3366), t3367), t3368)
  complex_derivative_zeta_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(0) < Re(s) && !(s == Cx(real_of_num(1))) → complex_derivative(zeta, s) == complex_derivative(nearzeta(1), s) / (s - Cx(real_of_num(1))) - (nearzeta(1, s) + Cx(real_of_num(1))) / pow(s - Cx(real_of_num(1)), 2)"), t3369))
}

///|
let complex_derivative_zeta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_ZETA")

///|
/// `COMPLEX_DERIVATIVE_ZETA`
pub fn complex_derivative_zeta() -> @kernel.Thm {
  complex_derivative_zeta_c.get()
}

///|
/// ANALYTIC_ZETA_DERIVDIFF
fn step_72() -> Unit raise {
  let t3436 = @tactics.conv_tac(@complexes.complex_field)
  let t3435 = @tactics.undisch_tac(@term_syntax.parse_term("!((w : Cart[Real, 2]) == Cx(real_of_num(1)))"))
  let t3434 = @simp.asm_rewrite_tac(@list.List([]))
  let t3430 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t3433 = @tactics.first_x_assum(fn(x3432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3427 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3428 = @tactics.mp_tac(x3427)
      fn(x3429 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3428(x3429)
      }
    })(((x3431 : @kernel.Thm) => @bool.spec(t3430, x3431))(x3432))
  })
  let t3426 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_1(), @complexes.complex_div_1()]))
  let t3425 = @simp.asm_rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@equal.gsym(@class.fun_eq_thm())]))(zeta()), genzeta()]))
  let t3424 = @simp.asm_simp_tac(@list.List([complex_derivative_zeta()]))
  let t3422 = @simp.rewrite_tac(@list.List([@complexes.re_sub()]))
  let t3423 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2]) - (w : Cart[Real, 2])"), @complexes.complex_norm_ge_re_im())), t3422), @vectors.asm_norm_arith_tac), @tactics.all_tac])
  let t3421 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < Re((w : Cart[Real, 2]))"), fn(x3418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3419 = @tactics.assume_tac(x3418)
    fn(x3420 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3419(x3420)
    }
  })
  let t3417 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t3416 = @simp.rewrite_tac(@list.List([@topology.ball_min_inter(), @sets.in_inter(), @topology.in_ball(), @real.real_lt_min()]))
  let t3415 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min(), @real.real_lt_01()]))
  let t3414 = @tactics.exists_tac(@term_syntax.parse_term("min((e : Real), real_of_num(1))"))
  let t3413 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e : Real)"))(@tactics.strip_assume_tac))
  let t3412 = @simp.rewrite_tac(@list.List([]))
  let t3410 = @tactics.disch_then(@tactics.match_mp_tac)
  let t3409 = @simp.rewrite_tac(@list.List([@canal.complex_differentiable(), @sets.in_elim_thm()]))
  let t3408 = @simp.simp_tac(@list.List([@calc_num.arith(), @canal.holomorphic_on_open(), @canal.open_halfspace_re_gt()]))
  let t3407 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("1"), holomorphic_nearzeta()))
  let t3406 = @simp.rewrite_tac(@list.List([@canal.complex_differentiable_const(), @class.eta_ax()]))
  let t3405 = @tactics.match_mp_tac(@canal.complex_differentiable_add())
  let t3404 = @tactics.match_mp_tac(@canal.complex_differentiable_imp_continuous_at())
  let t3411 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3404), t3405), t3406), t3407), t3408), t3409), t3410), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3401 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t3402 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3403 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => nearzeta(1, z) + Cx(real_of_num(1))"), t3402, t3401]), @topology.continuous_at_avoid()))
  let t3398 = @drule.match_mp(nearzeta_nonzero())
  let t3400 = @tactics.first_assum(fn(x3399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3396 = @tactics.assume_tac(x3395)
      fn(x3397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3396(x3397)
      }
    })(t3398(x3399))
  })
  let t3394 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_ge()]))
  let t3437 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t3394), @tactics.disch_tac), t3400), t3403), @tactics.ants_tac), t3411), t3412), t3413), t3414), t3415), t3416), t3417), @tactics.strip_tac), t3421), t3423), t3424), t3425), t3426), t3433), t3434), t3435), t3436)
  let t3393 = @simp.simp_tac(@list.List([@class.eta_ax(), @canal.analytic_on_open(), @canal.open_halfspace_re_gt(), holomorphic_nearzeta(), @arith.le_refl()]))
  let t3392 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t3391 = @tactics.exists_tac(@term_syntax.parse_term("{(s : Cart[Real, 2]) | Re(s) > real_of_num(0)}"))
  let t3390 = @tactics.match_mp_tac(@canal.analytic_on_subset())
  let t3385 = @simp.rewrite_tac(@list.List([@canal.analytic_on_const(), @class.eta_ax()]))
  let t3386 = @tactics.then_tac(@tactics.match_mp_tac(@canal.analytic_on_add()), t3385)
  let t3384 = @tactics.match_mp_tac(@cauchy.analytic_complex_derivative())
  let t3383 = @simp.simp_tac(@list.List([@class.eta_ax(), @canal.analytic_on_sub(), @canal.analytic_on_const(), @canal.analytic_on_id()]))
  let t3387 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.analytic_on_mul()), t3383), t3384), t3386])
  let t3388 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.analytic_on_sub()), @tactics.conj_tac), t3387)
  let t3382 = @simp.rewrite_tac(@list.List([@canal.analytic_on_const(), @class.eta_ax()]))
  let t3381 = @tactics.match_mp_tac(@canal.analytic_on_add())
  let t3380 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @realax.real_ge(), nearzeta_nonzero()]))
  let t3379 = @tactics.match_mp_tac(@canal.analytic_on_inv())
  let t3378 = @simp.rewrite_tac(@list.List([@canal.analytic_on_const()]))
  let t3389 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.analytic_on_sub()), t3378), t3379), t3380), t3381), t3382), t3388])
  let t3438 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.analytic_on_mul()), @tactics.conj_tac), t3389), t3390), t3391), t3392), t3393), @calc_rat.real_arith_tac), t3437])
  let t3377 = @simp.rewrite_tac(@list.List([@complexes.complex_add_lid(), @complexes.complex_inv_1(), @complexes.complex_sub_refl(), @complexes.complex_mul_lzero()]))
  let t3376 = @simp.simp_tac(@list.List([nearzeta_1(), @calc_num.arith()]))
  let t3374 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t3375 = @tactics.map_every(fn(x3371 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3372 = @tactics.exists_tac(x3371)
    fn(x3373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3372(x3373)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (Cx(real_of_num(1)) - inv(nearzeta(1, z) + Cx(real_of_num(1)))) * ((z - Cx(real_of_num(1))) * complex_derivative(nearzeta(1), z) - (nearzeta(1, z) + Cx(real_of_num(1))))"), t3374]))
  let t3370 = @tactics.match_mp_tac(@cauchy.pole_theorem_analytic_0())
  let t3439 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("complex_derivative((z : Cart[Real, 2]) => (Cx(real_of_num(1)) - inv(nearzeta(1, z) + Cx(real_of_num(1)))) * ((z - Cx(real_of_num(1))) * complex_derivative(nearzeta(1), z) - (nearzeta(1, z) + Cx(real_of_num(1)))), Cx(real_of_num(1)))")), t3370), t3375), t3376), t3377), @tactics.conj_tac), t3438)
  analytic_zeta_derivdiff_c.set(@tactics.prove(@term_syntax.parse_term("∃ a : Cart[Real, 2], analytic_on((z : Cart[Real, 2]) => if z == Cx(real_of_num(1)) { a } else { (z - Cx(real_of_num(1))) * complex_derivative(zeta, z) - complex_derivative(zeta, z) / zeta(z) }, {(s : Cart[Real, 2]) | Re(s) >= real_of_num(1)})"), t3439))
}

///|
let analytic_zeta_derivdiff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_ZETA_DERIVDIFF")

///|
/// `ANALYTIC_ZETA_DERIVDIFF`
pub fn analytic_zeta_derivdiff() -> @kernel.Thm {
  analytic_zeta_derivdiff_c.get()
}

///|
/// ANALYTIC_NEWMAN_VARIANT
fn step_73() -> Unit raise {
  let t3478 = @tactics.conv_tac(@complexes.complex_field)
  let t3477 = @tactics.undisch_tac(@term_syntax.parse_term("!((w : Cart[Real, 2]) == Cx(real_of_num(1)))"))
  let t3476 = @simp.asm_rewrite_tac(@list.List([genzeta(), @transcendentals.cpow_1(), @complexes.complex_div_1()]))
  let t3475 = @simp.gen_rewrite_tac(fn(x3474 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    ((x3470 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(4, fn(x3467 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3468 = @equal.rand_conv(x3467)
      fn(x3469 : @kernel.Term) -> @kernel.Thm raise {
        s3468(x3469)
      }
    }, x3470))((fn(x3471 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3472 = @equal.once_depth_conv(x3471)
      fn(x3473 : @kernel.Term) -> @kernel.Thm raise {
        s3472(x3473)
      }
    })(x3474))
  }, @list.List([zeta()]))
  let t3466 = @simp.rewrite_tac(@list.List([newman()]))
  let t3465 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t3464 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t3463 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t3479 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3463), t3464), t3465), @tactics.strip_tac), t3466), t3475), t3476), t3477), t3478)
  let t3460 = @simp.simp_tac(@list.List([@class.eta_ax(), @canal.analytic_on_open(), @canal.open_halfspace_re_gt(), holomorphic_nearzeta(), @arith.le_refl()]))
  let t3459 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t3458 = @tactics.exists_tac(@term_syntax.parse_term("{(s : Cart[Real, 2]) | Re(s) > real_of_num(0)}"))
  let t3457 = @tactics.match_mp_tac(@canal.analytic_on_subset())
  let t3456 = @simp.rewrite_tac(@list.List([@canal.analytic_on_const()]))
  let t3455 = @tactics.match_mp_tac(@canal.analytic_on_add())
  let t3454 = @simp.rewrite_tac(@list.List([@canal.analytic_on_const()]))
  let t3453 = @tactics.match_mp_tac(@canal.analytic_on_mul())
  let t3452 = @simp.asm_rewrite_tac(@list.List([]))
  let t3461 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.analytic_on_add()), t3452), t3453), t3454), t3455), t3456), t3457), t3458), t3459), t3460), @calc_rat.real_arith_tac)
  let t3451 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @canal.analytic_on_open(), @canal.open_halfspace_re_gt(), @canal.holomorphic_on_open(), @realax.real_gt(), @equal.gsym(@canal.complex_differentiable()), complex_differentiable_nearnewman()]))
  let t3450 = @tactics.exists_tac(@term_syntax.parse_term("{(s : Cart[Real, 2]) | Re(s) > real_of_num(1) / real_of_num(2)}"))
  let t3462 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.analytic_on_subset()), t3450), t3451), @calc_rat.real_arith_tac), t3461])
  let t3480 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.analytic_on_add()), @tactics.conj_tac), t3462), t3479, @complexes.simple_complex_arith_tac])
  let t3449 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3448 = @simp.simp_tac(@list.List([nearzeta_1(), @arith.le_refl()]))
  let t3446 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t3447 = @tactics.map_every(fn(x3443 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3444 = @tactics.exists_tac(x3443)
    fn(x3445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3444(x3445)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => nearnewman(z) + ((if z == Cx(real_of_num(1)) { (c : Cart[Real, 2]) } else { (z - Cx(real_of_num(1))) * complex_derivative(zeta, z) - complex_derivative(zeta, z) / zeta(z) }) + -(c + nearnewman(Cx(real_of_num(1)))) * (nearzeta(1, z) + Cx(real_of_num(1))))"), t3446]))
  let t3442 = @tactics.match_mp_tac(@cauchy.pole_theorem_analytic_0())
  let t3441 = @tactics.exists_tac(@term_syntax.parse_term("complex_derivative((z : Cart[Real, 2]) => nearnewman(z) + ((if z == Cx(real_of_num(1)) { (c : Cart[Real, 2]) } else { (z - Cx(real_of_num(1))) * complex_derivative(zeta, z) - complex_derivative(zeta, z) / zeta(z) }) + -(c + nearnewman(Cx(real_of_num(1)))) * (nearzeta(1, z) + Cx(real_of_num(1)))), Cx(real_of_num(1)))"))
  let t3440 = @tactics.exists_tac(@term_syntax.parse_term("-((c : Cart[Real, 2]) + nearnewman(Cx(real_of_num(1))))"))
  let t3481 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_choose_tac(@term_syntax.parse_term("(c : Cart[Real, 2])"), analytic_zeta_derivdiff()), t3440), t3441), t3442), t3447), t3448), t3449), t3480)
  analytic_newman_variant_c.set(@tactics.prove(@term_syntax.parse_term("∃ c : Cart[Real, 2], ∃ a : Cart[Real, 2], analytic_on((z : Cart[Real, 2]) => if z == Cx(real_of_num(1)) { a } else { newman(z) + (complex_derivative(zeta, z) + c * zeta(z)) }, {(s : Cart[Real, 2]) | Re(s) >= real_of_num(1)})"), t3481))
}

///|
let analytic_newman_variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANALYTIC_NEWMAN_VARIANT")

///|
/// `ANALYTIC_NEWMAN_VARIANT`
pub fn analytic_newman_variant() -> @kernel.Thm {
  analytic_newman_variant_c.get()
}

///|
/// CONVERGES_NEWMAN_PRIME
fn step_74() -> Unit raise {
  let t3522 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_eq_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @prime.prime_imp_nz()]))
  let t3521 = @simp.asm_simp_tac(@list.List([cpow_num_ne_1(), @prime.prime_ge_2(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (x : Real) → real_of_num(0) < x"))]))
  let t3520 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("!((ps : Cart[Real, 2]) == Cx(real_of_num(1))) && !(ps == Cx(real_of_num(0))) && !((p : Cart[Real, 2]) == Cx(real_of_num(0))) → inv(ps - Cx(real_of_num(1))) - inv(ps * (ps - Cx(real_of_num(1)))) == inv(p * (ps / p))")))
  let t3519 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_1()]))
  let t3518 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_sub(), @transcendentals.cpow_n(), @complexes.cx_inj(), @realax.real_of_num_eq(), @prime.prime_imp_nz()]))
  let t3517 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid(), @equal.gsym(@complexes.complex_inv_mul())]))
  let t3515 = @equal.gsym(@complexes.complex_sub_ldistrib())
  let t3516 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc()), t3515]))
  let t3514 = @simp.asm_simp_tac(@list.List([@transcendentals.cx_log(), @real.real_of_num_lt(), @arith.lt_nz(), @prime.prime_imp_nz(), @complexes.complex_div()]))
  let t3513 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(c : Cart[Real, 2]) - (b : Cart[Real, 2]) == (a : Cart[Real, 2]) * (m : Cart[Real, 2]) → a * (n : Cart[Real, 2]) - b + c == a * (n + m)")))
  let t3512 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3511 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t3510 = @tactics.match_mp_tac(@topology.sums_iff())
  let t3509 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t3508 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub())]))
  let t3505 = @drule.match_mp(@topology.series_add())
  let t3507 = @tactics.disch_then(fn(x3506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3502 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3503 = @tactics.mp_tac(x3502)
      fn(x3504 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3503(x3504)
      }
    })(t3505(x3506))
  })
  let t3501 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t3498 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (x : Real) → real_of_num(1) / real_of_num(2) < x")))
  let t3496 = @drule.match_mp(converges_nearnewman())
  let t3500 = @tactics.first_assum(fn(x3499 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3493 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3494 = @tactics.mp_tac(x3493)
        fn(x3495 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3494(x3495)
        }
      })(t3496(x3497))
    })(t3498(x3499))
  })
  let t3490 = @drule.match_mp(converges_logzeta_p_p())
  let t3492 = @tactics.first_assum(fn(x3491 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3488 = @tactics.mp_tac(x3487)
      fn(x3489 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3488(x3489)
      }
    })(t3490(x3491))
  })
  let t3486 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t3485 = @tactics.match_mp_tac(@canal.series_complex_rmul())
  let t3484 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_assoc()]))
  let t3483 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx(), @realarith.real_lt_refl(), genzeta(), newman()]))
  let t3482 = @class.asm_cases_tac(@term_syntax.parse_term("(s : Cart[Real, 2]) == Cx(real_of_num(1))"))
  let t3523 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(s : Cart[Real, 2])")), t3482), t3483), @tactics.disch_tac), t3484), t3485), t3486), t3492), t3500), t3501), t3507), t3508), t3509), t3510), t3511), t3512), @tactics.disch_tac), t3513), t3514), t3516), @tactics.ap_term_tac), t3517), t3518), t3519), t3520), t3521), t3522)
  converges_newman_prime_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → sums((p : Num) => clog(Cx(real_of_num(p))) / Cx(real_of_num(p)) * genzeta(p, s), newman(s), {(p : Num) | prime(p)})"), t3523))
}

///|
let converges_newman_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONVERGES_NEWMAN_PRIME")

///|
/// `CONVERGES_NEWMAN_PRIME`
pub fn converges_newman_prime() -> @kernel.Thm {
  converges_newman_prime_c.get()
}

///|
/// GENZETA_OFFSET
fn step_75() -> Unit raise {
  let t3536 = @simp.asm_simp_tac(@list.List([genzeta_converges()]))
  let t3535 = @tactics.match_mp_tac(@topology.sums_offset())
  let t3533 = @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == n + 1 - 1"))])
  let t3531 = @term_syntax.parse_term("(n : Num) => sums((f : (Num) -> Cart[Real, 2]), (a : Cart[Real, 2]) - vsum(op_dot_dot((m : Num), n), (s : (Num) -> Cart[Real, 2])), (k : (Num) -> Bool))")
  let t3534 = @simp.gen_rewrite_tac((x3532 : (@kernel.Term) -> @kernel.Thm raise) => @equal.pat_conv(t3531, x3532), t3533)
  let t3530 = @simp.asm_simp_tac(@list.List([genzeta_converges()]))
  let t3528 = @term_syntax.parse_term("from((n : Num) + 1)")
  let t3529 = @tactics.map_every(fn(x3525 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3526 = @tactics.exists_tac(x3525)
    fn(x3527 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3526(x3527)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(k)), (s : Cart[Real, 2]))"), t3528]))
  let t3524 = @tactics.match_mp_tac(@topology.series_unique())
  let t3537 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3524), t3529), t3530), t3534), t3535), t3536), @int.asm_arith_tac)
  genzeta_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ s : Cart[Real, 2], real_of_num(1) < Re(s) && m <= n → genzeta(m, s) - vsum(op_dot_dot(m, n), (k : Num) => Cx(real_of_num(1)) / cpow(Cx(real_of_num(k)), s)) == genzeta(n + 1, s)"), t3537))
}

///|
let genzeta_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GENZETA_OFFSET")

///|
/// `GENZETA_OFFSET`
pub fn genzeta_offset() -> @kernel.Thm {
  genzeta_offset_c.get()
}

///|
/// NEWMAN_CONVERGES
fn step_76() -> Unit raise {
  let t3547 = @drule.match_mp(@prime.prime_imp_nz())
  let t3549 = @tactics.first_assum(fn(x3548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3545 = @tactics.mp_tac(x3544)
      fn(x3546 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3545(x3546)
      }
    })(t3547(x3548))
  })
  let t3543 = @simp.asm_rewrite_tac(@list.List([]))
  let t3542 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3541 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_pair_thm()]))
  let t3540 = @tactics.repeat_tac(@tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Num, Num)) -> (Num, Num)) => ∀ x : Num, ∀ y : Num, GEQ(f((x, y)), (y, x)))")))
  let t3539 = @tactics.match_mp_tac(@vectors.vsum_eq_general_inverses())
  let t3538 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @iterate.in_numseg(), @equal.gsym(@theorems.conj_assoc())]))
  let t3550 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@vectors.vsum_vsum_product(), @iterate.finite_numseg(), finite_atmost()])), t3538), t3539), t3540), t3541), t3542), t3543), t3549), @int.asm_arith_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("vsum(op_dot_dot(1, (n : Num)), (m : Num) => vsum({(p : Num) | prime(p) && p <= m}, (p : Num) => (f : (Num, Num) -> Cart[Real, _])(p, m))) == vsum({(p : Num) | prime(p) && p <= n}, (p : Num) => vsum(op_dot_dot(p, n), (m : Num) => f(p, m)))"), t3550)
  let t3695 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t3694 = @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())
  let t3693 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq(), @realarith.real_sub_lt()]))
  let t3692 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((real_of_num(1) - (s : Real)) * (l : Real) <= -((s - real_of_num(1)) * (m : Real))) == ((s - real_of_num(1)) * m <= (s - real_of_num(1)) * l)"))]))
  let t3691 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.real_exp_neg()), @transcendentals.real_exp_mono_le(), @complexes.re_sub(), @complexes.re_cx()]))
  let t3690 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_inv(), @transcendentals.norm_cpow_real(), @complexes.real_cx(), @complexes.re_cx(), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t3688 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t3687 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t3686 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid()]))
  let t3685 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= real_of_num(1) → a + (b : Real) <= abs(real_of_num(1) + b)")))
  let t3689 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()])), t3685), t3686), t3687), t3688), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3684 = @simp.asm_simp_tac(@list.List([@realarith.real_le_add(), @real.real_le_div(), @realarith.real_pos(), @realarith.real_sub_le(), @realarith.real_lt_imp_le(), @transcendentals.real_exp_pos_le()]))
  let t3683 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3682 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_norm_mul()]))
  let t3681 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → (x : Real) <= a → x <= b")))
  let t3680 = @simp.asm_rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith()]))
  let t3679 = @term_syntax.parse_term("(s : Cart[Real, 2])")
  let t3696 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num) + 1"), t3679]), genzeta_bound())), t3680), t3681), t3682), t3683), t3684), @tactics.conj_tac), t3689), t3690), t3691), t3692), t3693), t3694), t3695), @calc_rat.real_arith_tac)
  let t3676 = @simp.asm_simp_tac(@list.List([@realarith.real_le_add(), @realarith.real_pos(), @transcendentals.log_pos(), @realax.real_of_num_le(), @arith.le_1()]))
  let t3675 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x")))
  let t3674 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), @complexes.complex_norm_cx()]))
  let t3677 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @arith.lt_nz()])), t3674), t3675), t3676)
  let t3673 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realarith.real_pos(), @transcendentals.log_pos(), @realax.real_of_num_le(), @arith.le_1()]))
  let t3672 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) <= x")))
  let t3671 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_div()), @complexes.complex_norm_cx()]))
  let t3670 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t3667 = @drule.match_mp(@prime.prime_imp_nz())
  let t3669 = @tactics.first_assum(fn(x3668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3664 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3665 = @tactics.assume_tac(x3664)
      fn(x3666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3665(x3666)
      }
    })(t3667(x3668))
  })
  let t3663 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t3662 = @simp.simp_tac(@list.List([finite_atmost(), @sets.in_elim_thm()]))
  let t3678 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_norm_le()), t3662), t3663), @tactics.strip_tac), t3669), t3670), t3671), t3672), t3673), t3677])
  let t3661 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x' : Real) <= (x : Real) && (y' : Real) == (y : Real) → abs(x) <= y → x' <= y'")))
  let t3660 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @realax.real_of_num_le()]))
  let t3657 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (y : Real)) <= (e : Real) → real_of_num(0) <= y → abs(x) <= y + e")))
  let t3659 = @tactics.disch_then(fn(x3658 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3655 = @tactics.mp_tac(x3654)
      fn(x3656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3655(x3656)
      }
    })(t3657(x3658))
  })
  let t3652 = @drule.match_mp(@mangoldt.mertens())
  let t3697 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x3653 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3649 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3650 = @tactics.mp_tac(x3649)
      fn(x3651 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3650(x3651)
      }
    })(t3652(x3653))
  }), t3659), t3660), t3661), @tactics.conj_tac), t3678), t3696])
  let t3648 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t3647 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t3646 = @tactics.subgoal_then(@term_syntax.parse_term("!((n : Num) == 0) && 1 <= n"), @tactics.strip_assume_tac)
  let t3645 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t3644 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t3643 = @simp.once_rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * ((b : Cart[Real, 2]) * (c : Cart[Real, 2])) == b * (a * c)"))]))
  let t3642 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t3641 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) <= (x : Real) → x < (e : Real) → y <= e")))
  let t3637 = @term_syntax.parse_term("(n : Num)")
  let t3640 = @tactics.first_x_assum(fn(x3639 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3635 = @tactics.mp_tac(x3634)
      fn(x3636 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3635(x3636)
      }
    })(((x3638 : @kernel.Thm) => @bool.spec(t3637, x3638))(x3639))
  })
  let t3633 = @simp.simp_tac(@list.List([@complexes.vsum_complex_rmul(), finite_atmost()]))
  let t3631 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), genzeta_offset()]))
  let t3630 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t3632 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_imp_le()), @tactics.ap_term_tac), t3630), t3631), @tactics.all_tac])
  let t3629 = @tactics.exists_tac(@term_syntax.parse_term("norm(vsum({(p : Num) | prime(p) && p <= (n : Num)}, (p : Num) => clog(Cx(real_of_num(p))) / Cx(real_of_num(p)) * genzeta(n + 1, (s : Cart[Real, 2]))))"))
  let t3628 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t3627 = @simp.once_rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("inv((x : Cart[Real, 2])) == Cx(real_of_num(1)) / x"))]))
  let t3626 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t3625 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_ldistrib())]))
  let t3624 = @simp.simp_tac(@list.List([@complexes.complex_mul_assoc(), @complexes.vsum_complex_lmul(), @iterate.finite_numseg()]))
  let t3623 = @simp.simp_tac(@list.List([@complexes.complex_div()]))
  let t3622 = @simp.simp_tac(@list.List([finite_atmost(), @equal.gsym(@vectors.vsum_sub())]))
  let t3621 = @simp.rewrite_tac(@list.List([lemma]))
  let t3620 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t3619 = @simp.simp_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.vsum_complex_rmul()), finite_atmost()]))
  let t3618 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((x : Cart[Real, 2]) - (y : Cart[Real, 2])) <= (e : Real) / real_of_num(2) → norm(x - (a : Cart[Real, 2])) < e / real_of_num(2) → norm(y - a) < e")))
  let t3614 = @term_syntax.parse_term("(n : Num)")
  let t3617 = @tactics.remove_then("0", fn(x3616 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3612 = @tactics.mp_tac(x3611)
      fn(x3613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3612(x3613)
      }
    })(((x3615 : @kernel.Thm) => @bool.spec(t3614, x3615))(x3616))
  })
  let t3610 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3609 = @tactics.exists_tac(@term_syntax.parse_term("(N0 : Num) + ((N1 : Num) + 1)"))
  let t3608 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N1 : Num)"))(fn(x3605 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3606 = ((x3604 : @kernel.Thm) => @tactics.label_tac("1", x3604))(x3605)
    fn(x3607 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3606(x3607)
    }
  }))
  let t3603 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t3599 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t3602 = @tactics.disch_then(fn(x3601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3596 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3597 = @tactics.mp_tac(x3596)
      fn(x3598 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3597(x3598)
      }
    })(((x3600 : @kernel.Thm) => @bool.spec(t3599, x3600))(x3601))
  })
  let t3595 = @simp.rewrite_tac(@list.List([@topology.lim_sequentially(), @vectors.dist(), @complexes.complex_sub_rzero()]))
  let t3593 = @simp.rewrite_tac(@list.List([@complexes.re_sub(), @complexes.re_cx()]))
  let t3590 = @tactics.match_mp_tac(@transcendentals.lim_1_over_power())
  let t3589 = @simp.once_rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("inv((x : Cart[Real, 2])) == Cx(real_of_num(1)) / x"))]))
  let t3591 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.lim_null_complex_lmul()), t3589), t3590)
  let t3588 = @tactics.match_mp_tac(@transcendentals.lim_log_over_power_n())
  let t3592 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())])), t3588), t3591])
  let t3587 = @tactics.match_mp_tac(@canal.lim_null_complex_add())
  let t3586 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_add_rdistrib()]))
  let t3594 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.lim_null_complex_lmul()), t3586), t3587), @tactics.conj_tac), t3592), t3593), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3585 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_gt((n : Num) => Cx(real_of_num(1) + real_of_num(1) / (Re((s : Cart[Real, 2])) - real_of_num(1))) * ((clog(Cx(real_of_num(n))) + Cx(real_of_num(24))) / cpow(Cx(real_of_num(n)), s - Cx(real_of_num(1)))), Cx(real_of_num(0)), sequentially)"), fn(x3582 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3583 = @tactics.mp_tac(x3582)
    fn(x3584 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3583(x3584)
    }
  })
  let t3581 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N0 : Num)"))(fn(x3578 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3579 = ((x3577 : @kernel.Thm) => @tactics.label_tac("0", x3577))(x3578)
    fn(x3580 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3579(x3580)
    }
  }))
  let t3576 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t3575 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t3571 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t3574 = @tactics.disch_then(fn(x3573 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3569 = @tactics.mp_tac(x3568)
      fn(x3570 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3569(x3570)
      }
    })(((x3572 : @kernel.Thm) => @bool.spec(t3571, x3572))(x3573))
  })
  let t3567 = @simp.rewrite_tac(@list.List([@topology.lim_sequentially()]))
  let t3566 = @list.List([@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_inter(), @iterate.in_numseg(), @arith.le_0()])), @tactics.all_tac])
  let t3565 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, INTER({(p : Num) | prime(p)}, op_dot_dot(0, n)) == {(p : Num) | prime(p) && p <= n}"), fn(x3563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3563
    @simp.rewrite_tac(@list.List([th]))
  })
  let t3562 = @simp.gen_rewrite_tac(fn(x3559 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3560 = @equal.land_conv(x3559)
    fn(x3561 : @kernel.Term) -> @kernel.Thm raise {
      s3560(x3561)
    }
  }, @list.List([@topology.sums()]))
  let t3556 = @drule.match_mp(converges_newman_prime())
  let t3558 = @tactics.first_assum(fn(x3557 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3553 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3554 = @tactics.mp_tac(x3553)
      fn(x3555 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3554(x3555)
      }
    })(t3556(x3557))
  })
  let t3552 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t3551 = @simp.rewrite_tac(@list.List([@topology.sums(), @misc.from_inter_numseg(), @topology.lim_sequentially()]))
  let t3698 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3551), t3552), @tactics.disch_tac), t3558), t3562), t3565), t3566), t3567), t3574), t3575), t3576), t3581), t3585), t3594), t3595), t3602), t3603), t3608), t3609), t3610), @tactics.disch_tac), t3617), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t3618), t3619), t3620), t3621), t3622), t3623), t3624), t3625), t3626), t3627), t3628), t3629), @tactics.conj_tac), t3632), t3633), t3640), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t3641), t3642), t3643), t3644), t3645), t3646), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t3647), t3648), @tactics.conj_tac), t3697)
  newman_converges_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Cart[Real, 2], real_of_num(1) < Re(s) → sums((n : Num) => vsum({(p : Num) | prime(p) && p <= n}, (p : Num) => clog(Cx(real_of_num(p))) / Cx(real_of_num(p))) / cpow(Cx(real_of_num(n)), s), newman(s), from(1))"), t3698))
}

///|
let newman_converges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEWMAN_CONVERGES")

///|
/// `NEWMAN_CONVERGES`
pub fn newman_converges() -> @kernel.Thm {
  newman_converges_c.get()
}

///|
/// MAIN_RESULT
fn step_77() -> Unit raise {
  let t3756 = @simp.asm_simp_tac(@list.List([newman_converges()]))
  let t3754 = @simp.asm_simp_tac(@list.List([complex_derivative_zeta_converges()]))
  let t3753 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t3755 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div(), @equal.gsym(@complexes.complex_mul_lneg())])), t3753), t3754)])
  let t3752 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t3751 = @tactics.match_mp_tac(@topology.series_add())
  let t3750 = @simp.rewrite_tac(@list.List([@complexes.complex_sub()]))
  let t3748 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lid()]))
  let t3745 = @drule.match_mp(zeta_converges())
  let t3747 = @tactics.first_assum(fn(x3746 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3743 = @tactics.mp_tac(x3742)
      fn(x3744 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3743(x3744)
      }
    })(t3745(x3746))
  })
  let t3749 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.series_complex_lmul()), t3747), t3748)])
  let t3741 = @tactics.match_mp_tac(@topology.series_add())
  let t3740 = @simp.rewrite_tac(@list.List([@complexes.complex_add_assoc()]))
  let t3739 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_add_rdistrib(), @complexes.complex_sub_rdistrib()]))
  let t3738 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx(), @realarith.real_lt_refl()]))
  let t3737 = @simp.rewrite_tac(@list.List([@realax.real_gt()]))
  let t3736 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3734 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @complexes.cx_div(), @real.real_of_num_lt(), @arith.lt_nz(), @prime.prime_imp_nz()]))
  let t3733 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3732 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3731 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t3730 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @arith.le_1()]))
  let t3729 = @simp.simp_tac(@list.List([@equal.gsym(@complexes.vsum_cx()), @complexes.cx_sub(), finite_atmost()]))
  let t3728 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_norm_cx())]))
  let t3727 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) → x <= (a : Real) → y <= a")))
  let t3726 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t3725 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), @mangoldt.mertens()))
  let t3724 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((x : Cart[Real, 2]) - (y : Cart[Real, 2])) <= real_of_num(24) → norm(x - y + (c : Cart[Real, 2])) <= real_of_num(24) + norm(c)")))
  let t3735 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), @tactics.disch_tac), t3724), t3725), t3726), t3727), t3728), @tactics.ap_term_tac), t3729), t3730), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3731), t3732), t3733), t3734), @tactics.all_tac])
  let t3722 = @simp.simp_tac(@list.List([@arith.le_1(), @complexes.complex_pow_1()]))
  let t3721 = @simp.simp_tac(@list.List([@misc.in_from(), @transcendentals.cpow_n(), @complexes.cx_inj(), @realax.real_of_num_eq()]))
  let t3720 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.summable_eq()))
  let t3717 = @drule.match_mp(@topology.sums_summable())
  let t3719 = @tactics.disch_then(fn(x3718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3714 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3715 = @tactics.mp_tac(x3714)
      fn(x3716 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3715(x3716)
      }
    })(t3717(x3718))
  })
  let t3713 = @simp.rewrite_tac(@list.List([@complexes.re_cx(), @realax.real_ge(), @realax.real_le_refl()]))
  let t3710 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t3723 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x3712 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3708 = @tactics.mp_tac(x3707)
      fn(x3709 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3708(x3709)
      }
    })(((x3711 : @kernel.Thm) => @bool.spec(t3710, x3711))(x3712))
  }), t3713), t3719), t3720), t3721), t3722)])
  let t3706 = @simp.asm_rewrite_tac(@list.List([]))
  let t3703 = @term_syntax.parse_term("real_of_num(24) + norm((c : Cart[Real, 2]))")
  let t3704 = @term_syntax.parse_term("(n : Num) => vsum({(p : Num) | prime(p) && p <= n}, (p : Num) => clog(Cx(real_of_num(p))) / Cx(real_of_num(p))) - clog(Cx(real_of_num(n))) + (c : Cart[Real, 2])")
  let t3705 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => if z == Cx(real_of_num(1)) { (singval : Cart[Real, 2]) } else { newman(z) + (complex_derivative(zeta, z) + (c : Cart[Real, 2]) * zeta(z)) }"), t3704, t3703]), newman_ingham_theorem_strong()))
  let t3702 = @tactics.exists_tac(@term_syntax.parse_term("(c : Cart[Real, 2])"))
  let t3700 = @term_syntax.parse_term("(singval : Cart[Real, 2])")
  let t3701 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : Cart[Real, 2])"), t3700]))
  let t3699 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t3757 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(analytic_newman_variant()), t3699), t3701), @tactics.disch_tac), t3702), t3705), t3706), @tactics.ants_tac), t3723), @tactics.conj_tac), t3735), t3736), t3737), @class.cond_cases_tac), t3738), @tactics.disch_tac), t3739), t3740), t3741), @tactics.conj_tac), t3749), t3750), t3751), t3752), @tactics.conj_tac), t3755), t3756)
  main_result_c.set(@tactics.prove(@term_syntax.parse_term("∃ c : Cart[Real, 2], summable(from(1), (n : Num) => (vsum({(p : Num) | prime(p) && p <= n}, (p : Num) => clog(Cx(real_of_num(p))) / Cx(real_of_num(p))) - clog(Cx(real_of_num(n))) + c) / Cx(real_of_num(n)))"), t3757))
}

///|
let main_result_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAIN_RESULT")

///|
/// `MAIN_RESULT`
pub fn main_result() -> @kernel.Thm {
  main_result_c.get()
}

///|
/// SUM_GOESTOZERO_LEMMA
fn step_78() -> Unit raise {
  let t3840 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) <= (x : Real) - (y : Real) + (b : Real)) == (a + y <= b + x)"))]))
  let t3839 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.log_mono_le_imp()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3838 = @tactics.exists_tac(@term_syntax.parse_term("log(real_of_num((n : Num)))"))
  let t3837 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ x' : Real, (x : Real) <= x' && (a : Real) <= (y : Real) - x' + (b : Real) → a <= y - x + b")))
  let t3836 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @transcendentals.log_div()]))
  let t3835 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t3834 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t3832 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3830 = @calc_rat.real_arith(@term_syntax.parse_term("-((x : Real) + (y : Real)) == -y - x"))
  let t3831 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), t3830]))
  let t3829 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t3833 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) * (x : Real) <= a * (y : Real)) == (-a * y <= -a * x)"))])), t3829), t3831), t3832), @calc_rat.asm_real_arith_tac)])
  let t3841 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(log(real_of_num((N : Num)) * inv(real_of_num((M : Num)))) + (a : (Num) -> Real)(N)) * inv(real_of_num((n : Num)))")), @tactics.conj_tac), t3833), t3834), t3835), t3836), t3837), t3838), @tactics.conj_tac), t3839), t3840)
  let t3828 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - ((x : Real) - (y : Real)) <= (b : Real)) == (a + y <= b + x)"))]))
  let t3827 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.log_mono_le_imp()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3826 = @tactics.exists_tac(@term_syntax.parse_term("log(real_of_num((n : Num)))"))
  let t3825 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ x' : Real, x' <= (x : Real) && (a : Real) - (x' - (m : Real)) <= (b : Real) → a - (x - m) <= b")))
  let t3824 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @transcendentals.log_div()]))
  let t3823 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t3822 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t3820 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3819 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t3821 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t3819), t3820), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3842 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("((a : (Num) -> Real)((M : Num)) - log(real_of_num((N : Num)) * inv(real_of_num(M)))) * inv(real_of_num((n : Num)))")), @tactics.conj_tac), t3821), t3822), t3823), t3824), t3825), t3826), @tactics.conj_tac), t3827), t3828), t3841])
  let t3818 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t3817 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t3816 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_lneg()), @realarith.real_neg_sub(), @real.real_sub_rneg()]))
  let t3815 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num))"), fn(x3812 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3813 = @tactics.assume_tac(x3812)
    fn(x3814 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3813(x3814)
    }
  }), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))
  let t3811 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t3810 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3809 = @tactics.match_mp_tac(@iterate.sum_le_numseg())
  let t3807 = @equal.gsym(@iterate.sum_neg())
  let t3808 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_const_numseg()), t3807]))
  let t3802 = @calc_rat.real_arith(@term_syntax.parse_term("(m : Real) < (n : Real) → m <= n + real_of_num(1)"))
  let t3803 = @equal.gsym(@realax.real_of_num_le())
  let t3804 = @equal.gsym(@realax.real_of_num_add())
  let t3805 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_of_num_sub()), t3804, t3803, t3802])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3806 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num((N : Num)) - real_of_num((M : Num)) + real_of_num(1) == real_of_num(N + 1 - M)"), fn(x3799 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3800 = @tactics.subst1_tac(x3799)
    fn(x3801 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3800(x3801)
    }
  }), t3805)
  let t3797 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= -(x : Real) → x <= abs(a)")))
  let t3798 = @list.List([@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (a : Real) → x <= abs(a)"))), t3797])
  let t3796 = @simp.asm_rewrite_tac(@list.List([]))
  let t3795 = @tactics.exists_tac(@term_syntax.parse_term("abs(sum(op_dot_dot((M : Num), (N : Num)), (i : Num) => (a : (Num) -> Real)(i) / real_of_num(i)))"))
  let t3794 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t3793 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (y : Real) * (z : Real) == y * (x * z)"))]))
  let t3792 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t3791 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_ldiv_eq())]))
  let t3790 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("(m : Real) < (n : Real) → real_of_num(0) < n - m + real_of_num(1)")), @real.real_le_div(), @realax.real_le_mul(), @calc_int.real_mul_lzero(), @realarith.real_pos()]))
  let t3789 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && (real_of_num(0) <= (x : Real) → x <= y) → x <= y")))
  let t3786 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t3785 = @simp.asm_simp_tac(@list.List([@realarith.real_pos(), @realax.real_le_mul()]))
  let t3784 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t3787 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t3784), t3785), t3786), @calc_rat.asm_real_arith_tac)])
  let t3783 = @tactics.exists_tac(@term_syntax.parse_term("(d : Real) * real_of_num((N : Num)) / (real_of_num(N) - real_of_num((M : Num)) + real_of_num(1))"))
  let t3788 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t3783), @tactics.conj_tac), t3787)
  let t3782 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t3781 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc()]))
  let t3779 = @simp.asm_rewrite_tac(@list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_add())]))
  let t3778 = @tactics.match_mp_tac(@arith.transitive_stepwise_le())
  let t3780 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_le()])), t3778), t3779), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3777 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, real_of_num(m) <= real_of_num(n) → (a : (Num) -> Real)(m) + log(real_of_num(m)) <= a(n) + log(real_of_num(n))"), fn(x3774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3775 = @tactics.assume_tac(x3774)
    fn(x3776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3775(x3776)
    }
  })
  let t3773 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_le_sub_radd())]))
  let t3771 = @tactics.match_mp_tac(@real.real_le_div())
  let t3770 = @tactics.match_mp_tac(@transcendentals.log_le())
  let t3769 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (m : Real) && real_of_num(0) < (n : Real) → n / m == real_of_num(1) + (n - m) / m"))]))
  let t3772 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_le_ladd()])), t3769), t3770), t3771), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t3768 = @tactics.exists_tac(@term_syntax.parse_term("(d : Real) * (real_of_num((N : Num)) / (real_of_num(N) - real_of_num((M : Num)))) + log(real_of_num(N) / real_of_num(M))"))
  let t3767 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ a : Real, a <= (b : Real) && (x : Real) <= a && (y : Real) <= a → x <= b && y <= b")))
  let t3766 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@real.real_of_num_lt())])))
  let t3765 = @tactics.subgoal_then(@term_syntax.parse_term("0 < (N : Num)"), fn(x3762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3763 = @tactics.assume_tac(x3762)
    fn(x3764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3763(x3764)
    }
  })
  let t3761 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (d : Real)"), fn(x3758 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3759 = @tactics.assume_tac(x3758)
    fn(x3760 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3759(x3760)
    }
  })
  let t3843 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @tactics.strip_tac), t3761), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3765), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t3766), t3767), t3768), @tactics.conj_tac), t3772), t3773), t3777), t3780), t3781), t3782), @tactics.conj_tac), t3788), t3789), t3790), @tactics.disch_tac), t3791), t3792), t3793), t3794), t3795), t3796), t3798), t3806), t3808), t3809), t3810), @tactics.strip_tac), t3811), t3815), t3816), t3817), t3818), t3842)
  sum_goestozero_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, ∀ M : Num, ∀ N : Num, abs(sum(op_dot_dot(M, N), (i : Num) => a(i) / real_of_num(i))) <= (d : Real) → 0 < M && M < N && (∀ n : Num, a(n) + log(real_of_num(n)) <= a(n + 1) + log(real_of_num(n) + real_of_num(1))) → a(M) <= d * (real_of_num(N) / (real_of_num(N) - real_of_num(M))) + (real_of_num(N) - real_of_num(M)) / real_of_num(M) && -a(N) <= d * (real_of_num(N) / (real_of_num(N) - real_of_num(M))) + (real_of_num(N) - real_of_num(M)) / real_of_num(M)"), t3843))
}

///|
let sum_goestozero_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_GOESTOZERO_LEMMA")

///|
/// `SUM_GOESTOZERO_LEMMA`
pub fn sum_goestozero_lemma() -> @kernel.Thm {
  sum_goestozero_lemma_c.get()
}

///|
/// SUM_GOESTOZERO_THEOREM
fn step_79() -> Unit raise {
  let t3851 = @meson.meson_tac(@list.List([@real.real_lt_min()]))
  let t3847 = @term_syntax.parse_term("min((e : Real), real_of_num(1) / real_of_num(5))")
  let t3850 = @tactics.first_x_assum(fn(x3849 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3844 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3845 = @tactics.mp_tac(x3844)
      fn(x3846 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3845(x3846)
      }
    })(((x3848 : @kernel.Thm) => @bool.spec(t3847, x3848))(x3849))
  })
  let t3852 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3850), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t3851)
  let lemma = @tactics.prove(@term_syntax.parse_term("(∀ e : Real, real_of_num(0) < e && e < real_of_num(1) / real_of_num(4) → (∃ N : Num, ∀ n : Num, N <= n → (f : (Num) -> Real)(n) < e)) → (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, N <= n → f(n) < e))"), t3852)
  let t3963 = @simp.asm_simp_tac(@list.List([@real.real_lt_mul(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("!((n : Num) < 1) → 0 < n"))]))
  let t3964 = @tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(k : Real) <= (n : Real) * ((e : Real) / real_of_num(4)) && real_of_num(0) < n * e → k < e / real_of_num(2) * n"))), t3963)
  let t3962 = @simp.asm_simp_tac(@list.List([@real.real_lt_rmul_eq(), @realax.real_of_num_le(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == (0 < n)"))]))
  let t3965 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) * ((e : Real) / real_of_num(4)) < (k : Real) + real_of_num(1) && real_of_num(1) <= k && (real_of_num(1) / real_of_num(4) + e / real_of_num(16)) * k < real_of_num(1) * k → e / real_of_num(16) * (n + k) < real_of_num(2) * k"))), t3962), @calc_rat.asm_real_arith_tac)
  let t3961 = @simp.rewrite_tac(@list.List([@realax.real_of_num_mul(), @real.real_of_num_lt()]))
  let t3960 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((n : Real) < real_of_num(2) * (n - (k : Real))) == (real_of_num(2) * k < n)"))]))
  let t3959 = @simp.asm_simp_tac(@list.List([@real.real_lt_lmul_eq(), @calc_rat.real_arith(@term_syntax.parse_term("((n : Real) * ((e : Real) / real_of_num(4)) < e / real_of_num(2) * (m : Real)) == (e * n < e * (real_of_num(2) * m))"))]))
  let t3958 = @simp.asm_rewrite_tac(@list.List([]))
  let t3957 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((n : Num)) * ((e : Real) / real_of_num(4))"))
  let t3966 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_let_trans()), t3957), t3958), t3959), t3960), t3961), @int.asm_arith_tac)
  let t3956 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t3967 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) * ((e : Real) / real_of_num(4)) < (k : Real) + real_of_num(1) && real_of_num(1) <= k → e / real_of_num(16) * n < real_of_num(2) * k"))), t3956), @int.asm_arith_tac), t3966, t3965, t3964])
  let t3954 = @int.arith_rule(@term_syntax.parse_term("!((n : Num) < 1) → 0 < n"))
  let t3955 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq(), @realarith.real_sub_lt(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("0 < (k : Num) && 4 * k <= (n : Num) → k < n")), t3954]))
  let t3953 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t3952 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_assoc()]))
  let t3951 = @simp.asm_simp_tac(@list.List([@real.real_lt_lmul_eq(), @calc_rat.real_arith(@term_syntax.parse_term("(pow((e : Real) / real_of_num(8), 2) * (x : Real) < e / real_of_num(2)) == (e * (e / real_of_num(16) * x) < e * real_of_num(2))"))]))
  let t3950 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) / real_of_num(2) && (y : Real) < e / real_of_num(2) → x + y < e")))
  let t3948 = @calc_rat.real_arith(@term_syntax.parse_term("(n : Real) + (k : Real) - n == k"))
  let t3949 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) - (n - (k : Real)) == k")), t3948]))
  let t3945 = @equal.gsym(@realax.real_of_num_add())
  let t3946 = @int.arith_rule(@term_syntax.parse_term("4 * (k : Num) <= (n : Num) → k <= n"))
  let t3947 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_of_num_sub()), t3946, t3945]))
  let t3942 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) → (x : Real) <= a → x < b")))
  let t3943 = @tactics.then_tac(@tactics.disch_then(fn(x3941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3938 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3939 = @tactics.mp_tac(x3938)
      fn(x3940 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3939(x3940)
      }
    })(@bool.conjunct1(x3941))
  }), t3942)
  let t3937 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) → -(x : Real) <= a → -b < x")))
  let t3944 = @list.List([@tactics.then_tac(@tactics.disch_then(fn(x3936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3934 = @tactics.mp_tac(x3933)
      fn(x3935 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3934(x3935)
      }
    })(@bool.conjunct2(x3936))
  }), t3937), t3943])
  let t3931 = @simp.asm_rewrite_tac(@list.List([]))
  let t3928 = @drule.match_mp(sum_goestozero_lemma())
  let t3930 = @tactics.disch_then(fn(x3929 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3926 = @tactics.mp_tac(x3925)
      fn(x3927 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3926(x3927)
      }
    })(t3928(x3929))
  })
  let t3922 = @drule.match_mp(@realarith.real_lt_imp_le())
  let t3924 = @tactics.disch_then(fn(x3923 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3919 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3920 = @tactics.mp_tac(x3919)
      fn(x3921 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3920(x3921)
      }
    })(t3922(x3923))
  })
  let t3918 = @simp.rewrite_tac(@list.List([@misc.from_inter_numseg_gen()]))
  let t3932 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@int.asm_arith_tac, @tactics.all_tac])), t3918), @class.cond_cases_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t3924), t3930), t3931), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac]))
  let t3912 = @term_syntax.parse_term("(n : Num) + (k : Num)")
  let t3913 = @list.List([@term_syntax.parse_term("(n : Num)"), t3912])
  let t3916 = @tactics.first_assum(fn(x3915 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3909 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3910 = @tactics.mp_tac(x3909)
      fn(x3911 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3910(x3911)
      }
    })(((x3914 : @kernel.Thm) => @bool.specl(t3913, x3914))(x3915))
  })
  let t3905 = @term_syntax.parse_term("(n : Num)")
  let t3906 = @list.List([@term_syntax.parse_term("(n : Num) - (k : Num)"), t3905])
  let t3917 = @list.List([@tactics.first_x_assum(fn(x3908 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3903 = @tactics.mp_tac(x3902)
      fn(x3904 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3903(x3904)
      }
    })(((x3907 : @kernel.Thm) => @bool.specl(t3906, x3907))(x3908))
  }), t3916])
  let t3901 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_bounds_lt())]))
  let t3898 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t3897 = @simp.asm_rewrite_tac(@list.List([]))
  let t3896 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((n : Num)) * ((e : Real) / real_of_num(4))"))
  let t3895 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t3894 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(4) * (x : Real) <= (y : Real)) == (x <= y * inv(real_of_num(4)))"))]))
  let t3893 = @equal.gsym(@realax.real_of_num_mul())
  let t3899 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t3893])), t3894), t3895), t3896), t3897), t3898), @calc_rat.asm_real_arith_tac)
  let t3890 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @realax.real_of_num_le()]))
  let t3891 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_rmul()), t3890), @int.asm_arith_tac)
  let t3889 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_ldiv_eq()), @real.real_of_num_lt(), @arith.lt_nz()]))
  let t3892 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()])), t3889), @calc_rat.asm_real_arith_tac), t3891])
  let t3888 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((N1 : Num)) * ((e : Real) / real_of_num(4))"))
  let t3887 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t3886 = @simp.rewrite_tac(@list.List([@realarith.real_not_lt(), @realax.real_add_lid()]))
  let t3885 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num((n : Num)) * ((e : Real) / real_of_num(4)) < real_of_num(0) + real_of_num(1)"))
  let t3884 = @tactics.disch_then(fn(x3881 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3882 = @tactics.subst_all_tac(x3881)
    fn(x3883 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3882(x3883)
    }
  })
  let t3900 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.lt_nz()])), t3884), t3885), t3886), t3887), t3888), @tactics.conj_tac), t3892), t3899])), @tactics.all_tac])
  let t3880 = @tactics.subgoal_then(@term_syntax.parse_term("0 < (k : Num) && 4 * k <= (n : Num)"), @tactics.strip_assume_tac)
  let t3879 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(fn(x3876 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3877 = @tactics.subst_all_tac(x3876)
    fn(x3878 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3877(x3878)
    }
  }))
  let t3875 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @real.real_le_div(), @realarith.real_pos(), @realarith.real_lt_imp_le()]))
  let t3874 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num((n : Num)) * ((e : Real) / real_of_num(4))"), @floor.floor_pos()))
  let t3873 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num((n : Num)) * ((e : Real) / real_of_num(4))"), @floor.floor()))
  let t3872 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3871 = @tactics.exists_tac(@term_syntax.parse_term("2 * (N0 : Num) + ((N1 : Num) + 7)"))
  let t3870 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N1 : Num)"))(@tactics.strip_assume_tac))
  let t3869 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t3868 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(e : Real) / real_of_num(4)"), @real.real_arch_inv()))
  let t3867 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N0 : Num)"))(@tactics.strip_assume_tac))
  let t3866 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), @real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t3862 = @term_syntax.parse_term("pow((e : Real) / real_of_num(8), 2)")
  let t3865 = @tactics.first_x_assum(fn(x3864 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3860 = @tactics.mp_tac(x3859)
      fn(x3861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3860(x3861)
      }
    })(((x3863 : @kernel.Thm) => @bool.spec(t3862, x3863))(x3864))
  })
  let t3858 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t3857 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t3856 = @tactics.match_mp_tac(lemma)
  let t3855 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t3854 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3853 = @simp.rewrite_tac(@list.List([@realanalysis.real_series_cauchy()]))
  let t3968 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_forall_imp_thm(), @theorems.left_exists_and_thm()])), t3853), t3854), t3855), t3856), t3857), @tactics.strip_tac), t3858), t3865), t3866), t3867), t3868), t3869), t3870), t3871), t3872), @tactics.disch_tac), t3873), t3874), t3875), t3879), @tactics.strip_tac), t3880), t3900), t3901), @tactics.conj_tac), t3917), t3932), t3944), t3947), t3949), t3950), t3951), t3952), t3953), t3955), @tactics.conj_tac), t3967)
  sum_goestozero_theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Num) -> Real, ∀ c : Real, real_sums((i : Num) => a(i) / real_of_num(i), c, from(1)) && (∀ n : Num, a(n) + log(real_of_num(n)) <= a(n + 1) + log(real_of_num(n) + real_of_num(1))) → op_minus_minus_minus_gt(a, real_of_num(0), sequentially)"), t3968))
}

///|
let sum_goestozero_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_GOESTOZERO_THEOREM")

///|
/// `SUM_GOESTOZERO_THEOREM`
pub fn sum_goestozero_theorem() -> @kernel.Thm {
  sum_goestozero_theorem_c.get()
}

///|
/// MERTENS_LIMIT
fn step_80() -> Unit raise {
  let t4010 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t4007 = @drule.match_mp(@prime.prime_ge_2())
  let t4009 = @tactics.first_assum(fn(x4008 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4004 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4005 = @tactics.mp_tac(x4004)
      fn(x4006 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4005(x4006)
      }
    })(t4007(x4008))
  })
  let t4003 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t4002 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t4001 = @tactics.match_mp_tac(@real.real_le_div())
  let t4000 = @simp.asm_rewrite_tac(@list.List([]))
  let t3999 = @class.asm_cases_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t3998 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t3997 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_elim_thm()]))
  let t3996 = @simp.rewrite_tac(@list.List([finite_atmost()]))
  let t3995 = @tactics.match_mp_tac(@iterate.sum_subset())
  let t3994 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) <= (s' : Real) → s - (l : Real) - (c : Real) + l <= s' - (l' : Real) - c + l'")))
  let t4011 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@realax.real_of_num_add()]))), t3994), t3995), t3996), t3997), @tactics.conj_tac), t3998), t3999), t4000), @list.List([@int.arith_tac, @tactics.all_tac])), @tactics.strip_tac), t4001), t4002), t4003), t4009), t4010), @int.arith_tac)
  let t3992 = @equal.gsym(@complexes.cx_div())
  let t3993 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @prime.prime_imp_nz(), @arith.lt_nz(), t3992, @complexes.re_cx()]))
  let t3991 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t3990 = @simp.simp_tac(@list.List([@complexes.re_vsum(), finite_atmost()]))
  let t3989 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @arith.le_1(), @complexes.re_cx()]))
  let t3988 = @simp.asm_simp_tac(@list.List([@complexes.re_add(), @complexes.re_div_cx(), @complexes.re_sub(), @real.real_sub_rneg()]))
  let t3987 = @simp.rewrite_tac(@list.List([@misc.in_from()]))
  let t3986 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t3985 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_sums_eq()))
  let t3984 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t3982 = @drule.match_mp(@realanalysis.real_sums_re())
  let t4012 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x3983 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3979 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3980 = @tactics.mp_tac(x3979)
      fn(x3981 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3980(x3981)
      }
    })(t3982(x3983))
  }), t3984), t3985), t3986), t3987), @tactics.disch_tac), t3988), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3989), t3990), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3991), t3993), t4011])
  let t3978 = @simp.rewrite_tac(@list.List([]))
  let t3977 = @tactics.exists_tac(@term_syntax.parse_term("Re((l : Cart[Real, 2]))"))
  let t3976 = @tactics.match_mp_tac(sum_goestozero_theorem())
  let t3975 = @simp.once_rewrite_tac(@list.List([@realanalysis.reallim_null()]))
  let t3974 = @tactics.exists_tac(@term_syntax.parse_term("-Re((c : Cart[Real, 2]))"))
  let t3973 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(l : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t3972 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t4013 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_choose_then(@term_syntax.parse_term("(c : Cart[Real, 2])"))(fn(x3969 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3970 = @tactics.mp_tac(x3969)
    fn(x3971 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3970(x3971)
    }
  })(main_result()), t3972), t3973), t3974), t3975), t3976), t3977), t3978), @tactics.conj_tac), t4012)
  mertens_limit_c.set(@tactics.prove(@term_syntax.parse_term("∃ c : Real, op_minus_minus_minus_gt((n : Num) => sum({(p : Num) | prime(p) && p <= n}, (p : Num) => log(real_of_num(p)) / real_of_num(p)) - log(real_of_num(n)), c, sequentially)"), t4013))
}

///|
let mertens_limit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MERTENS_LIMIT")

///|
/// `MERTENS_LIMIT`
pub fn mertens_limit() -> @kernel.Thm {
  mertens_limit_c.get()
}

///|
/// PNT_PARTIAL_SUMMATION
fn step_81() -> Unit raise {
  let t4034 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos_lt(), @real.real_of_num_lt(), @arith.le_1(), @prime.prime_ge_2(), @int.arith_rule(@term_syntax.parse_term("2 <= (p : Num) → 1 < p"))]))
  let t4033 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) && real_of_num(0) < (y : Real) → real_of_num(1) == x / y * (y / x)")))
  let t4032 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero()]))
  let t4031 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (p : Num) → SUC(p - 1) == p"))]))
  let t4030 = @simp.rewrite_tac(@list.List([@real.real_add_sub()]))
  let t4029 = @simp.simp_tac(@list.List([@iterate.sum_clauses_numseg(), @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]))
  let t4028 = @tactics.first_assum(fn(x4023 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x4023
    let t4027 = @list.List([@drule.match_mp(@int.arith_rule(@term_syntax.parse_term("1 <= (p : Num) → p == SUC(p - 1)")))(th)])
    let t4025 = @term_syntax.parse_term("(x : Num) => (l : Real) == (a : Real) * (sum(op_dot_dot(1, x), (f : (Num) -> Real)) - (s : Real))")
    @simp.gen_rewrite_tac((x4026 : (@kernel.Term) -> @kernel.Thm raise) => @equal.pat_conv(t4025, x4026), t4027)
  })
  let t4022 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t4021 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t4020 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t4019 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @iterate.sum_restrict_set()]))
  let t4018 = @simp.simp_tac(@list.List([@equal.gsym(@iterate.sum_const()), @iterate.finite_numseg(), @sets.finite_restrict()]))
  let t4017 = @simp.gen_rewrite_tac(fn(x4014 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4015 = @equal.land_conv(x4014)
    fn(x4016 : @kernel.Term) -> @kernel.Thm raise {
      s4015(x4016)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t4035 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([prime_atmost_alt()])), t4017), t4018), t4019), t4020), t4021), t4022), @tactics.strip_tac), t4028), t4029), t4030), t4031), @class.cond_cases_tac), t4032), t4033), t4034)
  pnt_partial_summation_c.set(@tactics.prove(@term_syntax.parse_term("real_of_num(CARD({(p : Num) | prime(p) && p <= (n : Num)})) == sum(op_dot_dot(1, n), (k : Num) => real_of_num(k) / log(real_of_num(k)) * (sum({(p : Num) | prime(p) && p <= k}, (p : Num) => log(real_of_num(p)) / real_of_num(p)) - sum({(p : Num) | prime(p) && p <= k - 1}, (p : Num) => log(real_of_num(p)) / real_of_num(p))))"), t4035))
}

///|
let pnt_partial_summation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PNT_PARTIAL_SUMMATION")

///|
/// `PNT_PARTIAL_SUMMATION`
pub fn pnt_partial_summation() -> @kernel.Thm {
  pnt_partial_summation_c.get()
}

///|
/// SUM_PARTIAL_LIMIT
fn step_82() -> Unit raise {
  let t4197 = @tactics.disch_then(fn(x4195 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x4195
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(@iterate.sum_combine_r())(th))]))
  })
  let t4194 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (N : Num) + 1 && N <= (n : Num)"), fn(x4191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4192 = @tactics.mp_tac(x4191)
    fn(x4193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4192(x4193)
    }
  })
  let t4188 = @int.arith_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num) → N <= n + 1"))
  let t4189 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x"))
  let t4190 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), t4189, t4188, @real.real_lt_ldiv_eq()]))
  let t4187 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_div(), @real.real_abs_inv()]))
  let t4183 = @kernel.assume_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num)"))
  let t4186 = @tactics.first_x_assum(fn(x4185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4181 = @tactics.mp_tac(x4180)
      fn(x4182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4181(x4182)
      }
    })((fn(x4184 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x4184)(t4183)
    })(x4185))
  })
  let t4179 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4178 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1"))
  let t4177 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4176 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mp()))
  let t4175 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t4171 = @term_syntax.parse_term("(d : Real) / real_of_num(2)")
  let t4174 = @tactics.disch_then(fn(x4173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4169 = @tactics.mp_tac(x4168)
      fn(x4170 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4169(x4170)
      }
    })(((x4172 : @kernel.Thm) => @bool.spec(t4171, x4172))(x4173))
  })
  let t4167 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realanalysis.tendsto_real(), @real.real_sub_rzero()]))
  let t4164 = @drule.match_mp(@realanalysis.real_seq_offset())
  let t4161 = @term_syntax.parse_term("1")
  let t4166 = @tactics.disch_then(fn(x4165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4159 = @tactics.mp_tac(x4158)
        fn(x4160 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4159(x4160)
        }
      })(((x4162 : @kernel.Thm) => @bool.spec(t4161, x4162))(x4163))
    })(t4164(x4165))
  })
  let t4154 = @term_syntax.parse_term("sum(op_dot_dot(1, (N : Num)), (k : Num) => (e : (Num) -> Real)(k) * ((f : (Num) -> Real)(k + 1) - f(k))) - (c : Real) * f(N + 1)")
  let t4157 = @tactics.disch_then(fn(x4156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4152 = @tactics.mp_tac(x4151)
      fn(x4153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4152(x4153)
      }
    })(((x4155 : @kernel.Thm) => @bool.spec(t4154, x4155))(x4156))
  })
  let t4148 = @drule.match_mp(@realanalysis.reallim_lmul())
  let t4150 = @tactics.use_then("g", fn(x4149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4146 = @tactics.mp_tac(x4145)
      fn(x4147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4146(x4147)
      }
    })(t4148(x4149))
  })
  let t4144 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t4141 = @int.arith_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num) → N <= n + 1"))
  let t4142 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @int.arith_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num) → N <= n")), t4141]))
  let t4140 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= x) == (real_of_num(0) <= x)"))]))
  let t4139 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4138 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4137 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @real.real_lt_div(), @realarith.real_lt_imp_le(), @real.real_of_num_lt(), @calc_num.arith(), @arith.le_add(), @int.arith_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num) → N <= n + 1"))]))
  let t4136 = @tactics.try_tac(@tactics.match_mp_tac(@realax.real_le_mul()))
  let t4135 = @tactics.repeat_tac(@tactics.conj_tac)
  let t4134 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @equal.gsym(@real.real_sub_rdistrib())]))
  let t4133 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (d : Real) * (f1 : Real) && real_of_num(0) <= (dd : Real) && abs((en : Real) - (cn : Real)) <= d / real_of_num(4) * f1 → abs((s : Real) - (cn - (cN : Real))) <= d / real_of_num(4) * f1 - dd → abs(s - en + cN) <= d / real_of_num(2) * f1")))
  let t4132 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_rzero(), @real.real_sub_refl(), @calc_int.real_mul_rzero(), @iterate.sum_0()]))
  let t4131 = @simp.gen_rewrite_tac(fn(x4130 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x4126 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x4122 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x4116 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s4117 = @equal.land_conv(x4116)
          fn(x4118 : @kernel.Term) -> @kernel.Thm raise {
            s4117(x4118)
          }
        })((fn(x4119 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s4120 = @equal.land_conv(x4119)
          fn(x4121 : @kernel.Term) -> @kernel.Thm raise {
            s4120(x4121)
          }
        })(x4122))
      })((fn(x4123 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s4124 = @equal.rand_conv(x4123)
        fn(x4125 : @kernel.Term) -> @kernel.Thm raise {
          s4124(x4125)
        }
      })(x4126))
    })((fn(x4127 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4128 = @equal.rand_conv(x4127)
      fn(x4129 : @kernel.Term) -> @kernel.Thm raise {
        s4128(x4129)
      }
    })(x4130))
  }, @list.List([@iterate.sum_partial_suc()]))
  let t4115 = @simp.gen_rewrite_tac(fn(x4114 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x4108 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4109 = @equal.land_conv(x4108)
      fn(x4110 : @kernel.Term) -> @kernel.Thm raise {
        s4109(x4110)
      }
    })((fn(x4111 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4112 = @equal.rand_conv(x4111)
      fn(x4113 : @kernel.Term) -> @kernel.Thm raise {
        s4112(x4113)
      }
    })(x4114))
  }, @list.List([@iterate.sum_partial_suc()]))
  let t4107 = @simp.rewrite_tac(@list.List([@iterate.sum_sub_numseg()]))
  let t4106 = @simp.gen_rewrite_tac(fn(x4105 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x4099 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4100 = @equal.land_conv(x4099)
      fn(x4101 : @kernel.Term) -> @kernel.Thm raise {
        s4100(x4101)
      }
    })((fn(x4102 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s4103 = @equal.once_depth_conv(x4102)
      fn(x4104 : @kernel.Term) -> @kernel.Thm raise {
        s4103(x4104)
      }
    })(x4105))
  }, @list.List([@real.real_sub_rdistrib()]))
  let t4097 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @int.arith_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num) → N <= n"))]))
  let t4096 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_le()]))
  let t4095 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t4093 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → abs(b - a) == b - a"))
  let t4094 = @simp.asm_simp_tac(@list.List([@real.real_abs_mul(), @int.arith_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num) → N <= n")), t4093]))
  let t4098 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4094), t4095), t4096), t4097), @tactics.all_tac])
  let t4092 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @iterate.finite_numseg()]))
  let t4089 = @term_syntax.parse_term("op_dot_dot((N : Num) + 1, (n : Num))")
  let t4090 = @term_syntax.parse_term("(k : Num) => (d : Real) / real_of_num(4) * ((f : (Num) -> Real)(k + 1) - f(k))")
  let t4091 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(k : Num) => ((e : (Num) -> Real)(k) - (c : Real)) * ((f : (Num) -> Real)(k + 1) - f(k))"), t4090, t4089]), @iterate.sum_abs_le()))
  let t4143 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4091), t4092), @tactics.ants_tac), t4098), t4106), t4107), t4115), t4131), t4132), t4133), t4134), t4135), t4136), t4137), t4138), t4139), t4140), t4142), @tactics.all_tac])
  let t4088 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, (N : Num) + 1 <= n → abs(sum(op_dot_dot(N + 1, n), (k : Num) => (e : (Num) -> Real)(k) * ((f : (Num) -> Real)(k + 1) - f(k))) - e(n) * f(n + 1) + (c : Real) * f(N + 1)) <= (d : Real) / real_of_num(2) * f(n + 1)"), fn(x4085 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4086 = @tactics.mp_tac(x4085)
    fn(x4087 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4086(x4087)
    }
  })
  let t4083 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(M : Num) + (N : Num) <= (n : Num) → M <= n && N <= n"))]))
  let t4082 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(@tactics.strip_assume_tac))
  let t4081 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t4077 = @term_syntax.parse_term("(d : Real) / real_of_num(4)")
  let t4080 = @tactics.disch_then(fn(x4079 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4074 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4075 = @tactics.mp_tac(x4074)
      fn(x4076 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4075(x4076)
      }
    })(((x4078 : @kernel.Thm) => @bool.spec(t4077, x4078))(x4079))
  })
  let t4072 = @simp.gen_rewrite_rule(fn(x4071 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4071
  }, @list.List([@realanalysis.reallim_sequentially()]))
  let t4084 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.use_then("e", fn(x4073 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4068 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4069 = @tactics.mp_tac(x4068)
      fn(x4070 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4069(x4070)
      }
    })(t4072(x4073))
  }), t4080), t4081), t4082), t4083), @tactics.all_tac])
  let t4066 = @tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(@tactics.strip_assume_tac)
  let t4067 = @tactics.subgoal_then(@term_syntax.parse_term("∃ N : Num, (∀ k : Num, N <= k → real_of_num(0) < (f : (Num) -> Real)(k)) && (∀ k : Num, N <= k → f(k) <= f(k + 1)) && (∀ k : Num, N <= k → abs((e : (Num) -> Real)(k) - (c : Real)) < (d : Real) / real_of_num(4))"), t4066)
  let t4065 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Real)"))
  let t4064 = @simp.simp_tac(@list.List([@realanalysis.tendsto_real()]))
  let t4063 = @list.List([@simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()])), @tactics.all_tac])
  let t4062 = @tactics.subgoal_then(@term_syntax.parse_term("∀ k : Num, (M : Num) <= k → real_of_num(0) <= (f : (Num) -> Real)(k)"), fn(x4059 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4060 = @tactics.assume_tac(x4059)
    fn(x4061 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4060(x4061)
    }
  })
  let t4058 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x4051 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4052 = ((x4050 : @kernel.Thm) => @tactics.label_tac("g", x4050))(x4051)
    fn(x4053 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4052(x4053)
    }
  }, fn(x4055 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4056 = ((x4054 : @kernel.Thm) => @tactics.label_tac("e", x4054))(x4055)
    fn(x4057 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4056(x4057)
    }
  }))
  let t4049 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x4043 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4044 = @tactics.assume_tac(x4043)
    fn(x4045 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4044(x4045)
    }
  }, fn(x4046 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4047 = @tactics.mp_tac(x4046)
    fn(x4048 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4047(x4048)
    }
  }))
  let t4042 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x4036 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4037 = @tactics.assume_tac(x4036)
    fn(x4038 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4037(x4038)
    }
  }, fn(x4039 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4040 = @tactics.mp_tac(x4039)
    fn(x4041 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4040(x4041)
    }
  }))
  let t4198 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t4042), t4049), t4058), t4062), t4063), t4064), t4065), @tactics.disch_tac), t4067), t4084), t4088), t4143), @tactics.disch_tac), t4144), t4150), t4157), t4166), t4167), t4174), t4175), t4176), t4177), t4178), t4179), @tactics.disch_tac), t4186), t4187), t4190), t4194), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t4197), @calc_rat.real_arith_tac)
  sum_partial_limit_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ e : (Num) -> Real, ∀ c : Real, ∀ M : Num, (∀ k : Num, M <= k → real_of_num(0) < f(k)) && (∀ k : Num, M <= k → f(k) <= f(k + 1)) && op_minus_minus_minus_gt((k : Num) => inv(f(k)), real_of_num(0), sequentially) && op_minus_minus_minus_gt(e, c, sequentially) → op_minus_minus_minus_gt((n : Num) => (sum(op_dot_dot(1, n), (k : Num) => e(k) * (f(k + 1) - f(k))) - e(n) * f(n + 1)) / f(n + 1), real_of_num(0), sequentially)"), t4198))
}

///|
let sum_partial_limit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_PARTIAL_LIMIT")

///|
/// `SUM_PARTIAL_LIMIT`
pub fn sum_partial_limit() -> @kernel.Thm {
  sum_partial_limit_c.get()
}

///|
/// SUM_PARTIAL_LIMIT_ALT
fn step_83() -> Unit raise {
  let t4211 = @meson.asm_meson_tac(@list.List([]))
  let t4210 = @tactics.match_mp_tac(sum_partial_limit())
  let t4209 = @simp.asm_rewrite_tac(@list.List([]))
  let t4208 = @tactics.match_mp_tac(@realanalysis.reallim_mul())
  let t4207 = @tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) == real_of_num(0) * (b : Real)")))
  let t4204 = @int.arith_rule(@term_syntax.parse_term("(M : Num) <= (n : Num) → M <= n + 1"))
  let t4205 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (a : Real) && real_of_num(0) < (b : Real) → (x : Real) / b * (b / a) == x / a")), t4204]))
  let t4203 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4202 = @tactics.exists_tac(@term_syntax.parse_term("(M : Num)"))
  let t4206 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t4202), t4203), t4205), @tactics.all_tac])
  let t4201 = @simp.rewrite_tac(@list.List([]))
  let t4200 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (sum(op_dot_dot(1, n), (k : Num) => (e : (Num) -> Real)(k) * ((f : (Num) -> Real)(k + 1) - f(k))) - e(n) * f(n + 1)) / f(n + 1) * (f(n + 1) / f(n))"))
  let t4199 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t4212 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4199), t4200), t4201), @tactics.conj_tac), t4206), t4207), t4208), t4209), t4210), t4211)
  sum_partial_limit_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Real, ∀ e : (Num) -> Real, ∀ b : Real, ∀ c : Real, ∀ M : Num, (∀ k : Num, M <= k → real_of_num(0) < f(k)) && (∀ k : Num, M <= k → f(k) <= f(k + 1)) && op_minus_minus_minus_gt((k : Num) => inv(f(k)), real_of_num(0), sequentially) && op_minus_minus_minus_gt((n : Num) => f(n + 1) / f(n), b, sequentially) && op_minus_minus_minus_gt(e, c, sequentially) → op_minus_minus_minus_gt((n : Num) => (sum(op_dot_dot(1, n), (k : Num) => e(k) * (f(k + 1) - f(k))) - e(n) * f(n + 1)) / f(n), real_of_num(0), sequentially)"), t4212))
}

///|
let sum_partial_limit_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_PARTIAL_LIMIT_ALT")

///|
/// `SUM_PARTIAL_LIMIT_ALT`
pub fn sum_partial_limit_alt() -> @kernel.Thm {
  sum_partial_limit_alt_c.get()
}

///|
/// REALLIM_NA_OVER_N
fn step_84() -> Unit raise {
  let t4224 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_n()]))
  let t4225 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_null_lmul()), t4224)
  let t4223 = @tactics.conv_tac(@calc_rat.real_field)
  let t4222 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t4221 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4220 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4219 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const()]))
  let t4218 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_of_num(1)"))
  let t4226 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_transform_eventually()), t4218), t4219), t4220), t4221), t4222), t4223), t4225])
  let t4217 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t4216 = @simp.gen_rewrite_tac(fn(x4213 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4214 = @equal.land_conv(x4213)
    fn(x4215 : @kernel.Term) -> @kernel.Thm raise {
      s4214(x4215)
    }
  }, @list.List([@equal.gsym(@calc_int.real_add_rid())]))
  let t4227 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_add_rdistrib()]))), t4216), t4217), @tactics.conj_tac), t4226)
  reallim_na_over_n_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, op_minus_minus_minus_gt((n : Num) => (real_of_num(n) + a) / real_of_num(n), real_of_num(1), sequentially)"), t4227))
}

///|
let reallim_na_over_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALLIM_NA_OVER_N")

///|
/// `REALLIM_NA_OVER_N`
pub fn reallim_na_over_n() -> @kernel.Thm {
  reallim_na_over_n_c.get()
}

///|
/// REALLIM_N_OVER_NA
fn step_85() -> Unit raise {
  let t4234 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4233 = @simp.rewrite_tac(@list.List([reallim_na_over_n()]))
  let t4232 = @tactics.match_mp_tac(@realanalysis.reallim_inv())
  let t4231 = @simp.gen_rewrite_tac(fn(x4228 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4229 = @equal.land_conv(x4228)
    fn(x4230 : @kernel.Term) -> @kernel.Thm raise {
      s4229(x4230)
    }
  }, @list.List([@equal.gsym(@real.real_inv_1())]))
  let t4235 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_inv_div())]))), t4231), t4232), t4233), t4234)
  reallim_n_over_na_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : _, op_minus_minus_minus_gt((n : Num) => real_of_num(n) / (real_of_num(n) + real_of_num(1)), real_of_num(1), sequentially)"), t4235))
}

///|
let reallim_n_over_na_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALLIM_N_OVER_NA")

///|
/// `REALLIM_N_OVER_NA`
pub fn reallim_n_over_na() -> @kernel.Thm {
  reallim_n_over_na_c.get()
}

///|
/// REALLIM_LOG1_OVER_LOG
fn step_86() -> Unit raise {
  let t4284 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t4283 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4282 = @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())
  let t4281 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (b : Real) → a <= abs(b)")))
  let t4280 = @simp.simp_tac(@list.List([@equal.gsym(@transcendentals.log_pow()), @real.real_of_num_lt(), @calc_num.arith()]))
  let t4279 = @list.List([@tactics.then_tac(@tactics.mp_tac(@mangoldt.log_2_bounds()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4278 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * log(real_of_num(2))"))
  let t4277 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t4276 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t4275 = @simp.rewrite_tac(@list.List([@real.real_abs_inv()]))
  let t4273 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_pos()]))
  let t4272 = @tactics.match_mp_tac(@transcendentals.log_le())
  let t4271 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos(), @real.real_le_inv_eq(), @realarith.real_pos(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(1) <= real_of_num(1) + x"))]))
  let t4270 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (y : Real) → abs(x) <= y")))
  let t4274 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_mul_lid()])), t4270), t4271), t4272), t4273), @tactics.all_tac])
  let t4269 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4268 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4267 = @simp.gen_rewrite_tac(fn(x4264 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4265 = @equal.rand_conv(x4264)
    fn(x4266 : @kernel.Term) -> @kernel.Thm raise {
      s4265(x4266)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t4263 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_abs_mul()]))
  let t4262 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4261 = @tactics.exists_tac(@term_syntax.parse_term("16"))
  let t4260 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4259 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_1_over_n()]))
  let t4258 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => inv(real_of_num(n))"))
  let t4257 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t4256 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const()]))
  let t4255 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t4254 = @simp.gen_rewrite_tac(fn(x4251 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4252 = @equal.land_conv(x4251)
    fn(x4253 : @kernel.Term) -> @kernel.Thm raise {
      s4252(x4253)
    }
  }, @list.List([@equal.gsym(@calc_int.real_add_rid())]))
  let t4249 = @tactics.conv_tac(@calc_rat.real_field)
  let t4248 = @tactics.pop_assum(fn(x4245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4246 = @tactics.mp_tac(x4245)
    fn(x4247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4246(x4247)
    }
  })
  let t4242 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) <= (x : Real) → real_of_num(0) < x"))
  let t4243 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(0) < real_of_num(1) + x"))
  let t4244 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.log_mul()), t4243, @real.real_le_div(), @realarith.real_pos(), t4242]))
  let t4240 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) → (real_of_num(1) + (a : Real) / x == (b : Real) / x) == (x + a == b)"))
  let t4241 = @simp.asm_simp_tac(@list.List([@transcendentals.log_pos_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) <= (x : Real) → real_of_num(1) < x")), t4240]))
  let t4239 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4238 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t4237 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t4250 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t4237), t4238), t4239), t4241), t4244), @tactics.ap_term_tac), t4248), t4249), @tactics.all_tac])
  let t4236 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_of_num(1) + log(real_of_num(1) + real_of_num(1) / real_of_num(n)) / log(real_of_num(n))"))
  let t4285 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_transform_eventually()), t4236), @tactics.conj_tac), t4250), t4254), t4255), t4256), t4257), t4258), t4259), t4260), t4261), t4262), @tactics.disch_tac), t4263), t4267), t4268), t4269), @tactics.conj_tac), t4274), t4275), t4276), t4277), t4278), @tactics.conj_tac), t4279), t4280), t4281), t4282), t4283), t4284), @int.asm_arith_tac)
  reallim_log1_over_log_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => log(real_of_num(n) + real_of_num(1)) / log(real_of_num(n)), real_of_num(1), sequentially)"), t4285))
}

///|
let reallim_log1_over_log_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALLIM_LOG1_OVER_LOG")

///|
/// `REALLIM_LOG1_OVER_LOG`
pub fn reallim_log1_over_log() -> @kernel.Thm {
  reallim_log1_over_log_c.get()
}

///|
/// REALLIM_LOG_OVER_LOG1
fn step_87() -> Unit raise {
  let t4292 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4291 = @simp.rewrite_tac(@list.List([reallim_log1_over_log()]))
  let t4290 = @tactics.match_mp_tac(@realanalysis.reallim_inv())
  let t4289 = @simp.gen_rewrite_tac(fn(x4286 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4287 = @equal.land_conv(x4286)
    fn(x4288 : @kernel.Term) -> @kernel.Thm raise {
      s4287(x4288)
    }
  }, @list.List([@equal.gsym(@real.real_inv_1())]))
  let t4293 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_inv_div())])), t4289), t4290), t4291), t4292)
  reallim_log_over_log1_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => log(real_of_num(n)) / log(real_of_num(n) + real_of_num(1)), real_of_num(1), sequentially)"), t4293))
}

///|
let reallim_log_over_log1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALLIM_LOG_OVER_LOG1")

///|
/// `REALLIM_LOG_OVER_LOG1`
pub fn reallim_log_over_log1() -> @kernel.Thm {
  reallim_log_over_log1_c.get()
}

///|
/// ADHOC_BOUND_LEMMA
fn step_88() -> Unit raise {
  let t4402 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t4401 = @simp.rewrite_tac(@list.List([@real.real_abs_inv()]))
  let t4400 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4399 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4398 = @simp.gen_rewrite_tac(fn(x4395 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4396 = @equal.rand_conv(x4395)
    fn(x4397 : @kernel.Term) -> @kernel.Thm raise {
      s4396(x4397)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t4394 = @simp.rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t4392 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x"))
  let t4393 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_abs_div(), @real.real_le_ldiv_eq(), t4392])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4391 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < Re((z : Cart[Real, 2]))"), fn(x4388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4389 = @tactics.assume_tac(x4388)
    fn(x4390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4389(x4390)
    }
  })
  let t4387 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4386 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4385 = @simp.once_rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t4384 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t4383 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((b : Real) * ((c : Real) * (d : Real))) == a * b * (c * d)"))]))
  let t4381 = @equal.gsym(@realax.real_mul_assoc())
  let t4382 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @equal.gsym(@real.real_pow_inv()), t4381]))
  let t4377 = @equal.gsym(@complexes.cx_inv())
  let t4378 = @equal.gsym(@complexes.cx_pow())
  let t4379 = @equal.gsym(@complexes.cx_mul())
  let t4380 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub()), t4379, t4378, t4377, @complexes.re_cx()]))
  let t4376 = @tactics.disch_then(fn(x4375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4373 = @tactics.subst1_tac(x4372)
      fn(x4374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4373(x4374)
      }
    })(@equal.sym(x4375))
  })
  let t4371 = @simp.rewrite_tac(@list.List([@complexes.real_v1()]))
  let t4368 = @simp.gen_rewrite_rule(fn(x4367 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4367
  }, @list.List([@equal.gsym(@complexes.real())]))
  let t4370 = @tactics.first_x_assum(fn(x4369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4365 = @tactics.mp_tac(x4364)
      fn(x4366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4365(x4366)
      }
    })(t4368(x4369))
  })
  let t4363 = @tactics.disch_then(fn(x4360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4361 = @tactics.subst1_tac(x4360)
    fn(x4362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4361(x4362)
    }
  })
  let t4359 = @simp.once_rewrite_tac(@list.List([@real.real_abs_sub()]))
  let t4358 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) → x * ((y : Real) - ((z : Real) + -inv(x))) == real_of_num(1) - x * (z - y)"))]))
  let t4354 = @term_syntax.parse_term("op_star(real_of_num((k : Num)) + real_of_num(1))")
  let t4357 = @tactics.disch_then(fn(x4356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4351 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4352 = @tactics.mp_tac(x4351)
      fn(x4353 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4352(x4353)
      }
    })(((x4355 : @kernel.Thm) => @equal.ap_term(t4354, x4355))(x4356))
  })
  let t4346 = @equal.gsym(@complexes.cx_neg())
  let t4347 = @equal.gsym(@complexes.cx_sub())
  let t4348 = @equal.gsym(@complexes.cx_add())
  let t4349 = @equal.gsym(@complexes.cx_inv())
  let t4350 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), t4349, t4348, t4347, t4346, @complexes.re_cx()]))
  let t4345 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("((w : Real) == (z : Real) + (u : Real)) == (w - z == u)"))]))
  let t4344 = @simp.rewrite_tac(@list.List([@complexes.re_add()]))
  let t4343 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < real_of_num((k : Num)) && real_of_num(0) < real_of_num(k) + real_of_num(1)"), @tactics.strip_assume_tac)
  let t4340 = @simp.gen_rewrite_rule(fn(x4339 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4339
  }, @list.List([@complexes.in_segment_cx_gen()]))
  let t4342 = @tactics.first_x_assum(fn(x4341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4336 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4337 = @tactics.mp_tac(x4336)
      fn(x4338 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4337(x4338)
      }
    })(t4340(x4341))
  })
  let t4334 = @tactics.conjuncts_then2(fn(x4328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4329 = @tactics.assume_tac(x4328)
    fn(x4330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4329(x4330)
    }
  }, fn(x4331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4332 = @tactics.mp_tac(x4331)
    fn(x4333 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4332(x4333)
    }
  })
  let t4335 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Cart[Real, 2])"))(t4334))
  let t4326 = @tactics.pop_assum(fn(x4323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4324 = @tactics.mp_tac(x4323)
    fn(x4325 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4324(x4325)
    }
  })
  let t4320 = @simp.gen_rewrite_rule(fn(x4319 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4319
  }, @list.List([@complexes.in_segment_cx_gen()]))
  let t4322 = @tactics.first_x_assum(fn(x4321 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4316 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4317 = @tactics.mp_tac(x4316)
      fn(x4318 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4317(x4318)
      }
    })(t4320(x4321))
  })
  let t4315 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_cx(), @complexes.im_cx()]))
  let t4314 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid(), @complexes.complex_div(), @complexes.complex_mul_lneg()]))
  let t4313 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t4312 = @tactics.first_x_assum(fn(x4309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4310 = @tactics.subst_all_tac(x4309)
    fn(x4311 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4310(x4311)
    }
  })
  let t4308 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) <= 1) == (n == 0 || n == 1)"))]))
  let t4307 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t4327 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t4307])), t4308), @tactics.strip_tac), t4312), t4313), @canal.complex_diff_tac), t4314), t4315), t4322), t4326), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4306 = @simp.rewrite_tac(@list.List([@complexes.cx_sub(), @complexes.cx_neg(), @complexes.complex_mul_lneg(), @complexes.complex_mul_rneg(), @complexes.complex_neg_neg(), @complexes.complex_mul_rid()]))
  let t4304 = @calc_rat.real_arith(@term_syntax.parse_term("(k : Real) - (k + real_of_num(1)) == -real_of_num(1)"))
  let t4305 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub()), @complexes.complex_add_rid(), t4304]))
  let t4303 = @simp.rewrite_tac(@list.List([@complexes.complex_div_1(), @complexes.complex_pow(), @complexes.complex_pow_1(), @complexes.complex_vec_0()]))
  let t4302 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t4301 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith()]))
  let t4300 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.finite_insert(), @sets.finite_rules()]))
  let t4299 = @tactics.conv_tac(@equal.once_depth_conv(@iterate.numseg_conv))
  let t4298 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @arith.add_eq_0()]))
  let t4294 = @term_syntax.parse_term("1")
  let t4295 = @term_syntax.parse_term("Cx(real_of_num((k : Num)))")
  let t4296 = @term_syntax.parse_term("Cx(real_of_num((k : Num)) + real_of_num(1))")
  let t4297 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (z : Cart[Real, 2]) => if n == 0 { clog(z) } else { if n == 1 { inv(z) } else { -inv(pow(z, 2)) } }"), t4296, t4295, t4294]), @canal.complex_taylor_mvt()))
  let t4403 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())])), @tactics.gen_tac), @tactics.disch_tac), t4297), t4298), t4299), t4300), t4301), t4302), t4303), t4305), t4306), @tactics.ants_tac), t4327), t4335), t4342), @tactics.strip_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4343), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4344), t4345), t4350), t4357), t4358), t4359), t4363), t4370), t4371), t4376), t4380), t4382), t4383), t4384), t4385), t4386), t4387), t4391), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.conj_tac), t4393), t4394), t4398), t4399), t4400), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t4401), t4402), @calc_rat.asm_real_arith_tac)
  adhoc_bound_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, 1 <= k → abs((real_of_num(k) + real_of_num(1)) * (log(real_of_num(k) + real_of_num(1)) - log(real_of_num(k))) - real_of_num(1)) <= real_of_num(2) / real_of_num(k)"), t4403))
}

///|
let adhoc_bound_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADHOC_BOUND_LEMMA")

///|
/// `ADHOC_BOUND_LEMMA`
pub fn adhoc_bound_lemma() -> @kernel.Thm {
  adhoc_bound_lemma_c.get()
}

///|
/// REALLIM_MUL_SERIES
fn step_89() -> Unit raise {
  let t4496 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) + abs((B : Real))"))
  let t4497 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq(), t4496]))
  let t4495 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t4494 = @simp.gen_rewrite_tac(fn(x4491 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4492 = @equal.rand_conv(x4491)
    fn(x4493 : @kernel.Term) -> @kernel.Thm raise {
      s4492(x4493)
    }
  }, @list.List([@equal.gsym(@realarith.real_mul_rid())]))
  let t4490 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(e : Real) * (inv(real_of_num(2)) * (i : Real)) * (x : Real) == e * inv(real_of_num(2)) * (x * i)"))]))
  let t4489 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul()]))
  let t4487 = @calc_rat.real_arith(@term_syntax.parse_term("abs(real_of_num(1) + abs((B : Real))) == real_of_num(1) + abs(B)"))
  let t4488 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (n : Real) → abs(n) == n")), t4487]))
  let t4486 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @real.real_abs_div(), @calc_int.real_abs_num(), @equal.gsym(@realax.real_add_ldistrib()), @real.real_abs_mul()]))
  let t4483 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((d : Real) * abs((xN : Real)) + abs((yN : Real))) < (e : Real) / real_of_num(2) → d * abs(xN) == abs(d * xN) && abs(d * xN + (xn : Real)) <= e / real_of_num(2) → abs(yN) + xn < e")))
  let t4485 = @tactics.first_x_assum(fn(x4484 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t4483(x4484))
  })
  let t4480 = @int.arith_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num) → N <= n"))
  let t4481 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_lt_div(), t4480]))
  let t4479 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) && abs(x) < (y : Real) → x <= y")))
  let t4478 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4475 = @equal.gsym(@real.real_le_ldiv_eq())
  let t4476 = @int.arith_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num) → N <= n"))
  let t4477 = @simp.asm_simp_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg(), @real.real_abs_mul(), @real.real_abs_inv(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (n : Real) → abs(n) == n")), t4476, @real.real_le_rmul_eq(), @real.real_lt_inv_eq(), @realax.real_mul_assoc(), t4475]))
  let t4474 = @tactics.match_mp_tac(@iterate.sum_abs_le())
  let t4473 = @equal.gsym(@iterate.sum_rmul())
  let t4482 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@iterate.sum_lmul()), t4473])), t4474), t4477), t4478), t4479), t4481), @tactics.all_tac])
  let t4472 = @tactics.exists_tac(@term_syntax.parse_term("(e : Real) / (real_of_num(2) * (real_of_num(1) + abs((B : Real)))) * (sum(op_dot_dot((N : Num) + 1, (n : Num)), (x : (Num) -> Real)) / (z : (Num) -> Real)(n))"))
  let t4471 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ y' : Real, abs((y : Real)) <= y' && abs((x : Real)) + y' < (e : Real) → abs(x + y) < e")))
  let t4470 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc(), @equal.gsym(@realax.real_div())]))
  let t4468 = @int.arith_rule(@term_syntax.parse_term("(N : Num) + 1 <= (n : Num) → N <= n"))
  let t4469 = @list.List([@simp.asm_simp_tac(@list.List([@real.real_abs_div(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (n : Real) → abs(n) == n")), t4468])), @tactics.all_tac])
  let t4467 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, abs(x) / (z : (Num) -> Real)((n : Num)) == abs(x / z(n))"), fn(x4465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x4465
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t4464 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t4463 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t4462 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_add_rdistrib(), @real.real_sub_rdistrib()]))
  let t4461 = @tactics.disch_then(fn(x4459 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x4459
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(@iterate.sum_combine_r())(th))]))
  })
  let t4458 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (N : Num) + 1 && N <= (n : Num)"), fn(x4455 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4456 = @tactics.mp_tac(x4455)
    fn(x4457 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4456(x4457)
    }
  })
  let t4454 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4453 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1"))
  let t4452 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4451 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mp()))
  let t4450 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@metric.eventually_and())]))
  let t4449 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("eventually((n : Num) => abs(sum(op_dot_dot(1, n), (x : (Num) -> Real)) / (z : (Num) -> Real)(n)) <= (B : Real), sequentially)")))
  let t4448 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t4444 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t4447 = @tactics.disch_then(fn(x4446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4441 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4442 = @tactics.mp_tac(x4441)
      fn(x4443 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4442(x4443)
      }
    })(((x4445 : @kernel.Thm) => @bool.spec(t4444, x4445))(x4446))
  })
  let t4440 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realanalysis.tendsto_real(), @real.real_sub_rzero()]))
  let t4436 = @term_syntax.parse_term("(e : Real) / (real_of_num(2) * (real_of_num(1) + abs((B : Real)))) * abs(sum(op_dot_dot(1, (N : Num)), (x : (Num) -> Real))) + abs(sum(op_dot_dot(1, N), (y : (Num) -> Real)))")
  let t4439 = @tactics.disch_then(fn(x4438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4434 = @tactics.mp_tac(x4433)
      fn(x4435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4434(x4435)
      }
    })(((x4437 : @kernel.Thm) => @bool.spec(t4436, x4437))(x4438))
  })
  let t4430 = @drule.match_mp(@realanalysis.reallim_lmul())
  let t4432 = @tactics.disch_then(fn(x4431 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4427 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4428 = @tactics.mp_tac(x4427)
      fn(x4429 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4428(x4429)
      }
    })(t4430(x4431))
  })
  let t4426 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => inv((z : (Num) -> Real)(n)), real_of_num(0), sequentially)")))
  let t4425 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(@tactics.strip_assume_tac))
  let t4424 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t4423 = @simp.gen_rewrite_tac(fn(x4420 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4421 = @equal.land_conv(x4420)
    fn(x4422 : @kernel.Term) -> @kernel.Thm raise {
      s4421(x4422)
    }
  }, @list.List([@metric.eventually_sequentially()]))
  let t4419 = @simp.rewrite_tac(@list.List([@misc.real_half(), @theorems.imp_imp(), @equal.gsym(@metric.eventually_and())]))
  let t4418 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_div()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4414 = @term_syntax.parse_term("(e : Real) / (real_of_num(2) * (real_of_num(1) + abs((B : Real))))")
  let t4417 = @tactics.disch_then(fn(x4416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4412 = @tactics.mp_tac(x4411)
      fn(x4413 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4412(x4413)
      }
    })(((x4415 : @kernel.Thm) => @bool.spec(t4414, x4415))(x4416))
  })
  let t4410 = @simp.rewrite_tac(@list.List([@realanalysis.tendsto_real()]))
  let t4409 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => (y : (Num) -> Real)(n) / (x : (Num) -> Real)(n), real_of_num(0), sequentially)")))
  let t4408 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("eventually((n : Num) => real_of_num(0) < (x : (Num) -> Real)(n) && real_of_num(0) < (y : (Num) -> Real)(n) && real_of_num(0) < (z : (Num) -> Real)(n), sequentially)")))
  let t4407 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t4406 = @simp.rewrite_tac(@list.List([@realanalysis.tendsto_real()]))
  let t4405 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4404 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t4498 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.conj_assoc(), @equal.gsym(@metric.eventually_and())])), t4404), t4405), t4406), t4407), @tactics.disch_tac), t4408), t4409), t4410), t4417), @tactics.ants_tac), t4418), t4419), t4423), t4424), t4425), t4426), t4432), t4439), t4440), t4447), t4448), t4449), t4450), t4451), t4452), t4453), t4454), @tactics.disch_tac), t4458), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t4461), t4462), t4463), t4464), t4467), t4469), t4470), @tactics.strip_tac), t4471), t4472), @tactics.conj_tac), t4482), t4485), t4486), t4488), t4489), t4490), t4494), t4495), t4497), @calc_rat.asm_real_arith_tac)
  reallim_mul_series_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Real, ∀ y : (Num) -> Real, ∀ z : (Num) -> Real, ∀ B : Real, eventually((n : Num) => real_of_num(0) < x(n), sequentially) && eventually((n : Num) => real_of_num(0) < y(n), sequentially) && eventually((n : Num) => real_of_num(0) < z(n), sequentially) && op_minus_minus_minus_gt((n : Num) => inv(z(n)), real_of_num(0), sequentially) && eventually((n : Num) => abs(sum(op_dot_dot(1, n), x) / z(n)) <= B, sequentially) && op_minus_minus_minus_gt((n : Num) => y(n) / x(n), real_of_num(0), sequentially) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(1, n), y) / z(n), real_of_num(0), sequentially)"), t4498))
}

///|
let reallim_mul_series_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALLIM_MUL_SERIES")

///|
/// `REALLIM_MUL_SERIES`
pub fn reallim_mul_series() -> @kernel.Thm {
  reallim_mul_series_c.get()
}

///|
/// REALLIM_MUL_SERIES_LIM
fn step_90() -> Unit raise {
  let t4505 = @simp.asm_simp_tac(@list.List([@metric.always_eventually(), @sets.forall_in_image(), @sets.in_univ()]))
  let t4504 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t4503 = @simp.rewrite_tac(@list.List([@metric.real_bounded()]))
  let t4501 = @kernel.assume_rule(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(1, n), (x : (Num) -> Real)) / (z : (Num) -> Real)(n), (l : Real), sequentially)"))
  let t4502 = @tactics.mp_tac(@drule.match_mp(@realanalysis.real_convergent_imp_bounded())(t4501))
  let t4500 = @tactics.exists_tac(@term_syntax.parse_term("(x : (Num) -> Real)"))
  let t4499 = @tactics.match_mp_tac(reallim_mul_series())
  let t4506 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4499), t4500), t4502), t4503), t4504), t4505)
  reallim_mul_series_lim_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Num) -> Real, ∀ y : (Num) -> Real, ∀ z : (Num) -> Real, ∀ l : Real, eventually((n : Num) => real_of_num(0) < x(n), sequentially) && eventually((n : Num) => real_of_num(0) < y(n), sequentially) && eventually((n : Num) => real_of_num(0) < z(n), sequentially) && op_minus_minus_minus_gt((n : Num) => inv(z(n)), real_of_num(0), sequentially) && op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(1, n), x) / z(n), l, sequentially) && op_minus_minus_minus_gt((n : Num) => y(n) / x(n), real_of_num(0), sequentially) → op_minus_minus_minus_gt((n : Num) => sum(op_dot_dot(1, n), y) / z(n), real_of_num(0), sequentially)"), t4506))
}

///|
let reallim_mul_series_lim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALLIM_MUL_SERIES_LIM")

///|
/// `REALLIM_MUL_SERIES_LIM`
pub fn reallim_mul_series_lim() -> @kernel.Thm {
  reallim_mul_series_lim_c.get()
}

///|
/// PNT
fn step_91() -> Unit raise {
  let t5005 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t5004 = @simp.asm_simp_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @realarith.real_sub_le(), @int.arith_rule(@term_syntax.parse_term("real_of_num(2) < (x : Real) → real_of_num(0) <= x"))]))
  let t5003 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t5002 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t5001 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow((l : Real), 2) <= l / real_of_num(2)) == (real_of_num(0) <= (real_of_num(1) / real_of_num(2) - l) * l)"))]))
  let t5000 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("pow((l : Real), 2) <= l / real_of_num(2) → inv(real_of_num(2)) * l <= abs(l - pow(l, 2))")))
  let t4999 = @simp.rewrite_tac(@list.List([@real.real_inv_mul(), @realax.real_div(), @equal.gsym(@real.real_pow_inv()), @realax.real_mul_lid()]))
  let t4998 = @simp.rewrite_tac(@list.List([@real.real_lt_inv_eq()]))
  let t4997 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t4996 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(2) < (l : Real) → inv(l) * real_of_num(2) * pow(l, 2) == inv(inv(real_of_num(2) * l))"))]))
  let t4994 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) < (x : Real) → real_of_num(0) < x"))
  let t4995 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq(), @real.real_pow_lt(), t4994]))
  let t4993 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t4992 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t4991 = @simp.asm_simp_tac(@list.List([@real.real_abs_div(), @real.real_abs_inv(), @real.real_abs_pow(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) < (x : Real) → abs(x) == x"))]))
  let t4989 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t4988 = @tactics.match_mp_tac(@transcendentals.log_mono_lt_imp())
  let t4987 = @simp.simp_tac(@list.List([@equal.gsym(@transcendentals.log_pow()), @real.real_of_num_lt(), @calc_num.arith()]))
  let t4986 = @list.List([@tactics.then_tac(@tactics.mp_tac(@mangoldt.log_2_bounds()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4985 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) * log(real_of_num(2))"))
  let t4990 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_let_trans()), t4985), @tactics.conj_tac), t4986), t4987), t4988), t4989), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4984 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(2) < log(real_of_num((n : Num)) + real_of_num(1))"), fn(x4981 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4982 = @tactics.assume_tac(x4981)
    fn(x4983 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4982(x4983)
    }
  })
  let t4980 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4979 = @tactics.exists_tac(@term_syntax.parse_term("42"))
  let t4978 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4976 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t4974 = @drule.match_mp(@realanalysis.real_seq_offset())(@realanalysis.reallim_1_over_log())
  let t4975 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("1"), t4974))
  let t4973 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t4977 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t4973), t4975), t4976)])
  let t4972 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_of_num(2) / log(real_of_num(n) + real_of_num(1))"))
  let t4971 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t4966 = @simp.rewrite_tac(@list.List([@real.real_inv_div(), @equal.gsym(@realax.real_of_num_add())]))
  let t4965 = @drule.match_mp(@realanalysis.real_seq_offset())(@realanalysis.reallim_log_over_n())
  let t4967 = @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("1"), t4965)), t4966)
  let t4963 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1)"))
  let t4964 = @simp.simp_tac(@list.List([@real.real_lt_inv_eq(), @transcendentals.log_pos_lt(), @real.real_pow_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(1) < x + real_of_num(1)")), @realax.real_of_num_le(), @real.real_lt_div(), t4963]))
  let t4962 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4968 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t4962), t4964)
  let t4961 = @simp.simp_tac(@list.List([@real.real_lt_inv_eq(), @transcendentals.log_pos_lt(), @real.real_pow_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(1) < x + real_of_num(1)")), @realax.real_of_num_le()]))
  let t4960 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4969 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t4960), t4961)
  let t4959 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t4958 = @tactics.match_mp_tac(@transcendentals.log_mono_lt_imp())
  let t4957 = @simp.simp_tac(@list.List([@equal.gsym(@transcendentals.log_pow()), @real.real_of_num_lt(), @calc_num.arith()]))
  let t4956 = @list.List([@tactics.then_tac(@tactics.mp_tac(@mangoldt.log_2_bounds()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4955 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) * log(real_of_num(2))"))
  let t4954 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t4953 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(1) < log(real_of_num((n : Num)) + real_of_num(1))"), fn(x4950 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x4950
    let t4952 = @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) < pow(x, 2)) == (real_of_num(0) < x * (x - real_of_num(1)))"))
    @simp.simp_tac(@list.List([th_2, @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (x : Real) → real_of_num(0) < x")), @realarith.real_sub_lt(), @real.real_lt_mul(), t4952]))
  })
  let t4949 = @tactics.match_mp_tac(@real.real_lt_inv2())
  let t4948 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @realarith.real_sub_lt()]))
  let t4947 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4946 = @tactics.exists_tac(@term_syntax.parse_term("16"))
  let t4970 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t4946), t4947), t4948), t4949), t4953), t4954), t4955), @tactics.conj_tac), t4956), t4957), t4958), t4959), @calc_rat.asm_real_arith_tac), t4969, t4968, t4967, @tactics.all_tac])
  let t4945 = @tactics.repeat_tac(@tactics.conj_tac)
  let t4944 = @simp.asm_rewrite_tac(@list.List([]))
  let t4942 = @term_syntax.parse_term("real_of_num(1)")
  let t4943 = @tactics.map_every(fn(x4939 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4940 = @tactics.exists_tac(x4939)
    fn(x4941 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4940(x4941)
    }
  }, @list.List([@term_syntax.parse_term("(n : Num) => real_of_num(1) / log(real_of_num(n) + real_of_num(1)) - real_of_num(1) / pow(log(real_of_num(n) + real_of_num(1)), 2)"), t4942]))
  let t4938 = @tactics.match_mp_tac(reallim_mul_series_lim())
  let t4937 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t4936 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t4935 = @simp.rewrite_tac(@list.List([@realax.real_div(), @iterate.sum_lmul(), @equal.gsym(@realax.real_mul_assoc())]))
  let t4933 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t4932 = @tactics.match_mp_tac(@transcendentals.log_le())
  let t4931 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t4930 = @simp.asm_rewrite_tac(@list.List([]))
  let t4929 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t4928 = @simp.asm_simp_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_lt_imp_le()]))
  let t4927 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t4926 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @real.real_inv_mul()]))
  let t4925 = @simp.asm_simp_tac(@list.List([@real.real_le_inv_eq(), @realax.real_le_mul(), @realarith.real_pos(), @realarith.real_lt_imp_le()]))
  let t4923 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @real.real_of_num_lt()]))
  let t4924 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.log_pos_lt()), t4923), @int.asm_arith_tac), @tactics.all_tac])
  let t4922 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < log(real_of_num((m : Num)) + real_of_num(1))"), fn(x4919 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4920 = @tactics.assume_tac(x4919)
    fn(x4921 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4920(x4921)
    }
  })
  let t4918 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && y <= (x : Real) → abs(real_of_num(1) * x + real_of_num(2) * y) <= real_of_num(3) * x")))
  let t4917 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t4916 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t4915 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t4914 = @tactics.match_mp_tac(@iterate.sum_abs_le())
  let t4912 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t4911 = @list.List([@tactics.match_mp_tac(@transcendentals.log_pos()), @tactics.all_tac])
  let t4910 = @tactics.match_mp_tac(@real.real_le_div())
  let t4913 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_inv_div(), @calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= x) == (real_of_num(0) <= x)"))])), t4910), @tactics.conj_tac), t4911), t4912), @calc_rat.asm_real_arith_tac)])
  let t4909 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t4908 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4907 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4906 = @simp.once_rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t4905 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t4904 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4934 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t4904), @tactics.disch_tac), t4905), t4906), t4907), t4908), t4909), @tactics.conj_tac), t4913), t4914), t4915), t4916), @tactics.strip_tac), t4917), t4918), t4922), t4924), t4925), t4926), t4927), t4928), t4929), t4930), t4931), t4932), t4933), @tactics.all_tac])
  let t4903 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4902 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => sum(op_dot_dot(1, n), (k : Num) => real_of_num(3) / pow(log(real_of_num(k) + real_of_num(1)), 2)) / ((real_of_num(n) + real_of_num(1)) / log(real_of_num(n) + real_of_num(1)))"))
  let t4901 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t4899 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_le()]))
  let t4898 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t4897 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= x) == (real_of_num(0) <= x)")), @real.real_le_inv_eq()]))
  let t4896 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), adhoc_bound_lemma()]))
  let t4895 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4894 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4893 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t4892 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_neg(), @real.real_abs_mul(), @realax.real_div(), @real.real_inv_mul()]))
  let t4891 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) / (l : Real) - (m1 : Real) / l * (x : Real) == -((m1 * x - real_of_num(1)) / l)"))]))
  let t4889 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_le()]))
  let t4888 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t4887 = @tactics.match_mp_tac(@real.real_pow_le())
  let t4890 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @real.real_le_inv_eq()])), t4887), t4888), t4889), @int.asm_arith_tac), @tactics.all_tac])
  let t4886 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && abs((a : Real) - (b : Real)) <= (y : Real) → abs(a - x - b) <= x + y")))
  let t4885 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t4884 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t4883 = @tactics.match_mp_tac(@iterate.sum_abs_le())
  let t4881 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t4880 = @list.List([@tactics.match_mp_tac(@transcendentals.log_pos()), @tactics.all_tac])
  let t4879 = @tactics.match_mp_tac(@real.real_le_div())
  let t4882 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_inv_div(), @calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= x) == (real_of_num(0) <= x)"))])), t4879), @tactics.conj_tac), t4880), t4881), @calc_rat.asm_real_arith_tac)])
  let t4878 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t4877 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t4876 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t4875 = @simp.once_rewrite_tac(@list.List([@real.real_abs_mul()]))
  let t4874 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t4873 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4900 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t4873), @tactics.disch_tac), t4874), t4875), t4876), t4877), t4878), @tactics.conj_tac), t4882), t4883), t4884), t4885), @tactics.strip_tac), t4886), @tactics.conj_tac), t4890), t4891), t4892), t4893), t4894), t4895), t4896), t4897), t4898), t4899), @int.asm_arith_tac), @tactics.all_tac])
  let t4872 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4871 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => sum(op_dot_dot(1, n), (k : Num) => real_of_num(1) / pow(log(real_of_num(k) + real_of_num(1)), 2) + real_of_num(2) / (real_of_num(k) * log(real_of_num(k) + real_of_num(1)))) / ((real_of_num(n) + real_of_num(1)) / log(real_of_num(n) + real_of_num(1)))"))
  let t4870 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t4869 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_sub_numseg())]))
  let t4868 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t4867 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_sub_rdistrib())]))
  let t4866 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t4860 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t4858 = @drule.match_mp(@realanalysis.real_seq_offset())(@realanalysis.reallim_log_over_n())
  let t4859 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("1"), t4858))
  let t4857 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_inv_div()]))
  let t4856 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t4854 = @tactics.pop_assum(fn(x4851 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4852 = @tactics.mp_tac(x4851)
    fn(x4853 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4852(x4853)
    }
  })
  let t4850 = @tactics.match_mp_tac(@transcendentals.log_pos_lt())
  let t4848 = @tactics.conv_tac(@calc_rat.real_field)
  let t4849 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.pop_assum(fn(x4845 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4846 = @tactics.mp_tac(x4845)
    fn(x4847 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4846(x4847)
    }
  }), t4848)])
  let t4844 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < log(real_of_num((n : Num)) + real_of_num(1))"), fn(x4841 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4842 = @tactics.assume_tac(x4841)
    fn(x4843 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4842(x4843)
    }
  })
  let t4840 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4839 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4838 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t4837 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4836 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t4835 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const()]))
  let t4834 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => real_of_num(1)"))
  let t4855 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_transform_eventually()), t4834), t4835), t4836), t4837), t4838), t4839), t4840), t4844), t4849), t4850), t4854), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4833 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t4832 = @simp.gen_rewrite_tac(fn(x4829 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4830 = @equal.land_conv(x4829)
    fn(x4831 : @kernel.Term) -> @kernel.Thm raise {
      s4830(x4831)
    }
  }, @list.List([@equal.gsym(@calc_int.real_add_rid())]))
  let t4828 = @simp.once_rewrite_tac(@list.List([@real.real_add_rdistrib()]))
  let t4861 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t4828), t4832), t4833), @tactics.conj_tac), t4855), t4856), t4857), t4859), t4860)
  let t4825 = @equal.gsym(@complexes.cx_sub())
  let t4826 = @equal.gsym(@complexes.cx_div())
  let t4827 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_pow()), t4826, t4825, @complexes.re_cx()]))
  let t4823 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1) && real_of_num(0) < real_of_num(n) + real_of_num(2)"))
  let t4824 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @calc_num.arith(), t4823]))
  let t4822 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4820 = @calc_rat.real_arith(@term_syntax.parse_term("(n : Real) + real_of_num(1) + real_of_num(1) == n + real_of_num(2)"))
  let t4821 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t4820]))
  let t4816 = @kernel.assume_rule(@term_syntax.parse_term("16 <= (n : Num)"))
  let t4819 = @tactics.first_assum(fn(x4818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4815 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4812 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4813 = @tactics.mp_tac(x4812)
        fn(x4814 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4813(x4814)
        }
      })(@bool.conjunct2(x4815))
    })((fn(x4817 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x4817)(t4816)
    })(x4818))
  })
  let t4811 = @tactics.disch_then(fn(x4809 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x4809
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(@iterate.sum_combine_r())(th_1))]))
  })
  let t4808 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= 15 + 1 && 15 <= (n : Num)"), fn(x4805 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4806 = @tactics.mp_tac(x4805)
    fn(x4807 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4806(x4807)
    }
  })
  let t4802 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t4801 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t4800 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t4803 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_le_inv_eq()])), t4800), t4801), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t4802), @calc_rat.real_arith_tac)
  let t4804 = @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())])), t4803])
  let t4799 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t4798 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t4797 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4796 = @tactics.exists_tac(@term_syntax.parse_term("16"))
  let t4862 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t4796), t4797), @tactics.strip_tac), t4798), t4799), @tactics.conj_tac), t4804), t4808), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t4811), t4819), t4821), t4822), t4824), t4827), @calc_rat.real_arith_tac)
  let t4795 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t4793 = @drule.match_mp(@realanalysis.real_seq_offset())(@realanalysis.reallim_log_over_n())
  let t4794 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("1"), t4793))
  let t4792 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_inv_div()]))
  let t4791 = @tactics.match_mp_tac(@realanalysis.reallim_null_lmul())
  let t4789 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t4788 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv()]))
  let t4787 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t4786 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4784 = @equal.gsym(@realax.real_add_assoc())
  let t4785 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t4784]))
  let t4781 = @drule.match_mp(@realanalysis.real_seq_offset())
  let t4778 = @term_syntax.parse_term("1")
  let t4783 = @tactics.disch_then(fn(x4782 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4780 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4775 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4776 = @tactics.mp_tac(x4775)
        fn(x4777 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4776(x4777)
        }
      })(((x4779 : @kernel.Thm) => @bool.spec(t4778, x4779))(x4780))
    })(t4781(x4782))
  })
  let t4774 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t4771 = @drule.match_mp(@realanalysis.reallim_mul())
  let t4773 = @tactics.disch_then(fn(x4772 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4769 = @tactics.mp_tac(x4768)
      fn(x4770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4769(x4770)
      }
    })(t4771(x4772))
  })
  let t4790 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.conj(reallim_log_over_log1(), @bool.spec(@term_syntax.parse_term("real_of_num(1)"), reallim_na_over_n()))), t4773), t4774), t4783), t4785), t4786), t4787), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t4788), t4789), @tactics.all_tac])
  let t4767 = @tactics.match_mp_tac(@realanalysis.reallim_add())
  let t4766 = @simp.gen_rewrite_tac(fn(x4763 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4764 = @equal.land_conv(x4763)
    fn(x4765 : @kernel.Term) -> @kernel.Thm raise {
      s4764(x4765)
    }
  }, @list.List([@equal.gsym(@calc_int.real_add_rid())]))
  let t4762 = @simp.once_rewrite_tac(@list.List([@real.real_add_rdistrib()]))
  let t4863 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div()])), t4762), t4766), t4767), @tactics.conj_tac), t4790), t4791), t4792), t4794), t4795)
  let t4759 = @equal.gsym(@complexes.cx_sub())
  let t4760 = @equal.gsym(@complexes.cx_div())
  let t4761 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_pow()), t4760, t4759, @complexes.re_cx()]))
  let t4757 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num((n : Num)) + real_of_num(1) && real_of_num(0) < real_of_num(n) + real_of_num(2)"))
  let t4758 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), @real.real_of_num_lt(), @calc_num.arith(), t4757]))
  let t4756 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4754 = @calc_rat.real_arith(@term_syntax.parse_term("(n : Real) + real_of_num(1) + real_of_num(1) == n + real_of_num(2)"))
  let t4755 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t4754]))
  let t4750 = @kernel.assume_rule(@term_syntax.parse_term("16 <= (n : Num)"))
  let t4753 = @tactics.first_assum(fn(x4752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x4746 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4747 = @tactics.mp_tac(x4746)
        fn(x4748 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4747(x4748)
        }
      })(@bool.conjunct1(x4749))
    })((fn(x4751 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x4751)(t4750)
    })(x4752))
  })
  let t4745 = @tactics.disch_then(fn(x4743 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x4743
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(@iterate.sum_combine_r())(th))]))
  })
  let t4742 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= 15 + 1 && 15 <= (n : Num)"), fn(x4739 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4740 = @tactics.mp_tac(x4739)
    fn(x4741 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4740(x4741)
    }
  })
  let t4736 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t4735 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t4734 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t4737 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_le_inv_eq()])), t4734), t4735), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t4736), @calc_rat.real_arith_tac)
  let t4738 = @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())])), t4737])
  let t4733 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t4732 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t4731 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4730 = @tactics.exists_tac(@term_syntax.parse_term("16"))
  let t4864 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t4730), t4731), @tactics.strip_tac), t4732), t4733), @tactics.conj_tac), t4738), t4742), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t4745), t4753), t4755), t4756), t4758), t4761), @calc_rat.real_arith_tac), t4863, t4862, t4861])
  let t4729 = @tactics.repeat_tac(@tactics.strip_tac)
  let t4726 = @tactics.then_tac(@tactics.match_mp_tac(@transcendentals.log_mono_le_imp()), @calc_rat.asm_real_arith_tac)
  let t4727 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.log_pos_lt()), @calc_rat.asm_real_arith_tac), t4726])
  let t4724 = @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())
  let t4723 = @simp.simp_tac(@list.List([@equal.gsym(@transcendentals.log_pow()), @real.real_of_num_lt(), @calc_num.arith()]))
  let t4722 = @list.List([@tactics.then_tac(@tactics.mp_tac(@mangoldt.log_2_bounds()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4721 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) * log(real_of_num(2))"))
  let t4725 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t4721), @tactics.conj_tac), t4722), t4723), t4724), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4720 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4719 = @tactics.match_mp_tac(@real.real_le_inv2())
  let t4718 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= inv(real_of_num(2)) && (y : Real) <= x → y + x <= real_of_num(1) && real_of_num(0) <= x - y")))
  let t4717 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t4716 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - pow(x, 2) <= (y : Real) - pow(y, 2)) == ((x + y) * (y - x) <= real_of_num(1) * (y - x))"))]))
  let t4715 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @equal.gsym(@real.real_pow_inv())]))
  let t4712 = @equal.gsym(@complexes.cx_pow())
  let t4713 = @equal.gsym(@complexes.cx_sub())
  let t4714 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_div()), t4713, @complexes.re_cx(), t4712]))
  let t4709 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(15) <= (x : Real) → real_of_num(0) < x + real_of_num(1)"))
  let t4710 = @equal.gsym(@transcendentals.cx_log())
  let t4711 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cx_add()), t4710, @complexes.re_cx(), t4709]))
  let t4708 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(15) <= (y : Real)"), fn(x4705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4706 = @tactics.assume_tac(x4705)
    fn(x4707 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4706(x4707)
    }
  })
  let t4703 = @term_syntax.parse_term("(y : Real)")
  let t4704 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Real)"), t4703]))
  let t4701 = @tactics.match_mp_tac(@transcendentals.log_pos_lt())
  let t4700 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t4697 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(15) <= (z : Real) → real_of_num(0) < z + real_of_num(1)"))
  let t4698 = @equal.gsym(@transcendentals.cx_log())
  let t4699 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.cx_add()), t4698, @complexes.re_cx(), @complexes.real_cx(), t4697, @complexes.cx_inj()]))
  let t4696 = @tactics.disch_then(fn(x4695 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4692 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4693 = @tactics.subst1_tac(x4692)
      fn(x4694 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4693(x4694)
      }
    })(@equal.sym(x4695))
  })
  let t4691 = @simp.rewrite_tac(@list.List([@complexes.real_v1()]))
  let t4688 = @simp.gen_rewrite_rule(fn(x4687 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4687
  }, @list.List([@equal.gsym(@complexes.real())]))
  let t4690 = @tactics.first_x_assum(fn(x4689 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4684 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4685 = @tactics.mp_tac(x4684)
      fn(x4686 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4685(x4686)
      }
    })(t4688(x4689))
  })
  let t4682 = @simp.simp_tac(@list.List([@complexes.re_add(), @complexes.re_cx()]))
  let t4678 = @term_syntax.parse_term("Re")
  let t4681 = @tactics.disch_then(fn(x4680 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4675 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4676 = @tactics.mp_tac(x4675)
      fn(x4677 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4676(x4677)
      }
    })(((x4679 : @kernel.Thm) => @equal.ap_term(t4678, x4679))(x4680))
  })
  let t4674 = @list.List([@tactics.all_tac, @tactics.conv_tac(@complexes.complex_field)])
  let t4683 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) + Cx(real_of_num(1)) == Cx(real_of_num(0)))"), fn(x4671 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4672 = @tactics.mp_tac(x4671)
    fn(x4673 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4672(x4673)
    }
  }), t4674), t4681), t4682), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4670 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && a → a && b")))
  let t4669 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_cx(), @equal.gsym(@theorems.conj_assoc())]))
  let t4668 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t4667 = @simp.rewrite_tac(@list.List([@complexes.in_segment_cx_gen()]))
  let t4702 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t4667), t4668), @tactics.strip_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), @canal.complex_diff_tac), t4669), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4670), @tactics.conj_tac), t4683), t4690), t4691), t4696), t4699), t4700), t4701), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4728 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), @tactics.disch_tac), @tactics.conj_tac), t4702), t4704), @tactics.strip_tac), t4708), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4711), t4714), t4715), t4716), t4717), t4718), @tactics.conj_tac), t4719), t4720), t4725), @tactics.conj_tac), t4727), @tactics.all_tac])
  let t4666 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4665 = @simp.asm_rewrite_tac(@list.List([]))
  let t4664 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ n : _, (P : (_) -> Bool)(n) → (Q : (_) -> Bool)(n)) && ((∀ n : _, P(n) → (R : (_) -> Bool)(n)) → (s : Bool)) → (∀ n : _, P(n) && Q(n) → R(n)) → s")))
  let t4659 = @term_syntax.parse_term("(n : Num)")
  let t4660 = @term_syntax.parse_term("16")
  let t4661 = @term_syntax.parse_term("(z : Cart[Real, 2]) => (z + Cx(real_of_num(1))) / clog(z + Cx(real_of_num(1)))")
  let t4662 = @bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => Cx(real_of_num(1)) / clog(z + Cx(real_of_num(1))) - Cx(real_of_num(1)) / pow(clog(z + Cx(real_of_num(1))), 2)"), t4661, t4660, t4659]), @canal.sum_integral_bounds_decreasing())
  let t4663 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(n : Num)"), t4662))
  let t4658 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => ((real_of_num(n) + real_of_num(1)) / log(real_of_num(n) + real_of_num(1)) + (sum(op_dot_dot(1, 15), (k : Num) => real_of_num(1) / log(real_of_num(k) + real_of_num(1)) - real_of_num(1) / pow(log(real_of_num(k) + real_of_num(1)), 2)) - real_of_num(16) / log(real_of_num(16)))) / ((real_of_num(n) + real_of_num(1)) / log(real_of_num(n) + real_of_num(1)))"))
  let t4657 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => ((real_of_num(n) + real_of_num(2)) / log(real_of_num(n) + real_of_num(2)) + (sum(op_dot_dot(1, 15), (k : Num) => real_of_num(1) / log(real_of_num(k) + real_of_num(1)) - real_of_num(1) / pow(log(real_of_num(k) + real_of_num(1)), 2)) - real_of_num(17) / log(real_of_num(17)))) / ((real_of_num(n) + real_of_num(1)) / log(real_of_num(n) + real_of_num(1)))"))
  let t4865 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_transform_straddle()), t4657), t4658), t4663), t4664), t4665), t4666), @tactics.conj_tac), t4728), t4729), t4864), @tactics.all_tac])
  let t4656 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && (b → (a : Bool)) → a && b")))
  let t4655 = @simp.rewrite_tac(@list.List([]))
  let t4654 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => sum(op_dot_dot(1, n), (k : Num) => real_of_num(1) / log(real_of_num(k) + real_of_num(1)) - real_of_num(1) / pow(log(real_of_num(k) + real_of_num(1)), 2)) / ((real_of_num(n) + real_of_num(1)) / log(real_of_num(n) + real_of_num(1)))"))
  let t4653 = @tactics.match_mp_tac(@realanalysis.reallim_transform())
  let t4652 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * ((x : Real) - (y : Real)) + ((s : Real) + a * (y - x)) == s"))]))
  let t4650 = @equal.gsym(@realax.real_of_num_add())
  let t4651 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), t4650]))
  let t4648 = @int.arith_rule(@term_syntax.parse_term("1 <= SUC((i : Num))"))
  let t4649 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @iterate.sum_clauses_numseg(), t4648]))
  let t4647 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4646 = @tactics.match_mp_tac(@realanalysis.real_seq_offset_rev())
  let t4644 = @simp.simp_tac(@list.List([@realax.real_of_num_add(), @transcendentals.log_1(), @calc_int.real_mul_lzero(), @real.real_sub_rzero()]))
  let t4643 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4645 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t4643), t4644), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4642 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => ((real_of_num(n) + real_of_num(1)) / log(real_of_num(n) + real_of_num(1)) * (log(real_of_num(n)) - log(real_of_num(n) + real_of_num(1))) + sum(op_dot_dot(1, n), (k : Num) => (real_of_num(k) + real_of_num(1)) / log(real_of_num(k) + real_of_num(1)) * (log(real_of_num(k) + real_of_num(1)) - log(real_of_num(k))))) / (real_of_num(n) / log(real_of_num(n)))"))
  let t4641 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t4640 = @simp.once_rewrite_tac(@list.List([@iterate.sum_partial_suc()]))
  let t4639 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add()]))
  let t4637 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t4636 = @tactics.match_mp_tac(@transcendentals.log_mono_le_imp())
  let t4635 = @simp.simp_tac(@list.List([@equal.gsym(@transcendentals.log_pow()), @real.real_of_num_lt(), @calc_num.arith()]))
  let t4634 = @list.List([@tactics.then_tac(@tactics.mp_tac(@mangoldt.log_2_bounds()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4633 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) * log(real_of_num(2))"))
  let t4632 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t4631 = @tactics.match_mp_tac(@real.real_inv_le_1())
  let t4629 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t4628 = @tactics.match_mp_tac(@transcendentals.log_pos())
  let t4630 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_le_inv_eq()])), t4628), t4629), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4627 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t4626 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow((x : Real), 2) <= x) == (x * x <= x * real_of_num(1))"))]))
  let t4625 = @simp.rewrite_tac(@list.List([@realarith.real_sub_le()]))
  let t4624 = @tactics.disch_then(fn(x4621 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4622 = @tactics.subst1_tac(x4621)
    fn(x4623 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4622(x4623)
    }
  })
  let t4620 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @real.real_add_sub(), @realarith.real_mul_rid()]))
  let t4619 = @simp.gen_rewrite_tac(fn(x4616 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4617 = @equal.rand_conv(x4616)
    fn(x4618 : @kernel.Term) -> @kernel.Thm raise {
      s4617(x4618)
    }
  }, @list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t4610 = @equal.gsym(@complexes.cx_mul())
  let t4611 = @equal.gsym(@complexes.cx_div())
  let t4612 = @equal.gsym(@complexes.cx_sub())
  let t4613 = @equal.gsym(@complexes.cx_inv())
  let t4614 = @equal.gsym(@complexes.cx_pow())
  let t4615 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), t4614, t4613, t4612, t4611, @complexes.re_cx(), t4610]))
  let t4609 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())]))), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4608 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < Re((z : Cart[Real, 2])) && real_of_num(0) < real_of_num((n : Num)) && real_of_num(0) < real_of_num(n) + real_of_num(1)"), @tactics.strip_assume_tac)
  let t4607 = @tactics.disch_then(fn(x4606 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4604 = @tactics.subst1_tac(x4603)
      fn(x4605 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4604(x4605)
      }
    })(@equal.sym(x4606))
  })
  let t4602 = @simp.rewrite_tac(@list.List([@complexes.real_v1()]))
  let t4599 = @simp.gen_rewrite_rule(fn(x4598 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4598
  }, @list.List([@equal.gsym(@complexes.real())]))
  let t4601 = @tactics.first_x_assum(fn(x4600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4596 = @tactics.mp_tac(x4595)
      fn(x4597 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4596(x4597)
      }
    })(t4599(x4600))
  })
  let t4593 = @tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x4590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4591 = @tactics.mp_tac(x4590)
    fn(x4592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4591(x4592)
    }
  })
  let t4594 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Cart[Real, 2])"))(t4593))
  let t4588 = @tactics.match_mp_tac(@transcendentals.log_pos_lt())
  let t4587 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t4586 = @simp.rewrite_tac(@list.List([@complexes.cx_inj()]))
  let t4584 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(16) <= (x : Real) → real_of_num(0) < x"))
  let t4585 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.cx_log()), t4584]))
  let t4583 = @tactics.disch_then(fn(x4582 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4580 = @tactics.subst1_tac(x4579)
      fn(x4581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4580(x4581)
      }
    })(@equal.sym(x4582))
  })
  let t4578 = @simp.rewrite_tac(@list.List([@complexes.real_v1()]))
  let t4575 = @simp.gen_rewrite_rule(fn(x4574 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x4574
  }, @list.List([@equal.gsym(@complexes.real())]))
  let t4577 = @tactics.first_x_assum(fn(x4576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4572 = @tactics.mp_tac(x4571)
      fn(x4573 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4572(x4573)
      }
    })(t4575(x4576))
  })
  let t4570 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < Re((z : Cart[Real, 2]))"), fn(x4567 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4568 = @tactics.assume_tac(x4567)
    fn(x4569 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4568(x4569)
    }
  })
  let t4565 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_cx(), @complexes.im_cx()]))
  let t4564 = @list.List([@tactics.all_tac, @tactics.conv_tac(@complexes.complex_field)])
  let t4566 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0)))"), fn(x4561 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4562 = @tactics.mp_tac(x4561)
    fn(x4563 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4562(x4563)
    }
  }), t4564), t4565), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4560 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && a → a && b")))
  let t4559 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t4558 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t4589 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.strip_tac), @canal.complex_diff_tac), t4558), t4559), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4560), @tactics.conj_tac), t4566), t4570), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4577), t4578), t4583), t4585), t4586), t4587), t4588), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4557 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!((n : Real) + real_of_num(1) <= (x : Real) && x <= n)"))]))
  let t4556 = @simp.rewrite_tac(@list.List([@complexes.in_segment_cx_gen()]))
  let t4552 = @term_syntax.parse_term("Cx(real_of_num((n : Num)) + real_of_num(1))")
  let t4553 = @term_syntax.parse_term("Cx(real_of_num((n : Num)))")
  let t4554 = @term_syntax.parse_term("(z : Cart[Real, 2]) => inv(clog(z)) - pow(inv(clog(z)), 2)")
  let t4555 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => z / clog(z)"), t4554, t4553, t4552]), @canal.complex_mvt_line()))
  let t4551 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t4549 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t4548 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv()]))
  let t4547 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t4546 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t4544 = @equal.gsym(@realax.real_add_assoc())
  let t4545 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t4544]))
  let t4543 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t4540 = @drule.match_mp(@realanalysis.reallim_mul())
  let t4542 = @tactics.disch_then(fn(x4541 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4537 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4538 = @tactics.mp_tac(x4537)
      fn(x4539 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4538(x4539)
      }
    })(t4540(x4541))
  })
  let t4550 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.conj(reallim_log_over_log1(), @bool.spec(@term_syntax.parse_term("real_of_num(1)"), reallim_na_over_n()))), t4542), t4543), t4545), t4546), t4547), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t4548), t4549)])
  let t4536 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_log_over_n()]))
  let t4535 = @simp.simp_tac(@list.List([@real.real_lt_div(), @transcendentals.log_pos_lt(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("16 <= (n : Num) → 0 < n && 1 < n"))]))
  let t4534 = @simp.rewrite_tac(@list.List([@real.real_inv_div()]))
  let t4533 = @simp.rewrite_tac(@list.List([mertens_limit()]))
  let t4532 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm()]))
  let t4531 = @tactics.exists_tac(@term_syntax.parse_term("16"))
  let t4530 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t4529 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t4528 = @tactics.match_mp_tac(sum_partial_limit_alt())
  let t4527 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add()]))
  let t4525 = @equal.gsym(@real.real_sub_rdistrib())
  let t4526 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_sub_numseg()), t4525]))
  let t4638 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) * (x : Real) - (s : Real)) / (b : Real) - (a * (x' : Real) - (s' : Real)) / b == (s' - s - (x' - x) * a) / b"))])), t4526), t4527), t4528), t4529), t4530), t4531), t4532), t4533), t4534), t4535), t4536), @tactics.conj_tac), t4550), t4551), @tactics.disch_tac), t4555), t4556), t4557), @tactics.ants_tac), t4589), t4594), t4601), t4602), t4607), t4608), t4609), t4615), t4619), t4620), t4624), t4625), t4626), t4627), @tactics.conj_tac), t4630), t4631), t4632), t4633), @tactics.conj_tac), t4634), t4635), t4636), t4637), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t4524 = @simp.rewrite_tac(@list.List([]))
  let t4523 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => ((real_of_num(n) + real_of_num(1)) / log(real_of_num(n) + real_of_num(1)) * log(real_of_num(n)) - sum(op_dot_dot(1, n), (k : Num) => log(real_of_num(k)) * ((real_of_num(k) + real_of_num(1)) / log(real_of_num(k) + real_of_num(1)) - real_of_num(k) / log(real_of_num(k))))) / (real_of_num(n) / log(real_of_num(n)))"))
  let t4522 = @tactics.match_mp_tac(@realanalysis.reallim_transform())
  let t4520 = @simp.simp_tac(@list.List([]))
  let t4519 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t4521 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t4519), t4520), @tactics.all_tac])
  let t4518 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => ((real_of_num(n) + real_of_num(1)) / log(real_of_num(n) + real_of_num(1)) * sum({(p : Num) | prime(p) && p <= n}, (p : Num) => log(real_of_num(p)) / real_of_num(p)) - sum(op_dot_dot(1, n), (k : Num) => sum({(p : Num) | prime(p) && p <= k}, (p : Num) => log(real_of_num(p)) / real_of_num(p)) * ((real_of_num(k) + real_of_num(1)) / log(real_of_num(k) + real_of_num(1)) - real_of_num(k) / log(real_of_num(k))))) / (real_of_num(n) / log(real_of_num(n)))"))
  let t4517 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t4516 = @simp.rewrite_tac(@list.List([@iterate.sum_clauses(), @calc_int.real_mul_rzero(), @real.real_sub_rzero()]))
  let t4514 = @meson.meson_tac(@list.List([@prime.prime_imp_nz()]))
  let t4515 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()])), t4514), @tactics.all_tac])
  let t4513 = @tactics.subgoal_then(@term_syntax.parse_term("{(p : Num) | prime(p) && p == 0} == {}"), fn(x4510 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4511 = @tactics.subst1_tac(x4510)
    fn(x4512 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4511(x4512)
    }
  })
  let t4508 = @bool.conjunct1(@arith.le())
  let t4509 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @arith.sub_refl(), t4508]))
  let t4507 = @simp.rewrite_tac(@list.List([@iterate.sum_partial_pre()]))
  let t5006 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([pnt_partial_summation()])), t4507), t4509), t4513), t4515), t4516), t4517), t4518), @tactics.conj_tac), t4521), t4522), t4523), t4524), @tactics.conj_tac), t4638), t4639), t4640), t4641), t4642), @tactics.conj_tac), t4645), t4646), t4647), t4649), t4651), t4652), t4653), t4654), t4655), t4656), @tactics.conj_tac), t4865), @tactics.disch_tac), t4866), t4867), t4868), t4869), t4870), t4871), t4872), @tactics.conj_tac), t4900), t4901), t4902), t4903), @tactics.conj_tac), t4934), t4935), t4936), t4937), t4938), t4943), t4944), t4945), t4970), t4971), t4972), @tactics.conj_tac), t4977), t4978), t4979), t4980), @tactics.disch_tac), t4984), t4990), t4991), t4992), t4993), t4995), t4996), t4997), t4998), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t4999), t5000), t5001), t5002), t5003), t5004), t5005), @calc_rat.asm_real_arith_tac)
  pnt_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((n : Num) => real_of_num(CARD({(p : Num) | prime(p) && p <= n})) / (real_of_num(n) / log(real_of_num(n))), real_of_num(1), sequentially)"), t5006))
}

///|
let pnt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PNT")

///|
/// `PNT`
pub fn pnt() -> @kernel.Thm {
  pnt_c.get()
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
}
