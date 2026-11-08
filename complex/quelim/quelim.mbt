// Translated from upstream Complex/quelim.ml; edit this file directly.

///|
/// NULLSTELLENSATZ_LEMMA
fn step_1() -> Unit raise {
  let t210 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @arith.lt_imp_le()]))
  let t209 = @simp.rewrite_tac(@list.List([@cpoly.poly_exp_v1(), @equal.gsym(@complexnumbers.complex_pow_add())]))
  let t208 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("poly(poly_exp((r : List[Complex]), degree((s : List[Complex])))) == poly(poly_mul(s, (u : List[Complex])))"))))
  let t207 = @simp.gen_rewrite_tac(fn(x206 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x200 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s201 = @equal.rand_conv(x200)
      fn(x202 : @kernel.Term) -> @kernel.Thm raise {
        s201(x202)
      }
    })((fn(x203 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s204 = @equal.rand_conv(x203)
      fn(x205 : @kernel.Term) -> @kernel.Thm raise {
        s204(x205)
      }
    })(x206))
  }, @list.List([@equal.gsym(@cpoly.poly_mul_v1())]))
  let t199 = @simp.asm_simp_tac(@list.List([@arith.sub_add()]))
  let t198 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexnumbers.complex_pow_add())]))
  let t196 = @term_syntax.parse_term("(ap : Complex) * (s : Complex) * ((u : Complex) * ((anp : Complex) * (rns : Complex))) == anp * ap * (rns * (s * u))")
  let t197 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@complexnumbers.complex_mul_ac())(t196)]))
  let t195 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Complex)"))
  let t194 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), @cpoly.poly_mul_v1(), @cpoly.poly_exp_v1(), @complexnumbers.complex_pow_mul()]))
  let t193 = @tactics.exists_tac(@term_syntax.parse_term("poly_mul((u : List[Complex]), poly_mul(poly_exp([-(a : Complex), Cx(real_of_num(1))], (n : Num) - order(a, (p : List[Complex]))), poly_exp((r : List[Complex]), n - degree((s : List[Complex])))))"))
  let t192 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : List[Complex])"))(fn(x189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s190 = @tactics.assume_tac(x189)
    fn(x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s190(x191)
    }
  }))
  let t188 = @simp.rewrite_tac(@list.List([@cpoly.divides()]))
  let t186 = @simp.rewrite_tac(@list.List([@cpoly.poly_mul_v1(), @cpoly.poly_exp(), @complexnumbers.complex_mul_ac(), @class.fun_eq_thm()]))
  let t185 = @simp.asm_rewrite_tac(@list.List([]))
  let t184 = @tactics.exists_tac(@term_syntax.parse_term("(u : List[Complex])"))
  let t183 = @simp.rewrite_tac(@list.List([@cpoly.divides()]))
  let t182 = @tactics.undisch_tac(@term_syntax.parse_term("!divides(poly_exp([-(a : Complex), Cx(real_of_num(1))], SUC(order(a, (p : List[Complex])))), p)"))
  let t181 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : List[Complex])"))(fn(x178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s179 = @tactics.subst_all_tac(x178)
    fn(x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s179(x180)
    }
  }))
  let t177 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t176 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly_linear_divides(), @class.de_morgan_thm()]))
  let t175 = @tactics.undisch_tac(@term_syntax.parse_term("poly((s : List[Complex]), (a : Complex)) == Cx(real_of_num(0))"))
  let t174 = @tactics.disch_then(fn(x171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s172 = @tactics.subst_all_tac(x171)
    fn(x173 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s172(x173)
    }
  })
  let t170 = @simp.rewrite_tac(@list.List([@cpoly.simple_complex_arith(@term_syntax.parse_term("(-(a : Complex) + (z : Complex) * Cx(real_of_num(1)) == Cx(real_of_num(0))) == (z == a)"))]))
  let t169 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t168 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a || (b : Bool) → b")))
  let t167 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_entire()]))
  let t166 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly_mul_v1(), @complexnumbers.complex_mul_rid()]))
  let t165 = @simp.asm_rewrite_tac(@list.List([]))
  let t161 = @term_syntax.parse_term("(z : Complex)")
  let t164 = @tactics.disch_then(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s159 = @tactics.mp_tac(x158)
      fn(x160 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s159(x160)
      }
    })(((x162 : @kernel.Thm) => @bool.spec(t161, x162))(x163))
  })
  let t157 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Complex, poly((p : List[Complex]), x) == Cx(real_of_num(0)) → poly(poly_mul([-(a : Complex), Cx(real_of_num(1))], (r : List[Complex])), x) == Cx(real_of_num(0))"))
  let t187 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Complex)")), @tactics.disch_tac), t157), t164), t165), t166), t167), t168), t169), t170), t174), t175), t176), @tactics.conj_tac), t177), t181), t182), t183), t184), t185), t186), @tactics.all_tac])
  let t156 = @simp.asm_rewrite_tac(@list.List([]))
  let t151 = @term_syntax.parse_term("(r : List[Complex])")
  let t152 = @list.List([@term_syntax.parse_term("(s : List[Complex])"), t151])
  let t155 = @tactics.disch_then(fn(x154 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s149 = @tactics.mp_tac(x148)
      fn(x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s149(x150)
      }
    })(((x153 : @kernel.Thm) => @bool.specl(t152, x153))(x154))
  })
  let t147 = @simp.asm_rewrite_tac(@list.List([]))
  let t143 = @term_syntax.parse_term("degree((s : List[Complex]))")
  let t146 = @tactics.first_x_assum(fn(x145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x140 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s141 = @tactics.mp_tac(x140)
      fn(x142 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s141(x142)
      }
    })(((x144 : @kernel.Thm) => @bool.spec(t143, x144))(x145))
  })
  let t138 = @tactics.undisch_tac(@term_syntax.parse_term("!(order((a : Complex), (p : List[Complex])) == 0)"))
  let t137 = @simp.asm_rewrite_tac(@list.List([]))
  let t136 = @simp.rewrite_tac(@list.List([@cpoly.linear_pow_mul_degree()]))
  let t133 = @drule.match_mp(@cpoly.degree_welldef())
  let t135 = @tactics.first_assum(fn(x134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s131 = @tactics.subst1_tac(x130)
      fn(x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s131(x132)
      }
    })(t133(x134))
  })
  let t139 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@analysis.expand_tac("n"), t135), t136), t137), t138), @int.arith_tac), @tactics.all_tac])
  let t129 = @tactics.subgoal_then(@term_syntax.parse_term("degree((s : List[Complex])) < (n : Num)"), fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s127 = @tactics.assume_tac(x126)
    fn(x128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s127(x128)
    }
  })
  let t124 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_mul_linv(), @complexnumbers.complex_mul_rid()]))
  let t123 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid(), @complexnumbers.complex_mul_rid()]))
  let t122 = @simp.asm_simp_tac(@list.List([@arith.sub_add()]))
  let t121 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexnumbers.complex_pow_add())]))
  let t119 = @term_syntax.parse_term("(a : Complex) * (b : Complex) * ((c : Complex) * ((d : Complex) * (e : Complex))) == d * a * (c * b) * e")
  let t120 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@complexnumbers.complex_mul_ac())(t119)]))
  let t118 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Complex)"))
  let t117 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), @cpoly.poly_mul_v1(), @cpoly.poly_exp_v1(), @complexnumbers.complex_pow_mul()]))
  let t116 = @tactics.exists_tac(@term_syntax.parse_term("poly_mul([inv((k : Complex))], poly_mul(poly_exp([-(a : Complex), Cx(real_of_num(1))], (n : Num) - order(a, (p : List[Complex]))), poly_exp((r : List[Complex]), n)))"))
  let t115 = @simp.rewrite_tac(@list.List([@cpoly.divides()]))
  let t114 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Complex)"))(@tactics.strip_assume_tac))
  let t112 = @simp.asm_rewrite_tac(@list.List([@lists.length_eq_nil()]))
  let t111 = @simp.asm_rewrite_tac(@list.List([]))
  let t110 = @simp.rewrite_tac(@list.List([@lists.length(), @arith.pre(), @cpoly.poly(), @lists.last()]))
  let t109 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t107 = @term_syntax.parse_term("(s : List[Complex])")
  let t108 = @tactics.spec_tac(@term_syntax.parse_term("normalize((s : List[Complex]))"), t107)
  let t106 = @simp.rewrite_tac(@list.List([@cpoly.degree()]))
  let t103 = @simp.gen_rewrite_rule(fn(x100 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s101 = @equal.rand_conv(x100)
    fn(x102 : @kernel.Term) -> @kernel.Thm raise {
      s101(x102)
    }
  }, @list.List([@cpoly.poly_normalize_zero()]))
  let t105 = @tactics.first_assum(fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s98 = @tactics.mp_tac(x97)
      fn(x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s98(x99)
      }
    })(t103(x104))
  })
  let t96 = @tactics.undisch_tac(@term_syntax.parse_term("degree((s : List[Complex])) == 0"))
  let t95 = @simp.gen_rewrite_tac(fn(x92 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s93 = @equal.land_conv(x92)
    fn(x94 : @kernel.Term) -> @kernel.Thm raise {
      s93(x94)
    }
  }, @list.List([@equal.gsym(@cpoly.poly_normalize())]))
  let t91 = @simp.asm_simp_tac(@list.List([@cpoly.normal_normalize(), @equal.gsym(@cpoly.poly_normalize_zero())]))
  let t113 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("LAST(normalize((s : List[Complex])))")), t91), t95), t96), t105), t106), t108), @lists.list_induct_tac), t109), t110), @class.cond_cases_tac), t111), t112), @tactics.all_tac])
  let t125 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ k : Complex, !(k == Cx(real_of_num(0))) && poly((s : List[Complex])) == poly([k])"), fn(x88 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s89 = @tactics.mp_tac(x88)
    fn(x90 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s89(x90)
    }
  }), t113), t114), t115), t116), t117), t118), t120), @tactics.ap_thm_tac), @tactics.ap_term_tac), t121), t122), t123), t124), @tactics.all_tac])
  let t87 = @class.asm_cases_tac(@term_syntax.parse_term("degree((s : List[Complex])) == 0"))
  let t85 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly_entire()]))
  let t86 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("!(poly((p : List[Complex])) == poly(NIL))"))), t85), @tactics.all_tac])
  let t84 = @tactics.subgoal_then(@term_syntax.parse_term("!(poly((s : List[Complex])) == poly(NIL))"), fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s82 = @tactics.assume_tac(x81)
    fn(x83 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s82(x83)
    }
  })
  let t80 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : List[Complex])"))(fn(x77 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s78 = @tactics.assume_tac(x77)
    fn(x79 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s78(x79)
    }
  }))
  let t76 = @simp.gen_rewrite_tac(fn(x73 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s74 = @equal.land_conv(x73)
    fn(x75 : @kernel.Term) -> @kernel.Thm raise {
      s74(x75)
    }
  }, @list.List([@cpoly.divides()]))
  let t72 = @tactics.undisch_tac(@term_syntax.parse_term("divides(poly_exp([-(a : Complex), Cx(real_of_num(1))], order(a, (p : List[Complex]))), p)"))
  let t71 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : List[Complex])"))(fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s69 = @tactics.subst_all_tac(x68)
    fn(x70 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s69(x70)
    }
  }))
  let t67 = @simp.asm_rewrite_tac(@list.List([]))
  let t65 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @cpoly.poly_mul_v1(), @complexnumbers.complex_mul_lzero(), @cpoly.poly()]))
  let t64 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly_exp()]))
  let t62 = @term_syntax.parse_term("(n : Num)")
  let t63 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t62)
  let t61 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t66 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.match_mp_tac(@cpoly.poly_divides_zero())), t61), t63), @nums.induct_tac), t64), @tactics.disch_tac), t65), @tactics.all_tac])
  let t60 = @class.asm_cases_tac(@term_syntax.parse_term("(q : List[Complex]) == NIL"))
  let t59 = @simp.rewrite_tac(@list.List([@cpoly.poly_linear_divides()]))
  let t58 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("poly((p : List[Complex]), (a : Complex)) == Cx(real_of_num(0))"))]))
  let t54 = @term_syntax.parse_term("(a : Complex)")
  let t57 = @tactics.first_assum(fn(x56 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s52 = @tactics.mp_tac(x51)
      fn(x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s52(x53)
      }
    })(((x55 : @kernel.Thm) => @bool.spec(t54, x55))(x56))
  })
  let t50 = @simp.asm_rewrite_tac(@list.List([]))
  let t47 = @drule.match_mp(@cpoly.order_degree())
  let t44 = @term_syntax.parse_term("(a : Complex)")
  let t49 = @tactics.first_assum(fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s42 = @tactics.mp_tac(x41)
        fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s42(x43)
        }
      })(((x45 : @kernel.Thm) => @bool.spec(t44, x45))(x46))
    })(t47(x48))
  })
  let t40 = @simp.asm_rewrite_tac(@list.List([]))
  let t37 = @term_syntax.parse_term("order((a : Complex), (p : List[Complex]))")
  let t38 = @term_syntax.parse_term("(a : Complex)")
  let t39 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : List[Complex])"), t38, t37]), @cpoly.order_v1()))
  let t35 = @meson.meson_tac(@list.List([]))
  let t36 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@cpoly.degree_zero()])), t35), @tactics.all_tac])
  let t34 = @simp.asm_rewrite_tac(@list.List([]))
  let t33 = @class.asm_cases_tac(@term_syntax.parse_term("poly((p : List[Complex])) == poly(NIL)"))
  let t32 = @simp.gen_rewrite_tac(fn(x29 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s30 = @equal.land_conv(x29)
    fn(x31 : @kernel.Term) -> @kernel.Thm raise {
      s30(x31)
    }
  }, @list.List([@cpoly.order_root()]))
  let t28 = @tactics.disch_then(fn(x25 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x25
    let t27 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.assume_tac(th), t27)
  })
  let t24 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(a : Complex)"))(fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s22 = @tactics.mp_tac(x21)
    fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s22(x23)
    }
  }))
  let t19 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_mul_assoc(), @complexnumbers.complex_mul_rinv(), @complexnumbers.complex_mul_lid(), @cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid(), @fundamental.poly_0()]))
  let t18 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Complex)"))
  let t17 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), @cpoly.poly_mul_v1()]))
  let t16 = @tactics.exists_tac(@term_syntax.parse_term("poly_mul([inv((k : Complex))], poly_exp((q : List[Complex]), (n : Num)))"))
  let t15 = @simp.rewrite_tac(@list.List([@cpoly.divides()]))
  let t13 = @term_syntax.parse_term("(zeros : List[Complex])")
  let t14 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : Complex)"), t13]))
  let t12 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t9 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))]))(@fundamental.fundamental_theorem_of_algebra_alt()))
  let t11 = @tactics.first_assum(fn(x10 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x6 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s7 = @tactics.mp_tac(x6)
      fn(x8 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s7(x8)
      }
    })(t9(x10))
  })
  let t20 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x5 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t11), t12), t14), @tactics.strip_tac), t15), t16), t17), t18), t19)])
  let t4 = @class.asm_cases_tac(@term_syntax.parse_term("∃ a : Complex, poly((p : List[Complex]), a) == Cx(real_of_num(0))"))
  let t2 = @term_syntax.parse_term("(q : List[Complex])")
  let t3 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : List[Complex])"), t2]))
  let t1 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t211 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.num_wf()), t1), @tactics.disch_tac), t3), t4), t20), t24), t28), t32), t33), t34), t36), @tactics.strip_tac), @tactics.strip_tac), t39), t40), @tactics.strip_tac), t49), t50), @tactics.disch_tac), t57), t58), t59), t60), t66), t67), t71), t72), t76), t80), t84), t86), t87), t125), t129), t139), t146), t147), t155), t156), @tactics.ants_tac), t187), t188), t192), t193), t194), t195), t197), t198), t199), @tactics.ap_term_tac), t207), t208), t209), t210)
  nullstellensatz_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ p : List[Complex], ∀ q : List[Complex], (∀ x : Complex, poly(p, x) == Cx(real_of_num(0)) → poly(q, x) == Cx(real_of_num(0))) && degree(p) == n && !(n == 0) → divides(p, poly_exp(q, n))"), t211))
}

///|
let nullstellensatz_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NULLSTELLENSATZ_LEMMA")

///|
/// `NULLSTELLENSATZ_LEMMA`
pub fn nullstellensatz_lemma() -> @kernel.Thm {
  nullstellensatz_lemma_c.get()
}

///|
/// NULLSTELLENSATZ_UNIVARIATE
fn step_2() -> Unit raise {
  let t276 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_mul_rinv()]))
  let t275 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t274 = @simp.asm_rewrite_tac(@list.List([@cpoly.divides(), @cpoly.poly(), @class.fun_eq_thm(), @cpoly.poly_mul_v1()]))
  let t273 = @tactics.exists_tac(@term_syntax.parse_term("[inv((k : Complex))]"))
  let t272 = @simp.asm_rewrite_tac(@list.List([@complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t271 = @simp.asm_rewrite_tac(@list.List([@cpoly.divides(), @cpoly.poly(), @class.fun_eq_thm(), @cpoly.poly_mul_v1()]))
  let t270 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Complex)"))(@tactics.strip_assume_tac))
  let t268 = @simp.simp_tac(@list.List([@lists.length_eq_nil(), @cpoly.poly_normalize()]))
  let t267 = @simp.rewrite_tac(@list.List([@lists.length(), @arith.pre(), @cpoly.poly(), @lists.last()]))
  let t266 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t264 = @term_syntax.parse_term("(p : List[Complex])")
  let t265 = @tactics.spec_tac(@term_syntax.parse_term("normalize((p : List[Complex]))"), t264)
  let t263 = @simp.rewrite_tac(@list.List([@cpoly.degree()]))
  let t260 = @simp.gen_rewrite_rule(fn(x257 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s258 = @equal.rand_conv(x257)
    fn(x259 : @kernel.Term) -> @kernel.Thm raise {
      s258(x259)
    }
  }, @list.List([@cpoly.poly_normalize_zero()]))
  let t262 = @tactics.first_assum(fn(x261 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s255 = @tactics.mp_tac(x254)
      fn(x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s255(x256)
      }
    })(t260(x261))
  })
  let t253 = @tactics.undisch_tac(@term_syntax.parse_term("degree((p : List[Complex])) == 0"))
  let t252 = @simp.gen_rewrite_tac(fn(x249 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s250 = @equal.land_conv(x249)
    fn(x251 : @kernel.Term) -> @kernel.Thm raise {
      s250(x251)
    }
  }, @list.List([@equal.gsym(@cpoly.poly_normalize())]))
  let t248 = @simp.asm_simp_tac(@list.List([@cpoly.normal_normalize(), @equal.gsym(@cpoly.poly_normalize_zero())]))
  let t247 = @tactics.exists_tac(@term_syntax.parse_term("LAST(normalize((p : List[Complex])))"))
  let t269 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(p : List[Complex])"), @cpoly.poly_normalize()))), t247), t248), t252), t253), t262), t263), t265), @lists.list_induct_tac), t266), t267), t268), @tactics.all_tac])
  let t246 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k : Complex, !(k == Cx(real_of_num(0))) && poly((p : List[Complex])) == poly([k])"), fn(x243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s244 = @tactics.mp_tac(x243)
    fn(x245 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s244(x245)
    }
  })
  let t242 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly_exp()]))
  let t240 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly_exp_v1(), @complexnumbers.complex_mul_lzero(), @complexnumbers.complex_pow_eq_0()]))
  let t236 = @term_syntax.parse_term("(z : Complex)")
  let t239 = @tactics.disch_then(@tactics.choose_then(fn(x238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x233 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s234 = @tactics.mp_tac(x233)
      fn(x235 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s234(x235)
      }
    })(((x237 : @kernel.Thm) => @bool.spec(t236, x237))(x238))
  }))
  let t232 = @simp.asm_rewrite_tac(@list.List([@cpoly.divides(), @class.fun_eq_thm(), @cpoly.poly_mul_v1()]))
  let t231 = @tactics.disch_then(fn(x228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x228
    let t230 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Complex)")), @tactics.disch_tac), t230)
  })
  let t227 = @simp.asm_rewrite_tac(@list.List([]))
  let t226 = @simp.asm_rewrite_tac(@list.List([]))
  let t224 = @term_syntax.parse_term("(q : List[Complex])")
  let t225 = @term_syntax.parse_term("(p : List[Complex])")
  let t241 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("degree((p : List[Complex]))"), t225, t224]), nullstellensatz_lemma())), t226), @tactics.disch_tac), @tactics.eq_tac), t227), t231), t232), t239), t240)])
  let t223 = @class.asm_cases_tac(@term_syntax.parse_term("degree((p : List[Complex])) == 0"))
  let t221 = @simp.rewrite_tac(@list.List([@complexnumbers.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith()]))
  let t220 = @simp.asm_rewrite_tac(@list.List([@cpoly.divides(), @class.fun_eq_thm(), @cpoly.poly_mul_v1(), @cpoly.poly(), @complexnumbers.complex_mul_lzero(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t219 = @simp.rewrite_tac(@list.List([@cpoly.degree(), @cpoly.normalize(), @lists.length(), @calc_num.arith(), @cpoly.poly_exp()]))
  let t216 = @drule.match_mp(@cpoly.degree_welldef())
  let t218 = @tactics.first_assum(fn(x217 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s214 = @tactics.subst1_tac(x213)
      fn(x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s214(x215)
      }
    })(t216(x217))
  })
  let t222 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@cpoly.poly()])), t218), t219), t220), t221), @tactics.all_tac])
  let t212 = @class.asm_cases_tac(@term_syntax.parse_term("poly((p : List[Complex])) == poly(NIL)"))
  let t277 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t212), t222), t223), t241), t242), t246), t269), t270), t271), t272), t273), t274), t275), t276)
  nullstellensatz_univariate_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], ∀ q : List[Complex], (∀ x : Complex, poly(p, x) == Cx(real_of_num(0)) → poly(q, x) == Cx(real_of_num(0))) == (divides(p, poly_exp(q, degree(p))) || poly(p) == poly(NIL) && poly(q) == poly(NIL))"), t277))
}

///|
let nullstellensatz_univariate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NULLSTELLENSATZ_UNIVARIATE")

///|
/// `NULLSTELLENSATZ_UNIVARIATE`
pub fn nullstellensatz_univariate() -> @kernel.Thm {
  nullstellensatz_univariate_c.get()
}

///|
/// CONSTANT_DEGREE
fn step_3() -> Unit raise {
  let t305 = @simp.simp_tac(@list.List([@lists.length(), @arith.pre(), @lists.length_eq_nil(), @cpoly.poly(), @complexnumbers.complex_mul_rzero()]))
  let t304 = @simp.rewrite_tac(@list.List([@cpoly.poly()]))
  let t303 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t301 = @term_syntax.parse_term("(l : List[Complex])")
  let t302 = @tactics.spec_tac(@term_syntax.parse_term("normalize((p : List[Complex]))"), t301)
  let t300 = @simp.rewrite_tac(@list.List([@cpoly.degree()]))
  let t306 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@cpoly.poly_normalize())])), t300), t302), t303), t304), t305)
  let t299 = @tactics.first_assum(fn(x298 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s296 = @tactics.accept_tac(x295)
      fn(x297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s296(x297)
      }
    })(@equal.gsym(x298))
  })
  let t294 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t293 = @tactics.match_mp_tac(@cpoly.degree_welldef())
  let t292 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) == (y : Num) → x == 0 → y == 0")))
  let t290 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t289 = @simp.rewrite_tac(@list.List([@lists.length()]))
  let t291 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cpoly.degree(), @cpoly.normalize()])), @class.cond_cases_tac), t289), t290), @tactics.all_tac])
  let t288 = @tactics.subgoal_then(@term_syntax.parse_term("degree([poly((p : List[Complex]), Cx(real_of_num(0)))]) == 0"), fn(x285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s286 = @tactics.mp_tac(x285)
    fn(x287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s286(x287)
    }
  })
  let t282 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t307 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_then(fn(x284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s279 = @tactics.assume_tac(x278)
        fn(x280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s279(x280)
        }
      })(@equal.gsym(x281))
    })(((x283 : @kernel.Thm) => @bool.spec(t282, x283))(x284))
  }), t288), t291), t292), t293), t294), t299), t306])
  let t308 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@fundamental.constant()]))), @tactics.eq_tac), t307)
  constant_degree_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], constant(poly(p)) == (degree(p) == 0)"), t308))
}

///|
let constant_degree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONSTANT_DEGREE")

///|
/// `CONSTANT_DEGREE`
pub fn constant_degree() -> @kernel.Thm {
  constant_degree_c.get()
}

///|
/// DIVIDES_DEGREE_LEMMA
fn step_4() -> Unit raise {
  let t373 = @tactics.undisch_tac(@term_syntax.parse_term("degree((r : List[Complex])) + 1 == SUC((n : Num))"))
  let t372 = @tactics.first_assum(@tactics.match_mp_tac)
  let t371 = @tactics.disch_then(fn(x368 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s369 = @tactics.subst_all_tac(x368)
    fn(x370 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s369(x370)
    }
  })
  let t366 = @simp.simp_tac(@list.List([@cpoly.poly(), @class.fun_eq_thm(), @cpoly.poly_mul_v1(), @complexnumbers.complex_entire()]))
  let t365 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(b : Bool) → !(a : Bool)) == (a → b)"))]))
  let t367 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!(poly(poly_mul((r : List[Complex]), (q : List[Complex]))) == poly(NIL))")), t365), t366), @tactics.all_tac])
  let t363 = @term_syntax.parse_term("-(a : Complex)")
  let t364 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(r : List[Complex])"), t363]), @cpoly.linear_mul_degree()))
  let t361 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero()]))
  let t360 = @simp.asm_rewrite_tac(@list.List([]))
  let t359 = @simp.once_rewrite_tac(@list.List([@cpoly.poly_mul_v1()]))
  let t358 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t357 = @simp.asm_rewrite_tac(@list.List([]))
  let t362 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(SUC((n : Num)) <= (m : Num) + 1) == (n <= m)"))])), @tactics.strip_tac), t357), t358), t359), t360), t361)])
  let t356 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) <= degree(poly_mul((r : List[Complex]), (q : List[Complex]))) || poly(poly_mul(r, q)) == poly(NIL)"), fn(x353 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s354 = @tactics.mp_tac(x353)
    fn(x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s354(x355)
    }
  })
  let t352 = @simp.asm_rewrite_tac(@list.List([]))
  let t351 = @simp.asm_rewrite_tac(@list.List([]))
  let t349 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero()]))
  let t348 = @simp.asm_rewrite_tac(@list.List([]))
  let t347 = @simp.once_rewrite_tac(@list.List([@cpoly.poly_mul_v1()]))
  let t350 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t347), t348), t349), @tactics.all_tac])
  let t346 = @class.asm_cases_tac(@term_syntax.parse_term("poly(poly_mul((r : List[Complex]), (q : List[Complex]))) == poly(NIL)"))
  let t344 = @term_syntax.parse_term("-(a : Complex)")
  let t345 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("poly_mul((r : List[Complex]), (q : List[Complex]))"), t344]), @cpoly.linear_mul_degree()))
  let t343 = @simp.asm_rewrite_tac(@list.List([]))
  let t340 = @drule.match_mp(@cpoly.degree_welldef())
  let t342 = @tactics.first_assum(fn(x341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s338 = @tactics.subst1_tac(x337)
      fn(x339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s338(x339)
      }
    })(t340(x341))
  })
  let t336 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @cpoly.poly_mul_v1(), @complexnumbers.complex_mul_assoc()])), @tactics.all_tac])
  let t335 = @tactics.subgoal_then(@term_syntax.parse_term("poly(poly_mul(poly_mul([-(a : Complex), Cx(real_of_num(1))], (r : List[Complex])), (q : List[Complex]))) == poly(poly_mul([-a, Cx(real_of_num(1))], poly_mul(r, q)))"), fn(x332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s333 = @tactics.assume_tac(x332)
    fn(x334 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s333(x334)
    }
  })
  let t331 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : List[Complex])"))(fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s329 = @tactics.subst_all_tac(x328)
    fn(x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s329(x330)
    }
  }))
  let t327 = @list.List([@simp.rewrite_tac(@list.List([@cpoly.poly_mul_v1(), @cpoly.poly(), @complexnumbers.complex_mul_lzero(), @class.fun_eq_thm()])), @tactics.all_tac])
  let t326 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s321 = @tactics.subst_all_tac(x320)
    fn(x322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s321(x322)
    }
  }, fn(x323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s324 = @tactics.mp_tac(x323)
    fn(x325 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s324(x325)
    }
  }))
  let t319 = @simp.gen_rewrite_tac(fn(x316 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s317 = @equal.land_conv(x316)
    fn(x318 : @kernel.Term) -> @kernel.Thm raise {
      s317(x318)
    }
  }, @list.List([@cpoly.poly_linear_divides()]))
  let t315 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : Complex)"))(fn(x312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s313 = @tactics.mp_tac(x312)
    fn(x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s313(x314)
    }
  }))
  let t311 = @simp.asm_rewrite_tac(@list.List([constant_degree(), @nums.not_suc()]))
  let t310 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(p : List[Complex])"), @fundamental.fundamental_theorem_of_algebra()))
  let t309 = @tactics.repeat_tac(@tactics.strip_tac)
  let t374 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.le_0()]))), t309), t310), t311), t315), t319), t326), t327), t331), t335), t336), t342), t343), t345), t346), t350), t351), @tactics.disch_tac), t352), t356), t362), t364), @tactics.ants_tac), t367), t371), t372), t373), @int.arith_tac)
  divides_degree_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ p : List[Complex], ∀ q : List[Complex], degree(p) == n → n <= degree(poly_mul(p, q)) || poly(poly_mul(p, q)) == poly(NIL)"), t374))
}

///|
let divides_degree_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_DEGREE_LEMMA")

///|
/// `DIVIDES_DEGREE_LEMMA`
pub fn divides_degree_lemma() -> @kernel.Thm {
  divides_degree_lemma_c.get()
}

///|
/// DIVIDES_DEGREE
fn step_5() -> Unit raise {
  let t384 = @meson.asm_meson_tac(@list.List([divides_degree_lemma()]))
  let t383 = @simp.asm_rewrite_tac(@list.List([]))
  let t380 = @drule.match_mp(@cpoly.degree_welldef())
  let t382 = @tactics.first_assum(fn(x381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s378 = @tactics.subst1_tac(x377)
      fn(x379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s378(x379)
      }
    })(t380(x381))
  })
  let t376 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : List[Complex])"))
  let t375 = @simp.rewrite_tac(@list.List([@cpoly.divides(), @theorems.left_imp_exists_thm()]))
  let t385 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t375), t376), @tactics.disch_tac), t382), t383), t384)
  divides_degree_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : List[Complex], ∀ q : List[Complex], divides(p, q) → degree(p) <= degree(q) || poly(q) == poly(NIL)"), t385))
}

///|
let divides_degree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDES_DEGREE")

///|
/// `DIVIDES_DEGREE`
pub fn divides_degree() -> @kernel.Thm {
  divides_degree_c.get()
}

///|
/// MPOLY_BASE_CONV
fn step_6() -> Unit raise {
  let t386 = @simp.rewrite_tac(@list.List([@cpoly.poly()]))
  let pth_0 = @tactics.prove(@term_syntax.parse_term("Cx(real_of_num(0)) == poly(NIL, (x : Complex))"), t386)
  let t387 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let pth_1 = @tactics.prove(@term_syntax.parse_term("(c : Complex) == poly([c], (x : Complex))"), t387)
  let t388 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_add_rid(), @complexnumbers.complex_mul_rid()]))
  let t389 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_add_lid(), @complexnumbers.complex_mul_rzero()])), t388)
  let pth_var = @tactics.prove(@term_syntax.parse_term("(x : Complex) == poly([Cx(real_of_num(0)), Cx(real_of_num(1))], x)"), t389)
  let zero_tm = @term_syntax.parse_term("Cx(real_of_num(0))")
  let c_tm = @term_syntax.parse_term("(c : Complex)")
  let x_tm = @term_syntax.parse_term("(x : Complex)")
  fn mpoly_base_conv_1(x390 : @list.List[@kernel.Term], x391 : @kernel.Term) -> @kernel.Thm raise {
    let avs = x390
    let tm = x391
    if @list.List::is_empty(avs) {
      @kernel.refl(tm)
    } else {
      if (tm == zero_tm) {
        @kernel.inst_rule(@list.List([(@lib.hd(avs), x_tm)]), pth_0)
      } else {
        if (tm == @lib.hd(avs)) {
          let th1 = @kernel.inst_rule(@list.List([(tm, x_tm)]), pth_var)
          let t397 = @kernel.rand(@kernel.concl(th1))
          let t394 = @lib.tl(avs)
          let t396 = @equal.land_conv((x395 : @kernel.Term) => mpoly_base_conv_1(t394, x395))
          let t392 = @lib.tl(avs)
          let th2 = @equal.land_conv(@equal.comb2_conv(@equal.rand_conv((x393 : @kernel.Term) => mpoly_base_conv_1(t392, x393)), t396))(t397)
          @kernel.trans(th1, th2)
        } else {
          let th1_1 = mpoly_base_conv_1(@lib.tl(avs), tm)
          let t398 = (@kernel.rand(@kernel.concl(th1_1)), c_tm)
          let th2_1 = @kernel.inst_rule(@list.List([(@lib.hd(avs), x_tm), t398]), pth_1)
          @kernel.trans(th1_1, th2_1)
        }
      }
    }
  }
  mpoly_base_conv_c.set(fn(x399 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x400 : @kernel.Term) -> @kernel.Thm raise {
      mpoly_base_conv_1(x399, x400)
    }
  })
}

///|
let mpoly_base_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("MPOLY_BASE_CONV")

///|
/// `MPOLY_BASE_CONV`
pub fn mpoly_base_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (mpoly_base_conv_c.get())(x)
}

///|
/// MPOLY_NORM_CONV
fn step_7() -> Unit raise {
  let t401 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_add_rid(), @complexnumbers.complex_mul_rzero()]))
  let pth_0 = @tactics.prove(@term_syntax.parse_term("poly([Cx(real_of_num(0))], (x : Complex)) == poly(NIL, x)"), t401)
  let t402 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_add_rid(), @complexnumbers.complex_mul_rzero()]))
  let pth_1 = @tactics.prove(@term_syntax.parse_term("poly([poly(NIL, (y : Complex))], (x : Complex)) == poly(NIL, x)"), t402)
  let conv_fwd : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@bool.conjunct2(@cpoly.poly()))
  let conv_bck : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@equal.gsym(@bool.conjunct2(@cpoly.poly())))
  let conv_0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x403 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x403
  }, @list.List([pth_0]))
  let conv_1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x404 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x404
  }, @list.List([pth_1]))
  let norm0_conv = (x405 : @kernel.Term) => norm0_conv_l(conv_0, conv_fwd, conv_bck, conv_1, x405)
  let norm1_conv = (x407 : @kernel.Term) => norm1_conv_l(conv_0, conv_fwd, conv_bck, conv_1, x407)
  mpoly_norm_conv_c.set(fn(x409 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let avs = x409
    @equal.try_conv(if @list.List::is_empty(avs) {
      norm0_conv
    } else {
      norm1_conv
    })
  })
}

///|
let mpoly_norm_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("MPOLY_NORM_CONV")

///|
/// `MPOLY_NORM_CONV`
pub fn mpoly_norm_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (mpoly_norm_conv_c.get())(x)
}

///|
fn norm0_conv_l(conv_0 : (@kernel.Term) -> @kernel.Thm raise, conv_fwd : (@kernel.Term) -> @kernel.Thm raise, conv_bck : (@kernel.Term) -> @kernel.Thm raise, conv_1 : (@kernel.Term) -> @kernel.Thm raise, x405 : @kernel.Term) -> @kernel.Thm raise {
  let norm0_conv = (x405 : @kernel.Term) => norm0_conv_l(conv_0, conv_fwd, conv_bck, conv_1, x405)
  let tm = x405
  let t406 = @equal.try_conv(norm0_conv)
  @equal.orelsec(conv_0, @equal.thenc(@equal.thenc(@equal.thenc(conv_fwd, @equal.rand_conv(@equal.rand_conv(norm0_conv))), conv_bck), t406))(tm)
}

///|
fn norm1_conv_l(conv_0 : (@kernel.Term) -> @kernel.Thm raise, conv_fwd : (@kernel.Term) -> @kernel.Thm raise, conv_bck : (@kernel.Term) -> @kernel.Thm raise, conv_1 : (@kernel.Term) -> @kernel.Thm raise, x407 : @kernel.Term) -> @kernel.Thm raise {
  let norm1_conv = (x407 : @kernel.Term) => norm1_conv_l(conv_0, conv_fwd, conv_bck, conv_1, x407)
  let tm_1 = x407
  let t408 = @equal.try_conv(norm1_conv)
  @equal.orelsec(conv_1, @equal.thenc(@equal.thenc(@equal.thenc(conv_fwd, @equal.rand_conv(@equal.rand_conv(norm1_conv))), conv_bck), t408))(tm_1)
}

///|
let mpoly_add_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("MPOLY_ADD_CONV")

///|
/// `MPOLY_ADD_CONV`
pub fn mpoly_add_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (mpoly_add_conv_c.get())(x)
}

///|
let mpoly_tadd_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("MPOLY_TADD_CONV")

///|
/// `MPOLY_TADD_CONV`
pub fn mpoly_tadd_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (mpoly_tadd_conv_c.get())(x)
}

///|
/// MPOLY_ADD_CONV, MPOLY_TADD_CONV
fn step_8() -> Unit raise {
  let add_conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x411 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x411
  }, @lib.butlast(@bool.conjuncts_rule(@cpoly.poly_add_clauses())))
  let add_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x412 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x412
  }, @list.List([@lib.last(@bool.conjuncts_rule(@cpoly.poly_add_clauses()))]))
  let add_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@equal.gsym(@cpoly.poly_add_v1()))
  let mpoly_add_conv = (x413 : @list.List[@kernel.Term], x414 : @kernel.Term) => mpoly_add_conv_l(add_conv, add_conv0, add_conv1, x413, x414)
  let mpoly_tadd_conv = (x417 : @list.List[@kernel.Term], x418 : @kernel.Term) => mpoly_tadd_conv_l(add_conv, add_conv0, add_conv1, x417, x418)
  let (mpoly_add_conv_1, mpoly_tadd_conv_1) = (fn(x423 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x424 : @kernel.Term) -> @kernel.Thm raise {
      mpoly_add_conv(x423, x424)
    }
  }, fn(x425 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x426 : @kernel.Term) -> @kernel.Thm raise {
      mpoly_tadd_conv(x425, x426)
    }
  })
  mpoly_add_conv_c.set(mpoly_add_conv_1)
  mpoly_tadd_conv_c.set(mpoly_tadd_conv_1)
}

///|
fn mpoly_add_conv_l(add_conv : (@kernel.Term) -> @kernel.Thm raise, add_conv0 : (@kernel.Term) -> @kernel.Thm raise, add_conv1 : (@kernel.Term) -> @kernel.Thm raise, x413 : @list.List[@kernel.Term], x414 : @kernel.Term) -> @kernel.Thm raise {
  let mpoly_tadd_conv = (x417 : @list.List[@kernel.Term], x418 : @kernel.Term) => mpoly_tadd_conv_l(add_conv, add_conv0, add_conv1, x417, x418)
  let avs = x413
  let tm = x414
  if @list.List::is_empty(avs) {
    @cpoly.complex_rat_add_conv(tm)
  } else {
    let t416 = mpoly_norm_conv(@lib.tl(avs))
    @equal.thenc(@equal.thenc(add_conv, @equal.land_conv((x415 : @kernel.Term) => mpoly_tadd_conv(avs, x415))), t416)(tm)
  }
}

///|
fn mpoly_tadd_conv_l(add_conv : (@kernel.Term) -> @kernel.Thm raise, add_conv0 : (@kernel.Term) -> @kernel.Thm raise, add_conv1 : (@kernel.Term) -> @kernel.Thm raise, x417 : @list.List[@kernel.Term], x418 : @kernel.Term) -> @kernel.Thm raise {
  let mpoly_add_conv = (x413 : @list.List[@kernel.Term], x414 : @kernel.Term) => mpoly_add_conv_l(add_conv, add_conv0, add_conv1, x413, x414)
  let mpoly_tadd_conv = (x417 : @list.List[@kernel.Term], x418 : @kernel.Term) => mpoly_tadd_conv_l(add_conv, add_conv0, add_conv1, x417, x418)
  let avs_1 = x417
  let tm_1 = x418
  let t422 = @equal.rand_conv((x421 : @kernel.Term) => mpoly_tadd_conv(avs_1, x421))
  let t419 = @lib.tl(avs_1)
  @equal.orelsec(add_conv0, @equal.thenc(@equal.thenc(add_conv1, @equal.land_conv((x420 : @kernel.Term) => mpoly_add_conv(t419, x420))), t422))(tm_1)
}

///|
let mpoly_cmul_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("MPOLY_CMUL_CONV")

///|
/// `MPOLY_CMUL_CONV`
pub fn mpoly_cmul_conv(x : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (mpoly_cmul_conv_c.get())(x)
}

///|
let mpoly_tcmul_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("MPOLY_TCMUL_CONV")

///|
/// `MPOLY_TCMUL_CONV`
pub fn mpoly_tcmul_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (mpoly_tcmul_conv_c.get())(x)
}

///|
let mpoly_mul_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("MPOLY_MUL_CONV")

///|
/// `MPOLY_MUL_CONV`
pub fn mpoly_mul_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (mpoly_mul_conv_c.get())(x)
}

///|
let mpoly_tmul_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("MPOLY_TMUL_CONV")

///|
/// `MPOLY_TMUL_CONV`
pub fn mpoly_tmul_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (mpoly_tmul_conv_c.get())(x)
}

///|
/// MPOLY_CMUL_CONV, MPOLY_TCMUL_CONV, MPOLY_MUL_CONV, MPOLY_TMUL_CONV
fn step_9() -> Unit raise {
  let cmul_conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x427 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x427
  }, @list.List([@bool.conjunct1(@cpoly.poly_cmul())]))
  let cmul_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x428 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x428
  }, @list.List([@bool.conjunct2(@cpoly.poly_cmul())]))
  let cmul_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@equal.gsym(@cpoly.poly_cmul_v1()))
  let mul_conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x429 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x429
  }, @list.List([@bool.conjunct1(@cpoly.poly_mul_clauses())]))
  let mul_conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x430 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x430
  }, @list.List([@bool.conjunct1(@bool.conjunct2(@cpoly.poly_mul_clauses()))]))
  let mul_conv2 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x431 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x431
  }, @list.List([@bool.conjunct2(@bool.conjunct2(@cpoly.poly_mul_clauses()))]))
  let mul_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@equal.gsym(@cpoly.poly_mul_v1()))
  let mpoly_cmul_conv = (x432 : @list.List[@kernel.Term], x433 : @kernel.Term) => mpoly_cmul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x432, x433)
  let mpoly_tcmul_conv = (x435 : @list.List[@kernel.Term], x436 : @kernel.Term) => mpoly_tcmul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x435, x436)
  let mpoly_mul_conv = (x441 : @list.List[@kernel.Term], x442 : @kernel.Term) => mpoly_mul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x441, x442)
  let mpoly_tmul_conv = (x444 : @list.List[@kernel.Term], x445 : @kernel.Term) => mpoly_tmul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x444, x445)
  let (mpoly_cmul_conv_1, mpoly_tcmul_conv_1, mpoly_mul_conv_1, mpoly_tmul_conv_1) = (fn(x452 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x453 : @kernel.Term) -> @kernel.Thm raise {
      mpoly_cmul_conv(x452, x453)
    }
  }, fn(x454 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x455 : @kernel.Term) -> @kernel.Thm raise {
      mpoly_tcmul_conv(x454, x455)
    }
  }, fn(x456 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x457 : @kernel.Term) -> @kernel.Thm raise {
      mpoly_mul_conv(x456, x457)
    }
  }, fn(x458 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x459 : @kernel.Term) -> @kernel.Thm raise {
      mpoly_tmul_conv(x458, x459)
    }
  })
  mpoly_cmul_conv_c.set(mpoly_cmul_conv_1)
  mpoly_tcmul_conv_c.set(mpoly_tcmul_conv_1)
  mpoly_mul_conv_c.set(mpoly_mul_conv_1)
  mpoly_tmul_conv_c.set(mpoly_tmul_conv_1)
}

///|
fn mpoly_cmul_conv_l(cmul_conv : (@kernel.Term) -> @kernel.Thm raise, cmul_conv0 : (@kernel.Term) -> @kernel.Thm raise, cmul_conv1 : (@kernel.Term) -> @kernel.Thm raise, mul_conv : (@kernel.Term) -> @kernel.Thm raise, mul_conv0 : (@kernel.Term) -> @kernel.Thm raise, mul_conv1 : (@kernel.Term) -> @kernel.Thm raise, mul_conv2 : (@kernel.Term) -> @kernel.Thm raise, x432 : @list.List[@kernel.Term], x433 : @kernel.Term) -> @kernel.Thm raise {
  let mpoly_tcmul_conv = (x435 : @list.List[@kernel.Term], x436 : @kernel.Term) => mpoly_tcmul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x435, x436)
  let avs = x432
  let tm = x433
  @equal.thenc(cmul_conv, @equal.land_conv((x434 : @kernel.Term) => mpoly_tcmul_conv(avs, x434)))(tm)
}

///|
fn mpoly_tcmul_conv_l(cmul_conv : (@kernel.Term) -> @kernel.Thm raise, cmul_conv0 : (@kernel.Term) -> @kernel.Thm raise, cmul_conv1 : (@kernel.Term) -> @kernel.Thm raise, mul_conv : (@kernel.Term) -> @kernel.Thm raise, mul_conv0 : (@kernel.Term) -> @kernel.Thm raise, mul_conv1 : (@kernel.Term) -> @kernel.Thm raise, mul_conv2 : (@kernel.Term) -> @kernel.Thm raise, x435 : @list.List[@kernel.Term], x436 : @kernel.Term) -> @kernel.Thm raise {
  let mpoly_tcmul_conv = (x435 : @list.List[@kernel.Term], x436 : @kernel.Term) => mpoly_tcmul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x435, x436)
  let mpoly_mul_conv = (x441 : @list.List[@kernel.Term], x442 : @kernel.Term) => mpoly_mul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x441, x442)
  let avs_1 = x435
  let tm_1 = x436
  let t440 = @equal.rand_conv((x439 : @kernel.Term) => mpoly_tcmul_conv(avs_1, x439))
  let t437 = @lib.tl(avs_1)
  @equal.orelsec(cmul_conv0, @equal.thenc(@equal.thenc(cmul_conv1, @equal.land_conv((x438 : @kernel.Term) => mpoly_mul_conv(t437, x438))), t440))(tm_1)
}

///|
fn mpoly_mul_conv_l(cmul_conv : (@kernel.Term) -> @kernel.Thm raise, cmul_conv0 : (@kernel.Term) -> @kernel.Thm raise, cmul_conv1 : (@kernel.Term) -> @kernel.Thm raise, mul_conv : (@kernel.Term) -> @kernel.Thm raise, mul_conv0 : (@kernel.Term) -> @kernel.Thm raise, mul_conv1 : (@kernel.Term) -> @kernel.Thm raise, mul_conv2 : (@kernel.Term) -> @kernel.Thm raise, x441 : @list.List[@kernel.Term], x442 : @kernel.Term) -> @kernel.Thm raise {
  let mpoly_tmul_conv = (x444 : @list.List[@kernel.Term], x445 : @kernel.Term) => mpoly_tmul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x444, x445)
  let avs_2 = x441
  let tm_2 = x442
  if @list.List::is_empty(avs_2) {
    @cpoly.complex_rat_mul_conv(tm_2)
  } else {
    @equal.thenc(mul_conv, @equal.land_conv((x443 : @kernel.Term) => mpoly_tmul_conv(avs_2, x443)))(tm_2)
  }
}

///|
fn mpoly_tmul_conv_l(cmul_conv : (@kernel.Term) -> @kernel.Thm raise, cmul_conv0 : (@kernel.Term) -> @kernel.Thm raise, cmul_conv1 : (@kernel.Term) -> @kernel.Thm raise, mul_conv : (@kernel.Term) -> @kernel.Thm raise, mul_conv0 : (@kernel.Term) -> @kernel.Thm raise, mul_conv1 : (@kernel.Term) -> @kernel.Thm raise, mul_conv2 : (@kernel.Term) -> @kernel.Thm raise, x444 : @list.List[@kernel.Term], x445 : @kernel.Term) -> @kernel.Thm raise {
  let mpoly_tcmul_conv = (x435 : @list.List[@kernel.Term], x436 : @kernel.Term) => mpoly_tcmul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x435, x436)
  let mpoly_tmul_conv = (x444 : @list.List[@kernel.Term], x445 : @kernel.Term) => mpoly_tmul_conv_l(cmul_conv, cmul_conv0, cmul_conv1, mul_conv, mul_conv0, mul_conv1, mul_conv2, x444, x445)
  let avs_3 = x444
  let tm_3 = x445
  let t450 = mpoly_tadd_conv(avs_3)
  let t449 = @equal.comb2_conv(@equal.rand_conv(mpoly_base_conv(@lib.tl(avs_3))), (x448 : @kernel.Term) => mpoly_tmul_conv(avs_3, x448))
  let t451 = @equal.thenc(@equal.thenc(mul_conv2, @equal.comb2_conv(@equal.rand_conv((x447 : @kernel.Term) => mpoly_tcmul_conv(avs_3, x447)), t449)), t450)
  @equal.orelsec(@equal.orelsec(mul_conv0, @equal.thenc(mul_conv1, (x446 : @kernel.Term) => mpoly_tcmul_conv(avs_3, x446))), t451)(tm_3)
}

///|
/// MPOLY_SUB_CONV
fn step_10() -> Unit raise {
  let pth = @tactics.prove(@term_syntax.parse_term("poly((p : List[Complex]), (x : Complex)) - poly((q : List[Complex]), x) == poly(p, x) + Cx(-real_of_num(1)) * poly(q, x)"), @complexnumbers.simple_complex_arith_tac)
  let apply_pth_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth)
  mpoly_sub_conv_c.set(fn(x460 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let avs = x460
    let t463 = mpoly_add_conv(avs)
    let t462 = mpoly_cmul_conv(avs)
    @equal.thenc(@equal.thenc(apply_pth_conv, @equal.rand_conv(@equal.thenc(@equal.land_conv(mpoly_base_conv(@lib.tl(avs))), t462))), t463)
  })
}

///|
let mpoly_sub_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("MPOLY_SUB_CONV")

///|
/// `MPOLY_SUB_CONV`
pub fn mpoly_sub_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (mpoly_sub_conv_c.get())(x)
}

///|
/// MPOLY_POW_CONV
fn step_11() -> Unit raise {
  let cnv_0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x464 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x464
  }, @list.List([@bool.conjunct1(@complexnumbers.complex_pow())]))
  let cnv_1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x465 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x465
  }, @list.List([@bool.conjunct2(@complexnumbers.complex_pow())]))
  fn mpoly_pow_conv_1(x466 : @list.List[@kernel.Term], x467 : @kernel.Term) -> @kernel.Thm raise {
    let avs = x466
    let tm = x467
    try {
      @equal.thenc(cnv_0, mpoly_base_conv(avs))(tm)
    } catch {
      Failure(_) => {
        let t470 = mpoly_mul_conv(avs)
        let t469 = @equal.rand_conv((x468 : @kernel.Term) => mpoly_pow_conv_1(avs, x468))
        @equal.thenc(@equal.thenc(@equal.thenc(@equal.rand_conv(@calc_num.num_conv), cnv_1), t469), t470)(tm)
      }
      e => raise e
    }
  }
  mpoly_pow_conv_c.set(fn(x471 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x472 : @kernel.Term) -> @kernel.Thm raise {
      mpoly_pow_conv_1(x471, x472)
    }
  })
}

///|
let mpoly_pow_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("MPOLY_POW_CONV")

///|
/// `MPOLY_POW_CONV`
pub fn mpoly_pow_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (mpoly_pow_conv_c.get())(x)
}

///|
/// POLYNATE_CONV
fn step_12() -> Unit raise {
  let elim_sub_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@cpoly.simple_complex_arith(@term_syntax.parse_term("(x : Complex) - (y : Complex) == x + Cx(-real_of_num(1)) * y")))
  let elim_neg_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@cpoly.simple_complex_arith(@term_syntax.parse_term("-(x : Complex) == Cx(-real_of_num(1)) * x")))
  let elim_pow_0_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x473 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x473
  }, @list.List([@bool.conjunct1(@complexnumbers.complex_pow())]))
  let t475 = @simp.gen_rewrite_conv(fn(x474 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x474
  }, @list.List([@bool.conjunct2(@complexnumbers.complex_pow())]))
  let elim_pow_1_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.rand_conv(@calc_num.num_conv), t475)
  fn elim_pow_conv(x476 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x476
    @equal.orelsec(elim_pow_0_conv, @equal.thenc(elim_pow_1_conv, @equal.rand_conv(elim_pow_conv)))(tm)
  }
  let t503 = (@term_syntax.parse_term("-(x : Complex)"), fn(x500 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let cnv_4 = x500
    fn(x501 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let avs_4 = x501
      @equal.thenc(elim_neg_conv, cnv_4(avs_4))
    }
  })
  let t504 = (@term_syntax.parse_term("(x : Complex) - (y : Complex)"), fn(x496 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let cnv_3 = x496
    fn(x497 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let avs_3 = x497
      let t499 = mpoly_sub_conv(avs_3)
      @equal.thenc(@equal.binop_conv(cnv_3(avs_3)), t499)
    }
  })
  let t505 = (@term_syntax.parse_term("(x : Complex) + (y : Complex)"), fn(x492 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let cnv_2 = x492
    fn(x493 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let avs_2 = x493
      let t495 = mpoly_add_conv(avs_2)
      @equal.thenc(@equal.binop_conv(cnv_2(avs_2)), t495)
    }
  })
  let t506 = (@term_syntax.parse_term("(x : Complex) * (y : Complex)"), fn(x488 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let cnv_1 = x488
    fn(x489 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let avs_1 = x489
      let t491 = mpoly_mul_conv(avs_1)
      @equal.thenc(@equal.binop_conv(cnv_1(avs_1)), t491)
    }
  })
  let polynet = @lib.itlist(fn(x481 : (@kernel.Term, ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise), x482 : @nets.Net[@simp.GconvOf[((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise]]) -> @nets.Net[@simp.GconvOf[((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise]] raise {
    let s483 = ((x480 : (@kernel.Term, ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise)) => @lib.uncurry(fn(x477 : @kernel.Term, x478 : ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) -> ((@nets.Net[@simp.GconvOf[((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise]]) -> @nets.Net[@simp.GconvOf[((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise]] raise) raise {
      fn(x479 : @nets.Net[@simp.GconvOf[((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise]]) -> @nets.Net[@simp.GconvOf[((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise]] raise {
        @simp.net_of_conv(x477, x478, x479)
      }
    }, x480))(x481)
    s483(x482)
  }, @list.List([(@term_syntax.parse_term("pow((x : Complex), (n : Num))"), fn(x484 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let cnv = x484
    fn(x485 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let avs = x485
      let t487 = mpoly_pow_conv(avs)
      @equal.thenc(@equal.land_conv(cnv(avs)), t487)
    }
  }), t506, t505, t504, t503]), @nets.empty_net())
  fn polynate_conv_1(x507 : @list.List[@kernel.Term], x508 : @kernel.Term) -> @kernel.Thm raise {
    let avs_5 = x507
    let tm_1 = x508
    try {
      (@lib.hd(@simp.gconv_pairs(@nets.lookup(tm_1, polynet))).1)(fn(x509 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        fn(x510 : @kernel.Term) -> @kernel.Thm raise {
          polynate_conv_1(x509, x510)
        }
      })(avs_5)(tm_1)
    } catch {
      Failure(_) => mpoly_base_conv(avs_5)(tm_1)
      e => raise e
    }
  }
  polynate_conv_c.set(fn(x511 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x512 : @kernel.Term) -> @kernel.Thm raise {
      polynate_conv_1(x511, x512)
    }
  })
}

///|
let polynate_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> @equal.Conv raise] = @lib.Cell::new("POLYNATE_CONV")

///|
/// `POLYNATE_CONV`
pub fn polynate_conv(x : @list.List[@kernel.Term]) -> @equal.Conv raise {
  (polynate_conv_c.get())(x)
}

///|
/// POLY_PAD_RULE
fn step_13() -> Unit raise {
  let t513 = @simp.simp_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_lid()]))
  let pth = @tactics.prove(@term_syntax.parse_term("poly((p : List[Complex]), (x : Complex)) == Cx(real_of_num(0)) → poly(CONS(Cx(real_of_num(0)), p), x) == Cx(real_of_num(0))"), t513)
  let match_pth : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth)
  poly_pad_rule_c.set(fn(x514 : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let avs = x514
    fn(x515 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x515
      let th1 = match_pth(th)
      @equal.conv_rule(@lib.funpow(3, fn(x516 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s517 = @equal.land_conv(x516)
        fn(x518 : @kernel.Term) -> @kernel.Thm raise {
          s517(x518)
        }
      }, mpoly_base_conv(@lib.tl(avs))), th1)
    }
  })
}

///|
let poly_pad_rule_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] = @lib.Cell::new("POLY_PAD_RULE")

///|
/// `POLY_PAD_RULE`
pub fn poly_pad_rule(x : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  (poly_pad_rule_c.get())(x)
}

///|
/// POLY_CANCEL_EQ_CONV
fn step_14() -> Unit raise {
  let t519 = @simp.simp_tac(@list.List([@complexnumbers.complex_mul_rzero(), @complexnumbers.complex_sub_rzero(), @complexnumbers.complex_entire()]))
  let pth_1 = @tactics.prove(@term_syntax.parse_term("(p : Complex) == Cx(real_of_num(0)) && !((a : Complex) == Cx(real_of_num(0))) → (∀ q : Complex, ∀ b : Complex, (q == Cx(real_of_num(0))) == (a * q - b * p == Cx(real_of_num(0))))"), t519)
  let match_cancel_thm : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth_1)
  fn poly_cancel_eq_conv_1(x520 : @list.List[@kernel.Term], x521 : Int64, x522 : @kernel.Thm, x523 : @kernel.Thm, x524 : @kernel.Term) -> @kernel.Thm raise {
    let avs = x520
    let n = x521
    let ath = x522
    let eth = x523
    let tm = x524
    let m = Int::to_int64(@lib.length(@basics.dest_list(@equal.lhand(@equal.lhand(tm)))))
    if (m < n) {
      @kernel.refl(tm)
    } else {
      let t525 = poly_pad_rule(avs)
      let th1 = @lib.funpow(@lib.int63_to_int(@lib.sub63(m, n)), t525, eth)
      let th2 = match_cancel_thm(@bool.conj(th1, ath))
      let t526 = @lib.last(@basics.dest_list(@equal.lhand(@equal.lhs(tm))))
      let th3 = @bool.specl(@list.List([@equal.lhs(tm), t526]), th2)
      let th4 = @equal.conv_rule(@equal.rand_conv(@equal.land_conv(@equal.binop_conv(mpoly_cmul_conv(avs)))), th3)
      let th5 = @equal.conv_rule(@equal.rand_conv(@equal.land_conv(mpoly_sub_conv(avs))), th4)
      @kernel.trans(th5, poly_cancel_eq_conv_1(avs, n, ath, eth, @kernel.rand(@kernel.concl(th5))))
    }
  }
  poly_cancel_eq_conv_c.set(fn(x527 : @list.List[@kernel.Term]) -> ((Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise) raise {
    fn(x528 : Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
      fn(x529 : @kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
        fn(x530 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x531 : @kernel.Term) -> @kernel.Thm raise {
            poly_cancel_eq_conv_1(x527, x528, x529, x530, x531)
          }
        }
      }
    }
  })
}

///|
let poly_cancel_eq_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise) raise] = @lib.Cell::new("POLY_CANCEL_EQ_CONV")

///|
/// `POLY_CANCEL_EQ_CONV`
pub fn poly_cancel_eq_conv(x : @list.List[@kernel.Term]) -> ((Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise) raise {
  (poly_cancel_eq_conv_c.get())(x)
}

///|
/// RESOLVE_EQ_RAW
fn step_15() -> Unit raise {
  let t532 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let pth = @tactics.prove(@term_syntax.parse_term("poly(NIL, (x : Complex)) == Cx(real_of_num(0)) && poly([(c : Complex)], x) == c"), t532)
  let rewrite_pth : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x533 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s534 = @equal.land_conv(x533)
    fn(x535 : @kernel.Term) -> @kernel.Thm raise {
      s534(x535)
    }
  }, @list.List([pth]))
  fn resolve_eq(x536 : @list.List[@kernel.Thm], x537 : @kernel.Term) -> @kernel.Thm raise {
    let asm_ = x536
    let tm = x537
    try {
      @bool.eqt_intro(@lib.find(fn(x538 : @kernel.Thm) -> Bool raise {
        let th = x538
        (@kernel.concl(th) == tm)
      }, asm_))
    } catch {
      Failure(_) => {
        let tm_p = @bool.mk_neg(tm)
        try {
          @bool.eqf_intro(@lib.find(fn(x539 : @kernel.Thm) -> Bool raise {
            let th_1 = x539
            (@kernel.concl(th_1) == tm_p)
          }, asm_))
        } catch {
          Failure(_) => {
            try {
              let th1 = rewrite_pth(tm)
              @kernel.trans(th1, resolve_eq(asm_, @kernel.rand(@kernel.concl(th1))))
            } catch {
              Failure(_) => @cpoly.complex_rat_eq_conv(tm)
              e => raise e
            }
          }
          e => raise e
        }
      }
      e => raise e
    }
  }
  resolve_eq_raw_c.set(fn(x540 : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x541 : @kernel.Term) -> @kernel.Thm raise {
      resolve_eq(x540, x541)
    }
  })
}

///|
let resolve_eq_raw_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("RESOLVE_EQ_RAW")

///|
/// `RESOLVE_EQ_RAW`
pub fn resolve_eq_raw(x : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (resolve_eq_raw_c.get())(x)
}

///|
/// `RESOLVE_EQ`
pub fn resolve_eq(x542 : @list.List[@kernel.Thm], x543 : @kernel.Term) -> @kernel.Thm raise {
  let asm_ = x542
  let tm = x543
  let th = resolve_eq_raw(asm_)(tm)
  try {
    @bool.eqf_elim(th)
  } catch {
    Failure(_) => @bool.eqt_elim(th)
    e => raise e
  }
}

///|
/// RESOLVE_EQ_THEN
fn step_16() -> Unit raise {
  let match_pth : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) == (q1 : Bool)) && (!p → q == (q2 : Bool)) → q == (p && q1 || !p && q2)")))
  resolve_eq_then_c.set(fn(x544 : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> (((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> @kernel.Thm raise) raise) raise) raise {
    let asm_ = x544
    fn(x545 : @kernel.Term) -> (((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> @kernel.Thm raise) raise) raise {
      let tm = x545
      fn(x546 : (@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> @kernel.Thm raise) raise {
        let yfn = x546
        fn(x547 : (@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> @kernel.Thm raise {
          let nfn = x547
          try {
            let th = resolve_eq(asm_, tm)
            if @basics.is_neg(@kernel.concl(th)) {
              nfn(asm_.prepend(th))(th)
            } else {
              yfn(asm_.prepend(th))(th)
            }
          } catch {
            Failure(_) => {
              let tm_p = @bool.mk_neg(tm)
              let t548 = @kernel.assume_rule(tm)
              let yth = @bool.disch(tm, yfn(asm_.prepend(@kernel.assume_rule(tm)))(t548))
              let t549 = @kernel.assume_rule(tm_p)
              let nth = @bool.disch(tm_p, nfn(asm_.prepend(@kernel.assume_rule(tm_p)))(t549))
              match_pth(@bool.conj(yth, nth))
            }
            e => raise e
          }
        }
      }
    }
  })
}

///|
let resolve_eq_then_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@kernel.Term) -> (((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> @kernel.Thm raise) raise) raise) raise] = @lib.Cell::new("RESOLVE_EQ_THEN")

///|
/// `RESOLVE_EQ_THEN`
pub fn resolve_eq_then(x : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> (((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) -> @kernel.Thm raise) raise) raise) raise {
  (resolve_eq_then_c.get())(x)
}

///|
/// `POLY_CANCEL_ENE_CONV`
pub fn poly_cancel_ene_conv(x550 : @list.List[@kernel.Term], x551 : Int64, x552 : @kernel.Thm, x553 : @kernel.Thm, x554 : @kernel.Term) -> @kernel.Thm raise {
  let avs = x550
  let n = x551
  let ath = x552
  let eth = x553
  let tm = x554
  if @basics.is_neg(tm) {
    @equal.rand_conv(poly_cancel_eq_conv(avs)(n)(ath)(eth))(tm)
  } else {
    poly_cancel_eq_conv(avs)(n)(ath)(eth)(tm)
  }
}

///|
/// RESOLVE_NE
fn step_17() -> Unit raise {
  let negate_negate_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(fn(x555 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x555
  }, @list.List([@class.taut(@term_syntax.parse_term("(p : Bool) == (!p == false)"))]))
  resolve_ne_c.set(fn(x556 : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let asm_ = x556
    fn(x557 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x557
      try {
        let th = resolve_eq(asm_, @kernel.rand(tm))
        if @basics.is_neg(@kernel.concl(th)) {
          @bool.eqt_intro(th)
        } else {
          negate_negate_rule(th)
        }
      } catch {
        Failure(_) => @kernel.refl(tm)
        e => raise e
      }
    }
  })
}

///|
let resolve_ne_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("RESOLVE_NE")

///|
/// `RESOLVE_NE`
pub fn resolve_ne(x : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (resolve_ne_c.get())(x)
}

///|
/// LAST_CONV
fn step_18() -> Unit raise {
  last_conv_c.set(@simp.gen_rewrite_conv(fn(x558 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s559 = @equal.repeatc(x558)
    fn(x560 : @kernel.Term) -> @kernel.Thm raise {
      s559(x560)
    }
  }, @list.List([@lists.last_clauses()])))
}

///|
let last_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("LAST_CONV")

///|
/// `LAST_CONV`
pub fn last_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (last_conv_c.get())(x)
}

///|
/// LENGTH_CONV
fn step_19() -> Unit raise {
  let cnv_0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x561 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x561
  }, @list.List([@bool.conjunct1(@lists.length())]))
  let cnv_1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x562 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x562
  }, @list.List([@bool.conjunct2(@lists.length())]))
  fn length_conv_1(x563 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x563
    try {
      cnv_0(tm)
    } catch {
      Failure(_) => @equal.thenc(@equal.thenc(cnv_1, @equal.rand_conv(length_conv_1)), @calc_num.num_suc_conv)(tm)
      e => raise e
    }
  }
  length_conv_c.set(length_conv_1)
}

///|
let length_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("LENGTH_CONV")

///|
/// `LENGTH_CONV`
pub fn length_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (length_conv_c.get())(x)
}

///|
/// EXPAND_EX_BETA_CONV
fn step_20() -> Unit raise {
  let t564 = @simp.rewrite_tac(@list.List([@lists.ex()]))
  let pth = @tactics.prove(@term_syntax.parse_term("EX((P : (_) -> Bool), [(c : _)]) == P(c)"), t564)
  let cnv_0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x565 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x565
  }, @list.List([@bool.conjunct1(@lists.ex())]))
  let cnv_1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x566 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x566
  }, @list.List([pth]))
  let cnv_2 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x567 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x567
  }, @list.List([@bool.conjunct2(@lists.ex())]))
  fn expand_ex_beta_conv_1(x568 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x568
    try {
      @equal.thenc(cnv_1, @equal.beta_conv)(tm)
    } catch {
      Failure(_) => {
        try {
          @equal.thenc(cnv_2, @equal.comb2_conv(@equal.rand_conv(@equal.beta_conv), expand_ex_beta_conv_1))(tm)
        } catch {
          Failure(_) => cnv_0(tm)
          e => raise e
        }
      }
      e => raise e
    }
  }
  expand_ex_beta_conv_c.set(expand_ex_beta_conv_1)
}

///|
let expand_ex_beta_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("EXPAND_EX_BETA_CONV")

///|
/// `EXPAND_EX_BETA_CONV`
pub fn expand_ex_beta_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (expand_ex_beta_conv_c.get())(x)
}

///|
/// POLY_DIVIDES_PAD_RULE
fn step_21() -> Unit raise {
  let t575 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_mul_ac()]))
  let t574 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_lid(), @complexnumbers.complex_add_rid(), @complexnumbers.complex_mul_rid(), @cpoly.poly_mul_v1()]))
  let t573 = @tactics.exists_tac(@term_syntax.parse_term("poly_mul([Cx(real_of_num(0)), Cx(real_of_num(1))], (r : List[Complex]))"))
  let t572 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : List[Complex])"))(fn(x569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s570 = @tactics.assume_tac(x569)
    fn(x571 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s570(x571)
    }
  }))
  let t576 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cpoly.divides(), @class.fun_eq_thm(), @cpoly.poly_mul_v1(), @cpoly.poly(), @complexnumbers.complex_add_lid()])), t572), t573), t574), t575)
  let pth = @tactics.prove(@term_syntax.parse_term("divides((p : List[Complex]), (q : List[Complex])) → divides(p, CONS(Cx(real_of_num(0)), q))"), t576)
  let apply_pth : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth)
  poly_divides_pad_rule_c.set(fn(x577 : @list.List[@kernel.Term]) -> ((Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let avs = x577
    fn(x578 : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let n = x578
      fn(x579 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x579
        let t583 = @bool.spec(tm, @cpoly.poly_divides_refl())
        let t580 = @equal.rand_conv(@equal.land_conv(mpoly_base_conv(@lib.tl(avs))))
        @lib.funpow(@lib.int63_to_int(n), fn(x582 : @kernel.Thm) -> @kernel.Thm raise {
          ((x581 : @kernel.Thm) => @equal.conv_rule(t580, x581))(apply_pth(x582))
        }, t583)
      }
    }
  })
}

///|
let poly_divides_pad_rule_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("POLY_DIVIDES_PAD_RULE")

///|
/// `POLY_DIVIDES_PAD_RULE`
pub fn poly_divides_pad_rule(x : @list.List[@kernel.Term]) -> ((Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  (poly_divides_pad_rule_c.get())(x)
}

///|
/// POLY_DIVIDES_PAD_CONST_RULE
fn step_22() -> Unit raise {
  let t590 = @simp.asm_rewrite_tac(@list.List([@cpoly.poly_mul_v1(), @cpoly.poly()]))
  let t589 = @tactics.exists_tac(@term_syntax.parse_term("poly_mul([(a : Complex)], (r : List[Complex]))"))
  let t588 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Complex)"))
  let t587 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : List[Complex])"))(fn(x584 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s585 = @tactics.assume_tac(x584)
    fn(x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s585(x586)
    }
  }))
  let t591 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @cpoly.divides(), @cpoly.poly_cmul_v1(), @cpoly.poly_mul_v1()])), t587), t588), t589), t590), @complexnumbers.simple_complex_arith_tac)
  let pth = @tactics.prove(@term_syntax.parse_term("divides((p : List[Complex]), (q : List[Complex])) → (∀ a : Complex, divides(p, poly_cmul(a, q)))"), t591)
  let apply_pth : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth)
  poly_divides_pad_const_rule_c.set(fn(x592 : @list.List[@kernel.Term]) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
    let avs = x592
    fn(x593 : Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
      let n = x593
      fn(x594 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let a = x594
        fn(x595 : @kernel.Term) -> @kernel.Thm raise {
          let tm = x595
          let th1 = poly_divides_pad_rule(avs)(n)(tm)
          let th2 = @bool.spec(a, apply_pth(th1))
          @equal.conv_rule(@equal.rand_conv(mpoly_tcmul_conv(avs)), th2)
        }
      }
    }
  })
}

///|
let poly_divides_pad_const_rule_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise] = @lib.Cell::new("POLY_DIVIDES_PAD_CONST_RULE")

///|
/// `POLY_DIVIDES_PAD_CONST_RULE`
pub fn poly_divides_pad_const_rule(x : @list.List[@kernel.Term]) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
  (poly_divides_pad_const_rule_c.get())(x)
}

///|
/// `EXPAND_EX_BETA_RESOLVE_CONV`
pub fn expand_ex_beta_resolve_conv(x596 : @list.List[@kernel.Thm], x597 : @kernel.Term) -> @kernel.Thm raise {
  let asm_ = x596
  let tm = x597
  let th1 = expand_ex_beta_conv(tm)
  let djs = @basics.disjuncts(@kernel.rand(@kernel.concl(th1)))
  let th2 = @lib.end_itlist(@drule.mk_disj_rule, @lib.map(resolve_ne(asm_), djs))
  @kernel.trans(th1, th2)
}

///|
/// POLY_DIVIDES_CONV
fn step_23() -> Unit raise {
  let t617 = @simp.rewrite_tac(@list.List([@cpoly.length_normalize_le()]))
  let t616 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → PRE(m) <= n - 1")))
  let t615 = @list.List([@meson.asm_meson_tac(@list.List([@lists.length_eq_nil()])), @tactics.all_tac])
  let t612 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(lq : Num) < (lp : Num) → !(lq == 0) && (dq : Num) <= lq - 1 → dq < lp - 1")))
  let t614 = @tactics.first_assum(fn(x613 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t612(x613))
  })
  let t611 = @simp.rewrite_tac(@list.List([@cpoly.degree()]))
  let t610 = @simp.asm_simp_tac(@list.List([@cpoly.normal_degree()]))
  let t609 = @simp.rewrite_tac(@list.List([@arith.not_le()]))
  let t608 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(b : Bool) → !(a : Bool)) → a || b → b")))
  let t605 = @drule.match_mp(divides_degree())
  let t607 = @tactics.disch_then(fn(x606 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s603 = @tactics.mp_tac(x602)
      fn(x604 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s603(x604)
      }
    })(t605(x606))
  })
  let t600 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero()]))
  let t599 = @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Complex])"))
  let t601 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@cpoly.divides(), @cpoly.poly_mul_v1(), @class.fun_eq_thm()])), @tactics.disch_tac), t599), t600)])
  let t598 = @simp.rewrite_tac(@list.List([@lists.not_ex(), @equal.gsym(@cpoly.poly_zero())]))
  let t618 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t598), @tactics.eq_tac), t601), t607), t608), @tactics.disch_tac), t609), t610), t611), t614), @tactics.conj_tac), t615), t616), t617)
  let pth_0 = @tactics.prove(@term_syntax.parse_term("LENGTH((q : List[Complex])) < LENGTH((p : List[Complex])) → !(LAST(p) == Cx(real_of_num(0))) → divides(p, q) == !EX((c : Complex) => !(c == Cx(real_of_num(0))), q)"), t618)
  let apply_pth0 : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x620 : @kernel.Term) -> @kernel.Term raise {
    (fn(x619 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rand(x619))
    })(@kernel.rand(x620))
  }, pth_0)
  let t662 = @simp.asm_simp_tac(@list.List([@complexnumbers.complex_mul_assoc(), @complexnumbers.complex_mul_linv(), @complexnumbers.complex_mul_lid()]))
  let t658 = @term_syntax.parse_term("op_star(inv((a : Complex)))")
  let t661 = @tactics.disch_then(fn(x660 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x655 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s656 = @tactics.mp_tac(x655)
      fn(x657 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s656(x657)
      }
    })(((x659 : @kernel.Thm) => @equal.ap_term(t658, x659))(x660))
  })
  let t651 = @term_syntax.parse_term("(z : Complex)")
  let t654 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x653 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s649 = @tactics.mp_tac(x648)
      fn(x650 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s649(x650)
      }
    })(((x652 : @kernel.Thm) => @bool.spec(t651, x652))(x653))
  }), @complexnumbers.simple_complex_arith_tac), @tactics.all_tac])
  let t647 = @tactics.subgoal_then(@term_syntax.parse_term("(a : Complex) * poly((q : List[Complex]), (z : Complex)) == (poly((t : List[Complex]), z) + poly((s : List[Complex]), z)) * poly((p : List[Complex]), z)"), fn(x644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s645 = @tactics.mp_tac(x644)
    fn(x646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s645(x646)
    }
  })
  let t643 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let t642 = @simp.rewrite_tac(@list.List([@cpoly.poly_mul_v1(), @cpoly.poly_add_v1(), @equal.gsym(@complexnumbers.complex_mul_assoc())]))
  let t641 = @simp.once_rewrite_tac(@list.List([@complexnumbers.complex_mul_sym()]))
  let t640 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Complex)"))
  let t639 = @tactics.exists_tac(@term_syntax.parse_term("poly_mul([inv((a : Complex))], poly_add((t : List[Complex]), (s : List[Complex])))"))
  let t663 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cpoly.poly_mul_v1()])), @tactics.disch_tac), t639), t640), t641), t642), t643), t647), t654), t661), t662)
  let t638 = @simp.rewrite_tac(@list.List([@cpoly.poly()]))
  let t637 = @simp.rewrite_tac(@list.List([@cpoly.poly_mul_v1(), @cpoly.poly_add_v1(), @cpoly.poly_cmul_v1()]))
  let t636 = @tactics.exists_tac(@term_syntax.parse_term("poly_add(poly_cmul((a : Complex), (s : List[Complex])), poly_cmul(-Cx(real_of_num(1)), (t : List[Complex])))"))
  let t664 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x634
    @simp.rewrite_tac(@list.List([th_1]))
  }), t636), t637), t638), @complexnumbers.simple_complex_arith_tac), t663])
  let t633 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : List[Complex])"))(fn(x630 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s631 = @tactics.mp_tac(x630)
    fn(x632 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s631(x632)
    }
  }))
  let t629 = @tactics.disch_then(fn(x627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x627
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t626 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @cpoly.poly_mul_v1()]))
  let t625 = @tactics.disch_then(fn(x622 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s623 = @tactics.subst1_tac(x622)
    fn(x624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s623(x624)
    }
  })
  let t621 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : List[Complex])"))
  let t665 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.rewrite_tac(@list.List([@cpoly.divides(), @theorems.left_imp_exists_thm()]))), t621), t625), t626), t629), @tactics.eq_tac), t633), t664)
  let pth_1 = @tactics.prove(@term_syntax.parse_term("!((a : Complex) == Cx(real_of_num(0))) → divides((p : List[Complex]), (p' : List[Complex])) → (∀ x : Complex, a * poly((q : List[Complex]), x) - poly(p', x) == poly((r : List[Complex]), x)) → divides(p, q) == divides(p, r)"), t665)
  let match_pth1 : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth_1)
  fn divide_step_conv(x666 : @list.List[@kernel.Term], x667 : (@kernel.Term) -> @kernel.Thm raise, x668 : Int64, x669 : @kernel.Term) -> @kernel.Thm raise {
    let avs = x666
    let sfn = x667
    let n = x668
    let tm = x669
    let m = Int::to_int64(@lib.length(@basics.dest_list(@kernel.rand(tm))))
    if (m < n) {
      @kernel.refl(tm)
    } else {
      let t670 = @equal.lhand(tm)
      let t671 = @lib.last(@basics.dest_list(@kernel.rand(tm)))
      let t672 = @lib.sub63(m, n)
      let th1 = poly_divides_pad_const_rule(avs)(t672)(t671)(t670)
      let th2 = @drule.match_mp(sfn(tm))(th1)
      let (av, bod) = @basics.dest_forall(@equal.lhand(@kernel.concl(th2)))
      let t673 = @equal.lhand(bod)
      let tm1 = @kernel.vsubst(@list.List([(@lib.hd(avs), av)]), t673)
      let t674 = mpoly_sub_conv(avs)
      let th3 = @equal.thenc(@equal.land_conv(mpoly_cmul_conv(avs)), t674)(tm1)
      let t675 = @bool.gen(@lib.hd(avs), th3)
      let th4 = @drule.match_mp(th2)(t675)
      @kernel.trans(th4, divide_step_conv(avs, sfn, n, @kernel.rand(@kernel.concl(th4))))
    }
  }
  let zero_tm = @term_syntax.parse_term("Cx(real_of_num(0))")
  poly_divides_conv_c.set(fn(x676 : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let asm_ = x676
    fn(x677 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let avs_1 = x677
      fn(x678 : @kernel.Term) -> @kernel.Thm raise {
        let tm_1 = x678
        let ath = resolve_eq(asm_, @basics.mk_eq(@lib.last(@basics.dest_list(@equal.lhand(tm_1))), zero_tm))
        let sfn_1 : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x680 : @kernel.Term) -> @kernel.Term raise {
          (fn(x679 : @kernel.Term) -> @kernel.Term raise {
            @equal.lhand(@kernel.rand(x679))
          })(@kernel.rand(x680))
        }, match_pth1(ath))
        let n_1 = Int::to_int64(@lib.length(@basics.dest_list(@equal.lhand(tm_1))))
        let th1_1 = divide_step_conv(avs_1, sfn_1, n_1, tm_1)
        let th2_1 = apply_pth0(@kernel.rand(@kernel.concl(th1_1)))
        let t681 = @equal.lhand(@kernel.concl(th2_1))
        let th3_1 = @equal.thenc(@equal.binop_conv(length_conv), @calc_num.num_lt_conv)(t681)
        let th4_1 = @bool.mp(th2_1, @bool.eqt_elim(th3_1))
        let th5 = @equal.conv_rule(@equal.land_conv(@equal.rand_conv(@equal.land_conv(last_conv))), th4_1)
        let th6 = @kernel.trans(th1_1, @bool.mp(th5, ath))
        @equal.conv_rule(@equal.rand_conv(@equal.rand_conv((x682 : @kernel.Term) => expand_ex_beta_resolve_conv(asm_, x682))), th6)
      }
    }
  })
}

///|
let poly_divides_conv_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("POLY_DIVIDES_CONV")

///|
/// `POLY_DIVIDES_CONV`
pub fn poly_divides_conv(x : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  (poly_divides_conv_c.get())(x)
}

///|
/// BASIC_QUELIM_CONV
fn step_24() -> Unit raise {
  let t683 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let pth_1 = @tactics.prove(@term_syntax.parse_term("(∃ x : Complex, poly((p : List[Complex]), x) == Cx(real_of_num(0)) && !(poly(NIL, x) == Cx(real_of_num(0)))) == false && (∃ x : Complex, !(poly(NIL, x) == Cx(real_of_num(0)))) == false && (∃ x : Complex, !(poly([(c : Complex)], x) == Cx(real_of_num(0)))) == !(c == Cx(real_of_num(0))) && (∃ x : Complex, poly(NIL, x) == Cx(real_of_num(0))) == true && (∃ x : Complex, poly([c], x) == Cx(real_of_num(0))) == (c == Cx(real_of_num(0)))"), t683)
  let apply_pth1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x684 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x684
  }, @list.List([pth_1]))
  let t712 = @simp.asm_rewrite_tac(@list.List([@lists.all()]))
  let t711 = @simp.rewrite_tac(@list.List([@lists.last()]))
  let t710 = @tactics.first_assum(fn(x709 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x707 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x702 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s703 = @tactics.undisch_tac(x702)
        fn(x704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s703(x704)
        }
      })(((x706 : @kernel.Term) => @lib.check(fn(x705 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x705)
      }, x706))(x707))
    })((fn(x708 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x708)
    })(x709))
  })
  let t701 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.not_cons_nil()]))
  let t700 = @simp.once_rewrite_tac(@list.List([@lists.last()]))
  let t698 = @term_syntax.parse_term("(p : List[Complex])")
  let t699 = @tactics.spec_tac(@term_syntax.parse_term("(p : List[Complex])"), t698)
  let t697 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)"))]))
  let t696 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t695 = @simp.once_rewrite_tac(@list.List([@lists.last()]))
  let t694 = @tactics.undisch_tac(@term_syntax.parse_term("!(LAST(CONS((a : Complex), CONS((b : Complex), (p : List[Complex])))) == Cx(real_of_num(0)))"))
  let t693 = @tactics.subgoal_then(@term_syntax.parse_term("!ALL((c : Complex) => c == Cx(real_of_num(0)), CONS((b : Complex), (p : List[Complex])))"), fn(x690 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x690
    let t692 = @simp.asm_rewrite_tac(@list.List([]))
    @tactics.then_tac(@tactics.mp_tac(th), t692)
  })
  let t689 = @tactics.repeat_tac(@tactics.strip_tac)
  let t688 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @lists.cons_11()]))
  let t687 = @tactics.disch_then(@tactics.match_mp_tac)
  let t686 = @simp.rewrite_tac(@list.List([]))
  let t685 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("CONS((a : Complex), CONS((b : Complex), (p : List[Complex])))"), @fundamental.fundamental_theorem_of_algebra_alt()))
  let t713 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t685), t686), t687), t688), t689), t693), t694), t695), t696), t697), t699), @lists.list_induct_tac), t700), t701), @tactics.strip_tac), t710), t711), @class.cond_cases_tac), t712)
  let pth_2 = @tactics.prove(@term_syntax.parse_term("!(LAST(CONS((a : Complex), CONS((b : Complex), (p : List[Complex])))) == Cx(real_of_num(0))) → (∃ x : Complex, poly(CONS(a, CONS(b, p)), x) == Cx(real_of_num(0))) == true"), t713)
  let apply_pth2 : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x714 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x714))
  }, pth_2)
  let t716 = @simp.rewrite_tac(@list.List([@lists.not_ex(), @equal.gsym(@cpoly.poly_zero()), @cpoly.poly(), @class.fun_eq_thm()]))
  let t715 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) == (b : Bool)) == (a == !b)"))]))
  let t717 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@class.not_forall_thm())])), t715), t716)
  let pth_2b = @tactics.prove(@term_syntax.parse_term("(∃ x : Complex, !(poly((p : List[Complex]), x) == Cx(real_of_num(0)))) == EX((c : Complex) => !(c == Cx(real_of_num(0))), p)"), t717)
  let apply_pth2b : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x718 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x718
  }, @list.List([pth_2b]))
  let t740 = @tactics.conv_tac(@class.taut)
  let t739 = @simp.asm_simp_tac(@list.List([@lists.all()]))
  let t738 = @tactics.pop_assum(fn(x735 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s736 = @tactics.mp_tac(x735)
    fn(x737 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s736(x737)
    }
  })
  let t734 = @simp.rewrite_tac(@list.List([@lists.last(), @lists.all(), @lists.not_cons_nil()]))
  let t733 = @simp.rewrite_tac(@list.List([@lists.last()]))
  let t731 = @term_syntax.parse_term("(p : List[Complex])")
  let t732 = @tactics.spec_tac(@term_syntax.parse_term("(p : List[Complex])"), t731)
  let t730 = @tactics.pop_assum(fn(x727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s728 = @tactics.mp_tac(x727)
    fn(x729 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s728(x729)
    }
  })
  let t726 = @simp.rewrite_tac(@list.List([@cpoly.poly_zero()]))
  let t725 = @tactics.subgoal_then(@term_syntax.parse_term("!(poly(CONS((a : Complex), (p : List[Complex]))) == poly(NIL))"), fn(x722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x722
    let t724 = @meson.meson_tac(@list.List([]))
    @tactics.then_tac(@simp.rewrite_tac(@list.List([th_1])), t724)
  })
  let t721 = @simp.asm_simp_tac(@list.List([@cpoly.degree(), @cpoly.normalize_eq(), @lists.length(), @arith.pre()]))
  let t719 = @term_syntax.parse_term("(q : List[Complex])")
  let t720 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("CONS((a : Complex), (p : List[Complex]))"), t719]), nullstellensatz_univariate()))
  let t741 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t720), t721), t725), t726), t730), t732), t733), @lists.list_induct_tac), t734), t738), @class.cond_cases_tac), t739), t740)
  let pth_3 = @tactics.prove(@term_syntax.parse_term("!(LAST(CONS((a : Complex), (p : List[Complex]))) == Cx(real_of_num(0))) → (∃ x : Complex, poly(CONS(a, p), x) == Cx(real_of_num(0)) && !(poly((q : List[Complex]), x) == Cx(real_of_num(0)))) == !divides(CONS(a, p), poly_exp(q, LENGTH(p)))"), t741)
  let apply_pth3 : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(fn(x742 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x742))
  }, pth_3)
  let t743 = @simp.simp_tac(@list.List([@cpoly.divides(), @cpoly.poly_exp_v1(), @class.fun_eq_thm()]))
  let pth_4 = @tactics.prove(@term_syntax.parse_term("(∀ x : Complex, poly(poly_exp((q : List[Complex]), (n : Num)), x) == poly((r : List[Complex]), x)) → divides((p : List[Complex]), poly_exp(q, n)) == divides(p, r)"), t743)
  let apply_pth4 : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth_4)
  let poly_tm = @term_syntax.parse_term("poly")
  let rewr_poly_exp_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@cpoly.poly_exp_v1())
  let poly_exp_divides_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x744 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let avs = x744
    fn(x745 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x745
      let t746 = @lib.hd(avs)
      let tm1 = @kernel.mk_comb(@kernel.mk_comb(poly_tm, @kernel.rand(tm)), t746)
      let th1 = rewr_poly_exp_conv(tm1)
      let t747 = @kernel.rand(@kernel.concl(th1))
      let th2 = @kernel.trans(th1, mpoly_pow_conv(avs)(t747))
      @drule.part_match(@equal.lhand, apply_pth4(@bool.gen(@lib.hd(avs), th2)))(tm)
    }
  }
  let poly_exp_divides_conv_1 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = poly_exp_divides_conv
  basic_quelim_conv_c.set(fn(x748 : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let asm_ = x748
    fn(x749 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let avs_1 = x749
      fn(x750 : @kernel.Term) -> @kernel.Thm raise {
        let tm_1 = x750
        try {
          apply_pth1(tm_1)
        } catch {
          Failure(_) => {
            try {
              let th1_1 = apply_pth2(tm_1)
              let th2_1 = @equal.conv_rule(@equal.land_conv(@equal.rand_conv(@equal.land_conv(last_conv))), th1_1)
              let th3 = try {
                let t751 = resolve_eq(asm_, @kernel.rand(@equal.lhand(@kernel.concl(th2_1))))
                @drule.match_mp(th2_1)(t751)
              } catch {
                Failure(_) => raise Failure("Sanity failure (2a)")
                e => raise e
              }
              th3
            } catch {
              Failure(_) => {
                try {
                  let th1_2 = apply_pth2b(tm_1)
                  @kernel.trans(th1_2, expand_ex_beta_resolve_conv(asm_, @kernel.rand(@kernel.concl(th1_2))))
                } catch {
                  Failure(_) => {
                    let th1_3 = apply_pth3(tm_1)
                    let th2_2 = @equal.conv_rule(@equal.land_conv(@equal.rand_conv(@equal.land_conv(last_conv))), th1_3)
                    let th3_1 = try {
                      let t752 = resolve_eq(asm_, @kernel.rand(@equal.lhand(@kernel.concl(th2_2))))
                      @drule.match_mp(th2_2)(t752)
                    } catch {
                      Failure(_) => raise Failure("Sanity failure (2b)")
                      e => raise e
                    }
                    let th4 = @equal.conv_rule(@lib.funpow(4, fn(x753 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s754 = @equal.rand_conv(x753)
                      fn(x755 : @kernel.Term) -> @kernel.Thm raise {
                        s754(x755)
                      }
                    }, length_conv), th3_1)
                    let th5 = @equal.conv_rule(@equal.rand_conv(@equal.rand_conv(poly_exp_divides_conv_1(avs_1))), th4)
                    @equal.conv_rule(@equal.rand_conv(@equal.rand_conv(poly_divides_conv(asm_)(avs_1))), th5)
                  }
                  e => raise e
                }
              }
              e => raise e
            }
          }
          e => raise e
        }
      }
    }
  })
}

///|
let basic_quelim_conv_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("BASIC_QUELIM_CONV")

///|
/// `BASIC_QUELIM_CONV`
pub fn basic_quelim_conv(x : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  (basic_quelim_conv_c.get())(x)
}

///|
/// POLY_NE_MULT_CONV
fn step_25() -> Unit raise {
  let t756 = @simp.rewrite_tac(@list.List([@complexnumbers.complex_entire(), @class.de_morgan_thm()]))
  let pth = @tactics.prove(@term_syntax.parse_term("(!(poly((p : List[Complex]), (x : Complex)) == Cx(real_of_num(0))) && !(poly((q : List[Complex]), x) == Cx(real_of_num(0)))) == !(poly(p, x) * poly(q, x) == Cx(real_of_num(0)))"), t756)
  let apply_pth : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth)
  fn poly_ne_mult_conv_1(x757 : @list.List[@kernel.Term], x758 : @kernel.Term) -> @kernel.Thm raise {
    let avs = x757
    let tm = x758
    if !@basics.is_conj(tm) {
      @kernel.refl(tm)
    } else {
      let (l, r) = @basics.dest_conj(tm)
      let t760 = poly_ne_mult_conv_1(avs, r)
      let t759 = poly_ne_mult_conv_1(avs, l)
      let th1 = @kernel.mk_comb_rule(@equal.ap_term(@kernel.rator(@kernel.rator(tm)), t759), t760)
      let th2 = @kernel.trans(th1, apply_pth(@kernel.rand(@kernel.concl(th1))))
      @equal.conv_rule(@equal.rand_conv(@equal.rand_conv(@equal.land_conv(mpoly_mul_conv(avs)))), th2)
    }
  }
  poly_ne_mult_conv_c.set(fn(x761 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x762 : @kernel.Term) -> @kernel.Thm raise {
      poly_ne_mult_conv_1(x761, x762)
    }
  })
}

///|
let poly_ne_mult_conv_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("POLY_NE_MULT_CONV")

///|
/// `POLY_NE_MULT_CONV`
pub fn poly_ne_mult_conv(x : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (poly_ne_mult_conv_c.get())(x)
}

///|
/// CORE_QUELIM_CONV
fn step_26() -> Unit raise {
  let conj_ac_rule : (@kernel.Term) -> @kernel.Thm raise = @theorems.ac(@theorems.conj_aci())
  let core_quelim_conv_1 : (@list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = fn(x763 : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let asm_ = x763
    fn(x764 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let avs = x764
      fn(x765 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x765
        let (ev, bod) = @basics.dest_exists(tm)
        let cjs = @basics.conjuncts(bod)
        let (eqs, neqs) = @lib.partition(fn(x766 : @kernel.Term) -> Bool raise {
          @basics.is_eq(x766)
        }, cjs)
        if @list.List::is_empty(eqs) {
          let th1 = @drule.mk_exists_rule(ev, poly_ne_mult_conv(avs)(bod))
          let t767 = @kernel.rand(@kernel.concl(th1))
          @kernel.trans(th1, basic_quelim_conv(asm_)(avs)(t767))
        } else {
          if (Int::to_int64(@lib.length(eqs)) > 1L) {
            raise Failure("CORE_QUELIM_CONV: Sanity failure")
          } else {
            if @list.List::is_empty(neqs) {
              basic_quelim_conv(asm_)(avs)(tm)
            } else {
              let t768 = @bool.list_mk_conj(neqs)
              let tm1 = @bool.mk_conj(@lib.hd(eqs), t768)
              let th1_1 = conj_ac_rule(@basics.mk_eq(bod, tm1))
              let th2 = @equal.conv_rule(@lib.funpow(2, fn(x769 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s770 = @equal.rand_conv(x769)
                fn(x771 : @kernel.Term) -> @kernel.Thm raise {
                  s770(x771)
                }
              }, poly_ne_mult_conv(avs)), th1_1)
              let th3 = @drule.mk_exists_rule(ev, th2)
              let t772 = @kernel.rand(@kernel.concl(th3))
              @kernel.trans(th3, basic_quelim_conv(asm_)(avs)(t772))
            }
          }
        }
      }
    }
  }
  core_quelim_conv_c.set(core_quelim_conv_1)
}

///|
let core_quelim_conv_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("CORE_QUELIM_CONV")

///|
/// `CORE_QUELIM_CONV`
pub fn core_quelim_conv(x : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  (core_quelim_conv_c.get())(x)
}

///|
/// RESOLVE_EQ_NE
fn step_27() -> Unit raise {
  let dne_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(fn(x773 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x773
  }, @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) == true) == (!p == false) && (p == false) == (!p == true)"))]))
  resolve_eq_ne_c.set(fn(x774 : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let asm_ = x774
    fn(x775 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x775
      if @basics.is_neg(tm) {
        let t776 = @kernel.rand(tm)
        dne_rule(resolve_eq_raw(asm_)(t776))
      } else {
        resolve_eq_raw(asm_)(tm)
      }
    }
  })
}

///|
let resolve_eq_ne_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("RESOLVE_EQ_NE")

///|
/// `RESOLVE_EQ_NE`
pub fn resolve_eq_ne(x : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (resolve_eq_ne_c.get())(x)
}

///|
/// COMPLEX_QUELIM_CONV
fn step_28() -> Unit raise {
  let t777 = @simp.rewrite_tac(@list.List([@cpoly.poly()]))
  let pth_0 = @tactics.prove(@term_syntax.parse_term("(poly(NIL, (x : Complex)) == Cx(real_of_num(0))) == true && (poly(NIL, x) == Cx(real_of_num(0)) && (p : Bool)) == p"), t777)
  let t778 = @simp.rewrite_tac(@list.List([@cpoly.poly()]))
  let pth_1 = @tactics.prove(@term_syntax.parse_term("!(poly(NIL, (x : Complex)) == Cx(real_of_num(0))) == false && (!(poly(NIL, x) == Cx(real_of_num(0))) && (p : Bool)) == false"), t778)
  let t779 = @tactics.conv_tac(@class.taut)
  let pth_2 = @tactics.prove(@term_syntax.parse_term("((p : Bool) → (q : Bool) == (r : Bool)) → (p && q) == (p && r)"), t779)
  let zero_tm = @term_syntax.parse_term("Cx(real_of_num(0))")
  let true_tm = @term_syntax.parse_term("true")
  let elim_zero_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(fn(x780 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s781 = @equal.rand_conv(x780)
    fn(x782 : @kernel.Term) -> @kernel.Thm raise {
      s781(x782)
    }
  }, @list.List([pth_0]))
  let elim_nonzero_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(fn(x783 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s784 = @equal.rand_conv(x783)
    fn(x785 : @kernel.Term) -> @kernel.Thm raise {
      s784(x785)
    }
  }, @list.List([pth_1]))
  let incorp_assum_thm : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(pth_2)
  let conj_ac_rule : (@kernel.Term) -> @kernel.Thm raise = @theorems.ac(@theorems.conj_aci())
  let t786 = @simp.rewrite_tac(@list.List([@cpoly.poly(), @complexnumbers.complex_mul_rzero(), @complexnumbers.complex_add_rid()]))
  let pth = @tactics.prove(@term_syntax.parse_term("(poly([(c : Complex)], (x : Complex)) == (y : Complex)) == (c == y) && !(poly([c], x) == y) == !(c == y)"), t786)
  let poly_const_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.try_conv(@simp.gen_rewrite_conv(fn(x787 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x787
  }, @list.List([pth])))
  let exists_triv_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@theorems.exists_simp())
  let exists_push_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@theorems.right_exists_and_thm())
  let and_simp_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x788 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s789 = @equal.depth_conv(x788)
    fn(x790 : @kernel.Term) -> @kernel.Thm raise {
      s789(x790)
    }
  }, @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && false) == false && (p && true) == p && (false && p) == false && (true && p) == p"))]))
  let resolve_or_const_conv : (@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x791 : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let asm_ = x791
    fn(x792 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x792
      try {
        resolve_eq_ne(asm_)(tm)
      } catch {
        Failure(_) => poly_const_conv(tm)
        e => raise e
      }
    }
  }
  let false_tm = @term_syntax.parse_term("false")
  fn complex_quelim_conv_1(x793 : @list.List[@kernel.Thm], x794 : @list.List[@kernel.Term], x795 : @kernel.Term) -> @kernel.Thm raise {
    let asm__1 = x793
    let avs = x794
    let tm_1 = x795
    let (ev, bod) = @basics.dest_exists(tm_1)
    let cjs = @basics.conjuncts(bod)
    let cjs_set = @lib.setify(cjs)
    let t796 = Int::to_int64(@lib.length(cjs))
    if (Int::to_int64(@lib.length(cjs_set)) < t796) {
      let th1 = conj_ac_rule(@basics.mk_eq(bod, @bool.list_mk_conj(cjs_set)))
      let th2 = @drule.mk_exists_rule(ev, th1)
      @kernel.trans(th2, complex_quelim_conv_1(asm__1, avs, @kernel.rand(@kernel.concl(th2))))
    } else {
      let (eqs, neqs) = @lib.partition(fn(x797 : @kernel.Term) -> Bool raise {
        @basics.is_eq(x797)
      }, cjs)
      let lens = @lib.map(fn(x801 : @kernel.Term) -> Int64 raise {
        (fn(x800 : @kernel.Term) -> Int64 raise {
          (fn(x799 : @kernel.Term) -> Int64 raise {
            (fn(x798 : @list.List[@kernel.Term]) -> Int64 raise {
              Int::to_int64(@lib.length(x798))
            })(@basics.dest_list(x799))
          })(@equal.lhand(x800))
        })(@equal.lhs(x801))
      }, eqs)
      let nens = @lib.map(fn(x806 : @kernel.Term) -> Int64 raise {
        (fn(x805 : @kernel.Term) -> Int64 raise {
          (fn(x804 : @kernel.Term) -> Int64 raise {
            (fn(x803 : @kernel.Term) -> Int64 raise {
              (fn(x802 : @list.List[@kernel.Term]) -> Int64 raise {
                Int::to_int64(@lib.length(x802))
              })(@basics.dest_list(x803))
            })(@equal.lhand(x804))
          })(@equal.lhs(x805))
        })(@kernel.rand(x806))
      }, neqs)
      try {
        let zeq = @lib.el(@lib.index(0L, lens), eqs)
        if (cjs == @list.List([zeq])) {
          basic_quelim_conv(asm__1)(avs)(tm_1)
        } else {
          let cjs_p = @lib.subtract(cjs, @list.List([zeq])).prepend(zeq)
          let th1_1 = elim_zero_rule(conj_ac_rule(@basics.mk_eq(bod, @bool.list_mk_conj(cjs_p))))
          let th2_1 = @drule.mk_exists_rule(ev, th1_1)
          @kernel.trans(th2_1, complex_quelim_conv_1(asm__1, avs, @kernel.rand(@kernel.concl(th2_1))))
        }
      } catch {
        Failure(_) => {
          try {
            let zne = @lib.el(@lib.index(0L, nens), neqs)
            if (cjs == @list.List([zne])) {
              basic_quelim_conv(asm__1)(avs)(tm_1)
            } else {
              let cjs_p_1 = @lib.subtract(cjs, @list.List([zne])).prepend(zne)
              let th1_2 = elim_nonzero_rule(conj_ac_rule(@basics.mk_eq(bod, @bool.list_mk_conj(cjs_p_1))))
              let t807 = @drule.mk_exists_rule(ev, th1_2)
              @equal.conv_rule(@equal.rand_conv(exists_triv_conv), t807)
            }
          } catch {
            Failure(_) => {
              try {
                let t810 = @lib.zip(nens, neqs)
                let ones = @lib.map(fn(x808 : (Int64, @kernel.Term)) -> @kernel.Term raise {
                  x808.1
                }, @lib.filter(fn(x809 : (Int64, @kernel.Term)) -> Bool raise {
                  let (n, _) = x809
                  (n == 1L)
                }, @lib.zip(lens, eqs).concat(t810)))
                if @list.List::is_empty(ones) {
                  raise Failure("")
                } else {
                  let cjs_p_2 = @lib.subtract(cjs, ones)
                  if @list.List::is_empty(cjs_p_2) {
                    let th1_3 = @drule.mk_exists_rule(ev, @equal.subs_conv(@lib.map(poly_const_conv, cjs))(bod))
                    @kernel.trans(th1_3, exists_triv_conv(@kernel.rand(@kernel.concl(th1_3))))
                  } else {
                    let t811 = @bool.list_mk_conj(ones)
                    let tha = @equal.subs_conv(@lib.map(resolve_or_const_conv(asm__1), ones))(t811)
                    let thb = @equal.conv_rule(@equal.rand_conv(and_simp_conv), tha)
                    if (@kernel.rand(@kernel.concl(thb)) == false_tm) {
                      let thc = @drule.mk_conj_rule(thb, @kernel.refl(@bool.list_mk_conj(cjs_p_2)))
                      let thd = @equal.conv_rule(@equal.rand_conv(and_simp_conv), thc)
                      let the = conj_ac_rule(@basics.mk_eq(bod, @equal.lhand(@kernel.concl(thd))))
                      let thf = @drule.mk_exists_rule(ev, @kernel.trans(the, thd))
                      @equal.conv_rule(@equal.rand_conv(exists_triv_conv), thf)
                    } else {
                      let thc_1 = @drule.mk_conj_rule(thb, @kernel.refl(@bool.list_mk_conj(cjs_p_2)))
                      let thd_1 = conj_ac_rule(@basics.mk_eq(bod, @equal.lhand(@kernel.concl(thc_1))))
                      let the_1 = @drule.mk_exists_rule(ev, @kernel.trans(thd_1, thc_1))
                      let th4 = @kernel.trans(the_1, exists_push_conv(@kernel.rand(@kernel.concl(the_1))))
                      let tm4 = @kernel.rand(@kernel.concl(th4))
                      let th5 = complex_quelim_conv_1(asm__1, avs, @kernel.rand(tm4))
                      @kernel.trans(th4, @equal.ap_term(@kernel.rator(tm4), th5))
                    }
                  }
                }
              } catch {
                Failure(_) => {
                  if (@list.List::is_empty(eqs) || (if (Int::to_int64(@lib.length(eqs)) == 1L) {
                    let ceq = @basics.mk_eq(@lib.last(@basics.dest_list(@equal.lhand(@equal.lhs(@lib.hd(eqs))))), zero_tm)
                    if (try {
                      let t812 = @bool.mk_neg(ceq)
                      (@kernel.concl(resolve_eq(asm__1, ceq)) == t812)
                    } catch {
                      Failure(_) => false
                      e => raise e
                    }) {
                      let h = @lib.hd(lens)
                      @lib.forall(fn(x813 : Int64) -> Bool raise {
                        let n_1 = x813
                        (n_1 < h)
                      }, nens)
                    } else {
                      false
                    }
                  } else {
                    false
                  })) {
                    core_quelim_conv(asm__1)(avs)(tm_1)
                  } else {
                    let n_2 = @lib.end_itlist(fn(x816 : Int64, x817 : Int64) -> Int64 raise {
                      let s818 = (fn(x814 : Int64) -> ((Int64) -> Int64 raise) raise {
                        fn(x815 : Int64) -> Int64 raise {
                          if (x814 <= x815) {
                            x814
                          } else {
                            x815
                          }
                        }
                      })(x816)
                      s818(x817)
                    }, lens)
                    let eq = @lib.el(@lib.index(n_2, lens), eqs)
                    let pol = @equal.lhand(@equal.lhand(eq))
                    let atm = @lib.last(@basics.dest_list(pol))
                    let zeq_1 = @basics.mk_eq(atm, zero_tm)
                    resolve_eq_then(asm__1)(zeq_1)(fn(x819 : @list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                      let asm_p = x819
                      fn(x820 : @kernel.Thm) -> @kernel.Thm raise {
                        let yth = x820
                        let th0 = @kernel.trans(yth, mpoly_base_conv(@lib.tl(avs))(zero_tm))
                        let t831 = @lib.int63_to_int(@lib.sub63(n_2, 1L))
                        let th1_4 = @simp.gen_rewrite_conv(fn(x837 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                          (fn(x833 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                            (fn(x827 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                              (fn(x821 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                let s822 = @equal.land_conv(x821)
                                fn(x823 : @kernel.Term) -> @kernel.Thm raise {
                                  s822(x823)
                                }
                              })((fn(x824 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                                let s825 = @equal.land_conv(x824)
                                fn(x826 : @kernel.Term) -> @kernel.Thm raise {
                                  s825(x826)
                                }
                              })(x827))
                            })(((x832 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(t831, fn(x828 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                              let s829 = @equal.rand_conv(x828)
                              fn(x830 : @kernel.Term) -> @kernel.Thm raise {
                                s829(x830)
                              }
                            }, x832))(x833))
                          })((fn(x834 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                            let s835 = @equal.land_conv(x834)
                            fn(x836 : @kernel.Term) -> @kernel.Thm raise {
                              s835(x836)
                            }
                          })(x837))
                        }, @list.List([th0]))(eq)
                        let t838 = @kernel.rand(@kernel.concl(th1_4))
                        let th2_2 = @equal.land_conv(mpoly_norm_conv(avs))(t838)
                        let th3 = @drule.mk_exists_rule(ev, @equal.subs_conv(@list.List([@kernel.trans(th1_4, th2_2)]))(bod))
                        @kernel.trans(th3, complex_quelim_conv_1(asm_p, avs, @kernel.rand(@kernel.concl(th3))))
                      }
                    })(fn(x839 : @list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                      let asm_p_1 = x839
                      fn(x840 : @kernel.Thm) -> @kernel.Thm raise {
                        let nth = x840
                        let oth = @lib.subtract(cjs, @list.List([eq]))
                        if @list.List::is_empty(oth) {
                          complex_quelim_conv_1(asm_p_1, avs, tm_1)
                        } else {
                          let eth = @kernel.assume_rule(eq)
                          let ths = @lib.map((x841 : @kernel.Term) => poly_cancel_ene_conv(avs, n_2, nth, eth, x841), oth)
                          let th1_5 = @bool.disch(eq, @lib.end_itlist(@drule.mk_conj_rule, ths))
                          let th2_3 = incorp_assum_thm(th1_5)
                          let th3_1 = @kernel.trans(conj_ac_rule(@basics.mk_eq(bod, @equal.lhand(@kernel.concl(th2_3)))), th2_3)
                          let th4_1 = @drule.mk_exists_rule(ev, th3_1)
                          @kernel.trans(th4_1, complex_quelim_conv_1(asm_p_1, avs, @kernel.rand(@kernel.concl(th4_1))))
                        }
                      }
                    })
                  }
                }
                e => raise e
              }
            }
            e => raise e
          }
        }
        e => raise e
      }
    }
  }
  complex_quelim_conv_c.set(fn(x842 : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let asm__2 = x842
    fn(x843 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let avs_1 = x843
      (x846 : @kernel.Term) => @lib.time((x845 : @kernel.Term) => complex_quelim_conv_1(asm__2, avs_1, x845), x846)
    }
  })
}

///|
let complex_quelim_conv_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("COMPLEX_QUELIM_CONV")

///|
/// `COMPLEX_QUELIM_CONV`
pub fn complex_quelim_conv(x : @list.List[@kernel.Thm]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  (complex_quelim_conv_c.get())(x)
}

///|
/// NNF_COND_CONV
fn step_29() -> Unit raise {
  let t847 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp(), @theorems.conj_assoc()]))
  let t848 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.exists_unique_thm(), @class.de_morgan_thm(), @class.not_exists_thm()])), t847)
  let not_exists_unique_thm = @tactics.prove(@term_syntax.parse_term("!existsunique((x : _) => (P : (_) -> Bool)(x)) == ((∀ x : _, !P(x)) || (∃ x : _, ∃ x' : _, P(x) && P(x') && !(x == x')))"), t848)
  let t849 = @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool) || !p && (r : Bool)) == (p && !q || !p && !r)"))
  let t850 = @class.taut(@term_syntax.parse_term("((p : Bool) == (q : Bool)) == (p && q || !p && !q)"))
  let t851 = @class.taut(@term_syntax.parse_term("!((p : Bool) == (q : Bool)) == (p && !q || !p && q)"))
  let t852 = @class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) == (!p || q)"))
  let t853 = @class.taut(@term_syntax.parse_term("!((p : Bool) → (q : Bool)) == (p && !q)"))
  let t854 = @class.taut(@term_syntax.parse_term("!((p : Bool) || (q : Bool)) == (!p && !q)"))
  let t855 = @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (!p || !q)"))
  let tauts = @list.List([@class.taut(@term_syntax.parse_term("!!(p : Bool) == p")), t855, t854, t853, t852, @class.not_forall_thm(), @class.not_exists_thm(), @theorems.exists_unique_thm(), not_exists_unique_thm, t851, t850, t849])
  nnf_cond_conv_c.set(@simp.gen_rewrite_conv(fn(x856 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s857 = @equal.top_sweep_conv(x856)
    fn(x858 : @kernel.Term) -> @kernel.Thm raise {
      s857(x858)
    }
  }, tauts))
}

///|
let nnf_cond_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NNF_COND_CONV")

///|
/// `NNF_COND_CONV`
pub fn nnf_cond_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (nnf_cond_conv_c.get())(x)
}

///|
/// FULL_COMPLEX_QUELIM_CONV
fn step_30() -> Unit raise {
  let t859 = @meson.meson_tac(@list.List([]))
  let pth = @tactics.prove(@term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x)) == !(∃ x : _, !P(x))"), t859)
  let elim_forall_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth)
  let pth_1 = @cpoly.simple_complex_arith(@term_syntax.parse_term("((x : Complex) == (y : Complex)) == (x - y == Cx(real_of_num(0)))"))
  let zero_tm = @term_syntax.parse_term("Cx(real_of_num(0))")
  let rewr_pth : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth_1)
  let elim_eq_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x860 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let avs = x860
    fn(x861 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x861
      if (@kernel.rand(tm) == zero_tm) {
        @equal.land_conv(polynate_conv(avs))(tm)
      } else {
        @equal.thenc(rewr_pth, @equal.land_conv(polynate_conv(avs)))(tm)
      }
    }
  }
  let simp_dnf_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x862 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s863 = @equal.top_depth_conv(x862)
    fn(x864 : @kernel.Term) -> @kernel.Thm raise {
      s863(x864)
    }
  }, @simp.basic_rewrites()), nnf_cond_conv), @canon.dnf_conv)
  let distrib_exists_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x865 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x865
  }, @list.List([@theorems.exists_or_thm()]))
  let triv_exists_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x866 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x866
  }, @list.List([@theorems.exists_simp()]))
  let complex_ty = @term_syntax.parse_type("Complex")
  let t873 = @simp.gen_rewrite_conv(fn(x870 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s871 = @equal.top_depth_conv(x870)
    fn(x872 : @kernel.Term) -> @kernel.Thm raise {
      s871(x872)
    }
  }, @simp.basic_rewrites())
  let final_simp_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x867 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s868 = @equal.depth_conv(x867)
    fn(x869 : @kernel.Term) -> @kernel.Thm raise {
      s868(x869)
    }
  }, @list.List([@complexnumbers.cx_inj()])), @calc_rat.real_rat_reduce_conv), t873)
  let full_complex_quelim_conv_1 = (x874 : @list.List[@kernel.Term], x875 : @kernel.Term) => full_complex_quelim_conv_1_l(elim_forall_conv, simp_dnf_conv, elim_eq_conv, triv_exists_conv, distrib_exists_conv, x874, x875)
  let distrib_and_complex_quelim_conv = (x877 : @list.List[@kernel.Term], x878 : @kernel.Term) => distrib_and_complex_quelim_conv_l(elim_forall_conv, simp_dnf_conv, elim_eq_conv, triv_exists_conv, distrib_exists_conv, x877, x878)
  full_complex_quelim_conv_c.set(fn(x880 : @kernel.Term) -> @kernel.Thm raise {
    let tm_3 = x880
    let avs_3 = @lib.filter(fn(x881 : @kernel.Term) -> Bool raise {
      let t = x881
      (@kernel.type_of(t) == complex_ty)
    }, @kernel.frees(tm_3))
    @equal.thenc((x882 : @kernel.Term) => full_complex_quelim_conv_1(avs_3, x882), final_simp_conv)(tm_3)
  })
}

///|
let full_complex_quelim_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("FULL_COMPLEX_QUELIM_CONV")

///|
/// `FULL_COMPLEX_QUELIM_CONV`
pub fn full_complex_quelim_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (full_complex_quelim_conv_c.get())(x)
}

///|
fn full_complex_quelim_conv_1_l(elim_forall_conv : (@kernel.Term) -> @kernel.Thm raise, simp_dnf_conv : (@kernel.Term) -> @kernel.Thm raise, elim_eq_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise, triv_exists_conv : (@kernel.Term) -> @kernel.Thm raise, distrib_exists_conv : (@kernel.Term) -> @kernel.Thm raise, x874 : @list.List[@kernel.Term], x875 : @kernel.Term) -> @kernel.Thm raise {
  let full_complex_quelim_conv_1 = (x874 : @list.List[@kernel.Term], x875 : @kernel.Term) => full_complex_quelim_conv_1_l(elim_forall_conv, simp_dnf_conv, elim_eq_conv, triv_exists_conv, distrib_exists_conv, x874, x875)
  let distrib_and_complex_quelim_conv = (x877 : @list.List[@kernel.Term], x878 : @kernel.Term) => distrib_and_complex_quelim_conv_l(elim_forall_conv, simp_dnf_conv, elim_eq_conv, triv_exists_conv, distrib_exists_conv, x877, x878)
  let avs_1 = x874
  let tm_1 = x875
  if @basics.is_forall(tm_1) {
    let th1 = elim_forall_conv(tm_1)
    let th2 = full_complex_quelim_conv_1(avs_1, @kernel.rand(@kernel.concl(th1)))
    @kernel.trans(th1, th2)
  } else {
    if @basics.is_neg(tm_1) {
      let t876 = full_complex_quelim_conv_1(avs_1, @kernel.rand(tm_1))
      @equal.ap_term(@kernel.rator(tm_1), t876)
    } else {
      if (@basics.is_conj(tm_1) || (@basics.is_disj(tm_1) || (@basics.is_imp(tm_1) || @bool.is_iff(tm_1)))) {
        let (lop, r) = @kernel.dest_comb(tm_1)
        let (op, l) = @kernel.dest_comb(lop)
        let thl = full_complex_quelim_conv_1(avs_1, l)
        let thr = full_complex_quelim_conv_1(avs_1, r)
        @kernel.mk_comb_rule(@equal.ap_term(@kernel.rator(@kernel.rator(tm_1)), thl), thr)
      } else {
        if @basics.is_exists(tm_1) {
          let (ev, bod) = @basics.dest_exists(tm_1)
          let th0 = full_complex_quelim_conv_1(avs_1.prepend(ev), bod)
          let th1_1 = @drule.mk_exists_rule(ev, @equal.conv_rule(@equal.rand_conv(simp_dnf_conv), th0))
          @kernel.trans(th1_1, distrib_and_complex_quelim_conv(avs_1.prepend(ev), @kernel.rand(@kernel.concl(th1_1))))
        } else {
          if @basics.is_eq(tm_1) {
            elim_eq_conv(avs_1)(tm_1)
          } else {
            raise Failure("unexpected type of formula")
          }
        }
      }
    }
  }
}

///|
fn distrib_and_complex_quelim_conv_l(elim_forall_conv : (@kernel.Term) -> @kernel.Thm raise, simp_dnf_conv : (@kernel.Term) -> @kernel.Thm raise, elim_eq_conv : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise, triv_exists_conv : (@kernel.Term) -> @kernel.Thm raise, distrib_exists_conv : (@kernel.Term) -> @kernel.Thm raise, x877 : @list.List[@kernel.Term], x878 : @kernel.Term) -> @kernel.Thm raise {
  let distrib_and_complex_quelim_conv = (x877 : @list.List[@kernel.Term], x878 : @kernel.Term) => distrib_and_complex_quelim_conv_l(elim_forall_conv, simp_dnf_conv, elim_eq_conv, triv_exists_conv, distrib_exists_conv, x877, x878)
  let avs_2 = x877
  let tm_2 = x878
  try {
    triv_exists_conv(tm_2)
  } catch {
    Failure(_) => {
      try {
        @equal.thenc(distrib_exists_conv, @equal.binop_conv((x879 : @kernel.Term) => distrib_and_complex_quelim_conv(avs_2, x879)))(tm_2)
      } catch {
        Failure(_) => complex_quelim_conv(@list.List([]))(avs_2)(tm_2)
        e => raise e
      }
    }
    e => raise e
  }
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
}
