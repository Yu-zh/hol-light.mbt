// Translated from upstream Examples/borsuk.ml; edit this file directly.

///|
/// THEOREM_1
fn step_1() -> Unit raise {
  let t186 = @simp.rewrite_tac(@list.List([@arith.even_mult(), @calc_num.arith()]))
  let t182 = @term_syntax.parse_term("EVEN")
  let t185 = @tactics.disch_then(fn(x184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s180 = @tactics.mp_tac(x179)
      fn(x181 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s180(x181)
      }
    })(((x183 : @kernel.Thm) => @equal.ap_term(t182, x183))(x184))
  })
  let t178 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @realax.real_of_num_mul(), @realax.real_of_num_eq()]))
  let t177 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) / real_of_num(2) == (n : Real)) == (a == real_of_num(2) * n)"))]))
  let t176 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_neg(), @real.real_abs_div(), @calc_int.real_abs_num()]))
  let t175 = @simp.rewrite_tac(@list.List([@int.integer()]))
  let t174 = @simp.simp_tac(@list.List([]))
  let t173 = @simp.gen_rewrite_tac(fn(x172 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x172
  }, @list.List([@equal.gsym(@class.contrapos_thm())]))
  let t171 = @tactics.undisch_tac(@term_syntax.parse_term("integer((n : Real))"))
  let t170 = @simp.rewrite_tac(@list.List([@complexes.cx_inj(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * (n : Real) + real_of_num(1) == real_of_num(0)) == (n == -(real_of_num(1) / real_of_num(2)))"))]))
  let t169 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("!((z : Cart[Real, 2]) == Cx(real_of_num(0))) → (a : Cart[Real, 2]) - (b : Cart[Real, 2]) == z → !(b - a == z)")))
  let t168 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_sub_rdistrib()]))
  let t167 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @complexes.complex_norm_cx(), @calc_int.real_abs_num(), @complexes.complex_neg_neg()]))
  let t166 = @tactics.disch_then(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x163
    let t165 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cx(real_of_num(1))"), th_1))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("-Cx(real_of_num(1))"), th_1)), t165)
  })
  let t162 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s157 = @tactics.assume_tac(x156)
    fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s157(x158)
    }
  }, fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s160 = @tactics.mp_tac(x159)
    fn(x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s160(x161)
    }
  }))
  let t155 = @simp.expand_tac("m")
  let t154 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Real)"))(fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s152 = @tactics.mp_tac(x151)
    fn(x153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s152(x153)
    }
  }))
  let t149 = @meson.asm_meson_tac(@list.List([]))
  let t148 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t145 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t150 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("*", fn(x147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s143 = @tactics.mp_tac(x142)
      fn(x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s143(x144)
      }
    })(((x146 : @kernel.Thm) => @bool.spec(t145, x146))(x147))
  }), t148), t149), @tactics.all_tac])
  let t141 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Real, integer(n) && (∀ z : Cart[Real, 2], norm(z) == real_of_num(1) → (m : (Cart[Real, 2]) -> Cart[Real, 2])(z) == Cx(real_of_num(2) * n + real_of_num(1)))"), fn(x138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s139 = @tactics.mp_tac(x138)
    fn(x140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s139(x140)
    }
  })
  let t133 = @term_syntax.parse_term("(v : Cart[Real, 2])")
  let t135 = @tactics.disch_then((x134 : @kernel.Thm) => @tactics.x_choose_tac(t133, x134))
  let t136 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm()])), t135)
  let t132 = @meson.asm_meson_tac(@list.List([]))
  let t131 = @simp.asm_simp_tac(@list.List([@equal.gsym(@floor.real_eq_integers())]))
  let t130 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("!(abs((x : Real) - (y : Real)) < real_of_num(1)) → real_of_num(1) <= abs(real_of_num(2) * x + real_of_num(1) - (real_of_num(2) * y + real_of_num(1)))")))
  let t129 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_sub()), @complexes.complex_norm_cx()]))
  let t128 = @tactics.repeat_tac(@tactics.disch_then(@tactics.choose_then(@tactics.conjuncts_then2(fn(x122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s123 = @tactics.assume_tac(x122)
    fn(x124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s123(x124)
    }
  }, fn(x125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s126 = @tactics.subst_all_tac(x125)
    fn(x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s126(x127)
    }
  }))))
  let t121 = @simp.asm_rewrite_tac(@list.List([]))
  let t120 = @tactics.remove_then("*", fn(x117 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x117
    let t119 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), th))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(w : Cart[Real, 2])"), th)), t119)
  })
  let t116 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t115 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t114 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t113 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t112 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t110 = @simp.simp_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @vectors.norm_neg(), @topology.in_cball(), @complexes.complex_sub_lzero(), @vectors.dist(), @sets.in_elim_thm(), @realax.real_le_refl()]))
  let t107 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.continuous_on_subset()))
  let t109 = @tactics.first_x_assum(fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t107(x108))
  })
  let t104 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o())]))
  let t103 = @simp.rewrite_tac(@list.List([@vectors.linear()]))
  let t105 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.linear_continuous_on()), t103), @tactics.conj_tac), @vectors.vector_arith_tac), t104])
  let t106 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@topology.continuous_on_compose())), @tactics.conj_tac), t105)])
  let t102 = @tactics.match_mp_tac(@topology.continuous_on_sub())
  let t101 = @simp.simp_tac(@list.List([@topology.continuous_on_const(), @complexes.complex_entire(), @complexes.ii_nz(), @complexes.cx_inj(), @transcendentals.pi_nz()]))
  let t100 = @tactics.match_mp_tac(@canal.continuous_on_complex_div())
  let t111 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("m"), t100), t101), t102), @tactics.conj_tac), t106), t109), t110), @tactics.all_tac])
  let t98 = @simp.simp_tac(@list.List([@equal.gsym(@topology.sphere()), @paths.connected_sphere(), @cart.dimindex_2(), @arith.le_refl()]))
  let t99 = @list.List([@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("norm((z : Cart[Real, _])) == distance((vec(0), z))"))])), t98), @tactics.all_tac])
  let t137 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_discrete_range_constant()), @tactics.conj_tac), t99), @tactics.conj_tac), t111), t112), t113), @tactics.disch_tac), t114), t115), t116), @tactics.strip_tac), t120), t121), t128), t129), t130), t131), t132), t136])
  let t97 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(z, {(z : Cart[Real, 2]) | norm(z) == real_of_num(1)}) → (m : (Cart[Real, 2]) -> Cart[Real, 2])(z) == n"), fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s95 = @tactics.mp_tac(x94)
    fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s95(x96)
    }
  })
  let t93 = @tactics.disch_then(fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s91 = ((x89 : @kernel.Thm) => @tactics.label_tac("*", x89))(x90)
    fn(x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s91(x92)
    }
  })
  let t87 = @equal.gsym(@complexes.cx_mul())
  let t88 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_add()), t87]))
  let t86 = @simp.simp_tac(@list.List([@complexes.cx_inj(), @transcendentals.pi_nz(), @complexes.complex_field(@term_syntax.parse_term("!((p : Cart[Real, 2]) == Cx(real_of_num(0))) → (p * (ii * (m : Cart[Real, 2])) == p * ii + (t : Cart[Real, 2]) * ((n : Cart[Real, 2]) * p) * ii) == (m == t * n + Cx(real_of_num(1)))"))]))
  let t85 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_eq(), @complexes.cx_mul()]))
  let t81 = @simp.rewrite_tac(@list.List([@real.sqrt_0(), @calc_int.real_neg_0()]))
  let t80 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t79 = @simp.asm_rewrite_tac(@list.List([]))
  let t78 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.forall_3(), @vectors.vector_3(), @vectors.vector_neg_component(), @cart.dimindex_3(), @calc_num.arith(), @complexes.re_neg(), @complexes.im_neg(), @vectors.norm_neg(), @calc_int.real_neg_neg()]))
  let t77 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_sub()]))
  let t82 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x74 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s75 = @simp.expand_tac(x74)
    fn(x76 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s75(x76)
    }
  }, @list.List(["k", "g"])), t77), @tactics.binop_tac), @tactics.ap_term_tac), t78), t79), t80), t81)
  let t73 = @simp.asm_simp_tac(@list.List([@vectors.dist(), @topology.in_cball(), @complexes.complex_sub_lzero(), @vectors.norm_neg(), @realax.real_le_refl()]))
  let t83 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t73), t82])
  let t72 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("!((y : Cart[Real, 2]) == Cx(real_of_num(0))) && (x : Cart[Real, 2]) == -y → x / y == Cx(-real_of_num(1))")))
  let t71 = @simp.rewrite_tac(@list.List([@transcendentals.euler(), @complexes.re_mul_cx(), @complexes.im_mul_cx(), @complexes.re_ii(), @complexes.im_ii(), @complexes.complex_add_rid(), @calc_int.real_mul_rzero(), @realarith.real_mul_rid(), @transcendentals.sin_pi(), @transcendentals.cos_pi(), @transcendentals.real_exp_0(), @complexes.complex_mul_rzero(), @complexes.complex_mul_lid()]))
  let t69 = @simp.asm_simp_tac(@list.List([@vectors.dist(), @topology.in_cball(), @complexes.complex_sub_lzero(), @vectors.norm_neg(), @realax.real_le_refl()]))
  let t68 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t70 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.conv_tac(@equal.sym_conv)), t68), t69), @tactics.all_tac])
  let t66 = @tactics.conjuncts_then(fn(x63 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s64 = @tactics.subst1_tac(x63)
    fn(x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s64(x65)
    }
  })
  let t67 = @tactics.subgoal_then(@term_syntax.parse_term("cexp((h : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2]))) == (k : (Cart[Real, 2]) -> Cart[Real, 2])(z) && cexp(h(-z)) == k(-z)"), t66)
  let t62 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t61 = @simp.simp_tac(@list.List([@complexes.cx_inj(), @transcendentals.pi_nz(), @transcendentals.cexp_sub(), @complexes.complex_field(@term_syntax.parse_term("!((p : Cart[Real, 2]) == Cx(real_of_num(0))) → p * (ii * ((h : Cart[Real, 2]) * inv(p * ii))) == h"))]))
  let t60 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_ldistrib(), @complexes.complex_div(), @complexes.complex_sub_rdistrib()]))
  let t84 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("m"), t60), t61), t62), @tactics.disch_tac), t67), t70), t71), t72), @tactics.conj_tac), t83), @tactics.all_tac])
  let t59 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], norm(z) == real_of_num(1) → cexp(Cx(pi) * (ii * (m : (Cart[Real, 2]) -> Cart[Real, 2])(z))) == cexp(Cx(pi) * ii)"), fn(x56 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s57 = @tactics.mp_tac(x56)
    fn(x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s57(x58)
    }
  })
  let t55 = @simp.abbrev_tac(@term_syntax.parse_term("(m : (Cart[Real, 2]) -> Cart[Real, 2]) == ((z : Cart[Real, 2]) => ((h : (Cart[Real, 2]) -> Cart[Real, 2])(z) - h(-z)) / (Cx(pi) * ii))"))
  let t54 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(h : (Cart[Real, 2]) -> Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t53 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x50 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s51 = @tactics.mp_tac(x50)
    fn(x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s51(x52)
    }
  }))
  let t48 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_le(), @misc.abs_square_le_1(), @vectors.real_abs_norm()]))
  let t47 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sqnorm())]))
  let t46 = @tactics.match_mp_tac(@real.sqrt_pow_2())
  let t45 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((r : Real) + ((i : Real) + (s : Real)) == real_of_num(1)) == (s == real_of_num(1) - (r + i))"))]))
  let t44 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @complexes.complex_sqnorm()]))
  let t42 = @simp.rewrite_tac(@list.List([@vectors.norm_eq_1(), @vectors.dot_3(), @vectors.vector_3()]))
  let t41 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t40 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("((x : Cart[Real, 2]) - (y : Cart[Real, 2]) == Cx(real_of_num(0))) == (y == x)"))]))
  let t39 = @tactics.map_every(fn(x36 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s37 = @simp.expand_tac(x36)
    fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s37(x38)
    }
  }, @list.List(["k", "g"]))
  let t35 = @simp.rewrite_tac(@list.List([@vectors.dist(), @topology.in_cball(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t43 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t35), @tactics.disch_tac), t39), t40), t41), t42)
  let t34 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t33 = @simp.rewrite_tac(@list.List([@real.real_neg_mul2()]))
  let t32 = @simp.simp_tac(@list.List([@vectors.norm_eq_1(), @vectors.dot_3(), @vectors.vector_3(), @vectors.vector_neg_component(), @vectors.dist(), @cart.dimindex_3(), @calc_num.arith(), @topology.in_cball(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t31 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @trivia.o_thm(), @sets.in_elim_thm()]))
  let t30 = @simp.asm_rewrite_tac(@list.List([]))
  let t29 = @tactics.exists_tac(@term_syntax.parse_term("{(x : Cart[Real, 3]) | norm(x) == real_of_num(1)}"))
  let t28 = @tactics.match_mp_tac(@topology.continuous_on_subset())
  let t25 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o())]))
  let t24 = @simp.rewrite_tac(@list.List([@vectors.linear()]))
  let t26 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.linear_continuous_on()), t24), @tactics.conj_tac), @vectors.vector_arith_tac), t25])
  let t27 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@topology.continuous_on_compose())), @tactics.conj_tac), t26)])
  let t23 = @tactics.match_mp_tac(@topology.continuous_on_sub())
  let t22 = @simp.expand_tac("g")
  let t20 = @simp.rewrite_tac(@list.List([@misc.abs_square_le_1(), @vectors.real_abs_norm()]))
  let t19 = @simp.simp_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @topology.in_cball(), @sets.in_elim_thm(), @vectors.dist(), @complexes.complex_sub_lzero(), @vectors.norm_neg(), @realarith.real_sub_le()]))
  let t18 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_within_sqrt()]))
  let t17 = @tactics.exists_tac(@term_syntax.parse_term("{(t : Real) | real_of_num(0) <= t}"))
  let t16 = @tactics.match_mp_tac(@realanalysis.real_continuous_withinreal_subset())
  let t15 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_sub(), @realanalysis.real_continuous_pow(), @realanalysis.real_continuous_const(), @realanalysis.real_continuous_norm_within()]))
  let t14 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@realanalysis.real_continuous_within_compose()))
  let t13 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t12 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_complex_components_within()]))
  let t11 = @simp.simp_tac(@list.List([@cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_3(), @class.eta_ax()]))
  let t21 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within(), @realanalysis.continuous_componentwise()])), t11), t12), t13), @tactics.disch_tac), t14), t15), t16), t17), t18), t19), t20), @tactics.all_tac])
  let t10 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@topology.continuous_on_compose()))
  let t49 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("k"), t10), @tactics.conj_tac), t21), t22), t23), @tactics.conj_tac), t27), t28), t29), t30), t31), t32), t33), t34), @tactics.disch_tac), t43])), t44), t45), t46), t47), t48), @tactics.all_tac])
  let t9 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a && (b : Bool) → (c : Bool)) → (a → b) → c")))
  let t6 = @term_syntax.parse_term("real_of_num(1)")
  let t7 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t8 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(k : (Cart[Real, 2]) -> Cart[Real, 2])"), t7, t6]), @moretop.continuous_logarithm_on_cball()))
  let t5 = @simp.abbrev_tac(@term_syntax.parse_term("(k : (Cart[Real, 2]) -> Cart[Real, 2]) == ((z : Cart[Real, 2]) => (g : (Cart[Real, 3]) -> Cart[Real, 2])(vector([Re(z), Im(z), sqrt(real_of_num(1) - pow(norm(z), 2))])))"))
  let t4 = @simp.abbrev_tac(@term_syntax.parse_term("(g : (Cart[Real, 3]) -> Cart[Real, 2]) == ((x : Cart[Real, 3]) => (f : (Cart[Real, 3]) -> Cart[Real, 2])(x) - f(-x))"))
  let t3 = @simp.pure_rewrite_tac(@list.List([@class.not_exists_thm(), @class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool)) == (a → !b)"))]))
  let t2 = @simp.gen_rewrite_tac(fn(x1 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1
  }, @list.List([@class.taut(@term_syntax.parse_term("(p : Bool) == !!p"))]))
  let t187 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2), t3), @tactics.disch_tac), t4), t5), t8), t9), @tactics.conj_tac), t49), t53), t54), t55), t59), t84), t85), t86), t88), t93), t97), t137), t141), t150), t154), t155), t162), t166), t167), t168), t169), t170), t171), t173), t174), @tactics.disch_tac), t175), t176), t177), t178), @tactics.gen_tac), t185), t186)
  theorem_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Cart[Real, 2], continuous_on(f, {(x : Cart[Real, 3]) | norm(x) == real_of_num(1)}) → (∃ x : Cart[Real, 3], norm(x) == real_of_num(1) && f(-x) == f(x))"), t187))
}

///|
let theorem_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THEOREM_1")

///|
/// `THEOREM_1`
pub fn theorem_1() -> @kernel.Thm {
  theorem_1_c.get()
}

///|
/// BORSUK_ULAM
fn step_2() -> Unit raise {
  let t199 = @simp.asm_simp_tac(@list.List([@vectors.vector_add_sub(), @vectors.norm_mul()]))
  let t196 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, 3]) - op_pct((r : Real), (x : Cart[Real, 3])) == a + op_pct(r, -x)"))]))
  let t195 = @tactics.exists_tac(@term_syntax.parse_term("op_pct((r : Real), (x : Cart[Real, 3]))"))
  let t197 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Cart[Real, 3])"))(@tactics.strip_assume_tac)), t195), t196)
  let t194 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @sets.in_elim_thm()]))
  let t191 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.continuous_on_subset()))
  let t193 = @tactics.first_assum(fn(x192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t191(x192))
  })
  let t190 = @simp.simp_tac(@list.List([@topology.continuous_on_add(), @topology.continuous_on_const(), @topology.continuous_on_cmul(), @topology.continuous_on_id()]))
  let t198 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@topology.continuous_on_compose())), t190), t193), t194), t197])
  let t189 = @simp.rewrite_tac(@list.List([]))
  let t188 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Cart[Real, 3]) => (f : (Cart[Real, 3]) -> Cart[Real, 2])((a : Cart[Real, 3]) + op_pct((r : Real), x))"), theorem_1()))
  let t200 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t188), t189), @tactics.ants_tac), t198), t199), @calc_rat.asm_real_arith_tac)
  borsuk_ulam_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Cart[Real, 2], ∀ a : Cart[Real, 3], ∀ r : Real, real_of_num(0) <= r && continuous_on(f, {(z : Cart[Real, 3]) | norm(z - a) == r}) → (∃ x : Cart[Real, 3], norm(x) == r && f(a + x) == f(a - x))"), t200))
}

///|
let borsuk_ulam_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BORSUK_ULAM")

///|
/// `BORSUK_ULAM`
pub fn borsuk_ulam() -> @kernel.Thm {
  borsuk_ulam_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
}
