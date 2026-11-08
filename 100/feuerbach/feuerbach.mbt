// Translated from upstream 100/feuerbach.ml; edit this file directly.

///|
/// CIRCLES_TANGENT
fn step_1() -> Unit raise {
  let t115 = @tactics.conv_tac(@calc_rat.real_field)
  let t114 = @tactics.repeat_tac(@tactics.pop_assum(fn(x111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s112 = @tactics.mp_tac(x111)
    fn(x113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s112(x113)
    }
  }))
  let t110 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @vectors.vector_arith(@term_syntax.parse_term("((y : Cart[Real, 2]) == (c : Cart[Real, 2]) + op_pct((u : Real), op_pct((v : Real), y - c))) == (op_pct(real_of_num(1) - u * v, y - c) == vec(0))"))]))
  let t109 = @tactics.disch_then(fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s106 = @tactics.subst1_tac(x105)
      fn(x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s106(x107)
      }
    })(@equal.sym(x108))
  })
  let t104 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(c : Cart[Real, 2]) + op_pct((v : Real), c + op_pct((u : Real), (y : Cart[Real, 2]) - c) - c) == c + op_pct(v, op_pct(u, y - c))"))]))
  let t103 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_mul(), @equal.gsym(@vectors.dist()), @realax.real_abs()]))
  let t102 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("-op_pct((a : Real), (x : Cart[Real, N]) - (y : Cart[Real, N])) == op_pct(a, y - x)"))]))
  let t101 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.norm_neg())]))
  let t100 = @simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((x : Cart[Real, 2]) + (y : Cart[Real, 2]), x)) == norm(y)"))]))
  let t99 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (u : Real), (c1 : Cart[Real, N])) + op_pct(u, (c2 : Cart[Real, N])) == c1 + op_pct(u, c2 - c1)"))]))
  let t98 = @tactics.undisch_tac(@term_syntax.parse_term("distance((op_pct(real_of_num(1) - (u : Real), (c2 : Cart[Real, 2])) + op_pct(u, (y : Cart[Real, 2])), c2)) == (r2 : Real) - (r1 : Real)"))
  let t97 = @tactics.disch_then(fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s95 = @tactics.subst_all_tac(x94)
    fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s95(x96)
    }
  })
  let t92 = @meson.asm_meson_tac(@list.List([@vectors.dist_eq_0(), @realarith.real_sub_0()]))
  let t91 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lid()]))
  let t93 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_add_rid(), @real.real_sub_rzero()])), t91), t92), @tactics.all_tac])
  let t90 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Real) == real_of_num(0)"))
  let t89 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s84 = @tactics.assume_tac(x83)
    fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s84(x85)
    }
  }, fn(x86 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s87 = @tactics.mp_tac(x86)
    fn(x88 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s87(x88)
    }
  })))
  let t82 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s80 = @tactics.mp_tac(x79)
    fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s80(x81)
    }
  }))
  let t77 = @simp.rewrite_tac(@list.List([@topology.in_segment()]))
  let t76 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t78 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@equal.gsym(@topology.between_in_segment()), @vectors.between()])), t76), @calc_rat.asm_real_arith_tac), t77])
  let t75 = @tactics.subgoal_then(@term_syntax.parse_term("IN((c1 : Cart[Real, 2]), segment([((c2 : Cart[Real, 2]), (y : Cart[Real, 2]))]))"), fn(x72 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s73 = @tactics.mp_tac(x72)
    fn(x74 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s73(x74)
    }
  })
  let t116 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), @tactics.strip_tac), t75), t78), t82), t89), t90), t93), t97), t98), t99), t100), t101), t102), t103), t104), t109), t110), @tactics.disj1_tac), t114), t115)
  let t71 = @tactics.conv_tac(@calc_rat.real_field)
  let t70 = @tactics.repeat_tac(@tactics.pop_assum(fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s68 = @tactics.mp_tac(x67)
    fn(x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s68(x69)
    }
  }))
  let t66 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @realarith.real_sub_le(), @realarith.real_lt_imp_le()]))
  let t65 = @simp.asm_simp_tac(@list.List([@real.real_abs_div(), @calc_int.real_abs_neg(), @calc_rat.real_field(@term_syntax.parse_term("(r1 : Real) < (r2 : Real) → real_of_num(1) - r2 / (r2 - r1) == -(r1 / (r2 - r1))"))]))
  let t64 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_mul(), @vectors.norm_neg(), @equal.gsym(@vectors.dist())]))
  let t117 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.vector_arith(@term_syntax.parse_term("(c1 : Cart[Real, 2]) - (c1 + op_pct((a : Real), (x : Cart[Real, 2]) - (y : Cart[Real, 2]))) == -op_pct(a, x - y) && c1 - ((c2 : Cart[Real, 2]) + op_pct(a, c1 - c2)) == op_pct(real_of_num(1) - a, c1 - c2)"))])), t64), t65), t66), t70), t71), t116])
  let t63 = @tactics.exists_tac(@term_syntax.parse_term("(c2 : Cart[Real, 2]) + op_pct((r2 : Real) / (r2 - (r1 : Real)), (c1 : Cart[Real, 2]) - c2)"))
  let t62 = @simp.rewrite_tac(@list.List([@theorems.exists_unique()]))
  let t61 = @tactics.subgoal_then(@term_syntax.parse_term("(r1 : Real) < (r2 : Real)"), fn(x58 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s59 = @tactics.assume_tac(x58)
    fn(x60 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s59(x60)
    }
  })
  let t57 = @list.List([@meson.asm_meson_tac(@list.List([@real.real_sub_refl(), @vectors.dist_eq_0()])), @tactics.disj2_tac])
  let t118 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(r1 : Real) == (r2 : Real)")), t57), t61), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t62), t63), @tactics.conj_tac), t117)
  let t54 = @tactics.conv_tac(@calc_rat.real_field)
  let t53 = @tactics.repeat_tac(@tactics.pop_assum(fn(x50 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s51 = @tactics.mp_tac(x50)
    fn(x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s51(x52)
    }
  }))
  let t49 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_mul(), @equal.gsym(@vectors.dist()), @realax.real_abs()]))
  let t48 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("-op_pct((a : Real), (x : Cart[Real, N]) - (y : Cart[Real, N])) == op_pct(a, y - x)"))]))
  let t47 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.norm_neg())]))
  let t46 = @simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((x : Cart[Real, 2]), x + (y : Cart[Real, 2]))) == norm(y)"))]))
  let t45 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (u : Real), (c1 : Cart[Real, N])) + op_pct(u, (c2 : Cart[Real, N])) == c1 + op_pct(u, c2 - c1)"))]))
  let t44 = @tactics.undisch_tac(@term_syntax.parse_term("distance(((c1 : Cart[Real, 2]), op_pct(real_of_num(1) - (u : Real), c1) + op_pct(u, (c2 : Cart[Real, 2])))) == (r1 : Real)"))
  let t43 = @tactics.disch_then(fn(x40 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s41 = @tactics.subst_all_tac(x40)
    fn(x42 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s41(x42)
    }
  })
  let t39 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s34 = @tactics.assume_tac(x33)
    fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s34(x35)
    }
  }, fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s37 = @tactics.mp_tac(x36)
    fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s37(x38)
    }
  })))
  let t32 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s30 = @tactics.mp_tac(x29)
    fn(x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s30(x31)
    }
  }))
  let t27 = @simp.rewrite_tac(@list.List([@topology.in_segment()]))
  let t26 = @meson.asm_meson_tac(@list.List([@vectors.dist_sym()]))
  let t28 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@equal.gsym(@topology.between_in_segment()), @vectors.between()])), t26), t27])
  let t25 = @tactics.subgoal_then(@term_syntax.parse_term("IN((y : Cart[Real, 2]), segment([((c1 : Cart[Real, 2]), (c2 : Cart[Real, 2]))]))"), fn(x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s23 = @tactics.mp_tac(x22)
    fn(x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s23(x24)
    }
  })
  let t55 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), @tactics.strip_tac), t25), t28), t32), t39), t43), t44), t45), t46), t47), t48), t49), @tactics.disch_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t53), t54)
  let t21 = @tactics.conv_tac(@calc_rat.real_field)
  let t20 = @tactics.repeat_tac(@tactics.pop_assum(fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s18 = @tactics.mp_tac(x17)
    fn(x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s18(x19)
    }
  }))
  let t16 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @realarith.real_lt_imp_le(), @realarith.real_lt_add()]))
  let t15 = @simp.asm_simp_tac(@list.List([@real.real_abs_div(), @calc_int.real_abs_neg(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (r1 : Real) && real_of_num(0) < (r2 : Real) → r1 / (r1 + r2) - real_of_num(1) == -r2 / (r1 + r2)"))]))
  let t14 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_mul(), @equal.gsym(@vectors.dist())]))
  let t13 = @vectors.vector_arith(@term_syntax.parse_term("(z : Cart[Real, N]) - ((x : Cart[Real, N]) + op_pct((a : Real), z - x)) == op_pct(a - real_of_num(1), x - z)"))
  let t56 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.vector_arith(@term_syntax.parse_term("(c1 : Cart[Real, 2]) - (c1 + op_pct((a : Real), (x : Cart[Real, 2]) - (y : Cart[Real, 2]))) == op_pct(a, y - x)")), t13])), t14), t15), t16), t20), t21), t55])
  let t12 = @tactics.exists_tac(@term_syntax.parse_term("(c1 : Cart[Real, 2]) + op_pct((r1 : Real) / (r1 + (r2 : Real)), (c2 : Cart[Real, 2]) - c1)"))
  let t119 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @simp.rewrite_tac(@list.List([@theorems.exists_unique()]))), t12), @tactics.conj_tac), t56), t118])
  let t11 = @simp.asm_rewrite_tac(@list.List([@realarith.real_le_lt()]))
  let t10 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(r1 : Real) <= (r2 : Real) → abs(r1 - r2) == r2 - r1"))]))
  let t9 = @class.asm_cases_tac(@term_syntax.parse_term("(r2 : Real) == real_of_num(0)"))
  let t7 = @simp.rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t8 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.dist_eq_0(), @meson.meson(@list.List([]), @term_syntax.parse_term("existsunique((x : _) => (a : _) == x && (P : (_) -> Bool)(x)) == P(a)"))])), t7), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t6 = @class.asm_cases_tac(@term_syntax.parse_term("(r1 : Real) == real_of_num(0)"))
  let t5 = @tactics.repeat_tac(@tactics.gen_tac)
  let t4 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2 = @meson.meson_tac(@list.List([@vectors.dist_sym(), @realax.real_add_sym(), @real.real_abs_sub()]))
  let t1 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) == (Q : (_, _) -> Bool)(y, x)) → (∀ x : _, ∀ y : _, P(x, y)) == (∀ x : _, ∀ y : _, Q(x, y))")))
  let t3 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1), t2), @tactics.all_tac])
  let t120 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@real.real_wlog_le()), @tactics.conj_tac), t3), t4), @tactics.disch_tac), t5), t6), t8), t9), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t10), t11), @tactics.strip_tac), t119)
  circles_tangent_c.set(@tactics.prove(@term_syntax.parse_term("∀ r1 : Real, ∀ r2 : Real, ∀ c1 : Cart[Real, 2], ∀ c2 : Cart[Real, 2], real_of_num(0) <= r1 && real_of_num(0) <= r2 && (distance((c1, c2)) == r1 + r2 || distance((c1, c2)) == abs(r1 - r2)) → c1 == c2 && r1 == r2 || existsunique((x : Cart[Real, 2]) => distance((c1, x)) == r1 && distance((c2, x)) == r2)"), t120))
}

///|
let circles_tangent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CIRCLES_TANGENT")

///|
/// `CIRCLES_TANGENT`
pub fn circles_tangent() -> @kernel.Thm {
  circles_tangent_c.get()
}

///|
/// FEUERBACH
fn step_2() -> Unit raise {
  let t166 = @tactics.conv_tac(@calc_rat.real_ring)
  let t165 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_sub_component(), @vectors.vec_component(), @vectors.vector_mul_component(), @vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t164 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @vectors.dot_lsub(), @vectors.dot_rsub()]))
  let t163 = @simp.asm_rewrite_tac(@list.List([@vectors.midpoint()]))
  let t162 = @simp.rewrite_tac(@list.List([@vectors.orthogonal(), @vectors.dist(), @vectors.norm_pow_2()]))
  let t161 = @simp.rewrite_tac(@list.List([@vectors.collinear_3_2d()]))
  let t160 = @tactics.replicate_tac(3, @tactics.disch_then(@tactics.conjuncts_then2(fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s154 = @tactics.assume_tac(x153)
      fn(x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s154(x155)
      }
    })(@equal.sym(x156))
  }, fn(x157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s158 = @tactics.mp_tac(x157)
    fn(x159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s158(x159)
    }
  })))
  let t152 = @tactics.repeat_tac(@tactics.gen_tac)
  let t151 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lid()]))
  let t150 = @tactics.disch_then(fn(x147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s148 = @tactics.subst1_tac(x147)
    fn(x149 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s148(x149)
    }
  })
  let t146 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t145 = @tactics.disch_then(fn(x144 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t143 = @simp.simp_tac(@list.List([@vectors.norm_mul(), @vectors.norm_basis(), @cart.dimindex_2(), @calc_num.arith(), @realax.real_abs()]))
  let t141 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t140 = @list.List([@simp.rewrite_tac(@list.List([@sets.insert_ac(), @vectors.collinear_2()])), @tactics.all_tac])
  let t139 = @determinants.geom_normalize_tac(@term_syntax.parse_term("(b : Cart[Real, 2])"))
  let t138 = @determinants.geom_origin_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t137 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) && (e : Bool)) == (b && c && d && a && e)"))]))
  let t136 = @tactics.pop_assum_list(fn(x135 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t134 = @simp.rewrite_tac(@list.List([@real.real_pow2_abs()]))
  let t132 = @equal.gsym(@vectors.dist())
  let t133 = @simp.asm_simp_tac(@list.List([@realarith.real_le_add(), @real.real_abs_pos(), @equal.gsym(@vectors.norm_pow_2()), t132]))
  let t131 = @simp.asm_rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_eq_square()]))
  let t129 = @term_syntax.parse_term("real_of_num(0) <= (iradius : Real)")
  let t130 = @tactics.map_every(fn(x126 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x126
    let t128 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@vectors.dist_pos_le()]))])
    @tactics.thenl(@class.asm_cases_tac(t), t128)
  }, @list.List([@term_syntax.parse_term("real_of_num(0) <= (nradius : Real)"), t129]))
  let t125 = @tactics.pop_assum(fn(x122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s123 = @tactics.mp_tac(x122)
    fn(x124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s123(x124)
    }
  })
  let t121 = @tactics.match_mp_tac(circles_tangent())
  let t167 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t121), t125), t130), t131), t133), t134), t136), t137), t138), t139), @tactics.conj_tac), t140), (x142 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_basis_multiple_tac(1L, t141, x142)), t143), @tactics.gen_tac), t145), t146), t150), t151), t152), t160), t161), t162), t163), t164), t165), t166)
  feuerbach_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ mbc : Cart[Real, 2], ∀ mac : Cart[Real, 2], ∀ mab : Cart[Real, 2], ∀ pbc : Cart[Real, 2], ∀ pac : Cart[Real, 2], ∀ pab : Cart[Real, 2], ∀ ncenter : Cart[Real, 2], ∀ icenter : Cart[Real, 2], ∀ nradius : Real, ∀ iradius : Real, !collinear({a, b, c}) && midpoint((a, b)) == mab && midpoint((b, c)) == mbc && midpoint((c, a)) == mac && distance((ncenter, mbc)) == nradius && distance((ncenter, mac)) == nradius && distance((ncenter, mab)) == nradius && distance((icenter, pbc)) == iradius && distance((icenter, pac)) == iradius && distance((icenter, pab)) == iradius && collinear({a, b, pab}) && orthogonal(a - b, icenter - pab) && collinear({b, c, pbc}) && orthogonal(b - c, icenter - pbc) && collinear({a, c, pac}) && orthogonal(a - c, icenter - pac) → ncenter == icenter && nradius == iradius || existsunique((x : Cart[Real, 2]) => distance((ncenter, x)) == nradius && distance((icenter, x)) == iradius)"), t167))
}

///|
let feuerbach_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FEUERBACH")

///|
/// `FEUERBACH`
pub fn feuerbach() -> @kernel.Thm {
  feuerbach_c.get()
}

///|
/// NINE_POINT_CIRCLE_1
fn step_3() -> Unit raise {
  let t184 = @tactics.conv_tac(@calc_rat.real_ring)
  let t183 = @simp.simp_tac(@list.List([]))
  let t182 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_sub_component(), @vectors.vector_mul_component(), @vectors.vec_component()]))
  let t181 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @vectors.dot_lsub(), @vectors.dot_rsub()]))
  let t180 = @simp.asm_rewrite_tac(@list.List([@vectors.midpoint()]))
  let t179 = @simp.rewrite_tac(@list.List([@vectors.orthogonal(), @vectors.dist(), @vectors.norm_pow_2()]))
  let t178 = @simp.rewrite_tac(@list.List([@vectors.collinear_3_2d()]))
  let t177 = @simp.asm_rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_eq_square(), @realarith.real_pos()]))
  let t176 = @tactics.replicate_tac(3, @tactics.disch_then(@tactics.conjuncts_then2(fn(x172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s170 = @tactics.assume_tac(x169)
      fn(x171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s170(x171)
      }
    })(@equal.sym(x172))
  }, fn(x173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s174 = @tactics.mp_tac(x173)
    fn(x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s174(x175)
    }
  })))
  let t168 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) && (e : Bool)) == (b && c && d && a && e)"))]))
  let t185 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t168), t176), t177), t178), t179), t180), t181), t182), t183), t184)
  nine_point_circle_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ mbc : Cart[Real, 2], ∀ mac : Cart[Real, 2], ∀ mab : Cart[Real, 2], ∀ fbc : Cart[Real, 2], ∀ fac : Cart[Real, 2], ∀ fab : Cart[Real, 2], ∀ ncenter : Cart[Real, 2], ∀ nradius : Real, !collinear({a, b, c}) && midpoint((a, b)) == mab && midpoint((b, c)) == mbc && midpoint((c, a)) == mac && distance((ncenter, mbc)) == nradius && distance((ncenter, mac)) == nradius && distance((ncenter, mab)) == nradius && collinear({a, b, fab}) && orthogonal(a - b, c - fab) && collinear({b, c, fbc}) && orthogonal(b - c, a - fbc) && collinear({c, a, fac}) && orthogonal(c - a, b - fac) → distance((ncenter, fab)) == nradius && distance((ncenter, fbc)) == nradius && distance((ncenter, fac)) == nradius"), t185))
}

///|
let nine_point_circle_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NINE_POINT_CIRCLE_1")

///|
/// `NINE_POINT_CIRCLE_1`
pub fn nine_point_circle_1() -> @kernel.Thm {
  nine_point_circle_1_c.get()
}

///|
/// NINE_POINT_CIRCLE_2
fn step_4() -> Unit raise {
  let t202 = @tactics.conv_tac(@calc_rat.real_ring)
  let t201 = @simp.simp_tac(@list.List([]))
  let t200 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_sub_component(), @vectors.vector_mul_component(), @vectors.vec_component()]))
  let t199 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @vectors.dot_lsub(), @vectors.dot_rsub()]))
  let t198 = @simp.asm_rewrite_tac(@list.List([@vectors.midpoint()]))
  let t197 = @simp.rewrite_tac(@list.List([@vectors.orthogonal(), @vectors.dist(), @vectors.norm_pow_2()]))
  let t196 = @simp.rewrite_tac(@list.List([@vectors.collinear_3_2d()]))
  let t195 = @simp.asm_rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_eq_square(), @realarith.real_pos()]))
  let t194 = @tactics.replicate_tac(3, @tactics.disch_then(@tactics.conjuncts_then2(fn(x190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s188 = @tactics.assume_tac(x187)
      fn(x189 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s188(x189)
      }
    })(@equal.sym(x190))
  }, fn(x191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s192 = @tactics.mp_tac(x191)
    fn(x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s192(x193)
    }
  })))
  let t186 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) && (e : Bool)) == (b && c && d && a && e)"))]))
  let t203 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t186), t194), t195), t196), t197), t198), t199), t200), t201), t202)
  nine_point_circle_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ mbc : Cart[Real, 2], ∀ mac : Cart[Real, 2], ∀ mab : Cart[Real, 2], ∀ fbc : Cart[Real, 2], ∀ fac : Cart[Real, 2], ∀ fab : Cart[Real, 2], ∀ ncenter : Cart[Real, 2], ∀ nradius : Real, !collinear({a, b, c}) && midpoint((a, b)) == mab && midpoint((b, c)) == mbc && midpoint((c, a)) == mac && distance((ncenter, mbc)) == nradius && distance((ncenter, mac)) == nradius && distance((ncenter, mab)) == nradius && collinear({a, b, fab}) && orthogonal(a - b, c - fab) && collinear({b, c, fbc}) && orthogonal(b - c, a - fbc) && collinear({c, a, fac}) && orthogonal(c - a, b - fac) && collinear({(oc : Cart[Real, 2]), a, fbc}) && collinear({oc, b, fac}) && collinear({oc, c, fab}) → distance((ncenter, midpoint((oc, a)))) == nradius && distance((ncenter, midpoint((oc, b)))) == nradius && distance((ncenter, midpoint((oc, c)))) == nradius"), t203))
}

///|
let nine_point_circle_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NINE_POINT_CIRCLE_2")

///|
/// `NINE_POINT_CIRCLE_2`
pub fn nine_point_circle_2() -> @kernel.Thm {
  nine_point_circle_2_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
}
