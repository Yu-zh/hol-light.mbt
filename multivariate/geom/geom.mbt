// Translated from upstream Multivariate/geom.ml; edit this file directly.

///|
/// Multivariate/geom.ml:7
fn step_1() -> Unit raise {
  @vectors.prioritize_vector(())
}

///|
/// PYTHAGORAS
fn step_2() -> Unit raise {
  let t1 = @tactics.conv_tac(@calc_rat.real_ring)
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.orthogonal(), @vectors.dot_lsub(), @vectors.dot_rsub(), @vectors.dot_sym()])), t1)
  pythagoras_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], orthogonal(A - B, C - B) → pow(norm(C - A), 2) == pow(norm(B - A), 2) + pow(norm(C - B), 2)"), t2))
}

///|
let pythagoras_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PYTHAGORAS")

///|
/// `PYTHAGORAS`
pub fn pythagoras() -> @kernel.Thm {
  pythagoras_c.get()
}

///|
/// vector_angle
fn step_3() -> Unit raise {
  vector_angle_c.set(@pair.new_definition(@term_syntax.parse_term("(vector_angle : (Cart[Real, _], Cart[Real, _]) -> Real)((x : Cart[Real, _]), (y : Cart[Real, _])) == (if x == vec(0) || y == vec(0) { pi / real_of_num(2) } else { acs(dot(x, y) / (norm(x) * norm(y))) })")))
}

///|
let vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vector_angle")

///|
/// `vector_angle`
pub fn vector_angle() -> @kernel.Thm {
  vector_angle_c.get()
}

///|
/// VECTOR_ANGLE_LINEAR_IMAGE_EQ
fn step_4() -> Unit raise {
  let t4 = @meson.asm_meson_tac(@list.List([@vectors.preserves_norm_preserves_dot()]))
  let t3 = @simp.asm_simp_tac(@list.List([vector_angle(), @equal.gsym(@vectors.norm_eq_0())]))
  let t5 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3), t4)
  vector_angle_linear_image_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, _], ∀ x : Cart[Real, _], ∀ y : Cart[Real, _], linear(f) && (∀ x : Cart[Real, _], norm(f(x)) == norm(x)) → vector_angle(f(x), f(y)) == vector_angle(x, y)"), t5))
}

///|
let vector_angle_linear_image_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_LINEAR_IMAGE_EQ")

///|
/// `VECTOR_ANGLE_LINEAR_IMAGE_EQ`
pub fn vector_angle_linear_image_eq() -> @kernel.Thm {
  vector_angle_linear_image_eq_c.get()
}

///|
/// Multivariate/geom.ml:34
fn step_5() -> Unit raise {
  @vectors.add_linear_invariants(@list.List([vector_angle_linear_image_eq()]))
}

///|
/// VECTOR_ANGLE_ORTHOGONAL_TRANSFORMATION
fn step_6() -> Unit raise {
  let t6 = @simp.rewrite_tac(@list.List([@determinants.orthogonal_transformation_v1(), vector_angle_linear_image_eq()]))
  vector_angle_orthogonal_transformation_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, N], ∀ x : Cart[Real, N], ∀ y : Cart[Real, N], orthogonal_transformation(f) → vector_angle(f(x), f(y)) == vector_angle(x, y)"), t6))
}

///|
let vector_angle_orthogonal_transformation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_ORTHOGONAL_TRANSFORMATION")

///|
/// `VECTOR_ANGLE_ORTHOGONAL_TRANSFORMATION`
pub fn vector_angle_orthogonal_transformation() -> @kernel.Thm {
  vector_angle_orthogonal_transformation_c.get()
}

///|
/// VECTOR_ANGLE_REFL
fn step_7() -> Unit raise {
  let t8 = @simp.asm_simp_tac(@list.List([@real.real_div_refl(), @realarith.real_entire(), @vectors.norm_eq_0(), @transcendentals.acs_1()]))
  let t7 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.norm_pow_2()), @realarith.real_pow_2()]))
  let t9 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([vector_angle(), @theorems.disj_aci()]))), @class.cond_cases_tac), t7), t8)
  vector_angle_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], vector_angle(x, x) == (if x == vec(0) { pi / real_of_num(2) } else { real_of_num(0) })"), t9))
}

///|
let vector_angle_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_REFL")

///|
/// `VECTOR_ANGLE_REFL`
pub fn vector_angle_refl() -> @kernel.Thm {
  vector_angle_refl_c.get()
}

///|
/// VECTOR_ANGLE_SYM
fn step_8() -> Unit raise {
  let t10 = @simp.rewrite_tac(@list.List([vector_angle(), @theorems.disj_sym(), @vectors.dot_sym(), @realax.real_mul_sym()]))
  vector_angle_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], vector_angle(x, y) == vector_angle(y, x)"), t10))
}

///|
let vector_angle_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_SYM")

///|
/// `VECTOR_ANGLE_SYM`
pub fn vector_angle_sym() -> @kernel.Thm {
  vector_angle_sym_c.get()
}

///|
/// VECTOR_ANGLE_LMUL
fn step_9() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @vectors.norm_cauchy_schwarz_div()]))
  let t18 = @equal.gsym(@real.real_inv_mul())
  let t19 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_bounds()), t18]))
  let t17 = @tactics.match_mp_tac(@transcendentals.acs_neg())
  let t16 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((a : Real) == real_of_num(0)) → a * (x : Real) * (inv(a) * (y : Real) * (z : Real)) == x * (y * z)"))]))
  let t15 = @simp.asm_rewrite_tac(@list.List([@real.real_inv_neg(), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg()]))
  let t14 = @simp.rewrite_tac(@list.List([@vectors.norm_mul(), @vectors.dot_lmul(), @realax.real_div(), @real.real_inv_mul(), @realax.real_abs()]))
  let t13 = @simp.asm_rewrite_tac(@list.List([]))
  let t12 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == vec(0) || (y : Cart[Real, N]) == vec(0)"))
  let t11 = @simp.asm_rewrite_tac(@list.List([vector_angle(), @vectors.vector_mul_eq_0()]))
  let t21 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t11), t12), t13), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t14), @class.cond_cases_tac), t15), t16), t17), t19), t20)
  vector_angle_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ x : Cart[Real, N], ∀ y : Cart[Real, N], vector_angle(op_pct(a, x), y) == (if a == real_of_num(0) { pi / real_of_num(2) } else { if real_of_num(0) <= a { vector_angle(x, y) } else { pi - vector_angle(x, y) } })"), t21))
}

///|
let vector_angle_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_LMUL")

///|
/// `VECTOR_ANGLE_LMUL`
pub fn vector_angle_lmul() -> @kernel.Thm {
  vector_angle_lmul_c.get()
}

///|
/// VECTOR_ANGLE_RMUL
fn step_10() -> Unit raise {
  let t22 = @simp.rewrite_tac(@list.List([vector_angle_lmul()]))
  let t23 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([vector_angle_sym()])), t22)
  vector_angle_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ x : Cart[Real, N], ∀ y : Cart[Real, N], vector_angle(x, op_pct(a, y)) == (if a == real_of_num(0) { pi / real_of_num(2) } else { if real_of_num(0) <= a { vector_angle(x, y) } else { pi - vector_angle(x, y) } })"), t23))
}

///|
let vector_angle_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_RMUL")

///|
/// `VECTOR_ANGLE_RMUL`
pub fn vector_angle_rmul() -> @kernel.Thm {
  vector_angle_rmul_c.get()
}

///|
/// VECTOR_ANGLE_LNEG
fn step_11() -> Unit raise {
  let t24 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t25 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("vector_neg((x : Cart[Real, _])) == op_pct(real_neg(real_of_num(1)), x)")), vector_angle_lmul()])), t24)
  vector_angle_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], vector_angle(vector_neg(x), y) == real_sub(pi, vector_angle(x, y))"), t25))
}

///|
let vector_angle_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_LNEG")

///|
/// `VECTOR_ANGLE_LNEG`
pub fn vector_angle_lneg() -> @kernel.Thm {
  vector_angle_lneg_c.get()
}

///|
/// VECTOR_ANGLE_RNEG
fn step_12() -> Unit raise {
  let t26 = @simp.rewrite_tac(@list.List([vector_angle_lneg()]))
  let t27 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([vector_angle_sym()])), t26)
  vector_angle_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], vector_angle(x, vector_neg(y)) == real_sub(pi, vector_angle(x, y))"), t27))
}

///|
let vector_angle_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_RNEG")

///|
/// `VECTOR_ANGLE_RNEG`
pub fn vector_angle_rneg() -> @kernel.Thm {
  vector_angle_rneg_c.get()
}

///|
/// VECTOR_ANGLE_NEG2
fn step_13() -> Unit raise {
  let t28 = @tactics.then_tac(@simp.rewrite_tac(@list.List([vector_angle_lneg(), vector_angle_rneg()])), @calc_rat.real_arith_tac)
  vector_angle_neg2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], vector_angle(vector_neg(x), vector_neg(y)) == vector_angle(x, y)"), t28))
}

///|
let vector_angle_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_NEG2")

///|
/// `VECTOR_ANGLE_NEG2`
pub fn vector_angle_neg2() -> @kernel.Thm {
  vector_angle_neg2_c.get()
}

///|
/// SIN_VECTOR_ANGLE_LMUL
fn step_14() -> Unit raise {
  let t32 = @simp.asm_rewrite_tac(@list.List([@transcendentals.sin_sub(), @transcendentals.sin_pi(), @transcendentals.cos_pi()]))
  let t31 = @simp.asm_rewrite_tac(@list.List([@transcendentals.sin_pi2()]))
  let t30 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) == real_of_num(0)"))
  let t29 = @simp.rewrite_tac(@list.List([vector_angle_lmul()]))
  let t33 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t29), t30), t31), @class.cond_cases_tac), t32), @calc_rat.real_arith_tac)
  sin_vector_angle_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ x : Cart[Real, N], ∀ y : Cart[Real, N], sin(vector_angle(op_pct(a, x), y)) == (if a == real_of_num(0) { real_of_num(1) } else { sin(vector_angle(x, y)) })"), t33))
}

///|
let sin_vector_angle_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_VECTOR_ANGLE_LMUL")

///|
/// `SIN_VECTOR_ANGLE_LMUL`
pub fn sin_vector_angle_lmul() -> @kernel.Thm {
  sin_vector_angle_lmul_c.get()
}

///|
/// SIN_VECTOR_ANGLE_RMUL
fn step_15() -> Unit raise {
  let t34 = @simp.rewrite_tac(@list.List([sin_vector_angle_lmul()]))
  let t35 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([vector_angle_sym()])), t34)
  sin_vector_angle_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ x : Cart[Real, N], ∀ y : Cart[Real, N], sin(vector_angle(x, op_pct(a, y))) == (if a == real_of_num(0) { real_of_num(1) } else { sin(vector_angle(x, y)) })"), t35))
}

///|
let sin_vector_angle_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_VECTOR_ANGLE_RMUL")

///|
/// `SIN_VECTOR_ANGLE_RMUL`
pub fn sin_vector_angle_rmul() -> @kernel.Thm {
  sin_vector_angle_rmul_c.get()
}

///|
/// VECTOR_ANGLE
fn step_16() -> Unit raise {
  let t45 = @simp.asm_rewrite_tac(@list.List([@real.real_bounds_le(), @vectors.norm_cauchy_schwarz_div()]))
  let t44 = @tactics.match_mp_tac(@equal.gsym(@transcendentals.cos_acs()))
  let t43 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_eq_ldiv_eq()), @real.real_lt_mul(), @vectors.norm_pos_lt()]))
  let t41 = @term_syntax.parse_term("(a : Real) * ((b : Real) * (c : Real)) == c * (a * b)")
  let t42 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@real.real_mul_ac())(t41)]))
  let t40 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_rzero(), @vectors.norm_0(), @calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()]))
  let t39 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, N]) == vec(0)"))
  let t38 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_lzero(), @vectors.norm_0(), @calc_int.real_mul_lzero()]))
  let t37 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == vec(0)"))
  let t36 = @simp.rewrite_tac(@list.List([vector_angle()]))
  let t46 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t36), t37), t38), t39), t40), t42), t43), t44), t45)
  vector_angle_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], dot(x, y) == norm(x) * (norm(y) * cos(vector_angle(x, y)))"), t46))
}

///|
let vector_angle_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE")

///|
/// `VECTOR_ANGLE`
pub fn vector_angle_v1() -> @kernel.Thm {
  vector_angle_v1_c.get()
}

///|
/// VECTOR_ANGLE_RANGE
fn step_17() -> Unit raise {
  let t51 = @simp.asm_rewrite_tac(@list.List([@real.real_bounds_le(), @vectors.norm_cauchy_schwarz_div()]))
  let t50 = @tactics.match_mp_tac(@transcendentals.acs_bounds())
  let t49 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@class.de_morgan_thm()])))
  let t48 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t47 = @simp.rewrite_tac(@list.List([vector_angle()]))
  let t52 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t47), @class.cond_cases_tac), t48), t49), t50), t51)
  vector_angle_range_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], real_of_num(0) <= vector_angle(x, y) && vector_angle(x, y) <= pi"), t52))
}

///|
let vector_angle_range_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_RANGE")

///|
/// `VECTOR_ANGLE_RANGE`
pub fn vector_angle_range() -> @kernel.Thm {
  vector_angle_range_c.get()
}

///|
/// ORTHOGONAL_VECTOR_ANGLE
fn step_18() -> Unit raise {
  let t69 = @simp.asm_simp_tac(@list.List([@real.real_eq_ldiv_eq(), @real.real_lt_mul(), @vectors.norm_pos_lt(), @calc_int.real_mul_lzero()]))
  let t68 = @simp.simp_tac(@list.List([@transcendentals.cos_acs(), @real.real_bounds_le(), @vectors.norm_cauchy_schwarz_div(), @transcendentals.cos_pi2()]))
  let t65 = @term_syntax.parse_term("cos")
  let t70 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x62 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s63 = @tactics.mp_tac(x62)
      fn(x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s63(x64)
      }
    })(((x66 : @kernel.Thm) => @equal.ap_term(t65, x66))(x67))
  }), t68), t69)
  let t61 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t60 = @tactics.match_mp_tac(@transcendentals.acs_cos())
  let t58 = @equal.gsym(@transcendentals.cos_pi2())
  let t59 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), t58]))
  let t71 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@realax.real_div(), @calc_int.real_mul_lzero()])), @tactics.disch_tac), t59), t60), t61), @calc_rat.real_arith_tac), t70])
  let t57 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_rzero()]))
  let t56 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, N]) == vec(0)"))
  let t55 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_lzero()]))
  let t54 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == vec(0)"))
  let t53 = @simp.rewrite_tac(@list.List([@vectors.orthogonal(), vector_angle()]))
  let t72 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t53), t54), t55), t56), t57), @tactics.eq_tac), t71)
  orthogonal_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], orthogonal(x, y) == (vector_angle(x, y) == pi / real_of_num(2))"), t72))
}

///|
let orthogonal_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_VECTOR_ANGLE")

///|
/// `ORTHOGONAL_VECTOR_ANGLE`
pub fn orthogonal_vector_angle() -> @kernel.Thm {
  orthogonal_vector_angle_c.get()
}

///|
/// VECTOR_ANGLE_EQ_0
fn step_19() -> Unit raise {
  let t86 = @meson.meson_tac(@list.List([@transcendentals.acs_1(), @transcendentals.cos_acs(), @real.real_bounds_le(), @vectors.norm_cauchy_schwarz_div(), @transcendentals.cos_0()]))
  let t85 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_eq_ldiv_eq()), @vectors.norm_pos_lt(), @real.real_lt_mul()]))
  let t84 = @simp.gen_rewrite_tac(fn(x83 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x77 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s78 = @equal.rand_conv(x77)
      fn(x79 : @kernel.Term) -> @kernel.Thm raise {
        s78(x79)
      }
    })((fn(x80 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s81 = @equal.rand_conv(x80)
      fn(x82 : @kernel.Term) -> @kernel.Thm raise {
        s81(x82)
      }
    })(x83))
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t76 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.norm_cauchy_schwarz_eq())]))
  let t75 = @simp.asm_simp_tac(@list.List([vector_angle(), @transcendentals.pi_nz(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) / real_of_num(2) == real_of_num(0)) == (x == real_of_num(0))"))]))
  let t73 = @term_syntax.parse_term("(y : Cart[Real, N]) == vec(0)")
  let t74 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, N]) == vec(0)"), t73]))
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t74), t75), t76), t84), t85), t86)
  vector_angle_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], (vector_angle(x, y) == real_of_num(0)) == (!(x == vec(0)) && !(y == vec(0)) && op_pct(norm(x), y) == op_pct(norm(y), x))"), t87))
}

///|
let vector_angle_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_EQ_0")

///|
/// `VECTOR_ANGLE_EQ_0`
pub fn vector_angle_eq_0() -> @kernel.Thm {
  vector_angle_eq_0_c.get()
}

///|
/// VECTOR_ANGLE_EQ_PI
fn step_20() -> Unit raise {
  let t91 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @vectors.vector_arith(@term_syntax.parse_term("(vector_neg((x : Cart[Real, _])) == vec(0)) == (x == vec(0))"))]))
  let t90 = @simp.simp_tac(@list.List([vector_angle_rneg(), @calc_rat.real_arith(@term_syntax.parse_term("(pi - (x : Real) == real_of_num(0)) == (x == pi)"))]))
  let t88 = @term_syntax.parse_term("-(y : Cart[Real, N])")
  let t89 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, N])"), t88]), vector_angle_eq_0()))
  let t92 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t89), t90), @tactics.strip_tac), t91), @tactics.ap_term_tac), @tactics.ap_term_tac), @vectors.vector_arith_tac)
  vector_angle_eq_pi_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], (vector_angle(x, y) == pi) == (!(x == vec(0)) && !(y == vec(0)) && op_pct(norm(x), y) + op_pct(norm(y), x) == vec(0))"), t92))
}

///|
let vector_angle_eq_pi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_EQ_PI")

///|
/// `VECTOR_ANGLE_EQ_PI`
pub fn vector_angle_eq_pi() -> @kernel.Thm {
  vector_angle_eq_pi_c.get()
}

///|
/// VECTOR_ANGLE_EQ_0_DIST
fn step_21() -> Unit raise {
  let t93 = @simp.rewrite_tac(@list.List([vector_angle_eq_0(), @equal.gsym(@vectors.norm_triangle_eq())]))
  vector_angle_eq_0_dist_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], (vector_angle(x, y) == real_of_num(0)) == (!(x == vec(0)) && !(y == vec(0)) && norm(x + y) == norm(x) + norm(y))"), t93))
}

///|
let vector_angle_eq_0_dist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_EQ_0_DIST")

///|
/// `VECTOR_ANGLE_EQ_0_DIST`
pub fn vector_angle_eq_0_dist() -> @kernel.Thm {
  vector_angle_eq_0_dist_c.get()
}

///|
/// VECTOR_ANGLE_EQ_PI_DIST
fn step_22() -> Unit raise {
  let t97 = @simp.rewrite_tac(@list.List([@vectors.norm_neg()]))
  let t96 = @simp.simp_tac(@list.List([vector_angle_rneg(), @calc_rat.real_arith(@term_syntax.parse_term("(pi - (x : Real) == real_of_num(0)) == (x == pi)"))]))
  let t94 = @term_syntax.parse_term("-(y : Cart[Real, N])")
  let t95 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, N])"), t94]), vector_angle_eq_0_dist()))
  let t98 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t95), t96), @tactics.strip_tac), t97), @vectors.norm_arith_tac)
  vector_angle_eq_pi_dist_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], (vector_angle(x, y) == pi) == (!(x == vec(0)) && !(y == vec(0)) && norm(x - y) == norm(x) + norm(y))"), t98))
}

///|
let vector_angle_eq_pi_dist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_EQ_PI_DIST")

///|
/// `VECTOR_ANGLE_EQ_PI_DIST`
pub fn vector_angle_eq_pi_dist() -> @kernel.Thm {
  vector_angle_eq_pi_dist_c.get()
}

///|
/// SIN_VECTOR_ANGLE_POS
fn step_23() -> Unit raise {
  let t99 = @simp.simp_tac(@list.List([@transcendentals.sin_pos_pi_le(), vector_angle_range()]))
  sin_vector_angle_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : Cart[Real, _], ∀ w : Cart[Real, _], real_of_num(0) <= sin(vector_angle(v, w))"), t99))
}

///|
let sin_vector_angle_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_VECTOR_ANGLE_POS")

///|
/// `SIN_VECTOR_ANGLE_POS`
pub fn sin_vector_angle_pos() -> @kernel.Thm {
  sin_vector_angle_pos_c.get()
}

///|
/// SIN_VECTOR_ANGLE_EQ_0
fn step_24() -> Unit raise {
  let t100 = @meson.meson_tac(@list.List([@transcendentals.sin_pos_pi(), vector_angle_range(), @realarith.real_lt_le(), @transcendentals.sin_0(), @transcendentals.sin_pi()]))
  sin_vector_angle_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], (sin(vector_angle(x, y)) == real_of_num(0)) == (vector_angle(x, y) == real_of_num(0) || vector_angle(x, y) == pi)"), t100))
}

///|
let sin_vector_angle_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_VECTOR_ANGLE_EQ_0")

///|
/// `SIN_VECTOR_ANGLE_EQ_0`
pub fn sin_vector_angle_eq_0() -> @kernel.Thm {
  sin_vector_angle_eq_0_c.get()
}

///|
/// ASN_SIN_VECTOR_ANGLE
fn step_25() -> Unit raise {
  let t105 = @term_syntax.parse_term("(y : Cart[Real, N])")
  let t106 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, N])"), t105]), vector_angle_range()))
  let t104 = @tactics.match_mp_tac(@transcendentals.asn_sin())
  let t102 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@transcendentals.sin_sub(), @transcendentals.sin_pi(), @transcendentals.cos_pi()]))), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t101 = @tactics.exists_tac(@term_syntax.parse_term("asn(sin(pi - vector_angle((x : Cart[Real, N]), (y : Cart[Real, N]))))"))
  let t103 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t101), @tactics.conj_tac), t102)])
  let t107 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @class.cond_cases_tac), t103), t104), t106), @calc_rat.asm_real_arith_tac)
  asn_sin_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], asn(sin(vector_angle(x, y))) == (if vector_angle(x, y) <= pi / real_of_num(2) { vector_angle(x, y) } else { pi - vector_angle(x, y) })"), t107))
}

///|
let asn_sin_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ASN_SIN_VECTOR_ANGLE")

///|
/// `ASN_SIN_VECTOR_ANGLE`
pub fn asn_sin_vector_angle() -> @kernel.Thm {
  asn_sin_vector_angle_c.get()
}

///|
/// SIN_VECTOR_ANGLE_EQ
fn step_26() -> Unit raise {
  let t116 = @simp.rewrite_tac(@list.List([asn_sin_vector_angle()]))
  let t112 = @term_syntax.parse_term("asn")
  let t115 = @tactics.first_x_assum(fn(x114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x109 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s110 = @tactics.mp_tac(x109)
      fn(x111 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s110(x111)
      }
    })(((x113 : @kernel.Thm) => @equal.ap_term(t112, x113))(x114))
  })
  let t108 = @simp.asm_rewrite_tac(@list.List([@transcendentals.sin_sub(), @transcendentals.sin_pi(), @transcendentals.cos_pi()]))
  let t117 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), @tactics.strip_tac), t108), @list.List([@tactics.all_tac, @calc_rat.real_arith_tac])), t115), t116), @calc_rat.real_arith_tac)
  sin_vector_angle_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], ∀ w : Cart[Real, _], ∀ z : Cart[Real, _], (sin(vector_angle(x, y)) == sin(vector_angle(w, z))) == (vector_angle(x, y) == vector_angle(w, z) || vector_angle(x, y) == pi - vector_angle(w, z))"), t117))
}

///|
let sin_vector_angle_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_VECTOR_ANGLE_EQ")

///|
/// `SIN_VECTOR_ANGLE_EQ`
pub fn sin_vector_angle_eq() -> @kernel.Thm {
  sin_vector_angle_eq_c.get()
}

///|
/// CONTINUOUS_WITHIN_CX_VECTOR_ANGLE_COMPOSE
fn step_27() -> Unit raise {
  let t163 = @simp.simp_tac(@list.List([@transcendentals.cx_acs(), @vectors.norm_cauchy_schwarz_div()]))
  let t164 = @tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono())), t163)
  let t162 = @tactics.conv_tac(@vectors.norm_arith)
  let t161 = @simp.rewrite_tac(@list.List([]))
  let t160 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t159 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_lt()]))
  let t154 = @term_syntax.parse_term("norm((g : (Cart[Real, M]) -> Cart[Real, N])((x : Cart[Real, M])))")
  let t157 = @tactics.disch_then(fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s152 = @tactics.mp_tac(x151)
      fn(x153 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s152(x153)
      }
    })(((x155 : @kernel.Thm) => @bool.spec(t154, x155))(x156))
  })
  let t148 = @term_syntax.parse_term("norm((f : (Cart[Real, M]) -> Cart[Real, N])((x : Cart[Real, M])))")
  let t158 = @list.List([@tactics.disch_then(fn(x150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s146 = @tactics.mp_tac(x145)
      fn(x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s146(x147)
      }
    })(((x149 : @kernel.Thm) => @bool.spec(t148, x149))(x150))
  }), t157])
  let t144 = @simp.rewrite_tac(@list.List([@topology.continuous_within(), @topology.tendsto()]))
  let t142 = @tactics.undisch_tac(@term_syntax.parse_term("continuous((g : (Cart[Real, M]) -> Cart[Real, N]), within(at((x : Cart[Real, M])), (s : (Cart[Real, M]) -> Bool)))"))
  let t143 = @list.List([@tactics.undisch_tac(@term_syntax.parse_term("continuous((f : (Cart[Real, M]) -> Cart[Real, N]), within(at((x : Cart[Real, M])), (s : (Cart[Real, M]) -> Bool)))")), t142])
  let t165 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_and()])), @tactics.conj_tac), t143), t144), t158), t159), t160), t161), t162), t164])
  let t141 = @tactics.subgoal_then(@term_syntax.parse_term("eventually((y : Cart[Real, M]) => !((f : (Cart[Real, M]) -> Cart[Real, N])(y) == vec(0)) && !((g : (Cart[Real, M]) -> Cart[Real, N])(y) == vec(0)), within(at((x : Cart[Real, M])), (s : (Cart[Real, M]) -> Bool)))"), fn(x138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s139 = @tactics.mp_tac(x138)
    fn(x140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s139(x140)
    }
  })
  let t137 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform_eventually()))
  let t166 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@topology.continuous_within(), @transcendentals.cx_acs(), @trivia.o_def(), @vectors.norm_cauchy_schwarz_div()])), t137), t141), t165)
  let t134 = @simp.rewrite_tac(@list.List([@complexes.real_cx(), @complexes.re_cx(), @vectors.norm_cauchy_schwarz_div()]))
  let t133 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @sets.in_univ(), @sets.in_elim_thm()]))
  let t132 = @simp.rewrite_tac(@list.List([@transcendentals.continuous_within_cacs_real()]))
  let t131 = @tactics.exists_tac(@term_syntax.parse_term("{(z : Cart[Real, 2]) | real(z) && abs(Re(z)) <= real_of_num(1)}"))
  let t135 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_within_subset()), t131), t132), t133), t134)
  let t130 = @simp.asm_simp_tac(@list.List([@topology.continuous_lift_norm_compose(), @trivia.o_def()]))
  let t129 = @tactics.match_mp_tac(@topology.continuous_mul())
  let t128 = @simp.asm_simp_tac(@list.List([@topology.continuous_lift_dot2()]))
  let t127 = @simp.rewrite_tac(@list.List([@canal.continuous_cx_lift(), @equal.gsym(@complexes.cx_mul()), @vectors.lift_cmul()]))
  let t126 = @simp.asm_simp_tac(@list.List([@topology.netlimit_within(), @complexes.complex_entire(), @complexes.cx_inj(), @vectors.norm_eq_0()]))
  let t125 = @tactics.match_mp_tac(@canal.continuous_complex_div())
  let t124 = @simp.rewrite_tac(@list.List([@topology.within_univ()]))
  let t136 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_div(), @complexes.cx_mul()])), t124), t125), t126), t127), t128), t129), t130), t135])
  let t167 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_within_compose()), @tactics.conj_tac), t136), t166])
  let t123 = @tactics.subgoal_then(@term_syntax.parse_term("continuous(o(cacs, (x : Cart[Real, M]) => Cx(dot((f : (Cart[Real, M]) -> Cart[Real, N])(x), (g : (Cart[Real, M]) -> Cart[Real, N])(x)) / (norm(f(x)) * norm(g(x))))), within(at((x : Cart[Real, M])), (s : (Cart[Real, M]) -> Bool)))"), fn(x120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s121 = @tactics.mp_tac(x120)
    fn(x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s121(x122)
    }
  })
  let t119 = @simp.asm_simp_tac(@list.List([@topology.continuous_trivial_limit(), vector_angle()]))
  let t118 = @class.asm_cases_tac(@term_syntax.parse_term("trivial_limit(within(at((x : Cart[Real, M])), (s : (Cart[Real, M]) -> Bool)))"))
  let t168 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t118), t119), t123), t167)
  continuous_within_cx_vector_angle_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], ∀ x : Cart[Real, M], ∀ s : (Cart[Real, M]) -> Bool, !(f(x) == vec(0)) && !(g(x) == vec(0)) && continuous(f, within(at(x), s)) && continuous(g, within(at(x), s)) → continuous((x : Cart[Real, M]) => Cx(vector_angle(f(x), g(x))), within(at(x), s))"), t168))
}

///|
let continuous_within_cx_vector_angle_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_WITHIN_CX_VECTOR_ANGLE_COMPOSE")

///|
/// `CONTINUOUS_WITHIN_CX_VECTOR_ANGLE_COMPOSE`
pub fn continuous_within_cx_vector_angle_compose() -> @kernel.Thm {
  continuous_within_cx_vector_angle_compose_c.get()
}

///|
/// CONTINUOUS_AT_CX_VECTOR_ANGLE
fn step_28() -> Unit raise {
  let t192 = @simp.rewrite_tac(@list.List([@complexes.real_cx(), @complexes.re_cx(), @vectors.norm_cauchy_schwarz_div()]))
  let t191 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @sets.in_univ(), @sets.in_elim_thm()]))
  let t190 = @simp.rewrite_tac(@list.List([@transcendentals.continuous_within_cacs_real()]))
  let t189 = @tactics.exists_tac(@term_syntax.parse_term("{(z : Cart[Real, 2]) | real(z) && abs(Re(z)) <= real_of_num(1)}"))
  let t193 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_within_subset()), t189), t190), t191), t192)
  let t188 = @simp.simp_tac(@list.List([@canal.continuous_complex_mul(), @topology.continuous_const(), @canal.continuous_at_cx_norm(), @canal.continuous_at_cx_dot()]))
  let t187 = @simp.asm_rewrite_tac(@list.List([@topology.netlimit_at(), @complexes.complex_entire(), @complexes.cx_inj(), @vectors.norm_eq_0()]))
  let t186 = @tactics.match_mp_tac(@canal.continuous_complex_div())
  let t185 = @simp.rewrite_tac(@list.List([@topology.within_univ()]))
  let t194 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_div(), @complexes.cx_mul()])), t185), t186), t187), t188), t193])
  let t184 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(@topology.continuous_within_compose()))
  let t183 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@topology.within_univ())]))
  let t181 = @simp.rewrite_tac(@list.List([@vectors.norm_cauchy_schwarz_div()]))
  let t180 = @tactics.match_mp_tac(@equal.gsym(@transcendentals.cx_acs()))
  let t179 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("!(distance((vec(0), (x : Cart[Real, _]))) < norm(x))"))])), @tactics.all_tac])
  let t182 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, N])")), @tactics.disch_tac), @class.cond_cases_tac), t179), t180), t181), @tactics.all_tac])
  let t178 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_lt()]))
  let t176 = @term_syntax.parse_term("norm((x : Cart[Real, N]))")
  let t177 = @tactics.map_every(fn(x173 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s174 = @tactics.exists_tac(x173)
    fn(x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s174(x175)
    }
  }, @list.List([@term_syntax.parse_term("(x : Cart[Real, N]) => cacs(Cx(dot((c : Cart[Real, N]), x) / (norm(c) * norm(x))))"), t176]))
  let t172 = @tactics.match_mp_tac(@topology.continuous_transform_at())
  let t171 = @simp.asm_rewrite_tac(@list.List([@topology.continuous_const()]))
  let t170 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Cart[Real, N]) == vec(0)"))
  let t169 = @simp.rewrite_tac(@list.List([@trivia.o_def(), vector_angle()]))
  let t195 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t169), t170), t171), t172), t177), t178), @tactics.conj_tac), t182), t183), t184), @tactics.conj_tac), t194)
  continuous_at_cx_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, N], ∀ x : Cart[Real, N], !(x == vec(0)) → continuous(o(Cx, vector_angle(c)), at(x))"), t195))
}

///|
let continuous_at_cx_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_CX_VECTOR_ANGLE")

///|
/// `CONTINUOUS_AT_CX_VECTOR_ANGLE`
pub fn continuous_at_cx_vector_angle() -> @kernel.Thm {
  continuous_at_cx_vector_angle_c.get()
}

///|
/// CONTINUOUS_WITHIN_CX_VECTOR_ANGLE
fn step_29() -> Unit raise {
  let t196 = @simp.simp_tac(@list.List([@topology.continuous_at_within(), continuous_at_cx_vector_angle()]))
  continuous_within_cx_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, N], ∀ x : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, !(x == vec(0)) → continuous(o(Cx, vector_angle(c)), within(at(x), s))"), t196))
}

///|
let continuous_within_cx_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_WITHIN_CX_VECTOR_ANGLE")

///|
/// `CONTINUOUS_WITHIN_CX_VECTOR_ANGLE`
pub fn continuous_within_cx_vector_angle() -> @kernel.Thm {
  continuous_within_cx_vector_angle_c.get()
}

///|
/// REAL_CONTINUOUS_AT_VECTOR_ANGLE
fn step_30() -> Unit raise {
  let t197 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_continuous(), continuous_at_cx_vector_angle()]))
  real_continuous_at_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, N], ∀ x : Cart[Real, N], !(x == vec(0)) → real_continuous(vector_angle(c), at(x))"), t197))
}

///|
let real_continuous_at_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_AT_VECTOR_ANGLE")

///|
/// `REAL_CONTINUOUS_AT_VECTOR_ANGLE`
pub fn real_continuous_at_vector_angle() -> @kernel.Thm {
  real_continuous_at_vector_angle_c.get()
}

///|
/// REAL_CONTINUOUS_WITHIN_VECTOR_ANGLE
fn step_31() -> Unit raise {
  let t198 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_continuous(), continuous_within_cx_vector_angle()]))
  real_continuous_within_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, ∀ x : Cart[Real, N], !(x == vec(0)) → real_continuous(vector_angle(c), within(at(x), s))"), t198))
}

///|
let real_continuous_within_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_WITHIN_VECTOR_ANGLE")

///|
/// `REAL_CONTINUOUS_WITHIN_VECTOR_ANGLE`
pub fn real_continuous_within_vector_angle() -> @kernel.Thm {
  real_continuous_within_vector_angle_c.get()
}

///|
/// CONTINUOUS_ON_CX_VECTOR_ANGLE
fn step_32() -> Unit raise {
  let t200 = @meson.asm_meson_tac(@list.List([continuous_within_cx_vector_angle()]))
  let t199 = @simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within()]))
  let t201 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t199), t200)
  continuous_on_cx_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, !IN(vec(0), s) → continuous_on(o(Cx, vector_angle((c : Cart[Real, _]))), s)"), t201))
}

///|
let continuous_on_cx_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CX_VECTOR_ANGLE")

///|
/// `CONTINUOUS_ON_CX_VECTOR_ANGLE`
pub fn continuous_on_cx_vector_angle() -> @kernel.Thm {
  continuous_on_cx_vector_angle_c.get()
}

///|
/// VECTOR_ANGLE_EQ
fn step_33() -> Unit raise {
  let t211 = @simp.simp_tac(@list.List([@transcendentals.cos_acs(), @vectors.norm_cauchy_schwarz_div(), @real.real_bounds_le()]))
  let t207 = @term_syntax.parse_term("cos")
  let t210 = @tactics.disch_then(fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s205 = @tactics.mp_tac(x204)
      fn(x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s205(x206)
      }
    })(((x208 : @kernel.Thm) => @equal.ap_term(t207, x208))(x209))
  })
  let t203 = @simp.simp_tac(@list.List([]))
  let t202 = @tactics.repeat_tac(@tactics.strip_tac)
  let t212 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([vector_angle(), @vectors.norm_eq_0(), @calc_rat.real_field(@term_syntax.parse_term("!((u : Real) == real_of_num(0)) && !((v : Real) == real_of_num(0)) && !((x : Real) == real_of_num(0)) && !((y : Real) == real_of_num(0)) → ((a : Real) * (u * v) == (b : Real) * (x * y)) == (a / (x * y) == b / (u * v))"))])), t202), @tactics.eq_tac), t203), t210), t211)
  vector_angle_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, _], ∀ v : Cart[Real, _], ∀ x : Cart[Real, _], ∀ y : Cart[Real, _], !(u == vec(0)) && !(v == vec(0)) && !(x == vec(0)) && !(y == vec(0)) → (vector_angle(u, v) == vector_angle(x, y)) == (dot(x, y) * (norm(u) * norm(v)) == dot(u, v) * (norm(x) * norm(y)))"), t212))
}

///|
let vector_angle_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_EQ")

///|
/// `VECTOR_ANGLE_EQ`
pub fn vector_angle_eq() -> @kernel.Thm {
  vector_angle_eq_c.get()
}

///|
/// COS_VECTOR_ANGLE_EQ
fn step_34() -> Unit raise {
  let t213 = @meson.meson_tac(@list.List([@transcendentals.acs_cos(), vector_angle_range()]))
  cos_vector_angle_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, _], ∀ v : Cart[Real, _], ∀ x : Cart[Real, _], ∀ y : Cart[Real, _], (cos(vector_angle(u, v)) == cos(vector_angle(x, y))) == (vector_angle(u, v) == vector_angle(x, y))"), t213))
}

///|
let cos_vector_angle_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COS_VECTOR_ANGLE_EQ")

///|
/// `COS_VECTOR_ANGLE_EQ`
pub fn cos_vector_angle_eq() -> @kernel.Thm {
  cos_vector_angle_eq_c.get()
}

///|
/// COLLINEAR_VECTOR_ANGLE
fn step_35() -> Unit raise {
  let t215 = @simp.asm_rewrite_tac(@list.List([]))
  let t214 = @tactics.repeat_tac(@tactics.strip_tac)
  let t216 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@vectors.norm_cauchy_schwarz_equal()), @vectors.norm_cauchy_schwarz_abs_eq(), vector_angle_eq_0(), vector_angle_eq_pi()])), t214), t215), @tactics.binop_tac), @vectors.vector_arith_tac)
  collinear_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], !(x == vec(0)) && !(y == vec(0)) → collinear({vec(0), x, y}) == (vector_angle(x, y) == real_of_num(0) || vector_angle(x, y) == pi)"), t216))
}

///|
let collinear_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_VECTOR_ANGLE")

///|
/// `COLLINEAR_VECTOR_ANGLE`
pub fn collinear_vector_angle() -> @kernel.Thm {
  collinear_vector_angle_c.get()
}

///|
/// COLLINEAR_SIN_VECTOR_ANGLE
fn step_36() -> Unit raise {
  let t217 = @simp.rewrite_tac(@list.List([sin_vector_angle_eq_0(), collinear_vector_angle()]))
  collinear_sin_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], !(x == vec(0)) && !(y == vec(0)) → collinear({vec(0), x, y}) == (sin(vector_angle(x, y)) == real_of_num(0))"), t217))
}

///|
let collinear_sin_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_SIN_VECTOR_ANGLE")

///|
/// `COLLINEAR_SIN_VECTOR_ANGLE`
pub fn collinear_sin_vector_angle() -> @kernel.Thm {
  collinear_sin_vector_angle_c.get()
}

///|
/// COLLINEAR_SIN_VECTOR_ANGLE_IMP
fn step_37() -> Unit raise {
  let t218 = @meson.meson_tac(@list.List([collinear_sin_vector_angle(), sin_vector_angle_eq_0(), vector_angle_eq_0_dist(), vector_angle_eq_pi_dist()]))
  collinear_sin_vector_angle_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], sin(vector_angle(x, y)) == real_of_num(0) → !(x == vec(0)) && !(y == vec(0)) && collinear({vec(0), x, y})"), t218))
}

///|
let collinear_sin_vector_angle_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_SIN_VECTOR_ANGLE_IMP")

///|
/// `COLLINEAR_SIN_VECTOR_ANGLE_IMP`
pub fn collinear_sin_vector_angle_imp() -> @kernel.Thm {
  collinear_sin_vector_angle_imp_c.get()
}

///|
/// VECTOR_ANGLE_EQ_0_RIGHT
fn step_38() -> Unit raise {
  let t223 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_eq_0(), @vectors.norm_pos_le()]))
  let t224 = @tactics.then_tac(@simp.rewrite_tac(@list.List([vector_angle_lmul()])), t223)
  let t222 = @simp.asm_rewrite_tac(@list.List([vector_angle_lmul(), @vectors.norm_eq_0(), @vectors.norm_pos_le()]))
  let t225 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t222), t224])
  let t221 = @tactics.exists_tac(@term_syntax.parse_term("vector_angle(op_pct(norm((x : Cart[Real, N])), (y : Cart[Real, N])), (z : Cart[Real, N]))"))
  let t220 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t219 = @tactics.repeat_tac(@tactics.strip_tac)
  let t226 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([vector_angle_eq_0()])), t219), t220), t221), @tactics.conj_tac), t225)
  vector_angle_eq_0_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], ∀ z : Cart[Real, N], vector_angle(x, y) == real_of_num(0) → vector_angle(x, z) == vector_angle(y, z)"), t226))
}

///|
let vector_angle_eq_0_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_EQ_0_RIGHT")

///|
/// `VECTOR_ANGLE_EQ_0_RIGHT`
pub fn vector_angle_eq_0_right() -> @kernel.Thm {
  vector_angle_eq_0_right_c.get()
}

///|
/// VECTOR_ANGLE_EQ_0_LEFT
fn step_39() -> Unit raise {
  let t227 = @meson.meson_tac(@list.List([vector_angle_eq_0_right(), vector_angle_sym()]))
  vector_angle_eq_0_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], ∀ z : Cart[Real, N], vector_angle(x, y) == real_of_num(0) → vector_angle(z, x) == vector_angle(z, y)"), t227))
}

///|
let vector_angle_eq_0_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_EQ_0_LEFT")

///|
/// `VECTOR_ANGLE_EQ_0_LEFT`
pub fn vector_angle_eq_0_left() -> @kernel.Thm {
  vector_angle_eq_0_left_c.get()
}

///|
/// VECTOR_ANGLE_EQ_PI_RIGHT
fn step_40() -> Unit raise {
  let t231 = @simp.asm_rewrite_tac(@list.List([vector_angle_lneg()]))
  let t228 = @term_syntax.parse_term("(z : Cart[Real, N])")
  let t229 = @term_syntax.parse_term("(y : Cart[Real, N])")
  let t230 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("-(x : Cart[Real, N])"), t229, t228]), vector_angle_eq_0_right()))
  let t232 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t230), t231), @calc_rat.real_arith_tac)
  vector_angle_eq_pi_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], ∀ z : Cart[Real, N], vector_angle(x, y) == pi → vector_angle(x, z) == pi - vector_angle(y, z)"), t232))
}

///|
let vector_angle_eq_pi_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_EQ_PI_RIGHT")

///|
/// `VECTOR_ANGLE_EQ_PI_RIGHT`
pub fn vector_angle_eq_pi_right() -> @kernel.Thm {
  vector_angle_eq_pi_right_c.get()
}

///|
/// VECTOR_ANGLE_EQ_PI_LEFT
fn step_41() -> Unit raise {
  let t233 = @meson.meson_tac(@list.List([vector_angle_eq_pi_right(), vector_angle_sym()]))
  vector_angle_eq_pi_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], ∀ z : Cart[Real, N], vector_angle(x, y) == pi → vector_angle(z, x) == pi - vector_angle(z, y)"), t233))
}

///|
let vector_angle_eq_pi_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_EQ_PI_LEFT")

///|
/// `VECTOR_ANGLE_EQ_PI_LEFT`
pub fn vector_angle_eq_pi_left() -> @kernel.Thm {
  vector_angle_eq_pi_left_c.get()
}

///|
/// COS_VECTOR_ANGLE
fn step_42() -> Unit raise {
  let t238 = @simp.asm_simp_tac(@list.List([@real.real_eq_rdiv_eq(), @real.real_lt_mul(), @vectors.norm_pos_lt(), vector_angle_v1()]))
  let t237 = @list.List([@simp.asm_rewrite_tac(@list.List([vector_angle(), @transcendentals.cos_pi2()])), @tactics.all_tac])
  let t236 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, N]) == vec(0)"))
  let t235 = @list.List([@simp.asm_rewrite_tac(@list.List([vector_angle(), @transcendentals.cos_pi2()])), @tactics.all_tac])
  let t234 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == vec(0)"))
  let t239 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t234), t235), t236), t237), t238), @calc_rat.real_arith_tac)
  cos_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], cos(vector_angle(x, y)) == (if x == vec(0) || y == vec(0) { real_of_num(0) } else { dot(x, y) / (norm(x) * norm(y)) })"), t239))
}

///|
let cos_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COS_VECTOR_ANGLE")

///|
/// `COS_VECTOR_ANGLE`
pub fn cos_vector_angle() -> @kernel.Thm {
  cos_vector_angle_c.get()
}

///|
/// SIN_VECTOR_ANGLE
fn step_43() -> Unit raise {
  let t243 = @simp.rewrite_tac(@list.List([@real.sqrt_1()]))
  let t242 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t241 = @simp.asm_rewrite_tac(@list.List([]))
  let t240 = @tactics.repeat_tac(@tactics.gen_tac)
  let t244 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@transcendentals.sin_cos_sqrt(), sin_vector_angle_pos(), cos_vector_angle()])), t240), @class.cond_cases_tac), t241), t242), t243)
  sin_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], sin(vector_angle(x, y)) == (if x == vec(0) || y == vec(0) { real_of_num(1) } else { sqrt(real_of_num(1) - pow(dot(x, y) / (norm(x) * norm(y)), 2)) })"), t244))
}

///|
let sin_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_VECTOR_ANGLE")

///|
/// `SIN_VECTOR_ANGLE`
pub fn sin_vector_angle() -> @kernel.Thm {
  sin_vector_angle_c.get()
}

///|
/// SIN_SQUARED_VECTOR_ANGLE
fn step_44() -> Unit raise {
  let t246 = @simp.rewrite_tac(@list.List([cos_vector_angle()]))
  let t245 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((s : Real) + (c : Real) == real_of_num(1)) == (s == real_of_num(1) - c)"))]))(@transcendentals.sin_circle())]))
  let t247 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t245), t246), @calc_rat.real_arith_tac)
  sin_squared_vector_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], pow(sin(vector_angle(x, y)), 2) == (if x == vec(0) || y == vec(0) { real_of_num(1) } else { real_of_num(1) - pow(dot(x, y) / (norm(x) * norm(y)), 2) })"), t247))
}

///|
let sin_squared_vector_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_SQUARED_VECTOR_ANGLE")

///|
/// `SIN_SQUARED_VECTOR_ANGLE`
pub fn sin_squared_vector_angle() -> @kernel.Thm {
  sin_squared_vector_angle_c.get()
}

///|
/// VECTOR_ANGLE_COMPLEX_LMUL
fn step_45() -> Unit raise {
  let t264 = @equal.gsym(@complexes.im_def())
  let t265 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @complexes.complex_mul(), @equal.gsym(@complexes.re_def()), t264, @complexes.re(), @complexes.im()]))
  let t263 = @simp.rewrite_tac(@list.List([@vectors.norm_pow_2()]))
  let t262 = @tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("pow((a : Real), 2) * (xy : Real) == (d : Real) → xy * (a * (x : Real) * (a * (y : Real))) == d * (x * y)")))
  let t261 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t260 = @tactics.disch_then(fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s258 = @tactics.subst1_tac(x257)
    fn(x259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s258(x259)
    }
  })
  let t256 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_entire()]))
  let t252 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t253 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t254 = @term_syntax.parse_term("(a : Cart[Real, 2]) * (y : Cart[Real, 2])")
  let t255 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2]) * (x : Cart[Real, 2])"), t254, t253, t252]), vector_angle_eq()))
  let t251 = @list.List([@simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_rzero(), vector_angle(), @complexes.complex_vec_0()])), @tactics.all_tac])
  let t250 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t249 = @list.List([@simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_rzero(), vector_angle(), @complexes.complex_vec_0()])), @tactics.all_tac])
  let t248 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t266 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t248), t249), t250), t251), t255), t256), t260), t261), t262), t263), t265), @calc_rat.real_arith_tac)
  vector_angle_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], !(a == Cx(real_of_num(0))) → vector_angle(a * (x : Cart[Real, 2]), a * (y : Cart[Real, 2])) == vector_angle(x, y)"), t266))
}

///|
let vector_angle_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_COMPLEX_LMUL")

///|
/// `VECTOR_ANGLE_COMPLEX_LMUL`
pub fn vector_angle_complex_lmul() -> @kernel.Thm {
  vector_angle_complex_lmul_c.get()
}

///|
/// VECTOR_ANGLE_1
fn step_46() -> Unit raise {
  let t269 = @equal.gsym(@complexes.im_def())
  let t270 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @equal.gsym(@complexes.re_def()), t269, @complexes.re_cx(), @complexes.im_cx()]))
  let t268 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num(), @realarith.real_mul_rid()]))
  let t267 = @list.List([@simp.asm_rewrite_tac(@list.List([@realax.real_div(), @complexes.re_cx(), @transcendentals.acs_0(), @calc_int.real_mul_lzero()])), @tactics.all_tac])
  let t271 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.simp_tac(@list.List([vector_angle(), @complexes.complex_vec_0(), @complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))), @class.cond_cases_tac), t267), t268), t270), @tactics.ap_term_tac), @calc_rat.real_arith_tac)
  vector_angle_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], vector_angle(x, Cx(real_of_num(1))) == acs(Re(x) / norm(x))"), t271))
}

///|
let vector_angle_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_1")

///|
/// `VECTOR_ANGLE_1`
pub fn vector_angle_1() -> @kernel.Thm {
  vector_angle_1_c.get()
}

///|
/// ARG_EQ_VECTOR_ANGLE_1
fn step_47() -> Unit raise {
  let t294 = @simp.asm_rewrite_tac(@list.List([@transcendentals.arg(), @transcendentals.arg_le_pi()]))
  let t293 = @tactics.match_mp_tac(@transcendentals.acs_cos())
  let t292 = @tactics.conv_tac(@equal.sym_conv)
  let t291 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_zero(), @calc_rat.real_field(@term_syntax.parse_term("!((z : Real) == real_of_num(0)) → z * (x : Real) / z == x"))]))
  let t290 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @transcendentals.real_exp_0(), @realax.real_mul_lid()]))
  let t289 = @simp.rewrite_tac(@list.List([@complexes.re_mul_cx(), @transcendentals.re_cexp(), @complexes.re_ii(), @complexes.im_mul_ii(), @complexes.im_cx(), @complexes.re_cx()]))
  let t288 = @simp.gen_rewrite_tac(fn(x287 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x283 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x279 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x273 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s274 = @equal.rand_conv(x273)
          fn(x275 : @kernel.Term) -> @kernel.Thm raise {
            s274(x275)
          }
        })((fn(x276 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s277 = @equal.rand_conv(x276)
          fn(x278 : @kernel.Term) -> @kernel.Thm raise {
            s277(x278)
          }
        })(x279))
      })((fn(x280 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s281 = @equal.land_conv(x280)
        fn(x282 : @kernel.Term) -> @kernel.Thm raise {
          s281(x282)
        }
      })(x283))
    })((fn(x284 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s285 = @equal.rand_conv(x284)
      fn(x286 : @kernel.Term) -> @kernel.Thm raise {
        s285(x286)
      }
    })(x287))
  }, @list.List([@transcendentals.arg()]))
  let t272 = @simp.rewrite_tac(@list.List([vector_angle_1()]))
  let t295 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t272), t288), t289), t290), t291), t292), t293), t294)
  arg_eq_vector_angle_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], !(z == Cx(real_of_num(0))) && real_of_num(0) <= Im(z) → Arg(z) == vector_angle(z, Cx(real_of_num(1)))"), t295))
}

///|
let arg_eq_vector_angle_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARG_EQ_VECTOR_ANGLE_1")

///|
/// `ARG_EQ_VECTOR_ANGLE_1`
pub fn arg_eq_vector_angle_1() -> @kernel.Thm {
  arg_eq_vector_angle_1_c.get()
}

///|
/// VECTOR_ANGLE_ARG
fn step_48() -> Unit raise {
  let t346 = @simp.rewrite_tac(@list.List([@complexes.im_complex_inv_ge_0()]))
  let t347 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_inv_div())])), t346), @calc_rat.asm_real_arith_tac)
  let t345 = @tactics.conv_tac(@complexes.complex_field)
  let t348 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s343 = @tactics.mp_tac(x342)
    fn(x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s343(x344)
    }
  })), t345), t347])
  let t341 = @tactics.match_mp_tac(arg_eq_vector_angle_1())
  let t340 = @tactics.conv_tac(@equal.sym_conv)
  let t339 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_div()]))
  let t337 = @tactics.disch_then(fn(x336 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x333 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s334 = @tactics.subst1_tac(x333)
      fn(x335 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s334(x335)
      }
    })(@equal.sym(x336))
  })
  let t338 = @list.List([@meson.asm_meson_tac(@list.List([@complexes.real(), @realax.real_le_refl()])), t337])
  let t349 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(z : Cart[Real, 2]) / (w : Cart[Real, 2])"), @transcendentals.arg_inv())), @tactics.ants_tac), t338), t339), t340), t341), @tactics.conj_tac), t348)
  let t332 = @tactics.conv_tac(@complexes.complex_field)
  let t331 = @tactics.repeat_tac(@tactics.pop_assum(fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s329 = @tactics.mp_tac(x328)
    fn(x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s329(x330)
    }
  }))
  let t327 = @simp.asm_rewrite_tac(@list.List([]))
  let t326 = @tactics.match_mp_tac(arg_eq_vector_angle_1())
  let t325 = @tactics.conv_tac(@equal.sym_conv)
  let t350 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([vector_angle_sym()])), t325), t326), t327), t331), t332), t349])
  let t324 = @simp.asm_simp_tac(@list.List([vector_angle_complex_lmul()]))
  let t323 = @tactics.disch_then(fn(x314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x314
    @simp.gen_rewrite_tac(fn(x322 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x316 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s317 = @equal.land_conv(x316)
        fn(x318 : @kernel.Term) -> @kernel.Thm raise {
          s317(x318)
        }
      })((fn(x319 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s320 = @equal.once_depth_conv(x319)
        fn(x321 : @kernel.Term) -> @kernel.Thm raise {
          s320(x321)
        }
      })(x322))
    }, @list.List([th]))
  })
  let t310 = @tactics.conv_tac(@complexes.complex_field)
  let t311 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s308 = @tactics.mp_tac(x307)
    fn(x309 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s308(x309)
    }
  })), t310), @tactics.all_tac])
  let t312 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(w : Cart[Real, 2]) == (z : Cart[Real, 2]) * (w / z) && z == z * Cx(real_of_num(1))"), fn(x304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s305 = @tactics.mp_tac(x304)
    fn(x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s305(x306)
    }
  }), t311)
  let t302 = @tactics.conv_tac(@complexes.complex_field)
  let t303 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x299 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s300 = @tactics.mp_tac(x299)
    fn(x301 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s300(x301)
    }
  })), t302), @tactics.all_tac])
  let t313 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(z : Cart[Real, 2]) == (w : Cart[Real, 2]) * (z / w) && w == w * Cx(real_of_num(1))"), fn(x296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s297 = @tactics.mp_tac(x296)
    fn(x298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s297(x298)
    }
  }), t303), t312])
  let t351 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @class.cond_cases_tac), t313), t323), t324), t350)
  vector_angle_arg_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], !(w == Cx(real_of_num(0))) && !(z == Cx(real_of_num(0))) → vector_angle(w, z) == (if real_of_num(0) <= Im(z / w) { Arg(z / w) } else { real_of_num(2) * pi - Arg(z / w) })"), t351))
}

///|
let vector_angle_arg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_ARG")

///|
/// `VECTOR_ANGLE_ARG`
pub fn vector_angle_arg() -> @kernel.Thm {
  vector_angle_arg_c.get()
}

///|
/// VECTOR_ANGLE_PRESERVING_EQ_SIMILARITY
fn step_49() -> Unit raise {
  let t374 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t373 = @simp.simp_tac(@list.List([@vectors.basis_nonzero(), @cart.dimindex_ge_1(), @arith.le_refl()]))
  let t372 = @simp.asm_rewrite_tac(@list.List([vector_angle_refl(), @vectors.vector_mul_lzero()]))
  let t367 = @term_syntax.parse_term("(basis : (Num) -> Cart[Real, N])(1)")
  let t368 = @list.List([@term_syntax.parse_term("(basis : (Num) -> Cart[Real, N])(1)"), t367])
  let t371 = @tactics.first_x_assum(fn(x370 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s365 = @tactics.mp_tac(x364)
      fn(x366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s365(x366)
      }
    })(((x369 : @kernel.Thm) => @bool.specl(t368, x369))(x370))
  })
  let t363 = @simp.asm_rewrite_tac(@list.List([]))
  let t362 = @tactics.repeat_tac(@tactics.strip_tac)
  let t361 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (Cart[Real, N]) -> Cart[Real, N])"))
  let t360 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t359 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Real)"))
  let t358 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t357 = @simp.asm_rewrite_tac(@list.List([orthogonal_vector_angle()]))
  let t356 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, N])"), @determinants.orthogonality_preserving_eq_similarity()))
  let t354 = @meson.asm_meson_tac(@list.List([vector_angle_orthogonal_transformation()]))
  let t353 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pi - (pi - (x : Real)) == x")), @class.cond_id()]))
  let t352 = @simp.asm_simp_tac(@list.List([vector_angle_lmul(), vector_angle_rmul()]))
  let t355 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@determinants.orthogonal_transformation_linear(), @vectors.linear_compose_cmul()])), t352), t353), t354)])
  let t375 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), @tactics.strip_tac), t355), t356), t357), t358), t359), t360), t361), t362), t363), t371), t372), t373), t374), @calc_rat.real_arith_tac)
  vector_angle_preserving_eq_similarity_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, N], (linear(f) && (∀ x : Cart[Real, N], ∀ y : Cart[Real, N], vector_angle(f(x), f(y)) == vector_angle(x, y))) == (∃ c : Real, ∃ g : (Cart[Real, N]) -> Cart[Real, N], !(c == real_of_num(0)) && orthogonal_transformation(g) && f == ((z : Cart[Real, N]) => op_pct(c, g(z))))"), t375))
}

///|
let vector_angle_preserving_eq_similarity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_PRESERVING_EQ_SIMILARITY")

///|
/// `VECTOR_ANGLE_PRESERVING_EQ_SIMILARITY`
pub fn vector_angle_preserving_eq_similarity() -> @kernel.Thm {
  vector_angle_preserving_eq_similarity_c.get()
}

///|
/// VECTOR_ANGLE_PRESERVING_EQ_SIMILARITY_ALT
fn step_50() -> Unit raise {
  let t390 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lneg(), @vectors.vector_mul_rneg(), @vectors.vector_neg_neg()]))
  let t389 = @simp.asm_rewrite_tac(@list.List([@determinants.orthogonal_transformation_neg()]))
  let t387 = @term_syntax.parse_term("(x : Cart[Real, N]) => -(g : (Cart[Real, N]) -> Cart[Real, N])(x)")
  let t388 = @tactics.map_every(fn(x384 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s385 = @tactics.exists_tac(x384)
    fn(x386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s385(x386)
    }
  }, @list.List([@term_syntax.parse_term("-(c : Real)"), t387]))
  let t383 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t380 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("!((c : Real) == real_of_num(0)) → real_of_num(0) < c || real_of_num(0) < -c")))
  let t382 = @tactics.first_x_assum(fn(x381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t380(x381))
  })
  let t378 = @term_syntax.parse_term("(g : (Cart[Real, N]) -> Cart[Real, N])")
  let t379 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : Real)"), t378]))
  let t376 = @meson.meson_tac(@list.List([@realarith.real_lt_refl()]))
  let t377 = @list.List([@simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])), t376])
  let t391 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([vector_angle_preserving_eq_similarity()]))), @tactics.eq_tac), t377), t379), @tactics.strip_tac), t382), t383), t388), t389), t390)
  vector_angle_preserving_eq_similarity_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, N], (linear(f) && (∀ x : Cart[Real, N], ∀ y : Cart[Real, N], vector_angle(f(x), f(y)) == vector_angle(x, y))) == (∃ c : Real, ∃ g : (Cart[Real, N]) -> Cart[Real, N], real_of_num(0) < c && orthogonal_transformation(g) && f == ((z : Cart[Real, N]) => op_pct(c, g(z))))"), t391))
}

///|
let vector_angle_preserving_eq_similarity_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_PRESERVING_EQ_SIMILARITY_ALT")

///|
/// `VECTOR_ANGLE_PRESERVING_EQ_SIMILARITY_ALT`
pub fn vector_angle_preserving_eq_similarity_alt() -> @kernel.Thm {
  vector_angle_preserving_eq_similarity_alt_c.get()
}

///|
/// angle
fn step_51() -> Unit raise {
  angle_c.set(@pair.new_definition(@term_syntax.parse_term("(angle : ((Cart[Real, _], Cart[Real, _], Cart[Real, _])) -> Real)(((a : Cart[Real, _]), (b : Cart[Real, _]), (c : Cart[Real, _]))) == vector_angle(vector_sub(a, b), vector_sub(c, b))")))
}

///|
let angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("angle")

///|
/// `angle`
pub fn angle() -> @kernel.Thm {
  angle_c.get()
}

///|
/// ANGLE_LINEAR_IMAGE_EQ
fn step_52() -> Unit raise {
  let t392 = @simp.simp_tac(@list.List([angle(), @equal.gsym(@vectors.linear_sub()), vector_angle_linear_image_eq()]))
  angle_linear_image_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, _], ∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ c : Cart[Real, _], linear(f) && (∀ x : Cart[Real, _], norm(f(x)) == norm(x)) → angle((f(a), f(b), f(c))) == angle((a, b, c))"), t392))
}

///|
let angle_linear_image_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_LINEAR_IMAGE_EQ")

///|
/// `ANGLE_LINEAR_IMAGE_EQ`
pub fn angle_linear_image_eq() -> @kernel.Thm {
  angle_linear_image_eq_c.get()
}

///|
/// Multivariate/geom.ml:515
fn step_53() -> Unit raise {
  @vectors.add_linear_invariants(@list.List([angle_linear_image_eq()]))
}

///|
/// ANGLE_TRANSLATION_EQ
fn step_54() -> Unit raise {
  let t393 = @simp.rewrite_tac(@list.List([angle()]))
  let t394 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t393), @tactics.binop_tac), @vectors.vector_arith_tac)
  angle_translation_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ c : Cart[Real, _], ∀ d : Cart[Real, _], angle((vector_add(a, b), vector_add(a, c), vector_add(a, d))) == angle((b, c, d))"), t394))
}

///|
let angle_translation_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_TRANSLATION_EQ")

///|
/// `ANGLE_TRANSLATION_EQ`
pub fn angle_translation_eq() -> @kernel.Thm {
  angle_translation_eq_c.get()
}

///|
/// Multivariate/geom.ml:522
fn step_55() -> Unit raise {
  @vectors.add_translation_invariants(@list.List([angle_translation_eq()]))
}

///|
/// VECTOR_ANGLE_ANGLE
fn step_56() -> Unit raise {
  let t395 = @simp.rewrite_tac(@list.List([angle(), @vectors.vector_sub_rzero()]))
  vector_angle_angle_c.set(@tactics.prove(@term_syntax.parse_term("vector_angle((x : Cart[Real, _]), (y : Cart[Real, _])) == angle((x, vec(0), y))"), t395))
}

///|
let vector_angle_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_ANGLE")

///|
/// `VECTOR_ANGLE_ANGLE`
pub fn vector_angle_angle() -> @kernel.Thm {
  vector_angle_angle_c.get()
}

///|
/// ANGLE_EQ_PI_DIST
fn step_57() -> Unit raise {
  let t396 = @tactics.then_tac(@simp.rewrite_tac(@list.List([angle(), vector_angle_eq_pi_dist()])), @vectors.norm_arith_tac)
  angle_eq_pi_dist_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], (angle((A, B, C)) == pi) == (!(A == B) && !(C == B) && distance((A, C)) == distance((A, B)) + distance((B, C)))"), t396))
}

///|
let angle_eq_pi_dist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_EQ_PI_DIST")

///|
/// `ANGLE_EQ_PI_DIST`
pub fn angle_eq_pi_dist() -> @kernel.Thm {
  angle_eq_pi_dist_c.get()
}

///|
/// SIN_ANGLE_POS
fn step_58() -> Unit raise {
  let t397 = @simp.rewrite_tac(@list.List([angle(), sin_vector_angle_pos()]))
  sin_angle_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], real_of_num(0) <= sin(angle((A, B, C)))"), t397))
}

///|
let sin_angle_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_ANGLE_POS")

///|
/// `SIN_ANGLE_POS`
pub fn sin_angle_pos() -> @kernel.Thm {
  sin_angle_pos_c.get()
}

///|
/// ANGLE
fn step_59() -> Unit raise {
  let t398 = @simp.rewrite_tac(@list.List([angle(), @vectors.dist(), @equal.gsym(vector_angle_v1())]))
  angle_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], dot(vector_sub(A, C), vector_sub(B, C)) == real_mul(distance((A, C)), real_mul(distance((B, C)), cos(angle((A, C, B)))))"), t398))
}

///|
let angle_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE")

///|
/// `ANGLE`
pub fn angle_v1() -> @kernel.Thm {
  angle_v1_c.get()
}

///|
/// ANGLE_REFL
fn step_60() -> Unit raise {
  let t399 = @simp.rewrite_tac(@list.List([angle(), vector_angle(), @vectors.vector_sub_refl()]))
  angle_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], angle((A, A, B)) == pi / real_of_num(2) && angle((B, A, A)) == pi / real_of_num(2)"), t399))
}

///|
let angle_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_REFL")

///|
/// `ANGLE_REFL`
pub fn angle_refl() -> @kernel.Thm {
  angle_refl_c.get()
}

///|
/// ANGLE_REFL_MID
fn step_61() -> Unit raise {
  let t400 = @equal.gsym(@realarith.real_pow_2())
  let t401 = @simp.simp_tac(@list.List([angle(), vector_angle(), @vectors.vector_sub_eq(), @equal.gsym(@vectors.norm_pow_2()), @calc_num.arith(), t400, @real.real_div_refl(), @transcendentals.acs_1(), @real.real_pow_eq_0(), @vectors.norm_eq_0()]))
  angle_refl_mid_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], !(A == B) → angle((A, B, A)) == real_of_num(0)"), t401))
}

///|
let angle_refl_mid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_REFL_MID")

///|
/// `ANGLE_REFL_MID`
pub fn angle_refl_mid() -> @kernel.Thm {
  angle_refl_mid_c.get()
}

///|
/// ANGLE_SYM
fn step_62() -> Unit raise {
  let t402 = @simp.rewrite_tac(@list.List([angle(), vector_angle(), @vectors.vector_sub_eq(), @theorems.disj_sym(), @realax.real_mul_sym(), @vectors.dot_sym()]))
  angle_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], angle((A, B, C)) == angle((C, B, A))"), t402))
}

///|
let angle_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_SYM")

///|
/// `ANGLE_SYM`
pub fn angle_sym() -> @kernel.Thm {
  angle_sym_c.get()
}

///|
/// ANGLE_RANGE
fn step_63() -> Unit raise {
  let t403 = @simp.rewrite_tac(@list.List([angle(), vector_angle_range()]))
  angle_range_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], real_of_num(0) <= angle((A, B, C)) && angle((A, B, C)) <= pi"), t403))
}

///|
let angle_range_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_RANGE")

///|
/// `ANGLE_RANGE`
pub fn angle_range() -> @kernel.Thm {
  angle_range_c.get()
}

///|
/// COS_ANGLE_EQ
fn step_64() -> Unit raise {
  let t404 = @simp.rewrite_tac(@list.List([angle(), cos_vector_angle_eq()]))
  cos_angle_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ c : Cart[Real, _], ∀ a' : Cart[Real, _], ∀ b' : Cart[Real, _], ∀ c' : Cart[Real, _], (cos(angle((a, b, c))) == cos(angle((a', b', c')))) == (angle((a, b, c)) == angle((a', b', c')))"), t404))
}

///|
let cos_angle_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COS_ANGLE_EQ")

///|
/// `COS_ANGLE_EQ`
pub fn cos_angle_eq() -> @kernel.Thm {
  cos_angle_eq_c.get()
}

///|
/// ANGLE_EQ
fn step_65() -> Unit raise {
  let t405 = @simp.simp_tac(@list.List([angle(), vector_angle_eq(), @vectors.vector_sub_eq()]))
  angle_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ c : Cart[Real, _], ∀ a' : Cart[Real, _], ∀ b' : Cart[Real, _], ∀ c' : Cart[Real, _], !(a == b) && !(c == b) && !(a' == b') && !(c' == b') → (angle((a, b, c)) == angle((a', b', c'))) == (real_mul(dot(vector_sub(a', b'), vector_sub(c', b')), real_mul(vector_norm(vector_sub(a, b)), vector_norm(vector_sub(c, b)))) == real_mul(dot(vector_sub(a, b), vector_sub(c, b)), real_mul(vector_norm(vector_sub(a', b')), vector_norm(vector_sub(c', b')))))"), t405))
}

///|
let angle_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_EQ")

///|
/// `ANGLE_EQ`
pub fn angle_eq() -> @kernel.Thm {
  angle_eq_c.get()
}

///|
/// SIN_ANGLE_EQ_0
fn step_66() -> Unit raise {
  let t406 = @simp.rewrite_tac(@list.List([angle(), sin_vector_angle_eq_0()]))
  sin_angle_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], (sin(angle((A, B, C))) == real_of_num(0)) == (angle((A, B, C)) == real_of_num(0) || angle((A, B, C)) == pi)"), t406))
}

///|
let sin_angle_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_ANGLE_EQ_0")

///|
/// `SIN_ANGLE_EQ_0`
pub fn sin_angle_eq_0() -> @kernel.Thm {
  sin_angle_eq_0_c.get()
}

///|
/// SIN_ANGLE_EQ
fn step_67() -> Unit raise {
  let t407 = @simp.rewrite_tac(@list.List([angle(), sin_vector_angle_eq()]))
  sin_angle_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], ∀ A' : Cart[Real, _], ∀ B' : Cart[Real, _], ∀ C' : Cart[Real, _], (sin(angle((A, B, C))) == sin(angle((A', B', C')))) == (angle((A, B, C)) == angle((A', B', C')) || angle((A, B, C)) == pi - angle((A', B', C')))"), t407))
}

///|
let sin_angle_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_ANGLE_EQ")

///|
/// `SIN_ANGLE_EQ`
pub fn sin_angle_eq() -> @kernel.Thm {
  sin_angle_eq_c.get()
}

///|
/// COLLINEAR_ANGLE
fn step_68() -> Unit raise {
  let t408 = @simp.simp_tac(@list.List([collinear_vector_angle(), @vectors.vector_sub_eq(), angle()]))
  let t409 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@vectors.collinear_3()])), t408)
  collinear_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], !(A == B) && !(B == C) → collinear({A, B, C}) == (angle((A, B, C)) == real_of_num(0) || angle((A, B, C)) == pi)"), t409))
}

///|
let collinear_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_ANGLE")

///|
/// `COLLINEAR_ANGLE`
pub fn collinear_angle() -> @kernel.Thm {
  collinear_angle_c.get()
}

///|
/// COLLINEAR_SIN_ANGLE
fn step_69() -> Unit raise {
  let t410 = @simp.rewrite_tac(@list.List([sin_angle_eq_0(), collinear_angle()]))
  collinear_sin_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], !(A == B) && !(B == C) → collinear({A, B, C}) == (sin(angle((A, B, C))) == real_of_num(0))"), t410))
}

///|
let collinear_sin_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_SIN_ANGLE")

///|
/// `COLLINEAR_SIN_ANGLE`
pub fn collinear_sin_angle() -> @kernel.Thm {
  collinear_sin_angle_c.get()
}

///|
/// COLLINEAR_SIN_ANGLE_IMP
fn step_70() -> Unit raise {
  let t419 = @simp.simp_tac(@list.List([@vectors.vector_sub_eq()]))
  let t416 = @drule.match_mp(collinear_sin_vector_angle_imp())
  let t418 = @tactics.disch_then(fn(x417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x413 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s414 = @tactics.mp_tac(x413)
      fn(x415 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s414(x415)
      }
    })(t416(x417))
  })
  let t412 = @simp.rewrite_tac(@list.List([angle()]))
  let t411 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t420 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t411), t412), t418), t419)
  collinear_sin_angle_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], sin(angle((A, B, C))) == real_of_num(0) → !(A == B) && !(B == C) && collinear({A, B, C})"), t420))
}

///|
let collinear_sin_angle_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_SIN_ANGLE_IMP")

///|
/// `COLLINEAR_SIN_ANGLE_IMP`
pub fn collinear_sin_angle_imp() -> @kernel.Thm {
  collinear_sin_angle_imp_c.get()
}

///|
/// ANGLE_EQ_0_RIGHT
fn step_71() -> Unit raise {
  let t421 = @simp.rewrite_tac(@list.List([vector_angle_eq_0_right(), angle()]))
  angle_eq_0_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], angle((A, B, C)) == real_of_num(0) → angle((A, B, (D : Cart[Real, _]))) == angle((C, B, D))"), t421))
}

///|
let angle_eq_0_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_EQ_0_RIGHT")

///|
/// `ANGLE_EQ_0_RIGHT`
pub fn angle_eq_0_right() -> @kernel.Thm {
  angle_eq_0_right_c.get()
}

///|
/// ANGLE_EQ_0_LEFT
fn step_72() -> Unit raise {
  let t422 = @meson.meson_tac(@list.List([angle_eq_0_right(), angle_sym()]))
  angle_eq_0_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], angle((A, B, C)) == real_of_num(0) → angle(((D : Cart[Real, _]), B, A)) == angle((D, B, C))"), t422))
}

///|
let angle_eq_0_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_EQ_0_LEFT")

///|
/// `ANGLE_EQ_0_LEFT`
pub fn angle_eq_0_left() -> @kernel.Thm {
  angle_eq_0_left_c.get()
}

///|
/// ANGLE_EQ_PI_RIGHT
fn step_73() -> Unit raise {
  let t423 = @simp.rewrite_tac(@list.List([vector_angle_eq_pi_left(), angle()]))
  angle_eq_pi_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], angle((A, B, C)) == pi → angle(((D : Cart[Real, _]), B, A)) == pi - angle((D, B, C))"), t423))
}

///|
let angle_eq_pi_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_EQ_PI_RIGHT")

///|
/// `ANGLE_EQ_PI_RIGHT`
pub fn angle_eq_pi_right() -> @kernel.Thm {
  angle_eq_pi_right_c.get()
}

///|
/// ANGLE_EQ_PI_LEFT
fn step_74() -> Unit raise {
  let t424 = @meson.meson_tac(@list.List([angle_eq_pi_right(), angle_sym()]))
  angle_eq_pi_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, _], ∀ B : Cart[Real, _], ∀ C : Cart[Real, _], angle((A, B, C)) == pi → angle((A, B, (D : Cart[Real, _]))) == pi - angle((C, B, D))"), t424))
}

///|
let angle_eq_pi_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_EQ_PI_LEFT")

///|
/// `ANGLE_EQ_PI_LEFT`
pub fn angle_eq_pi_left() -> @kernel.Thm {
  angle_eq_pi_left_c.get()
}

///|
/// COS_ANGLE
fn step_75() -> Unit raise {
  let t425 = @simp.rewrite_tac(@list.List([angle(), cos_vector_angle(), @vectors.vector_sub_eq()]))
  cos_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ c : Cart[Real, _], cos(angle((a, b, c))) == (if a == b || c == b { real_of_num(0) } else { real_div(dot(vector_sub(a, b), vector_sub(c, b)), real_mul(vector_norm(vector_sub(a, b)), vector_norm(vector_sub(c, b)))) })"), t425))
}

///|
let cos_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COS_ANGLE")

///|
/// `COS_ANGLE`
pub fn cos_angle() -> @kernel.Thm {
  cos_angle_c.get()
}

///|
/// SIN_ANGLE
fn step_76() -> Unit raise {
  let t426 = @simp.rewrite_tac(@list.List([angle(), sin_vector_angle(), @vectors.vector_sub_eq()]))
  sin_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ c : Cart[Real, _], sin(angle((a, b, c))) == (if a == b || c == b { real_of_num(1) } else { sqrt(real_sub(real_of_num(1), real_pow(real_div(dot(vector_sub(a, b), vector_sub(c, b)), real_mul(vector_norm(vector_sub(a, b)), vector_norm(vector_sub(c, b)))), 2))) })"), t426))
}

///|
let sin_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_ANGLE")

///|
/// `SIN_ANGLE`
pub fn sin_angle() -> @kernel.Thm {
  sin_angle_c.get()
}

///|
/// SIN_SQUARED_ANGLE
fn step_77() -> Unit raise {
  let t427 = @simp.rewrite_tac(@list.List([angle(), sin_squared_vector_angle(), @vectors.vector_sub_eq()]))
  sin_squared_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ c : Cart[Real, _], real_pow(sin(angle((a, b, c))), 2) == (if a == b || c == b { real_of_num(1) } else { real_sub(real_of_num(1), real_pow(real_div(dot(vector_sub(a, b), vector_sub(c, b)), real_mul(vector_norm(vector_sub(a, b)), vector_norm(vector_sub(c, b)))), 2)) })"), t427))
}

///|
let sin_squared_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_SQUARED_ANGLE")

///|
/// `SIN_SQUARED_ANGLE`
pub fn sin_squared_angle() -> @kernel.Thm {
  sin_squared_angle_c.get()
}

///|
/// COS_ADJACENT_HYPOTENUSE
fn step_78() -> Unit raise {
  let t440 = @simp.rewrite_tac(@list.List([@vectors.dot_rsub(), @vectors.norm_pow_2()]))
  let t437 = @simp.gen_rewrite_rule(fn(x436 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x436
  }, @list.List([@vectors.orthogonal()]))
  let t439 = @tactics.first_x_assum(fn(x438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s434 = @tactics.mp_tac(x433)
      fn(x435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s434(x435)
      }
    })(t437(x438))
  })
  let t432 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_eq_0(), @equal.gsym(vector_angle_v1())]))
  let t441 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("!((b : Real) == real_of_num(0)) && b * (x : Real) == pow(b, 2) → x == b"))), t432), t439), t440), @calc_rat.real_arith_tac)
  let t442 = @list.List([@simp.asm_rewrite_tac(@list.List([vector_angle(), @transcendentals.cos_pi2(), @vectors.norm_0(), @calc_int.real_mul_rzero()])), t441])
  let t431 = @class.asm_cases_tac(@term_syntax.parse_term("(B : Cart[Real, N]) == vec(0)"))
  let t430 = @simp.rewrite_tac(@list.List([@vectors.orthogonal_lneg(), @vectors.vector_sub_lzero()]))
  let t429 = @simp.rewrite_tac(@list.List([@vectors.dist_0(), angle(), @vectors.vector_sub_rzero()]))
  let t428 = @tactics.repeat_tac(@tactics.gen_tac)
  let t443 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@determinants.geom_origin_tac(@term_syntax.parse_term("(A : Cart[Real, N])")), t428), t429), t430), @tactics.disch_tac), t431), t442)
  cos_adjacent_hypotenuse_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], orthogonal(A - B, C - B) → distance((A, C)) * cos(angle((B, A, C))) == distance((A, B))"), t443))
}

///|
let cos_adjacent_hypotenuse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COS_ADJACENT_HYPOTENUSE")

///|
/// `COS_ADJACENT_HYPOTENUSE`
pub fn cos_adjacent_hypotenuse() -> @kernel.Thm {
  cos_adjacent_hypotenuse_c.get()
}

///|
/// COS_ADJACENT_OVER_HYPOTENUSE
fn step_79() -> Unit raise {
  let t447 = @simp.rewrite_tac(@list.List([cos_adjacent_hypotenuse()]))
  let t446 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t448 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_eq_rdiv_eq(), @vectors.dist_pos_lt()])), t446), t447)
  let t445 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div()), @transcendentals.cos_pi2(), @calc_int.real_mul_rzero()]))
  let t449 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.dist_refl(), @realax.real_div(), @realax.real_inv_0(), angle(), @vectors.vector_sub_refl(), vector_angle()])), t445), t448])
  let t444 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (C : Cart[Real, N])"))
  let t450 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t444), t449)
  cos_adjacent_over_hypotenuse_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], orthogonal(A - B, C - B) → cos(angle((B, A, C))) == distance((A, B)) / distance((A, C))"), t450))
}

///|
let cos_adjacent_over_hypotenuse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COS_ADJACENT_OVER_HYPOTENUSE")

///|
/// `COS_ADJACENT_OVER_HYPOTENUSE`
pub fn cos_adjacent_over_hypotenuse() -> @kernel.Thm {
  cos_adjacent_over_hypotenuse_c.get()
}

///|
/// SIN_OPPOSITE_HYPOTENUSE
fn step_80() -> Unit raise {
  let t478 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist()), @vectors.dist_sym()]))
  let t475 = @drule.match_mp(pythagoras())
  let t477 = @tactics.first_assum(fn(x476 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s473 = @tactics.mp_tac(x472)
      fn(x474 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s473(x474)
      }
    })(t475(x476))
  })
  let t471 = @simp.asm_rewrite_tac(@list.List([@transcendentals.sin_circle(), @real.real_pow_eq_0(), @vectors.dist_eq_0()]))
  let t470 = @tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("(d : Real) + (e : Real) == (h : Real) && (s : Real) + (c : Real) == real_of_num(1) && !(h == real_of_num(0)) → h * c == d → e == h * s")))
  let t468 = @equal.gsym(@vectors.dist())
  let t469 = @simp.rewrite_tac(@list.List([@real.real_pow_mul(), @equal.gsym(@vectors.norm_pow_2()), t468]))
  let t465 = @drule.match_mp(@calc_rat.real_ring(@term_syntax.parse_term("(x : Real) == (y : Real) → pow(x, 2) == pow(y, 2)")))
  let t467 = @tactics.disch_then(fn(x466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x462 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s463 = @tactics.mp_tac(x462)
      fn(x464 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s463(x464)
      }
    })(t465(x466))
  })
  let t459 = @drule.match_mp(cos_adjacent_hypotenuse())
  let t461 = @tactics.first_assum(fn(x460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x456 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s457 = @tactics.mp_tac(x456)
      fn(x458 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s457(x458)
      }
    })(t459(x460))
  })
  let t455 = @simp.simp_tac(@list.List([@realax.real_le_mul(), sin_angle_pos(), @vectors.norm_pos_le()]))
  let t454 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_eq_square()]))
  let t453 = @tactics.conv_tac(@equal.sym_conv)
  let t452 = @simp.asm_simp_tac(@list.List([@vectors.orthogonal_refl(), @vectors.vector_sub_eq(), @vectors.dist_refl(), @calc_int.real_mul_lzero()]))
  let t451 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (C : Cart[Real, N])"))
  let t479 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t451), t452), @tactics.disch_tac), t453), t454), t455), t461), t467), t469), t470), t471), t477), t478), @calc_rat.real_arith_tac)
  sin_opposite_hypotenuse_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], orthogonal(A - B, C - B) → distance((A, C)) * sin(angle((B, A, C))) == distance((C, B))"), t479))
}

///|
let sin_opposite_hypotenuse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_OPPOSITE_HYPOTENUSE")

///|
/// `SIN_OPPOSITE_HYPOTENUSE`
pub fn sin_opposite_hypotenuse() -> @kernel.Thm {
  sin_opposite_hypotenuse_c.get()
}

///|
/// SIN_OPPOSITE_OVER_HYPOTENUSE
fn step_81() -> Unit raise {
  let t481 = @simp.simp_tac(@list.List([sin_opposite_hypotenuse()]))
  let t480 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t482 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@real.real_eq_rdiv_eq(), @vectors.dist_pos_lt()])), t480), t481)
  sin_opposite_over_hypotenuse_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], orthogonal(A - B, C - B) && !(A == C) → sin(angle((B, A, C))) == distance((C, B)) / distance((A, C))"), t482))
}

///|
let sin_opposite_over_hypotenuse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_OPPOSITE_OVER_HYPOTENUSE")

///|
/// `SIN_OPPOSITE_OVER_HYPOTENUSE`
pub fn sin_opposite_over_hypotenuse() -> @kernel.Thm {
  sin_opposite_over_hypotenuse_c.get()
}

///|
/// TAN_OPPOSITE_ADJACENT
fn step_82() -> Unit raise {
  let t503 = @meson.asm_meson_tac(@list.List([@vectors.dist_eq_0()]))
  let t502 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realax.real_div(), @calc_int.real_mul_rzero(), @realax.real_inv_0()]))
  let t500 = @tactics.conv_tac(@calc_rat.real_field)
  let t501 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.pop_assum(fn(x497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s498 = @tactics.mp_tac(x497)
    fn(x499 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s498(x499)
    }
  }), t500)])
  let t496 = @class.asm_cases_tac(@term_syntax.parse_term("cos(angle(((B : Cart[Real, N]), (A : Cart[Real, N]), (C : Cart[Real, N])))) == real_of_num(0)"))
  let t493 = @drule.match_mp(sin_opposite_hypotenuse())
  let t495 = @tactics.first_assum(fn(x494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s491 = @tactics.mp_tac(x490)
      fn(x492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s491(x492)
      }
    })(t493(x494))
  })
  let t487 = @drule.match_mp(cos_adjacent_hypotenuse())
  let t489 = @tactics.first_assum(fn(x488 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x484 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s485 = @tactics.mp_tac(x484)
      fn(x486 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s485(x486)
      }
    })(t487(x488))
  })
  let t483 = @simp.rewrite_tac(@list.List([@transcendentals.tan()]))
  let t504 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t483), t489), t495), t496), t501), t502), t503)
  tan_opposite_adjacent_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], orthogonal(A - B, C - B) && !(A == B) → distance((A, B)) * tan(angle((B, A, C))) == distance((C, B))"), t504))
}

///|
let tan_opposite_adjacent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAN_OPPOSITE_ADJACENT")

///|
/// `TAN_OPPOSITE_ADJACENT`
pub fn tan_opposite_adjacent() -> @kernel.Thm {
  tan_opposite_adjacent_c.get()
}

///|
/// TAN_OPPOSITE_OVER_ADJACENT
fn step_83() -> Unit raise {
  let t508 = @simp.asm_simp_tac(@list.List([tan_opposite_adjacent()]))
  let t507 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t509 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_eq_rdiv_eq(), @vectors.dist_pos_lt()])), t507), t508)
  let t506 = @simp.rewrite_tac(@list.List([@transcendentals.tan(), @transcendentals.cos_pi2(), @vectors.dist_refl(), @realax.real_div(), @realax.real_inv_0(), @calc_int.real_mul_rzero()]))
  let t510 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([angle(), @vectors.vector_sub_refl(), vector_angle()])), t506), t509])
  let t505 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t511 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t505), t510)
  tan_opposite_over_adjacent_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], orthogonal(A - B, C - B) → tan(angle((B, A, C))) == distance((C, B)) / distance((A, B))"), t511))
}

///|
let tan_opposite_over_adjacent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAN_OPPOSITE_OVER_ADJACENT")

///|
/// `TAN_OPPOSITE_OVER_ADJACENT`
pub fn tan_opposite_over_adjacent() -> @kernel.Thm {
  tan_opposite_over_adjacent_c.get()
}

///|
/// LAW_OF_COSINES
fn step_84() -> Unit raise {
  let t512 = @equal.gsym(vector_angle_v1())
  let t513 = @simp.rewrite_tac(@list.List([angle(), @simp.once_rewrite_rule(@list.List([@vectors.norm_sub()]))(@vectors.dist()), t512, @vectors.norm_pow_2()]))
  let t514 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t513), @vectors.vector_arith_tac)
  law_of_cosines_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], pow(distance((B, C)), 2) == pow(distance((A, B)), 2) + pow(distance((A, C)), 2) - real_of_num(2) * (distance((A, B)) * (distance((A, C)) * cos(angle((B, A, C)))))"), t514))
}

///|
let law_of_cosines_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAW_OF_COSINES")

///|
/// `LAW_OF_COSINES`
pub fn law_of_cosines() -> @kernel.Thm {
  law_of_cosines_c.get()
}

///|
/// LAW_OF_SINES
fn step_85() -> Unit raise {
  let t546 = @tactics.conv_tac(@calc_rat.real_ring)
  let t545 = @simp.rewrite_tac(@list.List([@vectors.dot_lsub(), @vectors.dot_rsub(), @vectors.dot_sym()]))
  let t544 = @simp.rewrite_tac(@list.List([@real.real_pow_mul(), @vectors.dist(), @vectors.norm_pow_2()]))
  let t542 = @equal.gsym(angle_v1())
  let t543 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_mul()), t542]))
  let t541 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("((a : Real) * ((real_of_num(1) - (x : Real)) * (b : Real)) == (c : Real) * ((real_of_num(1) - (y : Real)) * (d : Real))) == (a * b - a * (b * x) == c * d - c * (d * y))"))]))
  let t540 = @simp.gen_rewrite_tac(fn(x539 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x535 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x529 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s530 = @equal.rand_conv(x529)
        fn(x531 : @kernel.Term) -> @kernel.Thm raise {
          s530(x531)
        }
      })((fn(x532 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s533 = @equal.land_conv(x532)
        fn(x534 : @kernel.Term) -> @kernel.Thm raise {
          s533(x534)
        }
      })(x535))
    })((fn(x536 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s537 = @equal.once_depth_conv(x536)
      fn(x538 : @kernel.Term) -> @kernel.Thm raise {
        s537(x538)
      }
    })(x539))
  }, @list.List([@vectors.dist_sym()]))
  let t528 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t527 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t524 = @drule.match_mp(@calc_rat.real_ring(@term_syntax.parse_term("!((a : Real) == real_of_num(0)) → pow(a, 2) * (x : Real) == pow(a, 2) * (y : Real) → x == y")))
  let t526 = @tactics.first_x_assum(fn(x525 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t524(x525))
  })
  let t523 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@vectors.norm_eq_0())])))
  let t522 = @tactics.rule_assum_tac(@simp.once_rewrite_rule(@list.List([@equal.gsym(@vectors.vector_sub_eq())])))
  let t521 = @simp.asm_rewrite_tac(@list.List([angle_refl(), @transcendentals.cos_pi2()]))
  let t520 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t518 = @bool.spec_all(@transcendentals.sin_circle())
  let t519 = @simp.rewrite_tac(@list.List([@real.real_pow_mul(), @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (y : Real) == real_of_num(1) → x == real_of_num(1) - y")))(t518)]))
  let t517 = @simp.simp_tac(@list.List([sin_angle_pos(), @vectors.dist_pos_le(), @realax.real_le_mul(), @calc_num.arith()]))
  let t516 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t515 = @tactics.match_mp_tac(@real.real_pow_eq())
  let t547 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t515), t516), t517), t519), t520), t521), t522), t523), t526), t527), t528), t540), t541), t543), t544), t545), t546)
  law_of_sines_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], sin(angle((A, B, C))) * distance((B, C)) == sin(angle((B, A, C))) * distance((A, C))"), t547))
}

///|
let law_of_sines_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAW_OF_SINES")

///|
/// `LAW_OF_SINES`
pub fn law_of_sines() -> @kernel.Thm {
  law_of_sines_c.get()
}

///|
/// TRIANGLE_ANGLE_SUM_LEMMA
fn step_86() -> Unit raise {
  let t575 = @tactics.conv_tac(@calc_rat.real_ring)
  let t574 = @simp.rewrite_tac(@list.List([@transcendentals.cos_add(), @transcendentals.sin_add(), angle_sym()]))
  let t571 = @term_syntax.parse_term("angle(((B : Cart[Real, N]), (C : Cart[Real, N]), (A : Cart[Real, N])))")
  let t572 = @term_syntax.parse_term("angle(((A : Cart[Real, N]), (B : Cart[Real, N]), (C : Cart[Real, N])))")
  let t573 = @tactics.map_every(fn(x569 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x569
    @tactics.mp_tac(@bool.spec(t, @transcendentals.sin_circle()))
  }, @list.List([@term_syntax.parse_term("angle(((B : Cart[Real, N]), (A : Cart[Real, N]), (C : Cart[Real, N])))"), t572, t571]))
  let t568 = @simp.rewrite_tac(@list.List([@transcendentals.cos_add(), @transcendentals.sin_add(), @vectors.dist(), @vectors.norm_sub()]))
  let t565 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t566 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t567 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, N])"), t566, t565]), law_of_sines()))
  let t562 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t563 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t564 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, N])"), t563, t562]), law_of_sines()))
  let t559 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t560 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t561 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t560, t559]), law_of_sines()))
  let t556 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t557 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t558 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(C : Cart[Real, N])"), t557, t556]), law_of_cosines()))
  let t553 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t554 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t555 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, N])"), t554, t553]), law_of_cosines()))
  let t550 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t551 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t552 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t551, t550]), law_of_cosines()))
  let t549 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.norm_eq_0())]))
  let t548 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_eq())]))
  let t576 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t548), t549), t552), t555), t558), t561), t564), t567), t568), t573), t574), t575)
  triangle_angle_sum_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], !(A == B) && !(A == C) && !(B == C) → cos(angle((B, A, C)) + (angle((A, B, C)) + angle((B, C, A)))) == -real_of_num(1)"), t576))
}

///|
let triangle_angle_sum_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIANGLE_ANGLE_SUM_LEMMA")

///|
/// `TRIANGLE_ANGLE_SUM_LEMMA`
pub fn triangle_angle_sum_lemma() -> @kernel.Thm {
  triangle_angle_sum_lemma_c.get()
}

///|
/// COS_MINUS1_LEMMA
fn step_87() -> Unit raise {
  let t617 = @simp.simp_tac(@list.List([@transcendentals.cos_0(), @calc_int.real_mul_lzero(), @transcendentals.cos_npi()]))
  let t616 = @tactics.repeat_tac(@tactics.pop_assum(fn(x613 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s614 = @tactics.mp_tac(x613)
    fn(x615 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s614(x615)
    }
  }))
  let t612 = @tactics.disch_then(fn(x609 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s610 = @tactics.subst_all_tac(x609)
    fn(x611 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s610(x611)
    }
  })
  let t608 = @simp.asm_rewrite_tac(@list.List([]))
  let t607 = @tactics.rule_assum_tac(@simp.simp_rule(@list.List([@real.real_lt_rmul_eq(), @transcendentals.pi_pos(), @real.real_of_num_lt()])))
  let t606 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) < 3 && !(n == 0) && !(n == 2) → n == 1")))
  let t605 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq()]))
  let t604 = @tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("(n : Real) == real_of_num(1) → n * (p : Real) == p")))
  let t602 = @meson.asm_meson_tac(@list.List([@floor.integer_pos(), @realarith.real_lt_le()]))
  let t601 = @simp.simp_tac(@list.List([@transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (p : Real) → !(p < real_of_num(0)) && !(p == real_of_num(0))"))]))
  let t599 = @simp.gen_rewrite_rule(fn(x598 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x598
  }, @list.List([@real.real_mul_pos_le()]))
  let t603 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s596 = @tactics.mp_tac(x595)
      fn(x597 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s596(x597)
      }
    })(t599(x600))
  }), t601), t602), @tactics.all_tac])
  let t593 = @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s591 = @tactics.subst_all_tac(x590)
    fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s591(x592)
    }
  })
  let t594 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Num, (nn : Real) == real_of_num(n)"), t593)
  let t588 = @tactics.conv_tac(@calc_rat.real_ring)
  let t587 = @simp.asm_rewrite_tac(@list.List([]))
  let t589 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), @transcendentals.sin_circle())), t587), t588), @tactics.all_tac])
  let t586 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.sin_eq_0())]))
  let t583 = @tactics.conjuncts_then2(fn(x577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s578 = @tactics.assume_tac(x577)
    fn(x579 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s578(x579)
    }
  }, fn(x580 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s581 = @tactics.subst_all_tac(x580)
    fn(x582 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s581(x582)
    }
  })
  let t584 = @tactics.x_choose_then(@term_syntax.parse_term("(nn : Real)"))(t583)
  let t585 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Real, integer(n) && (x : Real) == n * pi"), t584)
  let t618 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t585), t586), t589), t594), t603), t604), t605), t606), t607), t608), @tactics.conj_tac), t612), t616), t617), @calc_rat.real_arith_tac)
  cos_minus1_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, cos(x) == -real_of_num(1) && real_of_num(0) <= x && x < real_of_num(3) * pi → x == pi"), t618))
}

///|
let cos_minus1_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COS_MINUS1_LEMMA")

///|
/// `COS_MINUS1_LEMMA`
pub fn cos_minus1_lemma() -> @kernel.Thm {
  cos_minus1_lemma_c.get()
}

///|
/// TRIANGLE_ANGLE_SUM
fn step_88() -> Unit raise {
  let t654 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.norm_eq_0()), @vectors.dist(), @vectors.norm_sub()]))
  let t651 = @simp.gen_rewrite_rule(fn(x648 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s649 = @equal.rand_conv(x648)
    fn(x650 : @kernel.Term) -> @kernel.Thm raise {
      s649(x650)
    }
  }, @list.List([@equal.gsym(@vectors.vector_sub_eq())]))
  let t653 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x645 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s646 = @tactics.mp_tac(x645)
      fn(x647 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s646(x647)
      }
    })(t651(x652))
  }))
  let t642 = @simp.gen_rewrite_rule(fn(x641 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x641
  }, @list.List([angle_eq_pi_dist()]))
  let t644 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s639 = @tactics.mp_tac(x638)
      fn(x640 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s639(x640)
      }
    })(t642(x643))
  }))
  let t637 = @tactics.repeat_tac(@tactics.strip_tac)
  let t636 = @simp.asm_simp_tac(@list.List([angle_range()]))
  let t635 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (p : Real) && real_of_num(0) <= (y : Real) && y <= p && real_of_num(0) <= (z : Real) && z <= p && !(x == p && y == p && z == p) → x + (y + z) < real_of_num(3) * p")))
  let t634 = @simp.asm_simp_tac(@list.List([triangle_angle_sum_lemma(), @realarith.real_le_add(), angle_range()]))
  let t633 = @tactics.match_mp_tac(cos_minus1_lemma())
  let t632 = @tactics.repeat_tac(@tactics.strip_tac)
  let t631 = @simp.rewrite_tac(@list.List([@realax.real_add_lid(), @misc.real_half()]))
  let t630 = @tactics.repeat_tac(@tactics.pop_assum(fn(x627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s628 = @tactics.mp_tac(x627)
    fn(x629 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s628(x629)
    }
  }))
  let t626 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s624 = @tactics.subst_all_tac(x623)
    fn(x625 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s624(x625)
    }
  }))
  let t622 = @simp.asm_simp_tac(@list.List([angle_refl_mid(), angle_refl(), @misc.real_half(), @calc_int.real_add_rid()]))
  let t619 = @term_syntax.parse_term("(A : Cart[Real, N]) == (C : Cart[Real, N])")
  let t620 = @term_syntax.parse_term("(B : Cart[Real, N]) == (C : Cart[Real, N])")
  let t621 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(A : Cart[Real, N]) == (B : Cart[Real, N])"), t620, t619]))
  let t655 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t621), t622), t626), t630), t631), t632), t633), t634), t635), t636), t637), t644), t653), t654), @calc_rat.real_arith_tac)
  triangle_angle_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], !(A == B && B == C && A == C) → angle((B, A, C)) + (angle((A, B, C)) + angle((B, C, A))) == pi"), t655))
}

///|
let triangle_angle_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRIANGLE_ANGLE_SUM")

///|
/// `TRIANGLE_ANGLE_SUM`
pub fn triangle_angle_sum() -> @kernel.Thm {
  triangle_angle_sum_c.get()
}

///|
/// ANGLE_EQ_PI_OTHERS
fn step_89() -> Unit raise {
  let t670 = @simp.simp_tac(@list.List([angle_range(), angle_sym()]))
  let t667 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + ((p : Real) + (y : Real)) == p → real_of_num(0) <= x && real_of_num(0) <= y → x == real_of_num(0) && y == real_of_num(0)")))
  let t669 = @tactics.disch_then(fn(x668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x664 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s665 = @tactics.mp_tac(x664)
      fn(x666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s665(x666)
      }
    })(t667(x668))
  })
  let t663 = @simp.asm_rewrite_tac(@list.List([]))
  let t660 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t661 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t662 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t661, t660]), triangle_angle_sum()))
  let t657 = @simp.gen_rewrite_rule(fn(x656 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x656
  }, @list.List([angle_eq_pi_dist()]))
  let t659 = @tactics.first_assum(fn(x658 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t657(x658))
  })
  let t671 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t659), t662), t663), t669), t670)
  angle_eq_pi_others_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], angle((A, B, C)) == pi → angle((B, C, A)) == real_of_num(0) && angle((A, C, B)) == real_of_num(0) && angle((B, A, C)) == real_of_num(0) && angle((C, A, B)) == real_of_num(0)"), t671))
}

///|
let angle_eq_pi_others_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_EQ_PI_OTHERS")

///|
/// `ANGLE_EQ_PI_OTHERS`
pub fn angle_eq_pi_others() -> @kernel.Thm {
  angle_eq_pi_others_c.get()
}

///|
/// ANGLE_EQ_0_DIST
fn step_90() -> Unit raise {
  let t711 = @simp.simp_tac(@list.List([@vectors.dist_sym()]))
  let t710 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.dist_triangle_eq())]))
  let t709 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_lt(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t706 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@vectors.norm_cross_multiply()))
  let t708 = @tactics.disch_then(fn(x707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s704 = @tactics.mp_tac(x703)
      fn(x705 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s704(x705)
      }
    })(t706(x707))
  })
  let t700 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(op_pct(vector_norm(vector_sub((A : Cart[Real, _]), (B : Cart[Real, _]))), vector_sub((C : Cart[Real, _]), B)) == op_pct(vector_norm(vector_sub(C, B)), vector_sub(A, B))) == (op_pct(real_sub(vector_norm(vector_sub(A, B)), vector_norm(vector_sub(C, B))), vector_sub(C, B)) == op_pct(vector_norm(vector_sub(C, B)), vector_sub(A, C)))"))]))
  let t701 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(op_pct(vector_norm(vector_sub((A : Cart[Real, _]), (B : Cart[Real, _]))), vector_sub((C : Cart[Real, _]), B)) == op_pct(vector_norm(vector_sub(C, B)), vector_sub(A, B))) == (op_pct(real_sub(vector_norm(vector_sub(C, B)), vector_norm(vector_sub(A, B))), vector_sub(A, B)) == op_pct(vector_norm(vector_sub(A, B)), vector_sub(C, A)))"))]))
  let t702 = @list.List([@simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lcancel(), @vectors.norm_eq_0(), @vectors.vector_sub_eq(), @vectors.vector_arith(@term_syntax.parse_term("((c : Cart[Real, N]) - (b : Cart[Real, N]) == (a : Cart[Real, N]) - b) == (a == c)"))])), t701, t700])
  let t697 = @term_syntax.parse_term("norm((C : Cart[Real, N]) - (B : Cart[Real, N]))")
  let t698 = @bool.ispecl(@list.List([@term_syntax.parse_term("norm((A : Cart[Real, N]) - (B : Cart[Real, N]))"), t697]), @real.real_lt_total())
  let t699 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x694 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s695 = @tactics.assume_tac(x694)
    fn(x696 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s695(x696)
    }
  })(t698)
  let t693 = @simp.asm_rewrite_tac(@list.List([angle(), vector_angle_eq_0(), @vectors.vector_sub_eq()]))
  let t691 = @simp.simp_tac(@list.List([]))
  let t688 = @drule.match_mp(angle_eq_pi_others())
  let t690 = @tactics.disch_then(fn(x689 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x685 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s686 = @tactics.mp_tac(x685)
      fn(x687 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s686(x687)
      }
    })(t688(x689))
  })
  let t684 = @simp.rewrite_tac(@list.List([@vectors.dist_sym(), @calc_int.real_add_ac()]))
  let t683 = @simp.asm_rewrite_tac(@list.List([]))
  let t680 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t681 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t682 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, N])"), t681, t680]), angle_eq_pi_dist()))
  let t678 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t679 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t692 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.strip_tac, @list.List([@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t679, t678]), angle_eq_pi_dist())), t682])), t683), t684), t690), t691)])
  let t677 = @list.List([@simp.asm_simp_tac(@list.List([angle_refl_mid(), @vectors.dist_refl(), @realax.real_add_lid()])), @tactics.all_tac])
  let t676 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (C : Cart[Real, N])"))
  let t675 = @list.List([@simp.asm_rewrite_tac(@list.List([angle(), vector_angle_eq_0(), @vectors.vector_sub_eq()])), @tactics.all_tac])
  let t674 = @class.asm_cases_tac(@term_syntax.parse_term("(B : Cart[Real, N]) == (C : Cart[Real, N])"))
  let t673 = @list.List([@simp.asm_rewrite_tac(@list.List([angle(), vector_angle_eq_0(), @vectors.vector_sub_eq()])), @tactics.all_tac])
  let t672 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t712 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t672), t673), t674), t675), t676), t677), @tactics.eq_tac), t692), t693), t699), t702), t708), t709), t710), t711)
  angle_eq_0_dist_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], (angle((A, B, C)) == real_of_num(0)) == (!(A == B) && !(C == B) && (distance((A, B)) == distance((A, C)) + distance((C, B)) || distance((B, C)) == distance((A, C)) + distance((A, B))))"), t712))
}

///|
let angle_eq_0_dist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_EQ_0_DIST")

///|
/// `ANGLE_EQ_0_DIST`
pub fn angle_eq_0_dist() -> @kernel.Thm {
  angle_eq_0_dist_c.get()
}

///|
/// ANGLE_EQ_0_DIST_ABS
fn step_91() -> Unit raise {
  let t716 = @simp.rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t714 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t715 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t714]), @vectors.dist_pos_le()))
  let t713 = @simp.rewrite_tac(@list.List([angle_eq_0_dist()]))
  let t717 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t713), @tactics.ap_term_tac), @tactics.ap_term_tac), t715), t716), @calc_rat.real_arith_tac)
  angle_eq_0_dist_abs_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], (angle((A, B, C)) == real_of_num(0)) == (!(A == B) && !(C == B) && distance((A, C)) == abs(distance((A, B)) - distance((C, B))))"), t717))
}

///|
let angle_eq_0_dist_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_EQ_0_DIST_ABS")

///|
/// `ANGLE_EQ_0_DIST_ABS`
pub fn angle_eq_0_dist_abs() -> @kernel.Thm {
  angle_eq_0_dist_abs_c.get()
}

///|
/// CONGRUENT_TRIANGLES_SSS
fn step_92() -> Unit raise {
  let t735 = @tactics.conv_tac(@calc_rat.real_field)
  let t734 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist_eq_0()), @vectors.dist_sym()]))
  let t733 = @tactics.repeat_tac(@tactics.pop_assum(fn(x730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s731 = @tactics.mp_tac(x730)
    fn(x732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s731(x732)
    }
  }))
  let t727 = @term_syntax.parse_term("(C' : Cart[Real, N])")
  let t728 = @term_syntax.parse_term("(A' : Cart[Real, N])")
  let t729 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B' : Cart[Real, N])"), t728, t727]), law_of_cosines()))
  let t724 = @term_syntax.parse_term("(C : Cart[Real, M])")
  let t725 = @term_syntax.parse_term("(A : Cart[Real, M])")
  let t726 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, M])"), t725, t724]), law_of_cosines()))
  let t723 = @simp.once_rewrite_tac(@list.List([@equal.gsym(cos_angle_eq())]))
  let t722 = @simp.asm_simp_tac(@list.List([angle_refl_mid(), angle_refl()]))
  let t721 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@vectors.dist_eq_0()])))
  let t720 = @simp.asm_rewrite_tac(@list.List([]))
  let t718 = @term_syntax.parse_term("distance(((B' : Cart[Real, N]), (C' : Cart[Real, N]))) == real_of_num(0)")
  let t719 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("distance(((A' : Cart[Real, N]), (B' : Cart[Real, N]))) == real_of_num(0)"), t718]))
  let t736 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t719), t720), @tactics.strip_tac), t721), t722), t723), t726), t729), t733), t734), t735)
  congruent_triangles_sss_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, M], ∀ B : Cart[Real, M], ∀ C : Cart[Real, M], ∀ A' : Cart[Real, N], ∀ B' : Cart[Real, N], ∀ C' : Cart[Real, N], distance((A, B)) == distance((A', B')) && distance((B, C)) == distance((B', C')) && distance((C, A)) == distance((C', A')) → angle((A, B, C)) == angle((A', B', C'))"), t736))
}

///|
let congruent_triangles_sss_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_TRIANGLES_SSS")

///|
/// `CONGRUENT_TRIANGLES_SSS`
pub fn congruent_triangles_sss() -> @kernel.Thm {
  congruent_triangles_sss_c.get()
}

///|
/// CONGRUENT_TRIANGLES_SAS
fn step_93() -> Unit raise {
  let t749 = @meson.asm_meson_tac(@list.List([@vectors.dist_sym()]))
  let t748 = @tactics.repeat_tac(@tactics.binop_tac)
  let t747 = @tactics.repeat_tac(@tactics.disch_then(fn(x744 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s745 = @tactics.subst1_tac(x744)
    fn(x746 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s745(x746)
    }
  }))
  let t741 = @term_syntax.parse_term("(C' : Cart[Real, N])")
  let t742 = @term_syntax.parse_term("(A' : Cart[Real, N])")
  let t743 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B' : Cart[Real, N])"), t742, t741]), law_of_cosines()))
  let t738 = @term_syntax.parse_term("(C : Cart[Real, M])")
  let t739 = @term_syntax.parse_term("(A : Cart[Real, M])")
  let t740 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, M])"), t739, t738]), law_of_cosines()))
  let t737 = @simp.rewrite_tac(@list.List([@vectors.dist_eq()]))
  let t750 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t737), t740), t743), t747), t748), t749)
  congruent_triangles_sas_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, M], ∀ B : Cart[Real, M], ∀ C : Cart[Real, M], ∀ A' : Cart[Real, N], ∀ B' : Cart[Real, N], ∀ C' : Cart[Real, N], distance((A, B)) == distance((A', B')) && angle((A, B, C)) == angle((A', B', C')) && distance((B, C)) == distance((B', C')) → distance((A, C)) == distance((A', C'))"), t750))
}

///|
let congruent_triangles_sas_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_TRIANGLES_SAS")

///|
/// `CONGRUENT_TRIANGLES_SAS`
pub fn congruent_triangles_sas() -> @kernel.Thm {
  congruent_triangles_sas_c.get()
}

///|
/// CONGRUENT_TRIANGLES_AAS
fn step_94() -> Unit raise {
  let t790 = @meson.asm_meson_tac(@list.List([congruent_triangles_sas(), @vectors.dist_sym(), angle_sym()]))
  let t787 = @tactics.conv_tac(@calc_rat.real_field)
  let t786 = @simp.rewrite_tac(@list.List([angle_sym(), @vectors.dist_sym()]))
  let t785 = @simp.asm_rewrite_tac(@list.List([]))
  let t784 = @simp.once_rewrite_tac(@list.List([angle_sym(), @vectors.dist_sym()]))
  let t788 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t784), t785), t786), t787)
  let t789 = @list.List([@meson.asm_meson_tac(@list.List([collinear_sin_angle_imp(), @sets.insert_ac()])), t788])
  let t783 = @tactics.subgoal_then(@term_syntax.parse_term("!(sin(angle(((B' : Cart[Real, N]), (C' : Cart[Real, N]), (A' : Cart[Real, N])))) == real_of_num(0))"), fn(x780 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s781 = @tactics.mp_tac(x780)
    fn(x782 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s781(x782)
    }
  })
  let t777 = @term_syntax.parse_term("(A' : Cart[Real, N])")
  let t778 = @term_syntax.parse_term("(B' : Cart[Real, N])")
  let t779 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(C' : Cart[Real, N])"), t778, t777]), law_of_sines()))
  let t775 = @term_syntax.parse_term("(A : Cart[Real, M])")
  let t776 = @term_syntax.parse_term("(B : Cart[Real, M])")
  let t791 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(C : Cart[Real, M])"), t776, t775]), law_of_sines())), t779), t783), t789), t790])
  let t774 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t772 = @simp.rewrite_tac(@list.List([angle_sym()]))
  let t771 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t768 = @term_syntax.parse_term("(C' : Cart[Real, N])")
  let t769 = @term_syntax.parse_term("(B' : Cart[Real, N])")
  let t770 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A' : Cart[Real, N])"), t769, t768]), triangle_angle_sum()))
  let t766 = @term_syntax.parse_term("(C : Cart[Real, M])")
  let t767 = @term_syntax.parse_term("(B : Cart[Real, M])")
  let t773 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, M])"), t767, t766]), triangle_angle_sum())), t770), t771), t772), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t765 = @tactics.subgoal_then(@term_syntax.parse_term("angle(((C : Cart[Real, M]), (A : Cart[Real, M]), (B : Cart[Real, M]))) == angle(((C' : Cart[Real, N]), (A' : Cart[Real, N]), (B' : Cart[Real, N])))"), fn(x762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s763 = @tactics.assume_tac(x762)
    fn(x764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s763(x764)
    }
  })
  let t761 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.dist_eq_0()])), @tactics.all_tac])
  let t760 = @tactics.subgoal_then(@term_syntax.parse_term("!((A' : Cart[Real, N]) == (B' : Cart[Real, N]))"), fn(x757 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s758 = @tactics.assume_tac(x757)
    fn(x759 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s758(x759)
    }
  })
  let t755 = @simp.rewrite_tac(@list.List([@sets.insert_ac(), @vectors.collinear_2()]))
  let t756 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s753 = @tactics.subst_all_tac(x752)
    fn(x754 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s753(x754)
    }
  }), t755), @tactics.all_tac])
  let t751 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, M]) == (B : Cart[Real, M])"))
  let t792 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t751), t756), @tactics.disch_tac), t760), t761), t765), t773), t774), @tactics.conj_tac), t791)
  congruent_triangles_aas_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, M], ∀ B : Cart[Real, M], ∀ C : Cart[Real, M], ∀ A' : Cart[Real, N], ∀ B' : Cart[Real, N], ∀ C' : Cart[Real, N], angle((A, B, C)) == angle((A', B', C')) && angle((B, C, A)) == angle((B', C', A')) && distance((A, B)) == distance((A', B')) && !collinear({A, B, C}) → distance((A, C)) == distance((A', C')) && distance((B, C)) == distance((B', C'))"), t792))
}

///|
let congruent_triangles_aas_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_TRIANGLES_AAS")

///|
/// `CONGRUENT_TRIANGLES_AAS`
pub fn congruent_triangles_aas() -> @kernel.Thm {
  congruent_triangles_aas_c.get()
}

///|
/// CONGRUENT_TRIANGLES_ASA
fn step_95() -> Unit raise {
  let t818 = @meson.asm_meson_tac(@list.List([congruent_triangles_aas(), @vectors.dist_sym(), angle_sym()]))
  let t815 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + ((b : Real) + (x : Real)) == pi && a + (b + (y : Real)) == pi → x == y")))
  let t817 = @tactics.disch_then(fn(x816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x812 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s813 = @tactics.mp_tac(x812)
      fn(x814 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s813(x814)
      }
    })(t815(x816))
  })
  let t811 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t808 = @term_syntax.parse_term("(C' : Cart[Real, N])")
  let t809 = @term_syntax.parse_term("(B' : Cart[Real, N])")
  let t810 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A' : Cart[Real, N])"), t809, t808]), triangle_angle_sum()))
  let t805 = @term_syntax.parse_term("(C : Cart[Real, M])")
  let t806 = @term_syntax.parse_term("(B : Cart[Real, M])")
  let t807 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, M])"), t806, t805]), triangle_angle_sum()))
  let t804 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.dist_eq_0()])), @tactics.all_tac])
  let t803 = @tactics.subgoal_then(@term_syntax.parse_term("!((A' : Cart[Real, N]) == (B' : Cart[Real, N]))"), fn(x800 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s801 = @tactics.assume_tac(x800)
    fn(x802 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s801(x802)
    }
  })
  let t799 = @tactics.repeat_tac(@tactics.strip_tac)
  let t797 = @simp.rewrite_tac(@list.List([@sets.insert_ac(), @vectors.collinear_2()]))
  let t798 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s795 = @tactics.subst_all_tac(x794)
    fn(x796 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s795(x796)
    }
  }), t797), @tactics.all_tac])
  let t793 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, M]) == (B : Cart[Real, M])"))
  let t819 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t793), t798), t799), t803), t804), t807), t810), t811), t817), t818)
  congruent_triangles_asa_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, M], ∀ B : Cart[Real, M], ∀ C : Cart[Real, M], ∀ A' : Cart[Real, N], ∀ B' : Cart[Real, N], ∀ C' : Cart[Real, N], angle((A, B, C)) == angle((A', B', C')) && distance((A, B)) == distance((A', B')) && angle((B, A, C)) == angle((B', A', C')) && !collinear({A, B, C}) → distance((A, C)) == distance((A', C'))"), t819))
}

///|
let congruent_triangles_asa_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_TRIANGLES_ASA")

///|
/// `CONGRUENT_TRIANGLES_ASA`
pub fn congruent_triangles_asa() -> @kernel.Thm {
  congruent_triangles_asa_c.get()
}

///|
/// CONGRUENT_TRIANGLES_SSS_FULL
fn step_96() -> Unit raise {
  let t820 = @meson.meson_tac(@list.List([congruent_triangles_sss(), @vectors.dist_sym(), angle_sym()]))
  congruent_triangles_sss_full_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, M], ∀ B : Cart[Real, M], ∀ C : Cart[Real, M], ∀ A' : Cart[Real, N], ∀ B' : Cart[Real, N], ∀ C' : Cart[Real, N], distance((A, B)) == distance((A', B')) && distance((B, C)) == distance((B', C')) && distance((C, A)) == distance((C', A')) → distance((A, B)) == distance((A', B')) && distance((B, C)) == distance((B', C')) && distance((C, A)) == distance((C', A')) && angle((A, B, C)) == angle((A', B', C')) && angle((B, C, A)) == angle((B', C', A')) && angle((C, A, B)) == angle((C', A', B'))"), t820))
}

///|
let congruent_triangles_sss_full_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_TRIANGLES_SSS_FULL")

///|
/// `CONGRUENT_TRIANGLES_SSS_FULL`
pub fn congruent_triangles_sss_full() -> @kernel.Thm {
  congruent_triangles_sss_full_c.get()
}

///|
/// CONGRUENT_TRIANGLES_SAS_FULL
fn step_97() -> Unit raise {
  let t821 = @meson.meson_tac(@list.List([congruent_triangles_sss(), @vectors.dist_sym(), angle_sym(), congruent_triangles_sas()]))
  congruent_triangles_sas_full_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, M], ∀ B : Cart[Real, M], ∀ C : Cart[Real, M], ∀ A' : Cart[Real, N], ∀ B' : Cart[Real, N], ∀ C' : Cart[Real, N], distance((A, B)) == distance((A', B')) && angle((A, B, C)) == angle((A', B', C')) && distance((B, C)) == distance((B', C')) → distance((A, B)) == distance((A', B')) && distance((B, C)) == distance((B', C')) && distance((C, A)) == distance((C', A')) && angle((A, B, C)) == angle((A', B', C')) && angle((B, C, A)) == angle((B', C', A')) && angle((C, A, B)) == angle((C', A', B'))"), t821))
}

///|
let congruent_triangles_sas_full_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_TRIANGLES_SAS_FULL")

///|
/// `CONGRUENT_TRIANGLES_SAS_FULL`
pub fn congruent_triangles_sas_full() -> @kernel.Thm {
  congruent_triangles_sas_full_c.get()
}

///|
/// CONGRUENT_TRIANGLES_AAS_FULL
fn step_98() -> Unit raise {
  let t822 = @meson.meson_tac(@list.List([congruent_triangles_sss(), @vectors.dist_sym(), angle_sym(), congruent_triangles_aas()]))
  congruent_triangles_aas_full_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, M], ∀ B : Cart[Real, M], ∀ C : Cart[Real, M], ∀ A' : Cart[Real, N], ∀ B' : Cart[Real, N], ∀ C' : Cart[Real, N], angle((A, B, C)) == angle((A', B', C')) && angle((B, C, A)) == angle((B', C', A')) && distance((A, B)) == distance((A', B')) && !collinear({A, B, C}) → distance((A, B)) == distance((A', B')) && distance((B, C)) == distance((B', C')) && distance((C, A)) == distance((C', A')) && angle((A, B, C)) == angle((A', B', C')) && angle((B, C, A)) == angle((B', C', A')) && angle((C, A, B)) == angle((C', A', B'))"), t822))
}

///|
let congruent_triangles_aas_full_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_TRIANGLES_AAS_FULL")

///|
/// `CONGRUENT_TRIANGLES_AAS_FULL`
pub fn congruent_triangles_aas_full() -> @kernel.Thm {
  congruent_triangles_aas_full_c.get()
}

///|
/// CONGRUENT_TRIANGLES_ASA_FULL
fn step_99() -> Unit raise {
  let t823 = @meson.meson_tac(@list.List([congruent_triangles_asa(), congruent_triangles_sas_full(), @vectors.dist_sym(), angle_sym()]))
  congruent_triangles_asa_full_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, M], ∀ B : Cart[Real, M], ∀ C : Cart[Real, M], ∀ A' : Cart[Real, N], ∀ B' : Cart[Real, N], ∀ C' : Cart[Real, N], angle((A, B, C)) == angle((A', B', C')) && distance((A, B)) == distance((A', B')) && angle((B, A, C)) == angle((B', A', C')) && !collinear({A, B, C}) → distance((A, B)) == distance((A', B')) && distance((B, C)) == distance((B', C')) && distance((C, A)) == distance((C', A')) && angle((A, B, C)) == angle((A', B', C')) && angle((B, C, A)) == angle((B', C', A')) && angle((C, A, B)) == angle((C', A', B'))"), t823))
}

///|
let congruent_triangles_asa_full_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_TRIANGLES_ASA_FULL")

///|
/// `CONGRUENT_TRIANGLES_ASA_FULL`
pub fn congruent_triangles_asa_full() -> @kernel.Thm {
  congruent_triangles_asa_full_c.get()
}

///|
/// ANGLE_BETWEEN
fn step_100() -> Unit raise {
  let t825 = @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
  let t824 = @simp.rewrite_tac(@list.List([@vectors.between(), angle_eq_pi_dist()]))
  let t826 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t824), t825)
  angle_between_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ x : Cart[Real, _], (angle((a, x, b)) == pi) == (!(x == a) && !(x == b) && between(x, (a, b)))"), t826))
}

///|
let angle_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_BETWEEN")

///|
/// `ANGLE_BETWEEN`
pub fn angle_between() -> @kernel.Thm {
  angle_between_c.get()
}

///|
/// BETWEEN_ANGLE
fn step_101() -> Unit raise {
  let t828 = @meson.meson_tac(@list.List([@vectors.between_refl()]))
  let t827 = @simp.rewrite_tac(@list.List([angle_between()]))
  let t829 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t827), t828)
  between_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ x : Cart[Real, _], between(x, (a, b)) == (x == a || x == b || angle((a, x, b)) == pi)"), t829))
}

///|
let between_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BETWEEN_ANGLE")

///|
/// `BETWEEN_ANGLE`
pub fn between_angle() -> @kernel.Thm {
  between_angle_c.get()
}

///|
/// ANGLES_ALONG_LINE
fn step_102() -> Unit raise {
  let t834 = @drule.match_mp(angle_eq_pi_left())
  let t836 = @tactics.disch_then(fn(x835 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x831 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s832 = @tactics.subst1_tac(x831)
      fn(x833 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s832(x833)
      }
    })(t834(x835))
  })
  let t830 = @simp.rewrite_tac(@list.List([@equal.gsym(angle_between())]))
  let t837 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t830), t836), @calc_rat.real_arith_tac)
  angles_along_line_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], ∀ D : Cart[Real, N], !(C == A) && !(C == B) && between(C, (A, B)) → angle((A, C, D)) + angle((B, C, D)) == pi"), t837))
}

///|
let angles_along_line_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLES_ALONG_LINE")

///|
/// `ANGLES_ALONG_LINE`
pub fn angles_along_line() -> @kernel.Thm {
  angles_along_line_c.get()
}

///|
/// ANGLES_ADD_BETWEEN
fn step_103() -> Unit raise {
  let t873 = @meson.asm_meson_tac(@list.List([angle_eq_pi_others(), between_angle()]))
  let t872 = @tactics.match_mp_tac(angle_eq_0_right())
  let t871 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([angle_sym()])), @calc_rat.real_arith_tac)])
  let t869 = @tactics.conjuncts_then(fn(x866 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s867 = @tactics.subst1_tac(x866)
    fn(x868 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s867(x868)
    }
  })
  let t870 = @tactics.subgoal_then(@term_syntax.parse_term("angle(((C : Cart[Real, N]), (A : Cart[Real, N]), (D : Cart[Real, N]))) == angle(((B : Cart[Real, N]), A, D)) && angle((A, B, D)) == angle((C, B, D))"), t869)
  let t865 = @simp.asm_rewrite_tac(@list.List([]))
  let t862 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t863 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t864 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, N])"), t863, t862]), triangle_angle_sum()))
  let t859 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t860 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t861 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t860, t859]), triangle_angle_sum()))
  let t856 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t857 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t858 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t857, t856]), triangle_angle_sum()))
  let t852 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t853 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t854 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t855 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t854, t853, t852]), angles_along_line()))
  let t851 = @simp.asm_simp_tac(@list.List([angle_refl_mid(), @calc_int.real_add_rid()]))
  let t850 = @class.asm_cases_tac(@term_syntax.parse_term("(C : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t849 = @simp.asm_simp_tac(@list.List([angle_refl_mid(), @realax.real_add_lid()]))
  let t848 = @class.asm_cases_tac(@term_syntax.parse_term("(C : Cart[Real, N]) == (A : Cart[Real, N])"))
  let t846 = @simp.asm_simp_tac(@list.List([angle_refl_mid(), @realax.real_add_lid()]))
  let t845 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x839 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s840 = @tactics.assume_tac(x839)
    fn(x841 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s840(x841)
    }
  }, fn(x842 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s843 = @tactics.mp_tac(x842)
    fn(x844 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s843(x844)
    }
  }))
  let t847 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@vectors.between_refl_eq()])), t845), t846), @tactics.all_tac])
  let t838 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t874 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t838), t847), t848), t849), t850), t851), @tactics.strip_tac), t855), t858), t861), t864), t865), t870), t871), @tactics.conj_tac), t872), t873)
  angles_add_between_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], ∀ D : Cart[Real, N], between(C, (A, B)) && !(D == A) && !(D == B) → angle((A, D, C)) + angle((C, D, B)) == angle((A, D, B))"), t874))
}

///|
let angles_add_between_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLES_ADD_BETWEEN")

///|
/// `ANGLES_ADD_BETWEEN`
pub fn angles_add_between() -> @kernel.Thm {
  angles_add_between_c.get()
}

///|
/// SETDIST_POINT_LINE
fn step_104() -> Unit raise {
  let t915 = @simp.simp_tac(@list.List([orthogonal_vector_angle(), @transcendentals.sin_pi2()]))
  let t914 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_sub_rzero()]))
  let t913 = @simp.rewrite_tac(@list.List([angle(), @vectors.vector_sub_rzero(), sin_vector_angle_lmul()]))
  let t912 = @simp.asm_simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert(), @convex.affine_affine_hull(), @convex.affine_hull_eq_empty(), @sets.not_insert_empty()]))
  let t909 = @term_syntax.parse_term("(z : Cart[Real, N])")
  let t910 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t911 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("hull(affine, {vec(0), (z : Cart[Real, N])})"), t910, t909]), @convex.closest_point_affine_orthogonal()))
  let t907 = @term_syntax.parse_term("(a : Real)")
  let t908 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(b : Real)"), t907]))
  let t906 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_add_lid()]))
  let t905 = @simp.simp_tac(@list.List([@convex.affine_hull_2(), @sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t904 = @simp.asm_simp_tac(@list.List([@convex.closed_affine_hull(), @convex.affine_hull_eq_empty(), @sets.not_insert_empty()]))
  let t902 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t903 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("hull(affine, {vec(0), (z : Cart[Real, N])})"), t902]), @topology.closest_point_in_set()))
  let t901 = @simp.gen_rewrite_tac(fn(x900 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x894 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s895 = @equal.rand_conv(x894)
      fn(x896 : @kernel.Term) -> @kernel.Thm raise {
        s895(x896)
      }
    })((fn(x897 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s898 = @equal.rand_conv(x897)
      fn(x899 : @kernel.Term) -> @kernel.Thm raise {
        s898(x899)
      }
    })(x900))
  }, @list.List([angle_sym()]))
  let t893 = @simp.rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t892 = @tactics.disch_then(fn(x891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x888 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s889 = @tactics.subst1_tac(x888)
      fn(x890 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s889(x890)
      }
    })(@equal.sym(x891))
  })
  let t887 = @tactics.disch_then(fn(x886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t885 = @simp.asm_simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert(), @convex.affine_affine_hull(), @convex.affine_hull_eq_empty(), @sets.not_insert_empty()]))
  let t882 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, N])(0)")
  let t883 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t884 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("hull(affine, {vec(0), (z : Cart[Real, N])})"), t883, t882]), @convex.closest_point_affine_orthogonal()))
  let t879 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t880 = @term_syntax.parse_term("(y : Cart[Real, N])")
  let t881 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(vec : (Num) -> Cart[Real, N])(0)"), t880, t879]), sin_opposite_hypotenuse()))
  let t878 = @simp.abbrev_tac(@term_syntax.parse_term("(y : Cart[Real, N]) == closest_point(hull(affine, {vec(0), (z : Cart[Real, N])}), (x : Cart[Real, N]))"))
  let t877 = @simp.simp_tac(@list.List([@topology.setdist_closest_point(), @convex.closed_affine_hull(), @convex.affine_hull_eq_empty(), @sets.not_insert_empty()]))
  let t876 = @tactics.repeat_tac(@tactics.gen_tac)
  let t875 = @determinants.geom_origin_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t916 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t875), t876), t877), t878), t881), t884), t885), t887), t892), t893), @tactics.ap_term_tac), t901), t903), t904), t905), t906), t908), @tactics.strip_tac), t911), t912), t913), @class.cond_cases_tac), t914), t915)
  setdist_point_line_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], ∀ z : Cart[Real, N], setdist(({x}, hull(affine, {y, z}))) == distance((x, y)) * sin(angle((x, y, z)))"), t916))
}

///|
let setdist_point_line_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETDIST_POINT_LINE")

///|
/// `SETDIST_POINT_LINE`
pub fn setdist_point_line() -> @kernel.Thm {
  setdist_point_line_c.get()
}

///|
/// AREA_TRIANGLE_SIN
fn step_105() -> Unit raise {
  let t930 = @tactics.conv_tac(@calc_rat.real_ring)
  let t929 = @simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.dot_2()]))
  let t928 = @simp.asm_simp_tac(@list.List([@vectors.norm_eq_0(), @calc_rat.real_field(@term_syntax.parse_term("!((b : Real) == real_of_num(0)) && !((c : Real) == real_of_num(0)) → pow(b, 2) * (pow(c, 2) * (real_of_num(1) - pow((d : Real) / (b * c), 2))) == pow(b, 2) * pow(c, 2) - pow(d, 2)"))]))
  let t927 = @simp.asm_rewrite_tac(@list.List([@real.real_pow_mul(), sin_squared_vector_angle()]))
  let t926 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vec_component(), @vectors.norm_0()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t925 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Cart[Real, 2]) == vec(0)"))
  let t924 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vec_component(), @vectors.norm_0()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t923 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Cart[Real, 2]) == vec(0)"))
  let t922 = @simp.rewrite_tac(@list.List([@real.real_eq_square_abs()]))
  let t921 = @simp.simp_tac(@list.List([@realax.real_le_mul(), @vectors.norm_pos_le(), sin_vector_angle_pos()]))
  let t920 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && abs((x : Real)) == abs(y) → abs(x) / real_of_num(2) == y / real_of_num(2)")))
  let t919 = @tactics.repeat_tac(@tactics.gen_tac)
  let t918 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_rzero(), @vectors.vec_component(), @real.real_sub_rzero(), @vectors.dist_0()]))
  let t917 = @simp.rewrite_tac(@list.List([@measure.measure_triangle(), angle()]))
  let t931 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@determinants.geom_origin_tac(@term_syntax.parse_term("(a : Cart[Real, 2])")), t917), t918), t919), t920), t921), t922), t923), t924), t925), t926), t927), t928), t929), t930)
  area_triangle_sin_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], measure(hull(convex, {a, b, c})) == distance((a, b)) * (distance((a, c)) * sin(angle((b, a, c)))) / real_of_num(2)"), t931))
}

///|
let area_triangle_sin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AREA_TRIANGLE_SIN")

///|
/// `AREA_TRIANGLE_SIN`
pub fn area_triangle_sin() -> @kernel.Thm {
  area_triangle_sin_c.get()
}

///|
/// ANGLE_TRIANGLE_LAW
fn step_106() -> Unit raise {
  let t934 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square()]))
  let t933 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @calc_int.real_mul_rzero(), @realax.real_add_lid()]))
  let t932 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow((x2 : Real) * (x1 : Real) - (x2 * x1 + ((y2 : Real) * (y1 : Real) + (z2 : Real) * (z1 : Real))), 2) <= (real_of_num(1) - pow(x2, 2)) * (real_of_num(1) - pow(x1, 2))) == (real_of_num(0) <= -(pow(y1, 2) + pow(z1, 2)) * (x2 * x2 + (y2 * y2 + z2 * z2) - real_of_num(1)) + ((pow(x2, 2) - real_of_num(1)) * (x1 * x1 + (y1 * y1 + z1 * z1) - real_of_num(1)) + pow(y2 * z1 - y1 * z2, 2)))"))]))
  let t935 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t932), t933), t934)
  let lemma0 = @tactics.prove(@term_syntax.parse_term("(x1 : Real) * x1 + ((y1 : Real) * y1 + (z1 : Real) * z1) == real_of_num(1) && (x2 : Real) * x2 + ((y2 : Real) * y2 + (z2 : Real) * z2) == real_of_num(1) → pow(x2 * x1 - (x2 * x1 + (y2 * y1 + z2 * z1)), 2) <= (real_of_num(1) - pow(x2, 2)) * (real_of_num(1) - pow(x1, 2))"), t935)
  let t998 = @simp.simp_tac(@list.List([lemma0]))
  let t997 = @simp.rewrite_tac(@list.List([@vectors.dot_3(), @vectors.vector_3()]))
  let t996 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @real.real_div_1()]))
  let t995 = @simp.simp_tac(@list.List([@vectors.dot_basis(), @cart.dimindex_ge_1(), @arith.le_refl(), @vectors.norm_basis()]))
  let t994 = @simp.rewrite_tac(@list.List([@vectors.forall_vector_3()]))
  let t993 = @tactics.pop_assum_list(fn(x992 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t990 = @term_syntax.parse_term("(w : Cart[Real, 3])")
  let t991 = @tactics.map_every(fn(x988 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x988
    @tactics.spec_tac(t, t)
  }, @list.List([@term_syntax.parse_term("(u : Cart[Real, 3])"), t990]))
  let t985 = @simp.gen_rewrite_rule(fn(x984 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x984
  }, @list.List([@vectors.norm_eq_1()]))
  let t987 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x986 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x981 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s982 = @tactics.mp_tac(x981)
      fn(x983 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s982(x983)
      }
    })(t985(x986))
  }))
  let t980 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_sub_rzero(), @realax.real_mul_lid(), @real.real_div_1()]))
  let t979 = @simp.asm_rewrite_tac(@list.List([@real.real_pow_mul(), sin_squared_vector_angle()]))
  let t978 = @simp.asm_simp_tac(@list.List([sin_vector_angle_pos(), @realax.real_le_mul(), @real.real_le_square_abs()]))
  let t977 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (z : Real)) <= abs((y : Real)) && real_of_num(0) <= y → x - y <= z")))
  let t976 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @real.real_div_1()]))
  let t975 = @simp.asm_simp_tac(@list.List([@transcendentals.cos_add(), cos_vector_angle(), @vectors.vector_sub_rzero()]))
  let t974 = @tactics.disch_then(fn(x973 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x970 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s971 = @tactics.subst1_tac(x970)
      fn(x972 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s971(x972)
      }
    })(@equal.sym(x973))
  })
  let t969 = @simp.asm_rewrite_tac(@list.List([vector_angle_range()]))
  let t964 = @drule.part_match(fn(x963 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x963))
  }, @transcendentals.cos_mono_le_eq())
  let t959 = @simp.rewrite_tac(@list.List([vector_angle_range()]))
  let t958 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= pi && real_of_num(0) <= (y : Real) && y <= pi && real_of_num(0) <= (z : Real) && z <= pi && (real_of_num(0) <= y + z && y + z <= pi → x <= y + z) → x <= y + z")))
  let t957 = @tactics.repeat_tac(@tactics.strip_tac)
  let t956 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_0(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t954 = @term_syntax.parse_term("(w : Cart[Real, 3]) == vec(0)")
  let t955 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(u : Cart[Real, 3]) == vec(0)"), t954]))
  let t953 = @list.List([@simp.asm_simp_tac(@list.List([@vectors.basis_nonzero(), @cart.dimindex_ge_1(), @arith.le_refl()])), @tactics.all_tac])
  let t952 = @tactics.subgoal_then(@term_syntax.parse_term("!((basis : (Num) -> Cart[Real, 3])(1) == (vec : (Num) -> Cart[Real, 3])(0))"), fn(x949 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s950 = @tactics.assume_tac(x949)
    fn(x951 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s950(x951)
    }
  })
  let t948 = @tactics.repeat_tac(@tactics.gen_tac)
  let t947 = @tactics.pop_assum(fn(x946 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t945 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lid()]))
  let t944 = @class.asm_cases_tac(@term_syntax.parse_term("(vb : Real) == real_of_num(1)"))
  let t943 = @tactics.disch_then(fn(x942 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t941 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (vb : Real) → (abs(vb) * real_of_num(1) == real_of_num(1)) == (vb == real_of_num(1))"))]))
  let t940 = @simp.simp_tac(@list.List([@vectors.norm_mul(), @vectors.norm_basis(), @cart.dimindex_ge_1(), @arith.le_refl()]))
  let t939 = @tactics.x_gen_tac(@term_syntax.parse_term("(vb : Real)"))
  let t937 = @term_syntax.parse_term("(v : Cart[Real, 3])")
  let t936 = @simp.rewrite_tac(@list.List([angle(), @vectors.vector_sub_rzero()]))
  let t999 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@determinants.geom_origin_tac(@term_syntax.parse_term("(p : Cart[Real, 3])")), t936), (x938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_basis_multiple_tac(1L, t937, x938)), t939), t940), t941), t943), t944), t945), t947), t948), t952), t953), t955), t956), t957), t958), t959), @tactics.strip_tac), fn(x968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x967 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x965 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x960 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s961 = @tactics.mp_tac(x960)
          fn(x962 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s961(x962)
          }
        })(t964(x965))
      })((fn(x966 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x966.1
      })(x967))
    })(x968)(x968)
  }), t969), t974), t975), t976), t977), t978), t979), t980), t987), t991), t993), t994), t995), t996), t997), t998)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 3], ∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], ∀ w : Cart[Real, 3], norm(u - p) == real_of_num(1) && norm(v - p) == real_of_num(1) && norm(w - p) == real_of_num(1) → angle((u, p, w)) <= angle((u, p, v)) + angle((v, p, w))"), t999)
  let t1020 = @simp.asm_rewrite_tac(@list.List([@real.real_inv_eq_0(), @vectors.norm_eq_0(), @real.real_le_inv_eq(), @vectors.norm_pos_le()]))
  let t1019 = @simp.asm_rewrite_tac(@list.List([vector_angle_lmul(), vector_angle_rmul()]))
  let t1018 = @simp.asm_simp_tac(@list.List([@real.real_abs_inv(), @vectors.real_abs_norm(), @realax.real_mul_linv(), @vectors.norm_eq_0()]))
  let t1017 = @simp.asm_simp_tac(@list.List([angle(), @vectors.vector_sub_rzero(), @vectors.norm_mul()]))
  let t1013 = @term_syntax.parse_term("op_pct(inv(norm((w : Cart[Real, 3]))), w)")
  let t1014 = @term_syntax.parse_term("op_pct(inv(norm((v : Cart[Real, 3]))), v)")
  let t1015 = @term_syntax.parse_term("op_pct(inv(norm((u : Cart[Real, 3]))), u)")
  let t1016 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(vec : (Num) -> Cart[Real, 3])(0)"), t1015, t1014, t1013]), lemma1))
  let t1011 = @simp.asm_rewrite_tac(@list.List([vector_angle(), @vectors.vector_sub_rzero()]))
  let t1010 = @simp.rewrite_tac(@list.List([angle(), vector_angle_range()]))
  let t1012 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == pi / real_of_num(2) && real_of_num(0) <= (y : Real) && (z : Real) == pi / real_of_num(2) → x <= y + z"))), t1010), t1011), @tactics.all_tac])
  let t1009 = @class.asm_cases_tac(@term_syntax.parse_term("(w : Cart[Real, 3]) == vec(0)"))
  let t1007 = @simp.asm_rewrite_tac(@list.List([vector_angle(), @vectors.vector_sub_rzero()]))
  let t1006 = @simp.rewrite_tac(@list.List([angle(), vector_angle_range()]))
  let t1008 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= pi && (y : Real) == pi / real_of_num(2) && (z : Real) == pi / real_of_num(2) → x <= y + z"))), t1006), t1007), @tactics.all_tac])
  let t1005 = @class.asm_cases_tac(@term_syntax.parse_term("(v : Cart[Real, 3]) == vec(0)"))
  let t1003 = @simp.asm_rewrite_tac(@list.List([vector_angle(), @vectors.vector_sub_rzero()]))
  let t1002 = @simp.rewrite_tac(@list.List([angle(), vector_angle_range()]))
  let t1004 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == pi / real_of_num(2) && (y : Real) == pi / real_of_num(2) && real_of_num(0) <= (z : Real) → x <= y + z"))), t1002), t1003), @tactics.all_tac])
  let t1001 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Cart[Real, 3]) == vec(0)"))
  let t1000 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1021 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@determinants.geom_origin_tac(@term_syntax.parse_term("(p : Cart[Real, 3])")), t1000), t1001), t1004), t1005), t1008), t1009), t1012), t1016), t1017), t1018), t1019), t1020)
  let lemma2 = @tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 3], ∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], ∀ w : Cart[Real, 3], angle((u, p, w)) <= angle((u, p, v)) + angle((v, p, w))"), t1021)
  let t1068 = @simp.rewrite_tac(@list.List([lemma2]))
  let t1067 = @tactics.disch_then(fn(x1065 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1065
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1064 = @simp.asm_rewrite_tac(@list.List([]))
  let t1062 = @vectors.invariant_under_linear().val
  let t1060 = @term_syntax.parse_term("(f : (Cart[Real, 3]) -> Cart[Real, N])")
  let t1063 = @tactics.mp_tac(@lib.end_itlist(@bool.conj, @lib.mapfilter((x1061 : @kernel.Thm) => @bool.ispec(t1060, x1061), t1062)))
  let t1059 = @simp.asm_rewrite_tac(@list.List([]))
  let t1058 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @sets.in_image(), @sets.in_univ()]))
  let t1057 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset(), @vectors.span_inc()])), @tactics.all_tac])
  let t1056 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET({(u : Cart[Real, N]), (v : Cart[Real, N]), (w : Cart[Real, N])}, IMAGE((f : (Cart[Real, 3]) -> Cart[Real, N]), UNIV))"), fn(x1053 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1054 = @tactics.mp_tac(x1053)
    fn(x1055 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1054(x1055)
    }
  })
  let t1050 = @drule.match_mp(@vectors.linear_0())
  let t1052 = @tactics.first_assum(fn(x1051 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1049 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1046 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1047 = @tactics.subst1_tac(x1046)
        fn(x1048 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1047(x1048)
        }
      })(@equal.sym(x1049))
    })(t1050(x1051))
  })
  let t1045 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Cart[Real, N])"))(@tactics.strip_assume_tac))
  let t1042 = @drule.match_mp(@vectors.isometry_univ_superset_subspace())
  let t1044 = @tactics.disch_then(fn(x1043 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1039 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1040 = @tactics.mp_tac(x1039)
      fn(x1041 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1040(x1041)
      }
    })(t1042(x1043))
  })
  let t1037 = @simp.simp_tac(@list.List([@cart.dimindex_3(), @sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()]))
  let t1036 = @simp.simp_tac(@list.List([@vectors.dim_le_card(), @sets.finite_insert(), @sets.finite_empty()]))
  let t1035 = @tactics.exists_tac(@term_syntax.parse_term("CARD({(u : Cart[Real, N]), (v : Cart[Real, N]), (w : Cart[Real, N])})"))
  let t1034 = @tactics.match_mp_tac(@arith.le_trans())
  let t1038 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.subspace_span(), @vectors.dim_span()])), t1034), t1035), t1036), t1037), @int.arith_tac), @tactics.all_tac])
  let t1033 = @tactics.subgoal_then(@term_syntax.parse_term("(subspace : ((Cart[Real, N]) -> Bool) -> Bool)((span : ((Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)({(u : Cart[Real, N]), (v : Cart[Real, N]), (w : Cart[Real, N])})) && (dim : ((Cart[Real, N]) -> Bool) -> Num)((span : ((Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)({u, v, w})) <= (dimindex : ((3) -> Bool) -> Num)((UNIV : (3) -> Bool)) && (dimindex : ((3) -> Bool) -> Num)((UNIV : (3) -> Bool)) <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), fn(x1030 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1031 = @tactics.mp_tac(x1030)
    fn(x1032 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1031(x1032)
    }
  })
  let t1029 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1028 = @determinants.geom_origin_tac(@term_syntax.parse_term("(p : Cart[Real, N])"))
  let t1027 = @list.List([@tactics.all_tac, @tactics.first_assum(fn(x1026 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1022 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1023 = @tactics.accept_tac(x1022)
      fn(x1024 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1023(x1024)
      }
    })((fn(x1025 : @kernel.Thm) -> @kernel.Thm raise {
      @determinants.geom_drop_dimension_rule(x1025)(lemma2)
    })(x1026))
  })])
  let t1069 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("(dimindex : ((3) -> Bool) -> Num)((UNIV : (3) -> Bool)) <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) || (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) <= (dimindex : ((3) -> Bool) -> Num)((UNIV : (3) -> Bool))"))), t1027), t1028), t1029), t1033), t1038), t1044), t1045), t1052), t1056), t1057), t1058), @tactics.strip_tac), t1059), t1063), t1064), t1067), t1068)
  angle_triangle_law_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, N], ∀ u : Cart[Real, N], ∀ v : Cart[Real, N], ∀ w : Cart[Real, N], angle((u, p, w)) <= angle((u, p, v)) + angle((v, p, w))"), t1069))
}

///|
let angle_triangle_law_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGLE_TRIANGLE_LAW")

///|
/// `ANGLE_TRIANGLE_LAW`
pub fn angle_triangle_law() -> @kernel.Thm {
  angle_triangle_law_c.get()
}

///|
/// VECTOR_ANGLE_TRIANGLE_LAW
fn step_107() -> Unit raise {
  let t1070 = @simp.rewrite_tac(@list.List([vector_angle_angle(), angle_triangle_law()]))
  vector_angle_triangle_law_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, N], ∀ v : Cart[Real, N], ∀ w : Cart[Real, N], vector_angle(u, w) <= vector_angle(u, v) + vector_angle(v, w)"), t1070))
}

///|
let vector_angle_triangle_law_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_ANGLE_TRIANGLE_LAW")

///|
/// `VECTOR_ANGLE_TRIANGLE_LAW`
pub fn vector_angle_triangle_law() -> @kernel.Thm {
  vector_angle_triangle_law_c.get()
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
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
}
