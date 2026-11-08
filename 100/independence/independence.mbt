// Translated from upstream 100/independence.ml; edit this file directly.

///|
/// ddist
fn step_1() -> Unit raise {
  ddist_c.set(@pair.new_definition(@term_syntax.parse_term("(ddist : ((Cart[Real, N], Cart[Real, N])) -> Real)(((x : Cart[Real, N]), (y : Cart[Real, N]))) == (if norm(x) < real_of_num(1) && norm(y) < real_of_num(1) { pow(real_of_num(1) - dot(x, y), 2) / ((real_of_num(1) - pow(norm(x), 2)) * (real_of_num(1) - pow(norm(y), 2))) - real_of_num(1) } else { distance((x, y)) })")))
}

///|
let ddist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ddist")

///|
/// `ddist`
pub fn ddist() -> @kernel.Thm {
  ddist_c.get()
}

///|
/// DDIST_INCREASES_ONLINE
fn step_2() -> Unit raise {
  let t57 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_pos_lt(), @realarith.real_sub_lt()]))
  let t56 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t55 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t54 = @tactics.match_mp_tac(@realarith.real_lte_add())
  let t53 = @tactics.try_tac(@tactics.match_mp_tac(@realarith.real_lt_imp_le()))
  let t52 = @tactics.try_tac(@calc_rat.asm_real_arith_tac)
  let t50 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), @tactics.conj_tac))
  let t51 = @list.List([@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_mul()), @tactics.conj_tac)), t50])
  let t49 = @tactics.match_mp_tac(@realarith.real_lte_add())
  let t48 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow(real_of_num(1) - ((a : Real) + (x : Real) * (b : Real)), 2) * (real_of_num(1) - (a + (real_of_num(2) * b + (c : Real)))) < pow(real_of_num(1) - (a + b), 2) * (real_of_num(1) - (a + (real_of_num(2) * (x * b) + x * (x * c))))) == (real_of_num(0) < (real_of_num(1) - a - b * x) * (((real_of_num(1) - a) * c + pow(b, 2)) * (real_of_num(1) - x)) + (real_of_num(1) - a - b) * (((real_of_num(1) - a) * c + pow(b, 2)) * ((real_of_num(1) - x) * x)))"))]))
  let t47 = @tactics.repeat_tac(@tactics.strip_tac)
  let t46 = @simp.rewrite_tac(@list.List([@vectors.dot_lmul()]))
  let t45 = @simp.rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul()]))
  let t44 = @simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.vector_arith(@term_syntax.parse_term("dot((a : Cart[Real, N]) + (b : Cart[Real, N]), a + b) == dot(a, a) + (real_of_num(2) * dot(a, b) + dot(b, b))"))]))
  let t43 = @tactics.rule_assum_tac(@simp.simp_rule(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) + (c : Cart[Real, N]) == a) == (c == vec(0))"))])))
  let t42 = @list.List([@tactics.then_tac(@simp.expand_tac("c"), @vectors.vector_arith_tac), @tactics.all_tac])
  let t41 = @tactics.subgoal_then(@term_syntax.parse_term("(b : Cart[Real, N]) == (a : Cart[Real, N]) + (c : Cart[Real, N])"), fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s39 = @tactics.subst_all_tac(x38)
    fn(x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s39(x40)
    }
  })
  let t37 = @simp.abbrev_tac(@term_syntax.parse_term("(c : Cart[Real, N]) == (b : Cart[Real, N]) - (a : Cart[Real, N])"))
  let t36 = @simp.simp_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (u : Real), (a : Cart[Real, N])) + op_pct(u, (b : Cart[Real, N])) == a + op_pct(u, b - a)"))]))
  let t35 = @simp.asm_rewrite_tac(@list.List([]))
  let t34 = @simp.asm_simp_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - real_of_num(1), (a : Cart[Real, N])) + op_pct(real_of_num(1), (b : Cart[Real, N])) == b"))]))
  let t33 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Real) == real_of_num(1)"))
  let t32 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Real)"))
  let t31 = @simp.rewrite_tac(@list.List([@topology.in_segment(), @theorems.left_imp_exists_thm()]))
  let t28 = @simp.gen_rewrite_rule(fn(x27 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x27
  }, @list.List([@topology.between_in_segment()]))
  let t30 = @tactics.first_x_assum(fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s25 = @tactics.mp_tac(x24)
      fn(x26 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s25(x26)
      }
    })(t28(x29))
  })
  let t22 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t21 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t20 = @simp.gen_rewrite_tac(fn(x17 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s18 = @equal.rand_conv(x17)
    fn(x19 : @kernel.Term) -> @kernel.Thm raise {
      s18(x19)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t23 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@meson.meson(@list.List([@realarith.real_let_trans(), @vectors.norm_cauchy_schwarz()]), @term_syntax.parse_term("norm((x : Cart[Real, N])) * norm((y : Cart[Real, N])) < real_of_num(1) → dot(x, y) < real_of_num(1)")))), t20), t21), t22), @tactics.all_tac])
  let t16 = @tactics.subgoal_then(@term_syntax.parse_term("dot((a : Cart[Real, N]), (b : Cart[Real, N])) < real_of_num(1) && dot(a, (x : Cart[Real, N])) < real_of_num(1)"), fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s14 = @tactics.mp_tac(x13)
    fn(x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s14(x15)
    }
  })
  let t12 = @simp.simp_tac(@list.List([@real.real_lt_rdiv_eq(), @realarith.real_sub_lt()]))
  let t11 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * inv((b : Real)) * (c : Real) == a * c / b"))]))
  let t10 = @simp.simp_tac(@list.List([@real.real_lt_div2_eq(), @real.real_lt_ldiv_eq(), @realarith.real_sub_lt()]))
  let t9 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) * (inv((x : Real)) * inv((b : Real))) - real_of_num(1) < (c : Real) * (inv(x) * (d : Real)) - real_of_num(1)) == (a / b / x < c * d / x)"))]))
  let t8 = @list.List([@simp.asm_simp_tac(@list.List([@misc.abs_square_lt_1(), @vectors.real_abs_norm()])), @tactics.all_tac])
  let t7 = @tactics.subgoal_then(@term_syntax.parse_term("pow(norm((a : Cart[Real, N])), 2) < real_of_num(1) && pow(norm((b : Cart[Real, N])), 2) < real_of_num(1) && pow(norm((x : Cart[Real, N])), 2) < real_of_num(1)"), fn(x4 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s5 = @tactics.mp_tac(x4)
    fn(x6 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s5(x6)
    }
  })
  let t3 = @simp.asm_simp_tac(@list.List([ddist(), @realax.real_div(), @real.real_inv_mul()]))
  let t2 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.between_refl_eq()])), @tactics.all_tac])
  let t1 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Cart[Real, N]) == (a : Cart[Real, N])"))
  let t58 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1), t2), t3), t7), t8), t9), t10), t11), t12), t16), t23), t30), t31), t32), t33), t34), @tactics.strip_tac), t35), t36), t37), t41), t42), t43), t44), t45), t46), t47), t48), t49), @tactics.conj_tac), t51), t52), t53), t54), t55), t56), t57)
  ddist_increases_online_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ x : Cart[Real, N], norm(a) < real_of_num(1) && norm(b) < real_of_num(1) && norm(x) < real_of_num(1) && between(x, (a, b)) && !(x == b) → ddist((a, x)) < ddist((a, b))"), t58))
}

///|
let ddist_increases_online_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_INCREASES_ONLINE")

///|
/// `DDIST_INCREASES_ONLINE`
pub fn ddist_increases_online() -> @kernel.Thm {
  ddist_increases_online_c.get()
}

///|
/// DDIST_REFL
fn step_3() -> Unit raise {
  let t59 = @tactics.conv_tac(@calc_rat.real_field)
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([ddist(), @vectors.dist_refl(), @vectors.norm_pow_2(), @vectors.norm_lt_square()]))), t59)
  ddist_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ddist((x, x)) == real_of_num(0)"), t60))
}

///|
let ddist_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_REFL")

///|
/// `DDIST_REFL`
pub fn ddist_refl() -> @kernel.Thm {
  ddist_refl_c.get()
}

///|
/// DDIST_SYM
fn step_4() -> Unit raise {
  let t61 = @simp.rewrite_tac(@list.List([ddist(), @theorems.conj_aci(), @real.real_mul_ac(), @vectors.dist_sym(), @vectors.dot_sym()]))
  ddist_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], ddist((x, y)) == ddist((y, x))"), t61))
}

///|
let ddist_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_SYM")

///|
/// `DDIST_SYM`
pub fn ddist_sym() -> @kernel.Thm {
  ddist_sym_c.get()
}

///|
/// DDIST_POS_LT
fn step_5() -> Unit raise {
  let t63 = @simp.asm_simp_tac(@list.List([ddist(), @vectors.dist_pos_lt()]))
  let t64 = @list.List([@meson.asm_meson_tac(@list.List([ddist_increases_online(), ddist_refl(), @vectors.between_refl()])), t63])
  let t62 = @class.asm_cases_tac(@term_syntax.parse_term("norm((x : Cart[Real, N])) < real_of_num(1) && norm((y : Cart[Real, N])) < real_of_num(1)"))
  let t65 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t62), t64)
  ddist_pos_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], !(x == y) → real_of_num(0) < ddist((x, y))"), t65))
}

///|
let ddist_pos_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_POS_LT")

///|
/// `DDIST_POS_LT`
pub fn ddist_pos_lt() -> @kernel.Thm {
  ddist_pos_lt_c.get()
}

///|
/// DDIST_POS_LE
fn step_6() -> Unit raise {
  let t67 = @simp.asm_simp_tac(@list.List([ddist_refl(), ddist_pos_lt(), @realarith.real_le_lt()]))
  let t66 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == (y : Cart[Real, N])"))
  let t68 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t66), t67)
  ddist_pos_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], real_of_num(0) <= ddist((x, y))"), t68))
}

///|
let ddist_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_POS_LE")

///|
/// `DDIST_POS_LE`
pub fn ddist_pos_le() -> @kernel.Thm {
  ddist_pos_le_c.get()
}

///|
/// DDIST_EQ_0
fn step_7() -> Unit raise {
  let t69 = @meson.meson_tac(@list.List([ddist_refl(), ddist_pos_lt(), @realarith.real_lt_refl()]))
  ddist_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], (ddist((x, y)) == real_of_num(0)) == (x == y)"), t69))
}

///|
let ddist_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_EQ_0")

///|
/// `DDIST_EQ_0`
pub fn ddist_eq_0() -> @kernel.Thm {
  ddist_eq_0_c.get()
}

///|
/// BETWEEN_COLLINEAR_DDIST_EQ
fn step_8() -> Unit raise {
  let t72 = @meson.asm_meson_tac(@list.List([ddist_increases_online(), ddist_sym(), @realarith.real_lt_imp_le(), @realax.real_le_refl(), @vectors.between_sym(), @real.real_not_le(), @vectors.between_refl()]))
  let t70 = @simp.rewrite_tac(@list.List([@vectors.collinear_between_cases()]))
  let t71 = @list.List([@simp.simp_tac(@list.List([@vectors.between_imp_collinear()])), t70])
  let t73 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @tactics.eq_tac), t71), t72)
  between_collinear_ddist_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ x : Cart[Real, N], norm(a) < real_of_num(1) && norm(b) < real_of_num(1) && norm(x) < real_of_num(1) → between(x, (a, b)) == (collinear({a, x, b}) && ddist((x, a)) <= ddist((a, b)) && ddist((x, b)) <= ddist((a, b)))"), t73))
}

///|
let between_collinear_ddist_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BETWEEN_COLLINEAR_DDIST_EQ")

///|
/// `BETWEEN_COLLINEAR_DDIST_EQ`
pub fn between_collinear_ddist_eq() -> @kernel.Thm {
  between_collinear_ddist_eq_c.get()
}

///|
/// CONTINUOUS_AT_LIFT_DDIST
fn step_9() -> Unit raise {
  let t92 = @simp.simp_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @vectors.norm_pow_2(), @topology.continuous_const(), @topology.continuous_at_id(), @topology.continuous_sub(), @topology.continuous_lift_dot2()]))
  let t91 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(1) * real_of_num(1) → !(real_of_num(1) - x == real_of_num(0))")), @real.real_lt_mul2(), @vectors.norm_pos_le(), @vectors.lift_sub()]))
  let t89 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@topology.continuous_at_inv()))
  let t90 = @list.List([@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@topology.continuous_mul())), t89])
  let t88 = @simp.simp_tac(@list.List([@topology.continuous_const(), @trivia.o_def(), @realarith.real_pow_2(), @vectors.lift_cmul()]))
  let t87 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_mul()), @tactics.conj_tac))
  let t86 = @simp.simp_tac(@list.List([@topology.continuous_const()]))
  let t85 = @tactics.match_mp_tac(@topology.continuous_sub())
  let t93 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_sub(), @realax.real_div(), @vectors.lift_cmul(), @real.real_inv_mul()])), t85), t86), t87), t88), t90), t91), t92)
  let t84 = @simp.asm_simp_tac(@list.List([ddist()]))
  let t81 = @drule.match_mp(@vectors.norm_arith(@term_syntax.parse_term("distance(((y : Cart[Real, _]), (x : Cart[Real, _]))) < real_of_num(1) - norm(x) → norm(y) < real_of_num(1)")))
  let t83 = @tactics.disch_then(fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x78 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s79 = @tactics.mp_tac(x78)
      fn(x80 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s79(x80)
      }
    })(t81(x82))
  })
  let t94 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])")), t83), t84), t93])
  let t77 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_lt()]))
  let t76 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) - norm((x : Cart[Real, N]))"))
  let t75 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N]) => lift(pow(real_of_num(1) - dot((a : Cart[Real, N]), x), 2) / ((real_of_num(1) - pow(norm(a), 2)) * (real_of_num(1) - pow(norm(x), 2))) - real_of_num(1))"))
  let t74 = @tactics.match_mp_tac(@topology.continuous_transform_at())
  let t95 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t74), t75), t76), t77), @tactics.conj_tac), t94)
  continuous_at_lift_ddist_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ x : Cart[Real, N], norm(a) < real_of_num(1) && norm(x) < real_of_num(1) → continuous((x : Cart[Real, N]) => lift(ddist((a, x))), at(x))"), t95))
}

///|
let continuous_at_lift_ddist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_LIFT_DDIST")

///|
/// `CONTINUOUS_AT_LIFT_DDIST`
pub fn continuous_at_lift_ddist() -> @kernel.Thm {
  continuous_at_lift_ddist_c.get()
}

///|
/// HYPERBOLIC_MIDPOINT
fn step_10() -> Unit raise {
  let t118 = @meson.asm_meson_tac(@list.List([@realarith.real_sub_0(), ddist_sym()]))
  let t117 = @simp.asm_simp_tac(@list.List([ddist_pos_le(), @vectors.lift_eq(), @topology.between_in_segment()]))
  let t116 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) - (x : Real) <= real_of_num(0)) == (real_of_num(0) <= x)"))]))
  let t115 = @simp.asm_simp_tac(@list.List([ddist_refl(), @vectors.lift_drop(), @topology.ends_in_segment(), @sets.in_image()]))
  let t109 = @term_syntax.parse_term("lift(real_of_num(0))")
  let t110 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t111 = @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t110, t109])
  let t114 = @tactics.disch_then(fn(x113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s107 = @tactics.mp_tac(x106)
      fn(x108 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s107(x108)
      }
    })(((x112 : @kernel.Thm) => @bool.specl(t111, x112))(x113))
  })
  let t105 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @theorems.right_imp_forall_thm(), @vectors.lift_drop()]))
  let t104 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm(), @sets.forall_in_image()]))
  let t119 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@convex.is_interval_connected_1()), @topology.is_interval_1()])), t104), t105), t114), t115), t116), t117), t118)
  let t103 = @meson.asm_meson_tac(@list.List([@convex.between_norm_lt(), @topology.between_in_segment()]))
  let t102 = @tactics.match_mp_tac(continuous_at_lift_ddist())
  let t101 = @simp.once_rewrite_tac(@list.List([ddist_sym()]))
  let t100 = @tactics.match_mp_tac(@topology.continuous_sub())
  let t99 = @tactics.repeat_tac(@tactics.strip_tac)
  let t98 = @tactics.match_mp_tac(@topology.continuous_at_imp_continuous_on())
  let t120 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.connected_segment(), @vectors.lift_sub()])), t98), t99), t100), t101), @tactics.conj_tac), t102), t103), t119])
  let t96 = @term_syntax.parse_term("segment([((a : Cart[Real, N]), (b : Cart[Real, N]))])")
  let t97 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, N]) => lift(ddist((x, (a : Cart[Real, N]))) - ddist((x, (b : Cart[Real, N]))))"), t96]), @topology.connected_continuous_image()))
  let t121 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t97), @tactics.ants_tac), t120)
  hyperbolic_midpoint_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], norm(a) < real_of_num(1) && norm(b) < real_of_num(1) → (∃ x : Cart[Real, N], between(x, (a, b)) && ddist((x, a)) == ddist((x, b)))"), t121))
}

///|
let hyperbolic_midpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERBOLIC_MIDPOINT")

///|
/// `HYPERBOLIC_MIDPOINT`
pub fn hyperbolic_midpoint() -> @kernel.Thm {
  hyperbolic_midpoint_c.get()
}

///|
/// DDIST_EQ_ORIGIN
fn step_11() -> Unit raise {
  let t126 = @equal.gsym(@real.real_eq_square_abs())
  let t127 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (x : Real) == real_of_num(1) - (y : Real)) == (x == y)")), t126, @vectors.real_abs_norm()]))
  let t125 = @simp.rewrite_tac(@list.List([@realax.real_div(), @realax.real_mul_lid(), @real.real_eq_inv2(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - real_of_num(1) == (y : Real) - real_of_num(1)) == (x == y)"))]))
  let t124 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t123 = @simp.rewrite_tac(@list.List([@vectors.dot_lzero()]))
  let t122 = @simp.asm_simp_tac(@list.List([ddist(), @vectors.norm_0(), @real.real_lt_01()]))
  let t128 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t122), t123), t124), t125), t127)
  ddist_eq_origin_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], norm(x) < real_of_num(1) && norm(y) < real_of_num(1) → (ddist((vec(0), x)) == ddist((vec(0), y))) == (norm(x) == norm(y))"), t128))
}

///|
let ddist_eq_origin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_EQ_ORIGIN")

///|
/// `DDIST_EQ_ORIGIN`
pub fn ddist_eq_origin() -> @kernel.Thm {
  ddist_eq_origin_c.get()
}

///|
/// DDIST_CONGRUENT_TRIPLES_0
fn step_12() -> Unit raise {
  let t137 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@vectors.norm_eq()])))
  let t136 = @simp.asm_simp_tac(@list.List([@misc.abs_square_lt_1(), @vectors.real_abs_norm(), @real.real_lt_imp_ne(), @realarith.real_lt_imp_le(), @meson.meson(@list.List([@vectors.norm_cauchy_schwarz(), @realarith.real_let_trans(), @vectors.norm_pos_le(), @real.real_lt_mul2(), @realarith.real_mul_rid(), @realarith.real_lt_imp_le()]), @term_syntax.parse_term("norm((x : Cart[Real, _])) < real_of_num(1) && norm((y : Cart[Real, _])) < real_of_num(1) → dot(x, y) < real_of_num(1)"))]))
  let t135 = @simp.asm_simp_tac(@list.List([@real.real_inv_eq_0(), @realax.real_abs(), @realarith.real_sub_le(), @realarith.real_sub_0()]))
  let t134 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_eq_square_abs()), @vectors.norm_pow_2()]))
  let t133 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_pow_2(), @vectors.dot_lsub(), @vectors.dot_rsub(), @vectors.dot_sym()]))
  let t132 = @simp.asm_simp_tac(@list.List([ddist(), @vectors.dist_eq(), @realax.real_div(), @real.real_inv_mul(), @calc_rat.real_ring(@term_syntax.parse_term("((x : Real) * ((a : Real) * (b : Real)) - real_of_num(1) == (y : Real) * (a * b) - real_of_num(1)) == (x == y || a == real_of_num(0) || b == real_of_num(0))"))]))
  let t131 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) → (x : Bool) == (y : Bool)) → (a && x && b) == (a && y && b)")))
  let t130 = @simp.rewrite_tac(@list.List([@vectors.dist_0(), @vectors.norm_0(), @real.real_lt_01()]))
  let t129 = @simp.asm_simp_tac(@list.List([ddist_eq_origin(), @simp.rewrite_rule(@list.List([ddist_sym()]))(ddist_eq_origin())]))
  let t138 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t129), t130), t131), @tactics.strip_tac), t132), t133), t134), t135), t136), t137), @calc_rat.asm_real_arith_tac)
  ddist_congruent_triples_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ a' : Cart[Real, N], ∀ b' : Cart[Real, N], norm(a) < real_of_num(1) && norm(b) < real_of_num(1) && norm(a') < real_of_num(1) && norm(b') < real_of_num(1) → (ddist((vec(0), a)) == ddist((vec(0), a')) && ddist((a, b)) == ddist((a', b')) && ddist((b, vec(0))) == ddist((b', vec(0)))) == (distance((vec(0), a)) == distance((vec(0), a')) && distance((a, b)) == distance((a', b')) && distance((b, vec(0))) == distance((b', vec(0))))"), t138))
}

///|
let ddist_congruent_triples_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_CONGRUENT_TRIPLES_0")

///|
/// `DDIST_CONGRUENT_TRIPLES_0`
pub fn ddist_congruent_triples_0() -> @kernel.Thm {
  ddist_congruent_triples_0_c.get()
}

///|
/// kleinify
fn step_13() -> Unit raise {
  kleinify_c.set(@pair.new_definition(@term_syntax.parse_term("(kleinify : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) == Cx(real_of_num(2) / (real_of_num(1) + pow(norm(z), 2))) * z")))
}

///|
let kleinify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("kleinify")

///|
/// `kleinify`
pub fn kleinify() -> @kernel.Thm {
  kleinify_c.get()
}

///|
/// poincarify
fn step_14() -> Unit raise {
  poincarify_c.set(@pair.new_definition(@term_syntax.parse_term("(poincarify : (Cart[Real, 2]) -> Cart[Real, 2])((x : Cart[Real, 2])) == Cx((real_of_num(1) - sqrt(real_of_num(1) - pow(norm(x), 2))) / pow(norm(x), 2)) * x")))
}

///|
let poincarify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poincarify")

///|
/// `poincarify`
pub fn poincarify() -> @kernel.Thm {
  poincarify_c.get()
}

///|
let kleinify_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("KLEINIFY_0")

///|
/// `KLEINIFY_0`
pub fn kleinify_0() -> @kernel.Thm {
  kleinify_0_c.get()
}

///|
let poincarify_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POINCARIFY_0")

///|
/// `POINCARIFY_0`
pub fn poincarify_0() -> @kernel.Thm {
  poincarify_0_c.get()
}

///|
/// KLEINIFY_0, POINCARIFY_0
fn step_15() -> Unit raise {
  let t140 = @simp.rewrite_tac(@list.List([kleinify(), poincarify(), @complexes.complex_mul_rzero()]))
  let t141 = (@term_syntax.parse_term("kleinify(Cx(real_of_num(0))) == Cx(real_of_num(0)) && poincarify(Cx(real_of_num(0))) == Cx(real_of_num(0))"), t140)
  let (kleinify_0, poincarify_0) = @bool.conj_pair((fn(x139 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x139.0, x139.1)
  })(t141))
  kleinify_0_c.set(kleinify_0)
  poincarify_0_c.set(poincarify_0)
}

///|
/// NORM_KLEINIFY
fn step_16() -> Unit raise {
  let t142 = @simp.simp_tac(@list.List([@real.real_le_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(real_of_num(1) + x) == real_of_num(1) + x"))]))
  let t143 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([kleinify(), @complexes.complex_norm_mul(), @complexes.complex_norm_cx(), @real.real_abs_div()])), t142), @calc_rat.real_arith_tac)
  norm_kleinify_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], norm(kleinify(z)) == real_of_num(2) * norm(z) / (real_of_num(1) + pow(norm(z), 2))"), t143))
}

///|
let norm_kleinify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_KLEINIFY")

///|
/// `NORM_KLEINIFY`
pub fn norm_kleinify() -> @kernel.Thm {
  norm_kleinify_c.get()
}

///|
/// NORM_KLEINIFY_LT
fn step_17() -> Unit raise {
  let t145 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @real.real_lt_square()]))
  let t144 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * (z : Real) < real_of_num(1) + pow(z, 2)) == (real_of_num(0) < pow(z - real_of_num(1), 2))"))]))
  let t146 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([norm_kleinify(), @real.real_le_pow_2(), @real.real_lt_ldiv_eq(), @realax.real_mul_lid(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(0) < real_of_num(1) + x"))])), t144), t145), @calc_rat.real_arith_tac)
  norm_kleinify_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], (norm(kleinify(z)) < real_of_num(1)) == !(norm(z) == real_of_num(1))"), t146))
}

///|
let norm_kleinify_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_KLEINIFY_LT")

///|
/// `NORM_KLEINIFY_LT`
pub fn norm_kleinify_lt() -> @kernel.Thm {
  norm_kleinify_lt_c.get()
}

///|
/// NORM_POINCARIFY_LT
fn step_18() -> Unit raise {
  let t160 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (x : Real) <= real_of_num(1)) == (real_of_num(0) <= x)"))
  let t161 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow(real_of_num(1) - (x : Real), 2) <= real_of_num(1) - x) == (real_of_num(0) <= x * (real_of_num(1) - x))")), t160, @realax.real_le_mul(), @real.real_pow_le(), @realarith.real_sub_le(), @misc.abs_square_le_1(), @realarith.real_lt_imp_le(), @vectors.real_abs_norm(), @vectors.norm_pos_le()]))
  let t159 = @simp.rewrite_tac(@list.List([@realarith.real_sub_le(), @realarith.real_pos(), @realax.real_mul_lid(), @real.real_pow_one()]))
  let t157 = @tactics.match_mp_tac(@real.real_le_rsqrt())
  let t158 = @list.List([@tactics.match_mp_tac(@real.real_le_lsqrt()), t157])
  let t156 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) <= real_of_num(1) && real_of_num(1) - (x : Real) <= s → abs(real_of_num(1) - s) <= x")))
  let t155 = @list.List([@calc_rat.real_arith_tac, @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))])
  let t154 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @vectors.norm_pos_lt(), @real.real_pow_lt(), @vectors.norm_0()]))
  let t153 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == vec(0)"))
  let t152 = @simp.rewrite_tac(@list.List([@real.real_abs_div(), @vectors.real_abs_norm(), @real.real_abs_pow()]))
  let t151 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le(), @complexes.complex_norm_mul(), @complexes.complex_norm_cx()]))
  let t150 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t149 = @simp.asm_rewrite_tac(@list.List([]))
  let t148 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (y : Real) <= real_of_num(1) * y && y < real_of_num(1) → x * y < real_of_num(1)")))
  let t147 = @simp.rewrite_tac(@list.List([poincarify(), @complexes.complex_norm_mul()]))
  let t162 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t147), t148), t149), t150), t151), t152), t153), t154), t155), t156), @tactics.conj_tac), t158), t159), t161)
  norm_poincarify_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], norm(x) < real_of_num(1) → norm(poincarify(x)) < real_of_num(1)"), t162))
}

///|
let norm_poincarify_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_POINCARIFY_LT")

///|
/// `NORM_POINCARIFY_LT`
pub fn norm_poincarify_lt() -> @kernel.Thm {
  norm_poincarify_lt_c.get()
}

///|
/// KLEINIFY_POINCARIFY
fn step_19() -> Unit raise {
  let t181 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_le(), @misc.abs_square_le_1(), @vectors.real_abs_norm(), @realarith.real_lt_imp_le()]))
  let t177 = @tactics.conv_tac(@calc_rat.real_field)
  let t178 = @list.List([@tactics.match_mp_tac(@real.sqrt_pow_2()), t177])
  let t179 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("pow(sqrt(real_of_num(1) - pow(norm((x : Cart[Real, 2])), 2)), 2) == real_of_num(1) - pow(norm(x), 2)"), fn(x174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s175 = @tactics.mp_tac(x174)
    fn(x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s175(x176)
    }
  }), t178)
  let t173 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt(), @complexes.complex_norm_nz()]))
  let t172 = @simp.rewrite_tac(@list.List([@realarith.real_pos(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (x : Real) < pow(real_of_num(1), 2)) == (real_of_num(0) < x)"))]))
  let t171 = @tactics.match_mp_tac(@real.real_lt_lsqrt())
  let t180 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_sub_lt()])), t171), t172), t173), t179])
  let t170 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (y : Real) && real_of_num(2) * y == (x : Real) → real_of_num(2) * (inv(x) * y) == real_of_num(1)")))
  let t169 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_zero(), @calc_rat.real_field(@term_syntax.parse_term("!((y : Real) == real_of_num(0)) → real_of_num(2) * ((x : Real) * pow(y, 2)) * ((z : Real) * inv(pow(y, 2))) == real_of_num(2) * (x * z)"))]))
  let t168 = @simp.rewrite_tac(@list.List([@real.real_pow2_abs(), @realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv()]))
  let t167 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_zero(), @calc_rat.real_field(@term_syntax.parse_term("!((y : Real) == real_of_num(0)) → real_of_num(1) + pow((a : Real) / pow(y, 2) * y, 2) == (pow(y, 2) + pow(a, 2)) / pow(y, 2)"))]))
  let t166 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @real.real_abs_div(), @vectors.real_abs_norm(), @real.real_abs_pow()]))
  let t165 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), @complexes.cx_inj(), @complexes.complex_norm_mul()]))
  let t164 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(!((x : Cart[Real, 2]) == Cx(real_of_num(0))) → (w : Cart[Real, 2]) * (z : Cart[Real, 2]) == Cx(real_of_num(1))) → w * (z * x) == x")))
  let t163 = @simp.rewrite_tac(@list.List([kleinify(), poincarify()]))
  let t182 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t163), t164), @tactics.disch_tac), t165), t166), t167), t168), t169), t170), @tactics.conj_tac), t180), t181)
  kleinify_poincarify_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], norm(x) < real_of_num(1) → kleinify(poincarify(x)) == x"), t182))
}

///|
let kleinify_poincarify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("KLEINIFY_POINCARIFY")

///|
/// `KLEINIFY_POINCARIFY`
pub fn kleinify_poincarify() -> @kernel.Thm {
  kleinify_poincarify_c.get()
}

///|
/// POINCARIFY_KLEINIFY
fn step_20() -> Unit raise {
  let t206 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pow(), @vectors.real_abs_norm(), @misc.abs_square_lt_1()]))
  let t205 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) < real_of_num(1) → !(real_of_num(1) + x == real_of_num(0))")))
  let t204 = @list.List([@tactics.all_tac, @tactics.conv_tac(@calc_rat.real_field)])
  let t203 = @tactics.subgoal_then(@term_syntax.parse_term("!(real_of_num(1) + pow(norm((x : Cart[Real, 2])), 2) == real_of_num(0))"), fn(x200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s201 = @tactics.mp_tac(x200)
    fn(x202 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s201(x202)
    }
  })
  let t199 = @simp.asm_simp_tac(@list.List([@misc.abs_square_le_1(), @vectors.real_abs_norm(), @realarith.real_lt_imp_le()]))
  let t198 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * (x : Real) <= real_of_num(1) * (real_of_num(1) + x)) == (x <= real_of_num(1))"))]))
  let t197 = @simp.simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_pow_le(), @vectors.norm_pos_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(0) < real_of_num(1) + x"))]))
  let t196 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= real_of_num(1) - real_of_num(2) * ((x : Real) / (y : Real))) == (real_of_num(2) * x / y <= real_of_num(1))"))]))
  let t195 = @tactics.match_mp_tac(@real.sqrt_unique())
  let t194 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == real_of_num(1) - (y : Real) → real_of_num(1) - x == y")))
  let t193 = @simp.asm_rewrite_tac(@list.List([@vectors.real_abs_norm(), @complexes.complex_norm_zero(), @real.real_abs_pow(), @misc.abs_square_lt_1(), @real.real_pow_eq_0()]))
  let t192 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) && abs(x) < real_of_num(1) && (a : Real) == real_of_num(2) * (x / (real_of_num(1) + x)) → a * pow(real_of_num(1) + x, 2) == real_of_num(2) * (x * (real_of_num(1) + x))")))
  let t191 = @simp.asm_simp_tac(@list.List([@vectors.real_abs_norm(), @real.real_pow_le(), @vectors.norm_pos_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(real_of_num(1) + x) == real_of_num(1) + x"))]))
  let t190 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_pow(), @complexes.complex_norm_zero(), @misc.abs_square_lt_1()]))
  let t189 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((c : Real) == real_of_num(0)) && abs((d : Real)) < real_of_num(1) && (a : Real) * (b : Real) == real_of_num(2) * (pow(c, 2) * (real_of_num(1) + d)) → a * (pow(inv(real_of_num(2)), 2) * (b * (pow(inv(c), 2) * (real_of_num(2) * inv(real_of_num(1) + d))))) == real_of_num(1)")))
  let t188 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv(), @equal.gsym(@realax.real_mul_assoc()), @real.real_inv_pow(), @real.real_pow_mul()]))
  let t187 = @simp.rewrite_tac(@list.List([@real.real_abs_div(), @vectors.real_abs_norm(), @real.real_abs_pow(), @calc_int.real_abs_num()]))
  let t186 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_cx()]))
  let t185 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), @complexes.cx_inj()]))
  let t184 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(!((x : Cart[Real, 2]) == Cx(real_of_num(0))) → (w : Cart[Real, 2]) * (z : Cart[Real, 2]) == Cx(real_of_num(1))) → w * (z * x) == x")))
  let t183 = @simp.rewrite_tac(@list.List([kleinify(), poincarify()]))
  let t207 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t183), t184), @tactics.disch_tac), t185), t186), t187), t188), t189), t190), t191), t192), t193), t194), t195), t196), t197), t198), t199), t203), t204), t205), t206)
  poincarify_kleinify_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], norm(x) < real_of_num(1) → poincarify(kleinify(x)) == x"), t207))
}

///|
let poincarify_kleinify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POINCARIFY_KLEINIFY")

///|
/// `POINCARIFY_KLEINIFY`
pub fn poincarify_kleinify() -> @kernel.Thm {
  poincarify_kleinify_c.get()
}

///|
/// DDIST_KLEINIFY
fn step_21() -> Unit raise {
  let t229 = @tactics.conv_tac(@calc_rat.real_field)
  let t228 = @simp.rewrite_tac(@list.List([@vectors.norm_eq_square(), @equal.gsym(@vectors.norm_pow_2())]))
  let t230 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s226 = @tactics.mp_tac(x225)
    fn(x227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s226(x227)
    }
  })), t228), t229)
  let t219 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.dot_lsub(), @vectors.dot_rsub(), @vectors.dot_sym()])), @calc_rat.real_arith_tac)
  let t220 = @list.List([@simp.asm_rewrite_tac(@list.List([@real.real_pow_eq_0(), @real.real_pow_eq_1(), @vectors.real_abs_norm(), @calc_num.arith(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (x : Real) == real_of_num(0)) == (x == real_of_num(1))"))])), t219])
  let t218 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("(!((y : Real) == real_of_num(0)) && !((y' : Real) == real_of_num(0))) && (a : Real) - y * y' == (b : Real) → a == (b / (y * y') + real_of_num(1)) * (y * y')")))
  let t221 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("pow(real_of_num(1) + (x : Real), 2) - real_of_num(4) * x == pow(real_of_num(1) - x, 2)"))])), t218), @tactics.conj_tac), t220)
  let t217 = @simp.asm_simp_tac(@list.List([@real.real_abs_pow(), @real.real_pow_eq_1(), @vectors.real_abs_norm()]))
  let t222 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("!(abs((x : Real)) == real_of_num(1)) → !(real_of_num(1) + x == real_of_num(0))")))), t217), @int.arith_tac), t221])
  let t216 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("(!((y' : Real) == real_of_num(0)) && !((y : Real) == real_of_num(0))) && pow(y * y' - real_of_num(4) * (d : Real), 2) == (b : Real) * ((pow(y, 2) - real_of_num(4) * pow((x : Real), 2)) * (pow(y', 2) - real_of_num(4) * pow((x' : Real), 2))) → pow(real_of_num(1) - real_of_num(2) / y * (real_of_num(2) / y' * d), 2) == b * ((real_of_num(1) - pow(real_of_num(2) / y * x, 2)) * (real_of_num(1) - pow(real_of_num(2) / y' * x', 2)))")))
  let t215 = @simp.simp_tac(@list.List([@real.real_abs_div(), @calc_int.real_abs_num(), @real.real_pow_le(), @vectors.norm_pos_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(real_of_num(1) + x) == real_of_num(1) + x"))]))
  let t214 = @simp.rewrite_tac(@list.List([@vectors.dot_rmul()]))
  let t213 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_cmul()), @vectors.dot_lmul()]))
  let t223 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([kleinify(), @complexes.complex_norm_mul(), @complexes.complex_norm_cx()])), t213), t214), t215), t216), @tactics.conj_tac), t222)
  let t212 = @simp.asm_simp_tac(@list.List([@real.real_pow_1_lt(), norm_kleinify_lt(), @vectors.norm_pos_le(), @calc_num.arith()]))
  let t211 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(1) → !(real_of_num(1) - x == real_of_num(0))")))
  let t224 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_entire(), @class.de_morgan_thm()])), @tactics.conj_tac), t211), t212), t223])
  let t210 = @tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("!((y : Real) == real_of_num(0)) && (z : Real) == ((w : Real) + real_of_num(1)) * y → z / y - real_of_num(1) == w")))
  let t231 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([ddist(), norm_kleinify_lt()])), t210), @tactics.conj_tac), t224), t230])
  let t209 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4) * (pow(norm((w : Cart[Real, 2]) - (z : Cart[Real, 2])), 2) * ((real_of_num(1) - pow(norm(w), 2)) * (real_of_num(1) - pow(norm(z), 2)) + pow(norm(w - z), 2))) / (pow(real_of_num(1) - pow(norm(w), 2), 2) * pow(real_of_num(1) - pow(norm(z), 2), 2))"))
  let t208 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t232 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t208), t209), @tactics.conj_tac), t231)
  ddist_kleinify_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], !(norm(w) == real_of_num(1)) && !(norm(z) == real_of_num(1)) → ddist((kleinify(w), kleinify(z))) == real_of_num(4) * pow(real_of_num(1) / real_of_num(2) + pow(norm(w - z), 2) / ((real_of_num(1) - pow(norm(w), 2)) * (real_of_num(1) - pow(norm(z), 2))), 2) - real_of_num(1)"), t232))
}

///|
let ddist_kleinify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_KLEINIFY")

///|
/// `DDIST_KLEINIFY`
pub fn ddist_kleinify() -> @kernel.Thm {
  ddist_kleinify_c.get()
}

///|
/// DDIST_KLEINIFY_EQ
fn step_22() -> Unit raise {
  let t233 = @tactics.conv_tac(@calc_rat.real_field)
  let t234 = @tactics.then_tac(@simp.simp_tac(@list.List([ddist_kleinify(), @vectors.norm_eq_square(), @equal.gsym(@vectors.norm_pow_2()), @realarith.real_pos()])), t233)
  ddist_kleinify_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ w' : Cart[Real, 2], ∀ z' : Cart[Real, 2], !(norm(w) == real_of_num(1)) && !(norm(z) == real_of_num(1)) && !(norm(w') == real_of_num(1)) && !(norm(z') == real_of_num(1)) && pow(norm(w - z), 2) * ((real_of_num(1) - pow(norm(w'), 2)) * (real_of_num(1) - pow(norm(z'), 2))) == pow(norm(w' - z'), 2) * ((real_of_num(1) - pow(norm(w), 2)) * (real_of_num(1) - pow(norm(z), 2))) → ddist((kleinify(w), kleinify(z))) == ddist((kleinify(w'), kleinify(z')))"), t234))
}

///|
let ddist_kleinify_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_KLEINIFY_EQ")

///|
/// `DDIST_KLEINIFY_EQ`
pub fn ddist_kleinify_eq() -> @kernel.Thm {
  ddist_kleinify_eq_c.get()
}

///|
/// NORM_KLEINIFY_MOEBIUS_LT
fn step_23() -> Unit raise {
  let t235 = @simp.simp_tac(@list.List([@cauchy.moebius_function_norm_lt_1(), norm_kleinify_lt(), @real.real_lt_imp_ne()]))
  norm_kleinify_moebius_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ x : Cart[Real, 2], norm(w) < real_of_num(1) && norm(x) < real_of_num(1) → norm(kleinify(moebius_function(real_of_num(0), w, x))) < real_of_num(1)"), t235))
}

///|
let norm_kleinify_moebius_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_KLEINIFY_MOEBIUS_LT")

///|
/// `NORM_KLEINIFY_MOEBIUS_LT`
pub fn norm_kleinify_moebius_lt() -> @kernel.Thm {
  norm_kleinify_moebius_lt_c.get()
}

///|
/// DDIST_KLEINIFY_MOEBIUS
fn step_24() -> Unit raise {
  let t256 = @equal.gsym(@complexes.im_def())
  let t257 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t256, @complexes.complex_sub(), @complexes.complex_mul(), @complexes.cx_def(), @complexes.complex_add(), @complexes.re(), @complexes.im(), @complexes.cnj(), @complexes.complex_neg()]))
  let t255 = @simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.dot_2()]))
  let t254 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_norm_mul())]))
  let t253 = @tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("(x : Real) * (y : Real) == (w : Real) * (z : Real) → x * (i : Real) * y == w * (z * i)")))
  let t252 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t251 = @simp.rewrite_tac(@list.List([@real.real_pow_div(), @complexes.complex_norm_mul()]))
  let t250 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_zero(), @calc_rat.real_field(@term_syntax.parse_term("!((y : Real) == real_of_num(0)) && !((y' : Real) == real_of_num(0)) → (real_of_num(1) - pow((x : Real) / y, 2)) * (real_of_num(1) - pow((x' : Real) / y', 2)) == (pow(y, 2) - pow(x, 2)) * (pow(y', 2) - pow(x', 2)) / pow(y * y', 2)"))]))
  let t249 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @complexes.complex_norm_pow()]))
  let t258 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@complexes.complex_field(@term_syntax.parse_term("!(Cx(real_of_num(1)) - cnj((w : Cart[Real, 2])) * (x : Cart[Real, 2]) == Cx(real_of_num(0))) && !(Cx(real_of_num(1)) - cnj(w) * (y : Cart[Real, 2]) == Cx(real_of_num(0))) → (x - w) / (Cx(real_of_num(1)) - cnj(w) * x) - (y - w) / (Cx(real_of_num(1)) - cnj(w) * y) == (Cx(real_of_num(1)) - w * cnj(w)) * (x - y) / ((Cx(real_of_num(1)) - cnj(w) * x) * (Cx(real_of_num(1)) - cnj(w) * y))"))])), t249), t250), t251), t252), t253), t254), t255), t257), @calc_rat.real_arith_tac)
  let t248 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_cnj()]))
  let t247 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t246 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t245 = @simp.gen_rewrite_tac(fn(x242 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s243 = @equal.rand_conv(x242)
    fn(x244 : @kernel.Term) -> @kernel.Thm raise {
      s243(x244)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t241 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num(), @complexes.complex_norm_mul()]))
  let t240 = @tactics.match_mp_tac(@meson.meson(@list.List([@realarith.real_lt_refl()]), @term_syntax.parse_term("norm((x : Cart[Real, _])) < norm((y : Cart[Real, _])) → !(y == x)")))
  let t259 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_sub_0()])), @tactics.conj_tac), t240), t241), t245), t246), t247), t248), t258])
  let t239 = @tactics.subgoal_then(@term_syntax.parse_term("!(Cx(real_of_num(1)) - cnj((w : Cart[Real, 2])) * (x : Cart[Real, 2]) == Cx(real_of_num(0))) && !(Cx(real_of_num(1)) - cnj(w) * (y : Cart[Real, 2]) == Cx(real_of_num(0)))"), @tactics.strip_assume_tac)
  let t238 = @simp.rewrite_tac(@list.List([@cauchy.moebius_function_simple()]))
  let t237 = @simp.asm_simp_tac(@list.List([@cauchy.moebius_function_norm_lt_1(), @real.real_lt_imp_ne()]))
  let t236 = @tactics.match_mp_tac(ddist_kleinify_eq())
  let t260 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t236), t237), t238), t239), t259)
  ddist_kleinify_moebius_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], norm(w) < real_of_num(1) && norm(x) < real_of_num(1) && norm(y) < real_of_num(1) → ddist((kleinify(moebius_function(real_of_num(0), w, x)), kleinify(moebius_function(real_of_num(0), w, y)))) == ddist((kleinify(x), kleinify(y)))"), t260))
}

///|
let ddist_kleinify_moebius_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DDIST_KLEINIFY_MOEBIUS")

///|
/// `DDIST_KLEINIFY_MOEBIUS`
pub fn ddist_kleinify_moebius() -> @kernel.Thm {
  ddist_kleinify_moebius_c.get()
}

///|
/// COLLINEAR_KLEINIFY_MOEBIUS
fn step_25() -> Unit raise {
  let t290 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_sqnorm()), @real.real_pow_1_lt(), @vectors.norm_pos_le(), @calc_num.arith()]))
  let t289 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(1) - (x : Real) - (y : Real)) == (x + y < real_of_num(1))"))]))
  let t288 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t287 = @simp.simp_tac(@list.List([@realarith.real_le_add(), @realax.real_le_mul(), @realarith.real_pos(), @real.real_le_pow_2()]))
  let t291 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) && real_of_num(0) <= (y : Real) → !(x + y == real_of_num(0))"))), t287), t288), t289), t290)
  let t286 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_sqnorm()), @real.real_pow_1_lt(), @vectors.norm_pos_le(), @calc_num.arith()]))
  let t292 = @tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (y : Real) < real_of_num(1) → !(-(x + (y - real_of_num(1))) == real_of_num(0))"))), t286)
  let t285 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_sqnorm()), @real.real_le_pow_2()]))
  let t293 = @list.List([@calc_rat.real_arith_tac, @tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) + (y : Real) → !(x + (y + real_of_num(1)) == real_of_num(0))"))), t285), t292, t291])
  let t284 = @tactics.repeat_tac(@tactics.conj_tac)
  let t283 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @class.de_morgan_thm(), @real.real_pow_eq_0(), @calc_num.arith_eq()]))
  let t282 = @tactics.exists_tac(@term_syntax.parse_term("pow(-(pow(Re((w : Cart[Real, 2])), 2) + (pow(Im(w), 2) - real_of_num(1))), 3) * ((real_of_num(1) - pow(Re((x : Cart[Real, 2])), 2) - pow(Im(x), 2)) * (real_of_num(1) - pow(Re(w), 2) - pow(Im(w), 2)) + (real_of_num(2) * pow(Re(w) - Re(x), 2) + real_of_num(2) * pow(Im(w) - Im(x), 2)))"))
  let t281 = @tactics.exists_tac(@term_syntax.parse_term("pow(Re((x : Cart[Real, 2])), 2) + (pow(Im(x), 2) + real_of_num(1))"))
  let t280 = @tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, a * (lhs : Real) == b * (rhs : Real) && !(a == real_of_num(0)) && !(b == real_of_num(0)) → (lhs == real_of_num(0)) == (rhs == real_of_num(0))")))
  let t279 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_0())]))
  let t278 = @simp.rewrite_tac(@list.List([@complexes.complex_sqnorm(), @complexes.complex_sub(), @complexes.complex_mul(), @complexes.complex_add(), @complexes.complex_neg(), @complexes.cnj(), @complexes.cx_def(), @complexes.re(), @complexes.im()]))
  let t277 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_zero(), @calc_rat.real_field(@term_syntax.parse_term("!((nx : Real) == real_of_num(0)) && !((ny : Real) == real_of_num(0)) && !((nz : Real) == real_of_num(0)) → (((real_of_num(1) + pow((nxw : Real) / nx, 2)) * ((rz : Real) / pow(nz, 2)) - (real_of_num(1) + pow((nzw : Real) / nz, 2)) * ((rx : Real) / pow(nx, 2))) * ((real_of_num(1) + pow(nxw / nx, 2)) * ((iy : Real) / pow(ny, 2)) - (real_of_num(1) + pow((nyw : Real) / ny, 2)) * ((ix : Real) / pow(nx, 2))) == ((real_of_num(1) + pow(nxw / nx, 2)) * ((ry : Real) / pow(ny, 2)) - (real_of_num(1) + pow(nyw / ny, 2)) * (rx / pow(nx, 2))) * ((real_of_num(1) + pow(nxw / nx, 2)) * ((iz : Real) / pow(nz, 2)) - (real_of_num(1) + pow(nzw / nz, 2)) * (ix / pow(nx, 2)))) == (((pow(nx, 2) + pow(nxw, 2)) * rz - (pow(nz, 2) + pow(nzw, 2)) * rx) * ((pow(nx, 2) + pow(nxw, 2)) * iy - (pow(ny, 2) + pow(nyw, 2)) * ix) == ((pow(nx, 2) + pow(nxw, 2)) * ry - (pow(ny, 2) + pow(nyw, 2)) * rx) * ((pow(nx, 2) + pow(nxw, 2)) * iz - (pow(nz, 2) + pow(nzw, 2)) * ix))"))]))
  let t275 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t274 = @tactics.match_mp_tac(@real.real_lt_mul2())
  let t273 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs(real_of_num(1)) == real_of_num(1) * real_of_num(1)"))]))
  let t272 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_cnj(), @complexes.complex_norm_cx()]))
  let t271 = @tactics.match_mp_tac(@meson.meson(@list.List([@realarith.real_lt_refl()]), @term_syntax.parse_term("norm((x : Cart[Real, _])) < norm((y : Cart[Real, _])) → !(y == x)")))
  let t270 = @tactics.repeat_tac(@tactics.conj_tac)
  let t276 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_sub_0()])), t270), t271), t272), t273), t274), t275), @tactics.all_tac])
  let t269 = @tactics.subgoal_then(@term_syntax.parse_term("!(Cx(real_of_num(1)) - cnj((w : Cart[Real, 2])) * (x : Cart[Real, 2]) == Cx(real_of_num(0))) && !(Cx(real_of_num(1)) - cnj(w) * (y : Cart[Real, 2]) == Cx(real_of_num(0))) && !(Cx(real_of_num(1)) - cnj(w) * (z : Cart[Real, 2]) == Cx(real_of_num(0)))"), @tactics.strip_assume_tac)
  let t268 = @simp.rewrite_tac(@list.List([@complexes.re_div_cx(), @equal.gsym(@complexes.cx_pow()), @complexes.im_div_cx()]))
  let t267 = @simp.once_rewrite_tac(@list.List([@complexes.complex_div_cnj()]))
  let t266 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_div(), @cauchy.moebius_function_simple()]))
  let t264 = @calc_rat.real_field(@term_syntax.parse_term("!((nx : Real) == real_of_num(0)) && !((ny : Real) == real_of_num(0)) && !((nz : Real) == real_of_num(0)) → ((real_of_num(2) / nz * (rz : Real) - real_of_num(2) / nx * (rx : Real)) * (real_of_num(2) / ny * (iy : Real) - real_of_num(2) / nx * (ix : Real)) == (real_of_num(2) / ny * (ry : Real) - real_of_num(2) / nx * rx) * (real_of_num(2) / nz * (iz : Real) - real_of_num(2) / nx * ix)) == ((nx * rz - nz * rx) * (nx * iy - ny * ix) == (nx * ry - ny * rx) * (nx * iz - nz * ix))"))
  let t265 = @simp.simp_tac(@list.List([@vectors.norm_pos_le(), @real.real_pow_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → !(real_of_num(1) + x == real_of_num(0))")), t264]))
  let t263 = @simp.rewrite_tac(@list.List([@complexes.re_mul_cx(), @complexes.im_mul_cx()]))
  let t261 = @equal.gsym(@complexes.im_def())
  let t262 = @simp.rewrite_tac(@list.List([@vectors.collinear_3_2d(), kleinify(), @equal.gsym(@complexes.re_def()), t261]))
  let t294 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t262), t263), t265), t266), t267), t268), t269), t276), t277), t278), t279), t280), t281), t282), t283), t284), t293)
  collinear_kleinify_moebius_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], norm(w) < real_of_num(1) && norm(x) < real_of_num(1) && norm(y) < real_of_num(1) && norm(z) < real_of_num(1) → collinear({kleinify(moebius_function(real_of_num(0), w, x)), kleinify(moebius_function(real_of_num(0), w, y)), kleinify(moebius_function(real_of_num(0), w, z))}) == collinear({kleinify(x), kleinify(y), kleinify(z)})"), t294))
}

///|
let collinear_kleinify_moebius_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_KLEINIFY_MOEBIUS")

///|
/// `COLLINEAR_KLEINIFY_MOEBIUS`
pub fn collinear_kleinify_moebius() -> @kernel.Thm {
  collinear_kleinify_moebius_c.get()
}

///|
/// BETWEEN_KLEINIFY_MOEBIUS
fn step_26() -> Unit raise {
  let t295 = @simp.simp_tac(@list.List([between_collinear_ddist_eq(), norm_kleinify_moebius_lt(), norm_kleinify_lt(), @real.real_lt_imp_ne(), collinear_kleinify_moebius(), ddist_kleinify_moebius()]))
  between_kleinify_moebius_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], norm(w) < real_of_num(1) && norm(x) < real_of_num(1) && norm(y) < real_of_num(1) && norm(z) < real_of_num(1) → between(kleinify(moebius_function(real_of_num(0), w, x)), (kleinify(moebius_function(real_of_num(0), w, y)), kleinify(moebius_function(real_of_num(0), w, z)))) == between(kleinify(x), (kleinify(y), kleinify(z)))"), t295))
}

///|
let between_kleinify_moebius_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BETWEEN_KLEINIFY_MOEBIUS")

///|
/// `BETWEEN_KLEINIFY_MOEBIUS`
pub fn between_kleinify_moebius() -> @kernel.Thm {
  between_kleinify_moebius_c.get()
}

///|
/// hyperbolic_isometry
fn step_27() -> Unit raise {
  hyperbolic_isometry_c.set(@pair.new_definition(@term_syntax.parse_term("(hyperbolic_isometry : ((Cart[Real, 2]) -> Cart[Real, 2]) -> Bool)((f : (Cart[Real, 2]) -> Cart[Real, 2])) == ((∀ x : Cart[Real, 2], norm(x) < real_of_num(1) → norm(f(x)) < real_of_num(1)) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], norm(x) < real_of_num(1) && norm(y) < real_of_num(1) → ddist((f(x), f(y))) == ddist((x, y))) && (∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], norm(x) < real_of_num(1) && norm(y) < real_of_num(1) && norm(z) < real_of_num(1) → between(f(x), (f(y), f(z))) == between(x, (y, z))))")))
}

///|
let hyperbolic_isometry_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hyperbolic_isometry")

///|
/// `hyperbolic_isometry`
pub fn hyperbolic_isometry() -> @kernel.Thm {
  hyperbolic_isometry_c.get()
}

///|
/// HYPERBOLIC_TRANSLATION
fn step_28() -> Unit raise {
  let t303 = @simp.asm_simp_tac(@list.List([@cauchy.moebius_function_simple(), @complexes.complex_sub_refl(), @complexes.complex_div(), @complexes.complex_vec_0(), kleinify_0(), poincarify_0(), @complexes.complex_mul_lzero(), @complexes.complex_mul_rzero(), @complexes.complex_sub_lzero(), @complexes.complex_neg_neg(), @complexes.complex_sub_rzero(), @complexes.complex_inv_1(), @complexes.complex_mul_rid(), kleinify_poincarify()]))
  let t302 = @simp.asm_simp_tac(@list.List([norm_kleinify_moebius_lt(), norm_poincarify_lt(), ddist_kleinify_moebius(), kleinify_poincarify(), @vectors.vector_neg_neg(), between_kleinify_moebius(), @vectors.norm_neg(), @cauchy.moebius_function_compose(), poincarify_kleinify(), @cauchy.moebius_function_norm_lt_1()]))
  let t300 = @term_syntax.parse_term("(x : Cart[Real, 2]) => kleinify(moebius_function(real_of_num(0), -poincarify((w : Cart[Real, 2])), poincarify(x)))")
  let t301 = @tactics.map_every(fn(x297 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s298 = @tactics.exists_tac(x297)
    fn(x299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s298(x299)
    }
  }, @list.List([@term_syntax.parse_term("(x : Cart[Real, 2]) => kleinify(moebius_function(real_of_num(0), poincarify((w : Cart[Real, 2])), poincarify(x)))"), t300]))
  let t296 = @simp.simp_tac(@list.List([hyperbolic_isometry()]))
  let t304 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t296), t301), t302), t303)
  hyperbolic_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], norm(w) < real_of_num(1) → (∃ f : (Cart[Real, 2]) -> Cart[Real, 2], ∃ g : (Cart[Real, 2]) -> Cart[Real, 2], hyperbolic_isometry(f) && hyperbolic_isometry(g) && f(w) == vec(0) && g(vec(0)) == w && (∀ x : Cart[Real, 2], norm(x) < real_of_num(1) → f(g(x)) == x) && (∀ x : Cart[Real, 2], norm(x) < real_of_num(1) → g(f(x)) == x))"), t304))
}

///|
let hyperbolic_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERBOLIC_TRANSLATION")

///|
/// `HYPERBOLIC_TRANSLATION`
pub fn hyperbolic_translation() -> @kernel.Thm {
  hyperbolic_translation_c.get()
}

///|
/// plane_tybij
fn step_29() -> Unit raise {
  let t305 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(vec : (Num) -> Cart[Real, 2])(0)")), @vectors.norm_arith_tac)
  let th = @tactics.prove(@term_syntax.parse_term("∃ x : Cart[Real, 2], norm(x) < real_of_num(1)"), t305)
  plane_tybij_c.set(@class.new_type_definition("plane", ("mk_plane", "dest_plane"), th))
}

///|
let plane_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("plane_tybij")

///|
/// `plane_tybij`
pub fn plane_tybij() -> @kernel.Thm {
  plane_tybij_c.get()
}

///|
/// pbetween
fn step_30() -> Unit raise {
  pbetween_c.set(@pair.new_definition(@term_syntax.parse_term("(pbetween : (Plane, (Plane, Plane)) -> Bool)((y : Plane), ((x : Plane), (z : Plane))) == between(dest_plane(y), (dest_plane(x), dest_plane(z)))")))
}

///|
let pbetween_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pbetween")

///|
/// `pbetween`
pub fn pbetween() -> @kernel.Thm {
  pbetween_c.get()
}

///|
/// pdist
fn step_31() -> Unit raise {
  pdist_c.set(@pair.new_definition(@term_syntax.parse_term("(pdist : ((Plane, Plane)) -> Real)(((x : Plane), (y : Plane))) == ddist((dest_plane(x), dest_plane(y)))")))
}

///|
let pdist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pdist")

///|
/// `pdist`
pub fn pdist() -> @kernel.Thm {
  pdist_c.get()
}

///|
/// DEST_PLANE_NORM_LT
fn step_32() -> Unit raise {
  let t306 = @meson.meson_tac(@list.List([plane_tybij()]))
  dest_plane_norm_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Plane, norm(dest_plane(x)) < real_of_num(1)"), t306))
}

///|
let dest_plane_norm_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_PLANE_NORM_LT")

///|
/// `DEST_PLANE_NORM_LT`
pub fn dest_plane_norm_lt() -> @kernel.Thm {
  dest_plane_norm_lt_c.get()
}

///|
/// DEST_PLANE_EQ
fn step_33() -> Unit raise {
  let t307 = @meson.meson_tac(@list.List([plane_tybij()]))
  dest_plane_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Plane, ∀ y : Plane, (dest_plane(x) == dest_plane(y)) == (x == y)"), t307))
}

///|
let dest_plane_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_PLANE_EQ")

///|
/// `DEST_PLANE_EQ`
pub fn dest_plane_eq() -> @kernel.Thm {
  dest_plane_eq_c.get()
}

///|
/// FORALL_DEST_PLANE
fn step_34() -> Unit raise {
  let t308 = @meson.meson_tac(@list.List([plane_tybij()]))
  forall_dest_plane_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Cart[Real, 2]) -> Bool, (∀ x : Plane, P(dest_plane(x))) == (∀ x : Cart[Real, 2], norm(x) < real_of_num(1) → P(x))"), t308))
}

///|
let forall_dest_plane_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_DEST_PLANE")

///|
/// `FORALL_DEST_PLANE`
pub fn forall_dest_plane() -> @kernel.Thm {
  forall_dest_plane_c.get()
}

///|
/// EXISTS_DEST_PLANE
fn step_35() -> Unit raise {
  let t309 = @meson.meson_tac(@list.List([plane_tybij()]))
  exists_dest_plane_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Cart[Real, 2]) -> Bool, (∃ x : Plane, P(dest_plane(x))) == (∃ x : Cart[Real, 2], norm(x) < real_of_num(1) && P(x))"), t309))
}

///|
let exists_dest_plane_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_DEST_PLANE")

///|
/// `EXISTS_DEST_PLANE`
pub fn exists_dest_plane() -> @kernel.Thm {
  exists_dest_plane_c.get()
}

///|
/// TARSKI_AXIOM_1_NONEUCLIDEAN
fn step_36() -> Unit raise {
  let t310 = @simp.rewrite_tac(@list.List([pdist(), ddist_sym()]))
  tarski_axiom_1_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Plane, ∀ b : Plane, pdist((a, b)) == pdist((b, a))"), t310))
}

///|
let tarski_axiom_1_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_1_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_1_NONEUCLIDEAN`
pub fn tarski_axiom_1_noneuclidean() -> @kernel.Thm {
  tarski_axiom_1_noneuclidean_c.get()
}

///|
/// TARSKI_AXIOM_2_NONEUCLIDEAN
fn step_37() -> Unit raise {
  tarski_axiom_2_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Plane, ∀ b : Plane, ∀ p : Plane, ∀ q : Plane, ∀ r : Plane, ∀ s : Plane, pdist((a, b)) == pdist((p, q)) && pdist((a, b)) == pdist((r, s)) → pdist((p, q)) == pdist((r, s))"), @calc_rat.real_arith_tac))
}

///|
let tarski_axiom_2_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_2_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_2_NONEUCLIDEAN`
pub fn tarski_axiom_2_noneuclidean() -> @kernel.Thm {
  tarski_axiom_2_noneuclidean_c.get()
}

///|
/// TARSKI_AXIOM_3_NONEUCLIDEAN
fn step_38() -> Unit raise {
  let t311 = @simp.simp_tac(@list.List([forall_dest_plane(), pdist(), ddist_refl(), ddist_eq_0(), dest_plane_eq()]))
  tarski_axiom_3_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Plane, ∀ b : Plane, ∀ c : Plane, pdist((a, b)) == pdist((c, c)) → a == b"), t311))
}

///|
let tarski_axiom_3_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_3_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_3_NONEUCLIDEAN`
pub fn tarski_axiom_3_noneuclidean() -> @kernel.Thm {
  tarski_axiom_3_noneuclidean_c.get()
}

///|
/// TARSKI_AXIOM_4_NONEUCLIDEAN
fn step_39() -> Unit raise {
  let t354 = @meson.asm_meson_tac(@list.List([]))
  let t353 = @tactics.exists_tac(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((x : Cart[Real, 2]))"))
  let t352 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t351 = @simp.asm_simp_tac(@list.List([]))
  let t346 = @term_syntax.parse_term("(d : Cart[Real, 2])")
  let t347 = @list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((q : Cart[Real, 2]))"), t346])
  let t350 = @tactics.remove_then("*", fn(x349 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x343 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s344 = @tactics.mp_tac(x343)
      fn(x345 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s344(x345)
      }
    })(((x348 : @kernel.Thm) => @bool.specl(t347, x348))(x349))
  })
  let t341 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t342 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t341]))
  let t340 = @simp.asm_rewrite_tac(@list.List([hyperbolic_isometry(), @theorems.left_imp_exists_thm()]))
  let t339 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(a : Cart[Real, 2])"), hyperbolic_translation()))
  let t338 = @tactics.repeat_tac(@tactics.strip_tac)
  let t355 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s336 = ((x334 : @kernel.Thm) => @tactics.label_tac("*", x334))(x335)
    fn(x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s336(x337)
    }
  }), t338), t339), t340), t342), @tactics.strip_tac), t350), t351), t352), t353), t354)
  let t333 = @meson.meson_tac(@list.List([@vectors.dist_0(), ddist_eq_origin()]))
  let t356 = @list.List([@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(vec : (Num) -> Cart[Real, 2])(0)"), @tarski.tarski_axiom_4_euclidean())), t333), t355])
  let t332 = @simp.rewrite_tac(@list.List([@vectors.norm_0(), @real.real_lt_01()]))
  let t331 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(P : (Cart[Real, _]) -> Bool)(vec(0)) && (P(vec(0)) → (∀ x : Cart[Real, _], P(x))) → (∀ x : Cart[Real, _], P(x))")))
  let t328 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t329 = @term_syntax.parse_term("(q : Cart[Real, 2])")
  let t330 = @tactics.map_every(fn(x326 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x326
    @tactics.spec_tac(t, t)
  }, @list.List([@term_syntax.parse_term("(d : Cart[Real, 2])"), t329, t328]))
  let t324 = @tactics.repeat_tac(@tactics.pop_assum(fn(x323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t325 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t324])
  let t322 = @tactics.subgoal_then(@term_syntax.parse_term("norm((a : Cart[Real, 2])) < real_of_num(1) && norm((q : Cart[Real, 2])) < real_of_num(1) && norm((d : Cart[Real, 2])) < real_of_num(1)"), fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s320 = @tactics.mp_tac(x319)
    fn(x321 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s320(x321)
    }
  })
  let t317 = @simp.asm_rewrite_tac(@list.List([]))
  let t316 = @meson.asm_meson_tac(@list.List([]))
  let t315 = @simp.asm_rewrite_tac(@list.List([hyperbolic_isometry()]))
  let t318 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(b : Cart[Real, 2])"), hyperbolic_translation())), t315), t316), t317])
  let t314 = @tactics.subgoal_then(@term_syntax.parse_term("∃ d : Cart[Real, 2], norm(d) < real_of_num(1) && ddist(((b : Cart[Real, 2]), (c : Cart[Real, 2]))) == ddist((vec(0), d))"), @tactics.strip_assume_tac)
  let t313 = @tactics.repeat_tac(@tactics.gen_tac)
  let t312 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t357 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([pbetween(), pdist(), forall_dest_plane(), exists_dest_plane()])), t312), t313), @tactics.disch_tac), t314), t318), t322), t325), t330), t331), t332), @tactics.conj_tac), t356)
  tarski_axiom_4_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Plane, ∀ q : Plane, ∀ b : Plane, ∀ c : Plane, ∃ x : Plane, pbetween(a, (q, x)) && pdist((a, x)) == pdist((b, c))"), t357))
}

///|
let tarski_axiom_4_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_4_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_4_NONEUCLIDEAN`
pub fn tarski_axiom_4_noneuclidean() -> @kernel.Thm {
  tarski_axiom_4_noneuclidean_c.get()
}

///|
/// TARSKI_AXIOM_5_NONEUCLIDEAN
fn step_40() -> Unit raise {
  let t413 = @meson.asm_meson_tac(@list.List([@vectors.dist_sym(), @vectors.dist_0()]))
  let t410 = @simp.asm_simp_tac(@list.List([ddist_eq_origin()]))
  let t411 = @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t410), @tactics.disch_tac)
  let t412 = @list.List([@simp.asm_simp_tac(@list.List([])), t411])
  let t409 = @tactics.subgoal_then(@term_syntax.parse_term("ddist(((f : (Cart[Real, 2]) -> Cart[Real, 2])((b : Cart[Real, 2])), f((x : Cart[Real, 2])))) == ddist(((g : (Cart[Real, 2]) -> Cart[Real, 2])((b' : Cart[Real, 2])), g((x' : Cart[Real, 2]))))"), fn(x406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s407 = @tactics.mp_tac(x406)
    fn(x408 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s407(x408)
    }
  })
  let t399 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((x' : Cart[Real, 2]))")
  let t400 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((c' : Cart[Real, 2]))")
  let t401 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((b' : Cart[Real, 2]))")
  let t402 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((a' : Cart[Real, 2]))")
  let t403 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((x : Cart[Real, 2]))")
  let t404 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((c : Cart[Real, 2]))")
  let t405 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((b : Cart[Real, 2]))")
  let t414 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((a : Cart[Real, 2]))"), t405, t404, t403, t402, t401, t400, t399]), @tarski.tarski_axiom_5_euclidean()))), t409), t412), t413)
  let t398 = @meson.asm_meson_tac(@list.List([ddist_sym()]))
  let t397 = @simp.asm_simp_tac(@list.List([]))
  let t396 = @simp.gen_rewrite_tac(fn(x395 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x389 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s390 = @equal.rand_conv(x389)
      fn(x391 : @kernel.Term) -> @kernel.Thm raise {
        s390(x391)
      }
    })((fn(x392 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s393 = @equal.once_depth_conv(x392)
      fn(x394 : @kernel.Term) -> @kernel.Thm raise {
        s393(x394)
      }
    })(x395))
  }, @list.List([@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((b' : Cart[Real, 2])) == vec(0)")))]))
  let t388 = @simp.gen_rewrite_tac(fn(x387 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x381 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s382 = @equal.land_conv(x381)
      fn(x383 : @kernel.Term) -> @kernel.Thm raise {
        s382(x383)
      }
    })((fn(x384 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s385 = @equal.once_depth_conv(x384)
      fn(x386 : @kernel.Term) -> @kernel.Thm raise {
        s385(x386)
      }
    })(x387))
  }, @list.List([@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((b : Cart[Real, 2])) == vec(0)")))]))
  let t415 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(ddist_congruent_triples_0())])), @tactics.conj_tac), t388), t396), t397), t398), t414])
  let t380 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && ((q : Bool) → (r : Bool)) → p == q → r")))
  let t379 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t375 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((c' : Cart[Real, 2]))")
  let t376 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((a' : Cart[Real, 2]))")
  let t377 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((c : Cart[Real, 2]))")
  let t378 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((a : Cart[Real, 2]))"), t377, t376, t375]), ddist_congruent_triples_0()))
  let t374 = @list.List([@meson.asm_meson_tac(@list.List([ddist_sym()])), @tactics.all_tac])
  let t373 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((p : Bool) → (r : Bool)) && (q : Bool) → p == q → r")))
  let t372 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t368 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((c' : Cart[Real, 2]))")
  let t369 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((x' : Cart[Real, 2]))")
  let t370 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((c : Cart[Real, 2]))")
  let t371 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((x : Cart[Real, 2]))"), t370, t369, t368]), ddist_congruent_triples_0()))
  let t367 = @tactics.repeat_tac(@tactics.strip_tac)
  let t363 = @term_syntax.parse_term("(g' : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t364 = @term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t365 = @term_syntax.parse_term("(f' : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t366 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t365, t364, t363]))
  let t362 = @simp.rewrite_tac(@list.List([hyperbolic_isometry()]))
  let t361 = @simp.asm_rewrite_tac(@list.List([@theorems.right_imp_forall_thm(), @theorems.left_imp_exists_thm()]))
  let t360 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(b : Cart[Real, 2])"), hyperbolic_translation()))
  let t359 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(b' : Cart[Real, 2])"), hyperbolic_translation()))
  let t358 = @tactics.repeat_tac(@tactics.strip_tac)
  let t416 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_dest_plane(), pdist(), pbetween(), @equal.gsym(dest_plane_eq())])), t358), t359), t360), t361), t362), t366), t367), t371), @tactics.ants_tac), t372), t373), @tactics.conj_tac), t374), t378), @tactics.ants_tac), t379), t380), @tactics.conj_tac), t415)
  tarski_axiom_5_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Plane, ∀ b : Plane, ∀ c : Plane, ∀ x : Plane, ∀ a' : Plane, ∀ b' : Plane, ∀ c' : Plane, ∀ x' : Plane, !(a == b) && pdist((a, b)) == pdist((a', b')) && pdist((a, c)) == pdist((a', c')) && pdist((b, c)) == pdist((b', c')) && pbetween(b, (a, x)) && pbetween(b', (a', x')) && pdist((b, x)) == pdist((b', x')) → pdist((c, x)) == pdist((c', x'))"), t416))
}

///|
let tarski_axiom_5_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_5_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_5_NONEUCLIDEAN`
pub fn tarski_axiom_5_noneuclidean() -> @kernel.Thm {
  tarski_axiom_5_noneuclidean_c.get()
}

///|
/// TARSKI_AXIOM_6_NONEUCLIDEAN
fn step_41() -> Unit raise {
  let t417 = @meson.meson_tac(@list.List([@tarski.tarski_axiom_6_euclidean()]))
  let t418 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pbetween(), forall_dest_plane(), @equal.gsym(dest_plane_eq())])), t417)
  tarski_axiom_6_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Plane, ∀ b : Plane, pbetween(b, (a, a)) → a == b"), t418))
}

///|
let tarski_axiom_6_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_6_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_6_NONEUCLIDEAN`
pub fn tarski_axiom_6_noneuclidean() -> @kernel.Thm {
  tarski_axiom_6_noneuclidean_c.get()
}

///|
/// TARSKI_AXIOM_7_NONEUCLIDEAN
fn step_42() -> Unit raise {
  let t419 = @meson.meson_tac(@list.List([@convex.between_norm_lt(), @tarski.tarski_axiom_7_euclidean()]))
  let t420 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pbetween(), forall_dest_plane(), exists_dest_plane()])), t419)
  tarski_axiom_7_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Plane, ∀ b : Plane, ∀ c : Plane, ∀ p : Plane, ∀ q : Plane, pbetween(p, (a, c)) && pbetween(q, (b, c)) → (∃ x : Plane, pbetween(x, (p, b)) && pbetween(x, (q, a)))"), t420))
}

///|
let tarski_axiom_7_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_7_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_7_NONEUCLIDEAN`
pub fn tarski_axiom_7_noneuclidean() -> @kernel.Thm {
  tarski_axiom_7_noneuclidean_c.get()
}

///|
/// TARSKI_AXIOM_8_NONEUCLIDEAN
fn step_43() -> Unit raise {
  let t437 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t436 = @simp.simp_tac(@list.List([@vectors.collinear_3_2d(), @vectors.vector_mul_component(), @vectors.vec_component(), @calc_num.arith(), @vectors.basis_component(), @cart.dimindex_2()]))
  let t433 = @drule.match_mp(@vectors.between_imp_collinear())
  let t435 = @tactics.disch_then(fn(x434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s431 = @tactics.mp_tac(x430)
      fn(x432 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s431(x432)
      }
    })(t433(x434))
  })
  let t429 = @tactics.repeat_tac(@tactics.conj_tac)
  let t426 = @term_syntax.parse_term("(op_pct : (Real, Cart[Real, 2]) -> Cart[Real, 2])(real_of_num(1) / real_of_num(2), (basis : (Num) -> Cart[Real, 2])(2))")
  let t427 = @term_syntax.parse_term("(op_pct : (Real, Cart[Real, 2]) -> Cart[Real, 2])(real_of_num(1) / real_of_num(2), (basis : (Num) -> Cart[Real, 2])(1))")
  let t428 = @tactics.map_every(fn(x421 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x421
    let t425 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
    let t424 = @simp.rewrite_tac(@list.List([@vectors.dot_lzero()]))
    let t423 = @simp.simp_tac(@list.List([@vectors.dot_lmul(), @vectors.dot_rmul(), @vectors.dot_basis_basis(), @cart.dimindex_2(), @calc_num.arith()]))
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(t), t423), t424), t425)
  }, @list.List([@term_syntax.parse_term("(vec : (Num) -> Cart[Real, 2])(0)"), t427, t426]))
  let t438 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([pbetween(), exists_dest_plane(), @vectors.norm_lt_square(), @vectors.norm_pow_2()])), t428), t429), t435), t436), t437)
  tarski_axiom_8_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∃ a : Plane, ∃ b : Plane, ∃ c : Plane, !pbetween(b, (a, c)) && !pbetween(c, (b, a)) && !pbetween(a, (c, b))"), t438))
}

///|
let tarski_axiom_8_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_8_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_8_NONEUCLIDEAN`
pub fn tarski_axiom_8_noneuclidean() -> @kernel.Thm {
  tarski_axiom_8_noneuclidean_c.get()
}

///|
/// TARSKI_AXIOM_9_NONEUCLIDEAN
fn step_44() -> Unit raise {
  let t481 = @tactics.conv_tac(@calc_rat.real_ring)
  let t480 = @simp.rewrite_tac(@list.List([@vectors.collinear_3_2d(), @vectors.vector_sub_component(), @vectors.dot_2(), @equal.gsym(@vectors.dot_eq_0()), @vectors.vector_neg_component()]))
  let t479 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(-(x : Cart[Real, N]) == x) == (x == vec(0))"))]))
  let t478 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_lt(), @misc.abs_square_lt_1(), @vectors.real_abs_norm(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (x : Real) && real_of_num(0) < (y : Real) → ((a : Real) * (inv(x) * inv(y)) - real_of_num(1) == (b : Real) * (inv(x) * inv(y)) - real_of_num(1)) == (a == b)"))]))
  let t477 = @simp.asm_simp_tac(@list.List([@vectors.norm_neg(), @realax.real_div(), @real.real_inv_mul()]))
  let t482 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ddist()])), t477), t478), t479), t480), t481)
  let t475 = @vectors.norm_arith(@term_syntax.parse_term("(norm((a : Cart[Real, N])) == norm((b : Cart[Real, _]))) == (distance((a, vec(0))) == distance((vec(0), b)))"))
  let t476 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.midpoint_between()), @vectors.midpoint(), t475]))
  let t474 = @simp.asm_simp_tac(@list.List([ddist_eq_origin()]))
  let t473 = @simp.asm_rewrite_tac(@list.List([]))
  let t472 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t483 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("between((f : (Cart[Real, 2]) -> Cart[Real, 2])((x : Cart[Real, 2])), (f((p : Cart[Real, 2])), f((q : Cart[Real, 2])))) && ddist((f(x), f(p))) == ddist((f(x), f(q)))"), fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s470 = @tactics.mp_tac(x469)
    fn(x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s470(x471)
    }
  }), t472), t473), t474), t476), @vectors.vector_arith_tac), t482])
  let t468 = @tactics.subgoal_then(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((q : Cart[Real, 2])) == -f((p : Cart[Real, 2]))"), fn(x465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s466 = @tactics.subst1_tac(x465)
    fn(x467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s466(x467)
    }
  })
  let t464 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t463 = @tactics.subgoal_then(@term_syntax.parse_term("ddist(((f : (Cart[Real, 2]) -> Cart[Real, 2])((a : Cart[Real, 2])), f((p : Cart[Real, 2])))) == ddist((f(a), f((q : Cart[Real, 2])))) && ddist((f((b : Cart[Real, 2])), f(p))) == ddist((f(b), f(q))) && ddist((f((c : Cart[Real, 2])), f(p))) == ddist((f(c), f(q))) && !(f(q) == f(p))"), fn(x460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s461 = @tactics.mp_tac(x460)
    fn(x462 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s461(x462)
    }
  })
  let t459 = @list.List([@tactics.all_tac, @simp.asm_simp_tac(@list.List([@vectors.collinear_between_cases()]))])
  let t458 = @tactics.subgoal_then(@term_syntax.parse_term("collinear({(f : (Cart[Real, 2]) -> Cart[Real, 2])((b : Cart[Real, 2])), f((c : Cart[Real, 2])), f((a : Cart[Real, 2]))})"), fn(x455 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s456 = @tactics.mp_tac(x455)
    fn(x457 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s456(x457)
    }
  })
  let t454 = @tactics.repeat_tac(@tactics.strip_tac)
  let t453 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.collinear_between_cases())]))
  let t452 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), hyperbolic_isometry()]))
  let t450 = @simp.once_rewrite_tac(@list.List([@vectors.between_sym()]))
  let t451 = @list.List([@meson.asm_meson_tac(@list.List([@convex.between_norm_lt()])), t450])
  let t449 = @tactics.subgoal_then(@term_syntax.parse_term("norm((x : Cart[Real, 2])) < real_of_num(1)"), fn(x446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s447 = @tactics.assume_tac(x446)
    fn(x448 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s447(x448)
    }
  })
  let t445 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Cart[Real, 2])"), hyperbolic_translation()))
  let t444 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t443 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t441 = @term_syntax.parse_term("(q : Cart[Real, 2])")
  let t442 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(p : Cart[Real, 2])"), t441]), hyperbolic_midpoint()))
  let t440 = @tactics.repeat_tac(@tactics.strip_tac)
  let t439 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t484 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([pdist(), pbetween(), forall_dest_plane(), @equal.gsym(dest_plane_eq())])), t439), t440), t442), t443), t444), @tactics.strip_tac), t445), t449), t451), t452), t453), t454), t458), t459), t463), t464), t468), t483)
  tarski_axiom_9_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Plane, ∀ q : Plane, ∀ a : Plane, ∀ b : Plane, ∀ c : Plane, !(p == q) && pdist((a, p)) == pdist((a, q)) && pdist((b, p)) == pdist((b, q)) && pdist((c, p)) == pdist((c, q)) → pbetween(b, (a, c)) || pbetween(c, (b, a)) || pbetween(a, (c, b))"), t484))
}

///|
let tarski_axiom_9_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_9_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_9_NONEUCLIDEAN`
pub fn tarski_axiom_9_noneuclidean() -> @kernel.Thm {
  tarski_axiom_9_noneuclidean_c.get()
}

///|
/// NOT_TARSKI_AXIOM_10_NONEUCLIDEAN
fn step_45() -> Unit raise {
  let t547 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t546 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @calc_num.arith(), @vectors.basis_component(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component()]))
  let t544 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) / real_of_num(2)"))
  let t545 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("real_of_num(5) / real_of_num(12)")), t544, @tactics.all_tac])
  let t543 = @tactics.repeat_tac(@tactics.conj_tac)
  let t542 = @simp.rewrite_tac(@list.List([@topology.between_in_segment(), @topology.in_segment()]))
  let t541 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t540 = @simp.simp_tac(@list.List([@vectors.norm_lt_square(), @vectors.norm_pow_2(), @vectors.dot_ladd(), @vectors.dot_radd(), @vectors.dot_lzero(), @vectors.dot_lmul(), @vectors.dot_rmul(), @vectors.dot_basis_basis(), @cart.dimindex_2(), @calc_num.arith()]))
  let t536 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_le_square_abs()])), @calc_rat.real_arith_tac)
  let t535 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t534 = @tactics.match_mp_tac(@real.real_le_add2())
  let t537 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_mul()])), t534), @tactics.conj_tac), t535), @calc_rat.asm_real_arith_tac), t536])
  let t531 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * real_of_num(0) + (y : Real) == (x : Real) + (b : Real) * real_of_num(0) → abs(x) + abs(y) <= (real_of_num(1) - (u : Real)) * real_of_num(1) + u * real_of_num(1) → abs(x) <= abs(real_of_num(1) / real_of_num(2)) && abs(y) <= abs(real_of_num(1) / real_of_num(2))")))
  let t533 = @tactics.disch_then(fn(x532 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s529 = @tactics.mp_tac(x528)
      fn(x530 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s529(x530)
      }
    })(t531(x532))
  })
  let t527 = @simp.asm_simp_tac(@list.List([@cart.dimindex_2(), @vectors.forall_2(), @vectors.dot_2(), @vectors.vector_add_component(), @calc_num.arith(), @vectors.vector_mul_component(), @vectors.basis_component(), @cart.dimindex_2()]))
  let t526 = @simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.dot_ladd(), @vectors.dot_radd(), @vectors.dot_lmul(), @vectors.dot_rmul()]))
  let t524 = @simp.asm_rewrite_tac(@list.List([]))
  let t525 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @calc_num.arith(), @vectors.basis_component(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component()])), @calc_rat.real_arith_tac), t524])
  let t538 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("op_dollar(op_pct(real_of_num(3) / real_of_num(5), basis(1)) + op_pct(real_of_num(3) / real_of_num(5), basis(2)), 2) == op_dollar(op_pct(real_of_num(3) / real_of_num(5), basis(1)) + op_pct(real_of_num(3) / real_of_num(5), basis(2)), 1)"), fn(x521 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s522 = @tactics.mp_tac(x521)
    fn(x523 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s522(x523)
    }
  }), t525), t526), t527), t533), @tactics.ants_tac), t537), @tactics.all_tac])
  let t520 = @tactics.subgoal_then(@term_syntax.parse_term("pow(norm(op_pct(real_of_num(3) / real_of_num(5), basis(1)) + op_pct(real_of_num(3) / real_of_num(5), basis(2))), 2) <= real_of_num(1) / real_of_num(2)"), fn(x517 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s518 = @tactics.mp_tac(x517)
    fn(x519 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s518(x519)
    }
  })
  let t516 = @tactics.repeat_tac(@tactics.strip_tac)
  let t515 = @simp.simp_tac(@list.List([@cart.dimindex_2(), @calc_num.arith(), @topology.between_in_segment(), @topology.in_segment()]))
  let t513 = @term_syntax.parse_term("2")
  let t514 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(y : Cart[Real, 2])"), t513]), @vectors.component_le_norm()))
  let t511 = @term_syntax.parse_term("1")
  let t512 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, 2])"), t511]), @vectors.component_le_norm()))
  let t510 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t509 = @simp.rewrite_tac(@list.List([@realarith.real_entire()]))
  let t508 = @simp.rewrite_tac(@list.List([@real.real_sub_lzero(), @calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @real.real_sub_rzero(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) == real_of_num(1) / real_of_num(2) * (x : Real)) == (x == real_of_num(0))"))]))
  let t507 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t506 = @simp.simp_tac(@list.List([@vectors.collinear_3_2d(), @vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith(), @vectors.vec_component(), @vectors.vector_mul_component()]))
  let t503 = @drule.match_mp(@vectors.between_imp_collinear())
  let t505 = @tactics.disch_then(@tactics.conjuncts_then(fn(x504 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x500 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s501 = @tactics.mp_tac(x500)
      fn(x502 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s501(x502)
      }
    })(t503(x504))
  }))
  let t499 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t498 = @tactics.repeat_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac))
  let t497 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t539 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.not_exists_thm(), @class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (p → !q)"))])), t497), t498), t499), t505), t506), t507), t508), t509), t510), t512), t514), t515), t516), t520), t538)])
  let t496 = @simp.rewrite_tac(@list.List([@class.not_imp(), @theorems.conj_assoc()]))
  let t488 = @term_syntax.parse_term("op_pct(real_of_num(3) / real_of_num(5), basis(1)) + op_pct(real_of_num(3) / real_of_num(5), basis(2))")
  let t489 = @term_syntax.parse_term("op_pct(real_of_num(1) / real_of_num(4), basis(1)) + op_pct(real_of_num(1) / real_of_num(4), basis(2))")
  let t490 = @term_syntax.parse_term("(op_pct : (Real, Cart[Real, 2]) -> Cart[Real, 2])(real_of_num(1) / real_of_num(2), (basis : (Num) -> Cart[Real, 2])(2))")
  let t491 = @term_syntax.parse_term("(op_pct : (Real, Cart[Real, 2]) -> Cart[Real, 2])(real_of_num(1) / real_of_num(2), (basis : (Num) -> Cart[Real, 2])(1))")
  let t492 = @list.List([@term_syntax.parse_term("(vec : (Num) -> Cart[Real, 2])(0)"), t491, t490, t489, t488])
  let t495 = @tactics.disch_then(fn(x494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s486 = @tactics.mp_tac(x485)
      fn(x487 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s486(x487)
      }
    })(((x493 : @kernel.Thm) => @bool.specl(t492, x493))(x494))
  })
  let t548 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([pbetween(), forall_dest_plane(), exists_dest_plane(), @equal.gsym(dest_plane_eq()), @theorems.right_imp_forall_thm(), @theorems.imp_imp()])), t495), t496), @tactics.conj_tac), t539), t540), t541), t542), t543), t545), t546), t547)
  not_tarski_axiom_10_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("!(∀ a : Plane, ∀ b : Plane, ∀ c : Plane, ∀ d : Plane, ∀ t : Plane, pbetween(d, (a, t)) && pbetween(d, (b, c)) && !(a == d) → (∃ x : Plane, ∃ y : Plane, pbetween(b, (a, x)) && pbetween(c, (a, y)) && pbetween(t, (x, y))))"), t548))
}

///|
let not_tarski_axiom_10_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_TARSKI_AXIOM_10_NONEUCLIDEAN")

///|
/// `NOT_TARSKI_AXIOM_10_NONEUCLIDEAN`
pub fn not_tarski_axiom_10_noneuclidean() -> @kernel.Thm {
  not_tarski_axiom_10_noneuclidean_c.get()
}

///|
/// TARSKI_AXIOM_11_NONEUCLIDEAN
fn step_46() -> Unit raise {
  let t560 = @meson.asm_meson_tac(@list.List([@sets.member_not_empty(), dest_plane_norm_lt(), @convex.between_norm_lt()]))
  let t558 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t559 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t558])
  let t557 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t555 = @term_syntax.parse_term("IMAGE(dest_plane, (Y : (Plane) -> Bool))")
  let t556 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE(dest_plane, (X : (Plane) -> Bool))"), t555]), @tarski.tarski_axiom_11_euclidean()))
  let t554 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t553 = @simp.rewrite_tac(@list.List([pbetween(), exists_dest_plane()]))
  let t552 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t551 = @class.asm_cases_tac(@term_syntax.parse_term("(Y : (Plane) -> Bool) == {}"))
  let t550 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t549 = @class.asm_cases_tac(@term_syntax.parse_term("(X : (Plane) -> Bool) == {}"))
  let t561 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t549), t550), t551), t552), t553), t554), t556), t557), @tactics.ants_tac), t559), t560)
  tarski_axiom_11_noneuclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ X : (Plane) -> Bool, ∀ Y : (Plane) -> Bool, (∃ a : Plane, ∀ x : Plane, ∀ y : Plane, IN(x, X) && IN(y, Y) → pbetween(x, (a, y))) → (∃ b : Plane, ∀ x : Plane, ∀ y : Plane, IN(x, X) && IN(y, Y) → pbetween(b, (x, y)))"), t561))
}

///|
let tarski_axiom_11_noneuclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_11_NONEUCLIDEAN")

///|
/// `TARSKI_AXIOM_11_NONEUCLIDEAN`
pub fn tarski_axiom_11_noneuclidean() -> @kernel.Thm {
  tarski_axiom_11_noneuclidean_c.get()
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
}
