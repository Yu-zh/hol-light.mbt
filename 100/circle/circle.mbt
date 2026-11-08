// Translated from upstream 100/circle.ml; edit this file directly.

///|
/// AREA_UNIT_CBALL
fn step_1() -> Unit raise {
  let t59 = @simp.asm_simp_tac(@list.List([@misc.abs_square_lt_1(), @real.sqrt_pow_2(), @realarith.real_sub_le(), @realarith.real_lt_imp_le()]))
  let t58 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("pow((s : Real), 2) == real_of_num(1) - pow((x : Real), 2) && pow(x, 2) < real_of_num(1) → inv(s) + (x * (-(real_of_num(2) * x) * (inv(real_of_num(2)) * inv(s))) + s) == real_of_num(2) * s")))
  let t57 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_lt(), @misc.abs_square_lt_1()]))
  let t56 = @simp.rewrite_tac(@list.List([@real.real_sub_lzero(), @calc_int.real_mul_rneg(), @real.real_inv_mul()]))
  let t55 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @real.real_pow_1(), @realarith.real_mul_rid()]))
  let t54 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t53 = @tactics.repeat_tac(@tactics.strip_tac)
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval(), @real.real_bounds_lt()])), t53), @realanalysis.real_diff_tac), t54), t55), t56), t57), t58), t59)
  let t52 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_sqrt()]))
  let t51 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_on_sub(), @realanalysis.real_continuous_on_pow(), @realanalysis.real_continuous_on_id(), @realanalysis.real_continuous_on_const()]))
  let t50 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_compose())
  let t49 = @simp.gen_rewrite_tac(fn(x46 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s47 = @equal.land_conv(x46)
    fn(x48 : @kernel.Term) -> @kernel.Thm raise {
      s47(x48)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t45 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_id()]))
  let t44 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_mul())
  let t43 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_on_asn(), @misc.in_real_interval(), @real.real_bounds_le()]))
  let t61 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_on_add()), t43), t44), t45), t49), t50), t51), t52), t60])
  let t42 = @tactics.disch_then(@tactics.match_mp_tac)
  let t41 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) / real_of_num(2) - -(x / real_of_num(2)) == x"))]))
  let t40 = @simp.rewrite_tac(@list.List([@real.sqrt_0(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid()]))
  let t39 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t38 = @simp.rewrite_tac(@list.List([@transcendentals.asn_1(), @transcendentals.asn_neg_1()]))
  let t34 = @term_syntax.parse_term("real_of_num(1)")
  let t35 = @term_syntax.parse_term("-real_of_num(1)")
  let t36 = @term_syntax.parse_term("(x : Real) => real_of_num(2) * sqrt(real_of_num(1) - pow(x, 2))")
  let t37 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => asn(x) + x * sqrt(real_of_num(1) - pow(x, 2))"), t36, t35, t34]), @realanalysis.real_fundamental_theorem_of_calculus_interior()))
  let t32 = @simp.asm_simp_tac(@list.List([@real.sqrt_pos_le(), @realarith.real_sub_le(), @equal.gsym(@real.real_le_square_abs()), @calc_int.real_abs_num()]))
  let t31 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → -x <= x")))
  let t30 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.simp_tac(@list.List([@real.real_pow_one()])), @calc_rat.real_arith_tac)])
  let t29 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.drop_neg()]))
  let t23 = @drule.part_match(fn(x22 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x22))
  }, @integration.content_1())
  let t18 = @simp.rewrite_tac(@list.List([@real.real_bounds_le(), @vectors.vector_add_lid(), @vectors.vector_sub_lzero()]))
  let t17 = @simp.simp_tac(@list.List([@misc.in_real_interval(), @measure.measure_interval()]))
  let t33 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)")), t17), t18), @tactics.disch_tac), fn(x28 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x27 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x25 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x24 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x19 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s20 = @tactics.mp_tac(x19)
            fn(x21 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s20(x21)
            }
          })(t23(x24))
        })(@kernel.rand(x25))
      })((fn(x26 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x26.1
      })(x27))
    })(x28)(x28)
  }), t29), @tactics.ants_tac), t30), t31), t32), @tactics.all_tac])
  let t16 = @tactics.exists_tac(@term_syntax.parse_term("(t : Real) => real_of_num(2) * sqrt(real_of_num(1) - pow(t, 2))"))
  let t15 = @tactics.match_mp_tac(@realanalysis.has_real_integral_eq())
  let t14 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_restrict_univ(), @topology.ball_1()]))
  let t13 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t12 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Real, (abs(t) <= real_of_num(1)) == IN(t, real_interval([(-real_of_num(1), real_of_num(1))]))"), fn(x10 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x10
    @simp.rewrite_tac(@list.List([th]))
  })
  let t9 = @simp.rewrite_tac(@list.List([@measure.measure_empty()]))
  let t8 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t7 = @simp.rewrite_tac(@list.List([@vectors.vec_component(), @vectors.dropout_0(), @real.real_sub_rzero()]))
  let t6 = @simp.simp_tac(@list.List([@cart.dimindex_1(), @cart.dimindex_2(), @calc_num.arith(), @topology.compact_cball(), @realanalysis.slice_cball()]))
  let t5 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t2 = @parser.parse_type("N")
  let t3 = (@parser.parse_type("2"), t2)
  let t1 = @parser.parse_type("M")
  let t4 = @tactics.match_mp_tac(@kernel.inst_type(@list.List([(@parser.parse_type("1"), t1), t3]), @realanalysis.fubini_simple_compact()))
  let t62 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4), t5), t6), t7), t8), t9), t12), t13), t14), t15), t16), @tactics.conj_tac), t33), t37), t38), t39), t40), t41), t42), @tactics.conj_tac), t61)
  area_unit_cball_c.set(@tactics.prove(@term_syntax.parse_term("(measure : ((Cart[Real, 2]) -> Bool) -> Real)((cball : ((Cart[Real, 2], Real), Cart[Real, 2]) -> Bool)(((vec : (Num) -> Cart[Real, 2])(0), real_of_num(1)))) == pi"), t62))
}

///|
let area_unit_cball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AREA_UNIT_CBALL")

///|
/// `AREA_UNIT_CBALL`
pub fn area_unit_cball() -> @kernel.Thm {
  area_unit_cball_c.get()
}

///|
/// AREA_CBALL
fn step_2() -> Unit raise {
  let t110 = @simp.asm_rewrite_tac(@list.List([]))
  let t109 = @simp.once_rewrite_tac(@list.List([@vectors.norm_sub()]))
  let t108 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_le_ldiv_eq(), @realax.real_mul_lid()]))
  let t107 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t106 = @simp.asm_rewrite_tac(@list.List([@realax.real_abs()]))
  let t105 = @simp.rewrite_tac(@list.List([@vectors.norm_mul(), @real.real_abs_inv()]))
  let t104 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_assoc(), @real.real_mul_rinv()]))
  let t103 = @tactics.exists_tac(@term_syntax.parse_term("op_pct(inv((r : Real)), (w : Cart[Real, 2]) - (z : Cart[Real, 2]))"))
  let t102 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t101 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @real.real_le_lmul(), @vectors.dist()]))
  let t100 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((r : Real)) * (x : Real) <= r) == (abs(r) * x <= r * real_of_num(1))"))]))
  let t99 = @simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((z : Cart[Real, 2]), (a : Cart[Real, 2]) + z)) == norm(a)")), @vectors.norm_mul()]))
  let t98 = @simp.rewrite_tac(@list.List([@topology.in_cball()]))
  let t97 = @simp.rewrite_tac(@list.List([@topology.in_cball_0(), @sets.in_image()]))
  let t96 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image()]))
  let t95 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t94 = @tactics.disch_then(fn(x93 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s91 = @tactics.subst1_tac(x90)
      fn(x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s91(x92)
      }
    })(@equal.sym(x93))
  })
  let t89 = @simp.gen_rewrite_tac(fn(x88 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x82 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s83 = @equal.land_conv(x82)
      fn(x84 : @kernel.Term) -> @kernel.Thm raise {
        s83(x84)
      }
    })((fn(x85 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s86 = @equal.once_depth_conv(x85)
      fn(x87 : @kernel.Term) -> @kernel.Thm raise {
        s86(x87)
      }
    })(x88))
  }, @list.List([@realax.real_mul_sym()]))
  let t81 = @tactics.disch_then(fn(x80 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x77 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s78 = @tactics.mp_tac(x77)
      fn(x79 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s78(x79)
      }
    })(@bool.conjunct2(x80))
  })
  let t76 = @simp.asm_rewrite_tac(@list.List([@realax.real_abs(), @cart.dimindex_2()]))
  let t75 = @simp.rewrite_tac(@list.List([@measure.has_measure_measurable_measure(), @measure.measurable_cball(), area_unit_cball()]))
  let t71 = @term_syntax.parse_term("pi")
  let t72 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t73 = @term_syntax.parse_term("(r : Real)")
  let t74 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(cball : ((Cart[Real, 2], Real), Cart[Real, 2]) -> Bool)(((vec : (Num) -> Cart[Real, 2])(0), real_of_num(1)))"), t73, t72, t71]), @measure.has_measure_affinity()))
  let t70 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (r : Real)"), fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s68 = @tactics.assume_tac(x67)
    fn(x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s68(x69)
    }
  })
  let t65 = @simp.rewrite_tac(@list.List([@measure.has_measure_0(), @integration.negligible_sing()]))
  let t64 = @tactics.match_mp_tac(@measure.measure_unique())
  let t66 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@topology.cball_sing(), @realarith.real_pow_2(), @calc_int.real_mul_rzero()])), t64), t65), @tactics.all_tac])
  let t63 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Real) == real_of_num(0)"))
  let t111 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t63), t66), t70), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t74), t75), t76), t81), t89), t94), @tactics.ap_term_tac), t95), t96), t97), t98), t99), t100), t101), t102), @tactics.disch_tac), t103), t104), @tactics.conj_tac), @list.List([@vectors.norm_arith_tac, @tactics.all_tac])), t105), t106), t107), t108), t109), t110)
  area_cball_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ r : Real, real_of_num(0) <= r → measure(cball((z, r))) == pi * pow(r, 2)"), t111))
}

///|
let area_cball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AREA_CBALL")

///|
/// `AREA_CBALL`
pub fn area_cball() -> @kernel.Thm {
  area_cball_c.get()
}

///|
/// AREA_BALL
fn step_3() -> Unit raise {
  let t115 = @simp.simp_tac(@list.List([@topology.bounded_cball(), @measure.negligible_convex_frontier(), @convex.convex_cball()]))
  let t114 = @tactics.match_mp_tac(@measure.measure_interior())
  let t113 = @tactics.repeat_tac(@tactics.strip_tac)
  let t112 = @equal.gsym(area_cball())
  let t116 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@topology.interior_cball()), t112])), t113), t114), t115)
  area_ball_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ r : Real, real_of_num(0) <= r → measure(ball((z, r))) == pi * pow(r, 2)"), t116))
}

///|
let area_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AREA_BALL")

///|
/// `AREA_BALL`
pub fn area_ball() -> @kernel.Thm {
  area_ball_c.get()
}

///|
/// VOLUME_CBALL
fn step_4() -> Unit raise {
  let t146 = @tactics.conv_tac(@calc_rat.real_ring)
  let t147 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_imp()), @tactics.ap_thm_tac), @tactics.ap_term_tac), t146)
  let t145 = @tactics.conv_tac(@calc_rat.real_ring)
  let t144 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t143 = @tactics.repeat_tac(@tactics.strip_tac)
  let t148 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t143), @realanalysis.real_diff_tac), t144), t145), t147])
  let t142 = @simp.rewrite_tac(@list.List([]))
  let t138 = @term_syntax.parse_term("(r : Real)")
  let t139 = @term_syntax.parse_term("-(r : Real)")
  let t140 = @term_syntax.parse_term("(t : Real) => pi * (pow((r : Real), 2) - pow(t, 2))")
  let t141 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(t : Real) => pi * (pow((r : Real), 2) * t - real_of_num(1) / real_of_num(3) * pow(t, 3))"), t140, t139, t138]), @realanalysis.real_fundamental_theorem_of_calculus()))
  let t135 = @calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (r : Real) → abs(x) <= abs(r)"))
  let t136 = @simp.simp_tac(@list.List([area_cball(), @real.sqrt_pos_le(), @realarith.real_sub_le(), @equal.gsym(@real.real_le_square_abs()), @real.sqrt_pow_2(), t135]))
  let t134 = @simp.rewrite_tac(@list.List([@misc.in_real_interval(), @real.real_bounds_le()]))
  let t137 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)")), t134), t136), @tactics.all_tac])
  let t133 = @tactics.exists_tac(@term_syntax.parse_term("(t : Real) => pi * (pow((r : Real), 2) - pow(t, 2))"))
  let t132 = @tactics.match_mp_tac(@realanalysis.has_real_integral_eq())
  let t131 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_restrict_univ()]))
  let t130 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t129 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Real, (abs(t) <= (r : Real)) == IN(t, real_interval([(-r, r)]))"), fn(x127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x127
    @simp.rewrite_tac(@list.List([th]))
  })
  let t126 = @simp.rewrite_tac(@list.List([@measure.measure_empty()]))
  let t125 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t124 = @simp.rewrite_tac(@list.List([@vectors.vec_component(), @vectors.dropout_0(), @real.real_sub_rzero()]))
  let t123 = @simp.simp_tac(@list.List([@cart.dimindex_2(), @cart.dimindex_3(), @calc_num.arith(), @topology.compact_cball(), @realanalysis.slice_cball()]))
  let t122 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t119 = @parser.parse_type("N")
  let t120 = (@parser.parse_type("3"), t119)
  let t118 = @parser.parse_type("M")
  let t121 = @tactics.match_mp_tac(@kernel.inst_type(@list.List([(@parser.parse_type("2"), t118), t120]), @realanalysis.fubini_simple_compact()))
  let t117 = @tactics.repeat_tac(@tactics.strip_tac)
  let t149 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@determinants.geom_origin_tac(@term_syntax.parse_term("(z : Cart[Real, 3])")), t117), t121), t122), t123), t124), t125), t126), t129), t130), t131), t132), t133), @tactics.conj_tac), t137), t141), t142), @tactics.ants_tac), t148)
  volume_cball_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 3], ∀ r : Real, real_of_num(0) <= r → measure(cball((z, r))) == real_of_num(4) / real_of_num(3) * (pi * pow(r, 3))"), t149))
}

///|
let volume_cball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VOLUME_CBALL")

///|
/// `VOLUME_CBALL`
pub fn volume_cball() -> @kernel.Thm {
  volume_cball_c.get()
}

///|
/// VOLUME_BALL
fn step_5() -> Unit raise {
  let t153 = @simp.simp_tac(@list.List([@topology.bounded_cball(), @measure.negligible_convex_frontier(), @convex.convex_cball()]))
  let t152 = @tactics.match_mp_tac(@measure.measure_interior())
  let t151 = @tactics.repeat_tac(@tactics.strip_tac)
  let t150 = @equal.gsym(volume_cball())
  let t154 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@topology.interior_cball()), t150])), t151), t152), t153)
  volume_ball_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 3], ∀ r : Real, real_of_num(0) <= r → measure(ball((z, r))) == real_of_num(4) / real_of_num(3) * (pi * pow(r, 3))"), t154))
}

///|
let volume_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VOLUME_BALL")

///|
/// `VOLUME_BALL`
pub fn volume_ball() -> @kernel.Thm {
  volume_ball_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
}
