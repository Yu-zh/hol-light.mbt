// Translated from upstream Examples/sylvester_gallai.ml; edit this file directly.

///|
/// SYLVESTER_GALLAI_LEMMA
fn step_1() -> Unit raise {
  let t117 = @simp.asm_simp_tac(@list.List([@calc_num.arith_eq(), @real.real_lt_rdiv_eq(), @real.real_le_ldiv_eq()]))
  let t116 = @simp.simp_tac(@list.List([@calc_num.arith_eq(), @realarith.real_sub_le(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (x : Real) < real_of_num(1)) == (real_of_num(0) < x)"))]))
  let t115 = @tactics.match_mp_tac(@real.real_pow_1_lt())
  let t114 = @simp.rewrite_tac(@list.List([@realarith.real_sub_lt()]))
  let t113 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t112 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t111 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) * real_of_num(0) + (u : Real) * (p : Real) * (u * p) < p * p) == (real_of_num(0) < (real_of_num(1) - u * u) * (p * p))"))]))
  let t110 = @simp.asm_simp_tac(@list.List([@real.real_div_rmul(), @real.real_lt_imp_nz(), @real.real_sub_refl()]))
  let t118 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(b : Real) / (c : Real)")), t110), t111), t112), t113), t114), t115), t116), t117), @calc_rat.asm_real_arith_tac)
  let t109 = @simp.asm_simp_tac(@list.List([@real.real_div_rmul(), @real.real_lt_imp_nz(), @realarith.real_lt_add()]))
  let t108 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((u : Real) * (c : Real) < (real_of_num(2) - u) * (p : Real)) == (u * (p + c) < real_of_num(2) * p)"))]))
  let t107 = @simp.asm_simp_tac(@list.List([@real.real_lt_lmul_eq(), @real.real_lt_div(), @realarith.real_lt_add()]))
  let t106 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((real_of_num(0) - (u : Real) * (c : Real)) * (real_of_num(0) - u * c) + (real_of_num(1) - u) * (p : Real) * ((real_of_num(1) - u) * p) < p * p) == (u * (u * pow(c, 2)) < u * ((real_of_num(2) - u) * pow(p, 2)))"))]))
  let t119 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("pow((p : Real), 2) / (pow(p, 2) + pow((c : Real), 2))")), t106), t107), t108), t109), @calc_rat.asm_real_arith_tac), t118])
  let t105 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Real) == real_of_num(0)"))
  let t103 = @simp.asm_rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square(), @realarith.real_entire()]))
  let t104 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (x : Real)) == (real_of_num(0) <= x && !(x == real_of_num(0)))"))])), t103), @tactics.all_tac])
  let t102 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < pow((c : Real), 2) && real_of_num(0) < pow((p : Real), 2)"), @tactics.strip_assume_tac)
  let t101 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid(), @real.real_sub_rzero()]))
  let t100 = @simp.simp_tac(@list.List([@vectors.dot_basis_basis(), @cart.dimindex_2(), @calc_num.arith(), @calc_int.real_mul_rzero()]))
  let t99 = @simp.rewrite_tac(@list.List([@vectors.dot_lmul(), @vectors.dot_rmul()]))
  let t98 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("dot((a : Cart[Real, _]) - (b : Cart[Real, _]), a - b) == dot(a, a) + (dot(b, b) - real_of_num(2) * dot(a, b))"))]))
  let t97 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_lt(), @equal.gsym(@vectors.dot_pos_lt())]))
  let t96 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc(), @equal.gsym(@vectors.vector_sub_rdistrib())]))
  let t95 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(b : Cart[Real, 2]) - ((p : Cart[Real, 2]) + op_pct((u : Real), (c : Cart[Real, 2]) - p)) == b - op_pct(u, c) - op_pct(real_of_num(1) - u, p)"))]))
  let t93 = @simp.asm_rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t92 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t91 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("(real_of_num(0) == (p : Real) + (u : Real) * (real_of_num(0) - p)) == (p == real_of_num(0) || u == real_of_num(1))"))]))
  let t90 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid(), @calc_int.real_mul_rzero(), @realax.real_add_lid()]))
  let t89 = @simp.simp_tac(@list.List([@vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t88 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_sub_component(), @vectors.vector_mul_component()]))
  let t94 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2()])), t88), t89), t90), t91), t92), t93), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t87 = @simp.rewrite_tac(@list.List([@convex.affine_hull_2_alt(), @sets.exists_in_gspec(), @sets.in_univ(), @vectors.norm_lt()]))
  let t85 = @simp.simp_tac(@list.List([@vectors.vector_mul_component(), @vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t84 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2()]))
  let t83 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero()]))
  let t79 = @term_syntax.parse_term("real_of_num(0)")
  let t82 = @tactics.disch_then(fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x76 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s77 = @tactics.mp_tac(x76)
      fn(x78 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s77(x78)
      }
    })(((x80 : @kernel.Thm) => @bool.spec(t79, x80))(x81))
  })
  let t73 = @simp.gen_rewrite_rule(fn(x72 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x72
  }, @list.List([@class.not_exists_thm()]))
  let t75 = @tactics.first_x_assum(fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s70 = @tactics.mp_tac(x69)
      fn(x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s70(x71)
      }
    })(t73(x74))
  })
  let t86 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("op_dollar((pp : Cart[Real, 2]), 2)")), t75), t82), t83), t84), t85), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t67 = @tactics.choose_then(@tactics.conjuncts_then2(fn(x61 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s62 = @tactics.assume_tac(x61)
    fn(x63 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s62(x63)
    }
  }, fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s65 = @tactics.subst_all_tac(x64)
    fn(x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s65(x66)
    }
  }))
  let t68 = @tactics.subgoal_then(@term_syntax.parse_term("∃ p : Real, !(p == real_of_num(0)) && (pp : Cart[Real, 2]) == op_pct(p, basis(2))"), t67)
  let t60 = @simp.asm_rewrite_tac(@list.List([]))
  let t57 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((c : Real)) == abs((b : Real)) + abs(b - c) → real_of_num(0) < c → real_of_num(0) <= b && (b < c || b == c)")))
  let t59 = @tactics.disch_then(fn(x58 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x54 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s55 = @tactics.mp_tac(x54)
      fn(x56 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s55(x56)
      }
    })(t57(x58))
  })
  let t53 = @simp.simp_tac(@list.List([@vectors.norm_basis(), @realarith.real_mul_rid(), @cart.dimindex_2(), @calc_num.arith()]))
  let t52 = @simp.rewrite_tac(@list.List([@vectors.dist(), @equal.gsym(@vectors.vector_sub_rdistrib()), @vectors.norm_mul()]))
  let t51 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.between_in_segment()), @vectors.between(), @vectors.dist_0()]))
  let t48 = @simp.gen_rewrite_rule(fn(x45 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s46 = @equal.rand_conv(x45)
    fn(x47 : @kernel.Term) -> @kernel.Thm raise {
      s46(x47)
    }
  }, @list.List([@equal.gsym(@convex.segment_convex_hull())]))
  let t50 = @tactics.first_x_assum(fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x42 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s43 = @tactics.mp_tac(x42)
      fn(x44 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s43(x44)
      }
    })(t48(x49))
  })
  let t41 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_rcancel(), @vectors.basis_nonzero(), @cart.dimindex_2(), @calc_num.arith()]))
  let t40 = @simp.asm_simp_tac(@list.List([@realarith.real_entire(), @real.real_lt_imp_nz(), @vectors.vector_mul_eq_0()]))
  let t39 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realarith.real_mul_rid(), @calc_int.real_add_rid()]))
  let t38 = @simp.simp_tac(@list.List([@vectors.vector_mul_component(), @vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t37 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_rzero(), @vectors.orthogonal(), @vectors.dot_2()]))
  let t36 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s31 = @tactics.assume_tac(x30)
    fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s31(x32)
    }
  }, fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s34 = @tactics.mp_tac(x33)
    fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s34(x35)
    }
  }))
  let t29 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Real) == (bc : Real) * (c : Real)"))
  let t28 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(bc : Real)"))(fn(x25 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s26 = @tactics.subst_all_tac(x25)
    fn(x27 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s26(x27)
    }
  }))
  let t24 = @simp.rewrite_tac(@list.List([@vectors.span_sing(), @sets.in_elim_thm(), @sets.in_univ(), @vectors.vector_mul_assoc()]))
  let t23 = @simp.simp_tac(@list.List([@convex.affine_hull_eq_span(), @misc.hull_inc(), @sets.in_insert(), @vectors.span_insert_0()]))
  let t20 = @drule.match_mp(@simp.rewrite_rule(@list.List([@sets.subset()]))(@convex.convex_hull_subset_affine_hull()))
  let t22 = @tactics.first_assum(fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s18 = @tactics.mp_tac(x17)
      fn(x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s18(x19)
      }
    })(t20(x21))
  })
  let t16 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x10 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s11 = @tactics.assume_tac(x10)
    fn(x12 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s11(x12)
    }
  }, fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s14 = @tactics.mp_tac(x13)
    fn(x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s14(x15)
    }
  }))
  let t9 = @simp.rewrite_tac(@list.List([@topology.between_in_segment(), @convex.segment_convex_hull()]))
  let t7 = @term_syntax.parse_term("(bb : Cart[Real, 2])")
  let t8 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(pp : Cart[Real, 2])"), t7]))
  let t6 = @simp.asm_rewrite_tac(@list.List([@realarith.real_le_lt()]))
  let t5 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero()]))
  let t4 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Real) == real_of_num(0)"))
  let t3 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Real)"))
  let t1 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t120 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@determinants.geom_origin_tac(@term_syntax.parse_term("(q : Cart[Real, 2])")), (x2 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_basis_multiple_tac(1L, t1, x2)), t3), t4), t5), t6), @tactics.disch_tac), t8), t9), t16), t22), t23), t24), t28), t29), t36), t37), t38), t39), t40), t41), @tactics.strip_tac), t50), t51), t52), t53), t59), t60), @tactics.strip_tac), t68), t86), t87), @tactics.conj_tac), t94), t95), t96), t97), t98), t99), t100), t101), t102), t104), t105), t119)
  sylvester_gallai_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 2], ∀ q : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], between(b, (q, c)) && !IN(p, hull(affine, {q, c})) && orthogonal(p - q, c - q) && !(c == b) && !(c == q) → !IN(b, hull(affine, {p, c})) && (∃ x : Cart[Real, 2], IN(x, hull(affine, {p, c})) && distance((b, x)) < distance((p, q)))"), t120))
}

///|
let sylvester_gallai_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYLVESTER_GALLAI_LEMMA")

///|
/// `SYLVESTER_GALLAI_LEMMA`
pub fn sylvester_gallai_lemma() -> @kernel.Thm {
  sylvester_gallai_lemma_c.get()
}

///|
/// cases_quick
fn step_2() -> Unit raise {
  let t137 = @simp.asm_rewrite_tac(@list.List([]))
  let t136 = @class.asm_cases_tac(@term_syntax.parse_term("abs((v : Real)) == real_of_num(0)"))
  let t135 = @simp.rewrite_tac(@list.List([@real.real_eq_mul_rcancel()]))
  let t134 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid(), @equal.gsym(@real.real_add_rdistrib())]))
  let t133 = @simp.simp_tac(@list.List([@vectors.norm_mul(), @vectors.norm_basis(), @cart.dimindex_ge_1(), @arith.le_refl()]))
  let t132 = @simp.asm_rewrite_tac(@list.List([@vectors.between(), @vectors.dist(), @equal.gsym(@vectors.vector_sub_rdistrib())]))
  let t131 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_univ()]))
  let t130 = @simp.rewrite_tac(@list.List([@vectors.span_insert_0(), @vectors.span_sing(), @sets.insert_subset(), @sets.empty_subset()]))
  let t129 = @simp.simp_tac(@list.List([@convex.affine_hull_eq_span(), @misc.hull_inc(), @sets.in_insert()]))
  let t128 = @tactics.repeat_tac(@tactics.gen_tac)
  let t126 = @term_syntax.parse_term("(v : Cart[Real, N])")
  let t125 = @determinants.geom_origin_tac(@term_syntax.parse_term("(u : Cart[Real, N])"))
  let t123 = @term_syntax.parse_term("(v : Cart[Real, N])")
  let t124 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Cart[Real, N])"), t123]))
  let t122 = @simp.rewrite_tac(@list.List([@convex.collinear_affine_hull(), @theorems.left_imp_exists_thm()]))
  let t121 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t138 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t121), t122), t124), t125), (x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_basis_multiple_tac(1L, t126, x127)), @tactics.gen_tac), @tactics.disch_tac), t128), t129), t130), t131), @tactics.strip_tac), t132), t133), t134), t135), t136), t137), @calc_rat.real_arith_tac)
  cases_quick_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, N], ∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ c : Cart[Real, N], collinear({q, a, b, c}) && between(b, (a, c)) → between(b, (q, a)) || between(b, (q, c))"), t138))
}

///|
let cases_quick_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cases_quick")

///|
/// `cases_quick`
pub fn cases_quick() -> @kernel.Thm {
  cases_quick_c.get()
}

///|
/// cases_lemma
fn step_3() -> Unit raise {
  let t153 = @simp.rewrite_tac(@list.List([@sets.insert_ac()]))
  let t152 = @tactics.pop_assum(fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s150 = @tactics.mp_tac(x149)
    fn(x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s150(x151)
    }
  })
  let t148 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(cases_quick()))
  let t146 = @tactics.match_mp_tac(@theorems.mono_or())
  let t147 = @tactics.repeat_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) || (c : Bool) || (d : Bool)) == ((a || b) || c || d)"))])), t146), @tactics.conj_tac))
  let t154 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.collinear_between_cases()])), t147), t148), t152), t153)
  let t145 = @sets.set_tac(@list.List([]))
  let t143 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@vectors.collinear_subset()))
  let t155 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x144 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t143(x144))
  }), t145), t154])
  let t142 = @tactics.subgoal_then(@term_syntax.parse_term("collinear({(a : Cart[Real, N]), (b : Cart[Real, N]), (c : Cart[Real, N])})"), fn(x139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s140 = @tactics.mp_tac(x139)
    fn(x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s140(x141)
    }
  })
  let t156 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t142), t155)
  cases_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, N], ∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ c : Cart[Real, N], collinear({q, a, b, c}) → between(a, (q, b)) || between(a, (q, c)) || between(b, (q, c)) || between(b, (q, a)) || between(c, (q, a)) || between(c, (q, b))"), t156))
}

///|
let cases_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cases_lemma")

///|
/// `cases_lemma`
pub fn cases_lemma() -> @kernel.Thm {
  cases_lemma_c.get()
}

///|
/// SYLVESTER_GALLAI
fn step_4() -> Unit raise {
  let t312 = @simp.asm_rewrite_tac(@list.List([@convex.closed_affine_hull()]))
  let t311 = @tactics.match_mp_tac(@topology.closest_point_le())
  let t308 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(rb : Real) < (qp : Real) → (cb : Real) <= rb → !(qp <= cb)")))
  let t310 = @tactics.first_x_assum(fn(x309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t308(x309))
  })
  let t307 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t313 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)"))), t307), t310), t311), t312)
  let t306 = @meson.asm_meson_tac(@list.List([]))
  let t305 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t304 = @simp.expand_tac("L")
  let t303 = @simp.asm_simp_tac(@list.List([@topology.closest_point_refl(), @convex.closed_affine_hull(), @convex.affine_hull_eq_empty(), @sets.not_insert_empty()]))
  let t302 = @simp.rewrite_tac(@list.List([@vectors.dist_pos_le(), @vectors.dist_eq_0()]))
  let t314 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (x : Real)) == (real_of_num(0) <= x && !(x == real_of_num(0)))"))])), t302), t303), t304), t305), t306), t313])
  let t301 = @simp.asm_rewrite_tac(@list.List([]))
  let t295 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t296 = @term_syntax.parse_term("hull(affine, {(p : Cart[Real, 2]), (c : Cart[Real, 2])})")
  let t297 = @list.List([@term_syntax.parse_term("distance((closest_point(hull(affine, {(p : Cart[Real, 2]), (c : Cart[Real, 2])}), (b : Cart[Real, 2])), b))"), t296, t295])
  let t300 = @tactics.first_x_assum(fn(x299 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s293 = @tactics.mp_tac(x292)
      fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s293(x294)
      }
    })(((x298 : @kernel.Thm) => @bool.specl(t297, x298))(x299))
  })
  let t315 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s290 = @tactics.assume_tac(x289)
    fn(x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s290(x291)
    }
  }, @tactics.x_choose_then(@term_syntax.parse_term("(r : Cart[Real, 2])"))(@tactics.strip_assume_tac))), t300), t301), @tactics.ants_tac), t314)
  let t287 = @simp.asm_rewrite_tac(@list.List([]))
  let t286 = @tactics.match_mp_tac(@convex.closest_point_affine_orthogonal())
  let t285 = @simp.once_rewrite_tac(@list.List([@vectors.orthogonal_sym()]))
  let t288 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("q"), t285), t286), t287)
  let t284 = @simp.asm_rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t283 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t282 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset())]))
  let t280 = @term_syntax.parse_term("(p : Cart[Real, 2])")
  let t281 = @tactics.spec_tac(@term_syntax.parse_term("(p : Cart[Real, 2])"), t280)
  let t279 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t316 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!IN((p : Cart[Real, 2]), (l : (Cart[Real, 2]) -> Bool))")), t279), t281), t282), t283), t284), t288])), t315])
  let t278 = @simp.asm_rewrite_tac(@list.List([]))
  let t274 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t275 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t276 = @term_syntax.parse_term("(q : Cart[Real, 2])")
  let t277 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(p : Cart[Real, 2])"), t276, t275, t274]), sylvester_gallai_lemma()))
  let t273 = @list.List([@meson.asm_meson_tac(@list.List([@topology.closest_point_self(), @vectors.dist_eq_0(), @realarith.real_lt_refl()])), @tactics.all_tac])
  let t272 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((p : Cart[Real, 2]), (l : (Cart[Real, 2]) -> Bool))"), fn(x269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s270 = @tactics.assume_tac(x269)
    fn(x271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s270(x271)
    }
  })
  let t268 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.between_refl_eq()])), @tactics.all_tac])
  let t267 = @tactics.subgoal_then(@term_syntax.parse_term("!((c : Cart[Real, 2]) == (q : Cart[Real, 2]))"), fn(x264 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s265 = @tactics.assume_tac(x264)
    fn(x266 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s265(x266)
    }
  })
  let t261 = @meson.asm_meson_tac(@list.List([]))
  let t260 = @simp.asm_rewrite_tac(@list.List([]))
  let t258 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t259 = @tactics.map_every(fn(x255 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s256 = @tactics.exists_tac(x255)
    fn(x257 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s256(x257)
    }
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t258]))
  let t262 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.collinear_affine_hull(), @sets.insert_subset(), @sets.empty_subset()])), t259), t260), t261])
  let t251 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t252 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t253 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t254 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(q : Cart[Real, 2])"), t253, t252, t251]), cases_lemma()))
  let t249 = @simp.simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()]))
  let t250 = @list.List([@tactics.then_tac(@simp.expand_tac("l"), t249), @tactics.all_tac])
  let t248 = @tactics.subgoal_then(@term_syntax.parse_term("IN((a : Cart[Real, 2]), (l : (Cart[Real, 2]) -> Bool)) && IN((b : Cart[Real, 2]), l)"), @tactics.strip_assume_tac)
  let t247 = @simp.asm_simp_tac(@list.List([@convex.collinear_3_affine_hull()]))
  let t246 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t244 = @tactics.choose_then(fn(x241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s242 = @tactics.mp_tac(x241)
    fn(x243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s242(x243)
    }
  })
  let t245 = @tactics.subgoal_then(@term_syntax.parse_term("∃ c : Cart[Real, 2], IN(c, (s : (Cart[Real, 2]) -> Bool)) && !(c == (a : Cart[Real, 2])) && !(c == (b : Cart[Real, 2])) && collinear({a, b, c})"), t244)
  let t240 = @tactics.disch_then(fn(x239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x239))
  })
  let t237 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t238 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t237]))
  let t236 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t235 = @simp.expand_tac("L")
  let t263 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((l : (Cart[Real, 2]) -> Bool), (L : ((Cart[Real, 2]) -> Bool) -> Bool))")), t235), t236), t238), t240), t245), t246), t247), @tactics.strip_tac), t248), t250), t254), @tactics.ants_tac), t262), @tactics.all_tac])
  let t234 = @tactics.subgoal_then(@term_syntax.parse_term("∃ b : Cart[Real, 2], ∃ c : Cart[Real, 2], IN(b, (s : (Cart[Real, 2]) -> Bool)) && IN(c, s) && IN(b, (l : (Cart[Real, 2]) -> Bool)) && IN(c, l) && !(b == c) && between(b, ((q : Cart[Real, 2]), c))"), @tactics.strip_assume_tac)
  let t233 = @list.List([@meson.asm_meson_tac(@list.List([@topology.closest_point_in_set()])), @tactics.all_tac])
  let t232 = @tactics.subgoal_then(@term_syntax.parse_term("IN((q : Cart[Real, 2]), (l : (Cart[Real, 2]) -> Bool))"), fn(x229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s230 = @tactics.assume_tac(x229)
    fn(x231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s230(x231)
    }
  })
  let t228 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t227 = @tactics.disch_then(fn(x226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t225 = @simp.rewrite_tac(@list.List([@vectors.dist_nz()]))
  let t224 = @simp.abbrev_tac(@term_syntax.parse_term("(q : Cart[Real, 2]) == closest_point((l : (Cart[Real, 2]) -> Bool), (p : Cart[Real, 2]))"))
  let t221 = @drule.match_mp(@convex.closed_affine())
  let t223 = @tactics.first_assum(fn(x222 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x218 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s219 = @tactics.assume_tac(x218)
      fn(x220 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s219(x220)
      }
    })(t221(x222))
  })
  let t216 = @simp.rewrite_tac(@list.List([@convex.affine_hull_eq_empty(), @sets.not_insert_empty()]))
  let t215 = @simp.simp_tac(@list.List([@convex.closed_affine(), @convex.affine_affine_hull()]))
  let t214 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t213 = @simp.expand_tac("L")
  let t217 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((l : (Cart[Real, 2]) -> Bool), (L : ((Cart[Real, 2]) -> Bool) -> Bool))")), t213), t214), t215), t216), @tactics.all_tac])
  let t212 = @tactics.subgoal_then(@term_syntax.parse_term("affine((l : (Cart[Real, 2]) -> Bool)) && !(l == {})"), @tactics.strip_assume_tac)
  let t210 = @term_syntax.parse_term("(p : Cart[Real, 2])")
  let t211 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(l : (Cart[Real, 2]) -> Bool)"), t210]))
  let t209 = @simp.simp_tac(@list.List([@theorems.imp_conj(), @sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t207 = @meson.asm_meson_tac(@list.List([@convex.collinear_affine_hull(), @sets.subset_refl()]))
  let t206 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t205 = @simp.expand_tac("L")
  let t204 = @tactics.undisch_tac(@term_syntax.parse_term("IN((l : (Cart[Real, 2]) -> Bool), (L : ((Cart[Real, 2]) -> Bool) -> Bool))"))
  let t203 = @simp.asm_rewrite_tac(@list.List([@sets.subset()]))
  let t202 = @tactics.exists_tac(@term_syntax.parse_term("(l : (Cart[Real, 2]) -> Bool)"))
  let t201 = @tactics.match_mp_tac(@vectors.collinear_subset())
  let t199 = @simp.asm_simp_tac(@list.List([@topology.closest_point_refl()]))
  let t198 = @simp.rewrite_tac(@list.List([@convex.affine_hull_eq_empty(), @sets.not_insert_empty()]))
  let t197 = @simp.asm_simp_tac(@list.List([@convex.closed_affine(), @convex.affine_affine_hull()]))
  let t196 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t195 = @simp.expand_tac("L")
  let t200 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((l : (Cart[Real, 2]) -> Bool), (L : ((Cart[Real, 2]) -> Bool) -> Bool))")), t195), t196), @tactics.strip_tac), t197), t198), t199])
  let t194 = @tactics.subgoal_then(@term_syntax.parse_term("closed((l : (Cart[Real, 2]) -> Bool)) && !(l == {})"), fn(x191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s192 = @tactics.assume_tac(x191)
    fn(x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s192(x193)
    }
  })
  let t190 = @simp.asm_rewrite_tac(@list.List([]))
  let t186 = @term_syntax.parse_term("(l : (Cart[Real, 2]) -> Bool)")
  let t189 = @tactics.disch_then(fn(x188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s184 = @tactics.mp_tac(x183)
      fn(x185 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s184(x185)
      }
    })(((x187 : @kernel.Thm) => @bool.spec(t186, x187))(x188))
  })
  let t180 = @simp.gen_rewrite_rule(fn(x179 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x179
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t177 = @term_syntax.parse_term("(l : (Cart[Real, 2]) -> Bool)")
  let t182 = @tactics.first_x_assum(fn(x181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x178 : @kernel.Thm) => @tactics.x_choose_tac(t177, x178))(t180(x181))
  })
  let t176 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist_nz())]))
  let t208 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("({(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)} == {}) == (∀ x : _, IN(x, s) → !P(x))"))])), t176), t182), t189), t190), t194), t200), @tactics.disch_tac), t201), t202), t203), t204), t205), t206), @tactics.strip_tac), t207), @tactics.all_tac])
  let t175 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((p : Bool) → (r : Bool)) && ((q : Bool) → r) → (!p → q) → r")))
  let t174 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("({(f : (_, _) -> _)((x : _), (y : _)) | IN(x, (s : (_) -> Bool)) && IN(y, (t : (_, _) -> Bool)(x))} == {}) == (s == {} || (∀ x : _, IN(x, s) → t(x) == {}))"))]))
  let t173 = @simp.asm_simp_tac(@list.List([@sets.finite_product_dependent(), @sets.finite_restrict()]))
  let t172 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("{distance((closest_point((l : (Cart[Real, 2]) -> Bool), (p : Cart[Real, 2])), p)) | IN(l, (L : ((Cart[Real, 2]) -> Bool) -> Bool)) && IN(p, {(p : Cart[Real, 2]) | IN(p, (s : (Cart[Real, 2]) -> Bool)) && real_of_num(0) < distance((closest_point(l, p), p))})}"), @sets.inf_finite()))
  let t170 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t169 = @simp.expand_tac("L")
  let t171 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(L : ((Cart[Real, 2]) -> Bool) -> Bool) == {}")), t169), t170), @tactics.all_tac])
  let t168 = @class.asm_cases_tac(@term_syntax.parse_term("(L : ((Cart[Real, 2]) -> Bool) -> Bool) == {}"))
  let t166 = @simp.asm_simp_tac(@list.List([@sets.finite_product_dependent(), @sets.finite_restrict()]))
  let t165 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_, _) -> _)((x : _), (y : _)) | IN(x, (s : (_) -> Bool)) && IN(y, s) && (P : (_, _) -> Bool)(x, y)} == {f((x : _), (y : _)) | IN(x, s) && IN(y, {(y : _) | IN(y, s) && P(x, y)})}"))]))
  let t167 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("L"), t165), t166), @tactics.all_tac])
  let t164 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((L : ((Cart[Real, 2]) -> Bool) -> Bool))"), fn(x161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s162 = @tactics.assume_tac(x161)
    fn(x163 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s162(x163)
    }
  })
  let t160 = @simp.abbrev_tac(@term_syntax.parse_term("(L : ((Cart[Real, 2]) -> Bool) -> Bool) == {hull(affine, {(a : Cart[Real, 2]), (b : Cart[Real, 2])}) | IN(a, (s : (Cart[Real, 2]) -> Bool)) && IN(b, s) && !(a == b)}"))
  let t159 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.collinear_sing()])), @tactics.strip_tac])
  let t158 = @class.asm_cases_tac(@term_syntax.parse_term("∃ a : Cart[Real, 2], (s : (Cart[Real, 2]) -> Bool) == {a}"))
  let t157 = @simp.asm_rewrite_tac(@list.List([@vectors.collinear_empty()]))
  let t317 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool) == {}"))), t157), t158), t159), t160), t164), t167), t168), t171), t172), t173), t174), t175), @tactics.conj_tac), t208), t209), t211), @tactics.disch_tac), t212), t217), t223), t224), @tactics.disch_tac), t225), @tactics.disch_tac), t227), t228), @tactics.disch_tac), t232), t233), t234), t263), t267), t268), t272), t273), t277), t278), @tactics.ants_tac), t316)
  sylvester_gallai_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, FINITE(s) && (∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], IN(a, s) && IN(b, s) && !(a == b) → (∃ c : Cart[Real, 2], IN(c, s) && !(c == a) && !(c == b) && collinear({a, b, c}))) → collinear(s)"), t317))
}

///|
let sylvester_gallai_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYLVESTER_GALLAI")

///|
/// `SYLVESTER_GALLAI`
pub fn sylvester_gallai() -> @kernel.Thm {
  sylvester_gallai_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
}
