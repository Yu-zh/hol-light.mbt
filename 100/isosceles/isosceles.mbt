// Translated from upstream 100/isosceles.ml; edit this file directly.

///|
/// ISOSCELES_TRIANGLE_THEOREM
fn step_1() -> Unit raise {
  let t2 = @meson.meson_tac(@list.List([@vectors.dist_sym(), @geom.angle_sym()]))
  let t1 = @term_syntax.parse_type("M")
  let t3 = @tactics.then_tac(@tactics.mp_tac(@kernel.inst_type(@list.List([(@term_syntax.parse_type("N"), t1)]), @geom.congruent_triangles_sss())), t2)
  isosceles_triangle_theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], distance((A, C)) == distance((B, C)) → angle((C, A, B)) == angle((A, B, C))"), t3))
}

///|
let isosceles_triangle_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOSCELES_TRIANGLE_THEOREM")

///|
/// `ISOSCELES_TRIANGLE_THEOREM`
pub fn isosceles_triangle_theorem() -> @kernel.Thm {
  isosceles_triangle_theorem_c.get()
}

///|
/// ISOSCELES_TRIANGLE_CONVERSE
fn step_2() -> Unit raise {
  let t5 = @meson.meson_tac(@list.List([@vectors.dist_sym(), @geom.angle_sym()]))
  let t4 = @term_syntax.parse_type("M")
  let t6 = @tactics.then_tac(@tactics.mp_tac(@kernel.inst_type(@list.List([(@term_syntax.parse_type("N"), t4)]), @geom.congruent_triangles_asa_full())), t5)
  isosceles_triangle_converse_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], angle((C, A, B)) == angle((A, B, C)) && !collinear({A, B, C}) → distance((A, C)) == distance((B, C))"), t6))
}

///|
let isosceles_triangle_converse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOSCELES_TRIANGLE_CONVERSE")

///|
/// `ISOSCELES_TRIANGLE_CONVERSE`
pub fn isosceles_triangle_converse() -> @kernel.Thm {
  isosceles_triangle_converse_c.get()
}

///|
/// lemma
fn step_3() -> Unit raise {
  let t27 = @meson.asm_meson_tac(@list.List([@geom.angle_eq_pi_others(), @geom.between_angle()]))
  let t26 = @simp.rewrite_tac(@list.List([@vectors.vector_neg_sub(), @equal.gsym(@geom.angle())]))
  let t25 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@geom.vector_angle_neg2())]))
  let t24 = @tactics.match_mp_tac(@geom.vector_angle_eq_0_right())
  let t23 = @simp.rewrite_tac(@list.List([@geom.angle()]))
  let t22 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (z : Real) → x + (y : Real) == (p : Real) → (z == p / real_of_num(2)) == (x == p / real_of_num(2) && y == p / real_of_num(2))")))
  let t21 = @simp.asm_rewrite_tac(@list.List([@geom.orthogonal_vector_angle()]))
  let t17 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t18 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t19 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t20 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t19, t18, t17]), @geom.angles_along_line()))
  let t15 = @simp.rewrite_tac(@list.List([@geom.orthogonal_vector_angle(), @geom.angle()]))
  let t16 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.asm_simp_tac(@list.List([@geom.angle_refl()]))), t15), @tactics.all_tac])
  let t14 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t12 = @simp.rewrite_tac(@list.List([@vectors.vector_neg_sub(), @geom.orthogonal_vector_angle(), @geom.angle()]))
  let t11 = @simp.gen_rewrite_tac(fn(x8 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s9 = @equal.land_conv(x8)
    fn(x10 : @kernel.Term) -> @kernel.Thm raise {
      s9(x10)
    }
  }, @list.List([@equal.gsym(@vectors.orthogonal_lneg())]))
  let t13 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.asm_simp_tac(@list.List([@geom.angle_refl()]))), t11), t12), @tactics.all_tac])
  let t7 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (A : Cart[Real, N])"))
  let t28 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t7), t13), t14), t16), @tactics.disch_tac), t20), t21), t22), t23), t24), t25), t26), t27)
  lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], ∀ D : Cart[Real, N], between(D, (A, B)) → orthogonal(A - B, C - D) == (angle((A, D, C)) == pi / real_of_num(2) && angle((B, D, C)) == pi / real_of_num(2))"), t28))
}

///|
let lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma")

///|
/// `lemma`
pub fn lemma() -> @kernel.Thm {
  lemma_c.get()
}

///|
/// ISOSCELES_TRIANGLE_1
fn step_4() -> Unit raise {
  let t36 = @meson.asm_meson_tac(@list.List([@vectors.dist_sym(), @geom.angle_sym()]))
  let t35 = @simp.asm_rewrite_tac(@list.List([@vectors.dist_midpoint()]))
  let t29 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t30 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t31 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t32 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t33 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t34 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t33, t32, t31, t30, t29]), @geom.congruent_triangles_sss_full()))
  let t37 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t34), t35), t36)
  isosceles_triangle_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], ∀ D : Cart[Real, N], distance((A, C)) == distance((B, C)) && D == midpoint((A, B)) → angle((A, C, D)) == angle((B, C, D))"), t37))
}

///|
let isosceles_triangle_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOSCELES_TRIANGLE_1")

///|
/// `ISOSCELES_TRIANGLE_1`
pub fn isosceles_triangle_1() -> @kernel.Thm {
  isosceles_triangle_1_c.get()
}

///|
/// ISOSCELES_TRIANGLE_2
fn step_5() -> Unit raise {
  let t60 = @simp.asm_rewrite_tac(@list.List([]))
  let t56 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t57 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t58 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t59 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t58, t57, t56]), @geom.angles_along_line()))
  let t55 = @simp.asm_simp_tac(@list.List([lemma()]))
  let t54 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.dist_eq_0()])), @tactics.all_tac])
  let t53 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (A : Cart[Real, N])"))
  let t52 = @simp.asm_simp_tac(@list.List([@vectors.dist_eq_0(), @vectors.dist_refl(), @vectors.vector_sub_refl(), @vectors.orthogonal_0()]))
  let t51 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t50 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.dist_sym(), @geom.angle_sym()])), @tactics.all_tac])
  let t44 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t45 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t46 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t47 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t48 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t49 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : Cart[Real, N])"), t48, t47, t46, t45, t44]), @geom.congruent_triangles_sas_full()))
  let t41 = @drule.match_mp(isosceles_triangle_theorem())
  let t43 = @tactics.first_assum(fn(x42 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s39 = @tactics.assume_tac(x38)
      fn(x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s39(x40)
      }
    })(t41(x42))
  })
  let t61 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t43), t49), @tactics.ants_tac), t50), t51), t52), t53), t54), t55), t59), t60), @calc_rat.real_arith_tac)
  isosceles_triangle_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], ∀ D : Cart[Real, N], between(D, (A, B)) && distance((A, C)) == distance((B, C)) && angle((A, C, D)) == angle((B, C, D)) → orthogonal(A - B, C - D)"), t61))
}

///|
let isosceles_triangle_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOSCELES_TRIANGLE_2")

///|
/// `ISOSCELES_TRIANGLE_2`
pub fn isosceles_triangle_2() -> @kernel.Thm {
  isosceles_triangle_2_c.get()
}

///|
/// ISOSCELES_TRIANGLE_3
fn step_6() -> Unit raise {
  let t123 = @meson.asm_meson_tac(@list.List([@geom.angle_eq_pi_others(), @geom.between_angle()]))
  let t120 = @tactics.match_mp_tac(@geom.angle_eq_0_right())
  let t121 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x117 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s118 = @equal.rand_conv(x117)
    fn(x119 : @kernel.Term) -> @kernel.Thm raise {
      s118(x119)
    }
  }, @list.List([@geom.angle_sym()])), t120)
  let t122 = @list.List([@tactics.match_mp_tac(@geom.angle_eq_0_left()), t121])
  let t116 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t115 = @tactics.undisch_tac(@term_syntax.parse_term("angle(((C : Cart[Real, N]), (A : Cart[Real, N]), (B : Cart[Real, N]))) == angle((A, B, C))"))
  let t114 = @tactics.conv_tac(@equal.sym_conv)
  let t113 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@geom.angle_sym()]))])
  let t112 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == (a' : Real) && (b : Real) == (b' : Real) → a + ((x : Real) + b) == (p : Real) → a' + ((x' : Real) + b') == p → x' == x")))
  let t111 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.dist_eq_0()])), @tactics.all_tac])
  let t108 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t109 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t110 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, N])"), t109, t108]), @geom.triangle_angle_sum()))
  let t107 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.dist_eq_0()])), @tactics.all_tac])
  let t104 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t105 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t106 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t105, t104]), @geom.triangle_angle_sum()))
  let t103 = @simp.asm_rewrite_tac(@list.List([]))
  let t102 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@vectors.dist_sym()]))])
  let t96 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t97 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t98 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t99 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t100 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t101 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t100, t99, t98, t97, t96]), @geom.congruent_triangles_sas()))
  let t93 = @drule.match_mp(isosceles_triangle_theorem())
  let t95 = @tactics.first_assum(fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s91 = @tactics.assume_tac(x90)
      fn(x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s91(x92)
      }
    })(t93(x94))
  })
  let t89 = @simp.asm_simp_tac(@list.List([lemma(), @vectors.midpoint_collinear(), @vectors.between_imp_collinear()]))
  let t88 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s83 = @tactics.assume_tac(x82)
    fn(x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s83(x84)
    }
  }, fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s86 = @tactics.mp_tac(x85)
    fn(x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s86(x87)
    }
  }))
  let t80 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("((a : Real) == pow((x : Real), 2) + a) == (x == real_of_num(0))")), @vectors.dist_eq_0()]))
  let t79 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t78 = @simp.once_rewrite_tac(@list.List([@vectors.norm_sub()]))
  let t77 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.orthogonal_lneg(), @vectors.vector_neg_sub()])), @tactics.all_tac])
  let t74 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t75 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t76 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t75, t74]), @geom.pythagoras()))
  let t81 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.strip_tac), t76), @tactics.ants_tac), t77), t78), t79), t80), @tactics.all_tac])
  let t73 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t71 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("((a : Real) == pow((x : Real), 2) + a) == (x == real_of_num(0))")), @vectors.dist_eq_0()]))
  let t70 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t69 = @simp.once_rewrite_tac(@list.List([@vectors.norm_sub()]))
  let t68 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.orthogonal_lneg(), @vectors.vector_neg_sub()])), @tactics.all_tac])
  let t65 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t66 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t67 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, N])"), t66, t65]), @geom.pythagoras()))
  let t72 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.strip_tac), t67), @tactics.ants_tac), t68), t69), t70), t71), @tactics.all_tac])
  let t64 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (A : Cart[Real, N])"))
  let t63 = @simp.asm_simp_tac(@list.List([@vectors.between_refl_eq(), @vectors.midpoint_refl()]))
  let t62 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t124 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t62), t63), t64), t72), t73), t81), t88), t89), @tactics.strip_tac), t95), t101), @tactics.ants_tac), t102), t103), t106), @tactics.ants_tac), t107), t110), @tactics.ants_tac), t111), t112), @tactics.conj_tac), t113), t114), t115), t116), @tactics.binop_tac), t122), t123)
  isosceles_triangle_3_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], ∀ D : Cart[Real, N], between(D, (A, B)) && distance((A, C)) == distance((B, C)) && orthogonal(A - B, C - D) → D == midpoint((A, B))"), t124))
}

///|
let isosceles_triangle_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOSCELES_TRIANGLE_3")

///|
/// `ISOSCELES_TRIANGLE_3`
pub fn isosceles_triangle_3() -> @kernel.Thm {
  isosceles_triangle_3_c.get()
}

///|
/// ISOSCELES_TRIANGLE_4
fn step_7() -> Unit raise {
  let t141 = @simp.rewrite_tac(@list.List([@vectors.dist_midpoint()]))
  let t140 = @simp.expand_tac("D")
  let t139 = @simp.asm_rewrite_tac(@list.List([]))
  let t137 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t138 = @tactics.map_every(fn(x134 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s135 = @tactics.exists_tac(x134)
    fn(x136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s135(x136)
    }
  }, @list.List([@term_syntax.parse_term("(D : Cart[Real, N])"), t137]))
  let t133 = @tactics.match_mp_tac(@geom.congruent_triangles_sas())
  let t132 = @tactics.repeat_tac(@tactics.disch_tac)
  let t131 = @simp.asm_rewrite_tac(@list.List([]))
  let t130 = @tactics.disch_then(fn(x129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s127 = @tactics.assume_tac(x126)
      fn(x128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s127(x128)
      }
    })(@equal.sym(x129))
  })
  let t125 = @simp.asm_simp_tac(@list.List([@theorems.imp_conj(), @vectors.between_midpoint(), lemma()]))
  let t142 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t125), t130), t131), t132), t133), t138), t139), t140), t141)
  isosceles_triangle_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], ∀ D : Cart[Real, N], D == midpoint((A, B)) && orthogonal(A - B, C - D) → distance((A, C)) == distance((B, C))"), t142))
}

///|
let isosceles_triangle_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOSCELES_TRIANGLE_4")

///|
/// `ISOSCELES_TRIANGLE_4`
pub fn isosceles_triangle_4() -> @kernel.Thm {
  isosceles_triangle_4_c.get()
}

///|
/// ISOSCELES_TRIANGLE_5
fn step_8() -> Unit raise {
  let t223 = @simp.asm_rewrite_tac(@list.List([]))
  let t222 = @simp.once_rewrite_tac(@list.List([@geom.angle_sym()]))
  let t221 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@vectors.dist_sym()]))])
  let t215 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t216 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t217 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t218 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t219 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t220 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : Cart[Real, N])"), t219, t218, t217, t216, t215]), @geom.congruent_triangles_asa_full()))
  let t214 = @tactics.repeat_tac(@tactics.disch_tac)
  let t213 = @simp.asm_simp_tac(@list.List([@theorems.imp_conj(), lemma()]))
  let t211 = @tactics.mp_tac(@transcendentals.pi_nz())
  let t208 = @drule.match_mp(@geom.angle_eq_pi_others())
  let t210 = @tactics.disch_then(fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s206 = @tactics.mp_tac(x205)
      fn(x207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s206(x207)
      }
    })(t208(x209))
  })
  let t204 = @simp.asm_simp_tac(@list.List([@geom.angle_refl_mid(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) == (x : Real) / real_of_num(2)) == (x == real_of_num(0))")), @transcendentals.pi_nz()]))
  let t203 = @simp.asm_rewrite_tac(@list.List([]))
  let t202 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (A : Cart[Real, N])"))
  let t201 = @simp.asm_rewrite_tac(@list.List([]))
  let t200 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t197 = @simp.gen_rewrite_rule(fn(x196 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x196
  }, @list.List([@geom.between_angle()]))
  let t199 = @tactics.first_assum(fn(x198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s194 = @tactics.mp_tac(x193)
      fn(x195 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s194(x195)
      }
    })(t197(x198))
  })
  let t192 = @simp.asm_rewrite_tac(@list.List([@geom.angle_refl()]))
  let t212 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s187 = @tactics.assume_tac(x186)
    fn(x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s187(x188)
    }
  }, fn(x189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s190 = @tactics.mp_tac(x189)
    fn(x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s190(x191)
    }
  })), t192), t199), t200), t201), t202), t203), t204), t210), t211), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t185 = @class.asm_cases_tac(@term_syntax.parse_term("(C : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t183 = @tactics.mp_tac(@transcendentals.pi_nz())
  let t180 = @drule.match_mp(@geom.angle_eq_pi_others())
  let t182 = @tactics.disch_then(fn(x181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s178 = @tactics.mp_tac(x177)
      fn(x179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s178(x179)
      }
    })(t180(x181))
  })
  let t176 = @simp.asm_simp_tac(@list.List([@geom.angle_refl_mid(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) / real_of_num(2) == real_of_num(0)) == (x == real_of_num(0))")), @transcendentals.pi_nz()]))
  let t175 = @simp.asm_rewrite_tac(@list.List([]))
  let t174 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t173 = @simp.asm_rewrite_tac(@list.List([]))
  let t172 = @class.asm_cases_tac(@term_syntax.parse_term("(D : Cart[Real, N]) == (A : Cart[Real, N])"))
  let t169 = @simp.gen_rewrite_rule(fn(x168 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x168
  }, @list.List([@geom.between_angle()]))
  let t171 = @tactics.first_assum(fn(x170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s166 = @tactics.mp_tac(x165)
      fn(x167 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s166(x167)
      }
    })(t169(x170))
  })
  let t164 = @simp.asm_rewrite_tac(@list.List([@geom.angle_refl()]))
  let t184 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s159 = @tactics.assume_tac(x158)
    fn(x160 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s159(x160)
    }
  }, fn(x161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s162 = @tactics.mp_tac(x161)
    fn(x163 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s162(x163)
    }
  })), t164), t171), t172), t173), t174), t175), t176), t182), t183), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t157 = @class.asm_cases_tac(@term_syntax.parse_term("(C : Cart[Real, N]) == (A : Cart[Real, N])"))
  let t156 = @simp.asm_rewrite_tac(@list.List([]))
  let t155 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t153 = @equal.gsym(@theorems.conj_assoc())
  let t154 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.imp_conj_alt()), t153]))
  let t152 = @tactics.undisch_tac(@term_syntax.parse_term("!((C : Cart[Real, N]) == (D : Cart[Real, N]))"))
  let t151 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s146 = @tactics.assume_tac(x145)
    fn(x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s146(x147)
    }
  }, fn(x148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s149 = @tactics.mp_tac(x148)
    fn(x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s149(x150)
    }
  }))
  let t144 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.insert_ac(), @vectors.collinear_2()])), @tactics.all_tac])
  let t143 = @class.asm_cases_tac(@term_syntax.parse_term("(C : Cart[Real, N]) == (D : Cart[Real, N])"))
  let t224 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t143), t144), t151), t152), t154), t155), t156), t157), t184), t185), t212), t213), t214), t220), @tactics.ants_tac), t221), t222), t223)
  isosceles_triangle_5_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], ∀ D : Cart[Real, N], !collinear({D, C, A}) && between(D, (A, B)) && angle((A, C, D)) == angle((B, C, D)) && orthogonal(A - B, C - D) → distance((A, C)) == distance((B, C))"), t224))
}

///|
let isosceles_triangle_5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOSCELES_TRIANGLE_5")

///|
/// `ISOSCELES_TRIANGLE_5`
pub fn isosceles_triangle_5() -> @kernel.Thm {
  isosceles_triangle_5_c.get()
}

///|
/// ISOSCELES_TRIANGLE_6
fn step_9() -> Unit raise {
  let t290 = @meson.meson_tac(@list.List([@vectors.vector_mul_assoc()]))
  let t289 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("vector_sub(op_pct(real_inv(real_of_num(2)), vector_add((A : Cart[Real, _]), (B : Cart[Real, _]))), A) == op_pct(real_inv(real_of_num(2)), vector_sub(B, A))"))]))
  let t288 = @simp.rewrite_tac(@list.List([@vectors.midpoint()]))
  let t287 = @simp.expand_tac("D")
  let t286 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_sub_eq()]))
  let t285 = @simp.rewrite_tac(@list.List([@vectors.collinear_lemma()]))
  let t284 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t283 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(bd : _), (c : _), (a : _)} == {c, a, bd}"))]))
  let t282 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((q : Bool) → (p : Bool)) → !p → q → (r : Bool)")))
  let t281 = @tactics.undisch_tac(@term_syntax.parse_term("!collinear({(D : Cart[Real, N]), (C : Cart[Real, N]), (A : Cart[Real, N])})"))
  let t280 = @simp.asm_rewrite_tac(@list.List([]))
  let t277 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t278 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t279 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, N])"), t278, t277]), @geom.collinear_angle()))
  let t276 = @simp.asm_rewrite_tac(@list.List([@transcendentals.pi_nz()]))
  let t275 = @simp.asm_rewrite_tac(@list.List([@geom.angle_refl(), @calc_rat.real_arith(@term_syntax.parse_term("((p : Real) / real_of_num(2) == real_of_num(0)) == (p == real_of_num(0))"))]))
  let t273 = @term_syntax.parse_term("(A : Cart[Real, N]) == (C : Cart[Real, N])")
  let t274 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(B : Cart[Real, N]) == (C : Cart[Real, N])"), t273]))
  let t272 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (pi - a + (x : Real)) == pi) == (x == real_of_num(0))"))]))
  let t270 = @meson.meson_tac(@list.List([@geom.angle_eq_pi_others()]))
  let t269 = @simp.asm_rewrite_tac(@list.List([]))
  let t268 = @simp.rewrite_tac(@list.List([@vectors.midpoint_eq_endpoint()]))
  let t267 = @simp.expand_tac("D")
  let t266 = @simp.asm_rewrite_tac(@list.List([@geom.between_angle()]))
  let t264 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t265 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t264]), @vectors.between_midpoint()))
  let t263 = @tactics.match_mp_tac(@geom.angle_eq_0_left())
  let t271 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @simp.gen_rewrite_tac(fn(x260 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s261 = @equal.land_conv(x260)
    fn(x262 : @kernel.Term) -> @kernel.Thm raise {
      s261(x262)
    }
  }, @list.List([@geom.angle_sym()]))), t263), t265), t266), t267), t268), t269), t270), @tactics.all_tac])
  let t258 = @tactics.conjuncts_then(fn(x255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s256 = @tactics.subst1_tac(x255)
    fn(x257 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s256(x257)
    }
  })
  let t259 = @tactics.subgoal_then(@term_syntax.parse_term("angle(((A : Cart[Real, N]), (B : Cart[Real, N]), (C : Cart[Real, N]))) == angle((C, B, (D : Cart[Real, N]))) && angle((B, A, C)) == angle((C, A, D))"), t258)
  let t254 = @simp.asm_rewrite_tac(@list.List([]))
  let t252 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t253 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t291 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t253, t252]), @geom.triangle_angle_sum())), t254), t259), t271), t272), t274), t275), t276), @tactics.disch_tac), t279), t280), t281), t282), t283), t284), t285), t286), t287), t288), t289), t290)
  let t251 = @simp.asm_rewrite_tac(@list.List([]))
  let t250 = @simp.once_rewrite_tac(@list.List([@geom.angle_sym()]))
  let t249 = @simp.asm_rewrite_tac(@list.List([]))
  let t248 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@vectors.dist_sym()]))])
  let t243 = @term_syntax.parse_term("(B : Cart[Real, N])")
  let t244 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t245 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t246 = @term_syntax.parse_term("(A : Cart[Real, N])")
  let t247 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t292 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : Cart[Real, N])"), t247, t246, t245, t244, t243]), @geom.congruent_triangles_aas())), @tactics.ants_tac), t248), t249), t250), t251), t291])
  let t242 = @simp.asm_simp_tac(@list.List([@real.real_eq_mul_rcancel(), @real.real_lt_imp_nz(), @misc.real_half(), @vectors.dist_pos_lt(), @geom.sin_angle_eq()]))
  let t241 = @simp.rewrite_tac(@list.List([@vectors.dist_midpoint()]))
  let t240 = @simp.expand_tac("D")
  let t239 = @tactics.disch_then(fn(x236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s237 = @tactics.subst1_tac(x236)
    fn(x238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s237(x238)
    }
  })
  let t235 = @simp.asm_rewrite_tac(@list.List([]))
  let t232 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t233 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t234 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(B : Cart[Real, N])"), t233, t232]), @geom.law_of_sines()))
  let t229 = @term_syntax.parse_term("(D : Cart[Real, N])")
  let t230 = @term_syntax.parse_term("(C : Cart[Real, N])")
  let t231 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : Cart[Real, N])"), t230, t229]), @geom.law_of_sines()))
  let t228 = @simp.asm_rewrite_tac(@list.List([]))
  let t227 = @class.asm_cases_tac(@term_syntax.parse_term("(A : Cart[Real, N]) == (B : Cart[Real, N])"))
  let t226 = @tactics.disch_then(fn(x225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x225))
  })
  let t293 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t226), t227), t228), t231), t234), t235), t239), t240), t241), t242), @tactics.strip_tac), t292)
  isosceles_triangle_6_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], ∀ D : Cart[Real, N], !collinear({D, C, A}) && D == midpoint((A, B)) && angle((A, C, D)) == angle((B, C, D)) → distance((A, C)) == distance((B, C))"), t293))
}

///|
let isosceles_triangle_6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOSCELES_TRIANGLE_6")

///|
/// `ISOSCELES_TRIANGLE_6`
pub fn isosceles_triangle_6() -> @kernel.Thm {
  isosceles_triangle_6_c.get()
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
}
