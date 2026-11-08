// Translated from upstream 100/morley.ml; edit this file directly.

///|
/// reflect2d
fn step_1() -> Unit raise {
  reflect2d_c.set(@pair.new_definition(@term_syntax.parse_term("(reflect2d : (Real, Cart[Real, 2]) -> Cart[Real, 2])((t : Real)) == o(rotate2d(t), o(cnj, rotate2d(-t)))")))
}

///|
let reflect2d_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reflect2d")

///|
/// `reflect2d`
pub fn reflect2d() -> @kernel.Thm {
  reflect2d_c.get()
}

///|
/// REFLECT2D_COMPOSE
fn step_2() -> Unit raise {
  let t5 = @simp.rewrite_tac(@list.List([@complexes.cx_neg(), @complexes.complex_mul_lneg(), @complexes.complex_mul_rneg(), @complexes.cx_mul()]))
  let t4 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cexp_add())]))
  let t3 = @simp.rewrite_tac(@list.List([@complexes.cnj_ii(), @complexes.cnj_cx(), @complexes.cnj_neg(), @complexes.complex_mul_assoc()]))
  let t2 = @simp.rewrite_tac(@list.List([@transcendentals.rotate2d_complex(), @transcendentals.cnj_cexp(), @complexes.cnj_mul(), @complexes.cnj_cnj()]))
  let t1 = @tactics.repeat_tac(@tactics.gen_tac)
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), reflect2d()])), t1), t2), t3), @tactics.ap_thm_tac), @tactics.ap_term_tac), t4), t5), @tactics.ap_term_tac), @complexes.simple_complex_arith_tac)
  reflect2d_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Real, ∀ t : Real, o(reflect2d(s), reflect2d(t)) == rotate2d(real_of_num(2) * (s - t))"), t6))
}

///|
let reflect2d_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFLECT2D_COMPOSE")

///|
/// `REFLECT2D_COMPOSE`
pub fn reflect2d_compose() -> @kernel.Thm {
  reflect2d_compose_c.get()
}

///|
/// rotate_about
fn step_3() -> Unit raise {
  rotate_about_c.set(@pair.new_definition(@term_syntax.parse_term("(rotate_about : (Cart[Real, 2], Real, Cart[Real, 2]) -> Cart[Real, 2])((a : Cart[Real, 2]), (t : Real), (x : Cart[Real, 2])) == a + rotate2d(t, x - a)")))
}

///|
let rotate_about_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("rotate_about")

///|
/// `rotate_about`
pub fn rotate_about() -> @kernel.Thm {
  rotate_about_c.get()
}

///|
/// reflect_across
fn step_4() -> Unit raise {
  reflect_across_c.set(@pair.new_definition(@term_syntax.parse_term("(reflect_across : ((Cart[Real, 2], Cart[Real, 2]), Cart[Real, 2]) -> Cart[Real, 2])(((a : Cart[Real, 2]), (b : Cart[Real, 2])), (x : Cart[Real, 2])) == a + reflect2d(Arg(b - a), x - a)")))
}

///|
let reflect_across_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reflect_across")

///|
/// `reflect_across`
pub fn reflect_across() -> @kernel.Thm {
  reflect_across_c.get()
}

///|
/// REFLECT_ACROSS_COMPOSE
fn step_5() -> Unit raise {
  let t12 = @simp.asm_simp_tac(@list.List([@transcendentals.rotate2d_sub_arg(), @complexes.complex_sub_0()]))
  let t11 = @simp.rewrite_tac(@list.List([@real.real_mul_2(), @transcendentals.rotate2d_add()]))
  let t10 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t9 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@class.fun_eq_thm(), @trivia.o_thm()]))(reflect2d_compose())]))
  let t8 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, N]) + (x : Cart[Real, N]) - a == x"))]))
  let t7 = @simp.rewrite_tac(@list.List([reflect_across(), @class.fun_eq_thm(), @trivia.o_thm(), rotate_about()]))
  let t13 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t7), t8), t9), t10), @tactics.ap_term_tac), t11), t12)
  reflect_across_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], !(b == a) && !(c == a) → o(reflect_across((a, b)), reflect_across((a, c))) == rotate_about(a, real_of_num(2) * Arg((b - a) / (c - a)))"), t13))
}

///|
let reflect_across_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFLECT_ACROSS_COMPOSE")

///|
/// `REFLECT_ACROSS_COMPOSE`
pub fn reflect_across_compose() -> @kernel.Thm {
  reflect_across_compose_c.get()
}

///|
/// REFLECT_ACROSS_COMPOSE_ANGLE
fn step_6() -> Unit raise {
  let t16 = @simp.asm_simp_tac(@list.List([@geom.angle(), @geom.vector_angle_arg(), @complexes.complex_sub_0(), @transcendentals.real_sub_arg(), @transcendentals.arg_le_pi()]))
  let t15 = @simp.asm_simp_tac(@list.List([reflect_across_compose()]))
  let t14 = @simp.once_rewrite_tac(@list.List([@geom.angle_sym()]))
  let t17 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t14), t15), t16)
  reflect_across_compose_angle_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], !(b == a) && !(c == a) && real_of_num(0) <= Im((c - a) / (b - a)) → o(reflect_across((a, c)), reflect_across((a, b))) == rotate_about(a, real_of_num(2) * angle((c, a, b)))"), t17))
}

///|
let reflect_across_compose_angle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFLECT_ACROSS_COMPOSE_ANGLE")

///|
/// `REFLECT_ACROSS_COMPOSE_ANGLE`
pub fn reflect_across_compose_angle() -> @kernel.Thm {
  reflect_across_compose_angle_c.get()
}

///|
/// REFLECT_ACROSS_COMPOSE_INVOLUTION
fn step_7() -> Unit raise {
  let t20 = @tactics.repeat_tac(@tactics.strip_tac)
  let t19 = @simp.rewrite_tac(@list.List([@transcendentals.rotate2d_zero(), @trivia.i_thm()]))
  let t18 = @simp.rewrite_tac(@list.List([@transcendentals.arg_num(), @calc_int.real_mul_rzero(), rotate_about(), @class.fun_eq_thm()]))
  let t21 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([reflect_across_compose(), @complexes.complex_div_refl(), @complexes.complex_sub_0()])), t18), t19), t20), @vectors.vector_arith_tac)
  reflect_across_compose_involution_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], !(a == b) → o(reflect_across((a, b)), reflect_across((a, b))) == I"), t21))
}

///|
let reflect_across_compose_involution_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFLECT_ACROSS_COMPOSE_INVOLUTION")

///|
/// `REFLECT_ACROSS_COMPOSE_INVOLUTION`
pub fn reflect_across_compose_involution() -> @kernel.Thm {
  reflect_across_compose_involution_c.get()
}

///|
/// REFLECT_ACROSS_SYM
fn step_8() -> Unit raise {
  let t41 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_zero(), @complexes.complex_sub_0()]))
  let t40 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cnj_sub()), @complexes.complex_mul_cnj(), @complexes.cx_inj()]))
  let t39 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("((b' : Cart[Real, 2]) - (a' : Cart[Real, 2])) * ((b : Cart[Real, 2]) - (a : Cart[Real, 2])) == pow((n : Cart[Real, 2]), 2) && !(n == Cx(real_of_num(0))) → b - a == pow((b - a) * inv(n), 2) * (b' - a')")))
  let t38 = @simp.rewrite_tac(@list.List([@complexes.cnj_sub(), @complexes.complex_ring(@term_syntax.parse_term("(z : Cart[Real, 2]) - (a : Cart[Real, 2]) - (z - (b : Cart[Real, 2])) == b - a"))]))
  let t37 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(b : Cart[Real, 2]) - (a : Cart[Real, 2]) == pow((b - a) * (n : Cart[Real, 2]), 2) * (cnj((za : Cart[Real, 2])) - cnj((zb : Cart[Real, 2]))) → a + pow((b - a) * n, 2) * cnj(za) == b + pow((a - b) * n, 2) * cnj(zb)")))
  let t36 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t35 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t33 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t34 = @tactics.subst1_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t33]), @vectors.norm_sub()))
  let t42 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * (a * cnj((b : Cart[Real, 2]))) == pow(a, 2) * cnj(b)"))])), t34), t35), t36), t37), t38), t39), t40), t41)
  let t32 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@transcendentals.arg()), @complexes.cx_inj(), @vectors.norm_eq_0(), @vectors.vector_sub_eq()]))
  let t43 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("!((a : Cart[Real, 2]) == Cx(real_of_num(0))) && a * (b : Cart[Real, 2]) == (c : Cart[Real, 2]) → b == c / a")))), t32), t42])
  let t30 = @tactics.conjuncts_then(fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s28 = @tactics.subst1_tac(x27)
    fn(x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s28(x29)
    }
  })
  let t31 = @tactics.subgoal_then(@term_syntax.parse_term("cexp(ii * Cx(Arg((b : Cart[Real, 2]) - (a : Cart[Real, 2])))) == (b - a) / Cx(norm(b - a)) && cexp(ii * Cx(Arg(a - b))) == (a - b) / Cx(norm(a - b))"), t30)
  let t26 = @simp.rewrite_tac(@list.List([@complexes.cx_neg(), @complexes.complex_ring(@term_syntax.parse_term("-ii * -(z : Cart[Real, 2]) == ii * z"))]))
  let t25 = @simp.rewrite_tac(@list.List([@transcendentals.rotate2d_complex(), @transcendentals.cnj_cexp(), @complexes.cnj_mul(), @complexes.cnj_cx(), @complexes.cnj_ii()]))
  let t24 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), reflect_across(), reflect2d(), @trivia.o_thm()]))
  let t23 = @simp.asm_rewrite_tac(@list.List([]))
  let t22 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) == (b : Cart[Real, 2])"))
  let t44 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t22), t23), t24), t25), t26), t31), t43)
  reflect_across_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], reflect_across((a, b)) == reflect_across((b, a))"), t44))
}

///|
let reflect_across_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFLECT_ACROSS_SYM")

///|
/// `REFLECT_ACROSS_SYM`
pub fn reflect_across_sym() -> @kernel.Thm {
  reflect_across_sym_c.get()
}

///|
/// ITER_ROTATE_ABOUT
fn step_9() -> Unit raise {
  let t51 = @simp.rewrite_tac(@list.List([rotate_about(), @realax.real_mul_lid()]))
  let t50 = @tactics.repeat_tac(@tactics.gen_tac)
  let t49 = @simp.asm_rewrite_tac(@list.List([@real.real_add_rdistrib(), @transcendentals.rotate2d_add()]))
  let t47 = @equal.gsym(@real.real_of_num_suc())
  let t48 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, N]) + ((x : Cart[Real, N]) - a) == x")), t47]))
  let t46 = @simp.rewrite_tac(@list.List([@iter.iter_alt(), @calc_int.real_mul_lzero(), @transcendentals.rotate2d_zero()]))
  let t45 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) + (b : Cart[Real, N]) == a + (c : Cart[Real, N])) == (b == c)"))]))
  let t52 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), rotate_about()])), t45), @nums.induct_tac), t46), t48), t49), t50), @tactics.ap_term_tac), @tactics.ap_term_tac), t51), @vectors.vector_arith_tac)
  iter_rotate_about_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ a : Cart[Real, 2], ∀ t : Real, ITER(n, rotate_about(a, t)) == rotate_about(a, real_of_num(n) * t)"), t52))
}

///|
let iter_rotate_about_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_ROTATE_ABOUT")

///|
/// `ITER_ROTATE_ABOUT`
pub fn iter_rotate_about() -> @kernel.Thm {
  iter_rotate_about_c.get()
}

///|
/// REAL_LE_IM_DIV_CYCLIC
fn step_10() -> Unit raise {
  let t53 = @simp.rewrite_tac(@list.List([@complexes.complex_mul(), @complexes.im(), @complexes.im_sub(), @complexes.re_sub(), @complexes.im_cnj(), @complexes.cnj_sub(), @complexes.re_cnj()]))
  let t54 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.im_complex_div_ge_0()])), t53), @calc_rat.real_arith_tac)
  real_le_im_div_cyclic_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], (real_of_num(0) <= Im((c - a) / (b - a))) == (real_of_num(0) <= Im((a - b) / (c - b)))"), t54))
}

///|
let real_le_im_div_cyclic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_IM_DIV_CYCLIC")

///|
/// `REAL_LE_IM_DIV_CYCLIC`
pub fn real_le_im_div_cyclic() -> @kernel.Thm {
  real_le_im_div_cyclic_c.get()
}

///|
/// ROTATE_ABOUT_INVERT
fn step_11() -> Unit raise {
  let t57 = @simp.rewrite_tac(@list.List([@transcendentals.rotate2d_zero()]))
  let t56 = @simp.rewrite_tac(@list.List([@realax.real_add_linv(), @calc_int.real_add_rinv()]))
  let t55 = @simp.rewrite_tac(@list.List([rotate_about(), @vectors.vector_add_sub(), @equal.gsym(@transcendentals.rotate2d_add())]))
  let t58 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, (f : (_) -> _)((g : (_) -> _)(x)) == x) && (∀ y : _, g(f(y)) == y) → (f((x : _)) == (y : _)) == (x == g(y))"))), t55), t56), t57), @vectors.vector_arith_tac)
  rotate_about_invert_c.set(@tactics.prove(@term_syntax.parse_term("(rotate_about((a : Cart[Real, 2]), (t : Real), (w : Cart[Real, 2])) == (z : Cart[Real, 2])) == (w == rotate_about(a, -t, z))"), t58))
}

///|
let rotate_about_invert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ROTATE_ABOUT_INVERT")

///|
/// `ROTATE_ABOUT_INVERT`
pub fn rotate_about_invert() -> @kernel.Thm {
  rotate_about_invert_c.get()
}

///|
/// ROTATE_EQ_REFLECT_LEMMA
fn step_12() -> Unit raise {
  let t97 = @simp.simp_tac(@list.List([@floor.integer_closed()]))
  let t95 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2)"))
  let t96 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)")), t95])
  let t94 = @simp.asm_simp_tac(@list.List([@transcendentals.real_sub_arg(), @complexes.complex_sub_0()]))
  let t93 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + ((b : Real) - (c : Real)) == a - (c - b)"))]))
  let t92 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * (a : Real) == real_of_num(2) * (b : Real)) == (a == b)"))]))
  let t90 = @equal.gsym(@realax.real_add_ldistrib())
  let t91 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_sub_ldistrib()), t90]))
  let t89 = @simp.expand_tac("t")
  let t86 = @equal.gsym(@complexes.cx_add())
  let t87 = @equal.gsym(@complexes.cx_sub())
  let t88 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_mul()), t87, t86, @complexes.cx_inj()]))
  let t85 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(ii * (t : Cart[Real, 2]) + Cx(real_of_num(2)) * (ii * (z : Cart[Real, 2])) == ii * (u : Cart[Real, 2]) + (v : Cart[Real, 2]) * ii) == (t + (Cx(real_of_num(2)) * z - u) == v)"))]))
  let t83 = @equal.gsym(@transcendentals.cexp_n())
  let t84 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cexp_add()), t83, @transcendentals.cexp_eq()]))
  let t82 = @tactics.match_mp_tac(@complexes.complex_ring(@term_syntax.parse_term("(e1 : Cart[Real, 2]) * pow((e2 : Cart[Real, 2]), 2) == (e3 : Cart[Real, 2]) → e1 * pow((n : Cart[Real, 2]) * e2, 2) == e3 * pow(n, 2)")))
  let t81 = @simp.gen_rewrite_tac(fn(x80 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x76 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x70 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s71 = @equal.land_conv(x70)
        fn(x72 : @kernel.Term) -> @kernel.Thm raise {
          s71(x72)
        }
      })((fn(x73 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s74 = @equal.rand_conv(x73)
        fn(x75 : @kernel.Term) -> @kernel.Thm raise {
          s74(x75)
        }
      })(x76))
    })((fn(x77 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s78 = @equal.land_conv(x77)
      fn(x79 : @kernel.Term) -> @kernel.Thm raise {
        s78(x79)
      }
    })(x80))
  }, @list.List([@transcendentals.arg()]))
  let t69 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_cnj()]))
  let t66 = @drule.match_mp(@complexes.complex_ring(@term_syntax.parse_term("!((z : Cart[Real, 2]) == (a : Cart[Real, 2])) → (c : Cart[Real, 2]) * pow(z - a, 2) == (b : Cart[Real, 2]) * (cnj(z - a) * (z - a)) → c * (z - a) == b * cnj(z - a)")))
  let t68 = @tactics.first_assum(fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t66(x67))
  })
  let t65 = @simp.asm_rewrite_tac(@list.List([@complexes.cnj_cx(), @complexes.complex_mul_rzero(), @complexes.complex_sub_refl()]))
  let t64 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == (a : Cart[Real, 2])"))
  let t63 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("ii * (a : Cart[Real, 2]) + ii * a == ii * (Cx(real_of_num(2)) * a)"))]))
  let t62 = @simp.rewrite_tac(@list.List([@complexes.cnj_cx(), @complexes.complex_mul_lneg(), @complexes.complex_mul_rneg(), @complexes.complex_neg_neg(), @equal.gsym(@transcendentals.cexp_add()), @complexes.cx_neg()]))
  let t61 = @simp.rewrite_tac(@list.List([@complexes.cnj_mul(), @complexes.complex_mul_assoc(), @transcendentals.cnj_cexp(), @complexes.cnj_ii()]))
  let t60 = @simp.rewrite_tac(@list.List([@transcendentals.rotate2d_complex(), reflect2d(), @trivia.o_thm()]))
  let t59 = @simp.rewrite_tac(@list.List([rotate_about(), reflect_across()]))
  let t98 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t59), @tactics.ap_term_tac), t60), t61), t62), t63), t64), t65), t68), t69), t81), t82), t84), t85), t88), t89), t91), t92), t93), t94), @class.cond_cases_tac), t96), t97), @calc_rat.real_arith_tac)
  rotate_eq_reflect_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ t : Real, !(b == a) && real_of_num(2) * Arg((b - a) / (z - a)) == t → rotate_about(a, t, z) == reflect_across((a, b), z)"), t98))
}

///|
let rotate_eq_reflect_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ROTATE_EQ_REFLECT_LEMMA")

///|
/// `ROTATE_EQ_REFLECT_LEMMA`
pub fn rotate_eq_reflect_lemma() -> @kernel.Thm {
  rotate_eq_reflect_lemma_c.get()
}

///|
/// ROTATE_EQ_REFLECT_PI_LEMMA
fn step_13() -> Unit raise {
  let t111 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid()]))
  let t110 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t109 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_0(), @complexes.complex_mul_rzero(), @complexes.complex_add_rid()]))
  let t108 = @simp.rewrite_tac(@list.List([@transcendentals.sin_npi(), @transcendentals.cos_npi(), @transcendentals.real_exp_neg(), @transcendentals.real_exp_0(), @complexes.cx_neg()]))
  let t107 = @simp.rewrite_tac(@list.List([@transcendentals.euler(), @complexes.re_mul_ii(), @complexes.im_mul_ii(), @complexes.re_cx(), @complexes.im_cx(), @transcendentals.cos_neg(), @transcendentals.sin_neg()]))
  let t106 = @simp.rewrite_tac(@list.List([@transcendentals.rotate2d_complex()]))
  let t105 = @simp.rewrite_tac(@list.List([rotate_about(), @transcendentals.rotate2d_add()]))
  let t103 = @simp.asm_rewrite_tac(@list.List([]))
  let t104 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(rotate_eq_reflect_lemma()), t103)])
  let t102 = @tactics.exists_tac(@term_syntax.parse_term("rotate_about((a : Cart[Real, 2]), real_of_num(2) * Arg(((b : Cart[Real, 2]) - a) / ((z : Cart[Real, 2]) - a)), z)"))
  let t101 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t100 = @simp.asm_rewrite_tac(@list.List([]))
  let t99 = @tactics.repeat_tac(@tactics.strip_tac)
  let t112 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) == real_of_num(4) * pi + (t : Real)) == (t == a + -(real_of_num(4) * pi))"))])), t99), t100), t101), t102), @tactics.conj_tac), t104), t105), @tactics.ap_term_tac), @tactics.ap_term_tac), t106), t107), t108), t109), t110), t111)
  rotate_eq_reflect_pi_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ t : Real, !(b == a) && real_of_num(2) * Arg((b - a) / (z - a)) == real_of_num(4) * pi + t → rotate_about(a, t, z) == reflect_across((a, b), z)"), t112))
}

///|
let rotate_eq_reflect_pi_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ROTATE_EQ_REFLECT_PI_LEMMA")

///|
/// `ROTATE_EQ_REFLECT_PI_LEMMA`
pub fn rotate_eq_reflect_pi_lemma() -> @kernel.Thm {
  rotate_eq_reflect_pi_lemma_c.get()
}

///|
/// EQUILATERAL_TRIANGLE_ALGEBRAIC
fn step_14() -> Unit raise {
  let t135 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_mul(), @complexes.complex_norm_pow()]))
  let t132 = @tactics.disch_then(fn(x131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s129 = @tactics.assume_tac(x128)
      fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s129(x130)
      }
    })(@bool.conjunct1(x131))
  })
  let t133 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_norm_pow(), @real.real_pow_eq_1(), @calc_num.arith(), @vectors.real_abs_norm()])), t132)
  let t134 = @list.List([@simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_cx(), @calc_int.real_abs_num()])), t133])
  let t127 = @tactics.subgoal_then(@term_syntax.parse_term("norm(pow((j : Cart[Real, 2]), 3)) == real_of_num(1)"), fn(x124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s125 = @tactics.mp_tac(x124)
    fn(x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s125(x126)
    }
  })
  let t122 = @tactics.conv_tac(@complexes.complex_ring)
  let t123 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s120 = @tactics.mp_tac(x119)
    fn(x121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s120(x121)
    }
  })), t122), @tactics.all_tac])
  let t117 = @tactics.conjuncts_then(fn(x114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s115 = @tactics.subst1_tac(x114)
    fn(x116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s115(x116)
    }
  })
  let t118 = @tactics.subgoal_then(@term_syntax.parse_term("(C : Cart[Real, 2]) - (A : Cart[Real, 2]) == (j : Cart[Real, 2]) * ((B : Cart[Real, 2]) - C) && A - B == pow(j, 2) * (B - C)"), t117)
  let t113 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t136 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t113), t118), t123), t127), t134), t135), @calc_rat.real_arith_tac)
  equilateral_triangle_algebraic_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ j : Cart[Real, 2], pow(j, 3) == Cx(real_of_num(1)) && !(j == Cx(real_of_num(1))) && A + (j * B + pow(j, 2) * C) == Cx(real_of_num(0)) → distance((A, B)) == distance((B, C)) && distance((C, A)) == distance((B, C))"), t136))
}

///|
let equilateral_triangle_algebraic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQUILATERAL_TRIANGLE_ALGEBRAIC")

///|
/// `EQUILATERAL_TRIANGLE_ALGEBRAIC`
pub fn equilateral_triangle_algebraic() -> @kernel.Thm {
  equilateral_triangle_algebraic_c.get()
}

///|
/// AFFINE_GROUP_ITER_3
fn step_15() -> Unit raise {
  let t140 = @tactics.conv_tac(@complexes.complex_ring)
  let t139 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t138 = @simp.rewrite_tac(@list.List([@iter.iter(), @class.fun_eq_thm()]))
  let t137 = @term_syntax.parse_term("3")
  let t141 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.top_depth_conv(@calc_num.num_conv)(t137)])), t138), t139), t140)
  affine_group_iter_3_c.set(@tactics.prove(@term_syntax.parse_term("ITER(3, (z : Cart[Real, 2]) => (a : Cart[Real, 2]) * z + (b : Cart[Real, 2])) == ((z : Cart[Real, 2]) => pow(a, 3) * z + b * (Cx(real_of_num(1)) + (a + pow(a, 2))))"), t141))
}

///|
let affine_group_iter_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFINE_GROUP_ITER_3")

///|
/// `AFFINE_GROUP_ITER_3`
pub fn affine_group_iter_3() -> @kernel.Thm {
  affine_group_iter_3_c.get()
}

///|
/// AFFINE_GROUP_COMPOSE
fn step_16() -> Unit raise {
  let t142 = @tactics.conv_tac(@complexes.complex_ring)
  let t143 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_thm(), @class.fun_eq_thm()])), t142)
  affine_group_compose_c.set(@tactics.prove(@term_syntax.parse_term("o((z : Cart[Real, 2]) => (a1 : Cart[Real, 2]) * z + (b1 : Cart[Real, 2]), (z : Cart[Real, 2]) => (a2 : Cart[Real, 2]) * z + (b2 : Cart[Real, 2])) == ((z : Cart[Real, 2]) => a1 * a2 * z + (b1 + a1 * b2))"), t143))
}

///|
let affine_group_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFINE_GROUP_COMPOSE")

///|
/// `AFFINE_GROUP_COMPOSE`
pub fn affine_group_compose() -> @kernel.Thm {
  affine_group_compose_c.get()
}

///|
/// AFFINE_GROUP_I
fn step_17() -> Unit raise {
  let t144 = @tactics.conv_tac(@complexes.complex_ring)
  let t145 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.i_thm(), @class.fun_eq_thm()])), t144)
  affine_group_i_c.set(@tactics.prove(@term_syntax.parse_term("I == ((z : Cart[Real, 2]) => Cx(real_of_num(1)) * z + Cx(real_of_num(0)))"), t145))
}

///|
let affine_group_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFINE_GROUP_I")

///|
/// `AFFINE_GROUP_I`
pub fn affine_group_i() -> @kernel.Thm {
  affine_group_i_c.get()
}

///|
/// AFFINE_GROUP_EQ
fn step_18() -> Unit raise {
  let t161 = @tactics.conv_tac(@complexes.complex_ring)
  let t157 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t160 = @tactics.first_x_assum(fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x154 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s155 = @tactics.mp_tac(x154)
      fn(x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s155(x156)
      }
    })(((x158 : @kernel.Thm) => @bool.spec(t157, x158))(x159))
  })
  let t150 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t153 = @tactics.first_assum(fn(x152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s148 = @tactics.mp_tac(x147)
      fn(x149 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s148(x149)
      }
    })(((x151 : @kernel.Thm) => @bool.spec(t150, x151))(x152))
  })
  let t146 = @simp.simp_tac(@list.List([@class.fun_eq_thm()]))
  let t162 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t146), @tactics.disch_tac), t153), t160), t161)
  affine_group_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : _, ∀ a' : Cart[Real, 2], ∀ b : Cart[Real, 2], (((z : Cart[Real, 2]) => a * z + b) == ((z : Cart[Real, 2]) => a' * z + (b' : Cart[Real, 2]))) == (a == a' && b == b')"), t162))
}

///|
let affine_group_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFINE_GROUP_EQ")

///|
/// `AFFINE_GROUP_EQ`
pub fn affine_group_eq() -> @kernel.Thm {
  affine_group_eq_c.get()
}

///|
/// AFFINE_GROUP_ROTATE_ABOUT
fn step_19() -> Unit raise {
  let t163 = @tactics.conv_tac(@complexes.complex_ring)
  let t164 = @tactics.then_tac(@simp.rewrite_tac(@list.List([rotate_about(), @class.fun_eq_thm(), @transcendentals.rotate2d_complex()])), t163)
  affine_group_rotate_about_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ t : Real, rotate_about(a, t) == ((z : Cart[Real, 2]) => cexp(ii * Cx(t)) * z + (Cx(real_of_num(1)) - cexp(ii * Cx(t))) * a)"), t164))
}

///|
let affine_group_rotate_about_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFINE_GROUP_ROTATE_ABOUT")

///|
/// `AFFINE_GROUP_ROTATE_ABOUT`
pub fn affine_group_rotate_about() -> @kernel.Thm {
  affine_group_rotate_about_c.get()
}

///|
/// ALGEBRAIC_LEMMA
fn step_20() -> Unit raise {
  let t195 = @tactics.conv_tac(@complexes.complex_field)
  let t194 = @tactics.repeat_tac(@tactics.pop_assum(fn(x191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s192 = @tactics.mp_tac(x191)
    fn(x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s192(x193)
    }
  }))
  let t189 = @simp.rewrite_tac(@list.List([@complexes.complex_entire()]))
  let t186 = @drule.match_mp(@complexes.complex_ring(@term_syntax.parse_term("(s : Cart[Real, 2]) == Cx(real_of_num(0)) → s + (t : Cart[Real, 2]) == Cx(real_of_num(0)) → t == Cx(real_of_num(0))")))
  let t188 = @tactics.first_x_assum(fn(x187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t186(x187))
  })
  let t184 = @tactics.disch_then(fn(x181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s182 = @tactics.subst1_tac(x181)
    fn(x183 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s182(x183)
    }
  })
  let t185 = @tactics.repeat_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@meson.asm_meson_tac(@list.List([@complexes.complex_mul_sym()])), t184])))
  let t179 = @drule.match_mp(@complexes.complex_field(@term_syntax.parse_term("(a3 : Cart[Real, 2]) * ((a1 : Cart[Real, 2]) * (B : Cart[Real, 2]) + (b1 : Cart[Real, 2])) + (b3 : Cart[Real, 2]) == B → !(a1 * a3 == Cx(real_of_num(1))) → B == (a3 * b1 + b3) / (Cx(real_of_num(1)) - a1 * a3)")))
  let t190 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.first_x_assum(fn(x180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x176 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s177 = @tactics.mp_tac(x176)
      fn(x178 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s177(x178)
      }
    })(t179(x180))
  })), t185), t188), t189])
  let t175 = @tactics.subgoal_then(@term_syntax.parse_term("(a1 : Cart[Real, 2]) * ((a2 : Cart[Real, 2]) * (a3 : Cart[Real, 2])) * (pow(a1, 2) * (a2 * ((a1 - a1 * (a2 * a3)) * ((a2 - a1 * (a2 * a3)) * ((a3 - a1 * (a2 * a3)) * ((C : Cart[Real, 2]) + (a1 * (a2 * a3) * (A : Cart[Real, 2]) + pow(a1 * (a2 * a3), 2) * (B : Cart[Real, 2])))))))) == Cx(real_of_num(0))"), fn(x172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s173 = @tactics.mp_tac(x172)
    fn(x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s173(x174)
    }
  })
  let t170 = @tactics.conv_tac(@complexes.complex_ring)
  let t171 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s168 = @tactics.mp_tac(x167)
    fn(x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s168(x169)
    }
  })), t170), @tactics.all_tac])
  let t166 = @simp.asm_rewrite_tac(@list.List([]))
  let t165 = @tactics.repeat_tac(@tactics.gen_tac)
  let t196 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([affine_group_iter_3(), affine_group_compose(), affine_group_i(), affine_group_eq()])), t165), @tactics.strip_tac), t166), @tactics.conj_tac), t171), t175), t190), t194), t195)
  algebraic_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a1 : Cart[Real, 2], ∀ a2 : Cart[Real, 2], ∀ a3 : Cart[Real, 2], ∀ b1 : Cart[Real, 2], ∀ b2 : Cart[Real, 2], ∀ b3 : Cart[Real, 2], ∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ((z : Cart[Real, 2]) => a3 * z + b3)(((z : Cart[Real, 2]) => a1 * z + b1)(B)) == B && ((z : Cart[Real, 2]) => a1 * z + b1)(((z : Cart[Real, 2]) => a2 * z + b2)(C)) == C && ((z : Cart[Real, 2]) => a2 * z + b2)(((z : Cart[Real, 2]) => a3 * z + b3)(A)) == A && o(ITER(3, (z : Cart[Real, 2]) => a1 * z + b1), o(ITER(3, (z : Cart[Real, 2]) => a2 * z + b2), ITER(3, (z : Cart[Real, 2]) => a3 * z + b3))) == I && !(a1 * (a2 * a3) == Cx(real_of_num(1))) && !(a1 * a2 == Cx(real_of_num(1))) && !(a2 * a3 == Cx(real_of_num(1))) && !(a3 * a1 == Cx(real_of_num(1))) → pow(a1 * (a2 * a3), 3) == Cx(real_of_num(1)) && !(a1 * (a2 * a3) == Cx(real_of_num(1))) && C + (a1 * (a2 * a3) * A + pow(a1 * (a2 * a3), 2) * B) == Cx(real_of_num(0))"), t196))
}

///|
let algebraic_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALGEBRAIC_LEMMA")

///|
/// `ALGEBRAIC_LEMMA`
pub fn algebraic_lemma() -> @kernel.Thm {
  algebraic_lemma_c.get()
}

///|
/// CYCLIC_PERM_SUBGOAL_THEN
fn step_21() -> Unit raise {
  let lemma = @meson.meson(@list.List([]), @term_syntax.parse_term("(∀ A : _, ∀ B : _, ∀ C : _, ∀ P : _, ∀ Q : _, ∀ R : _, ∀ a : _, ∀ b : _, ∀ c : _, ∀ g1 : _, ∀ g2 : _, ∀ g3 : _, (Ant : (_, _, _, _, _, _, _, _, _, _, _, _) -> Bool)(A, B, C, P, Q, R, a, b, c, g1, g2, g3) → (Cns : (_, _, _, _, _, _, _, _, _, _, _, _) -> Bool)(A, B, C, P, Q, R, a, b, c, g1, g2, g3)) → (∀ A : _, ∀ B : _, ∀ C : _, ∀ P : _, ∀ Q : _, ∀ R : _, ∀ a : _, ∀ b : _, ∀ c : _, ∀ g1 : _, ∀ g2 : _, ∀ g3 : _, Ant(A, B, C, P, Q, R, a, b, c, g1, g2, g3) → Ant(B, C, A, Q, R, P, b, c, a, g2, g3, g1)) → (∀ A : _, ∀ B : _, ∀ C : _, ∀ P : _, ∀ Q : _, ∀ R : _, ∀ a : _, ∀ b : _, ∀ c : _, ∀ g1 : _, ∀ g2 : _, ∀ g3 : _, Ant(A, B, C, P, Q, R, a, b, c, g1, g2, g3) → Cns(A, B, C, P, Q, R, a, b, c, g1, g2, g3) && Cns(B, C, A, Q, R, P, b, c, a, g2, g3, g1) && Cns(C, A, B, R, P, Q, c, a, b, g3, g1, g2))"))
  let t197 = @term_syntax.parse_term("(g3 : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t198 = @term_syntax.parse_term("(g2 : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t199 = @term_syntax.parse_term("(g1 : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t200 = @term_syntax.parse_term("(c : Real)")
  let t201 = @term_syntax.parse_term("(b : Real)")
  let t202 = @term_syntax.parse_term("(a : Real)")
  let t203 = @term_syntax.parse_term("(R : Cart[Real, 2])")
  let t204 = @term_syntax.parse_term("(Q : Cart[Real, 2])")
  let t205 = @term_syntax.parse_term("(P : Cart[Real, 2])")
  let t206 = @term_syntax.parse_term("(C : Cart[Real, 2])")
  let t207 = @term_syntax.parse_term("(B : Cart[Real, 2])")
  let vars = @list.List([@term_syntax.parse_term("(A : Cart[Real, 2])"), t207, t206, t205, t204, t203, t202, t201, t200, t199, t198, t197])
  cyclic_perm_subgoal_then_c.set(fn(x208 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let t = x208
    fn(x209 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let ttac = x209
      fn(x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        let (asl, w) = x210
        let asm_ = @bool.list_mk_conj(@lib.map(fn(x213 : (String, @kernel.Thm)) -> @kernel.Term raise {
          (fn(x211 : @kernel.Thm) -> @kernel.Term raise {
            @kernel.concl(x211)
          })((fn(x212 : (String, @kernel.Thm)) -> @kernel.Thm raise {
            x212.1
          })(x213))
        }, @lib.rev(asl)))
        let gnw = @bool.list_mk_forall(vars, @bool.mk_imp(asm_, t))
        let t214 = @kernel.assume_rule(gnw)
        let th1 = @drule.match_mp(lemma)(t214)
        let tm1 = @basics.dest_imp(@kernel.concl(th1)).0
        let th2 = @simp.rewrite_conv(@list.List([@sets.insert_ac(), @theorems.conj_aci(), @geom.angle_sym(), @theorems.eq_sym_eq()]))(tm1)
        let th3 = @bool.disch_all(@bool.mp(th1, @bool.eqt_elim(th2)))
        let t228 = @tactics.disch_then(@tactics.conjuncts_then(ttac))
        let t229 = @tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(ttac, fn(x225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s226 = @tactics.mp_tac(x225)
          fn(x227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s226(x227)
          }
        })), t228)
        let t224 = @tactics.first_assum(fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s222 = @tactics.accept_tac(x221)
          fn(x223 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s222(x223)
          }
        })
        let t230 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t224), t229])
        let t231 = @tactics.thenl(@tactics.then_tac(@tactics.disch_then(fn(x220 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x217 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s218 = @tactics.mp_tac(x217)
            fn(x219 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s218(x219)
            }
          })(@bool.spec_all(x220))
        }), @tactics.ants_tac), t230)
        let t216 = @tactics.repeat_tac(@tactics.gen_tac)
        let t232 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum_list(fn(x215 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          @tactics.all_tac
        }), t216), @tactics.strip_tac), t231])
        @tactics.thenl(@tactics.then_tac(@tactics.mp_tac(th3), @tactics.ants_tac), t232)((asl, w))
      }
    }
  })
}

///|
let cyclic_perm_subgoal_then_c : @lib.Cell[(@kernel.Term) -> ((@tactics.ThmTactic) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise) raise] = @lib.Cell::new("CYCLIC_PERM_SUBGOAL_THEN")

///|
/// `CYCLIC_PERM_SUBGOAL_THEN`
pub fn cyclic_perm_subgoal_then(x : @kernel.Term) -> ((@tactics.ThmTactic) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise) raise {
  (cyclic_perm_subgoal_then_c.get())(x)
}

///|
/// MORLEY
fn step_22() -> Unit raise {
  let t450 = @simp.rewrite_tac(@list.List([]))
  let t449 = @simp.pure_asm_rewrite_tac(@list.List([]))
  let t446 = @term_syntax.parse_term("(b3 : Cart[Real, 2])")
  let t447 = @term_syntax.parse_term("(b2 : Cart[Real, 2])")
  let t448 = @tactics.map_every(fn(x443 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s444 = @tactics.exists_tac(x443)
    fn(x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s444(x445)
    }
  }, @list.List([@term_syntax.parse_term("(b1 : Cart[Real, 2])"), t447, t446]))
  let t442 = @tactics.match_mp_tac(algebraic_lemma())
  let t441 = @tactics.exists_tac(@term_syntax.parse_term("(a1 : Cart[Real, 2]) * ((a2 : Cart[Real, 2]) * (a3 : Cart[Real, 2]))"))
  let t440 = @tactics.match_mp_tac(equilateral_triangle_algebraic())
  let t439 = @tactics.repeat_tac(@tactics.disch_tac)
  let t433 = @term_syntax.parse_term("(b3 : Cart[Real, 2]) == (Cx(real_of_num(1)) - (a3 : Cart[Real, 2])) * (C : Cart[Real, 2])")
  let t434 = @term_syntax.parse_term("(b2 : Cart[Real, 2]) == (Cx(real_of_num(1)) - (a2 : Cart[Real, 2])) * (B : Cart[Real, 2])")
  let t435 = @term_syntax.parse_term("(b1 : Cart[Real, 2]) == (Cx(real_of_num(1)) - (a1 : Cart[Real, 2])) * (A : Cart[Real, 2])")
  let t436 = @term_syntax.parse_term("(a3 : Cart[Real, 2]) == cexp(ii * Cx(real_of_num(2) * (c : Real)))")
  let t437 = @term_syntax.parse_term("(a2 : Cart[Real, 2]) == cexp(ii * Cx(real_of_num(2) * (b : Real)))")
  let t438 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(a1 : Cart[Real, 2]) == cexp(ii * Cx(real_of_num(2) * (a : Real)))"), t437, t436, t435, t434, t433]))
  let t429 = @simp.rewrite_tac(@list.List([@transcendentals.cexp_ii_ne_1(), @equal.gsym(@complexes.cx_add())]))
  let t430 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_and()), @tactics.conj_tac), t429)
  let t427 = @meson.asm_meson_tac(@list.List([@geom.collinear_angle(), @geom.angle_sym(), @sets.insert_ac()]))
  let t428 = @list.List([@meson.asm_meson_tac(@list.List([@geom.triangle_angle_sum(), @arith.add_ac(), @geom.angle_sym()])), t427])
  let t426 = @simp.simp_tac(@list.List([@geom.angle_range(), @real.real_le_div(), @realarith.real_pos()]))
  let t425 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(3) * ((x : Real) / real_of_num(3)) == x")), @transcendentals.pi_pos()]))
  let t431 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x422 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s423 = @simp.expand_tac(x422)
    fn(x424 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s423(x424)
    }
  }, @list.List(["a", "b", "c"])), t425), t426), @tactics.conj_tac), t428), t430])
  let t421 = @tactics.mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (a : Real) && real_of_num(0) <= (b : Real) && real_of_num(0) <= (c : Real) && real_of_num(0) < pi && real_of_num(3) * a + (real_of_num(3) * b + real_of_num(3) * c) == pi && !(real_of_num(3) * c == pi) → (real_of_num(0) < real_of_num(2) * a + real_of_num(2) * b && real_of_num(2) * a + real_of_num(2) * b < real_of_num(2) * pi) && real_of_num(0) < real_of_num(2) * a + (real_of_num(2) * b + real_of_num(2) * c) && real_of_num(2) * a + (real_of_num(2) * b + real_of_num(2) * c) < real_of_num(2) * pi")))
  let t419 = @equal.gsym(@complexes.cx_add())
  let t420 = @equal.gsym(@complexes.complex_add_ldistrib())
  let t432 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cexp_add()), t420, t419])), t421), @tactics.ants_tac), t431), @tactics.all_tac])
  let t418 = cyclic_perm_subgoal_then(@term_syntax.parse_term("!(cexp(ii * Cx(real_of_num(2) * (a : Real))) * cexp(ii * Cx(real_of_num(2) * (b : Real))) == Cx(real_of_num(1))) && !(cexp(ii * Cx(real_of_num(2) * a)) * (cexp(ii * Cx(real_of_num(2) * b)) * cexp(ii * Cx(real_of_num(2) * (c : Real)))) == Cx(real_of_num(1)))"))(@tactics.strip_assume_tac)
  let t415 = @simp.gen_rewrite_rule(fn(x412 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s413 = @equal.land_conv(x412)
    fn(x414 : @kernel.Term) -> @kernel.Thm raise {
      s413(x414)
    }
  }, @list.List([affine_group_rotate_about()]))
  let t417 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x409 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s410 = @tactics.mp_tac(x409)
      fn(x411 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s410(x411)
      }
    })(t415(x416))
  }))
  let t407 = @meson.asm_meson_tac(@list.List([@geom.collinear_angle(), @geom.angle_sym(), @sets.insert_ac()]))
  let t405 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) / real_of_num(3) == real_of_num(0)) == (a == real_of_num(0))"))]))
  let t404 = @simp.asm_simp_tac(@list.List([@geom.vector_angle_arg(), @complexes.complex_sub_0()]))
  let t406 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@geom.angle()])), t404), t405])
  let t403 = @tactics.subgoal_then(@term_syntax.parse_term("angle(((A : Cart[Real, 2]), (C : Cart[Real, 2]), (Q : Cart[Real, 2]))) == real_of_num(0)"), fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s401 = @tactics.mp_tac(x400)
    fn(x402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s401(x402)
    }
  })
  let t399 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.arg_eq_0())]))
  let t398 = @tactics.match_mp_tac(@transcendentals.arg_inv())
  let t397 = @simp.gen_rewrite_tac(fn(x396 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x390 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s391 = @equal.land_conv(x390)
      fn(x392 : @kernel.Term) -> @kernel.Thm raise {
        s391(x392)
      }
    })((fn(x393 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s394 = @equal.rand_conv(x393)
      fn(x395 : @kernel.Term) -> @kernel.Thm raise {
        s394(x395)
      }
    })(x396))
  }, @list.List([@equal.gsym(@complexes.complex_inv_div())]))
  let t389 = @simp.asm_simp_tac(@list.List([@geom.vector_angle_arg(), @complexes.complex_sub_0()]))
  let t388 = @simp.rewrite_tac(@list.List([@geom.angle()]))
  let t387 = @tactics.first_assum(fn(x378 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x378
    @simp.gen_rewrite_tac(fn(x386 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x380 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s381 = @equal.rand_conv(x380)
        fn(x382 : @kernel.Term) -> @kernel.Thm raise {
          s381(x382)
        }
      })((fn(x383 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s384 = @equal.rand_conv(x383)
        fn(x385 : @kernel.Term) -> @kernel.Thm raise {
          s384(x385)
        }
      })(x386))
    }, @list.List([@equal.sym(th_2)]))
  })
  let t377 = @simp.once_rewrite_tac(@list.List([@geom.angle_sym()]))
  let t376 = @simp.gen_rewrite_tac(fn(x375 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x369 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s370 = @equal.rand_conv(x369)
      fn(x371 : @kernel.Term) -> @kernel.Thm raise {
        s370(x371)
      }
    })((fn(x372 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s373 = @equal.rand_conv(x372)
      fn(x374 : @kernel.Term) -> @kernel.Thm raise {
        s373(x374)
      }
    })(x375))
  }, @list.List([@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("angle(((B : Cart[Real, 2]), (C : Cart[Real, 2]), (A : Cart[Real, 2]))) / real_of_num(3) == (c : Real)")))]))
  let t368 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * (a : Real) == real_of_num(4) * pi + real_of_num(2) * -(c : Real)) == (a == real_of_num(2) * pi - c)"))]))
  let t367 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@calc_int.real_mul_rneg())]))
  let t366 = @tactics.match_mp_tac(rotate_eq_reflect_pi_lemma())
  let t365 = @simp.once_rewrite_tac(@list.List([reflect_across_sym()]))
  let t364 = @tactics.conv_tac(@equal.sym_conv)
  let t362 = @simp.asm_simp_tac(@list.List([@geom.vector_angle_arg(), @complexes.complex_sub_0()]))
  let t361 = @simp.once_rewrite_tac(@list.List([@geom.vector_angle_sym()]))
  let t360 = @simp.rewrite_tac(@list.List([@geom.angle()]))
  let t359 = @simp.gen_rewrite_tac(fn(x356 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s357 = @equal.rand_conv(x356)
    fn(x358 : @kernel.Term) -> @kernel.Thm raise {
      s357(x358)
    }
  }, @list.List([@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("angle(((C : Cart[Real, 2]), (A : Cart[Real, 2]), (Q : Cart[Real, 2]))) == (a : Real)")))]))
  let t355 = @simp.asm_rewrite_tac(@list.List([]))
  let t363 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(rotate_eq_reflect_lemma()), t355), @tactics.ap_term_tac), t359), t360), t361), t362), @tactics.all_tac])
  let t354 = @tactics.exists_tac(@term_syntax.parse_term("reflect_across(((A : Cart[Real, 2]), (C : Cart[Real, 2])), (Q : Cart[Real, 2]))"))
  let t353 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t352 = @simp.once_rewrite_tac(@list.List([rotate_about_invert()]))
  let t408 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x349 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s350 = @simp.expand_tac(x349)
    fn(x351 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s350(x351)
    }
  }, @list.List(["g1", "g3"])), t352), t353), t354), @tactics.conj_tac), t363), t364), t365), t366), t367), t368), t376), t377), t387), t388), t389), t397), t398), t399), @tactics.disch_tac), t403), t406), t407), @tactics.all_tac])
  let t348 = cyclic_perm_subgoal_then(@term_syntax.parse_term("(g3 : (Cart[Real, 2]) -> Cart[Real, 2])((g1 : (Cart[Real, 2]) -> Cart[Real, 2])((Q : Cart[Real, 2]))) == Q"))(fn(x345 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s346 = @tactics.assume_tac(x345)
    fn(x347 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s346(x347)
    }
  })
  let t343 = @simp.rewrite_tac(@list.List([@geom.angle_range(), @transcendentals.pi_pos()]))
  let t342 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= pi && real_of_num(0) < pi → !(a / real_of_num(3) == pi / real_of_num(2))")))
  let t341 = @tactics.repeat_tac(@tactics.gen_tac)
  let t344 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], !(angle((x, y, z)) / real_of_num(3) == pi / real_of_num(2))"), fn(x339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x339
    @meson.asm_meson_tac(@list.List([th_1, @geom.angle_refl()]))
  }), t341), t342), t343), @tactics.all_tac])
  let t338 = cyclic_perm_subgoal_then(@term_syntax.parse_term("!((P : Cart[Real, 2]) == (B : Cart[Real, 2])) && !(P == (C : Cart[Real, 2]))"))(@tactics.strip_assume_tac)
  let t336 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexes.im_complex_inv_ge_0()), @complexes.complex_inv_div()]))
  let t335 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= -(x : Real)) == (x <= real_of_num(0))"))]))
  let t334 = @simp.asm_rewrite_tac(@list.List([]))
  let t333 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t332 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (u : Real) * -(a : Real) → u * a <= real_of_num(0)")))
  let t331 = @simp.simp_tac(@list.List([@calc_int.real_mul_rzero(), @realax.real_add_lid()]))
  let t330 = @simp.asm_simp_tac(@list.List([@complexes.im_mul_cx(), @complexes.complex_div_refl(), @complexes.complex_sub_0(), @complexes.im_cx()]))
  let t329 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t328 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc())]))
  let t327 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_add_rdistrib(), @complexes.im_add(), @complexes.complex_cmul()]))
  let t326 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @vectors.vector_mul_lzero(), @vectors.vector_add_rid()]))
  let t325 = @simp.simp_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((u : Real), (A : Cart[Real, N])) + (op_pct((v : Real), (B : Cart[Real, N])) + op_pct((w : Real), (C : Cart[Real, N]))) - C == op_pct(v, B - C) + (op_pct(u, A - C) + op_pct(u + (v + w) - real_of_num(1), C))"))]))
  let t324 = @simp.asm_rewrite_tac(@list.List([]))
  let t323 = @simp.rewrite_tac(@list.List([@convex.convex_hull_3(), @sets.in_elim_thm()]))
  let t322 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_and()), @tactics.conj_tac))
  let t321 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t318 = @simp.gen_rewrite_rule(fn(x317 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x317
  }, @list.List([@sets.insert_subset()]))
  let t320 = @tactics.first_x_assum(fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s315 = @tactics.mp_tac(x314)
      fn(x316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s315(x316)
      }
    })(t318(x319))
  })
  let t337 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.im_complex_inv_le_0()), @complexes.complex_inv_div()])), t320), t321), t322), t323), @tactics.strip_tac), t324), t325), t326), t327), t328), t329), t330), t331), t332), t333), t334), t335), t336), @tactics.all_tac])
  let t313 = cyclic_perm_subgoal_then(@term_syntax.parse_term("real_of_num(0) <= Im(((B : Cart[Real, 2]) - (C : Cart[Real, 2])) / ((P : Cart[Real, 2]) - C))"))(@tactics.strip_assume_tac)
  let t311 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t310 = @simp.simp_tac(@list.List([@calc_int.real_mul_rzero(), @calc_int.real_add_rid()]))
  let t309 = @simp.asm_simp_tac(@list.List([@complexes.im_mul_cx(), @complexes.complex_div_refl(), @complexes.complex_sub_0(), @complexes.im_cx()]))
  let t308 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_div())]))
  let t307 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_mul_assoc())]))
  let t306 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_add_rdistrib(), @complexes.im_add(), @complexes.complex_cmul()]))
  let t305 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @vectors.vector_mul_lzero(), @vectors.vector_add_rid()]))
  let t304 = @simp.simp_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((u : Real), (A : Cart[Real, N])) + (op_pct((v : Real), (B : Cart[Real, N])) + op_pct((w : Real), (C : Cart[Real, N]))) - B == op_pct(u, A - B) + (op_pct(w, C - B) + op_pct(u + (v + w) - real_of_num(1), B))"))]))
  let t303 = @simp.asm_rewrite_tac(@list.List([]))
  let t302 = @simp.rewrite_tac(@list.List([@convex.convex_hull_3(), @sets.in_elim_thm()]))
  let t301 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_and()), @tactics.conj_tac))
  let t300 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t298 = @simp.gen_rewrite_rule(fn(x297 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x297
  }, @list.List([@sets.insert_subset()]))
  let t312 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x299 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s295 = @tactics.mp_tac(x294)
      fn(x296 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s295(x296)
      }
    })(t298(x299))
  }), t300), t301), t302), @tactics.strip_tac), t303), t304), t305), t306), t307), t308), t309), t310), t311), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t293 = cyclic_perm_subgoal_then(@term_syntax.parse_term("real_of_num(0) <= Im(((P : Cart[Real, 2]) - (B : Cart[Real, 2])) / ((C : Cart[Real, 2]) - B))"))(@tactics.strip_assume_tac)
  let t291 = @simp.asm_simp_tac(@list.List([@simp.rewrite_rule(@list.List([@class.fun_eq_thm(), @trivia.i_thm(), @trivia.o_thm()]))(reflect_across_compose_involution())]))
  let t290 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm(), reflect_across_sym()]))
  let t289 = @simp.asm_simp_tac(@list.List([@equal.gsym(reflect_across_compose_angle())]))
  let t288 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(3) * (real_of_num(2) * ((a : Real) / real_of_num(3))) == real_of_num(2) * a"))]))
  let t287 = @tactics.map_every(fn(x284 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s285 = @simp.expand_tac(x284)
    fn(x286 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s285(x286)
    }
  }, @list.List(["a", "b", "c"]))
  let t283 = @simp.rewrite_tac(@list.List([iter_rotate_about()]))
  let t292 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x280 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s281 = @simp.expand_tac(x280)
    fn(x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s281(x282)
    }
  }, @list.List(["g1", "g2", "g3"])), t283), t287), t288), t289), t290), t291), @tactics.all_tac])
  let t279 = cyclic_perm_subgoal_then(@term_syntax.parse_term("o(ITER(3, (g1 : (Cart[Real, 2]) -> Cart[Real, 2])), o(ITER(3, (g2 : (Cart[Real, 2]) -> Cart[Real, 2])), ITER(3, (g3 : (Cart[Real, 2]) -> Cart[Real, 2])))) == I"))(fn(x276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s277 = @tactics.assume_tac(x276)
    fn(x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s277(x278)
    }
  })
  let t275 = @simp.abbrev_tac(@term_syntax.parse_term("(g3 : (Cart[Real, 2]) -> Cart[Real, 2]) == rotate_about((C : Cart[Real, 2]), real_of_num(2) * (c : Real))"))
  let t274 = @simp.abbrev_tac(@term_syntax.parse_term("(g2 : (Cart[Real, 2]) -> Cart[Real, 2]) == rotate_about((B : Cart[Real, 2]), real_of_num(2) * (b : Real))"))
  let t273 = @simp.abbrev_tac(@term_syntax.parse_term("(g1 : (Cart[Real, 2]) -> Cart[Real, 2]) == rotate_about((A : Cart[Real, 2]), real_of_num(2) * (a : Real))"))
  let t272 = @simp.abbrev_tac(@term_syntax.parse_term("(c : Real) == angle(((B : Cart[Real, 2]), (C : Cart[Real, 2]), (A : Cart[Real, 2]))) / real_of_num(3)"))
  let t271 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Real) == angle(((A : Cart[Real, 2]), (B : Cart[Real, 2]), (C : Cart[Real, 2]))) / real_of_num(3)"))
  let t270 = @simp.abbrev_tac(@term_syntax.parse_term("(a : Real) == angle(((C : Cart[Real, 2]), (A : Cart[Real, 2]), (B : Cart[Real, 2]))) / real_of_num(3)"))
  let t269 = @tactics.first_assum(fn(x264 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x264
    let th_p = @simp.gen_rewrite_rule(fn(x266 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x266
    }, @list.List([real_le_im_div_cyclic()]))(th)
    let th_p_p = @simp.gen_rewrite_rule(fn(x267 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x267
    }, @list.List([real_le_im_div_cyclic()]))(th_p)
    let t268 = @tactics.assume_tac(th_p_p)
    @tactics.then_tac(@tactics.assume_tac(th_p), t268)
  })
  let t261 = @term_syntax.parse_term("(B : Cart[Real, 2]) == (C : Cart[Real, 2])")
  let t262 = @term_syntax.parse_term("(A : Cart[Real, 2]) == (C : Cart[Real, 2])")
  let t263 = @tactics.map_every(fn(x258 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x258
    let t260 = @list.List([@simp.asm_rewrite_tac(@list.List([@vectors.collinear_2(), @sets.insert_ac()])), @tactics.all_tac])
    @tactics.thenl(@class.asm_cases_tac(t), t260)
  }, @list.List([@term_syntax.parse_term("(A : Cart[Real, 2]) == (B : Cart[Real, 2])"), t262, t261]))
  let t257 = @tactics.repeat_tac(@tactics.gen_tac)
  let t256 = @tactics.repeat_tac(@tactics.gen_tac)
  let t253 = @meson.meson_tac(@list.List([]))
  let t252 = @simp.rewrite_tac(@list.List([@geom.angle_sym(), @vectors.dist_sym(), @sets.insert_ac()]))
  let t246 = @term_syntax.parse_term("(Q : Cart[Real, 2])")
  let t247 = @term_syntax.parse_term("(R : Cart[Real, 2])")
  let t248 = @list.List([@term_syntax.parse_term("(P : Cart[Real, 2])"), t247, t246])
  let t251 = @tactics.first_x_assum(fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s244 = @tactics.mp_tac(x243)
      fn(x245 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s244(x245)
      }
    })(((x249 : @kernel.Thm) => @bool.specl(t248, x249))(x250))
  })
  let t242 = @simp.rewrite_tac(@list.List([@geom.angle_sym(), @vectors.dist_sym(), @sets.insert_ac()]))
  let t239 = @term_syntax.parse_term("(R : Cart[Real, 2])")
  let t240 = @term_syntax.parse_term("(Q : Cart[Real, 2])")
  let t241 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(P : Cart[Real, 2])"), t240, t239]))
  let t254 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t241), t242), t251), t252), t253)
  let t238 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_div()]))
  let t237 = @simp.gen_rewrite_tac(fn(x234 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s235 = @equal.rand_conv(x234)
    fn(x236 : @kernel.Term) -> @kernel.Thm raise {
      s235(x236)
    }
  }, @list.List([@equal.gsym(@complexes.im_complex_inv_le_0())]))
  let t255 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t237), t238), @calc_rat.real_arith_tac), t254, @tactics.all_tac])
  let t233 = @tactics.repeat_tac(@tactics.conj_tac)
  let t451 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], real_of_num(0) <= Im((C - A) / (B - A)) || real_of_num(0) <= Im((B - A) / (C - A))) && (∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], (Property : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]) -> Bool)(A, B, C) → Property(A, C, B)) && (∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], real_of_num(0) <= Im((C - A) / (B - A)) → Property(A, B, C)) → (∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], Property(A, B, C))"))), t233), t255), t256), @tactics.disch_tac), t257), t263), @tactics.strip_tac), t269), t270), t271), t272), t273), t274), t275), t279), t292), t293), t312), t313), t337), t338), t344), t348), t408), t417), t418), t432), t438), t439), t440), t441), t442), t448), t449), t450)
  morley_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ P : Cart[Real, 2], ∀ Q : Cart[Real, 2], ∀ R : Cart[Real, 2], !collinear({A, B, C}) && SUBSET({P, Q, R}, hull(convex, {A, B, C})) && angle((A, B, R)) == angle((A, B, C)) / real_of_num(3) && angle((B, A, R)) == angle((B, A, C)) / real_of_num(3) && angle((B, C, P)) == angle((B, C, A)) / real_of_num(3) && angle((C, B, P)) == angle((C, B, A)) / real_of_num(3) && angle((C, A, Q)) == angle((C, A, B)) / real_of_num(3) && angle((A, C, Q)) == angle((A, C, B)) / real_of_num(3) → distance((R, P)) == distance((P, Q)) && distance((Q, R)) == distance((P, Q))"), t451))
}

///|
let morley_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MORLEY")

///|
/// `MORLEY`
pub fn morley() -> @kernel.Thm {
  morley_c.get()
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
}
