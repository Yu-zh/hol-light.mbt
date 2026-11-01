// Translated from upstream Examples/pell.ml; edit this file directly.

///|
/// Examples/pell.ml:9
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// PELL_INDUCTION
fn step_2() -> Unit raise {
  let t4 = @simp.asm_simp_tac(@list.List([@arith.add1(), @int.arith_rule(@term_syntax.parse_term("SUC((n : Num) + 1) == n + 2"))]))
  let t3 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses()]))
  let t5 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, (P : (Num) -> Bool)(n) && P(n + 1)"), fn(x1 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1
    @simp.rewrite_tac(@list.List([th]))
  })), @nums.induct_tac), t3), t4)
  pell_induction_c.set(@tactics.prove(@term_syntax.parse_term("(P : (Num) -> Bool)(0) && P(1) && (∀ n : Num, P(n) && P(n + 1) → P(n + 2)) → (∀ n : Num, P(n))"), t5))
}

///|
let pell_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PELL_INDUCTION")

///|
/// `PELL_INDUCTION`
pub fn pell_induction() -> @kernel.Thm {
  pell_induction_c.get()
}

///|
/// ROOT_NONPOWER
fn step_3() -> Unit raise {
  let t27 = @simp.asm_simp_tac(@list.List([@arith.mult_exp(), @arith.eq_mult_rcancel(), @arith.exp_eq_0()]))
  let t26 = @tactics.undisch_tac(@term_syntax.parse_term("EXP((a : Num) * (q : Num), (n : Num)) == (d : Num) * EXP(q, n)"))
  let t25 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num)"))
  let t24 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : Num)"))(fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s22 = @tactics.subst_all_tac(x21)
    fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s22(x23)
    }
  }))
  let t20 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t19 = @simp.rewrite_tac(@list.List([@bool.eqt_intro(@bool.spec_all(@arith.mult_sym()))]))
  let t15 = @term_syntax.parse_term("(d : Num)")
  let t18 = @tactics.disch_then(fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x12 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s13 = @tactics.mp_tac(x12)
      fn(x14 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s13(x14)
      }
    })(((x16 : @kernel.Thm) => @bool.spec(t15, x16))(x17))
  })
  let t11 = @simp.asm_rewrite_tac(@list.List([@int.divides(), @theorems.left_imp_exists_thm()]))
  let t8 = @term_syntax.parse_term("(p : Num)")
  let t9 = @term_syntax.parse_term("(q : Num)")
  let t10 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t9, t8]), @prime.divides_exp2_rev()))
  let t7 = @simp.asm_simp_tac(@list.List([@arith.exp(), @arith.mult_clauses()]))
  let t6 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t28 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t6), t7), @tactics.strip_tac), t10), t11), t18), t19), t20), t24), t25), t26), t27)
  root_nonpower_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ d : Num, ∀ n : Num, !(q == 0) && EXP(p, n) == d * EXP(q, n) → (∃ a : Num, d == EXP(a, n))"), t28))
}

///|
let root_nonpower_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ROOT_NONPOWER")

///|
/// `ROOT_NONPOWER`
pub fn root_nonpower() -> @kernel.Thm {
  root_nonpower_c.get()
}

///|
/// INTEGER_SUB_LEMMA
fn step_4() -> Unit raise {
  let t39 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t38 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_of_num_sub())]))
  let t36 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num) - (y : Num)"))
  let t37 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(y : Num) - (x : Num)")), t36])
  let t35 = @simp.rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t32 = @term_syntax.parse_term("real_of_num((y : Num))")
  let t33 = @bool.specl(@list.List([@term_syntax.parse_term("real_of_num((x : Num))"), t32]), @analysis.real_le_total())
  let t34 = @tactics.disj_cases_then(fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s30 = @tactics.mp_tac(x29)
    fn(x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s30(x31)
    }
  })(t33)
  let t40 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t34), t35), @tactics.disch_tac), t37), t38), t39), @calc_rat.real_arith_tac)
  integer_sub_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∃ n : Num, pow(real_of_num(x) - real_of_num(y), 2) == pow(real_of_num(n), 2)"), t40))
}

///|
let integer_sub_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGER_SUB_LEMMA")

///|
/// `INTEGER_SUB_LEMMA`
pub fn integer_sub_lemma() -> @kernel.Thm {
  integer_sub_lemma_c.get()
}

///|
/// SQRT_LINEAR_EQ
fn step_5() -> Unit raise {
  let t144 = @simp.simp_tac(@list.List([@realax.real_of_num_eq()]))
  let t143 = @simp.rewrite_tac(@list.List([@real.real_pow_eq_0(), @calc_num.arith_eq(), @analysis.real_sub_0()]))
  let t142 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t141 = @tactics.undisch_tac(@term_syntax.parse_term("pow(real_of_num((y : Num)) - real_of_num((v : Num)), 2) == pow(real_of_num(0), 2)"))
  let t140 = @tactics.undisch_tac(@term_syntax.parse_term("pow(real_of_num((u : Num)) - real_of_num((x : Num)), 2) == pow(real_of_num(0), 2)"))
  let t139 = @tactics.disch_then(fn(x136 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s137 = @tactics.subst_all_tac(x136)
    fn(x138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s137(x138)
    }
  })
  let t135 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @arith.mult_clauses(), @arith.exp_eq_0()]))
  let t134 = @tactics.undisch_tac(@term_syntax.parse_term("EXP((p : Num), 2) == EXP(0, 2) * (EXP((a : Num), 2) - 1)"))
  let t145 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s132 = @tactics.subst_all_tac(x131)
    fn(x133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s132(x133)
    }
  }), t134), t135), t139), t140), t141), t142), t143), t144)
  let t130 = @tactics.undisch_tac(@term_syntax.parse_term("2 <= (a : Num)"))
  let t129 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq(), @arith.exp_one(), @arith.exp_eq_1(), @arith.mult_eq_1(), @calc_num.arith_eq()]))
  let t128 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_mul(), @realax.real_of_num_add()]))
  let t127 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_mul())]))
  let t126 = @simp.asm_rewrite_tac(@list.List([]))
  let t123 = @term_syntax.parse_term("(b : Num)")
  let t124 = @bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t123]), integer_sub_lemma())
  let t125 = @tactics.x_choose_tac(@term_syntax.parse_term("(c : Num)"), t124)
  let t122 = @simp.rewrite_tac(@list.List([@real.real_pow_mul()]))
  let t118 = @term_syntax.parse_term("real_pow")
  let t115 = @term_syntax.parse_term("2")
  let t121 = @tactics.disch_then(fn(x120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x117 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s111 = @tactics.mp_tac(x110)
        fn(x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s111(x112)
        }
      })((fn(x116 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x113 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x114 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x113, x114)
          }
        })(x116)(t115)
      })(x117))
    })(((x119 : @kernel.Thm) => @equal.ap_term(t118, x119))(x120))
  })
  let t107 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * a == (b : Real) * b + real_of_num(1) → (a + b) * (a - b) == real_of_num(1)")))
  let t109 = @tactics.disch_then(fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s105 = @tactics.mp_tac(x104)
      fn(x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s105(x106)
      }
    })(t107(x108))
  })
  let t103 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t100 = @equal.gsym(@calc_int.real_of_num_pow())
  let t101 = @equal.gsym(@realax.real_of_num_add())
  let t102 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq()), t101, t100]))
  let t97 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) - (b : Num) == 1 → a == b + 1")))
  let t99 = @tactics.disch_then(fn(x98 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s95 = @tactics.mp_tac(x94)
      fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s95(x96)
      }
    })(t97(x98))
  })
  let t93 = @simp.rewrite_tac(@list.List([@arith.exp()]))
  let t92 = @simp.asm_rewrite_tac(@list.List([@arith.lt_exp(), @calc_num.arith_le(), @calc_num.arith_lt()]))
  let t90 = @bool.conjunct1(@arith.exp())
  let t91 = @tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(a : Num)"), t90)))
  let t87 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) - 1 == (b : Num) → 1 < a → a - b == 1")))
  let t89 = @tactics.disch_then(fn(x88 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x84 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s85 = @tactics.mp_tac(x84)
      fn(x86 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s85(x86)
      }
    })(t87(x88))
  })
  let t146 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Num)"))(fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s82 = @tactics.mp_tac(x81)
    fn(x83 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s82(x83)
    }
  })), t89), t91), t92), t93), t99), t102), t103), t109), t121), t122), t125), t126), t127), t128), t129), t130), @int.arith_tac), t145])
  let t80 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(b : Bool) && ((a : Bool) → (c : Bool)) → (!a → b) → c")))
  let t79 = @simp.asm_rewrite_tac(@list.List([@bool.eqt_intro(@bool.spec_all(@arith.mult_sym()))]))
  let t75 = @term_syntax.parse_term("2")
  let t76 = @term_syntax.parse_term("EXP((a : Num), 2) - 1")
  let t77 = @term_syntax.parse_term("(q : Num)")
  let t78 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t77, t76, t75]), root_nonpower()))
  let t74 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_mul(), @realax.real_of_num_eq()]))
  let t72 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("2 <= (a : Num) → 1 <= a"))]))
  let t70 = @equal.gsym(@calc_int.real_of_num_pow())
  let t71 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t70]))
  let t69 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t73 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t69), t71), t72), @tactics.all_tac])
  let t68 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s66 = @tactics.subst1_tac(x65)
    fn(x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s66(x67)
    }
  })
  let t64 = @simp.asm_rewrite_tac(@list.List([]))
  let t61 = @term_syntax.parse_term("(v : Num)")
  let t62 = @bool.specl(@list.List([@term_syntax.parse_term("(y : Num)"), t61]), integer_sub_lemma())
  let t63 = @tactics.x_choose_tac(@term_syntax.parse_term("(q : Num)"), t62)
  let t58 = @term_syntax.parse_term("(x : Num)")
  let t59 = @bool.specl(@list.List([@term_syntax.parse_term("(u : Num)"), t58]), integer_sub_lemma())
  let t60 = @tactics.x_choose_tac(@term_syntax.parse_term("(p : Num)"), t59)
  let t57 = @simp.asm_simp_tac(@list.List([@real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("2 <= (a : Num) → 1 <= a"))]))
  let t56 = @simp.rewrite_tac(@list.List([@real.real_pow_mul()]))
  let t52 = @term_syntax.parse_term("real_pow")
  let t49 = @term_syntax.parse_term("2")
  let t55 = @tactics.disch_then(fn(x54 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s45 = @tactics.mp_tac(x44)
        fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s45(x46)
        }
      })((fn(x50 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x47 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x48 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x47, x48)
          }
        })(x50)(t49)
      })(x51))
    })(((x53 : @kernel.Thm) => @equal.ap_term(t52, x53))(x54))
  })
  let t43 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.real_sub_rdistrib())]))
  let t42 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real) == (c : Real) + (d : Real)) == (a - c == d - b)"))]))
  let t41 = @simp.simp_tac(@list.List([]))
  let t147 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t41), t42), t43), t55), t56), t57), t60), t63), t64), t68), t73), t74), @tactics.disch_tac), t78), t79), t80), @tactics.conj_tac), t146)
  sqrt_linear_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ u : Num, ∀ v : Num, ∀ x : Num, ∀ y : Num, 2 <= a → (real_of_num(u) + real_of_num(v) * sqrt(pow(real_of_num(a), 2) - real_of_num(1)) == real_of_num(x) + real_of_num(y) * sqrt(pow(real_of_num(a), 2) - real_of_num(1))) == (u == x && v == y)"), t147))
}

///|
let sqrt_linear_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_LINEAR_EQ")

///|
/// `SQRT_LINEAR_EQ`
pub fn sqrt_linear_eq() -> @kernel.Thm {
  sqrt_linear_eq_c.get()
}

///|
/// X_DEF
fn step_6() -> Unit raise {
  let t150 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) - (m : Num) < n) == (!(m == 0) && !(n == 0))")), @calc_num.arith_eq()]))
  let t149 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t148 = @tactics.repeat_tac(@tactics.strip_tac)
  let t151 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@drule.match_mp(@wf.wf_rec())(@wf.wf_num()))), t148), t149), @tactics.binop_tac), t150)
  let th = @tactics.prove(@term_syntax.parse_term("∀ a : Num, ∃ X : (Num) -> Num, ∀ n : Num, X(n) == (if n == 0 { 1 } else { if n == 1 { a } else { 2 * (a * X(n - 1)) - X(n - 2) } })"), t151)
  let t152 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(th)
  x_def_c.set(@nums.new_specification(@list.List(["X"]))(t152))
}

///|
let x_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_DEF")

///|
/// `X_DEF`
pub fn x_def() -> @kernel.Thm {
  x_def_c.get()
}

///|
/// X_CLAUSES
fn step_7() -> Unit raise {
  let t158 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 - 2 == n && n + 2 - 1 == n + 1"))]))
  let t157 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq(), @arith.add_eq_0(), @int.arith_rule(@term_syntax.parse_term("!((n : Num) + 2 == 1)"))]))
  let t156 = @simp.gen_rewrite_tac(fn(x153 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s154 = @equal.land_conv(x153)
    fn(x155 : @kernel.Term) -> @kernel.Thm raise {
      s154(x155)
    }
  }, @list.List([x_def()]))
  let t159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t156), t157), t158)
  x_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ a : Num, X(a, 0) == 1) && (∀ a : Num, X(a, 1) == a) && (∀ a : Num, ∀ n : Num, X(a, n + 2) == 2 * (a * X(a, n + 1)) - X(a, n))"), t159))
}

///|
let x_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_CLAUSES")

///|
/// `X_CLAUSES`
pub fn x_clauses() -> @kernel.Thm {
  x_clauses_c.get()
}

///|
/// Y_DEF
fn step_8() -> Unit raise {
  let t162 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) - (m : Num) < n) == (!(m == 0) && !(n == 0))")), @calc_num.arith_eq()]))
  let t161 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t160 = @tactics.repeat_tac(@tactics.strip_tac)
  let t163 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@drule.match_mp(@wf.wf_rec())(@wf.wf_num()))), t160), t161), @tactics.binop_tac), t162)
  let th = @tactics.prove(@term_syntax.parse_term("∀ a : Num, ∃ Y : (Num) -> Num, ∀ n : Num, Y(n) == (if n == 0 { 0 } else { if n == 1 { 1 } else { 2 * (a * Y(n - 1)) - Y(n - 2) } })"), t163)
  let t164 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(th)
  y_def_c.set(@nums.new_specification(@list.List(["Y"]))(t164))
}

///|
let y_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_DEF")

///|
/// `Y_DEF`
pub fn y_def() -> @kernel.Thm {
  y_def_c.get()
}

///|
/// Y_CLAUSES
fn step_9() -> Unit raise {
  let t170 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 - 2 == n && n + 2 - 1 == n + 1"))]))
  let t169 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq(), @arith.add_eq_0(), @int.arith_rule(@term_syntax.parse_term("!((n : Num) + 2 == 1)"))]))
  let t168 = @simp.gen_rewrite_tac(fn(x165 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s166 = @equal.land_conv(x165)
    fn(x167 : @kernel.Term) -> @kernel.Thm raise {
      s166(x167)
    }
  }, @list.List([y_def()]))
  let t171 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t168), t169), t170)
  y_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ a : Num, Y(a, 0) == 0) && (∀ a : Num, Y(a, 1) == 1) && (∀ a : Num, ∀ n : Num, Y(a, n + 2) == 2 * (a * Y(a, n + 1)) - Y(a, n))"), t171))
}

///|
let y_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_CLAUSES")

///|
/// `Y_CLAUSES`
pub fn y_clauses() -> @kernel.Thm {
  y_clauses_c.get()
}

///|
/// X_INCREASES
fn step_10() -> Unit raise {
  let t199 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t198 = @tactics.first_assum(@tactics.match_mp_tac)
  let t197 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 - 2 == n"))]))
  let t196 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)")), @int.arith_tac), @tactics.all_tac])
  let t195 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == n - 1 + 1"), fn(x192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s193 = @tactics.subst1_tac(x192)
    fn(x194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s193(x194)
    }
  })
  let t191 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(b : Num) <= (a : Num) → a + b <= 2 * a")))
  let t189 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) + a"))]))
  let t188 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses()]))
  let t186 = @term_syntax.parse_term("(a : Num)")
  let t187 = @tactics.spec_tac(@term_syntax.parse_term("(a : Num)"), t186)
  let t185 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t190 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_mult_lcancel(), @calc_num.arith_eq()])), t185), t187), @nums.induct_tac), t188), t189)])
  let t184 = @tactics.exists_tac(@term_syntax.parse_term("2 * X((a : Num), (n : Num))"))
  let t183 = @tactics.match_mp_tac(@arith.le_trans())
  let t182 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) + (b : Num) <= (c : Num) → a <= c - b")))
  let t181 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t180 = @simp.asm_rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq(), @int.arith_rule(@term_syntax.parse_term("((n : Num) + 1 == 1) == (n == 0)"))]))
  let t179 = @simp.gen_rewrite_tac(fn(x176 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s177 = @equal.rand_conv(x176)
    fn(x178 : @kernel.Term) -> @kernel.Thm raise {
      s177(x178)
    }
  }, @list.List([x_def()]))
  let t175 = @simp.asm_rewrite_tac(@list.List([x_clauses(), @arith.add_clauses(), @int.arith_rule(@term_syntax.parse_term("(1 <= (a : Num)) == !(a == 0)"))]))
  let t174 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t173 = @tactics.repeat_tac(@tactics.strip_tac)
  let t172 = @tactics.match_mp_tac(@arith.num_wf())
  let t200 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))), @tactics.disch_tac), t172), t173), t174), t175), t179), t180), t181), t182), t183), t184), @tactics.conj_tac), t190), t191), t195), t196), t197), t198), t199), @int.arith_tac)
  x_increases_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → X(a, n) <= X(a, n + 1)"), t200))
}

///|
let x_increases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_INCREASES")

///|
/// `X_INCREASES`
pub fn x_increases() -> @kernel.Thm {
  x_increases_c.get()
}

///|
/// Y_INCREASES
fn step_11() -> Unit raise {
  let t228 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t227 = @tactics.first_assum(@tactics.match_mp_tac)
  let t226 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 1 + 1 - 2 == n"))]))
  let t225 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)")), @int.arith_tac), @tactics.all_tac])
  let t224 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == n - 1 + 1"), fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s222 = @tactics.subst1_tac(x221)
    fn(x223 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s222(x223)
    }
  })
  let t220 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(b : Num) <= (a : Num) → a + b <= 2 * a")))
  let t218 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) + a"))]))
  let t217 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses()]))
  let t215 = @term_syntax.parse_term("(a : Num)")
  let t216 = @tactics.spec_tac(@term_syntax.parse_term("(a : Num)"), t215)
  let t214 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t219 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_mult_lcancel(), @calc_num.arith_eq()])), t214), t216), @nums.induct_tac), t217), t218)])
  let t213 = @tactics.exists_tac(@term_syntax.parse_term("2 * Y((a : Num), (n : Num))"))
  let t212 = @tactics.match_mp_tac(@arith.le_trans())
  let t211 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) + (b : Num) <= (c : Num) → a <= c - b")))
  let t210 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t209 = @simp.asm_rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq(), @int.arith_rule(@term_syntax.parse_term("((n : Num) + 1 == 1) == (n == 0)"))]))
  let t208 = @simp.gen_rewrite_tac(fn(x205 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s206 = @equal.rand_conv(x205)
    fn(x207 : @kernel.Term) -> @kernel.Thm raise {
      s206(x207)
    }
  }, @list.List([y_def()]))
  let t204 = @simp.asm_rewrite_tac(@list.List([y_clauses(), @arith.add_clauses(), @arith.le_0()]))
  let t203 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t202 = @tactics.repeat_tac(@tactics.strip_tac)
  let t201 = @tactics.match_mp_tac(@arith.num_wf())
  let t229 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))), @tactics.disch_tac), t201), t202), t203), t204), t208), t209), t210), t211), t212), t213), @tactics.conj_tac), t219), t220), t224), t225), t226), t227), t228), @int.arith_tac)
  y_increases_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → Y(a, n) <= Y(a, n + 1)"), t229))
}

///|
let y_increases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_INCREASES")

///|
/// `Y_INCREASES`
pub fn y_increases() -> @kernel.Thm {
  y_increases_c.get()
}

///|
/// XY_POWER_POS
fn step_12() -> Unit raise {
  let t280 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t278 = @int.arith_rule(@term_syntax.parse_term("(1 <= (a : Num)) == !(a == 0)"))
  let t279 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t278]))
  let t277 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t276 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realax.real_add_ldistrib(), @real.real_add_rdistrib()]))
  let t275 = @simp.rewrite_tac(@list.List([@real.real_pow_add()]))
  let t273 = @term_syntax.parse_term("!((n : Num) == 1)")
  let t274 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x270 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s271 = @tactics.undisch_tac(x270)
    fn(x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s271(x272)
    }
  }, @list.List([@term_syntax.parse_term("!((n : Num) == 0)"), t273])), @int.arith_tac), @tactics.all_tac])
  let t269 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == 2 + (n - 2)"), fn(x260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x260
    @simp.gen_rewrite_tac(fn(x268 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x262 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s263 = @equal.rand_conv(x262)
        fn(x264 : @kernel.Term) -> @kernel.Thm raise {
          s263(x264)
        }
      })((fn(x265 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s266 = @equal.rand_conv(x265)
        fn(x267 : @kernel.Term) -> @kernel.Thm raise {
          s266(x267)
        }
      })(x268))
    }, @list.List([th]))
  })
  let t259 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) - b == (a - real_of_num(1)) * b"))]))
  let t258 = @simp.rewrite_tac(@list.List([@real.real_pow_add(), @realax.real_mul_assoc(), @real.real_pow_1()]))
  let t257 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) && !(n == 1) → n - 1 == 1 + (n - 2)"))]))
  let t256 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) && !(n == 1) → n - 2 < n && n - 1 < n"))]))
  let t254 = @equal.gsym(@realax.real_add_ldistrib())
  let t255 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), t254]))
  let t253 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul())]))
  let t252 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x1 : Real) - (x2 : Real) + ((y1 : Real) - (y2 : Real)) * (a : Real) == x1 + y1 * a - (x2 + y2 * a)"))]))
  let t250 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t249 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t248 = @simp.gen_rewrite_tac(fn(x245 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s246 = @equal.land_conv(x245)
    fn(x247 : @kernel.Term) -> @kernel.Thm raise {
      s246(x247)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == 1 * n"))]))
  let t244 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t243 = @simp.asm_simp_tac(@list.List([x_increases(), y_increases()]))
  let t242 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) && !(n == 1) → n - 1 == n - 2 + 1"))]))
  let t241 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (y : Num) && y <= 2 * ((a : Num) * y) → x <= 2 * (a * y)")))
  let t251 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@equal.gsym(@real.real_of_num_sub()))), t241), t242), t243), t244), t248), t249), @tactics.disj1_tac), t250), @int.arith_tac), @tactics.all_tac])
  let t239 = @tactics.conjuncts_then(fn(x236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s237 = @tactics.subst1_tac(x236)
    fn(x238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s237(x238)
    }
  })
  let t240 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(2 * ((a : Num) * X(a, (n : Num) - 1)) - X(a, n - 2)) == real_of_num(2 * (a * X(a, n - 1))) - real_of_num(X(a, n - 2)) && real_of_num(2 * (a * Y(a, n - 1)) - Y(a, n - 2)) == real_of_num(2 * (a * Y(a, n - 1))) - real_of_num(Y(a, n - 2))"), t239)
  let t235 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add()]))
  let t234 = @simp.asm_rewrite_tac(@list.List([@real.real_pow_1(), @realax.real_mul_lid()]))
  let t233 = @simp.rewrite_tac(@list.List([@analysis.real_mul_lzero(), @calc_int.real_add_rid(), @realax.real_pow()]))
  let t232 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t231 = @simp.once_rewrite_tac(@list.List([x_def(), y_def()]))
  let t230 = @tactics.match_mp_tac(@arith.num_wf())
  let t281 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))), @tactics.disch_tac), t230), @tactics.gen_tac), @tactics.disch_tac), t231), @class.cond_cases_tac), t232), t233), @class.cond_cases_tac), t234), t235), t240), t251), t252), t253), t255), t256), t257), t258), t259), t269), t274), t275), @tactics.ap_thm_tac), @tactics.ap_term_tac), t276), t277), t279), t280), @calc_rat.real_arith_tac)
  xy_power_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → real_of_num(X(a, n)) + real_of_num(Y(a, n)) * sqrt(pow(real_of_num(a), 2) - real_of_num(1)) == pow(real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1)), n)"), t281))
}

///|
let xy_power_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XY_POWER_POS")

///|
/// `XY_POWER_POS`
pub fn xy_power_pos() -> @kernel.Thm {
  xy_power_pos_c.get()
}

///|
/// XY_POWER_NEG
fn step_13() -> Unit raise {
  let t332 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t330 = @int.arith_rule(@term_syntax.parse_term("(1 <= (a : Num)) == !(a == 0)"))
  let t331 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t330]))
  let t329 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2())]))
  let t328 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @analysis.real_sub_ldistrib(), @analysis.real_sub_rdistrib()]))
  let t327 = @simp.rewrite_tac(@list.List([@real.real_pow_add()]))
  let t325 = @term_syntax.parse_term("!((n : Num) == 1)")
  let t326 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x322 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s323 = @tactics.undisch_tac(x322)
    fn(x324 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s323(x324)
    }
  }, @list.List([@term_syntax.parse_term("!((n : Num) == 0)"), t325])), @int.arith_tac), @tactics.all_tac])
  let t321 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == 2 + (n - 2)"), fn(x312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x312
    @simp.gen_rewrite_tac(fn(x320 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x314 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s315 = @equal.rand_conv(x314)
        fn(x316 : @kernel.Term) -> @kernel.Thm raise {
          s315(x316)
        }
      })((fn(x317 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s318 = @equal.rand_conv(x317)
        fn(x319 : @kernel.Term) -> @kernel.Thm raise {
          s318(x319)
        }
      })(x320))
    }, @list.List([th]))
  })
  let t311 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) - b == (a - real_of_num(1)) * b"))]))
  let t310 = @simp.rewrite_tac(@list.List([@real.real_pow_add(), @realax.real_mul_assoc(), @real.real_pow_1()]))
  let t309 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) && !(n == 1) → n - 1 == 1 + (n - 2)"))]))
  let t308 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) && !(n == 1) → n - 2 < n && n - 1 < n"))]))
  let t306 = @equal.gsym(@analysis.real_sub_ldistrib())
  let t307 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), t306]))
  let t305 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul())]))
  let t304 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x1 : Real) - (x2 : Real) - ((y1 : Real) - (y2 : Real)) * (a : Real) == x1 - y1 * a - (x2 - y2 * a)"))]))
  let t302 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t301 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t300 = @simp.gen_rewrite_tac(fn(x297 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s298 = @equal.land_conv(x297)
    fn(x299 : @kernel.Term) -> @kernel.Thm raise {
      s298(x299)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == 1 * n"))]))
  let t296 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t295 = @simp.asm_simp_tac(@list.List([x_increases(), y_increases()]))
  let t294 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) && !(n == 1) → n - 1 == n - 2 + 1"))]))
  let t293 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (y : Num) && y <= 2 * ((a : Num) * y) → x <= 2 * (a * y)")))
  let t303 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@equal.gsym(@real.real_of_num_sub()))), t293), t294), t295), t296), t300), t301), @tactics.disj1_tac), t302), @int.arith_tac), @tactics.all_tac])
  let t291 = @tactics.conjuncts_then(fn(x288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s289 = @tactics.subst1_tac(x288)
    fn(x290 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s289(x290)
    }
  })
  let t292 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(2 * ((a : Num) * X(a, (n : Num) - 1)) - X(a, n - 2)) == real_of_num(2 * (a * X(a, n - 1))) - real_of_num(X(a, n - 2)) && real_of_num(2 * (a * Y(a, n - 1)) - Y(a, n - 2)) == real_of_num(2 * (a * Y(a, n - 1))) - real_of_num(Y(a, n - 2))"), t291)
  let t287 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add()]))
  let t286 = @simp.asm_rewrite_tac(@list.List([@real.real_pow_1(), @realax.real_mul_lid()]))
  let t285 = @simp.rewrite_tac(@list.List([@analysis.real_mul_lzero(), @analysis.real_sub_rzero(), @realax.real_pow()]))
  let t284 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t283 = @simp.once_rewrite_tac(@list.List([x_def(), y_def()]))
  let t282 = @tactics.match_mp_tac(@arith.num_wf())
  let t333 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))), @tactics.disch_tac), t282), @tactics.gen_tac), @tactics.disch_tac), t283), @class.cond_cases_tac), t284), t285), @class.cond_cases_tac), t286), t287), t292), t303), t304), t305), t307), t308), t309), t310), t311), t321), t326), t327), @tactics.ap_thm_tac), @tactics.ap_term_tac), t328), t329), t331), t332), @calc_rat.real_arith_tac)
  xy_power_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → real_of_num(X(a, n)) - real_of_num(Y(a, n)) * sqrt(pow(real_of_num(a), 2) - real_of_num(1)) == pow(real_of_num(a) - sqrt(pow(real_of_num(a), 2) - real_of_num(1)), n)"), t333))
}

///|
let xy_power_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XY_POWER_NEG")

///|
/// `XY_POWER_NEG`
pub fn xy_power_neg() -> @kernel.Thm {
  xy_power_neg_c.get()
}

///|
/// XY_ARE_SOLUTIONS
fn step_14() -> Unit raise {
  let t374 = @simp.rewrite_tac(@list.List([@arith.mult_ac(), @arith.add_ac()]))
  let t375 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_mul(), @realax.real_of_num_eq(), @calc_int.real_of_num_pow()])), t374)
  let t373 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("(1 <= (a : Num)) == !(a == 0)"))]))
  let t371 = @equal.gsym(@calc_int.real_of_num_pow())
  let t372 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t371]))
  let t370 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t376 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t370), t372), t373), t375])
  let t369 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s367 = @tactics.subst1_tac(x366)
    fn(x368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s367(x368)
    }
  })
  let t365 = @simp.rewrite_tac(@list.List([@real.real_eq_sub_radd()]))
  let t364 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (a - real_of_num(1)) == real_of_num(1)")), @real.real_pow_one()]))
  let t362 = @int.arith_rule(@term_syntax.parse_term("(1 <= (a : Num)) == !(a == 0)"))
  let t363 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t362]))
  let t360 = @term_syntax.parse_term("(a : Real) * (b : Real) * ((c : Real) * (d : Real)) == a * c * (b * d)")
  let t361 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t360)]))
  let t359 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + (y : Real)) * (x - y) == x * x - y * y"))]))
  let t358 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_mul())]))
  let t357 = @tactics.disch_then(fn(x353 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x353
    let t356 = @bool.conjunct2(th)
    let t355 = @bool.conjunct1(th)
    @tactics.mp_tac(@kernel.mk_comb_rule(@equal.ap_term(@term_syntax.parse_term("real_mul"), t355), t356))
  })
  let t352 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t349 = @drule.match_mp(xy_power_pos())
  let t346 = @term_syntax.parse_term("(n : Num)")
  let t351 = @tactics.first_assum(fn(x350 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x348 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x343 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s344 = @tactics.mp_tac(x343)
        fn(x345 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s344(x345)
        }
      })(((x347 : @kernel.Thm) => @bool.spec(t346, x347))(x348))
    })(t349(x350))
  })
  let t340 = @drule.match_mp(xy_power_neg())
  let t337 = @term_syntax.parse_term("(n : Num)")
  let t342 = @tactics.first_assum(fn(x341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s335 = @tactics.mp_tac(x334)
        fn(x336 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s335(x336)
        }
      })(((x338 : @kernel.Thm) => @bool.spec(t337, x338))(x339))
    })(t340(x341))
  })
  let t377 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t342), t351), t352), t357), t358), t359), t361), t363), t364), t365), t369), t376)
  xy_are_solutions_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → EXP(X(a, n), 2) == (EXP(a, 2) - 1) * EXP(Y(a, n), 2) + 1"), t377))
}

///|
let xy_are_solutions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XY_ARE_SOLUTIONS")

///|
/// `XY_ARE_SOLUTIONS`
pub fn xy_are_solutions() -> @kernel.Thm {
  xy_are_solutions_c.get()
}

///|
/// X_DEGENERATE
fn step_15() -> Unit raise {
  let t378 = @simp.simp_tac(@list.List([x_clauses(), @calc_num.arith()]))
  let t379 = @tactics.then_tac(@tactics.match_mp_tac(pell_induction()), t378)
  x_degenerate_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, X(1, n) == 1"), t379))
}

///|
let x_degenerate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_DEGENERATE")

///|
/// `X_DEGENERATE`
pub fn x_degenerate() -> @kernel.Thm {
  x_degenerate_c.get()
}

///|
/// Y_DEGENERATE
fn step_16() -> Unit raise {
  let t381 = @tactics.repeat_tac(@tactics.strip_tac)
  let t380 = @simp.simp_tac(@list.List([y_clauses()]))
  let t382 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(pell_induction()), t380), t381), @int.arith_tac)
  y_degenerate_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, Y(1, n) == n"), t382))
}

///|
let y_degenerate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_DEGENERATE")

///|
/// `Y_DEGENERATE`
pub fn y_degenerate() -> @kernel.Thm {
  y_degenerate_c.get()
}

///|
/// REAL_ARCH_POW_MINIMAL
fn step_17() -> Unit raise {
  let t393 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (x : Real) → real_of_num(0) < x"))
  let t394 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transc.ln_pow()), t393, @real.real_pow_lt(), @transc.ln_mono_lt(), @transc.ln_mono_le()]))
  let t392 = @simp.asm_simp_tac(@list.List([@transc.ln_pos_lt(), @analysis.real_lt_imp_le()]))
  let t388 = @term_syntax.parse_term("ln((y : Real))")
  let t391 = @tactics.disch_then(fn(x390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x385 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s386 = @tactics.mp_tac(x385)
      fn(x387 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s386(x387)
      }
    })(((x389 : @kernel.Thm) => @bool.spec(t388, x389))(x390))
  })
  let t384 = @simp.asm_simp_tac(@list.List([@transc.ln_pos_lt()]))
  let t383 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("ln((x : Real))"), @analysis.real_arch_least()))
  let t395 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t383), t384), t391), t392), t394)
  real_arch_pow_minimal_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(1) < x && real_of_num(1) < y → (∃ n : Num, pow(x, n) <= y && y < pow(x, SUC(n)))"), t395))
}

///|
let real_arch_pow_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ARCH_POW_MINIMAL")

///|
/// `REAL_ARCH_POW_MINIMAL`
pub fn real_arch_pow_minimal() -> @kernel.Thm {
  real_arch_pow_minimal_c.get()
}

///|
/// SOLUTIONS_INDUCTION
fn step_18() -> Unit raise {
  let t611 = @simp.asm_rewrite_tac(@list.List([]))
  let t610 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) && !(a == 1) → 1 < a")))
  let t609 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt()]))
  let t608 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_le(), @real.sqrt_pos_le(), @real.real_pow_le_1(), @analysis.real_sub_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t607 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (x : Real) && real_of_num(0) <= (y : Real) → real_of_num(1) < x + y")))
  let t605 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_le(), @real.sqrt_pos_le(), @real.real_pow_le_1(), @analysis.real_sub_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t604 = @simp.rewrite_tac(@list.List([@analysis.real_pos()]))
  let t603 = @tactics.match_mp_tac(@analysis.real_le_mul())
  let t601 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq()]))
  let t600 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t599 = @tactics.disch_then(fn(x598 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s596 = @tactics.mp_tac(x595)
      fn(x597 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s596(x597)
      }
    })(@equal.sym(x598))
  })
  let t594 = @tactics.undisch_tac(@term_syntax.parse_term("EXP(0, 2) == (EXP((a : Num), 2) - 1) * EXP((v : Num), 2) + 1"))
  let t593 = @tactics.disch_then(fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s591 = @tactics.subst_all_tac(x590)
    fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s591(x592)
    }
  })
  let t602 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_of_num_lt(), @arith.lt_nz()])), t593), t594), t599), t600), t601), @tactics.all_tac])
  let t606 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@analysis.real_lte_add()), @tactics.conj_tac), t602), t603), t604), t605), @tactics.all_tac])
  let t589 = @tactics.match_mp_tac(@real.real_lt_lmul())
  let t587 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_le(), @real.sqrt_pos_le(), @real.real_pow_le_1(), @analysis.real_sub_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t586 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t585 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t584 = @tactics.match_mp_tac(@real.real_le_add2())
  let t588 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@analysis.real_mul_rid()])), t584), t585), t586), t587), @tactics.all_tac])
  let t583 = @tactics.exists_tac(@term_syntax.parse_term("(real_of_num((u : Num)) + real_of_num((v : Num)) * sqrt(pow(real_of_num((a : Num)), 2) - real_of_num(1))) * real_of_num(1)"))
  let t582 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t581 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) → !(a == b)")))
  let t580 = @simp.rewrite_tac(@list.List([]))
  let t579 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num((x : Num)) + real_of_num((y : Num)) * sqrt(pow(real_of_num((a : Num)), 2) - real_of_num(1)) == (real_of_num((u : Num)) + real_of_num((v : Num)) * sqrt(pow(real_of_num(a), 2) - real_of_num(1))) * (real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1)))"))
  let t578 = @simp.rewrite_tac(@list.List([@arith.not_lt()]))
  let t576 = @simp.asm_rewrite_tac(@list.List([]))
  let t575 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) && !(a == 1) → 2 <= a")))
  let t574 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t573 = @simp.rewrite_tac(@list.List([@arith.lt_exp()]))
  let t571 = @bool.conjunct1(@arith.exp())
  let t572 = @tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(a : Num)"), t571)))
  let t570 = @simp.rewrite_tac(@list.List([@arith.sub_eq_0(), @calc_num.arith_suc(), @arith.not_le()]))
  let t569 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) → (a && (b : Bool)) == b")))
  let t568 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), @arith.exp_mono_lt(), @nums.not_suc()]))
  let t567 = @simp.rewrite_tac(@list.List([@arith.lt_add_rcancel(), @arith.lt_mult_lcancel()]))
  let t566 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_suc()]))
  let t563 = @term_syntax.parse_term("SUC(1)")
  let t564 = @term_syntax.parse_term("(y : Num)")
  let t565 = @bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t564, t563]), @arith.exp_mono_lt())
  let t577 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x560 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s561 = @equal.land_conv(x560)
    fn(x562 : @kernel.Term) -> @kernel.Thm raise {
      s561(x562)
    }
  }, @list.List([@equal.sym(@simp.rewrite_rule(@list.List([@nums.not_suc()]))(t565))])), t566), t567), t568), t569), t570), t572), t573), t574), t575), t576), @tactics.all_tac])
  let t559 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) == (b : Bool) && (!a && !b → false) → a && b")))
  let t558 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t555 = @simp.once_rewrite_rule(@list.List([@arith.mult_sym()]))
  let t557 = @tactics.disch_then(fn(x556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s553 = @tactics.assume_tac(x552)
      fn(x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s553(x554)
      }
    })(t555(x556))
  })
  let t551 = @simp.abbrev_tac(@term_syntax.parse_term("(v : Num) == (a : Num) * (y : Num) - (x : Num)"))
  let t550 = @simp.abbrev_tac(@term_syntax.parse_term("(u : Num) == (a : Num) * (x : Num) - (EXP(a, 2) - 1) * (y : Num)"))
  let t549 = @simp.asm_simp_tac(@list.List([@real.real_of_num_sub(), @realax.real_of_num_add(), @realax.real_of_num_eq(), @calc_int.real_of_num_pow(), @realax.real_of_num_mul()]))
  let t547 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t545 = @equal.gsym(@calc_int.real_of_num_pow())
  let t546 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t545]))
  let t544 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t548 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t544), t546), t547), @tactics.all_tac])
  let t543 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x540 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s541 = @tactics.subst1_tac(x540)
    fn(x542 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s541(x542)
    }
  })
  let t537 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) + real_of_num(1) - b * a == (x : Real) - (y : Real) → x == y + real_of_num(1)")))
  let t539 = @tactics.disch_then(fn(x538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x534 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s535 = @tactics.mp_tac(x534)
      fn(x536 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s535(x536)
      }
    })(t537(x538))
  })
  let t532 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t530 = @equal.gsym(@calc_int.real_of_num_pow())
  let t531 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t530]))
  let t529 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t533 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t529), t531), t532), @tactics.all_tac])
  let t528 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x527 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x524 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s525 = @tactics.subst1_tac(x524)
      fn(x526 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s525(x526)
      }
    })(@equal.sym(x527))
  })
  let t521 = @equal.gsym(@realax.real_of_num_mul())
  let t522 = @equal.gsym(@realax.real_of_num_add())
  let t523 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_int.real_of_num_pow()), t522, t521]))
  let t520 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_of_num_pow()]))
  let t519 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (a - (b : Real)) == b")), @analysis.real_mul_rid()]))
  let t517 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))
  let t518 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t517]))
  let t515 = @term_syntax.parse_term("(a : Real) * (b : Real) * ((c : Real) * b) == c * a * (b * b)")
  let t516 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t515)]))
  let t514 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real)) * (a + b) == a * a - b * b"))]))
  let t513 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real)) * (a - b) == a * a - b * b"))]))
  let t511 = @term_syntax.parse_term("(a : Real) * (b : Real) * ((c : Real) * (d : Real)) == c * a * (d * b)")
  let t512 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t511)]))
  let t510 = @tactics.disch_then(fn(x506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th1 = x506
    @tactics.disch_then(fn(x508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th2 = x508
      @tactics.mp_tac(@kernel.mk_comb_rule(@equal.ap_term(@term_syntax.parse_term("real_mul"), th1), th2))
    })
  })
  let t504 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t502 = @equal.gsym(@calc_int.real_of_num_pow())
  let t503 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t502]))
  let t501 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t500 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()]))
  let t499 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul())]))
  let t497 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))
  let t498 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t497]))
  let t496 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (y : Real) * (s : Real)) * ((a : Real) + s) == a * x - s * s * y - (a * y - x) * s"))]))
  let t495 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_of_num_sub())]))
  let t494 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (a - (b : Real)) == b")), @analysis.real_mul_rid()]))
  let t492 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))
  let t493 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t492]))
  let t491 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real)) * (a + b) == a * a - b * b"))]))
  let t490 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t488 = @simp.asm_simp_tac(@list.List([@real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t487 = @simp.rewrite_tac(@list.List([@calc_int.real_pow_neg(), @calc_num.arith()]))
  let t483 = @term_syntax.parse_term("real_pow")
  let t480 = @term_syntax.parse_term("2")
  let t486 = @tactics.disch_then(fn(x485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x475 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s476 = @tactics.mp_tac(x475)
        fn(x477 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s476(x477)
        }
      })((fn(x481 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x478 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x479 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x478, x479)
          }
        })(x481)(t480)
      })(x482))
    })(((x484 : @kernel.Thm) => @equal.ap_term(t483, x484))(x485))
  })
  let t489 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("!((a : Real) == -(b : Real)) → !(a + b == real_of_num(0))"))), t486), t487), t488), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t474 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((a : Num)) + sqrt(pow(real_of_num(a), 2) - real_of_num(1))"))
  let t505 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_rcancel_imp()), t474), @tactics.conj_tac), t489), t490), t491), t493), t494), t495), t496), t498), t499), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t500), t501), t503), t504), @tactics.all_tac])
  let t473 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((x : Num)) - real_of_num((y : Num)) * sqrt(pow(real_of_num((a : Num)), 2) - real_of_num(1)) == (real_of_num(a * x - (EXP(a, 2) - 1) * y) - real_of_num(a * y - x) * sqrt(pow(real_of_num(a), 2) - real_of_num(1))) * (real_of_num(a) - sqrt(pow(real_of_num(a), 2) - real_of_num(1)))"), fn(x470 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s471 = @tactics.mp_tac(x470)
    fn(x472 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s471(x472)
    }
  })
  let t469 = @tactics.disch_then(fn(x466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x466
    let t468 = @tactics.mp_tac(th_1)
    @tactics.then_tac(@tactics.assume_tac(th_1), t468)
  })
  let t464 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t462 = @equal.gsym(@calc_int.real_of_num_pow())
  let t463 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t462]))
  let t461 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t460 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()]))
  let t459 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul())]))
  let t457 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))
  let t458 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t457]))
  let t456 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + (y : Real) * (s : Real)) * ((a : Real) - s) == a * x - s * s * y + (a * y - x) * s"))]))
  let t455 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_of_num_sub())]))
  let t454 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (a - (b : Real)) == b")), @analysis.real_mul_rid()]))
  let t452 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))
  let t453 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t452]))
  let t451 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real)) * (a - b) == a * a - b * b"))]))
  let t450 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t448 = @simp.asm_simp_tac(@list.List([@real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t444 = @term_syntax.parse_term("real_pow")
  let t441 = @term_syntax.parse_term("2")
  let t447 = @tactics.disch_then(fn(x446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x436 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s437 = @tactics.mp_tac(x436)
        fn(x438 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s437(x438)
        }
      })((fn(x442 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x439 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x440 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x439, x440)
          }
        })(x442)(t441)
      })(x443))
    })(((x445 : @kernel.Thm) => @equal.ap_term(t444, x445))(x446))
  })
  let t449 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@analysis.real_sub_0()])), t447), t448), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t435 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((a : Num)) - sqrt(pow(real_of_num(a), 2) - real_of_num(1))"))
  let t465 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_rcancel_imp()), t435), @tactics.conj_tac), t449), t450), t451), t453), t454), t455), t456), t458), t459), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t460), t461), t463), t464), @tactics.all_tac])
  let t434 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(d : Bool) && (d → (a : Bool) && (b : Bool) && (c : Bool)) → a && b && c && d")))
  let t432 = @simp.asm_rewrite_tac(@list.List([]))
  let t431 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t430 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @equal.gsym(@arith.mult_assoc()), @arith.le_mult_lcancel()]))
  let t429 = @simp.gen_rewrite_tac(fn(x426 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s427 = @equal.rand_conv(x426)
    fn(x428 : @kernel.Term) -> @kernel.Thm raise {
      s427(x428)
    }
  }, @list.List([@arith.mult_sym()]))
  let t425 = @tactics.first_assum(fn(x420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x420
    @simp.gen_rewrite_tac(fn(x422 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s423 = @equal.land_conv(x422)
      fn(x424 : @kernel.Term) -> @kernel.Thm raise {
        s423(x424)
      }
    }, @list.List([@equal.sym(th)]))
  })
  let t419 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.le_suc_lt()), @arith.add1()]))
  let t418 = @list.List([@tactics.all_tac, @simp.asm_simp_tac(@list.List([@arith.mult_assoc(), @arith.exp_2(), @arith.lt_mult_rcancel(), @arith.lt_imp_le()]))])
  let t433 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(EXP((a : Num), 2) - 1) * EXP((y : Num), 2) < a * ((x : Num) * y)"), fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s416 = @tactics.mp_tac(x415)
    fn(x417 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s416(x417)
    }
  }), t418), t419), t425), t429), t430), @tactics.disj2_tac), t431), t432), @tactics.all_tac])
  let t414 = @tactics.subgoal_then(@term_syntax.parse_term("(EXP((a : Num), 2) - 1) * (y : Num) <= a * (x : Num)"), fn(x411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s412 = @tactics.assume_tac(x411)
    fn(x413 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s412(x413)
    }
  })
  let t409 = @simp.asm_rewrite_tac(@list.List([@arith.exp_eq_0()]))
  let t408 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) - 1 < a) == !(a == 0)"))]))
  let t407 = @simp.rewrite_tac(@list.List([@arith.mult_exp(), @arith.lt_mult_rcancel()]))
  let t406 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.le_suc_lt()]))
  let t405 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_suc()]))
  let t402 = @term_syntax.parse_term("SUC(1)")
  let t403 = @term_syntax.parse_term("(y : Num)")
  let t404 = @bool.specl(@list.List([@term_syntax.parse_term("(x : Num)"), t403, t402]), @arith.exp_mono_le())
  let t410 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.sym(@simp.rewrite_rule(@list.List([@nums.not_suc()]))(t404))])), t405), t406), t407), t408), t409), @tactics.all_tac])
  let t401 = @tactics.subgoal_then(@term_syntax.parse_term("(x : Num) <= (a : Num) * (y : Num)"), fn(x398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s399 = @tactics.assume_tac(x398)
    fn(x400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s399(x400)
    }
  })
  let t397 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) * (y : Num) - (x : Num)"))
  let t396 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) * (x : Num) - (EXP(a, 2) - 1) * (y : Num)"))
  let t612 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t396), t397), t401), t410), t414), t433), t434), @tactics.conj_tac), t465), t469), t473), t505), t510), t512), t513), t514), t516), t518), t519), t520), t523), t528), t533), t539), t543), t548), t549), t550), t551), t557), t558), t559), @tactics.conj_tac), t577), t578), @tactics.strip_tac), t579), t580), t581), t582), t583), @tactics.conj_tac), t588), t589), @tactics.conj_tac), t606), t607), t608), t609), t610), t611)
  solutions_induction_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ x : Num, ∀ y : Num, !(a == 0) && !(a == 1) && !(y == 0) && EXP(x, 2) == (EXP(a, 2) - 1) * EXP(y, 2) + 1 → (∃ x' : Num, ∃ y' : Num, x' < x && y' < y && EXP(x', 2) == (EXP(a, 2) - 1) * EXP(y', 2) + 1 && real_of_num(x) + real_of_num(y) * sqrt(pow(real_of_num(a), 2) - real_of_num(1)) == (real_of_num(x') + real_of_num(y') * sqrt(pow(real_of_num(a), 2) - real_of_num(1))) * (real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1))))"), t612))
}

///|
let solutions_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLUTIONS_INDUCTION")

///|
/// `SOLUTIONS_INDUCTION`
pub fn solutions_induction() -> @kernel.Thm {
  solutions_induction_c.get()
}

///|
/// SOLUTIONS_ARE_XY
fn step_19() -> Unit raise {
  let t667 = @simp.asm_simp_tac(@list.List([sqrt_linear_eq(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) && !(a == 1) → 2 <= a"))]))
  let t666 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t665 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t664 = @simp.asm_simp_tac(@list.List([@equal.gsym(xy_power_pos())]))
  let t662 = @simp.rewrite_tac(@list.List([@realax.real_pow(), @real.real_mul_ac()]))
  let t661 = @tactics.exists_tac(@term_syntax.parse_term("SUC((n : Num))"))
  let t660 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x657 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s658 = @tactics.subst1_tac(x657)
    fn(x659 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s658(x659)
    }
  }))
  let t656 = @simp.asm_rewrite_tac(@list.List([]))
  let t652 = @term_syntax.parse_term("(x1 : Num)")
  let t655 = @tactics.disch_then(fn(x654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x649 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s650 = @tactics.mp_tac(x649)
      fn(x651 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s650(x651)
      }
    })(((x653 : @kernel.Thm) => @bool.spec(t652, x653))(x654))
  })
  let t648 = @simp.asm_rewrite_tac(@list.List([]))
  let t644 = @term_syntax.parse_term("(y1 : Num)")
  let t647 = @tactics.first_x_assum(fn(x646 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x641 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s642 = @tactics.mp_tac(x641)
      fn(x643 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s642(x643)
      }
    })(((x645 : @kernel.Thm) => @bool.spec(t644, x645))(x646))
  })
  let t639 = @tactics.x_choose_then(@term_syntax.parse_term("(y1 : Num)"))(@tactics.strip_assume_tac)
  let t640 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x1 : Num)"))(t639))
  let t638 = @simp.asm_rewrite_tac(@list.List([]))
  let t635 = @term_syntax.parse_term("(y0 : Num)")
  let t636 = @term_syntax.parse_term("(x0 : Num)")
  let t637 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t636, t635]), solutions_induction()))
  let t633 = @simp.rewrite_tac(@list.List([@analysis.real_mul_lzero(), @calc_int.real_add_rid(), @realax.real_pow()]))
  let t632 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t631 = @tactics.disch_then(fn(x628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s629 = @tactics.subst1_tac(x628)
    fn(x630 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s629(x630)
    }
  })
  let t634 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.exp_2(), @arith.mult_clauses(), @arith.add_clauses(), @arith.mult_eq_1()])), t631), t632), t633), @tactics.all_tac])
  let t627 = @class.asm_cases_tac(@term_syntax.parse_term("(y0 : Num) == 0"))
  let t626 = @tactics.x_gen_tac(@term_syntax.parse_term("(x0 : Num)"))
  let t625 = @tactics.x_gen_tac(@term_syntax.parse_term("(y0 : Num)"))
  let t624 = @tactics.match_mp_tac(@arith.num_wf())
  let t622 = @term_syntax.parse_term("(y : Num)")
  let t623 = @tactics.spec_tac(@term_syntax.parse_term("(y : Num)"), t622)
  let t620 = @term_syntax.parse_term("(x : Num)")
  let t621 = @tactics.spec_tac(@term_syntax.parse_term("(x : Num)"), t620)
  let t663 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("EXP((x : Num), 2) == (EXP((a : Num), 2) - 1) * EXP((y : Num), 2) + 1")), t621), t623), t624), t625), @tactics.disch_tac), t626), t627), t634), @tactics.disch_tac), t637), t638), t640), t647), t648), t655), t656), t660), t661), t662), @tactics.all_tac])
  let t619 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Num, real_of_num((x : Num)) + real_of_num((y : Num)) * sqrt(pow(real_of_num((a : Num)), 2) - real_of_num(1)) == pow(real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1)), n)"), fn(x616 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s617 = @tactics.mp_tac(x616)
    fn(x618 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s617(x618)
    }
  })
  let t614 = @simp.simp_tac(@list.List([@arith.mult_eq_1(), x_degenerate(), y_degenerate(), @equal.gsym(@theorems.exists_refl())]))
  let t615 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@calc_num.arith(), @arith.mult_clauses(), @arith.add_clauses(), @arith.exp_2()])), t614), @tactics.all_tac])
  let t613 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 1"))
  let t668 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t613), t615), @tactics.strip_tac), t619), t663), t664), t665), t666), t667)
  solutions_are_xy_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ x : Num, ∀ y : Num, !(a == 0) && EXP(x, 2) == (EXP(a, 2) - 1) * EXP(y, 2) + 1 → (∃ n : Num, x == X(a, n) && y == Y(a, n))"), t668))
}

///|
let solutions_are_xy_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLUTIONS_ARE_XY")

///|
/// `SOLUTIONS_ARE_XY`
pub fn solutions_are_xy() -> @kernel.Thm {
  solutions_are_xy_c.get()
}

///|
/// ADDITION_FORMULA_POS
fn step_20() -> Unit raise {
  let t715 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t714 = @simp.asm_simp_tac(@list.List([sqrt_linear_eq(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) && !(a == 1) → 2 <= a"))]))
  let t712 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t710 = @equal.gsym(@calc_int.real_of_num_pow())
  let t711 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t710]))
  let t709 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t713 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t709), t711), t712), @tactics.all_tac])
  let t708 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x704 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s705 = @tactics.subst1_tac(x704)
      fn(x706 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s705(x706)
      }
    })(@equal.sym(x707))
  })
  let t703 = @simp.rewrite_tac(@list.List([@realax.real_of_num_mul(), @realax.real_of_num_add()]))
  let t701 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t699 = @equal.gsym(@calc_int.real_of_num_pow())
  let t700 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t699]))
  let t698 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t702 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t698), t700), t701), @tactics.all_tac])
  let t697 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x694 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s695 = @tactics.subst1_tac(x694)
    fn(x696 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s695(x696)
    }
  })
  let t692 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))
  let t693 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t692]))
  let t691 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real) * (s : Real)) * ((c : Real) + (d : Real) * s) == a * c + s * s * (b * d) + (a * d + b * c) * s"))]))
  let t690 = @tactics.disch_then(fn(x689 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x686 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s687 = @tactics.subst1_tac(x686)
      fn(x688 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s687(x688)
      }
    })(@equal.sym(x689))
  })
  let t685 = @tactics.disch_then(fn(x684 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x681 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s682 = @tactics.subst1_tac(x681)
      fn(x683 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s682(x683)
      }
    })(@equal.sym(x684))
  })
  let t680 = @simp.rewrite_tac(@list.List([@real.real_pow_add()]))
  let t679 = @simp.asm_rewrite_tac(@list.List([]))
  let t677 = @term_syntax.parse_term("(n : Num)")
  let t678 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t677]), xy_power_pos()))
  let t675 = @term_syntax.parse_term("(m : Num)")
  let t676 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t675]), xy_power_pos()))
  let t673 = @term_syntax.parse_term("(m : Num) + (n : Num)")
  let t674 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t673]), xy_power_pos()))
  let t671 = @simp.rewrite_tac(@list.List([@arith.add_ac()]))
  let t670 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @arith.mult_clauses()]))
  let t672 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([x_degenerate(), y_degenerate()])), t670), t671), @tactics.all_tac])
  let t669 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 1"))
  let t716 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t669), t672), t674), t676), t678), t679), t680), t685), t690), t691), t693), t697), t702), t703), t708), t713), t714), t715)
  addition_formula_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) → X(a, m + n) == X(a, m) * X(a, n) + (EXP(a, 2) - 1) * (Y(a, m) * Y(a, n)) && Y(a, m + n) == X(a, m) * Y(a, n) + X(a, n) * Y(a, m)"), t716))
}

///|
let addition_formula_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADDITION_FORMULA_POS")

///|
/// `ADDITION_FORMULA_POS`
pub fn addition_formula_pos() -> @kernel.Thm {
  addition_formula_pos_c.get()
}

///|
/// ADDITION_FORMULA_NEG
fn step_21() -> Unit raise {
  let t795 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t794 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t793 = @tactics.disch_then(@tactics.conjuncts_then(fn(x792 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x789 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s790 = @tactics.subst1_tac(x789)
      fn(x791 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s790(x791)
      }
    })(@equal.sym(x792))
  }))
  let t788 = @simp.asm_simp_tac(@list.List([sqrt_linear_eq(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) && !(a == 1) → 2 <= a"))]))
  let t786 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t784 = @equal.gsym(@calc_int.real_of_num_pow())
  let t785 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t784]))
  let t783 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t787 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t783), t785), t786), @tactics.all_tac])
  let t782 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x781 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s779 = @tactics.subst1_tac(x778)
      fn(x780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s779(x780)
      }
    })(@equal.sym(x781))
  })
  let t777 = @simp.rewrite_tac(@list.List([@realax.real_of_num_mul(), @realax.real_of_num_add()]))
  let t775 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t773 = @equal.gsym(@calc_int.real_of_num_pow())
  let t774 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t773]))
  let t772 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t776 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t772), t774), t775), @tactics.all_tac])
  let t771 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s769 = @tactics.subst1_tac(x768)
    fn(x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s769(x770)
    }
  })
  let t767 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real) * (s : Real) == (x1 : Real) - (x2 : Real) + ((y1 : Real) - (y2 : Real)) * s) == (a + x2 + (b + y2) * s == x1 + y1 * s)"))]))
  let t765 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))
  let t766 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t765]))
  let t764 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) * (s : Real)) * ((c : Real) + (d : Real) * s) == a * c - s * s * (b * d) + (a * d - b * c) * s"))]))
  let t763 = @tactics.disch_then(fn(x762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s760 = @tactics.subst1_tac(x759)
      fn(x761 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s760(x761)
      }
    })(@equal.sym(x762))
  })
  let t758 = @tactics.disch_then(fn(x757 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x754 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s755 = @tactics.subst1_tac(x754)
      fn(x756 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s755(x756)
      }
    })(@equal.sym(x757))
  })
  let t753 = @simp.asm_rewrite_tac(@list.List([]))
  let t751 = @term_syntax.parse_term("(n : Num)")
  let t752 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t751]), xy_power_pos()))
  let t749 = @term_syntax.parse_term("(m : Num)")
  let t750 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t749]), xy_power_neg()))
  let t748 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → m + (n - m) == n"))]))
  let t747 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_add())]))
  let t746 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t745 = @simp.rewrite_tac(@list.List([@real.real_pow_mul(), @real.real_pow_one(), @realax.real_mul_lid()]))
  let t744 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - (x - real_of_num(1)) == real_of_num(1)"))]))
  let t742 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))
  let t743 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_sub_le(), @real.real_pow_le_1(), @realax.real_of_num_le(), t742]))
  let t741 = @simp.gen_rewrite_tac(fn(x740 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x736 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x730 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s731 = @equal.land_conv(x730)
        fn(x732 : @kernel.Term) -> @kernel.Thm raise {
          s731(x732)
        }
      })((fn(x733 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s734 = @equal.land_conv(x733)
        fn(x735 : @kernel.Term) -> @kernel.Thm raise {
          s734(x735)
        }
      })(x736))
    })((fn(x737 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s738 = @equal.once_depth_conv(x737)
      fn(x739 : @kernel.Term) -> @kernel.Thm raise {
        s738(x739)
      }
    })(x740))
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (y : Real)) * (x + y) == x * x - y * y"))]))
  let t726 = @term_syntax.parse_term("op_star(pow((real_of_num((a : Num)) - sqrt(pow(real_of_num(a), 2) - real_of_num(1))) * (real_of_num(a) + sqrt(pow(real_of_num(a), 2) - real_of_num(1))), (m : Num)))")
  let t729 = @tactics.disch_then(fn(x728 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x723 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s724 = @tactics.mp_tac(x723)
      fn(x725 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s724(x725)
      }
    })(((x727 : @kernel.Thm) => @equal.ap_term(t726, x727))(x728))
  })
  let t722 = @simp.asm_rewrite_tac(@list.List([]))
  let t720 = @term_syntax.parse_term("(n : Num) - (m : Num)")
  let t721 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t720]), xy_power_pos()))
  let t718 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @arith.mult_clauses()]))
  let t719 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([x_degenerate(), y_degenerate()])), t718), @tactics.all_tac])
  let t717 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 1"))
  let t796 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t717), t719), t721), t722), t729), t741), t743), t744), t745), t746), t747), t748), t750), t752), t753), t758), t763), t764), t766), t767), t771), t776), t777), t782), t787), t788), t793), t794), t795)
  addition_formula_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) && m <= n → X(a, n - m) == X(a, m) * X(a, n) - (EXP(a, 2) - 1) * (Y(a, m) * Y(a, n)) && Y(a, n - m) == X(a, m) * Y(a, n) - X(a, n) * Y(a, m)"), t796))
}

///|
let addition_formula_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADDITION_FORMULA_NEG")

///|
/// `ADDITION_FORMULA_NEG`
pub fn addition_formula_neg() -> @kernel.Thm {
  addition_formula_neg_c.get()
}

///|
/// Y_INCREASES_SUC
fn step_22() -> Unit raise {
  let t808 = @meson.asm_meson_tac(@list.List([@arith.le_trans(), x_increases()]))
  let t807 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t806 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.le_refl()]))
  let t804 = @term_syntax.parse_term("(n : Num)")
  let t805 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t804)
  let t803 = @list.List([@simp.rewrite_tac(@list.List([x_clauses()])), @tactics.all_tac])
  let t802 = @tactics.exists_tac(@term_syntax.parse_term("X((a : Num), 0)"))
  let t801 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("∀ n : Num, n == 1 && n <= (m : Num) → !(m == 0)")))
  let t800 = @simp.asm_simp_tac(@list.List([@arith.le_mult_rcancel(), @int.arith_rule(@term_syntax.parse_term("(1 <= (a : Num)) == !(a == 0)"))]))
  let t799 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("1 * (y : Num) <= (ay : Num) && !((x : Num) == 0) → y < x * 1 + ay")))
  let t798 = @simp.rewrite_tac(@list.List([x_clauses(), y_clauses()]))
  let t797 = @simp.asm_simp_tac(@list.List([@arith.add1(), addition_formula_pos()]))
  let t809 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t797), t798), t799), t800), t801), t802), @tactics.conj_tac), t803), t805), @nums.induct_tac), t806), t807), t808)
  y_increases_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → Y(a, n) < Y(a, SUC(n))"), t809))
}

///|
let y_increases_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_INCREASES_SUC")

///|
/// `Y_INCREASES_SUC`
pub fn y_increases_suc() -> @kernel.Thm {
  y_increases_suc_c.get()
}

///|
/// Y_INCREASES_LT
fn step_23() -> Unit raise {
  let t831 = @meson.asm_meson_tac(@list.List([@arith.add1(), @arith.le_trans(), y_increases()]))
  let t830 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@arith.add_clauses()])))
  let t829 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.le_refl()]))
  let t827 = @term_syntax.parse_term("(d : Num)")
  let t828 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t827)
  let t826 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) + SUC((d : Num)) == SUC(m) + d"))]))
  let t825 = @simp.asm_simp_tac(@list.List([y_increases_suc()]))
  let t824 = @tactics.exists_tac(@term_syntax.parse_term("Y((a : Num), SUC((m : Num)))"))
  let t823 = @tactics.match_mp_tac(@arith.lte_trans())
  let t822 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t821 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t820 = @simp.gen_rewrite_tac(fn(x817 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s818 = @equal.land_conv(x817)
    fn(x819 : @kernel.Term) -> @kernel.Thm raise {
      s818(x819)
    }
  }, @list.List([@arith.lt_exists()]))
  let t816 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x810 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s811 = @tactics.assume_tac(x810)
    fn(x812 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s811(x812)
    }
  }, fn(x813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s814 = @tactics.mp_tac(x813)
    fn(x815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s814(x815)
    }
  }))
  let t832 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t816), t820), t821), t822), @tactics.disch_tac), t823), t824), t825), t826), t828), @nums.induct_tac), t829), t830), t831)
  y_increases_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) && m < n → Y(a, m) < Y(a, n)"), t832))
}

///|
let y_increases_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_INCREASES_LT")

///|
/// `Y_INCREASES_LT`
pub fn y_increases_lt() -> @kernel.Thm {
  y_increases_lt_c.get()
}

///|
/// Y_INCREASES_LE
fn step_24() -> Unit raise {
  let t833 = @meson.meson_tac(@list.List([@arith.le_refl(), y_increases_lt()]))
  let t834 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_lt()])), t833)
  y_increases_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) && m <= n → Y(a, m) <= Y(a, n)"), t834))
}

///|
let y_increases_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_INCREASES_LE")

///|
/// `Y_INCREASES_LE`
pub fn y_increases_le() -> @kernel.Thm {
  y_increases_le_c.get()
}

///|
/// Y_INJ
fn step_25() -> Unit raise {
  let t838 = @meson.meson_tac(@list.List([@arith.lt_cases(), @arith.lt_refl()]))
  let t837 = @simp.asm_rewrite_tac(@list.List([]))
  let t836 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(a : Num)"), y_increases_lt()))
  let t835 = @simp.simp_tac(@list.List([]))
  let t839 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t835), t836), t837), t838)
  y_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) → (Y(a, m) == Y(a, n)) == (m == n)"), t839))
}

///|
let y_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_INJ")

///|
/// `Y_INJ`
pub fn y_inj() -> @kernel.Thm {
  y_inj_c.get()
}

///|
/// X_INCREASES_LE
fn step_26() -> Unit raise {
  let t859 = @meson.asm_meson_tac(@list.List([@arith.le_trans(), x_increases()]))
  let t858 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t857 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.le_refl()]))
  let t855 = @term_syntax.parse_term("(d : Num)")
  let t856 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t855)
  let t854 = @tactics.disch_then(fn(x853 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t852 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t851 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t850 = @simp.gen_rewrite_tac(fn(x847 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s848 = @equal.land_conv(x847)
    fn(x849 : @kernel.Term) -> @kernel.Thm raise {
      s848(x849)
    }
  }, @list.List([@arith.le_exists()]))
  let t846 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s841 = @tactics.assume_tac(x840)
    fn(x842 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s841(x842)
    }
  }, fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s844 = @tactics.mp_tac(x843)
    fn(x845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s844(x845)
    }
  }))
  let t860 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t846), t850), t851), t852), t854), t856), @nums.induct_tac), t857), t858), t859)
  x_increases_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) && m <= n → X(a, m) <= X(a, n)"), t860))
}

///|
let x_increases_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_INCREASES_LE")

///|
/// `X_INCREASES_LE`
pub fn x_increases_le() -> @kernel.Thm {
  x_increases_le_c.get()
}

///|
/// X_INCREASES_LT
fn step_27() -> Unit raise {
  let t889 = @term_syntax.parse_term("!((a : Num) == 1)")
  let t890 = @tactics.map_every(fn(x886 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s887 = @tactics.undisch_tac(x886)
    fn(x888 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s887(x888)
    }
  }, @list.List([@term_syntax.parse_term("!((a : Num) == 0)"), t889]))
  let t885 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel(), @arith.add1()]))
  let t884 = @simp.gen_rewrite_tac(fn(x881 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s882 = @equal.land_conv(x881)
    fn(x883 : @kernel.Term) -> @kernel.Thm raise {
      s882(x883)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == 1 * a"))]))
  let t879 = @simp.asm_rewrite_tac(@list.List([]))
  let t878 = @tactics.exists_tac(@term_syntax.parse_term("X((a : Num), SUC((p : Num)))"))
  let t880 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.lte_trans()), t878), t879)])
  let t877 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) && (c : Num) < b → a < 2 * b - c")))
  let t876 = @simp.rewrite_tac(@list.List([x_clauses(), @arith.add1()]))
  let t875 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC(SUC((p : Num))) == p + 2"))]))
  let t874 = @simp.asm_simp_tac(@list.List([@calc_num.arith(), x_clauses(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) && !(a == 1) → 1 < a"))]))
  let t872 = @term_syntax.parse_term("(p : Num)")
  let t873 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num)"), t872)
  let t871 = @simp.asm_simp_tac(@list.List([x_increases_le()]))
  let t870 = @tactics.exists_tac(@term_syntax.parse_term("X((a : Num), SUC((m : Num)))"))
  let t869 = @tactics.match_mp_tac(@arith.lte_trans())
  let t868 = @simp.gen_rewrite_tac(fn(x867 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x861 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s862 = @equal.land_conv(x861)
      fn(x863 : @kernel.Term) -> @kernel.Thm raise {
        s862(x863)
      }
    })((fn(x864 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s865 = @equal.once_depth_conv(x864)
      fn(x866 : @kernel.Term) -> @kernel.Thm raise {
        s865(x866)
      }
    })(x867))
  }, @list.List([@equal.gsym(@arith.le_suc_lt())]))
  let t891 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t868), @tactics.strip_tac), t869), t870), t871), t873), @nums.induct_tac), t874), t875), t876), t877), @tactics.conj_tac), t880), t884), t885), @tactics.disj1_tac), t890), @int.arith_tac)
  x_increases_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) && !(a == 1) && m < n → X(a, m) < X(a, n)"), t891))
}

///|
let x_increases_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_INCREASES_LT")

///|
/// `X_INCREASES_LT`
pub fn x_increases_lt() -> @kernel.Thm {
  x_increases_lt_c.get()
}

///|
/// X_INCREASES_SUC
fn step_28() -> Unit raise {
  let t892 = @simp.simp_tac(@list.List([x_increases_lt(), @arith.lt()]))
  x_increases_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) && !(a == 1) → X(a, n) < X(a, SUC(n))"), t892))
}

///|
let x_increases_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_INCREASES_SUC")

///|
/// `X_INCREASES_SUC`
pub fn x_increases_suc() -> @kernel.Thm {
  x_increases_suc_c.get()
}

///|
/// X_INJ
fn step_29() -> Unit raise {
  let t896 = @meson.meson_tac(@list.List([@arith.lt_cases(), @arith.lt_refl()]))
  let t895 = @simp.asm_rewrite_tac(@list.List([]))
  let t894 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(a : Num)"), x_increases_lt()))
  let t893 = @simp.simp_tac(@list.List([]))
  let t897 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t893), t894), t895), t896)
  x_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) && !(a == 1) → (X(a, m) == X(a, n)) == (m == n)"), t897))
}

///|
let x_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_INJ")

///|
/// `X_INJ`
pub fn x_inj() -> @kernel.Thm {
  x_inj_c.get()
}

///|
/// XY_COPRIME
fn step_30() -> Unit raise {
  let t930 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.left_sub_distrib()), @arith.mult_eq_1()]))
  let t927 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) == (b : Num) + 1 → a - b == 1")))
  let t929 = @tactics.disch_then(fn(x928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x924 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s925 = @tactics.mp_tac(x924)
      fn(x926 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s925(x926)
      }
    })(t927(x928))
  })
  let t922 = @term_syntax.parse_term("(a : Num) * ((d : Num) * ((x : Num) * (d * x))) == d * (d * (a * (x * x)))")
  let t923 = @simp.gen_rewrite_tac(fn(x921 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    ((x917 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x914 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s915 = @equal.rand_conv(x914)
      fn(x916 : @kernel.Term) -> @kernel.Thm raise {
        s915(x916)
      }
    }, x917))((fn(x918 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s919 = @equal.land_conv(x918)
      fn(x920 : @kernel.Term) -> @kernel.Thm raise {
        s919(x920)
      }
    })(x921))
  }, @list.List([@theorems.ac(@arith.mult_ac())(t922)]))
  let t913 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t912 = @simp.asm_rewrite_tac(@list.List([@arith.exp_2()]))
  let t911 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t910 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t909 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t908 = @simp.rewrite_tac(@list.List([@int.coprime(), @class.not_forall_thm(), @theorems.left_imp_exists_thm()]))
  let t907 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))]))
  let t904 = @drule.match_mp(xy_are_solutions())
  let t901 = @term_syntax.parse_term("(n : Num)")
  let t906 = @tactics.disch_then(fn(x905 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x903 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s899 = @tactics.mp_tac(x898)
        fn(x900 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s899(x900)
        }
      })(((x902 : @kernel.Thm) => @bool.spec(t901, x902))(x903))
    })(t904(x905))
  })
  let t931 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t906), t907), t908), t909), t910), t911), @tactics.strip_tac), t912), t913), t923), t929), t930)
  xy_coprime_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → coprime((X(a, n), Y(a, n)))"), t931))
}

///|
let xy_coprime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XY_COPRIME")

///|
/// `XY_COPRIME`
pub fn xy_coprime() -> @kernel.Thm {
  xy_coprime_c.get()
}

///|
/// Y_DIVIDES_LEMMA
fn step_31() -> Unit raise {
  let t941 = @simp.rewrite_tac(@list.List([@arith.mult_ac(), @arith.add_ac()]))
  let t940 = @simp.rewrite_tac(@list.List([@arith.left_add_distrib()]))
  let t939 = @tactics.exists_tac(@term_syntax.parse_term("X((a : Num), (n : Num)) * (d : Num) + X(a, n * (k : Num))"))
  let t938 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t937 = @simp.simp_tac(@list.List([@int.divides(), @theorems.left_imp_exists_thm()]))
  let t936 = @tactics.undisch_tac(@term_syntax.parse_term("divides(Y((a : Num), (n : Num)), Y(a, n * (k : Num)))"))
  let t935 = @simp.asm_simp_tac(@list.List([addition_formula_pos()]))
  let t934 = @simp.rewrite_tac(@list.List([y_clauses(), @prime.divides_0()]))
  let t933 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t932 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t942 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), @tactics.gen_tac), @tactics.disch_tac), t932), @tactics.gen_tac), @nums.induct_tac), t933), t934), t935), t936), t937), t938), @tactics.disch_tac), t939), t940), t941)
  y_divides_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ k : Num, ∀ n : Num, !(a == 0) → divides(Y(a, n), Y(a, n * k))"), t942))
}

///|
let y_divides_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_DIVIDES_LEMMA")

///|
/// `Y_DIVIDES_LEMMA`
pub fn y_divides_lemma() -> @kernel.Thm {
  y_divides_lemma_c.get()
}

///|
/// Y_DIVIDES
fn step_32() -> Unit raise {
  let t1005 = @simp.asm_simp_tac(@list.List([y_inj()]))
  let t1004 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(y_clauses()))]))
  let t1003 = @simp.asm_simp_tac(@list.List([@class.de_morgan_thm(), @arith.not_le(), y_increases_lt()]))
  let t1000 = @drule.match_mp(@int.divides_le())
  let t1002 = @tactics.disch_then(fn(x1001 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s998 = @tactics.mp_tac(x997)
      fn(x999 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s998(x999)
      }
    })(t1000(x1001))
  })
  let t995 = @meson.asm_meson_tac(@list.List([@prime.divides_trans(), y_divides_lemma()]))
  let t994 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t993 = @simp.asm_rewrite_tac(@list.List([]))
  let t992 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t991 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t990 = @simp.rewrite_tac(@list.List([@int.coprime(), @class.not_forall_thm(), @class.not_imp()]))
  let t989 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))]))
  let t988 = @simp.asm_rewrite_tac(@list.List([]))
  let t987 = @term_syntax.parse_term("(q : Num) * (m : Num)")
  let t996 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t987]), xy_coprime())), t988), t989), t990), t991), t992), @tactics.strip_tac), t993), t994), t995), @tactics.all_tac])
  let t986 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t983 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@prime.coprime_divprod()))
  let t985 = @tactics.disch_then(fn(x984 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s981 = @tactics.mp_tac(x980)
      fn(x982 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s981(x982)
      }
    })(t983(x984))
  })
  let t978 = @simp.asm_simp_tac(@list.List([@prime.divides_lmul(), y_divides_lemma()]))
  let t977 = @simp.gen_rewrite_tac((x976 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(3, fn(x973 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s974 = @equal.rand_conv(x973)
    fn(x975 : @kernel.Term) -> @kernel.Thm raise {
      s974(x975)
    }
  }, x976), @list.List([@arith.mult_sym()]))
  let t972 = @simp.asm_rewrite_tac(@list.List([]))
  let t971 = @tactics.exists_tac(@term_syntax.parse_term("X((a : Num), (r : Num)) * Y(a, (q : Num) * (m : Num))"))
  let t970 = @tactics.match_mp_tac(@prime.divides_add_revl())
  let t979 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)"))])), @tactics.disch_tac), t970), t971), t972), t977), t978)])
  let t969 = @tactics.subgoal_then(@term_syntax.parse_term("!divides(Y((a : Num), (m : Num)), X(a, (q : Num) * m) * Y(a, (r : Num)))"), fn(x966 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s967 = @tactics.mp_tac(x966)
    fn(x968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s967(x968)
    }
  })
  let t965 = @simp.asm_simp_tac(@list.List([addition_formula_pos()]))
  let t964 = @simp.asm_simp_tac(@list.List([@arith.add_clauses(), @prime.divides_lmul(), @prime.divides_refl()]))
  let t963 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == 0"))
  let t962 = @simp.asm_rewrite_tac(@list.List([]))
  let t961 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Num) == MOD((n : Num), (m : Num))"))
  let t960 = @simp.abbrev_tac(@term_syntax.parse_term("(q : Num) == DIV((n : Num), (m : Num))"))
  let t959 = @simp.asm_rewrite_tac(@list.List([]))
  let t957 = @term_syntax.parse_term("(m : Num)")
  let t958 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t957]), @arith.division()))
  let t955 = @simp.asm_simp_tac(@list.List([y_increases_le(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t954 = @list.List([@simp.rewrite_tac(@list.List([y_clauses()])), @tactics.all_tac])
  let t953 = @tactics.exists_tac(@term_syntax.parse_term("Y((a : Num), 1)"))
  let t952 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("∀ n : Num, n == 1 && n <= (m : Num) → !(m == 0)")))
  let t956 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([y_clauses(), @prime.divides_zero()])), t952), t953), @tactics.conj_tac), t954), t955), @tactics.all_tac])
  let t951 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t950 = @simp.asm_rewrite_tac(@list.List([@prime.divides_0()]))
  let t949 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t948 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))]))
  let t946 = @simp.asm_simp_tac(@list.List([@theorems.left_imp_exists_thm(), y_divides_lemma()]))
  let t947 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.gen_rewrite_tac(fn(x943 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s944 = @equal.land_conv(x943)
    fn(x945 : @kernel.Term) -> @kernel.Thm raise {
      s944(x945)
    }
  }, @list.List([@int.divides()])), t946)])
  let t1006 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t947), t948), t949), t950), t951), t956), t958), t959), t960), t961), @tactics.strip_tac), t962), t963), t964), @tactics.disch_tac), t965), t969), t979), t985), t986), @tactics.conj_tac), t996), t1002), t1003), t1004), t1005)
  y_divides_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) → divides(Y(a, m), Y(a, n)) == divides(m, n)"), t1006))
}

///|
let y_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_DIVIDES")

///|
/// `Y_DIVIDES`
pub fn y_divides() -> @kernel.Thm {
  y_divides_c.get()
}

///|
/// BINOMIAL_TRIVIALITY
fn step_33() -> Unit raise {
  let t1084 = @simp.rewrite_tac(@list.List([@calc_int.real_add_ac()]))
  let t1083 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t1082 = @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib(), @real.real_add_rdistrib()]))
  let t1079 = @equal.gsym(@calc_int.real_of_num_pow())
  let t1080 = @equal.gsym(@realax.real_of_num_add())
  let t1081 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul()), t1080, t1079]))
  let t1078 = @tactics.exists_tac(@term_syntax.parse_term("DIV(((n : Num) + 1) * (n + 2), 2) * ((d : Num) * EXP((x : Num), n)) + ((p : Num) * (y : Num) + (q : Num) * x)"))
  let t1077 = @simp.rewrite_tac(@list.List([@calc_num.arith_suc()]))
  let t1076 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num) * (x : Num) + (q : Num) * ((y : Num) * (d : Num))"))
  let t1075 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@realax.real_pow()))]))
  let t1074 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) * ((s : Real) * ((nn : Real) * ((xn : Real) * ((y2 : Real) * (d : Real))))) == nn * (d * (xn * (y * y2 * s)))"))]))
  let t1073 = @simp.simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_pos()]))
  let t1072 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(q : Real) * ((y3 : Real) * ((s : Real) * ((y : Real) * s))) == q * (y * (y3 * (s * s)))"))]))
  let t1071 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t1070 = @simp.rewrite_tac(@list.List([@analysis.real_eq_ladd()]))
  let t1068 = @simp.simp_tac(@list.List([@arith.div_mult(), @calc_num.arith_eq()]))
  let t1067 = @simp.simp_tac(@list.List([@arith.even_exists(), @theorems.left_imp_exists_thm()]))
  let t1065 = @tactics.conv_tac(fn(x1064 : @kernel.Term) -> @kernel.Thm raise {
    @bool.eqt_intro(@class.taut(x1064))
  })
  let t1066 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.even_mult(), @arith.even_add(), @calc_num.arith_even()])), t1065), @tactics.all_tac])
  let t1063 = @tactics.subgoal_then(@term_syntax.parse_term("EVEN(((n : Num) + 1) * (n + 2))"), fn(x1060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1061 = @tactics.mp_tac(x1060)
    fn(x1062 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1061(x1062)
    }
  })
  let t1059 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) * n + (3 * n + 2) == (n + 1) * (n + 2)"))]))
  let t1058 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((x : Num) + (5 * (n : Num) + 6) == ((y : Num) + (n + 2)) * 2) == (x + (3 * n + 2) == 2 * y)"))]))
  let t1057 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) + 2) * (n + 3) == n * n + (5 * n + 6)"))]))
  let t1056 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @arith.add_clauses()]))
  let t1055 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1054 = @tactics.match_mp_tac(@arith.div_uniq())
  let t1053 = @tactics.conv_tac(@equal.sym_conv)
  let t1069 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_eq()])), t1053), t1054), t1055), t1056), t1057), t1058), t1059), t1063), t1066), t1067), t1068), @tactics.all_tac])
  let t1052 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(DIV(((n : Num) + 1) * (n + 2), 2)) + real_of_num(n + 2) == real_of_num(DIV((n + 2) * (n + 3), 2))"), fn(x1049 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1050 = @tactics.subst1_tac(x1049)
    fn(x1051 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1050(x1051)
    }
  })
  let t1048 = @simp.rewrite_tac(@list.List([@arith.add1(), @realax.real_mul_assoc(), @equal.gsym(@real.real_add_rdistrib())]))
  let t1047 = @simp.simp_tac(@list.List([@real.sqrt_pow_2(), @analysis.real_pos()]))
  let t1045 = @equal.gsym(@bool.conjunct2(@realax.real_pow()))
  let t1046 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), t1045]))
  let t1044 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * ((n12 : Real) * ((xn : Real) * ((y2 : Real) * (d : Real)))) + ((y : Real) * ((s : Real) * ((n2 : Real) * ((xn1 : Real) * (y * s)))) + (a : Real)) == n12 * (x * xn * (y2 * d)) + n2 * (xn1 * (y * y * (s * s))) + a"))]))
  let t1042 = @equal.gsym(@realax.real_mul_assoc())
  let t1043 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_add_assoc()), t1042, @analysis.real_eq_ladd()]))
  let t1041 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 + 1 == n + 3"))]))
  let t1040 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num((n : Num)) * (x : Real) + x == (real_of_num(n) + real_of_num(1)) * x"))]))
  let t1039 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1038 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) + (m : Num) == n + SUC(m)"))]))
  let t1037 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((n : Num) + (m : Num)) == n + SUC(m)"))]))
  let t1036 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@realax.real_pow()))]))
  let t1035 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * ((n2 : Real) * ((xn1 : Real) * ((y : Real) * (d : Real)))) + y * d * (xn2 : Real) == (n2 * (x * xn1) + xn2) * (y * d)"))]))
  let t1034 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + (y : Real)) * ((xn : Real) + ((xn1 : Real) + ((xn2 : Real) + ((p : Real) + (q : Real))))) == x * xn + (x * xn1 + y * xn + (x * xn2 + y * xn1 + (y * xn2 + (p * x + q * y) + (p * y + q * x))))"))]))
  let t1032 = @tactics.x_choose_then(@term_syntax.parse_term("(q : Num)"))(fn(x1029 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1030 = @tactics.subst1_tac(x1029)
    fn(x1031 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1030(x1031)
    }
  })
  let t1033 = @tactics.first_assum(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(t1032))
  let t1028 = @simp.gen_rewrite_tac(fn(x1027 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1023 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      ((x1019 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x1016 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1017 = @equal.binder_conv(x1016)
        fn(x1018 : @kernel.Term) -> @kernel.Thm raise {
          s1017(x1018)
        }
      }, x1019))((fn(x1020 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1021 = @equal.land_conv(x1020)
        fn(x1022 : @kernel.Term) -> @kernel.Thm raise {
          s1021(x1022)
        }
      })(x1023))
    })((fn(x1024 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1025 = @equal.top_depth_conv(x1024)
      fn(x1026 : @kernel.Term) -> @kernel.Thm raise {
        s1025(x1026)
      }
    })(x1027))
  }, @list.List([@arith.add_clauses(), @realax.real_pow()]))
  let t1014 = @simp.simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @real.sqrt_pow_2(), @analysis.real_pos()]))
  let t1012 = @term_syntax.parse_term("(a : Real) * (b : Real) * (a * b) == a * a * (b * b)")
  let t1013 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t1012)]))
  let t1011 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + (y : Real)) * (x + y) == x * x + (real_of_num(2) * (x * y) + y * y)"))]))
  let t1010 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t1009 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t1008 = @simp.rewrite_tac(@list.List([@real.real_pow_1(), @realax.real_pow(), @analysis.real_mul_lzero(), @calc_int.real_add_rid()]))
  let t1007 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1015 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.exists_tac(@term_syntax.parse_term("0"))), t1007), t1008), t1009), t1010), t1011), @tactics.ap_term_tac), @tactics.ap_term_tac), t1013), t1014), @tactics.all_tac])
  let t1085 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @nums.induct_tac), t1015), t1028), t1033), t1034), t1035), t1036), t1037), t1038), t1039), t1040), t1041), t1043), t1044), t1046), t1047), t1048), t1052), t1069), t1070), t1071), t1072), t1073), t1074), t1075), t1076), t1077), t1078), t1081), t1082), t1083), t1084)
  binomial_triviality_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ d : Num, ∀ n : Num, ∃ p : Num, ∃ q : Num, pow(real_of_num(x) + real_of_num(y) * sqrt(real_of_num(d)), n + 2) == pow(real_of_num(x), n + 2) + (real_of_num(n + 2) * (pow(real_of_num(x), n + 1) * (real_of_num(y) * sqrt(real_of_num(d)))) + (real_of_num(DIV((n + 1) * (n + 2), 2)) * (pow(real_of_num(x), n) * (pow(real_of_num(y), 2) * real_of_num(d))) + (real_of_num(p) * pow(real_of_num(y), 3) + real_of_num(q) * (pow(real_of_num(y), 3) * sqrt(real_of_num(d))))))"), t1085))
}

///|
let binomial_triviality_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOMIAL_TRIVIALITY")

///|
/// `BINOMIAL_TRIVIALITY`
pub fn binomial_triviality() -> @kernel.Thm {
  binomial_triviality_c.get()
}

///|
/// Y_LOWERBOUND
fn step_34() -> Unit raise {
  let t1095 = @simp.asm_simp_tac(@list.List([y_increases()]))
  let t1094 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → (c : Num) - b <= c - a")))
  let t1093 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib(), @arith.mult_clauses(), @equal.gsym(@arith.mult_assoc())]))
  let t1092 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1091 = @tactics.exists_tac(@term_syntax.parse_term("(2 * (a : Num) - 1) * Y(a, (n : Num) + 1)"))
  let t1090 = @tactics.match_mp_tac(@arith.le_trans())
  let t1089 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) + 1 == n + 2")), y_clauses()]))
  let t1088 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith(), @arith.mult_clauses(), @arith.le_0()]))
  let t1087 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))
  let t1086 = @simp.rewrite_tac(@list.List([@arith.exp(), @calc_num.arith(), y_clauses()]))
  let t1096 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t1086), t1087), t1088), t1089), t1090), t1091), t1092), t1093), t1094), t1095)
  y_lowerbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, EXP(2 * a - 1, n) <= Y(a, n + 1)"), t1096))
}

///|
let y_lowerbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_LOWERBOUND")

///|
/// `Y_LOWERBOUND`
pub fn y_lowerbound() -> @kernel.Thm {
  y_lowerbound_c.get()
}

///|
/// Y_UPPERBOUND
fn step_35() -> Unit raise {
  let t1100 = @simp.asm_rewrite_tac(@list.List([@arith.mult_assoc(), @arith.le_mult_lcancel()]))
  let t1099 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → a - (c : Num) <= b")))
  let t1098 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((n : Num) + 1) == n + 2")), y_clauses()]))
  let t1097 = @simp.rewrite_tac(@list.List([@arith.exp(), @arith.add_clauses(), y_clauses(), @arith.le_refl()]))
  let t1101 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t1097), t1098), t1099), t1100)
  y_upperbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, Y(a, n + 1) <= EXP(2 * a, n)"), t1101))
}

///|
let y_upperbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_UPPERBOUND")

///|
/// `Y_UPPERBOUND`
pub fn y_upperbound() -> @kernel.Thm {
  y_upperbound_c.get()
}

///|
/// XY_Y3_CONGRUENCE
fn step_36() -> Unit raise {
  let t1192 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t1191 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num)"))
  let t1190 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(d : Num) + 2 - 1 == d + 1"))]))
  let t1189 = @tactics.disch_then(fn(x1188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1187 = @simp.asm_simp_tac(@list.List([sqrt_linear_eq(), @int.arith_rule(@term_syntax.parse_term("!((p : Num) == 0) && !(p == 1) → 2 <= p"))]))
  let t1185 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t1183 = @equal.gsym(@calc_int.real_of_num_pow())
  let t1184 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t1183]))
  let t1182 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t1186 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t1182), t1184), t1185), @tactics.all_tac])
  let t1181 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x1180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1178 = @tactics.subst1_tac(x1177)
      fn(x1179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1178(x1179)
      }
    })(@equal.sym(x1180))
  })
  let t1176 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_mul(), @realax.real_of_num_add()]))
  let t1174 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t1172 = @equal.gsym(@calc_int.real_of_num_pow())
  let t1173 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t1172]))
  let t1171 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t1175 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t1171), t1173), t1174), @tactics.all_tac])
  let t1170 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x1167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1168 = @tactics.subst1_tac(x1167)
    fn(x1169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1168(x1169)
    }
  })
  let t1166 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc(), @equal.gsym(@real.real_add_rdistrib())]))
  let t1165 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x1 : Real) + ((y1 : Real) + ((x2 : Real) + ((x3 : Real) + (y2 : Real)))) == x1 + (x2 + x3) + (y1 + y2)"))]))
  let t1163 = @tactics.x_choose_then(@term_syntax.parse_term("(q : Num)"))(fn(x1160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1161 = @tactics.subst1_tac(x1160)
    fn(x1162 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1161(x1162)
    }
  })
  let t1164 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(t1163))
  let t1158 = @simp.asm_simp_tac(@list.List([@real.real_pow_le_1(), @realax.real_of_num_le(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 1 <= a"))]))
  let t1156 = @equal.gsym(@calc_int.real_of_num_pow())
  let t1157 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le()), t1156]))
  let t1155 = @tactics.match_mp_tac(@real.real_of_num_sub())
  let t1159 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow()])), t1155), t1157), t1158), @tactics.all_tac])
  let t1154 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num((a : Num)), 2) - real_of_num(1) == real_of_num(EXP(a, 2) - 1)"), fn(x1153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1151 = @tactics.subst1_tac(x1150)
      fn(x1152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1151(x1152)
      }
    })(@equal.sym(x1153))
  })
  let t1146 = @term_syntax.parse_term("(d : Num)")
  let t1147 = @term_syntax.parse_term("EXP((a : Num), 2) - 1")
  let t1148 = @term_syntax.parse_term("Y((a : Num), (n : Num))")
  let t1149 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("X((a : Num), (n : Num))"), t1148, t1147, t1146]), binomial_triviality()))
  let t1143 = @simp.once_rewrite_rule(@list.List([@arith.add_sym()]))
  let t1145 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x1144 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1140 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1141 = @tactics.subst1_tac(x1140)
      fn(x1142 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1141(x1142)
      }
    })(t1143(x1144))
  }))
  let t1139 = @simp.gen_rewrite_tac(fn(x1136 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1137 = @equal.land_conv(x1136)
    fn(x1138 : @kernel.Term) -> @kernel.Thm raise {
      s1137(x1138)
    }
  }, @list.List([@arith.le_exists()]))
  let t1134 = @term_syntax.parse_term("!((k : Num) == 1)")
  let t1135 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x1131 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1132 = @tactics.undisch_tac(x1131)
    fn(x1133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1132(x1133)
    }
  }, @list.List([@term_syntax.parse_term("!((k : Num) == 0)"), t1134])), @int.arith_tac), @tactics.all_tac])
  let t1130 = @tactics.subgoal_then(@term_syntax.parse_term("2 <= (k : Num)"), fn(x1127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1128 = @tactics.mp_tac(x1127)
    fn(x1129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1128(x1129)
    }
  })
  let t1126 = @tactics.disch_then(fn(x1125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1123 = @tactics.subst1_tac(x1122)
      fn(x1124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1123(x1124)
      }
    })(@equal.sym(x1125))
  })
  let t1121 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_pow())]))
  let t1120 = @simp.asm_rewrite_tac(@list.List([]))
  let t1118 = @term_syntax.parse_term("(n : Num)")
  let t1119 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1118]), xy_power_pos()))
  let t1117 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_pow())]))
  let t1116 = @simp.asm_rewrite_tac(@list.List([]))
  let t1114 = @term_syntax.parse_term("(n : Num) * (k : Num)")
  let t1115 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1114]), xy_power_pos()))
  let t1112 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1111 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1113 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.sub_refl(), @arith.exp()])), t1111), t1112), @tactics.all_tac])
  let t1110 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 1"))
  let t1108 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t1107 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses()]))
  let t1106 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1109 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([x_degenerate(), y_degenerate(), @arith.exp_one()])), t1106), t1107), t1108), @tactics.all_tac])
  let t1105 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 1"))
  let t1103 = @simp.asm_rewrite_tac(@list.List([y_clauses(), @arith.mult_clauses(), @arith.add_clauses(), @arith.sub_0()]))
  let t1104 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1103), @tactics.all_tac])
  let t1102 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t1193 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1102), t1104), t1105), t1109), t1110), t1113), t1115), t1116), t1117), t1119), t1120), t1121), t1126), t1130), t1135), t1139), t1145), t1149), t1154), t1159), t1164), t1165), t1166), t1170), t1175), t1176), t1181), t1186), t1187), t1189), t1190), t1191), t1192)
  xy_y3_congruence_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ k : Num, !(a == 0) → (∃ q : Num, Y(a, n * k) == k * (EXP(X(a, n), k - 1) * Y(a, n)) + q * EXP(Y(a, n), 3))"), t1193))
}

///|
let xy_y3_congruence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XY_Y3_CONGRUENCE")

///|
/// `XY_Y3_CONGRUENCE`
pub fn xy_y3_congruence() -> @kernel.Thm {
  xy_y3_congruence_c.get()
}

///|
/// Y2_DIVIDES
fn step_37() -> Unit raise {
  let t1269 = @simp.asm_simp_tac(@list.List([xy_coprime()]))
  let t1268 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t1267 = @tactics.match_mp_tac(@prime.coprime_exp())
  let t1266 = @simp.asm_rewrite_tac(@list.List([]))
  let t1265 = @simp.once_rewrite_tac(@list.List([@arith.mult_sym()]))
  let t1264 = @tactics.exists_tac(@term_syntax.parse_term("EXP(X((a : Num), (m : Num)), (k : Num) - 1)"))
  let t1263 = @tactics.match_mp_tac(@prime.coprime_divprod())
  let t1262 = @simp.simp_tac(@list.List([@prime.divides_rmul()]))
  let t1261 = @simp.asm_simp_tac(@list.List([@prime.divides_lmul2_eq()]))
  let t1260 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @equal.gsym(@arith.mult_assoc())]))
  let t1259 = @simp.gen_rewrite_tac(fn(x1258 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1252 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1253 = @equal.land_conv(x1252)
      fn(x1254 : @kernel.Term) -> @kernel.Thm raise {
        s1253(x1254)
      }
    })((fn(x1255 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1256 = @equal.rand_conv(x1255)
      fn(x1257 : @kernel.Term) -> @kernel.Thm raise {
        s1256(x1257)
      }
    })(x1258))
  }, @list.List([@arith.mult_sym()]))
  let t1251 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t1249 = @meson.meson_tac(@list.List([@prime.divides_add(), @prime.divides_add_revl(), @prime.divides_lmul(), @prime.divides_refl()]))
  let t1250 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("3")), @arith.exp()])), t1249), @tactics.all_tac])
  let t1248 = @tactics.exists_tac(@term_syntax.parse_term("divides(EXP(Y((a : Num), (m : Num)), 2), (k : Num) * (EXP(X(a, m), k - 1) * Y(a, m)))"))
  let t1247 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1246 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Num)"))(fn(x1243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1244 = @tactics.subst1_tac(x1243)
    fn(x1245 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1244(x1245)
    }
  }))
  let t1242 = @simp.asm_rewrite_tac(@list.List([]))
  let t1239 = @term_syntax.parse_term("(k : Num)")
  let t1240 = @term_syntax.parse_term("(m : Num)")
  let t1241 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1240, t1239]), xy_y3_congruence()))
  let t1238 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(fn(x1235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1236 = @tactics.subst1_tac(x1235)
    fn(x1237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1236(x1237)
    }
  }))
  let t1234 = @simp.gen_rewrite_tac(fn(x1231 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1232 = @equal.land_conv(x1231)
    fn(x1233 : @kernel.Term) -> @kernel.Thm raise {
      s1232(x1233)
    }
  }, @list.List([@int.divides()]))
  let t1228 = @meson.meson_tac(@list.List([]))
  let t1229 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.divides(), @equal.gsym(@arith.mult_assoc())])), t1228)
  let t1227 = @meson.meson_tac(@list.List([]))
  let t1226 = @simp.rewrite_tac(@list.List([@int.divides(), @arith.exp_2(), @equal.gsym(@arith.mult_assoc())]))
  let t1225 = @tactics.undisch_tac(@term_syntax.parse_term("divides(EXP(Y((a : Num), (m : Num)), 2), Y(a, (n : Num)))"))
  let t1224 = @list.List([@tactics.all_tac, @simp.asm_simp_tac(@list.List([y_divides()]))])
  let t1230 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("divides(Y((a : Num), (m : Num)), Y(a, (n : Num)))"), fn(x1221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1222 = @tactics.mp_tac(x1221)
    fn(x1223 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1222(x1223)
    }
  })), t1224), t1225), t1226), t1227), t1229, @tactics.all_tac])
  let t1220 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1219 = @tactics.exists_tac(@term_syntax.parse_term("divides((m : Num), (n : Num))"))
  let t1218 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("∀ c : Bool, ((a : Bool) → c) && ((b : Bool) → c) && (c → a == b) → a == b")))
  let t1216 = @simp.asm_simp_tac(@list.List([y_inj()]))
  let t1217 = @list.List([@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1215 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1209 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1210 = @equal.rand_conv(x1209)
      fn(x1211 : @kernel.Term) -> @kernel.Thm raise {
        s1210(x1211)
      }
    })((fn(x1212 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1213 = @equal.rand_conv(x1212)
      fn(x1214 : @kernel.Term) -> @kernel.Thm raise {
        s1213(x1214)
      }
    })(x1215))
  }, @list.List([@equal.gsym(@bool.conjunct1(y_clauses()))])), t1216), @tactics.all_tac])
  let t1208 = @tactics.subgoal_then(@term_syntax.parse_term("!(Y((a : Num), (m : Num)) == 0)"), fn(x1205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1206 = @tactics.assume_tac(x1205)
    fn(x1207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1206(x1207)
    }
  })
  let t1203 = @simp.asm_simp_tac(@list.List([y_inj()]))
  let t1202 = @simp.gen_rewrite_tac(fn(x1201 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1195 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1196 = @equal.land_conv(x1195)
      fn(x1197 : @kernel.Term) -> @kernel.Thm raise {
        s1196(x1197)
      }
    })((fn(x1198 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1199 = @equal.rand_conv(x1198)
      fn(x1200 : @kernel.Term) -> @kernel.Thm raise {
        s1199(x1200)
      }
    })(x1201))
  }, @list.List([@equal.gsym(@bool.conjunct1(y_clauses()))]))
  let t1204 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([y_clauses(), @arith.mult_clauses(), @prime.divides_zero(), @arith.exp_2()])), t1202), t1203), @tactics.all_tac])
  let t1194 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1270 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1194), t1204), t1208), t1217), t1218), t1219), t1220), t1230), t1234), t1238), t1241), t1242), t1246), t1247), t1248), @tactics.conj_tac), t1250), t1251), t1259), t1260), t1261), @tactics.eq_tac), t1262), @tactics.disch_tac), t1263), t1264), t1265), t1266), t1267), t1268), t1269)
  y2_divides_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) → divides(EXP(Y(a, m), 2), Y(a, n)) == divides(m * Y(a, m), n)"), t1270))
}

///|
let y2_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y2_DIVIDES")

///|
/// `Y2_DIVIDES`
pub fn y2_divides() -> @kernel.Thm {
  y2_divides_c.get()
}

///|
/// Y_N_MOD2
fn step_38() -> Unit raise {
  let t1317 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1316 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((a : Num)) - 1 == a"))]))
  let t1315 = @simp.rewrite_tac(@list.List([@nums.not_suc()]))
  let t1313 = @term_syntax.parse_term("(a : Num)")
  let t1314 = @tactics.spec_tac(@term_syntax.parse_term("(a : Num)"), t1313)
  let t1318 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)")), t1314), @nums.induct_tac), t1315), t1316), t1317), @int.arith_tac)
  let t1312 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t1311 = @simp.asm_rewrite_tac(@list.List([]))
  let t1310 = @tactics.match_mp_tac(@arith.le_mult2())
  let t1309 = @simp.gen_rewrite_tac(fn(x1306 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1307 = @equal.land_conv(x1306)
    fn(x1308 : @kernel.Term) -> @kernel.Thm raise {
      s1307(x1308)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == 1 * n"))]))
  let t1319 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.mult_assoc()])), t1309), t1310), t1311), t1312), @int.arith_tac)
  let t1305 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t1303 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()])), @tactics.disj1_tac)
  let t1302 = @simp.asm_rewrite_tac(@list.List([]))
  let t1304 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@arith.le_mult2()), t1302), t1303])
  let t1301 = @simp.gen_rewrite_tac(fn(x1298 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1299 = @equal.land_conv(x1298)
    fn(x1300 : @kernel.Term) -> @kernel.Thm raise {
      s1299(x1300)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == 1 * n"))]))
  let t1297 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t1296 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (u : Num) && (y : Num) <= (v : Num) → 2 * x + y <= 2 * u + (v + (w : Num))")))
  let t1320 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.left_add_distrib()])), t1296), t1297), @tactics.conj_tac), t1301), t1304), t1305), @int.arith_tac), t1319, t1318])
  let t1295 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1294 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(v : Num) <= (u : Num) && (y : Num) <= (x : Num) && 2 * (x + (z : Num)) + ((w : Num) + v) == 2 * y + u → u - v == 2 * (x - y + z) + w")))
  let t1293 = @tactics.exists_tac(@term_syntax.parse_term("2 * ((a : Num) * (q2 : Num)) - (q1 : Num) + (a - 1) * ((n : Num) + 1)"))
  let t1292 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(2 * (q1 : Num) + (n : Num) <= 2 * (q2 : Num) + (n + 1)) == (q1 <= q2)"))]))
  let t1291 = @simp.asm_rewrite_tac(@list.List([]))
  let t1288 = @drule.match_mp(y_increases())
  let t1285 = @term_syntax.parse_term("(n : Num)")
  let t1290 = @tactics.first_assum(fn(x1289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1283 = @tactics.mp_tac(x1282)
        fn(x1284 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1283(x1284)
        }
      })(((x1286 : @kernel.Thm) => @bool.spec(t1285, x1286))(x1287))
    })(t1288(x1289))
  })
  let t1279 = @term_syntax.parse_term("(q2 : Num)")
  let t1280 = @term_syntax.parse_term("(q1 : Num)")
  let t1281 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t1280, t1279]))
  let t1278 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t1275 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1276 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1275)
  let t1274 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1277 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1274), t1276, @tactics.all_tac])
  let t1273 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1272 = @simp.rewrite_tac(@list.List([y_clauses()]))
  let t1271 = @tactics.match_mp_tac(pell_induction())
  let t1321 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))), @tactics.disch_tac), t1271), t1272), t1273), t1277), t1278), t1281), @tactics.strip_tac), t1290), t1291), t1292), @tactics.disch_tac), t1293), t1294), t1295), t1320)
  y_n_mod2_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → (∃ q : Num, Y(a, n) == 2 * q + n)"), t1321))
}

///|
let y_n_mod2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_N_MOD2")

///|
/// `Y_N_MOD2`
pub fn y_n_mod2() -> @kernel.Thm {
  y_n_mod2_c.get()
}

///|
/// Y_N_MODA1
fn step_39() -> Unit raise {
  let t1396 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()])), @int.arith_tac)
  let t1395 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1394 = @simp.asm_simp_tac(@list.List([@arith.lt_mult_rcancel()]))
  let t1393 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t1392 = @simp.gen_rewrite_tac(fn(x1389 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1390 = @equal.land_conv(x1389)
    fn(x1391 : @kernel.Term) -> @kernel.Thm raise {
      s1390(x1391)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == 1 * a"))]))
  let t1388 = @simp.asm_simp_tac(@list.List([@arith.lt_mult_rcancel()]))
  let t1387 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) + 1 <= (b : Num)) == (a < b)"))]))
  let t1386 = @simp.asm_rewrite_tac(@list.List([]))
  let t1385 = @tactics.exists_tac(@term_syntax.parse_term("(q2 : Num) * (b : Num) + 1"))
  let t1397 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t1385), t1386), t1387), t1388), t1392), t1393), t1394), t1395), @int.arith_tac)
  let t1384 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1383 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((q1 : Num) + (n : Num) <= (q2 : Num) + (n + 1)) == (q1 <= q2 + 1)"))]))
  let t1382 = @tactics.match_mp_tac(@arith.le_mult2())
  let t1381 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t1398 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1378 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1379 = @equal.land_conv(x1378)
    fn(x1380 : @kernel.Term) -> @kernel.Thm raise {
      s1379(x1380)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == 1 * a"))])), t1381), t1382), t1383), t1384), @int.arith_tac), t1397, t1396])
  let t1377 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1376 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(v : Num) <= (u : Num) && (y : Num) <= (x : Num) && u + y == (z : Num) + (x + ((w : Num) + v)) → u - v == z + (x - y) + w")))
  let t1375 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib(), @arith.right_sub_distrib()]))
  let t1374 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) - 1 == n"))]))
  let t1373 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(SUC((n : Num)) == 1) == (n == 0)"))]))
  let t1372 = @simp.rewrite_tac(@list.List([@nums.not_suc()]))
  let t1370 = @term_syntax.parse_term("(b : Num)")
  let t1371 = @tactics.spec_tac(@term_syntax.parse_term("(a : Num)"), t1370)
  let t1369 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t1368 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 1)"))
  let t1367 = @tactics.disch_then(fn(x1364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1364
    let t1366 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("2 * ((n : Num) + 1) + (2 * ((a : Num) * (q2 : Num)) - (q1 : Num))")), t1366)
  })
  let t1360 = @tactics.exists_tac(@term_syntax.parse_term("2 * (n : Num) + 1"))
  let t1359 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 * ((n : Num) + 1) - (1 + n) == 3 * (n + 1)"))]))
  let t1361 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.mult_assoc(), @calc_num.arith()])), t1359), t1360), @int.arith_tac)
  let t1358 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) + (c : Num) == (b : Num) → b - a == c")))
  let t1357 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1356 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) - 1 == n"))]))
  let t1355 = @simp.rewrite_tac(@list.List([@nums.not_suc()]))
  let t1353 = @term_syntax.parse_term("(b : Num)")
  let t1354 = @tactics.spec_tac(@term_syntax.parse_term("(a : Num)"), t1353)
  let t1352 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t1362 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("2 * ((n : Num) + 1)")), t1352), t1354), @nums.induct_tac), t1355), t1356), t1357), t1358), @int.arith_tac), t1361])
  let t1351 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1350 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) - 1 == 1) == (a == 2)"))]))
  let t1349 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) - 1 == 0) == (a == 0 || a == 1)"))]))
  let t1348 = @simp.asm_rewrite_tac(@list.List([@arith.mult_eq_0(), @arith.mult_eq_1()]))
  let t1347 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) <= 1) == (a == 0 || a == 1)"))]))
  let t1363 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()])), t1347), t1348), t1349), t1350), @tactics.strip_tac), t1351), t1362), @tactics.all_tac])
  let t1346 = @class.asm_cases_tac(@term_syntax.parse_term("(q2 : Num) == 0"))
  let t1345 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((q1 : Num) + (n : Num) <= (q2 : Num) + (n + 1)) == (q1 <= q2 + 1)"))]))
  let t1344 = @simp.asm_rewrite_tac(@list.List([]))
  let t1341 = @drule.match_mp(y_increases())
  let t1338 = @term_syntax.parse_term("(n : Num)")
  let t1343 = @tactics.first_assum(fn(x1342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1336 = @tactics.mp_tac(x1335)
        fn(x1337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1336(x1337)
        }
      })(((x1339 : @kernel.Thm) => @bool.spec(t1338, x1339))(x1340))
    })(t1341(x1342))
  })
  let t1332 = @term_syntax.parse_term("(q2 : Num)")
  let t1333 = @term_syntax.parse_term("(q1 : Num)")
  let t1334 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t1333, t1332]))
  let t1331 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t1328 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1329 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1328)
  let t1327 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1330 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1327), t1329, @tactics.all_tac])
  let t1326 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1325 = @simp.rewrite_tac(@list.List([y_clauses()]))
  let t1324 = @tactics.match_mp_tac(pell_induction())
  let t1323 = @list.List([@simp.asm_rewrite_tac(@list.List([@arith.sub_refl(), y_degenerate(), @arith.mult_clauses(), @arith.add_clauses()])), @tactics.all_tac])
  let t1322 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 1"))
  let t1399 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))), @tactics.disch_tac), t1322), t1323), t1324), t1325), t1326), t1330), t1331), t1334), @tactics.strip_tac), t1343), t1344), t1345), t1346), t1363), t1367), t1368), t1369), t1371), @nums.induct_tac), t1372), t1373), @tactics.disch_tac), t1374), @tactics.disch_tac), t1375), t1376), t1377), t1398)
  y_n_moda1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → (∃ q : Num, Y(a, n) == q * (a - 1) + n)"), t1399))
}

///|
let y_n_moda1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_N_MODA1")

///|
/// `Y_N_MODA1`
pub fn y_n_moda1() -> @kernel.Thm {
  y_n_moda1_c.get()
}

///|
/// X_CONGRUENT
fn step_40() -> Unit raise {
  let t1451 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")), @arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t1450 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t1449 = @simp.gen_rewrite_tac(fn(x1446 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1447 = @equal.land_conv(x1446)
    fn(x1448 : @kernel.Term) -> @kernel.Thm raise {
      s1447(x1448)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == 1 * a"))]))
  let t1444 = @term_syntax.parse_term("(a : Num) * ((b : Num) * ((c : Num) * (d : Num))) == a * b * (c * d)")
  let t1445 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@arith.mult_ac())(t1444)]))
  let t1452 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (y : Num) → a <= 2 * ((x : Num) + y)"))), t1445), t1449), t1450), t1451)
  let t1443 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")), @arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t1442 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc()), @arith.le_mult_lcancel()]))
  let t1441 = @simp.gen_rewrite_tac(fn(x1438 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1439 = @equal.land_conv(x1438)
    fn(x1440 : @kernel.Term) -> @kernel.Thm raise {
      s1439(x1440)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == a * 1"))]))
  let t1453 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1435 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1436 = @equal.rand_conv(x1435)
    fn(x1437 : @kernel.Term) -> @kernel.Thm raise {
      s1436(x1437)
    }
  }, @list.List([@arith.mult_sym()])), t1441), t1442), t1443), t1452])
  let t1434 = @tactics.match_mp_tac(@arith.le_add2())
  let t1433 = @simp.asm_rewrite_tac(@list.List([]))
  let t1432 = @list.List([@simp.asm_simp_tac(@list.List([x_increases(), @arith.add_eq_0()])), @tactics.all_tac])
  let t1431 = @tactics.exists_tac(@term_syntax.parse_term("X((a : Num) + (b : Num) * (c : Num), (n : Num) + 1)"))
  let t1430 = @tactics.match_mp_tac(@arith.le_trans())
  let t1429 = @list.List([@simp.asm_rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(@arith.le_add())])), @tactics.all_tac])
  let t1428 = @tactics.exists_tac(@term_syntax.parse_term("X((a : Num) + (b : Num) * (c : Num), (n : Num))"))
  let t1427 = @tactics.match_mp_tac(@arith.le_trans())
  let t1425 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t1424 = @simp.rewrite_tac(@list.List([@arith.mult_assoc(), @arith.le_mult_rcancel()]))
  let t1423 = @list.List([@simp.asm_simp_tac(@list.List([@arith.mult_clauses(), x_increases()])), @tactics.all_tac])
  let t1422 = @tactics.exists_tac(@term_syntax.parse_term("1 * X((a : Num), (n : Num) + 1)"))
  let t1426 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t1422), @tactics.conj_tac), t1423), t1424), @tactics.disj1_tac), t1425), @int.arith_tac), @tactics.all_tac])
  let t1421 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib(), @arith.right_add_distrib(), @equal.gsym(@arith.mult_assoc())]))
  let t1420 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (x : Num) && (b : Num) <= (y : Num) + (z : Num) && x - a + (y + z - b) == (u : Num) → x + (y + z) - (a + b) == u")))
  let t1419 = @tactics.exists_tac(@term_syntax.parse_term("2 * (X((a : Num), (n : Num) + 1) * (b : Num)) + 2 * ((a + b * (c : Num)) * (q2 : Num)) - (q1 : Num)"))
  let t1418 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * (((x : Num) + (y : Num)) * ((u : Num) + (v : Num))) == 2 * (x * u) + (2 * (u * y) + 2 * ((x + y) * v))"))]))
  let t1417 = @simp.asm_rewrite_tac(@list.List([]))
  let t1414 = @term_syntax.parse_term("(q2 : Num)")
  let t1415 = @term_syntax.parse_term("(q1 : Num)")
  let t1416 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t1415, t1414]))
  let t1413 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t1410 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1411 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(b : Num)")), t1410)
  let t1409 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1412 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1409), t1411, @tactics.all_tac])
  let t1408 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1407 = @simp.rewrite_tac(@list.List([x_clauses()]))
  let t1406 = @tactics.match_mp_tac(pell_induction())
  let t1405 = @simp.rewrite_tac(@list.List([@arith.mult_eq_0(), @class.de_morgan_thm()]))
  let t1404 = @tactics.undisch_tac(@term_syntax.parse_term("!((b : Num) * (c : Num) == 0)"))
  let t1402 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1403 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.exists_tac(@term_syntax.parse_term("0"))), t1402), @tactics.all_tac])
  let t1401 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Num) * (c : Num) == 0"))
  let t1400 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t1454 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), t1400), @tactics.disch_tac), t1401), t1403), t1404), t1405), @tactics.strip_tac), t1406), t1407), t1408), t1412), t1413), t1416), @tactics.strip_tac), t1417), t1418), t1419), t1420), t1421), @tactics.conj_tac), t1426), t1427), t1428), @tactics.conj_tac), t1429), t1430), t1431), @tactics.conj_tac), t1432), t1433), t1434), @tactics.conj_tac), t1453)
  x_congruent_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ n : Num, !(a == 0) → (∃ q : Num, X(a + b * c, n) == X(a, n) + q * c)"), t1454))
}

///|
let x_congruent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_CONGRUENT")

///|
/// `X_CONGRUENT`
pub fn x_congruent() -> @kernel.Thm {
  x_congruent_c.get()
}

///|
/// Y_CONGRUENT
fn step_41() -> Unit raise {
  let t1506 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")), @arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t1505 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t1504 = @simp.gen_rewrite_tac(fn(x1501 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1502 = @equal.land_conv(x1501)
    fn(x1503 : @kernel.Term) -> @kernel.Thm raise {
      s1502(x1503)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == 1 * a"))]))
  let t1499 = @term_syntax.parse_term("(a : Num) * ((b : Num) * ((c : Num) * (d : Num))) == a * b * (c * d)")
  let t1500 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@arith.mult_ac())(t1499)]))
  let t1507 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (y : Num) → a <= 2 * ((x : Num) + y)"))), t1500), t1504), t1505), t1506)
  let t1498 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")), @arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t1497 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc()), @arith.le_mult_lcancel()]))
  let t1496 = @simp.gen_rewrite_tac(fn(x1493 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1494 = @equal.land_conv(x1493)
    fn(x1495 : @kernel.Term) -> @kernel.Thm raise {
      s1494(x1495)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == a * 1"))]))
  let t1508 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1490 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1491 = @equal.rand_conv(x1490)
    fn(x1492 : @kernel.Term) -> @kernel.Thm raise {
      s1491(x1492)
    }
  }, @list.List([@arith.mult_sym()])), t1496), t1497), t1498), t1507])
  let t1489 = @tactics.match_mp_tac(@arith.le_add2())
  let t1488 = @simp.asm_rewrite_tac(@list.List([]))
  let t1487 = @list.List([@simp.asm_simp_tac(@list.List([y_increases(), @arith.add_eq_0()])), @tactics.all_tac])
  let t1486 = @tactics.exists_tac(@term_syntax.parse_term("Y((a : Num) + (b : Num) * (c : Num), (n : Num) + 1)"))
  let t1485 = @tactics.match_mp_tac(@arith.le_trans())
  let t1484 = @list.List([@simp.asm_rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(@arith.le_add())])), @tactics.all_tac])
  let t1483 = @tactics.exists_tac(@term_syntax.parse_term("Y((a : Num) + (b : Num) * (c : Num), (n : Num))"))
  let t1482 = @tactics.match_mp_tac(@arith.le_trans())
  let t1480 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t1479 = @simp.rewrite_tac(@list.List([@arith.mult_assoc(), @arith.le_mult_rcancel()]))
  let t1478 = @list.List([@simp.asm_simp_tac(@list.List([@arith.mult_clauses(), y_increases()])), @tactics.all_tac])
  let t1477 = @tactics.exists_tac(@term_syntax.parse_term("1 * Y((a : Num), (n : Num) + 1)"))
  let t1481 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t1477), @tactics.conj_tac), t1478), t1479), @tactics.disj1_tac), t1480), @int.arith_tac), @tactics.all_tac])
  let t1476 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib(), @arith.right_add_distrib(), @equal.gsym(@arith.mult_assoc())]))
  let t1475 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (x : Num) && (b : Num) <= (y : Num) + (z : Num) && x - a + (y + z - b) == (u : Num) → x + (y + z) - (a + b) == u")))
  let t1474 = @tactics.exists_tac(@term_syntax.parse_term("2 * (Y((a : Num), (n : Num) + 1) * (b : Num)) + 2 * ((a + b * (c : Num)) * (q2 : Num)) - (q1 : Num)"))
  let t1473 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * (((x : Num) + (y : Num)) * ((u : Num) + (v : Num))) == 2 * (x * u) + (2 * (u * y) + 2 * ((x + y) * v))"))]))
  let t1472 = @simp.asm_rewrite_tac(@list.List([]))
  let t1469 = @term_syntax.parse_term("(q2 : Num)")
  let t1470 = @term_syntax.parse_term("(q1 : Num)")
  let t1471 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t1470, t1469]))
  let t1468 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t1465 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1466 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1465)
  let t1464 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1467 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1464), t1466, @tactics.all_tac])
  let t1463 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1462 = @simp.rewrite_tac(@list.List([y_clauses()]))
  let t1461 = @tactics.match_mp_tac(pell_induction())
  let t1460 = @simp.rewrite_tac(@list.List([@arith.mult_eq_0(), @class.de_morgan_thm()]))
  let t1459 = @tactics.undisch_tac(@term_syntax.parse_term("!((b : Num) * (c : Num) == 0)"))
  let t1457 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1458 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.exists_tac(@term_syntax.parse_term("0"))), t1457), @tactics.all_tac])
  let t1456 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Num) * (c : Num) == 0"))
  let t1455 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t1509 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), t1455), @tactics.disch_tac), t1456), t1458), t1459), t1460), @tactics.strip_tac), t1461), t1462), t1463), t1467), t1468), t1471), @tactics.strip_tac), t1472), t1473), t1474), t1475), t1476), @tactics.conj_tac), t1481), t1482), t1483), @tactics.conj_tac), t1484), t1485), t1486), @tactics.conj_tac), t1487), t1488), t1489), @tactics.conj_tac), t1508)
  y_congruent_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ n : Num, !(a == 0) → (∃ q : Num, Y(a + b * c, n) == Y(a, n) + q * c)"), t1509))
}

///|
let y_congruent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_CONGRUENT")

///|
/// `Y_CONGRUENT`
pub fn y_congruent() -> @kernel.Thm {
  y_congruent_c.get()
}

///|
/// X_CONGRUENT_2NJ_POS
fn step_42() -> Unit raise {
  let t1532 = @meson.meson_tac(@list.List([]))
  let t1531 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @int.arith_rule(@term_syntax.parse_term("(xn : Num) * (a : Num) + (xj : Num) * (xn * xn) == (a + xj * xn) * xn"))]))
  let t1529 = @equal.gsym(@arith.exp_2())
  let t1530 = @simp.asm_simp_tac(@list.List([@equal.gsym(xy_are_solutions()), t1529]))
  let t1528 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(xn : Num) * (a : Num) + (d : Num) * ((yn : Num) * (xn * (yj : Num) + (xj : Num) * yn)) + xj == xn * (a + d * (yn * yj)) + xj * (d * (yn * yn) + 1)"))]))
  let t1527 = @tactics.disch_then(fn(x1526 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1523 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1524 = @tactics.subst1_tac(x1523)
      fn(x1525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1524(x1525)
      }
    })(@bool.conjunct2(x1526))
  })
  let t1522 = @simp.asm_rewrite_tac(@list.List([]))
  let t1519 = @term_syntax.parse_term("(j : Num)")
  let t1520 = @term_syntax.parse_term("(n : Num)")
  let t1521 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1520, t1519]), addition_formula_pos()))
  let t1518 = @tactics.disch_then(fn(x1517 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1514 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1515 = @tactics.subst1_tac(x1514)
      fn(x1516 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1515(x1516)
      }
    })(@bool.conjunct1(x1517))
  })
  let t1513 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + (n + (j : Num)) == 2 * n + j"))]))
  let t1510 = @term_syntax.parse_term("(n : Num) + (j : Num)")
  let t1511 = @term_syntax.parse_term("(n : Num)")
  let t1512 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1511, t1510]), addition_formula_pos()))
  let t1533 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1512), t1513), t1518), t1521), t1522), t1527), t1528), t1530), t1531), t1532)
  x_congruent_2nj_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ j : Num, !(a == 0) → (∃ q : Num, X(a, 2 * n + j) + X(a, j) == q * X(a, n))"), t1533))
}

///|
let x_congruent_2nj_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_CONGRUENT_2NJ_POS")

///|
/// `X_CONGRUENT_2NJ_POS`
pub fn x_congruent_2nj_pos() -> @kernel.Thm {
  x_congruent_2nj_pos_c.get()
}

///|
/// X_CONGRUENT_4NJ_POS
fn step_43() -> Unit raise {
  let t1577 = @meson.meson_tac(@list.List([]))
  let t1576 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.right_sub_distrib())]))
  let t1575 = @tactics.disch_then(fn(x1574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1573 = @simp.asm_simp_tac(@list.List([x_increases_le(), @int.arith_rule(@term_syntax.parse_term("(j : Num) <= 4 * (n : Num) + j"))]))
  let t1570 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(y : Num) + (q2 : Num) == (q1 : Num) + (x : Num) → x <= y → y == q1 - q2 + x")))
  let t1572 = @tactics.disch_then(fn(x1571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1567 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1568 = @tactics.mp_tac(x1567)
      fn(x1569 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1568(x1569)
      }
    })(t1570(x1571))
  })
  let t1566 = @tactics.disch_then(fn(x1563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1564 = @tactics.subst1_tac(x1563)
    fn(x1565 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1564(x1565)
    }
  })
  let t1562 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q2 : Num)"))(fn(x1559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1560 = @tactics.mp_tac(x1559)
    fn(x1561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1560(x1561)
    }
  }))
  let t1558 = @simp.asm_rewrite_tac(@list.List([]))
  let t1555 = @term_syntax.parse_term("(j : Num)")
  let t1556 = @term_syntax.parse_term("(n : Num)")
  let t1557 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1556, t1555]), x_congruent_2nj_pos()))
  let t1554 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc())]))
  let t1550 = @term_syntax.parse_term("(op_plus : (Num, Num) -> Num)")
  let t1547 = @term_syntax.parse_term("X((a : Num), (j : Num))")
  let t1553 = @tactics.disch_then(fn(x1552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1543 = @tactics.mp_tac(x1542)
        fn(x1544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1543(x1544)
        }
      })((fn(x1548 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x1545 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x1546 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x1545, x1546)
          }
        })(x1548)(t1547)
      })(x1549))
    })(((x1551 : @kernel.Thm) => @equal.ap_term(t1550, x1551))(x1552))
  })
  let t1541 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q1 : Num)"))(fn(x1538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1539 = @tactics.mp_tac(x1538)
    fn(x1540 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1539(x1540)
    }
  }))
  let t1537 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * (n : Num) + (2 * n + (j : Num)) == 4 * n + j"))]))
  let t1534 = @term_syntax.parse_term("2 * (n : Num) + (j : Num)")
  let t1535 = @term_syntax.parse_term("(n : Num)")
  let t1536 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1535, t1534]), x_congruent_2nj_pos()))
  let t1578 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1536), t1537), t1541), t1553), t1554), t1557), t1558), t1562), t1566), t1572), t1573), t1575), t1576), t1577)
  x_congruent_4nj_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ j : Num, !(a == 0) → (∃ q : Num, X(a, 4 * n + j) == q * X(a, n) + X(a, j))"), t1578))
}

///|
let x_congruent_4nj_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_CONGRUENT_4NJ_POS")

///|
/// `X_CONGRUENT_4NJ_POS`
pub fn x_congruent_4nj_pos() -> @kernel.Thm {
  x_congruent_4nj_pos_c.get()
}

///|
/// X_CONGRUENT_4MNJ_POS
fn step_44() -> Unit raise {
  let t1597 = @tactics.exists_tac(@term_syntax.parse_term("(q2 : Num) + (q1 : Num)"))
  let t1596 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q2 : Num)"))(fn(x1593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1594 = @tactics.subst1_tac(x1593)
    fn(x1595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1594(x1595)
    }
  }))
  let t1592 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 * ((m : Num) * (n : Num) + n) + (j : Num) == 4 * n + (4 * (m * n) + j)"))]))
  let t1589 = @term_syntax.parse_term("4 * ((m : Num) * (n : Num)) + (j : Num)")
  let t1590 = @term_syntax.parse_term("(n : Num)")
  let t1591 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1590, t1589]), x_congruent_4nj_pos()))
  let t1588 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q1 : Num)"))(fn(x1585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1586 = @tactics.assume_tac(x1585)
    fn(x1587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1586(x1587)
    }
  }))
  let t1584 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t1583 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, ∀ j : Num, ∃ q : Num, X((a : Num), 4 * ((m : Num) * n) + j) == q * X(a, n) + X(a, j)"))
  let t1581 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1580 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1582 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1580), t1581), @tactics.all_tac])
  let t1579 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t1598 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))), @tactics.disch_tac), @nums.induct_tac), t1579), t1582), t1583), t1584), t1588), t1591), t1592), t1596), t1597), @int.arith_tac)
  x_congruent_4mnj_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, ∀ j : Num, !(a == 0) → (∃ q : Num, X(a, 4 * (m * n) + j) == q * X(a, n) + X(a, j))"), t1598))
}

///|
let x_congruent_4mnj_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_CONGRUENT_4MNJ_POS")

///|
/// `X_CONGRUENT_4MNJ_POS`
pub fn x_congruent_4mnj_pos() -> @kernel.Thm {
  x_congruent_4mnj_pos_c.get()
}

///|
/// X_CONGRUENT_2NJ_NEG_LEMMA
fn step_45() -> Unit raise {
  let t1633 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @arith.mult_ac()]))
  let t1631 = @equal.gsym(@arith.exp_2())
  let t1632 = @simp.asm_simp_tac(@list.List([@equal.gsym(xy_are_solutions()), t1631]))
  let t1634 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(xn : Num) * ((a : Num) * ((yj : Num) * (yn : Num))) + (a * (yn * ((xj : Num) * yn)) + xj) == xj * (a * (yn * yn) + 1) + a * (yn * (xn * yj))"))])), t1632), t1633)
  let t1630 = @simp.asm_rewrite_tac(@list.List([@arith.le_0()]))
  let t1629 = @tactics.match_mp_tac(x_increases_le())
  let t1627 = @bool.conjunct1(x_clauses())
  let t1628 = @tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(a : Num)"), t1627)))
  let t1624 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(c : Num) == (a : Num) - (b : Num) → 1 <= c → b <= a")))
  let t1626 = @tactics.first_assum(fn(x1625 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1624(x1625))
  })
  let t1635 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()])), @tactics.disj2_tac), t1626), t1628), t1629), t1630)
  let t1623 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(j : Num) <= (n : Num) → (1 <= n - j) == !(j == n)"))]))
  let t1622 = @tactics.match_mp_tac(y_increases_le())
  let t1620 = @lib.el(1, @bool.conjuncts_rule(y_clauses()))
  let t1621 = @tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(a : Num)"), t1620)))
  let t1617 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(c : Num) == (a : Num) - (b : Num) → 1 <= c → b <= a")))
  let t1619 = @tactics.first_assum(fn(x1618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1617(x1618))
  })
  let t1616 = @tactics.repeat_tac(@tactics.disj2_tac)
  let t1636 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()])), t1616), t1619), t1621), t1622), t1623), t1635, t1634])
  let t1615 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1614 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(b : Num) <= (a : Num) && (e : Num) <= (d : Num) && e + (a + (c : Num)) == d + b → a - b + c == d - e")))
  let t1613 = @simp.rewrite_tac(@list.List([@arith.left_sub_distrib()]))
  let t1612 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((xn : Num) * (a : Num) + (b : Num) + (c : Num) == (a + (d : Num)) * xn) == (b + c == xn * d)"))]))
  let t1611 = @tactics.exists_tac(@term_syntax.parse_term("X((a : Num), (j : Num)) * X(a, (n : Num)) - (EXP(a, 2) - 1) * (Y(a, j) * Y(a, n)) + (X(a, j) * X(a, n) - (EXP(a, 2) - 1) * (Y(a, j) * Y(a, n)))"))
  let t1610 = @simp.asm_rewrite_tac(@list.List([]))
  let t1609 = @simp.asm_rewrite_tac(@list.List([]))
  let t1606 = @term_syntax.parse_term("(n : Num)")
  let t1607 = @term_syntax.parse_term("(j : Num)")
  let t1608 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1607, t1606]), addition_formula_neg()))
  let t1605 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(j : Num) <= (n : Num) → n + (n - j) == 2 * n - j"))]))
  let t1602 = @term_syntax.parse_term("(n : Num) - (j : Num)")
  let t1603 = @term_syntax.parse_term("(n : Num)")
  let t1604 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1603, t1602]), addition_formula_pos()))
  let t1600 = @simp.asm_rewrite_tac(@list.List([@arith.mult_2(), @arith.add_sub()]))
  let t1601 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("2")), t1600), @tactics.all_tac])
  let t1599 = @class.asm_cases_tac(@term_syntax.parse_term("(j : Num) == (n : Num)"))
  let t1637 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1599), t1601), t1604), t1605), @tactics.strip_tac), t1608), t1609), @tactics.strip_tac), t1610), t1611), t1612), t1613), t1614), t1615), t1636)
  x_congruent_2nj_neg_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ j : Num, !(a == 0) && j <= n → (∃ q : Num, X(a, 2 * n - j) + X(a, j) == q * X(a, n))"), t1637))
}

///|
let x_congruent_2nj_neg_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_CONGRUENT_2NJ_NEG_LEMMA")

///|
/// `X_CONGRUENT_2NJ_NEG_LEMMA`
pub fn x_congruent_2nj_neg_lemma() -> @kernel.Thm {
  x_congruent_2nj_neg_lemma_c.get()
}

///|
/// X_CONGRUENT_2NJ_NEG
fn step_46() -> Unit raise {
  let t1645 = @simp.simp_tac(@list.List([@arith.add_ac()]))
  let t1644 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(y : Num) <= (x : Num) → x - (x - y) == y"))]))
  let t1643 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((j : Num) <= (n : Num)) → 2 * n - j <= n"))]))
  let t1640 = @term_syntax.parse_term("2 * (n : Num) - (j : Num)")
  let t1641 = @term_syntax.parse_term("(n : Num)")
  let t1642 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1641, t1640]), x_congruent_2nj_neg_lemma()))
  let t1639 = @simp.asm_simp_tac(@list.List([x_congruent_2nj_neg_lemma()]))
  let t1638 = @class.asm_cases_tac(@term_syntax.parse_term("(j : Num) <= (n : Num)"))
  let t1646 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1638), t1639), t1642), t1643), t1644), t1645)
  x_congruent_2nj_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, ∀ j : Num, !(a == 0) && j <= 2 * n → (∃ q : Num, X(a, 2 * n - j) + X(a, j) == q * X(a, n))"), t1646))
}

///|
let x_congruent_2nj_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("X_CONGRUENT_2NJ_NEG")

///|
/// `X_CONGRUENT_2NJ_NEG`
pub fn x_congruent_2nj_neg() -> @kernel.Thm {
  x_congruent_2nj_neg_c.get()
}

///|
/// XY_GCD_LEMMA
fn step_47() -> Unit raise {
  let t1723 = @tactics.pop_assum_list(fn(x1722 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1721 = @simp.gen_rewrite_tac(fn(x1720 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1720
  }, @list.List([@equal.gsym(@int.divides_antisym())]))
  let t1724 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @analysis.expand_tac("n")), t1721), t1723), @int.number_tac)
  let t1719 = @meson.asm_meson_tac(@list.List([@prime.divides_trans()]))
  let t1718 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1714 = @term_syntax.parse_term("(e : Num)")
  let t1717 = @tactics.disch_then(fn(x1716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1712 = @tactics.mp_tac(x1711)
      fn(x1713 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1712(x1713)
      }
    })(((x1715 : @kernel.Thm) => @bool.spec(t1714, x1715))(x1716))
  })
  let t1710 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t1709 = @tactics.undisch_tac(@term_syntax.parse_term("coprime((X((a : Num), (q : Num) * (m : Num)), Y(a, q * m)))"))
  let t1708 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Num)"))
  let t1707 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t1706 = @simp.asm_rewrite_tac(@list.List([]))
  let t1704 = @term_syntax.parse_term("(q : Num) * (m : Num)")
  let t1705 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1704]), xy_coprime()))
  let t1703 = @list.List([@meson.asm_meson_tac(@list.List([y_divides(), @prime.divides_trans(), @prime.divides_lmul(), @prime.divides_refl()])), @tactics.all_tac])
  let t1702 = @tactics.subgoal_then(@term_syntax.parse_term("divides((d : Num), Y((a : Num), (q : Num) * (m : Num)))"), fn(x1699 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1700 = @tactics.mp_tac(x1699)
    fn(x1701 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1700(x1701)
    }
  })
  let t1698 = @tactics.subgoal_then(@term_syntax.parse_term("coprime(((d : Num), X((a : Num), (q : Num) * (m : Num))))"), fn(x1696 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1696
    @meson.meson_tac(@list.List([@prime.coprime_divprod(), th]))
  })
  let t1695 = @simp.simp_tac(@list.List([@prime.divides_lmul()]))
  let t1693 = @meson.meson_tac(@list.List([@prime.divides_add(), @prime.divides_lmul(), @prime.divides_rmul(), @prime.divides_refl(), @prime.divides_add_revl()]))
  let t1692 = @list.List([@meson.asm_meson_tac(@list.List([y_divides(), @prime.divides_trans(), @prime.divides_lmul(), @prime.divides_refl()])), @tactics.all_tac])
  let t1694 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("divides((d : Num), Y((a : Num), (q : Num) * (m : Num)))"), fn(x1689 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1690 = @tactics.mp_tac(x1689)
    fn(x1691 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1690(x1691)
    }
  }), t1692), t1693), @tactics.all_tac])
  let t1688 = @tactics.exists_tac(@term_syntax.parse_term("divides((d : Num), X((a : Num), (q : Num) * (m : Num)) * Y(a, (r : Num)))"))
  let t1687 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1686 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)")))
  let t1685 = @tactics.conv_tac(@equal.sym_conv)
  let t1684 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1683 = @tactics.match_mp_tac(@prime.gcd_eq())
  let t1682 = @simp.gen_rewrite_tac(fn(x1679 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1680 = @equal.land_conv(x1679)
    fn(x1681 : @kernel.Term) -> @kernel.Thm raise {
      s1680(x1681)
    }
  }, @list.List([@prime.gcd_sym()]))
  let t1678 = @simp.asm_simp_tac(@list.List([addition_formula_pos()]))
  let t1725 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@analysis.expand_tac("n"), t1678), t1682), t1683), t1684), t1685), t1686), @tactics.disch_tac), t1687), t1688), @tactics.conj_tac), t1694), @tactics.eq_tac), t1695), t1698), t1702), t1703), t1705), t1706), @tactics.disch_tac), @tactics.disch_tac), t1707), t1708), @tactics.strip_tac), t1709), t1710), t1717), t1718), t1719), t1724])
  let t1677 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1676 = @simp.asm_rewrite_tac(@list.List([]))
  let t1672 = @term_syntax.parse_term("(m : Num)")
  let t1675 = @tactics.disch_then(fn(x1674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1669 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1670 = @tactics.mp_tac(x1669)
      fn(x1671 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1670(x1671)
      }
    })(((x1673 : @kernel.Thm) => @bool.spec(t1672, x1673))(x1674))
  })
  let t1668 = @simp.asm_rewrite_tac(@list.List([]))
  let t1664 = @term_syntax.parse_term("(r : Num)")
  let t1667 = @tactics.first_x_assum(fn(x1666 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1661 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1662 = @tactics.mp_tac(x1661)
      fn(x1663 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1662(x1663)
      }
    })(((x1665 : @kernel.Thm) => @bool.spec(t1664, x1665))(x1666))
  })
  let t1660 = @tactics.disch_then(fn(x1659 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x1659))
  })
  let t1658 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Num) == MOD((n : Num), (m : Num))"))
  let t1657 = @simp.abbrev_tac(@term_syntax.parse_term("(q : Num) == DIV((n : Num), (m : Num))"))
  let t1656 = @simp.asm_rewrite_tac(@list.List([y_clauses(), @prime.gcd_0()]))
  let t1655 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t1653 = @term_syntax.parse_term("(m : Num)")
  let t1654 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t1653]), @arith.division()))
  let t1652 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1651 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t1650 = @tactics.match_mp_tac(@arith.num_wf())
  let t1649 = @simp.asm_rewrite_tac(@list.List([y_degenerate()]))
  let t1648 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 1"))
  let t1647 = @simp.asm_rewrite_tac(@list.List([]))
  let t1726 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0"))), t1647), t1648), t1649), t1650), t1651), @tactics.disch_tac), t1652), @tactics.disch_tac), t1654), t1655), t1656), t1657), t1658), t1660), t1667), t1668), t1675), t1676), t1677), @tactics.binop_tac), t1725)
  xy_gcd_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) && m < n → gcd((Y(a, m), Y(a, n))) == Y(a, gcd((m, n)))"), t1726))
}

///|
let xy_gcd_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XY_GCD_LEMMA")

///|
/// `XY_GCD_LEMMA`
pub fn xy_gcd_lemma() -> @kernel.Thm {
  xy_gcd_lemma_c.get()
}

///|
/// XY_GCD
fn step_48() -> Unit raise {
  let t1734 = @simp.asm_rewrite_tac(@list.List([@prime.gcd_refl()]))
  let t1733 = @simp.asm_simp_tac(@list.List([xy_gcd_lemma()]))
  let t1735 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@prime.gcd_sym()])), t1733)
  let t1736 = @list.List([@simp.asm_simp_tac(@list.List([xy_gcd_lemma()])), t1735, t1734])
  let t1730 = @term_syntax.parse_term("(n : Num)")
  let t1731 = @bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t1730]), @arith.lt_cases())
  let t1732 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x1727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1728 = @tactics.assume_tac(x1727)
    fn(x1729 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1728(x1729)
    }
  })(t1731)
  let t1737 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1732), t1736)
  xy_gcd_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ m : Num, ∀ n : Num, !(a == 0) → gcd((Y(a, m), Y(a, n))) == Y(a, gcd((m, n)))"), t1737))
}

///|
let xy_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XY_GCD")

///|
/// `XY_GCD`
pub fn xy_gcd() -> @kernel.Thm {
  xy_gcd_c.get()
}

///|
/// STEP_DOWN_LEMMA
fn step_49() -> Unit raise {
  let t1952 = @simp.asm_rewrite_tac(@list.List([@arith.le_0()]))
  let t1951 = @tactics.match_mp_tac(x_increases_le())
  let t1950 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(x_clauses()))]))
  let t1948 = @tactics.undisch_tac(@term_syntax.parse_term("!((i : Num) <= (n : Num))"))
  let t1947 = @simp.asm_rewrite_tac(@list.List([]))
  let t1946 = @tactics.match_mp_tac(x_increases_le())
  let t1945 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (a : Num)) == !(a == 0)"))]))
  let t1949 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.le_mult2()), t1945), t1946), t1947), t1948), @int.arith_tac), @tactics.all_tac])
  let t1944 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("1 * (xi : Num) <= (qxn : Num) && 1 <= (xj : Num) → !(xi == xj + qxn)")))
  let t1943 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)")))
  let t1941 = @tactics.undisch_tac(@term_syntax.parse_term("(i : Num) <= (j : Num)"))
  let t1940 = @tactics.undisch_tac(@term_syntax.parse_term("(j : Num) <= 2 * (n : Num)"))
  let t1939 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) → a → b || (c : Bool)")))
  let t1942 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses(), x_inj()])), t1939), t1940), t1941), @int.arith_tac), @tactics.all_tac])
  let t1938 = @class.asm_cases_tac(@term_syntax.parse_term("(q2 : Num) + (q : Num) - (q1 : Num) == 0"))
  let t1936 = @equal.gsym(@arith.right_sub_distrib())
  let t1937 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.right_add_distrib()), t1936]))
  let t1934 = @tactics.undisch_tac(@term_syntax.parse_term("(i : Num) <= (j : Num)"))
  let t1933 = @simp.asm_rewrite_tac(@list.List([]))
  let t1935 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(x_increases_le()), t1933), t1934), @int.arith_tac), @tactics.all_tac])
  let t1930 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) + (q1 : Num) == (y : Num) + (q2 : Num) → y <= x → x == y + (q2 - q1)")))
  let t1932 = @tactics.disch_then(fn(x1931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1927 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1928 = @tactics.mp_tac(x1927)
      fn(x1929 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1928(x1929)
      }
    })(t1930(x1931))
  })
  let t1926 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((x : Num) + (i : Num) + (q1 : Num) == (q2 : Num) + ((y : Num) + ((q3 : Num) + i))) == (x + q1 == y + (q2 + q3))"))]))
  let t1923 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) == (b : Num) && (c : Num) == (d : Num) → a + d == b + c")))
  let t1925 = @tactics.disch_then(fn(x1924 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1920 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1921 = @tactics.mp_tac(x1920)
      fn(x1922 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1921(x1922)
      }
    })(t1923(x1924))
  })
  let t1919 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1918 = @simp.asm_rewrite_tac(@list.List([]))
  let t1917 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q2 : Num)"))(fn(x1914 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1915 = @tactics.mp_tac(x1914)
    fn(x1916 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1915(x1916)
    }
  }))
  let t1912 = @meson.asm_meson_tac(@list.List([@arith.le_trans()]))
  let t1913 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1912), @tactics.all_tac])
  let t1909 = @term_syntax.parse_term("(i : Num)")
  let t1910 = @term_syntax.parse_term("(n : Num)")
  let t1911 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1910, t1909]), x_congruent_2nj_neg()))
  let t1908 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q1 : Num)"))(fn(x1905 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1906 = @tactics.mp_tac(x1905)
    fn(x1907 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1906(x1907)
    }
  }))
  let t1904 = @simp.asm_rewrite_tac(@list.List([]))
  let t1901 = @term_syntax.parse_term("(j : Num)")
  let t1902 = @term_syntax.parse_term("(n : Num)")
  let t1903 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1902, t1901]), x_congruent_2nj_neg()))
  let t1899 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t1898 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 1)"))
  let t1897 = @simp.rewrite_tac(@list.List([@arith.mult_assoc(), @arith.le_mult_rcancel()]))
  let t1896 = @simp.asm_simp_tac(@list.List([x_increases_lt(), @int.arith_rule(@term_syntax.parse_term("(n : Num) < n + 1"))]))
  let t1895 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(z : Num) < (x : Num) && 3 * x <= (y : Num) → 2 * x < y - z")))
  let t1894 = @simp.rewrite_tac(@list.List([x_clauses()]))
  let t1892 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 1)"))
  let t1893 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)")), t1892), @int.arith_tac), @tactics.all_tac])
  let t1891 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) == n - 2 + 2"), fn(x1882 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1882
    @simp.gen_rewrite_tac(fn(x1890 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1884 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1885 = @equal.rand_conv(x1884)
        fn(x1886 : @kernel.Term) -> @kernel.Thm raise {
          s1885(x1886)
        }
      })((fn(x1887 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1888 = @equal.once_depth_conv(x1887)
        fn(x1889 : @kernel.Term) -> @kernel.Thm raise {
          s1888(x1889)
        }
      })(x1890))
    }, @list.List([th]))
  })
  let t1880 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 1)"))
  let t1881 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)")), t1880), @int.arith_tac), @tactics.all_tac])
  let t1879 = @tactics.subgoal_then(@term_syntax.parse_term("(n : Num) - 1 == n - 2 + 1"), fn(x1876 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1877 = @tactics.subst1_tac(x1876)
    fn(x1878 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1877(x1878)
    }
  })
  let t1872 = @tactics.undisch_tac(@term_syntax.parse_term("(i : Num) <= (n : Num)"))
  let t1873 = @tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((i : Num) == (n : Num))")), t1872), @int.arith_tac)
  let t1871 = @tactics.undisch_tac(@term_syntax.parse_term("!((j : Num) <= (n : Num))"))
  let t1874 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)")), t1871), @int.arith_tac), t1873])
  let t1870 = @simp.asm_rewrite_tac(@list.List([]))
  let t1869 = @tactics.match_mp_tac(x_increases_le())
  let t1875 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (c : Num) && (b : Num) <= c → a + b <= 2 * c"))), @tactics.conj_tac), t1869), t1870), t1874), @tactics.all_tac])
  let t1868 = @tactics.exists_tac(@term_syntax.parse_term("2 * X((a : Num), (n : Num) - 1)"))
  let t1867 = @tactics.match_mp_tac(@arith.let_trans())
  let t1865 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((q : Num) == 0) → 1 <= q"))]))
  let t1864 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t1866 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1861 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1862 = @equal.land_conv(x1861)
    fn(x1863 : @kernel.Term) -> @kernel.Thm raise {
      s1862(x1863)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == 1 * a"))])), t1864), t1865)])
  let t1860 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(s : Num) < (x : Num) && x <= (q : Num) * x → !(s == q * x)")))
  let t1859 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(b : Bool) → b → (a : Bool)")))
  let t1858 = @tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), 2 * (n : Num) - (j : Num)) + X(a, (i : Num)) == ((q1 : Num) - (q : Num)) * X(a, n)"))
  let t1856 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((q : Num) == 0) → 1 <= q"))]))
  let t1855 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t1854 = @simp.gen_rewrite_tac(fn(x1851 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1852 = @equal.land_conv(x1851)
    fn(x1853 : @kernel.Term) -> @kernel.Thm raise {
      s1852(x1853)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == 1 * a"))]))
  let t1850 = @tactics.undisch_then(@term_syntax.parse_term("((q1 : Num) - (q : Num)) * (a : Num) == 2"), fn(x1849 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1847 = @tactics.subst1_tac(x1846)
      fn(x1848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1847(x1848)
      }
    })(@equal.sym(x1849))
  })
  let t1845 = @simp.asm_rewrite_tac(@list.List([]))
  let t1844 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) && !(a == 1) && a <= 2 → a == 2")))
  let t1843 = @tactics.disch_then(fn(x1842 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1839 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1840 = @tactics.assume_tac(x1839)
      fn(x1841 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1840(x1841)
      }
    })(@equal.sym(x1842))
  })
  let t1838 = @simp.rewrite_tac(@list.List([@calc_num.arith(), x_clauses()]))
  let t1837 = @tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), 2 * 1 - 2) + X(a, 0) == ((q1 : Num) - (q : Num)) * X(a, 1)"))
  let t1835 = @term_syntax.parse_term("!((i : Num) == 1)")
  let t1836 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x1832 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1833 = @tactics.undisch_tac(x1832)
    fn(x1834 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1833(x1834)
    }
  }, @list.List([@term_syntax.parse_term("(i : Num) <= 1"), t1835])), @int.arith_tac), @tactics.all_tac])
  let t1831 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) == 0"), fn(x1828 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1829 = @tactics.subst_all_tac(x1828)
    fn(x1830 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1829(x1830)
    }
  })
  let t1827 = @tactics.undisch_then(@term_syntax.parse_term("(n : Num) == 1"), fn(x1824 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1825 = @tactics.subst_all_tac(x1824)
    fn(x1826 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1825(x1826)
    }
  })
  let t1823 = @simp.rewrite_tac(@list.List([]))
  let t1822 = @tactics.disch_then(fn(x1819 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1820 = @tactics.subst_all_tac(x1819)
    fn(x1821 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1820(x1821)
    }
  })
  let t1816 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((j : Num) <= 1) && j <= 2 → j == 2")))
  let t1818 = @tactics.disch_then(fn(x1817 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1814 = @tactics.mp_tac(x1813)
      fn(x1815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1814(x1815)
      }
    })(t1816(x1817))
  })
  let t1812 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1811 = @simp.asm_rewrite_tac(@list.List([]))
  let t1810 = @tactics.undisch_tac(@term_syntax.parse_term("!((j : Num) <= (n : Num))"))
  let t1809 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1857 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(j : Num) <= 2 * (n : Num)")), t1809), t1810), t1811), t1812), t1818), t1822), t1823), t1827), t1831), t1836), t1837), t1838), t1843), t1844), t1845), t1850), t1854), t1855), t1856), @tactics.all_tac])
  let t1808 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1807 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(b : Bool) → (a : Bool) → (c : Bool)) → a → b || c")))
  let t1805 = @simp.asm_simp_tac(@list.List([x_increases_le(), @arith.le_0()]))
  let t1804 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(x_clauses()))]))
  let t1803 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) == (1 <= n)"))]))
  let t1802 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(c : Bool) → (a : Bool) && c → (b : Bool)")))
  let t1806 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_eq_0()])), t1802), t1803), t1804), t1805), @tactics.all_tac])
  let t1801 = @class.asm_cases_tac(@term_syntax.parse_term("(q1 : Num) - (q : Num) == 0"))
  let t1799 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t1798 = @tactics.undisch_tac(@term_syntax.parse_term("!((j : Num) <= (n : Num))"))
  let t1797 = @simp.asm_rewrite_tac(@list.List([]))
  let t1796 = @tactics.match_mp_tac(x_increases_lt())
  let t1795 = @simp.asm_simp_tac(@list.List([@arith.le_mult_rcancel(), @int.arith_rule(@term_syntax.parse_term("!((x : Num) == 0) → 1 <= x"))]))
  let t1794 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(j : Num) < (n : Num) && 1 * n <= (a : Num) * n → !(j == a * n)")))
  let t1792 = @simp.asm_simp_tac(@list.List([x_increases_le(), @arith.le_0()]))
  let t1791 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(x_clauses()))]))
  let t1793 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) == (1 <= n)"))])), t1791), t1792), @tactics.all_tac])
  let t1790 = @class.asm_cases_tac(@term_syntax.parse_term("(q1 : Num) - (q : Num) - 1 == 0"))
  let t1789 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.right_sub_distrib())]))
  let t1788 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)")))
  let t1785 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) + (n : Num) == (q : Num) * n → x == q * n - 1 * n")))
  let t1787 = @tactics.disch_then(fn(x1786 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1782 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1783 = @tactics.mp_tac(x1782)
      fn(x1784 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1783(x1784)
      }
    })(t1785(x1786))
  })
  let t1800 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1787), t1788), t1789), t1790), t1793), t1794), t1795), t1796), t1797), t1798), t1799), @int.arith_tac), @tactics.all_tac])
  let t1781 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (n : Num)"))
  let t1780 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.right_sub_distrib())]))
  let t1777 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) + ((b : Num) + (c : Num)) == (d : Num) → a + c == d - b")))
  let t1779 = @tactics.disch_then(fn(x1778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1775 = @tactics.mp_tac(x1774)
      fn(x1776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1775(x1776)
      }
    })(t1777(x1778))
  })
  let t1773 = @simp.asm_simp_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses(), x_inj()]))
  let t1772 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Num) == 0"))
  let t1771 = @tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), (j : Num)) == (q : Num) * X(a, (n : Num)) + X(a, (i : Num))"))
  let t1770 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q1 : Num)"))(fn(x1767 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1768 = @tactics.mp_tac(x1767)
    fn(x1769 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1768(x1769)
    }
  }))
  let t1766 = @simp.asm_rewrite_tac(@list.List([]))
  let t1764 = @term_syntax.parse_term("(j : Num)")
  let t1765 = @term_syntax.parse_term("(n : Num)")
  let t1900 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1765, t1764]), x_congruent_2nj_neg())), t1766), t1770), t1771), t1772), t1773), @tactics.disch_tac), t1779), t1780), t1781), t1800), t1801), t1806), t1807), @tactics.disch_tac), @tactics.disch_tac), t1808), t1857), t1858), t1859), t1860), @tactics.conj_tac), t1866), t1867), t1868), @tactics.conj_tac), t1875), t1879), t1881), t1891), t1893), t1894), t1895), t1896), t1897), @tactics.disj1_tac), t1898), t1899), @int.arith_tac), @tactics.all_tac])
  let t1763 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Num) <= (n : Num)"))
  let t1761 = @simp.asm_simp_tac(@list.List([@arith.le(), @arith.mult_clauses()]))
  let t1760 = @tactics.undisch_tac(@term_syntax.parse_term("(j : Num) <= 2 * (n : Num)"))
  let t1762 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(i : Num) <= (j : Num)")), t1760), t1761), @tactics.all_tac])
  let t1759 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1757 = @simp.asm_simp_tac(@list.List([x_increases_le(), @arith.le_0()]))
  let t1756 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(x_clauses()))]))
  let t1755 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((x : Num) == 0) → 1 <= x"))]))
  let t1754 = @simp.simp_tac(@list.List([@arith.le_mult_rcancel()]))
  let t1753 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("1 <= (b : Num) && 1 * (x : Num) <= (qx : Num) → !(qx + b <= x)")))
  let t1752 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)")))
  let t1751 = @simp.asm_rewrite_tac(@list.List([]))
  let t1748 = @term_syntax.parse_term("(n : Num)")
  let t1749 = @term_syntax.parse_term("(j : Num)")
  let t1750 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1749, t1748]), x_increases_le()))
  let t1747 = @simp.asm_simp_tac(@list.List([@arith.add_clauses(), @arith.mult_clauses(), x_inj()]))
  let t1746 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Num) == 0"))
  let t1745 = @tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), (j : Num)) == (q : Num) * X(a, (n : Num)) + X(a, (i : Num))"))
  let t1744 = @list.List([@meson.asm_meson_tac(@list.List([@arith.lte_trans(), @arith.lt_le()])), @tactics.all_tac])
  let t1743 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) < (n : Num)"), fn(x1740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1741 = @tactics.assume_tac(x1740)
    fn(x1742 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1741(x1742)
    }
  })
  let t1739 = @simp.asm_rewrite_tac(@list.List([]))
  let t1758 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(i : Num) == (j : Num)")), t1739), t1743), t1744), t1745), t1746), t1747), @tactics.disch_tac), t1750), t1751), t1752), t1753), t1754), t1755), t1756), t1757), @tactics.all_tac])
  let t1738 = @class.asm_cases_tac(@term_syntax.parse_term("(j : Num) <= (n : Num)"))
  let t1953 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1738), t1758), t1759), t1762), t1763), t1900), t1903), t1904), t1908), t1911), @tactics.ants_tac), t1913), t1917), t1918), t1919), t1925), t1926), t1932), @tactics.ants_tac), t1935), t1937), t1938), t1942), t1943), t1944), @tactics.conj_tac), t1949), t1950), t1951), t1952)
  step_down_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ i : Num, ∀ j : Num, ∀ n : Num, ∀ q : Num, !(a == 0) && !(a == 1) && i <= j && j <= 2 * n && X(a, j) == q * X(a, n) + X(a, i) → i == j || a == 2 && n == 1 && i == 0 && j == 2"), t1953))
}

///|
let step_down_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_DOWN_LEMMA")

///|
/// `STEP_DOWN_LEMMA`
pub fn step_down_lemma() -> @kernel.Thm {
  step_down_lemma_c.get()
}

///|
/// STEP_DOWN_LEMMA_4_ASYM
fn step_50() -> Unit raise {
  let t2038 = @tactics.undisch_tac(@term_syntax.parse_term("(j : Num) < 4 * (n : Num)"))
  let t2037 = @tactics.disch_then(fn(x2036 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2033 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2034 = @tactics.subst1_tac(x2033)
      fn(x2035 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2034(x2035)
      }
    })(@equal.sym(x2036))
  })
  let t2032 = @simp.asm_rewrite_tac(@list.List([@arith.sub_eq_0(), @equal.gsym(@arith.not_lt())]))
  let t2030 = @tactics.undisch_tac(@term_syntax.parse_term("(i : Num) <= (n : Num)"))
  let t2031 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2030), @int.arith_tac), @tactics.all_tac])
  let t2026 = @term_syntax.parse_term("(q2 : Num) - ((q1 : Num) + (q : Num))")
  let t2027 = @term_syntax.parse_term("(n : Num)")
  let t2028 = @term_syntax.parse_term("(i : Num)")
  let t2029 = @term_syntax.parse_term("4 * (n : Num) - (j : Num)")
  let t2039 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2029, t2028, t2027, t2026]), step_down_lemma())), @tactics.ants_tac), t2031), t2032), t2037), @tactics.disj2_tac), t2038), @int.arith_tac)
  let t2025 = @tactics.undisch_tac(@term_syntax.parse_term("(j : Num) < 4 * (n : Num)"))
  let t2024 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < (i : Num) → !(i == 0)"))]))
  let t2022 = @tactics.undisch_tac(@term_syntax.parse_term("!((j : Num) <= 2 * (n : Num))"))
  let t2023 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2022), @int.arith_tac), @tactics.all_tac])
  let t2018 = @term_syntax.parse_term("(q1 : Num) + (q : Num) - (q2 : Num)")
  let t2019 = @term_syntax.parse_term("(n : Num)")
  let t2020 = @term_syntax.parse_term("4 * (n : Num) - (j : Num)")
  let t2021 = @term_syntax.parse_term("(i : Num)")
  let t2040 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2021, t2020, t2019, t2018]), step_down_lemma())), @tactics.ants_tac), t2023), t2024), @tactics.disch_tac), @tactics.disj2_tac), t2025), @int.arith_tac), t2039])
  let t2017 = @simp.asm_simp_tac(@list.List([x_increases_le()]))
  let t2015 = @equal.gsym(@arith.right_add_distrib())
  let t2016 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.right_sub_distrib()), t2015]))
  let t2011 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) + (q1 : Num) == (q2 : Num) + ((y : Num) + (q3 : Num)) → x <= y → y == q1 - (q2 + q3) + x")))
  let t2013 = @tactics.disch_then(fn(x2012 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2008 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2009 = @tactics.mp_tac(x2008)
      fn(x2010 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2009(x2010)
      }
    })(t2011(x2012))
  })
  let t2006 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) + (q1 : Num) == (q2 : Num) + ((y : Num) + (q3 : Num)) → y <= x → x == q2 + q3 - q1 + y")))
  let t2014 = @list.List([@tactics.disch_then(fn(x2007 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2003 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2004 = @tactics.mp_tac(x2003)
      fn(x2005 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2004(x2005)
      }
    })(t2006(x2007))
  }), t2013])
  let t1999 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) + (b : Num) == (c : Num) && (d : Num) + a == (e : Num) → b + e == c + d")))
  let t2001 = @tactics.disch_then(fn(x2000 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1996 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1997 = @tactics.mp_tac(x1996)
      fn(x1998 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1997(x1998)
      }
    })(t1999(x2000))
  })
  let t1995 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1994 = @tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), 2 * (n : Num) - (4 * n - (j : Num))) + X(a, 4 * n - j) == (q1 : Num) * X(a, n)"))
  let t1993 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("X((a : Num), (i : Num)) + (q : Num) * X(a, (n : Num)) == X(a, (j : Num))"))))
  let t1992 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q2 : Num)"))(fn(x1989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1990 = @tactics.mp_tac(x1989)
    fn(x1991 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1990(x1991)
    }
  }))
  let t1988 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q1 : Num)"))(fn(x1985 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1986 = @tactics.assume_tac(x1985)
    fn(x1987 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1986(x1987)
    }
  }))
  let t1984 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(j : Num) < 4 * (n : Num) && !(j <= 2 * n) → 2 * n + (2 * n - (4 * n - j)) == j"))]))
  let t1983 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((j : Num) <= 2 * (n : Num)) → 4 * n - j <= 2 * n"))]))
  let t1980 = @term_syntax.parse_term("4 * (n : Num) - (j : Num)")
  let t1981 = @term_syntax.parse_term("(n : Num)")
  let t1982 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1981, t1980]), x_congruent_2nj_neg()))
  let t1978 = @term_syntax.parse_term("2 * (n : Num) - (4 * n - (j : Num))")
  let t1979 = @term_syntax.parse_term("(n : Num)")
  let t2002 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1979, t1978]), x_congruent_2nj_pos())), t1982), t1983), t1984), t1988), t1992), t1993), t1994), t1995), t2001)
  let t1976 = @term_syntax.parse_term("4 * (n : Num) - (j : Num)")
  let t1977 = @tactics.disj_cases_tac(@bool.specl(@list.List([@term_syntax.parse_term("(i : Num)"), t1976]), @arith.le_cases()))
  let t1974 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < (i : Num) → !(i == 0)"))]))
  let t1972 = @simp.asm_simp_tac(@list.List([x_increases_lt(), @arith.not_le()]))
  let t1971 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))]))
  let t1970 = @list.List([@simp.asm_rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(@arith.le_add())])), @tactics.all_tac])
  let t1969 = @tactics.subgoal_then(@term_syntax.parse_term("X((a : Num), (i : Num)) <= X(a, (j : Num))"), fn(x1966 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1967 = @tactics.mp_tac(x1966)
    fn(x1968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1967(x1968)
    }
  })
  let t1965 = @tactics.disch_then(fn(x1964 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1961 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1962 = @tactics.assume_tac(x1961)
      fn(x1963 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1962(x1963)
      }
    })(@equal.sym(x1964))
  })
  let t1960 = @simp.simp_tac(@list.List([@arith.add_ac(), @arith.mult_ac()]))
  let t1959 = @tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), (i : Num)) + (q : Num) * X(a, (n : Num)) == X(a, (j : Num))"))
  let t1973 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1959), t1960), t1965), t1969), t1970), t1971), t1972), @tactics.all_tac])
  let t1955 = @term_syntax.parse_term("(q : Num)")
  let t1956 = @term_syntax.parse_term("(n : Num)")
  let t1957 = @term_syntax.parse_term("(j : Num)")
  let t1958 = @term_syntax.parse_term("(i : Num)")
  let t1975 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t1958, t1957, t1956, t1955]), step_down_lemma())), @tactics.ants_tac), t1973), t1974), @tactics.all_tac])
  let t1954 = @class.asm_cases_tac(@term_syntax.parse_term("(j : Num) <= 2 * (n : Num)"))
  let t2041 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1954), t1975), t1977), t2002), t2014), t2016), t2017), @tactics.disch_tac), t2040)
  step_down_lemma_4_asym_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ i : Num, ∀ j : Num, ∀ n : Num, ∀ q : Num, !(a == 0) && !(a == 1) && 0 < i && i <= n && j < 4 * n && X(a, i) + q * X(a, n) == X(a, j) → j == i || j == 4 * n - i"), t2041))
}

///|
let step_down_lemma_4_asym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_DOWN_LEMMA_4_ASYM")

///|
/// `STEP_DOWN_LEMMA_4_ASYM`
pub fn step_down_lemma_4_asym() -> @kernel.Thm {
  step_down_lemma_4_asym_c.get()
}

///|
/// STEP_DOWN_LEMMA_4
fn step_51() -> Unit raise {
  let t2074 = @simp.asm_simp_tac(@list.List([@arith.not_lt(), x_increases_le()]))
  let t2073 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@arith.not_lt()])))
  let t2072 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(i : Num) + (q1 : Num) == (j : Num) + (q2 : Num) && !(j < i) → i + (q1 - q2) == j")))
  let t2071 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib()]))
  let t2070 = @simp.asm_rewrite_tac(@list.List([]))
  let t2069 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2064 = @term_syntax.parse_term("(q1 : Num) - (q2 : Num)")
  let t2065 = @term_syntax.parse_term("(n : Num)")
  let t2066 = @term_syntax.parse_term("(j : Num)")
  let t2067 = @term_syntax.parse_term("(i : Num)")
  let t2068 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2067, t2066, t2065, t2064]), step_down_lemma_4_asym()))
  let t2062 = @simp.asm_simp_tac(@list.List([x_increases_le(), @arith.le_0()]))
  let t2061 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(x_clauses()))]))
  let t2060 = @simp.asm_simp_tac(@list.List([@arith.le_mult_rcancel(), @int.arith_rule(@term_syntax.parse_term("!((q2 : Num) - (q1 : Num) == 0) → 1 <= q2 - q1"))]))
  let t2059 = @simp.asm_simp_tac(@list.List([x_increases_le()]))
  let t2056 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(i : Num) == (j : Num) + (q : Num) * (n : Num) → 1 <= j && 1 * n <= q * n → !(i <= n)")))
  let t2058 = @tactics.disch_then(fn(x2057 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2053 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2054 = @tactics.mp_tac(x2053)
      fn(x2055 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2054(x2055)
      }
    })(t2056(x2057))
  })
  let t2052 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)")))
  let t2051 = @list.List([@simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses(), x_inj()])), @tactics.all_tac])
  let t2050 = @class.asm_cases_tac(@term_syntax.parse_term("(q2 : Num) - (q1 : Num) == 0"))
  let t2049 = @simp.asm_simp_tac(@list.List([x_increases_lt(), @equal.gsym(@arith.right_sub_distrib())]))
  let t2046 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) + (q1 : Num) == (y : Num) + (q2 : Num) → y < x → x == y + (q2 - q1)")))
  let t2048 = @tactics.disch_then(fn(x2047 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2043 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2044 = @tactics.mp_tac(x2043)
      fn(x2045 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2044(x2045)
      }
    })(t2046(x2047))
  })
  let t2063 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), (i : Num)) + (q1 : Num) * X(a, (n : Num)) == X(a, (j : Num)) + (q2 : Num) * X(a, n)")), t2048), t2049), t2050), t2051), t2052), t2058), t2059), t2060), t2061), t2062), @tactics.all_tac])
  let t2042 = @class.asm_cases_tac(@term_syntax.parse_term("(j : Num) < (i : Num)"))
  let t2075 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2042), t2063), t2068), t2069), t2070), t2071), t2072), t2073), t2074)
  step_down_lemma_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ i : Num, ∀ j : Num, ∀ n : Num, ∀ q1 : Num, ∀ q2 : Num, !(a == 0) && !(a == 1) && 0 < i && i <= n && j < 4 * n && X(a, i) + q1 * X(a, n) == X(a, j) + q2 * X(a, n) → j == i || j == 4 * n - i"), t2075))
}

///|
let step_down_lemma_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_DOWN_LEMMA_4")

///|
/// `STEP_DOWN_LEMMA_4`
pub fn step_down_lemma_4() -> @kernel.Thm {
  step_down_lemma_4_c.get()
}

///|
/// STEP_DOWN_LEMMA_STRONG_ASYM
fn step_52() -> Unit raise {
  let t2163 = @tactics.undisch_tac(@term_syntax.parse_term("(i : Num) <= (n : Num)"))
  let t2162 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t2161 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a' : Num) == (a : Num) && (i : Num) <= (b : Num) → a + (b - i + i) == a' + b")))
  let t2160 = @simp.asm_rewrite_tac(@list.List([]))
  let t2159 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc()), @arith.left_add_distrib(), @arith.mult_clauses()]))
  let t2158 = @tactics.undisch_then(@term_syntax.parse_term("(q : Num) * (4 * (n : Num)) + (k : Num) == (j : Num)"), fn(x2157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2154 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2155 = @tactics.subst1_tac(x2154)
      fn(x2156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2155(x2156)
      }
    })(@equal.sym(x2157))
  })
  let t2164 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @tactics.exists_tac(@term_syntax.parse_term("(q : Num) + 1"))), t2158), t2159), t2160), t2161), t2162), t2163), @int.arith_tac)
  let t2153 = @simp.asm_rewrite_tac(@list.List([@arith.mult_ac(), @arith.add_ac()]))
  let t2152 = @tactics.undisch_then(@term_syntax.parse_term("(q : Num) * (4 * (n : Num)) + (k : Num) == (j : Num)"), fn(x2151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2149 = @tactics.subst1_tac(x2148)
      fn(x2150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2149(x2150)
      }
    })(@equal.sym(x2151))
  })
  let t2165 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @tactics.exists_tac(@term_syntax.parse_term("(q : Num)"))), t2152), t2153), t2164])
  let t2147 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t2145 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_lt())]))
  let t2144 = @tactics.match_mp_tac(x_increases_le())
  let t2143 = @simp.rewrite_tac(@list.List([@arith.not_lt()]))
  let t2142 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2141 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.right_sub_distrib())]))
  let t2138 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) + (q1 : Num) == (q2 : Num) + (b : Num) → !(b < a) → a + (q1 - q2) == b")))
  let t2140 = @tactics.disch_then(fn(x2139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2136 = @tactics.mp_tac(x2135)
      fn(x2137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2136(x2137)
      }
    })(t2138(x2139))
  })
  let t2134 = @tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), (i : Num)) + (c : Num) * X(a, (n : Num)) == (q1 : Num) * X(a, n) + X(a, (k : Num))"))
  let t2146 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2134), t2140), t2141), t2142), t2143), t2144), t2145), @tactics.all_tac])
  let t2130 = @term_syntax.parse_term("(c : Num) - (q1 : Num)")
  let t2131 = @term_syntax.parse_term("(n : Num)")
  let t2132 = @term_syntax.parse_term("(k : Num)")
  let t2133 = @term_syntax.parse_term("(i : Num)")
  let t2166 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2133, t2132, t2131, t2130]), step_down_lemma_4_asym())), @tactics.ants_tac), t2146), t2147), t2165)
  let t2125 = @simp.asm_simp_tac(@list.List([x_increases_le(), @arith.le_0()]))
  let t2124 = @bool.conjunct1(x_clauses())
  let t2126 = @tactics.then_tac(@tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(a : Num)"), t2124))), t2125)
  let t2123 = @simp.asm_simp_tac(@list.List([x_increases_le(), @arith.lt_imp_le()]))
  let t2122 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t2121 = @tactics.match_mp_tac(@arith.le_mult2())
  let t2127 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2118 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2119 = @equal.land_conv(x2118)
    fn(x2120 : @kernel.Term) -> @kernel.Thm raise {
      s2119(x2120)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == 1 * n"))])), t2121), t2122), t2123), t2126])
  let t2117 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) && 1 <= (c : Num) → !(a == b + c)")))
  let t2128 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)"))), t2117), @tactics.conj_tac), t2127)
  let t2116 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @arith.mult_ac()]))
  let t2115 = @tactics.first_assum(fn(x2110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2110
    @simp.gen_rewrite_tac(fn(x2112 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2113 = @equal.land_conv(x2112)
      fn(x2114 : @kernel.Term) -> @kernel.Thm raise {
        s2113(x2114)
      }
    }, @list.List([@equal.sym(th)]))
  })
  let t2109 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num)"))
  let t2129 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses(), x_inj()])), @tactics.disch_tac), @tactics.disj1_tac), t2109), t2115), t2116), t2128])
  let t2108 = @class.asm_cases_tac(@term_syntax.parse_term("(q1 : Num) - (c : Num) == 0"))
  let t2107 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.right_sub_distrib())]))
  let t2106 = @simp.asm_simp_tac(@list.List([x_increases_lt()]))
  let t2103 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) + (q1 : Num) == (q2 : Num) + (b : Num) → b < a → a == q2 - q1 + b")))
  let t2105 = @tactics.disch_then(fn(x2104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2101 = @tactics.mp_tac(x2100)
      fn(x2102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2101(x2102)
      }
    })(t2103(x2104))
  })
  let t2167 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), (i : Num)) + (c : Num) * X(a, (n : Num)) == (q1 : Num) * X(a, n) + X(a, (k : Num))")), t2105), t2106), t2107), t2108), t2129), t2166])
  let t2099 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) < (i : Num)"))
  let t2098 = @tactics.disch_then(fn(x2095 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2096 = @tactics.subst_all_tac(x2095)
    fn(x2097 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2096(x2097)
    }
  })
  let t2094 = @simp.asm_rewrite_tac(@list.List([]))
  let t2093 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("4 * ((q : Num) * (n : Num)) + (k : Num) == q * (4 * n) + k")))
  let t2092 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q1 : Num)"))(fn(x2089 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2090 = @tactics.mp_tac(x2089)
    fn(x2091 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2090(x2091)
    }
  }))
  let t2088 = @simp.asm_rewrite_tac(@list.List([]))
  let t2084 = @term_syntax.parse_term("(k : Num)")
  let t2085 = @term_syntax.parse_term("(n : Num)")
  let t2086 = @term_syntax.parse_term("(q : Num)")
  let t2087 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2086, t2085, t2084]), x_congruent_4mnj_pos()))
  let t2083 = @tactics.disch_then(fn(x2082 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x2082))
  })
  let t2080 = @tactics.undisch_tac(@term_syntax.parse_term("(i : Num) <= (n : Num)"))
  let t2081 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("0 < (i : Num)")), t2080), @int.arith_tac), @tactics.all_tac])
  let t2079 = @simp.abbrev_tac(@term_syntax.parse_term("(k : Num) == MOD((j : Num), 4 * (n : Num))"))
  let t2078 = @simp.abbrev_tac(@term_syntax.parse_term("(q : Num) == DIV((j : Num), 4 * (n : Num))"))
  let t2076 = @term_syntax.parse_term("4 * (n : Num)")
  let t2077 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(j : Num)"), t2076]), @arith.division()))
  let t2168 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2077), t2078), t2079), @tactics.ants_tac), t2081), t2083), t2087), t2088), t2092), t2093), t2094), t2098), t2099), t2167)
  step_down_lemma_strong_asym_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ i : Num, ∀ j : Num, ∀ n : Num, ∀ c : Num, !(a == 0) && !(a == 1) && 0 < i && i <= n && X(a, i) + c * X(a, n) == X(a, j) → (∃ q : Num, j == i + 4 * (n * q)) || (∃ q : Num, j + i == 4 * (n * q))"), t2168))
}

///|
let step_down_lemma_strong_asym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_DOWN_LEMMA_STRONG_ASYM")

///|
/// `STEP_DOWN_LEMMA_STRONG_ASYM`
pub fn step_down_lemma_strong_asym() -> @kernel.Thm {
  step_down_lemma_strong_asym_c.get()
}

///|
/// STEP_DOWN_LEMMA_STRONG
fn step_53() -> Unit raise {
  let t2205 = @simp.asm_simp_tac(@list.List([@arith.not_lt(), x_increases_le()]))
  let t2204 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@arith.not_lt()])))
  let t2203 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(i : Num) + (q1 : Num) == (j : Num) + (q2 : Num) && !(j < i) → i + (q1 - q2) == j")))
  let t2202 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib()]))
  let t2201 = @simp.asm_rewrite_tac(@list.List([]))
  let t2200 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2195 = @term_syntax.parse_term("(c1 : Num) - (c2 : Num)")
  let t2196 = @term_syntax.parse_term("(n : Num)")
  let t2197 = @term_syntax.parse_term("(j : Num)")
  let t2198 = @term_syntax.parse_term("(i : Num)")
  let t2199 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2198, t2197, t2196, t2195]), step_down_lemma_strong_asym()))
  let t2193 = @simp.asm_simp_tac(@list.List([x_increases_le(), @arith.le_0()]))
  let t2192 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(x_clauses()))]))
  let t2191 = @simp.asm_simp_tac(@list.List([@arith.le_mult_rcancel(), @int.arith_rule(@term_syntax.parse_term("!((q2 : Num) - (q1 : Num) == 0) → 1 <= q2 - q1"))]))
  let t2190 = @simp.asm_simp_tac(@list.List([x_increases_le()]))
  let t2187 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(i : Num) == (j : Num) + (q : Num) * (n : Num) → 1 <= j && 1 * n <= q * n → !(i <= n)")))
  let t2189 = @tactics.disch_then(fn(x2188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2185 = @tactics.mp_tac(x2184)
      fn(x2186 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2185(x2186)
      }
    })(t2187(x2188))
  })
  let t2183 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)")))
  let t2181 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t2180 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t2179 = @tactics.disch_then(fn(x2178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2182 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses(), x_inj()])), t2179), @tactics.disj1_tac), t2180), t2181), @tactics.all_tac])
  let t2177 = @class.asm_cases_tac(@term_syntax.parse_term("(c2 : Num) - (c1 : Num) == 0"))
  let t2176 = @simp.asm_simp_tac(@list.List([x_increases_lt(), @equal.gsym(@arith.right_sub_distrib())]))
  let t2173 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) + (q1 : Num) == (y : Num) + (q2 : Num) → y < x → x == y + (q2 - q1)")))
  let t2175 = @tactics.disch_then(fn(x2174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2171 = @tactics.mp_tac(x2170)
      fn(x2172 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2171(x2172)
      }
    })(t2173(x2174))
  })
  let t2194 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("X((a : Num), (i : Num)) + (c1 : Num) * X(a, (n : Num)) == X(a, (j : Num)) + (c2 : Num) * X(a, n)")), t2175), t2176), t2177), t2182), t2183), t2189), t2190), t2191), t2192), t2193), @tactics.all_tac])
  let t2169 = @class.asm_cases_tac(@term_syntax.parse_term("(j : Num) < (i : Num)"))
  let t2206 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2169), t2194), t2199), t2200), t2201), t2202), t2203), t2204), t2205)
  step_down_lemma_strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ i : Num, ∀ j : Num, ∀ n : Num, ∀ c1 : Num, ∀ c2 : Num, !(a == 0) && !(a == 1) && 0 < i && i <= n && X(a, i) + c1 * X(a, n) == X(a, j) + c2 * X(a, n) → (∃ q : Num, j == i + 4 * (n * q)) || (∃ q : Num, j + i == 4 * (n * q))"), t2206))
}

///|
let step_down_lemma_strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_DOWN_LEMMA_STRONG")

///|
/// `STEP_DOWN_LEMMA_STRONG`
pub fn step_down_lemma_strong() -> @kernel.Thm {
  step_down_lemma_strong_c.get()
}

///|
/// Y_DIOPH
fn step_54() -> Unit raise {
  let t2679 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(@arith.le_add())]))
  let t2678 = @simp.asm_simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2676 = @term_syntax.parse_term("(k : Num)")
  let t2677 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2676]), y_n_moda1()))
  let t2675 = @simp.rewrite_tac(@list.List([@arith.mult_ac(), @arith.add_ac()]))
  let t2674 = @tactics.exists_tac(@term_syntax.parse_term("(q8 : Num) * (p : Num)"))
  let t2673 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q8 : Num)"))(fn(x2670 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2671 = @tactics.subst1_tac(x2670)
    fn(x2672 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2671(x2672)
    }
  }))
  let t2669 = @simp.asm_rewrite_tac(@list.List([]))
  let t2668 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @arith.add_sub2(), @calc_num.arith_eq()]))
  let t2667 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("1 + (p : Num) * (4 * (y : Num)) == (b : Num)"))))
  let t2665 = @term_syntax.parse_term("(k : Num)")
  let t2666 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b : Num)"), t2665]), y_n_moda1()))
  let t2664 = @simp.asm_rewrite_tac(@list.List([]))
  let t2663 = @tactics.exists_tac(@term_syntax.parse_term("(c : Num)"))
  let t2662 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : Num)"))(fn(x2661 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2658 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2659 = @tactics.assume_tac(x2658)
      fn(x2660 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2659(x2660)
      }
    })(@equal.sym(x2661))
  }))
  let t2657 = @simp.asm_rewrite_tac(@list.List([]))
  let t2653 = @term_syntax.parse_term("(k : Num)")
  let t2654 = @term_syntax.parse_term("(u : Num)")
  let t2655 = @term_syntax.parse_term("(q : Num)")
  let t2656 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2655, t2654, t2653]), x_congruent()))
  let t2652 = @simp.simp_tac(@list.List([xy_are_solutions(), @kernel.assume_rule(@term_syntax.parse_term("!((b : Num) == 0)"))]))
  let t2650 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq()]))
  let t2649 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!(b : Bool) → (a : Bool) → b → !a"))]))
  let t2651 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("1 + (p : Num) * (4 * (y : Num)) == (b : Num)"), fn(x2648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2645 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2646 = @tactics.subst1_tac(x2645)
      fn(x2647 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2646(x2647)
      }
    })(@equal.sym(x2648))
  }), t2649), t2650), @tactics.all_tac])
  let t2644 = @tactics.subgoal_then(@term_syntax.parse_term("!((b : Num) == 0)"), fn(x2641 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2642 = @tactics.assume_tac(x2641)
    fn(x2643 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2642(x2643)
    }
  })
  let t2640 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("Y((b : Num), (k : Num)) == (t : Num)"))))
  let t2639 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("X((b : Num), (k : Num)) == (s : Num)"))))
  let t2638 = @simp.asm_rewrite_tac(@list.List([]))
  let t2637 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(r : Num) * EXP((y : Num), 2) == EXP(y, 2) * r")))
  let t2636 = @tactics.exists_tac(@term_syntax.parse_term("(t : Num)"))
  let t2635 = @tactics.exists_tac(@term_syntax.parse_term("(s : Num)"))
  let t2634 = @simp.abbrev_tac(@term_syntax.parse_term("(t : Num) == Y((b : Num), (k : Num))"))
  let t2633 = @simp.abbrev_tac(@term_syntax.parse_term("(s : Num) == X((b : Num), (k : Num))"))
  let t2632 = @simp.asm_rewrite_tac(@list.List([]))
  let t2631 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 + 4 * ((p : Num) * (y : Num)) == 1 + p * (4 * y)"))]))
  let t2628 = @term_syntax.parse_term("(q : Num)")
  let t2629 = @term_syntax.parse_term("(p : Num)")
  let t2630 = @tactics.map_every(fn(x2625 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2626 = @tactics.exists_tac(x2625)
    fn(x2627 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2626(x2627)
    }
  }, @list.List([@term_syntax.parse_term("(b : Num)"), t2629, t2628]))
  let t2622 = @tactics.x_choose_then(@term_syntax.parse_term("(q : Num)"))(fn(x2621 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x2621))
  })
  let t2623 = @tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(t2622)
  let t2624 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Num)"))(t2623))
  let t2617 = @meson.meson_tac(@list.List([@prime.divides_rmul(), @prime.divides_lmul()]))
  let t2616 = @simp.rewrite_tac(@list.List([@int.coprime(), @arith.exp_2()]))
  let t2615 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("EXP((y : Num), 2) * (r : Num) == (v : Num)"))))
  let t2614 = @simp.asm_rewrite_tac(@list.List([]))
  let t2613 = @term_syntax.parse_term("(m : Num)")
  let t2618 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2613]), xy_coprime())), t2614), t2615), t2616), t2617)
  let t2610 = @simp.rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t2609 = @simp.simp_tac(@list.List([@prime.coprime_1()]))
  let t2611 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@prime.coprime_sym()])), t2609)
  let t2608 = @simp.simp_tac(@list.List([@int.divides(), @theorems.left_imp_exists_thm(), @arith.odd_mult(), @calc_num.arith_odd()]))
  let t2607 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))]))
  let t2612 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ODD((u : Num))")), t2607), t2608), t2611, t2610])
  let t2606 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2605 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(b : Bool) && ((a : Bool) → (d : Bool)) && ((c : Bool) → d) → a || b || c → d")))
  let t2604 = @simp.rewrite_tac(@list.List([@prime.prime_2()]))
  let t2602 = @term_syntax.parse_term("2")
  let t2603 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(u : Num)"), t2602]), @prime.prime_coprime()))
  let t2601 = @simp.rewrite_tac(@list.List([]))
  let t2600 = @tactics.match_mp_tac(@prime.coprime_mul())
  let t2619 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@equal.sym(@calc_num.num_reduce_conv(@term_syntax.parse_term("2 * 2")))), t2600), t2601), t2603), t2604), t2605), t2606), t2612), t2618])
  let t2599 = @tactics.match_mp_tac(@prime.coprime_mul())
  let t2598 = @simp.once_rewrite_tac(@list.List([@prime.coprime_sym()]))
  let t2597 = @simp.asm_rewrite_tac(@list.List([@arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t2596 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_odd()]))
  let t2595 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Num) == 0"))
  let t2594 = @tactics.undisch_tac(@term_syntax.parse_term("ODD((u : Num))"))
  let t2620 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@prime.chinese_remainder()), t2594), t2595), t2596), @tactics.disch_tac), t2597), t2598), t2599), @tactics.conj_tac), t2619), @tactics.all_tac])
  let t2593 = @tactics.subgoal_then(@term_syntax.parse_term("∃ b0 : Num, ∃ q6 : Num, ∃ q7 : Num, b0 == 1 + q6 * (4 * (y : Num)) && b0 == (a : Num) + q7 * (u : Num)"), fn(x2590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2591 = @tactics.mp_tac(x2590)
    fn(x2592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2591(x2592)
    }
  })
  let t2588 = @simp.rewrite_tac(@list.List([@arith.even_add(), @arith.even_mult(), @calc_num.arith_even()]))
  let t2587 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("2 * ((k : Num) * Y((a : Num), k)) == (m : Num)"))))
  let t2586 = @simp.simp_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("!((a : Num) == 0)")), @theorems.left_imp_exists_thm()]))
  let t2584 = @term_syntax.parse_term("(m : Num)")
  let t2585 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2584]), y_n_mod2()))
  let t2583 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (m : Num)) == (v : Num)"))))
  let t2582 = @tactics.subgoal_then(@term_syntax.parse_term("EVEN((v : Num))"), fn(x2580 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2580
    @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_even()), th_2]))
  })
  let t2579 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @arith.even_add(), @arith.even_mult(), @calc_num.arith_even()]))
  let t2575 = @term_syntax.parse_term("EVEN")
  let t2578 = @tactics.disch_then(fn(x2577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2572 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2573 = @tactics.mp_tac(x2572)
      fn(x2574 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2573(x2574)
      }
    })(((x2576 : @kernel.Thm) => @equal.ap_term(t2575, x2576))(x2577))
  })
  let t2589 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(EXP((a : Num), 2) - 1) * EXP((v : Num), 2) + 1 == EXP((u : Num), 2)")), t2578), t2579), t2582), t2583), t2585), t2586), t2587), t2588), @tactics.all_tac])
  let t2571 = @tactics.subgoal_then(@term_syntax.parse_term("ODD((u : Num))"), fn(x2568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2569 = @tactics.assume_tac(x2568)
    fn(x2570 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2569(x2570)
    }
  })
  let t2567 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((r : Num) == 0) → 0 < r"))]))
  let t2565 = @simp.asm_rewrite_tac(@list.List([y_clauses()]))
  let t2564 = @tactics.undisch_tac(@term_syntax.parse_term("Y((a : Num), (k : Num)) == (y : Num)"))
  let t2562 = @simp.rewrite_tac(@list.List([y_clauses(), @theorems.eq_sym()]))
  let t2561 = @simp.simp_tac(@list.List([y_inj(), @kernel.assume_rule(@term_syntax.parse_term("!((a : Num) == 0)"))]))
  let t2560 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(y_clauses()))]))
  let t2559 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(m : Num) == 0")), @arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t2563 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("2 * ((k : Num) * Y((a : Num), k)) == (m : Num)")), t2559), t2560), t2561), t2562), @tactics.all_tac])
  let t2558 = @tactics.subgoal_then(@term_syntax.parse_term("(k : Num) == 0"), fn(x2555 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2556 = @tactics.assume_tac(x2555)
    fn(x2557 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2556(x2557)
    }
  })
  let t2553 = @simp.rewrite_tac(@list.List([y_clauses()]))
  let t2552 = @simp.simp_tac(@list.List([y_inj(), @kernel.assume_rule(@term_syntax.parse_term("!((a : Num) == 0)"))]))
  let t2551 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(y_clauses()))]))
  let t2554 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("Y((a : Num), (m : Num)) == 0")), t2551), t2552), t2553), @tactics.all_tac])
  let t2550 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) == 0"), fn(x2547 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2548 = @tactics.assume_tac(x2547)
    fn(x2549 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2548(x2549)
    }
  })
  let t2546 = @simp.asm_rewrite_tac(@list.List([]))
  let t2545 = @tactics.undisch_tac(@term_syntax.parse_term("Y((a : Num), (m : Num)) == (v : Num)"))
  let t2544 = @simp.rewrite_tac(@list.List([@arith.lt_refl()]))
  let t2543 = @tactics.disch_then(fn(x2542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2540 = @tactics.assume_tac(x2539)
      fn(x2541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2540(x2541)
      }
    })(@equal.sym(x2542))
  })
  let t2538 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t2566 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("EXP((y : Num), 2) * (r : Num) == (v : Num)")), t2538), t2543), t2544), t2545), t2546), @tactics.disch_tac), t2550), t2554), t2558), t2563), t2564), t2565), @tactics.all_tac])
  let t2537 = @class.asm_cases_tac(@term_syntax.parse_term("(r : Num) == 0"))
  let t2536 = @simp.asm_rewrite_tac(@list.List([]))
  let t2535 = @tactics.exists_tac(@term_syntax.parse_term("(r : Num)"))
  let t2534 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Num)"))(fn(x2533 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2530 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2531 = @tactics.assume_tac(x2530)
      fn(x2532 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2531(x2532)
      }
    })(@equal.sym(x2533))
  }))
  let t2529 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t2527 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t2526 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t2525 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t2524 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("2 * ((k : Num) * Y((a : Num), k)) == (m : Num)"))))
  let t2523 = @simp.simp_tac(@list.List([y2_divides(), @kernel.assume_rule(@term_syntax.parse_term("!((a : Num) == 0)"))]))
  let t2522 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (k : Num)) == (y : Num)"))))
  let t2528 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (m : Num)) == (v : Num)")))), t2522), t2523), t2524), t2525), t2526), t2527), @tactics.all_tac])
  let t2521 = @tactics.subgoal_then(@term_syntax.parse_term("divides(EXP((y : Num), 2), (v : Num))"), fn(x2518 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2519 = @tactics.mp_tac(x2518)
    fn(x2520 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2519(x2520)
    }
  })
  let t2517 = @simp.asm_rewrite_tac(@list.List([]))
  let t2516 = @tactics.exists_tac(@term_syntax.parse_term("(v : Num)"))
  let t2515 = @tactics.exists_tac(@term_syntax.parse_term("(u : Num)"))
  let t2513 = @simp.simp_tac(@list.List([xy_are_solutions(), @kernel.assume_rule(@term_syntax.parse_term("!((a : Num) == 0)"))]))
  let t2514 = @list.List([@tactics.then_tac(@tactics.map_every(@analysis.expand_tac, @list.List(["u", "v"])), t2513), @tactics.all_tac])
  let t2512 = @tactics.subgoal_then(@term_syntax.parse_term("EXP((u : Num), 2) == (EXP((a : Num), 2) - 1) * EXP((v : Num), 2) + 1"), fn(x2511 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2509 = @tactics.assume_tac(x2508)
      fn(x2510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2509(x2510)
      }
    })(@equal.sym(x2511))
  })
  let t2507 = @simp.abbrev_tac(@term_syntax.parse_term("(v : Num) == Y((a : Num), (m : Num))"))
  let t2506 = @simp.abbrev_tac(@term_syntax.parse_term("(u : Num) == X((a : Num), (m : Num))"))
  let t2505 = @simp.abbrev_tac(@term_syntax.parse_term("(m : Num) == 2 * ((k : Num) * Y((a : Num), k))"))
  let t2504 = @simp.asm_rewrite_tac(@list.List([]))
  let t2503 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num)"))
  let t2501 = @simp.simp_tac(@list.List([xy_are_solutions(), @kernel.assume_rule(@term_syntax.parse_term("!((a : Num) == 0)"))]))
  let t2502 = @list.List([@tactics.then_tac(@tactics.map_every(@analysis.expand_tac, @list.List(["x", "y"])), t2501), @tactics.all_tac])
  let t2500 = @tactics.subgoal_then(@term_syntax.parse_term("EXP((x : Num), 2) == (EXP((a : Num), 2) - 1) * EXP((y : Num), 2) + 1"), fn(x2499 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2497 = @tactics.assume_tac(x2496)
      fn(x2498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2497(x2498)
      }
    })(@equal.sym(x2499))
  })
  let t2495 = @simp.abbrev_tac(@term_syntax.parse_term("(x : Num) == X((a : Num), (k : Num))"))
  let t2494 = @tactics.disch_then(fn(x2493 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2491 = @tactics.assume_tac(x2490)
      fn(x2492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2491(x2492)
      }
    })(@equal.sym(x2493))
  })
  let t2486 = @tactics.undisch_tac(@term_syntax.parse_term("!((q6 : Num) == 0)"))
  let t2485 = @simp.asm_rewrite_tac(@list.List([]))
  let t2484 = @simp.rewrite_tac(@list.List([@arith.mult_assoc(), @arith.lt_mult_rcancel()]))
  let t2483 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("2 * (y : Num) < (ay : Num) → (i : Num) <= y → (k : Num) <= y → i + k == ay → i == k")))
  let t2482 = @tactics.subst1_tac(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (i : Num)) == (y : Num)")))
  let t2481 = @tactics.undisch_tac(@term_syntax.parse_term("(i : Num) <= Y((a : Num), i)"))
  let t2480 = @tactics.undisch_tac(@term_syntax.parse_term("(k : Num) <= Y((a : Num), (i : Num))"))
  let t2479 = @simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_eq_0()]))
  let t2478 = @class.asm_cases_tac(@term_syntax.parse_term("(q6 : Num) == 0"))
  let t2487 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q6 : Num)"))(fn(x2475 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2476 = @tactics.mp_tac(x2475)
    fn(x2477 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2476(x2477)
    }
  })), t2478), t2479), t2480), t2481), t2482), t2483), t2484), t2485), t2486), @int.arith_tac)
  let t2472 = @simp.asm_simp_tac(@list.List([@arith.eq_add_rcancel()]))
  let t2471 = @tactics.undisch_tac(@term_syntax.parse_term("(q5 : Num) < (q4 : Num)"))
  let t2470 = @simp.asm_rewrite_tac(@list.List([@arith.lt_mult_rcancel()]))
  let t2469 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("1 * (y : Num) < (k : Num) * y → !((i : Num) + k * y <= y)")))
  let t2468 = @tactics.disch_then(fn(x2465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2466 = @tactics.subst1_tac(x2465)
    fn(x2467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2466(x2467)
    }
  })
  let t2464 = @simp.asm_rewrite_tac(@list.List([]))
  let t2463 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → !(b : Bool)) → b → a → (c : Bool)")))
  let t2462 = @tactics.undisch_tac(@term_syntax.parse_term("(i : Num) <= Y((a : Num), i)"))
  let t2461 = @simp.asm_rewrite_tac(@list.List([@arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t2460 = @simp.rewrite_tac(@list.List([@arith.mult_assoc(), @arith.lt_mult_rcancel(), @equal.gsym(@arith.right_sub_distrib())]))
  let t2458 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(k : Num) + (q4 : Num) == (i : Num) + (q5 : Num) → q5 < q4 → i == k + (q4 - q5)")))
  let t2473 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2459 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2455 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2456 = @tactics.mp_tac(x2455)
      fn(x2457 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2456(x2457)
      }
    })(t2458(x2459))
  }), t2460), t2461), t2462), t2463), t2464), t2468), t2469), t2470), t2471), @int.arith_tac)
  let t2454 = @tactics.undisch_tac(@term_syntax.parse_term("(q4 : Num) < (q5 : Num)"))
  let t2453 = @simp.asm_rewrite_tac(@list.List([@arith.lt_mult_rcancel()]))
  let t2452 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("1 * (y : Num) < (k : Num) * y → !((i : Num) + k * y <= y)")))
  let t2451 = @tactics.disch_then(fn(x2448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2449 = @tactics.subst1_tac(x2448)
    fn(x2450 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2449(x2450)
    }
  })
  let t2447 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → !(b : Bool)) → b → a → (c : Bool)")))
  let t2446 = @tactics.undisch_tac(@term_syntax.parse_term("(k : Num) <= (y : Num)"))
  let t2445 = @simp.asm_rewrite_tac(@list.List([@arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t2444 = @simp.rewrite_tac(@list.List([@arith.mult_assoc(), @arith.lt_mult_rcancel(), @equal.gsym(@arith.right_sub_distrib())]))
  let t2442 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(k : Num) + (q4 : Num) == (i : Num) + (q5 : Num) → q4 < q5 → k == i + (q5 - q4)")))
  let t2474 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2440 = @tactics.mp_tac(x2439)
      fn(x2441 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2440(x2441)
      }
    })(t2442(x2443))
  }), t2444), t2445), t2446), t2447), t2451), t2452), t2453), t2454), @int.arith_tac), t2473, t2472])
  let t2436 = @term_syntax.parse_term("(q5 : Num)")
  let t2437 = @bool.specl(@list.List([@term_syntax.parse_term("(q4 : Num)"), t2436]), @arith.lt_cases())
  let t2438 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x2433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2434 = @tactics.assume_tac(x2433)
    fn(x2435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2434(x2435)
    }
  })(t2437)
  let t2432 = @tactics.x_choose_then(@term_syntax.parse_term("(q5 : Num)"))(fn(x2429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2430 = @tactics.mp_tac(x2429)
    fn(x2431 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2430(x2431)
    }
  })
  let t2488 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q4 : Num)"))(t2432)), t2438), t2474), t2487])
  let t2428 = @tactics.disch_then(@tactics.disj_cases_then(fn(x2425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2426 = @tactics.mp_tac(x2425)
    fn(x2427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2426(x2427)
    }
  }))
  let t2423 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(@arith.le_add())]))
  let t2422 = @simp.asm_simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2421 = @term_syntax.parse_term("(i : Num)")
  let t2424 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2421]), y_n_moda1())), t2422), t2423), @tactics.all_tac])
  let t2420 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) <= Y((a : Num), i)"), fn(x2417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2418 = @tactics.assume_tac(x2417)
    fn(x2419 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2418(x2419)
    }
  })
  let t2416 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t2415 = @tactics.subgoal_then(@term_syntax.parse_term("(k : Num) <= Y((a : Num), (i : Num))"), fn(x2412 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2413 = @tactics.assume_tac(x2412)
    fn(x2414 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2413(x2414)
    }
  })
  let t2408 = @tactics.exists_tac(@term_syntax.parse_term("(d3 : Num) * (p : Num) + (d4 : Num) - (d : Num)"))
  let t2407 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t2406 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(d3 : Num) * (4 * (p : Num)) + (d4 : Num) * 4 - 4 * (x : Num) == (d3 * p + d4 - x) * 4"))]))
  let t2405 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t2403 = @equal.gsym(@arith.right_sub_distrib())
  let t2404 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.right_add_distrib()), @arith.mult_assoc(), t2403]))
  let t2402 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (i : Num)) == (y : Num)"))))
  let t2401 = @tactics.disch_then(fn(x2398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2399 = @tactics.subst1_tac(x2398)
    fn(x2400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2399(x2400)
    }
  })
  let t2395 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(k : Num) + ((q1 : Num) + (i : Num)) == (q2 : Num) → i + k == q2 - q1")))
  let t2397 = @tactics.disch_then(fn(x2396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2393 = @tactics.mp_tac(x2392)
      fn(x2394 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2393(x2394)
      }
    })(t2395(x2396))
  })
  let t2391 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(d4 : Num)"))(fn(x2388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2389 = @tactics.subst1_tac(x2388)
    fn(x2390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2389(x2390)
    }
  }))
  let t2387 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc())]))
  let t2384 = @term_syntax.parse_term("(op_plus : (Num, Num) -> Num)")
  let t2381 = @term_syntax.parse_term("(i : Num)")
  let t2409 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2386 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2377 = @tactics.mp_tac(x2376)
        fn(x2378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2377(x2378)
        }
      })((fn(x2382 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x2379 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          fn(x2380 : @kernel.Term) -> @kernel.Thm raise {
            @equal.ap_thm(x2379, x2380)
          }
        })(x2382)(t2381)
      })(x2383))
    })(((x2385 : @kernel.Thm) => @equal.ap_term(t2384, x2385))(x2386))
  }), t2387), t2391), t2397), t2401), t2402), t2404), t2405), t2406), t2407), t2408), @tactics.refl_tac)
  let t2375 = @simp.rewrite_tac(@list.List([@arith.add_ac()]))
  let t2374 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t2373 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib()]))
  let t2372 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (i : Num)) == (y : Num)"))))
  let t2371 = @tactics.disch_then(fn(x2367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2367
    let t2370 = @tactics.mp_tac(th_1)
    let t2369 = @tactics.exists_tac(@term_syntax.parse_term("(d3 : Num) * (p : Num) + (d4 : Num)"))
    @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(d : Num)")), t2369), t2370)
  })
  let t2410 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(d4 : Num)"))(fn(x2364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2365 = @tactics.subst1_tac(x2364)
    fn(x2366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2365(x2366)
    }
  })), t2371), t2372), t2373), t2374), t2375), t2409])
  let t2363 = @tactics.undisch_tac(@term_syntax.parse_term("(k : Num) + 4 * ((d : Num) * (y : Num)) == (d3 : Num) * (4 * ((p : Num) * y)) + (j : Num)"))
  let t2362 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a1 : Bool) → (b1 : Bool)) && ((a2 : Bool) → (b2 : Bool)) → a1 || a2 → b1 || b2")))
  let t2411 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(∃ q : Num, (j : Num) == (i : Num) + q * (4 * Y((a : Num), i))) || (∃ q : Num, j + i == q * (4 * Y(a, i)))")), t2362), @tactics.conj_tac), @tactics.disch_tac), t2363), t2410), @tactics.all_tac])
  let t2361 = @tactics.subgoal_then(@term_syntax.parse_term("(∃ q1 : Num, ∃ q2 : Num, (k : Num) + q1 * (4 * Y((a : Num), (i : Num))) == i + q2 * (4 * Y(a, i))) || (∃ q : Num, i + k == q * (4 * Y(a, i)))"), fn(x2358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2359 = @tactics.mp_tac(x2358)
    fn(x2360 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2359(x2360)
    }
  })
  let t2357 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (i : Num)) == (y : Num)"))))
  let t2356 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(k : Num) + 4 * ((d : Num) * (y : Num)) == (t : Num)"))))
  let t2355 = @simp.rewrite_tac(@list.List([@arith.add_sub2()]))
  let t2354 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("1 + 4 * ((p : Num) * (y : Num)) == (b : Num)"))))
  let t2353 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d3 : Num)"))(fn(x2350 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2351 = @tactics.mp_tac(x2350)
    fn(x2352 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2351(x2352)
    }
  }))
  let t2349 = @simp.asm_rewrite_tac(@list.List([]))
  let t2347 = @term_syntax.parse_term("(j : Num)")
  let t2348 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b : Num)"), t2347]), y_n_moda1()))
  let t2345 = @tactics.then_tac(@tactics.first_x_assum(fn(x2344 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x2343 : @kernel.Thm) => @lib.check(fn(x2342 : @kernel.Thm) -> Bool raise {
      (fn(x2340 : @kernel.Term) -> Bool raise {
        @basics.is_disj(x2340)
      })((fn(x2341 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x2341)
      })(x2342))
    }, x2343))(x2344))
  }), @tactics.disch_tac)
  let t2338 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t2337 = @tactics.subst1_tac(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (i : Num)) == (y : Num)")))
  let t2336 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d2 : Num)"))(fn(x2333 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2333
    let t2335 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(i : Num) * ((d1 : Num) * (d2 : Num))")), t2335)
  }))
  let t2332 = @simp.rewrite_tac(@list.List([@theorems.or_exists_thm()]))
  let t2346 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x2331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2329 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2324 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2325 = @tactics.undisch_tac(x2324)
        fn(x2326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2325(x2326)
        }
      })(((x2328 : @kernel.Term) => @lib.check(fn(x2327 : @kernel.Term) -> Bool raise {
        @basics.is_disj(x2327)
      }, x2328))(x2329))
    })((fn(x2330 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x2330)
    })(x2331))
  }), t2332), t2336), t2337), t2338), t2345])
  let t2323 = @tactics.subgoal_then(@term_syntax.parse_term("(∃ q : Num, (j : Num) == (i : Num) + q * (4 * Y((a : Num), i))) || (∃ q : Num, j + i == q * (4 * Y(a, i)))"), fn(x2320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2321 = @tactics.mp_tac(x2320)
    fn(x2322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2321(x2322)
    }
  })
  let t2319 = @tactics.undisch_then(@term_syntax.parse_term("(i : Num) * (y : Num) * (d1 : Num) == (n : Num)"), fn(x2318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2316 = @tactics.subst1_tac(x2315)
      fn(x2317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2316(x2317)
      }
    })(@equal.sym(x2318))
  })
  let t2314 = @tactics.undisch_tac(@term_syntax.parse_term("(∃ q : Num, (j : Num) == (i : Num) + 4 * ((n : Num) * q)) || (∃ q : Num, j + i == 4 * (n * q))"))
  let t2313 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d1 : Num)"))(fn(x2312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2310 = @tactics.assume_tac(x2309)
      fn(x2311 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2310(x2311)
      }
    })(@equal.sym(x2312))
  }))
  let t2308 = @simp.rewrite_tac(@list.List([@bool.eqt_intro(@bool.spec_all(@arith.mult_sym()))]))
  let t2307 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(r : Num) * EXP((y : Num), 2) == (v : Num)"))))
  let t2303 = @term_syntax.parse_term("(r : Num)")
  let t2306 = @tactics.disch_then(fn(x2305 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2301 = @tactics.mp_tac(x2300)
      fn(x2302 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2301(x2302)
      }
    })(((x2304 : @kernel.Thm) => @bool.spec(t2303, x2304))(x2305))
  })
  let t2299 = @simp.rewrite_tac(@list.List([@int.divides(), @theorems.left_imp_exists_thm()]))
  let t2298 = @tactics.disch_then(fn(x2297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2296 : (@kernel.Thm, @kernel.Thm)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2293 = @tactics.mp_tac(x2292)
        fn(x2294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2293(x2294)
        }
      })((fn(x2295 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
        x2295.0
      })(x2296))
    })(@bool.eq_imp_rule(x2297))
  })
  let t2291 = @simp.asm_rewrite_tac(@list.List([]))
  let t2288 = @term_syntax.parse_term("(n : Num)")
  let t2289 = @term_syntax.parse_term("(i : Num)")
  let t2290 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2289, t2288]), y2_divides()))
  let t2286 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((i : Num) == 0) → 0 < i"))]))
  let t2283 = @term_syntax.parse_term("(q1 : Num)")
  let t2284 = @term_syntax.parse_term("(c : Num)")
  let t2285 = @tactics.map_every(fn(x2280 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2281 = @tactics.exists_tac(x2280)
    fn(x2282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2281(x2282)
    }
  }, @list.List([@term_syntax.parse_term("(a : Num)"), t2284, t2283]))
  let t2287 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(step_down_lemma_strong()), t2285), t2286), @tactics.all_tac])
  let t2279 = @tactics.subgoal_then(@term_syntax.parse_term("(∃ q : Num, (j : Num) == (i : Num) + 4 * ((n : Num) * q)) || (∃ q : Num, j + i == 4 * (n * q))"), fn(x2276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2277 = @tactics.assume_tac(x2276)
    fn(x2278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2277(x2278)
    }
  })
  let t2274 = @simp.simp_tac(@list.List([y_clauses(), @kernel.assume_rule(@term_syntax.parse_term("!((a : Num) == 0)"))]))
  let t2273 = @analysis.expand_tac("y")
  let t2272 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)"))]))
  let t2275 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((y : Num) == 0)")), t2272), t2273), t2274), @tactics.all_tac])
  let t2271 = @tactics.subgoal_then(@term_syntax.parse_term("!((i : Num) == 0)"), fn(x2268 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2269 = @tactics.assume_tac(x2268)
    fn(x2270 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2269(x2270)
    }
  })
  let t2267 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("X((a : Num), (n : Num)) == (u : Num)"))))
  let t2266 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("X((a : Num), (i : Num)) == (x : Num)"))))
  let t2265 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(x : Num) + (c : Num) * (u : Num) == (s : Num)"))))
  let t2264 = @tactics.subst1_tac(@kernel.assume_rule(@term_syntax.parse_term("X((b : Num), (j : Num)) == (s : Num)")))
  let t2263 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q1 : Num)"))(fn(x2260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2261 = @tactics.mp_tac(x2260)
    fn(x2262 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2261(x2262)
    }
  }))
  let t2258 = @kernel.assume_rule(@term_syntax.parse_term("(a : Num) + (q : Num) * (u : Num) == (b : Num)"))
  let t2259 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("!((a : Num) == 0)")), t2258]))
  let t2254 = @term_syntax.parse_term("(j : Num)")
  let t2255 = @term_syntax.parse_term("(u : Num)")
  let t2256 = @term_syntax.parse_term("(q : Num)")
  let t2257 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2256, t2255, t2254]), x_congruent()))
  let t2252 = @simp.asm_simp_tac(@list.List([@arith.not_le(), y_increases_lt()]))
  let t2251 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))]))
  let t2250 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (n : Num)) == (v : Num)"))))
  let t2249 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("Y((a : Num), (i : Num)) == (y : Num)"))))
  let t2253 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(y : Num) <= (v : Num)")), t2249), t2250), t2251), t2252), @tactics.all_tac])
  let t2248 = @tactics.subgoal_then(@term_syntax.parse_term("(i : Num) <= (n : Num)"), fn(x2245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2246 = @tactics.assume_tac(x2245)
    fn(x2247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2246(x2247)
    }
  })
  let t2243 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("0 < (r : Num) → !(r == 0)"))]))
  let t2242 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (a : Num)) == !(a == 0)")), @arith.mult_eq_0()]))
  let t2241 = @simp.rewrite_tac(@list.List([@arith.mult_assoc(), @arith.le_mult_rcancel()]))
  let t2240 = @simp.gen_rewrite_tac(fn(x2237 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2238 = @equal.land_conv(x2237)
    fn(x2239 : @kernel.Term) -> @kernel.Thm raise {
      s2238(x2239)
    }
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(y : Num) == 1 * y"))]))
  let t2236 = @simp.rewrite_tac(@list.List([@arith.exp_2()]))
  let t2244 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(r : Num) * EXP((y : Num), 2) == (v : Num)")))), t2236), t2240), t2241), @tactics.disj1_tac), t2242), t2243), @tactics.all_tac])
  let t2235 = @tactics.subgoal_then(@term_syntax.parse_term("(y : Num) <= (v : Num)"), fn(x2232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2233 = @tactics.assume_tac(x2232)
    fn(x2234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2233(x2234)
    }
  })
  let t2231 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(j : Num)"))(fn(x2230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x2230))
  }))
  let t2229 = @simp.asm_rewrite_tac(@list.List([]))
  let t2226 = @term_syntax.parse_term("(t : Num)")
  let t2227 = @term_syntax.parse_term("(s : Num)")
  let t2228 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b : Num)"), t2227, t2226]), solutions_are_xy()))
  let t2224 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq()]))
  let t2225 = @list.List([@tactics.then_tac(@tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("1 + 4 * ((p : Num) * (y : Num)) == (b : Num)")))), t2224), @tactics.all_tac])
  let t2223 = @tactics.subgoal_then(@term_syntax.parse_term("!((b : Num) == 0)"), fn(x2220 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2221 = @tactics.assume_tac(x2220)
    fn(x2222 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2221(x2222)
    }
  })
  let t2219 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x2218 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x2218))
  }))
  let t2217 = @simp.asm_rewrite_tac(@list.List([]))
  let t2214 = @term_syntax.parse_term("(v : Num)")
  let t2215 = @term_syntax.parse_term("(u : Num)")
  let t2216 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2215, t2214]), solutions_are_xy()))
  let t2213 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(i : Num)"))(fn(x2212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x2212))
  }))
  let t2211 = @simp.asm_rewrite_tac(@list.List([]))
  let t2208 = @term_syntax.parse_term("(y : Num)")
  let t2209 = @term_syntax.parse_term("(x : Num)")
  let t2210 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2209, t2208]), solutions_are_xy()))
  let t2489 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2207 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x2207))
  }), t2210), t2211), t2213), t2216), t2217), t2219), t2223), t2225), t2228), t2229), t2231), t2235), t2244), t2248), t2253), t2257), t2259), t2263), t2264), t2265), t2266), t2267), @tactics.disch_tac), t2271), t2275), t2279), t2287), t2290), t2291), t2298), t2299), t2306), t2307), t2308), t2313), t2314), t2319), @tactics.disch_tac), t2323), t2346), t2348), t2349), t2353), t2354), t2355), t2356), @tactics.disch_tac), t2357), @tactics.ap_term_tac), t2361), t2411), t2415), t2416), t2420), t2424), t2428), t2488)])
  let t2680 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t2489), t2494), t2495), t2500), t2502), t2503), t2504), t2505), t2506), t2507), t2512), t2514), t2515), t2516), t2517), t2521), t2528), t2529), t2534), t2535), t2536), t2537), t2566), t2567), t2571), t2589), t2593), t2620), t2624), t2630), t2631), t2632), t2633), t2634), t2635), t2636), t2637), t2638), t2639), t2640), t2644), t2651), t2652), t2656), t2657), t2662), t2663), t2664), t2666), t2667), t2668), t2669), t2673), t2674), t2675), t2677), t2678), t2679)
  y_dioph_c.set(@tactics.prove(@term_syntax.parse_term("!((a : Num) == 0) && !(a == 1) && !((y : Num) == 0) → (y == Y(a, (k : Num))) == (∃ x : Num, ∃ u : Num, ∃ v : Num, ∃ r : Num, ∃ b : Num, ∃ p : Num, ∃ q : Num, ∃ s : Num, ∃ t : Num, ∃ c : Num, ∃ d : Num, 0 < r && EXP(x, 2) == (EXP(a, 2) - 1) * EXP(y, 2) + 1 && EXP(u, 2) == (EXP(a, 2) - 1) * EXP(v, 2) + 1 && EXP(s, 2) == (EXP(b, 2) - 1) * EXP(t, 2) + 1 && v == r * EXP(y, 2) && b == 1 + 4 * (p * y) && b == a + q * u && s == x + c * u && t == k + 4 * (d * y) && k <= y)"), t2680))
}

///|
let y_dioph_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_DIOPH")

///|
/// `Y_DIOPH`
pub fn y_dioph() -> @kernel.Thm {
  y_dioph_c.get()
}

///|
/// BINOMIALISH_LEMMA
fn step_55() -> Unit raise {
  let t2694 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t2693 = @term_syntax.parse_term("(m : Num) * ((m - 1) * (n : Num)) == (m - 1) * (m * n)")
  let t2695 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x2690 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2691 = @equal.rand_conv(x2690)
    fn(x2692 : @kernel.Term) -> @kernel.Thm raise {
      s2691(x2692)
    }
  }, @list.List([@theorems.ac(@arith.mult_ac())(t2693)])), t2694)
  let t2689 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(c : Num) <= (b : Num) → (a : Num) - b <= a - c")))
  let t2688 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) - ((b : Num) + (c : Num)) == a - c - b"))]))
  let t2687 = @simp.rewrite_tac(@list.List([@arith.left_sub_distrib(), @arith.right_sub_distrib(), @arith.mult_clauses()]))
  let t2686 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t2684 = @term_syntax.parse_term("(a : Num) * ((b : Num) * (c : Num)) == b * (a * c)")
  let t2685 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@arith.mult_ac())(t2684)]))
  let t2696 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())])), t2685), t2686), @tactics.disj2_tac), t2687), t2688), t2689), @int.arith_tac), t2695])
  let t2683 = @tactics.exists_tac(@term_syntax.parse_term("((m : Num) - 1) * (EXP(m, (n : Num)) * (m - n))"))
  let t2682 = @tactics.match_mp_tac(@arith.le_trans())
  let t2681 = @simp.rewrite_tac(@list.List([@arith.exp(), @arith.sub_0(), @arith.mult_clauses(), @arith.le_refl()]))
  let t2697 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t2681), t2682), t2683), @tactics.conj_tac), t2696)
  binomialish_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, EXP(m, n) * (m - n) <= m * EXP(m - 1, n)"), t2697))
}

///|
let binomialish_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOMIALISH_LEMMA")

///|
/// `BINOMIALISH_LEMMA`
pub fn binomialish_lemma() -> @kernel.Thm {
  binomialish_lemma_c.get()
}

///|
/// XY_EXP_LEMMA
fn step_56() -> Unit raise {
  let t2804 = @simp.asm_rewrite_tac(@list.List([@arith.exp_eq_0()]))
  let t2803 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)"))]))
  let t2802 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) * 1 <= (x : Num) → 2 * x < (k : Num) → 2 * x + n < 2 * k")))
  let t2801 = @tactics.undisch_tac(@term_syntax.parse_term("2 * ((n : Num) * EXP((a : Num), n)) < (k : Num)"))
  let t2799 = @term_syntax.parse_term("2 * ((a : Num) * (n : Num)) == 2 * (n * a)")
  let t2800 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@arith.mult_ac())(t2799)]))
  let t2798 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(4 * ((k : Num) * (an : Num)) + (x : Num) < 2 * (an * (2 * k)) + (y : Num)) == (x < y)"))]))
  let t2797 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc())]))
  let t2796 = @simp.rewrite_tac(@list.List([@arith.left_add_distrib(), @arith.right_add_distrib(), @arith.mult_clauses()]))
  let t2795 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) + (b : Num) < (c : Num) → a < c - b")))
  let t2794 = @simp.rewrite_tac(@list.List([@arith.left_sub_distrib()]))
  let t2793 = @simp.asm_simp_tac(@list.List([@arith.lt_mult_lcancel(), @arith.exp_eq_0(), @arith.mult_eq_0(), @calc_num.arith_eq()]))
  let t2792 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(2 * (k : Num) * (2 * (an : Num) * (two_kn : Num)) < (a2na : Num) * (two_kn * (kmn : Num))) == (two_kn * (4 * (k * an)) < two_kn * (a2na * kmn))"))]))
  let t2791 = @list.List([@tactics.all_tac, @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel(), binomialish_lemma()]))])
  let t2790 = @tactics.exists_tac(@term_syntax.parse_term("(2 * EXP((a : Num), (n : Num)) + 1) * (EXP(2 * (k : Num), n) * (2 * k - n))"))
  let t2789 = @tactics.match_mp_tac(@arith.lte_trans())
  let t2787 = @term_syntax.parse_term("2 * (k : Num) * ((l : Num) * (m : Num)) == l * (2 * k * m)")
  let t2788 = @simp.gen_rewrite_tac(fn(x2784 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2785 = @equal.rand_conv(x2784)
    fn(x2786 : @kernel.Term) -> @kernel.Thm raise {
      s2785(x2786)
    }
  }, @list.List([@theorems.ac(@arith.mult_ac())(t2787)]))
  let t2783 = @list.List([@tactics.all_tac, @simp.asm_simp_tac(@list.List([@arith.lt_mult_lcancel(), @arith.mult_eq_0(), @calc_num.arith_eq()]))])
  let t2782 = @tactics.subgoal_then(@term_syntax.parse_term("2 * (k : Num) * (2 * EXP((a : Num), (n : Num)) * EXP(2 * k, n)) < 2 * k * ((2 * EXP(a, n) + 1) * EXP(2 * k - 1, n))"), fn(x2779 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2780 = @tactics.mp_tac(x2779)
    fn(x2781 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2780(x2781)
    }
  })
  let t2778 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t2777 = @simp.once_rewrite_tac(@list.List([@arith.mult_exp()]))
  let t2775 = @term_syntax.parse_term("2 * ((k : Num) * (a : Num)) == a * (2 * k)")
  let t2776 = @tactics.subst1_tac(@theorems.ac(@arith.mult_ac())(t2775))
  let t2773 = @equal.gsym(@arith.mult_assoc())
  let t2774 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_exp()), t2773]))
  let t2772 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("2 * ((e : Num) * (a : Num)) + e == (2 * a + 1) * e"))]))
  let t2771 = @simp.rewrite_tac(@list.List([@arith.mult_exp()]))
  let t2770 = @simp.rewrite_tac(@list.List([@arith.mult_assoc(), @equal.gsym(@arith.right_sub_distrib())]))
  let t2769 = @simp.gen_rewrite_tac(fn(x2768 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2764 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2760 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x2756 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(x2750 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2751 = @equal.rand_conv(x2750)
            fn(x2752 : @kernel.Term) -> @kernel.Thm raise {
              s2751(x2752)
            }
          })((fn(x2753 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2754 = @equal.land_conv(x2753)
            fn(x2755 : @kernel.Term) -> @kernel.Thm raise {
              s2754(x2755)
            }
          })(x2756))
        })((fn(x2757 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2758 = @equal.rand_conv(x2757)
          fn(x2759 : @kernel.Term) -> @kernel.Thm raise {
            s2758(x2759)
          }
        })(x2760))
      })((fn(x2761 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2762 = @equal.land_conv(x2761)
        fn(x2763 : @kernel.Term) -> @kernel.Thm raise {
          s2762(x2763)
        }
      })(x2764))
    })((fn(x2765 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2766 = @equal.rand_conv(x2765)
      fn(x2767 : @kernel.Term) -> @kernel.Thm raise {
        s2766(x2767)
      }
    })(x2768))
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) == 1 * a"))]))
  let t2748 = @term_syntax.parse_term("2 * ((a : Num) * (k : Num)) == 2 * (k * a)")
  let t2749 = @tactics.subst1_tac(@theorems.ac(@arith.mult_ac())(t2748))
  let t2746 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t2745 = @simp.rewrite_tac(@list.List([@arith.exp_mono_le(), @nums.not_suc()]))
  let t2744 = @simp.rewrite_tac(@list.List([@bool.conjunct1(@arith.exp()), @arith.le_refl()]))
  let t2742 = @term_syntax.parse_term("(m : Num)")
  let t2743 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t2742)
  let t2747 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()])), @tactics.disj2_tac), t2743), @nums.induct_tac), t2744), t2745), t2746), @int.arith_tac), @tactics.all_tac])
  let t2741 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(b' : Num) <= (b : Num) && (a : Num) < b' + (c : Num) → a < b + c && a < b' + c")))
  let t2740 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t2738 = @term_syntax.parse_term("2 * ((k : Num) * (a : Num)) == 2 * (a * k)")
  let t2739 = @tactics.subst1_tac(@theorems.ac(@arith.mult_ac())(t2738))
  let t2737 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib(), @equal.gsym(@arith.mult_assoc())]))
  let t2735 = @equal.gsym(@arith.mult_assoc())
  let t2736 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_exp()), t2735]))
  let t2734 = @simp.rewrite_tac(@list.List([y_lowerbound()]))
  let t2733 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2 * (k : Num) - 1, (n : Num))"))
  let t2732 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("∀ x : Num, x <= (c : Num) && (a : Num) < (b : Num) + x && (d : Num) < (e : Num) + x → a < b + c && d < e + c")))
  let t2731 = @simp.rewrite_tac(@list.List([@real.real_of_num_lt()]))
  let t2730 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @calc_int.real_of_num_pow(), @realax.real_of_num_mul()]))
  let t2729 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_le(), y_lowerbound(), y_upperbound(), @analysis.real_le_rmul_eq(), @real.real_pow_lt(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("!((a : Num) == 0) → 0 < a"))]))
  let t2725 = @term_syntax.parse_term("real_of_num(EXP(2 * (k : Num), (n : Num))) * pow(real_of_num((a : Num)), n)")
  let t2726 = @term_syntax.parse_term("real_of_num(EXP(2 * ((a : Num) * (k : Num)), (n : Num)))")
  let t2727 = @term_syntax.parse_term("real_of_num(EXP(2 * (k : Num) - 1, (n : Num))) * pow(real_of_num((a : Num)), n)")
  let t2728 = @tactics.map_every(fn(x2722 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2723 = @tactics.exists_tac(x2722)
    fn(x2724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2723(x2724)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(EXP(2 * ((a : Num) * (k : Num)) - 1, (n : Num)))"), t2727, t2726, t2725]))
  let t2721 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("∀ lx : Real, ∀ ly : Real, ∀ ux : Real, ∀ uy : Real, lx <= (x : Real) && x <= ux && ly <= (y : Real) && y <= uy && real_of_num(2) * uy < real_of_num(2) * lx + (d : Real) && real_of_num(2) * ux < real_of_num(2) * ly + d → abs(x - y) * real_of_num(2) < d")))
  let t2720 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_of_num_lt(), @calc_num.arith(), @real.real_lt_rdiv_eq()]))
  let t2719 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @realax.real_mul_assoc()]))
  let t2718 = @simp.asm_simp_tac(@list.List([@calc_int.real_abs_num(), @analysis.real_lt_imp_nz(), @real.real_of_num_lt(), @real.real_div_lmul()]))
  let t2717 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_mul()), @analysis.real_sub_ldistrib()]))
  let t2716 = @tactics.exists_tac(@term_syntax.parse_term("abs(real_of_num(Y((k : Num), (n : Num) + 1)))"))
  let t2715 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t2713 = @simp.asm_simp_tac(@list.List([y_increases_lt(), @int.arith_rule(@term_syntax.parse_term("0 < (n : Num) + 1"))]))
  let t2712 = @bool.conjunct1(y_clauses())
  let t2714 = @list.List([@tactics.then_tac(@tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(k : Num)"), t2712))), t2713), @tactics.all_tac])
  let t2711 = @tactics.subgoal_then(@term_syntax.parse_term("0 < Y((k : Num), (n : Num) + 1)"), fn(x2708 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2709 = @tactics.assume_tac(x2708)
    fn(x2710 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2709(x2710)
    }
  })
  let t2705 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) < (k : Num) → !(k == 0)")))
  let t2707 = @list.List([@tactics.first_assum(fn(x2706 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2703 = @tactics.accept_tac(x2702)
      fn(x2704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2703(x2704)
      }
    })(t2705(x2706))
  }), @tactics.all_tac])
  let t2701 = @tactics.subgoal_then(@term_syntax.parse_term("!((k : Num) == 0)"), fn(x2698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2699 = @tactics.assume_tac(x2698)
    fn(x2700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2699(x2700)
    }
  })
  let t2805 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2701), t2707), t2711), t2714), t2715), t2716), t2717), t2718), t2719), t2720), t2721), t2728), t2729), t2730), t2731), t2732), t2733), t2734), t2736), t2737), t2739), t2740), t2741), @tactics.conj_tac), t2747), t2749), t2769), t2770), t2771), t2772), t2774), t2776), t2777), t2778), t2782), t2783), t2788), t2789), t2790), @tactics.conj_tac), t2791), t2792), t2793), t2794), t2795), t2796), t2797), t2798), t2800), t2801), t2802), t2803), t2804)
  xy_exp_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ k : Num, ∀ n : Num, !(a == 0) && 2 * (n * EXP(a, n)) < k → abs(real_of_num(Y(a * k, n + 1)) / real_of_num(Y(k, n + 1)) - pow(real_of_num(a), n)) < real_of_num(1) / real_of_num(2)"), t2805))
}

///|
let xy_exp_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XY_EXP_LEMMA")

///|
/// `XY_EXP_LEMMA`
pub fn xy_exp_lemma() -> @kernel.Thm {
  xy_exp_lemma_c.get()
}

///|
/// ABS_LT_REPRESENTATION
fn step_57() -> Unit raise {
  let t2881 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t2877 = @equal.gsym(@calc_int.real_of_num_pow())
  let t2878 = @equal.gsym(@realax.real_of_num_mul())
  let t2879 = @equal.gsym(@realax.real_of_num_add())
  let t2880 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_lt()), t2879, t2878, t2877]))
  let t2875 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_div()), @real.real_div_lmul(), @realax.real_of_num_eq()]))
  let t2874 = @simp.rewrite_tac(@list.List([@realax.real_div(), @analysis.real_sub_rdistrib(), @equal.gsym(@realax.real_mul_assoc())]))
  let t2872 = @equal.gsym(@real.real_pow_div())
  let t2873 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), t2872]))
  let t2871 = @simp.rewrite_tac(@list.List([@realax.real_div(), @equal.gsym(@realax.real_mul_assoc())]))
  let t2870 = @simp.rewrite_tac(@list.List([@real.real_abs_pow(), @real.real_pow2_abs()]))
  let t2868 = @equal.gsym(@real.real_abs_nz())
  let t2869 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_lt_ldiv_eq()), t2868, @real.real_pow_eq_0(), @calc_num.arith_eq(), @realax.real_of_num_eq()]))
  let t2867 = @simp.gen_rewrite_tac(fn(x2866 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2860 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2861 = @equal.rand_conv(x2860)
      fn(x2862 : @kernel.Term) -> @kernel.Thm raise {
        s2861(x2862)
      }
    })((fn(x2863 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2864 = @equal.rand_conv(x2863)
      fn(x2865 : @kernel.Term) -> @kernel.Thm raise {
        s2864(x2865)
      }
    })(x2866))
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t2859 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_pow())]))
  let t2876 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2858 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2852 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2853 = @equal.rand_conv(x2852)
      fn(x2854 : @kernel.Term) -> @kernel.Thm raise {
        s2853(x2854)
      }
    })((fn(x2855 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2856 = @equal.rand_conv(x2855)
      fn(x2857 : @kernel.Term) -> @kernel.Thm raise {
        s2856(x2857)
      }
    })(x2858))
  }, @list.List([@equal.gsym(@real.real_pow2_abs())])), t2859), t2867), t2869), t2870), t2871), t2873), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2874), @tactics.ap_term_tac), t2875), @tactics.all_tac])
  let t2851 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) * pow(real_of_num((x : Num)) - real_of_num((y : Num)) * real_of_num((z : Num)), 2) < pow(real_of_num(y), 2)"))
  let t2850 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2846 = @simp.simp_tac(@list.List([@calc_num.arith_eq(), @real.real_pow_le2(), @analysis.real_le_mul(), @analysis.real_pos(), @real.real_abs_pos()]))
  let t2845 = @simp.gen_rewrite_tac(fn(x2844 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2838 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2839 = @equal.land_conv(x2838)
      fn(x2840 : @kernel.Term) -> @kernel.Thm raise {
        s2839(x2840)
      }
    })((fn(x2841 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2842 = @equal.rand_conv(x2841)
      fn(x2843 : @kernel.Term) -> @kernel.Thm raise {
        s2842(x2843)
      }
    })(x2844))
  }, @list.List([@realax.real_mul_sym()]))
  let t2837 = @simp.gen_rewrite_tac(fn(x2836 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2830 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2831 = @equal.rand_conv(x2830)
      fn(x2832 : @kernel.Term) -> @kernel.Thm raise {
        s2831(x2832)
      }
    })((fn(x2833 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2834 = @equal.land_conv(x2833)
      fn(x2835 : @kernel.Term) -> @kernel.Thm raise {
        s2834(x2835)
      }
    })(x2836))
  }, @list.List([@equal.sym(@calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("pow(real_of_num(1), 2)")))]))
  let t2829 = @simp.rewrite_tac(@list.List([@analysis.real_not_lt()]))
  let t2847 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))])), t2829), t2837), t2845), t2846)
  let t2828 = @simp.simp_tac(@list.List([@calc_num.arith_eq(), @real.real_pow_lt2(), @analysis.real_le_mul(), @analysis.real_pos(), @real.real_abs_pos()]))
  let t2827 = @simp.gen_rewrite_tac(fn(x2826 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2820 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2821 = @equal.land_conv(x2820)
      fn(x2822 : @kernel.Term) -> @kernel.Thm raise {
        s2821(x2822)
      }
    })((fn(x2823 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2824 = @equal.land_conv(x2823)
      fn(x2825 : @kernel.Term) -> @kernel.Thm raise {
        s2824(x2825)
      }
    })(x2826))
  }, @list.List([@realax.real_mul_sym()]))
  let t2848 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2819 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2813 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2814 = @equal.rand_conv(x2813)
      fn(x2815 : @kernel.Term) -> @kernel.Thm raise {
        s2814(x2815)
      }
    })((fn(x2816 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2817 = @equal.rand_conv(x2816)
      fn(x2818 : @kernel.Term) -> @kernel.Thm raise {
        s2817(x2818)
      }
    })(x2819))
  }, @list.List([@equal.sym(@calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("pow(real_of_num(1), 2)")))])), t2827), t2828), t2847])
  let t2812 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @calc_int.real_abs_num()]))
  let t2811 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_pow2_abs())]))
  let t2809 = @equal.gsym(@real.real_pow_mul())
  let t2810 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), t2809]))
  let t2808 = @tactics.subst1_tac(@equal.sym(@calc_rat.real_rat_reduce_conv(@term_syntax.parse_term("real_of_num(2) * real_of_num(2)"))))
  let t2849 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@real.real_lt_rdiv_eq(), @real.real_of_num_lt(), @calc_num.arith()])), t2808), t2810), t2811), t2812), @tactics.eq_tac), t2848), @tactics.all_tac])
  let t2807 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) * pow(real_of_num((x : Num)) / real_of_num((y : Num)) - real_of_num((z : Num)), 2) < real_of_num(1)"))
  let t2806 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2882 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2806), t2807), @tactics.conj_tac), t2849), t2850), t2851), @tactics.conj_tac), t2876), t2880), t2881), @calc_rat.real_arith_tac)
  abs_lt_representation_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ z : Num, !(y == 0) → (abs(real_of_num(x) / real_of_num(y) - real_of_num(z)) < real_of_num(1) / real_of_num(2)) == (4 * EXP(x, 2) + 4 * EXP(y * z, 2) < 8 * (x * (y * z)) + EXP(y, 2))"), t2882))
}

///|
let abs_lt_representation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_LT_REPRESENTATION")

///|
/// `ABS_LT_REPRESENTATION`
pub fn abs_lt_representation() -> @kernel.Thm {
  abs_lt_representation_c.get()
}

///|
/// Y_EQ_0
fn step_58() -> Unit raise {
  let t2886 = @simp.rewrite_tac(@list.List([y_clauses()]))
  let t2885 = @simp.asm_simp_tac(@list.List([y_inj()]))
  let t2883 = @bool.conjunct1(y_clauses())
  let t2884 = @tactics.subst1_tac(@equal.sym(@bool.spec(@term_syntax.parse_term("(a : Num)"), t2883)))
  let t2887 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2884), t2885), t2886)
  y_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ n : Num, !(a == 0) → (Y(a, n) == 0) == (n == 0)"), t2887))
}

///|
let y_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_EQ_0")

///|
/// `Y_EQ_0`
pub fn y_eq_0() -> @kernel.Thm {
  y_eq_0_c.get()
}

///|
/// XY_EXP
fn step_59() -> Unit raise {
  let t2888 = @meson.meson_tac(@list.List([]))
  let lemma1 = @tactics.prove(@term_syntax.parse_term("(∃ x : _, ∃ y : _, ∃ z : _, (a : _) == x && (b : _) == y && (c : _) == z && (P : (_, _, _) -> Bool)(x, y, z)) == P(a, b, c)"), t2888)
  let t2889 = @bool.spec_all(abs_lt_representation())
  let lemma2 = @equal.conv_rule(@equal.rand_conv(@equal.once_depth_conv(@equal.sym_conv)), t2889)
  let t2964 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2963 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_add(), @realax.real_of_num_eq(), @realax.real_of_num_le()]))
  let t2960 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((a : Real) - (b : Real)) < real_of_num(1) → a + real_of_num(1) <= b || a == b || b + real_of_num(1) <= a → a == b")))
  let t2962 = @tactics.disch_then(fn(x2961 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2957 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2958 = @tactics.mp_tac(x2957)
      fn(x2959 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2958(x2959)
      }
    })(t2960(x2961))
  })
  let t2956 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2953 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (a : Real)) < (e1 : Real) && abs(x - (b : Real)) < (e2 : Real) → abs(a - b) < e1 + e2")))
  let t2955 = @tactics.disch_then(fn(x2954 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2950 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2951 = @tactics.mp_tac(x2950)
      fn(x2952 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2951(x2952)
      }
    })(t2953(x2954))
  })
  let t2949 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t2947 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t2946 = @simp.rewrite_tac(@list.List([@bool.conjunct1(@arith.exp()), @arith.le_refl(), @arith.exp_mono_le(), @nums.not_suc()]))
  let t2944 = @term_syntax.parse_term("(n : Num)")
  let t2945 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t2944)
  let t2943 = @simp.rewrite_tac(@list.List([y_lowerbound()]))
  let t2942 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2 * (a : Num) - 1, (n : Num))"))
  let t2941 = @tactics.match_mp_tac(@arith.le_trans())
  let t2940 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t2937 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("2 * (a : Num) < (k : Num) → (b : Num) <= a → 2 * b < k")))
  let t2939 = @tactics.first_x_assum(fn(x2938 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2937(x2938))
  })
  let t2948 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2939), t2940), @tactics.disj2_tac), t2941), t2942), t2943), t2945), @nums.induct_tac), t2946), t2947), @int.arith_tac), @tactics.all_tac])
  let t2934 = @term_syntax.parse_term("(n : Num)")
  let t2935 = @term_syntax.parse_term("(k : Num)")
  let t2936 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Num)"), t2935, t2934]), xy_exp_lemma()))
  let t2932 = @tactics.conjuncts_then2(fn(x2926 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2927 = @tactics.assume_tac(x2926)
    fn(x2928 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2927(x2928)
    }
  }, fn(x2929 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2930 = @tactics.mp_tac(x2929)
    fn(x2931 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2930(x2931)
    }
  })
  let t2933 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Num)"))(t2932))
  let t2924 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Num) == 0)"))
  let t2923 = @simp.rewrite_tac(@list.List([@bool.conjunct1(@arith.exp()), @arith.le_refl(), @arith.exp_mono_le(), @nums.not_suc()]))
  let t2921 = @term_syntax.parse_term("(n : Num)")
  let t2922 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t2921)
  let t2920 = @simp.rewrite_tac(@list.List([y_lowerbound()]))
  let t2919 = @tactics.exists_tac(@term_syntax.parse_term("EXP(2 * (a : Num) - 1, (n : Num))"))
  let t2918 = @tactics.match_mp_tac(@arith.le_trans())
  let t2917 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t2916 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → 2 * a < 2 * b + 1")))
  let t2915 = @simp.asm_rewrite_tac(@list.List([]))
  let t2914 = @tactics.match_mp_tac(xy_exp_lemma())
  let t2912 = @equal.gsym(@calc_int.real_of_num_pow())
  let t2913 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(c : Num) < c + 1")), t2912]))
  let t2911 = @tactics.exists_tac(@term_syntax.parse_term("2 * ((n : Num) * Y((a : Num), n + 1)) + 1"))
  let t2925 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2907 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2908 = @tactics.subst1_tac(x2907)
      fn(x2909 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2908(x2909)
      }
    })(@equal.sym(x2910))
  }), t2911), t2913), t2914), t2915), t2916), t2917), @tactics.disj2_tac), t2918), t2919), t2920), t2922), @nums.induct_tac), t2923), t2924), @int.arith_tac), @tactics.all_tac])
  let t2906 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) < (k : Num) && !(k == 0)) == (n < k)"))]))
  let t2905 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t2904 = @simp.asm_simp_tac(@list.List([lemma2, y_eq_0(), @arith.add_eq_0(), @calc_num.arith_eq()]))
  let t2903 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool)) == !(a → !b)"))]))
  let t2902 = @simp.gen_rewrite_tac(fn(x2901 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2897 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2891 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2892 = @equal.rand_conv(x2891)
        fn(x2893 : @kernel.Term) -> @kernel.Thm raise {
          s2892(x2893)
        }
      })((fn(x2894 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2895 = @equal.binder_conv(x2894)
        fn(x2896 : @kernel.Term) -> @kernel.Thm raise {
          s2895(x2896)
        }
      })(x2897))
    })((fn(x2898 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2899 = @equal.land_conv(x2898)
      fn(x2900 : @kernel.Term) -> @kernel.Thm raise {
        s2899(x2900)
      }
    })(x2901))
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("((n : Num) < (k : Num)) == (n < k && !(k == 0))"))]))
  let t2890 = @simp.rewrite_tac(@list.List([lemma1]))
  let t2965 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2890), t2902), t2903), t2904), t2905), t2906), @tactics.eq_tac), t2925), t2933), t2936), @tactics.ants_tac), t2948), t2949), t2955), t2956), t2962), t2963), t2964), @int.arith_tac)
  xy_exp_c.set(@tactics.prove(@term_syntax.parse_term("!((a : Num) == 0) → (EXP(a, (n : Num)) == (p : Num)) == (∃ k : Num, ∃ x : Num, ∃ y : Num, ∃ z : Num, Y(a * k, n + 1) == x && Y(k, n + 1) == y && Y(a, n + 1) == z && 2 * (n * z) < k && 4 * EXP(x, 2) + 4 * EXP(y * p, 2) < 8 * (x * (y * p)) + EXP(y, 2))"), t2965))
}

///|
let xy_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XY_EXP")

///|
/// `XY_EXP`
pub fn xy_exp() -> @kernel.Thm {
  xy_exp_c.get()
}

///|
/// REAL_SUM_OF_SQUARES
fn step_60() -> Unit raise {
  let t2973 = @simp.rewrite_tac(@list.List([@analysis.real_le_square(), @realarith.real_entire()]))
  let t2970 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + (b : Real) == real_of_num(0) → real_of_num(0) <= a && real_of_num(0) <= b → a == real_of_num(0) && b == real_of_num(0)")))
  let t2972 = @tactics.disch_then(fn(x2971 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2967 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2968 = @tactics.mp_tac(x2967)
      fn(x2969 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2968(x2969)
      }
    })(t2970(x2971))
  })
  let t2966 = @simp.simp_tac(@list.List([@analysis.real_mul_lzero(), @realax.real_add_lid()]))
  let t2974 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_pow_2()])), @tactics.eq_tac), t2966), t2972), t2973)
  real_sum_of_squares_c.set(@tactics.prove(@term_syntax.parse_term("(pow((x : Real), 2) + pow((y : Real), 2) == real_of_num(0)) == (x == real_of_num(0) && y == real_of_num(0))"), t2974))
}

///|
let real_sum_of_squares_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SUM_OF_SQUARES")

///|
/// `REAL_SUM_OF_SQUARES`
pub fn real_sum_of_squares() -> @kernel.Thm {
  real_sum_of_squares_c.get()
}

///|
/// DIOPH_CONJ
fn step_61() -> Unit raise {
  let t2979 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2()]))
  let t2978 = @simp.rewrite_tac(@list.List([@equal.gsym(real_sum_of_squares())]))
  let t2977 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@analysis.real_sub_0())]))
  let t2975 = @equal.gsym(@realax.real_of_num_mul())
  let t2976 = @equal.gsym(@realax.real_of_num_add())
  let t2980 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq()), t2976, t2975])), t2977), t2978), t2979), @calc_rat.real_arith_tac)
  dioph_conj_c.set(@tactics.prove(@term_syntax.parse_term("((x1 : Num) == (x2 : Num) && (y1 : Num) == (y2 : Num)) == (x1 * x1 + (x2 * x2 + (y1 * y1 + y2 * y2)) == 2 * (x1 * x2) + 2 * (y1 * y2))"), t2980))
}

///|
let dioph_conj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIOPH_CONJ")

///|
/// `DIOPH_CONJ`
pub fn dioph_conj() -> @kernel.Thm {
  dioph_conj_c.get()
}

///|
/// DIOPH_DISJ
fn step_62() -> Unit raise {
  let t2984 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_entire())]))
  let t2983 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@analysis.real_sub_0())]))
  let t2981 = @equal.gsym(@realax.real_of_num_mul())
  let t2982 = @equal.gsym(@realax.real_of_num_add())
  let t2985 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq()), t2982, t2981])), t2983), t2984), @calc_rat.real_arith_tac)
  dioph_disj_c.set(@tactics.prove(@term_syntax.parse_term("((x1 : Real) == (x2 : Real) || (y1 : Real) == (y2 : Real)) == (x1 * y1 + x2 * y2 == x1 * y2 + x2 * y1)"), t2985))
}

///|
let dioph_disj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIOPH_DISJ")

///|
/// `DIOPH_DISJ`
pub fn dioph_disj() -> @kernel.Thm {
  dioph_disj_c.get()
}

///|
/// DIOPH_LE
fn step_63() -> Unit raise {
  let t2986 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @theorems.eq_sym_eq()]))
  let t2987 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_exists()])), @tactics.ap_term_tac), @tactics.abs_tac), t2986)
  dioph_le_c.set(@tactics.prove(@term_syntax.parse_term("((x : Num) <= (y : Num)) == (∃ d : Num, x + d == y)"), t2987))
}

///|
let dioph_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIOPH_LE")

///|
/// `DIOPH_LE`
pub fn dioph_le() -> @kernel.Thm {
  dioph_le_c.get()
}

///|
/// DIOPH_LT
fn step_64() -> Unit raise {
  let t2989 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @theorems.eq_sym_eq()]))
  let t2988 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t2990 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.lt_exists()])), t2988), @tactics.ap_term_tac), @tactics.abs_tac), t2989)
  dioph_lt_c.set(@tactics.prove(@term_syntax.parse_term("((x : Num) < (y : Num)) == (∃ d : Num, x + (d + 1) == y)"), t2990))
}

///|
let dioph_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIOPH_LT")

///|
/// `DIOPH_LT`
pub fn dioph_lt() -> @kernel.Thm {
  dioph_lt_c.get()
}

///|
/// DIOPH_NE
fn step_65() -> Unit raise {
  dioph_ne_c.set(@tactics.prove(@term_syntax.parse_term("!((x : Num) == (y : Num)) == (x < y || y < x)"), @int.arith_tac))
}

///|
let dioph_ne_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIOPH_NE")

///|
/// `DIOPH_NE`
pub fn dioph_ne() -> @kernel.Thm {
  dioph_ne_c.get()
}

///|
/// Y_0
fn step_66() -> Unit raise {
  let t2995 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.sub_0(), @int.arith_rule(@term_syntax.parse_term("!((k : Num) + 2 == 1)"))]))
  let t2994 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC(SUC((n : Num))) == n + 2")), y_clauses(), @calc_num.arith()]))
  let t2993 = @simp.rewrite_tac(@list.List([y_clauses(), @calc_num.arith()]))
  let t2991 = @term_syntax.parse_term("(k : Num)")
  let t2992 = @tactics.spec_tac(@term_syntax.parse_term("(k : Num)"), t2991)
  let t2996 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([y_clauses(), @calc_num.arith_eq()]))), t2992), @nums.induct_tac), t2993), t2994), t2995)
  y_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, Y(0, k) == (if k == 1 { 1 } else { 0 })"), t2996))
}

///|
let y_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_0")

///|
/// `Y_0`
pub fn y_0() -> @kernel.Thm {
  y_0_c.get()
}

///|
/// Y_0_TRIV
fn step_67() -> Unit raise {
  let t2997 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t2998 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([y_0()]))), @class.cond_cases_tac), t2997)
  y_0_triv_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Num, (Y(0, k) == 0) == !(k == 1)"), t2998))
}

///|
let y_0_triv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Y_0_TRIV")

///|
/// `Y_0_TRIV`
pub fn y_0_triv() -> @kernel.Thm {
  y_0_triv_c.get()
}

///|
/// DIOPH_Y
fn step_68() -> Unit raise {
  let t3025 = @simp.asm_simp_tac(@list.List([y_dioph()]))
  let t3024 = @simp.gen_rewrite_tac(fn(x3021 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3022 = @equal.land_conv(x3021)
    fn(x3023 : @kernel.Term) -> @kernel.Thm raise {
      s3022(x3023)
    }
  }, @list.List([@theorems.eq_sym_eq()]))
  let t3020 = @simp.asm_simp_tac(@list.List([y_eq_0()]))
  let t3019 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Num) == 0"))
  let t3018 = @list.List([@simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()])), @tactics.all_tac])
  let t3017 = @simp.asm_rewrite_tac(@list.List([y_degenerate()]))
  let t3016 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 1"))
  let t3014 = @tactics.conv_tac(fn(x3013 : @kernel.Term) -> @kernel.Thm raise {
    @bool.eqt_intro(@class.taut(x3013))
  })
  let t3015 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()])), t3014), @tactics.all_tac])
  let t3012 = @simp.asm_rewrite_tac(@list.List([y_clauses()]))
  let t3011 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t3010 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t3008 = @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
  let t3007 = @simp.asm_rewrite_tac(@list.List([]))
  let t3006 = @simp.rewrite_tac(@list.List([y_0()]))
  let t3005 = @simp.rewrite_tac(@list.List([@arith.exp_2(), @arith.mult_eq_1()]))
  let t3004 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()]))
  let t3003 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3002 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t3001 = @simp.asm_rewrite_tac(@list.List([y_clauses(), @calc_num.arith_eq()]))
  let t3000 = @class.asm_cases_tac(@term_syntax.parse_term("(k : Num) == 0"))
  let t2999 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([y_0_triv(), @calc_num.arith_eq()])), @int.arith_tac), @tactics.all_tac])
  let t3009 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(y : Num) == 0")), t2999), t3000), t3001), t3002), t3003), t3004), t3005), t3006), @class.cond_cases_tac), t3007), t3008), @tactics.all_tac])
  let t3026 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(a : Num) == 0")), t3009), t3010), t3011), t3012), t3015), t3016), t3017), t3018), t3019), t3020), t3024), t3025)
  dioph_y_c.set(@tactics.prove(@term_syntax.parse_term("(Y((a : Num), (k : Num)) == (y : Num)) == (a == 0 && k == 1 && y == 1 || a == 0 && !(k == 1) && y == 0 || k == 0 && y == 0 || a == 1 && y == k || !(a == 0) && !(k == 0) && !(a == 1) && !(y == 0) && (∃ x : Num, ∃ u : Num, ∃ v : Num, ∃ r : Num, ∃ b : Num, ∃ p : Num, ∃ q : Num, ∃ s : Num, ∃ t : Num, ∃ c : Num, ∃ d : Num, 0 < r && EXP(x, 2) == (EXP(a, 2) - 1) * EXP(y, 2) + 1 && EXP(u, 2) == (EXP(a, 2) - 1) * EXP(v, 2) + 1 && EXP(s, 2) == (EXP(b, 2) - 1) * EXP(t, 2) + 1 && v == r * EXP(y, 2) && b == 1 + 4 * (p * y) && b == a + q * u && s == x + c * u && t == k + 4 * (d * y) && k <= y))"), t3026))
}

///|
let dioph_y_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIOPH_Y")

///|
/// `DIOPH_Y`
pub fn dioph_y() -> @kernel.Thm {
  dioph_y_c.get()
}

///|
/// DIOPH_EXP_LEMMA
fn step_69() -> Unit raise {
  let t3032 = @simp.asm_simp_tac(@list.List([xy_exp()]))
  let t3030 = @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
  let t3029 = @simp.rewrite_tac(@list.List([@arith.exp(), @arith.mult_clauses(), @arith.add_clauses(), @nums.not_suc()]))
  let t3028 = @term_syntax.parse_term("(n : Num)")
  let t3031 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t3028), @nums.induct_tac), t3029), t3030), @tactics.all_tac])
  let t3027 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t3033 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0")), t3027), t3031), t3032)
  dioph_exp_lemma_c.set(@tactics.prove(@term_syntax.parse_term("(EXP((m : Num), (n : Num)) == (p : Num)) == (m == 0 && n == 0 && p == 1 || m == 0 && !(n == 0) && p == 0 || !(m == 0) && (∃ k : Num, ∃ x : Num, ∃ y : Num, ∃ z : Num, Y(m * k, n + 1) == x && Y(k, n + 1) == y && Y(m, n + 1) == z && 2 * (n * z) < k && 4 * EXP(x, 2) + 4 * EXP(y * p, 2) < 8 * (x * (y * p)) + EXP(y, 2)))"), t3033))
}

///|
let dioph_exp_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIOPH_EXP_LEMMA")

///|
/// `DIOPH_EXP_LEMMA`
pub fn dioph_exp_lemma() -> @kernel.Thm {
  dioph_exp_lemma_c.get()
}

///|
/// DIOPH_EXP
fn step_70() -> Unit raise {
  let th1 = @simp.rewrite_rule(@list.List([dioph_y()]))(dioph_exp_lemma())
  let th2 = @simp.rewrite_rule(@list.List([@arith.exp_2()]))(th1)
  let th3 = @simp.rewrite_rule(@list.List([dioph_ne(), dioph_lt(), dioph_le()]))(th2)
  let th4 = @simp.rewrite_rule(@list.List([@arith.add_clauses(), @calc_num.arith_eq(), @arith.add_eq_0(), @int.arith_rule(@term_syntax.parse_term("((n : Num) + 1 == 1) == (n == 0)")), @arith.add_assoc(), @arith.eq_add_rcancel()]))(th3)
  let th5 = @simp.rewrite_rule(@list.List([@equal.gsym(@arith.add_assoc())]))(th4)
  dioph_exp_c.set(@simp.rewrite_rule(@list.List([@theorems.or_exists_thm(), @theorems.left_or_exists_thm(), @theorems.right_or_exists_thm(), @theorems.left_and_exists_thm(), @theorems.right_and_exists_thm()]))(th5))
}

///|
let dioph_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIOPH_EXP")

///|
/// `DIOPH_EXP`
pub fn dioph_exp() -> @kernel.Thm {
  dioph_exp_c.get()
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
}
