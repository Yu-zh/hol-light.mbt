// Translated from upstream Multivariate/wlog_examples.ml; edit this file directly.

///|
/// lemma
fn step_1() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@real.sqrt_pow_2(), @realarith.real_le_square(), @realarith.real_pow_2()]))
  lemma_v1_c.set(@tactics.prove(@term_syntax.parse_term("(∃ y : Real, pow(y, 2) == (a : Real)) == (real_of_num(0) <= a)"), t1))
}

///|
let lemma_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma")

///|
/// `lemma`
pub fn lemma_v1() -> @kernel.Thm {
  lemma_v1_c.get()
}

///|
/// TRUONG_1
fn step_2() -> Unit raise {
  let t54 = @drule.match_mp(@realax.real_le_mul())
  let t56 = @tactics.disch_then(fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s52 = @tactics.mp_tac(x51)
      fn(x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s52(x53)
      }
    })(t54(x55))
  })
  let t50 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t49 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t46 = @drule.match_mp(@realarith.real_lt_imp_le())
  let t48 = @tactics.disch_then(fn(x47 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x43 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s44 = @tactics.mp_tac(x43)
      fn(x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s44(x45)
      }
    })(t46(x47))
  })
  let t41 = @term_syntax.parse_term("pow((a : Real) - (b : Real), 2) < (u : Real) * u")
  let t42 = @tactics.map_every(fn(x38 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s39 = @tactics.undisch_tac(x38)
    fn(x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s39(x40)
    }
  }, @list.List([@term_syntax.parse_term("(u : Real) * u <= pow((a : Real) + (b : Real), 2)"), t41]))
  let t37 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_mul()), @real.real_le_square_abs()]))
  let t36 = @simp.asm_simp_tac(@list.List([@real.real_abs_div(), @real.real_le_ldiv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("!((u : Real) == real_of_num(0)) → real_of_num(0) < abs(real_of_num(2) * u)"))]))
  let t35 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_le_square_abs())]))
  let t34 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_le(), @calc_rat.real_field(@term_syntax.parse_term("(pow((u : Real), 2) + ((a : Real) - (b : Real))) / (real_of_num(2) * u) - u == (a - b - pow(u, 2)) / (real_of_num(2) * u)"))]))
  let t33 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.unwind_thm2(), lemma_v1()]))
  let t32 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((u : Real) == real_of_num(0)) → ((x : Real) * x + (y : Real) * y == pow((a : Real), 2) && (x - u) * (x - u) + y * y == pow((b : Real), 2)) == (x == (pow(u, 2) + (pow(a, 2) - pow(b, 2))) / (real_of_num(2) * u) && pow(y, 2) == pow(b, 2) - pow(x - u, 2))"))]))
  let t31 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && a && b) == (a && b)"))]))
  let t30 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + -(y : Real) * -y == x + y * y"))]))
  let t29 = @simp.abbrev_tac(@term_syntax.parse_term("(u : Real) == op_dollar((u2 : Cart[Real, 2]), 1)"))
  let t28 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.left_exists_and_thm(), @theorems.exists_refl()]))
  let t27 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((a : Real) == real_of_num(0)) → ((u : Real) + (v : Real) == real_of_num(1) && (b : Real) == v * a) == (u == real_of_num(1) - b / a && v == b / a)"))]))
  let t26 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realax.real_add_lid(), @calc_int.real_add_rinv()]))
  let t25 = @simp.simp_tac(@list.List([@convex.affine_hull_2(), @sets.in_elim_thm(), @cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_2(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @calc_num.arith()]))
  let t24 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ x : _, ∃ y : Real, (P : (_, Real, _, Real) -> Bool)(x, y, x, -y)) → (∃ x : _, ∃ y : Real, ∃ x' : _, ∃ y' : Real, P(x, y, x', y'))")))
  let t23 = @simp.rewrite_tac(@list.List([@vectors.exists_vector_2()]))
  let t22 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x18 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s19 = @tactics.assume_tac(x18)
      fn(x20 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s19(x20)
      }
    })(@equal.gsym(x21))
  }, @tactics.strip_assume_tac))
  let t17 = @simp.asm_simp_tac(@list.List([@vectors.dot_2(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid(), @cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @convex.affine_hull_2(), @cart.cart_eq(), @vectors.vector_mul_component(), @vectors.vector_sub_component(), @vectors.vec_component(), @calc_num.arith(), @sets.in_elim_thm(), @vectors.vector_add_component(), @real.real_sub_rzero(), @realax.real_add_lid(), @real.real_pow2_abs()]))
  let t16 = @simp.rewrite_tac(@list.List([@realax.real_gt(), @calc_rat.real_arith(@term_syntax.parse_term("!(abs((x : Real)) < real_of_num(0))"))]))
  let t15 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_gt()), @vectors.norm_gt_square(), @vectors.norm_eq_square(), @vectors.norm_le_square()]))
  let t14 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.vector_sub_rzero(), @vectors.vector_sub_lzero(), @vectors.norm_neg()]))
  let t12 = @term_syntax.parse_term("(b : Real)")
  let t13 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t12]))
  let t11 = @tactics.x_gen_tac(@term_syntax.parse_term("(u2 : Cart[Real, 2])"))
  let t9 = @term_syntax.parse_term("(u2 : Cart[Real, 2])")
  let t8 = @determinants.geom_origin_tac(@term_syntax.parse_term("(u1 : Cart[Real, 2])"))
  let t7 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t6 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t5 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.right_exists_and_thm()]))
  let t4 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t3 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t2 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) → (e : Bool)) == (c && a && b && d → e)"))]))
  let t57 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@wlog.geom_horizontal_plane_tac(@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)")), t2), t3), t4), t5), t6), @wlog.pad2d3d_tac), t7), t8), (x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @wlog.geom_horizontal_line_tac(t9, x10)), t11), @tactics.disch_tac), t13), t14), t15), t16), t17), t22), t23), t24), t25), t26), t27), t28), t29), t30), t31), t32), t33), t34), t35), t36), t37), t42), t48), t49), t50), t56), @calc_rat.real_arith_tac)
  truong_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ u1 : Cart[Real, 3], ∀ u2 : Cart[Real, 3], ∀ p : (Cart[Real, 3]) -> Bool, ∀ a : Real, ∀ b : Real, !(u1 == u2) && plane(p) && SUBSET({u1, u2}, p) && distance((u1, u2)) <= a + b && abs(a - b) < distance((u1, u2)) && real_of_num(0) <= a && real_of_num(0) <= b → (∃ d1 : Cart[Real, 3], ∃ d2 : Cart[Real, 3], SUBSET({d1, d2}, p) && IN(op_pct(real_of_num(1) / real_of_num(2), d1 + d2), hull(affine, {u1, u2})) && distance((d1, u1)) == a && distance((d1, u2)) == b && distance((d2, u1)) == a && distance((d2, u2)) == b)"), t57))
}

///|
let truong_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRUONG_1")

///|
/// `TRUONG_1`
pub fn truong_1() -> @kernel.Thm {
  truong_1_c.get()
}

///|
/// opposite
fn step_3() -> Unit raise {
  opposite_c.set(@pair.new_definition(@term_syntax.parse_term("(opposite : (Cart[Real, N], Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)((a : Cart[Real, N]), (b : Cart[Real, N]), (p : (Cart[Real, N]) -> Bool)) == (IN(op_pct(real_of_num(1) / real_of_num(2), a + b), p) && (∀ x : Cart[Real, N], ∀ y : Cart[Real, N], SUBSET({x, y}, p) → dot(x - y, a - b) == real_of_num(0)))")))
}

///|
let opposite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("opposite")

///|
/// `opposite`
pub fn opposite() -> @kernel.Thm {
  opposite_c.get()
}

///|
/// OPPOSITE_TRANSLATION_EQ
fn step_4() -> Unit raise {
  let t59 = @tactics.then_tac(@simp.rewrite_tac(@list.List([opposite()])), (x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_translate_tac(@list.List([]), x58))
  opposite_translation_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, _], ∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ p : (Cart[Real, _]) -> Bool, opposite(c + a, c + b, IMAGE((x : Cart[Real, _]) => c + x, p)) == opposite(a, b, p)"), t59))
}

///|
let opposite_translation_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPPOSITE_TRANSLATION_EQ")

///|
/// `OPPOSITE_TRANSLATION_EQ`
pub fn opposite_translation_eq() -> @kernel.Thm {
  opposite_translation_eq_c.get()
}

///|
/// Multivariate/wlog_examples.ml:125
fn step_5() -> Unit raise {
  @vectors.add_translation_invariants(@list.List([opposite_translation_eq()]))
}

///|
/// OPPOSITE_LINEAR_IMAGE_EQ
fn step_6() -> Unit raise {
  let t64 = @meson.meson_tac(@list.List([@vectors.preserves_norm_injective()]))
  let t63 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.linear_cmul()), @sets.in_image()]))
  let t61 = @equal.gsym(@vectors.linear_sub())
  let t62 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.linear_add()), t61, @vectors.orthogonal_linear_image_eq()]))
  let t60 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @sets.forall_in_image(), @theorems.right_forall_imp_thm()]))
  let t65 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([opposite(), @sets.insert_subset(), @sets.empty_subset(), @equal.gsym(@vectors.orthogonal())])), t60), t62), t63), t64)
  opposite_linear_image_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Cart[Real, _], ∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ p : (Cart[Real, _]) -> Bool, linear(f) && (∀ x : Cart[Real, _], norm(f(x)) == norm(x)) → opposite(f(a), f(b), IMAGE(f, p)) == opposite(a, b, p)"), t65))
}

///|
let opposite_linear_image_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPPOSITE_LINEAR_IMAGE_EQ")

///|
/// `OPPOSITE_LINEAR_IMAGE_EQ`
pub fn opposite_linear_image_eq() -> @kernel.Thm {
  opposite_linear_image_eq_c.get()
}

///|
/// Multivariate/wlog_examples.ml:136
fn step_7() -> Unit raise {
  @vectors.add_linear_invariants(@list.List([opposite_linear_image_eq()]))
}

///|
/// AFFINE_PLANE
fn step_8() -> Unit raise {
  let t66 = @simp.simp_tac(@list.List([@wlog.plane(), @theorems.left_imp_exists_thm(), @convex.affine_affine_hull()]))
  affine_plane_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, _]) -> Bool, plane(p) → affine(p)"), t66))
}

///|
let affine_plane_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFINE_PLANE")

///|
/// `AFFINE_PLANE`
pub fn affine_plane() -> @kernel.Thm {
  affine_plane_c.get()
}

///|
/// lemma
fn step_9() -> Unit raise {
  let t73 = @simp.asm_simp_tac(@list.List([@real.real_lt_imp_nz(), @real.real_div_rmul(), @real.real_le_ldiv_eq(), @real.real_le_rdiv_eq()]))
  let t72 = @tactics.exists_tac(@term_syntax.parse_term("-op_dollar((a : Cart[Real, 2]), 2) / (op_dollar((b : Cart[Real, 2]), 2) - op_dollar(a, 2))"))
  let t71 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vector_sub_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t74 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.convex_hull_2_alt(), @sets.exists_in_gspec()])), t71), t72), t73), @calc_rat.asm_real_arith_tac)
  let t70 = @simp.asm_simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()]))
  let t75 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(a : Cart[Real, 2])")), t70), t74])
  let t67 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= real_of_num(0) && real_of_num(0) <= (b : Real) → a == real_of_num(0) && b == real_of_num(0) || real_of_num(0) < b - a")))
  let t69 = @tactics.first_assum(fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t67(x68))
  })
  let t76 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t69), t75)
  lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], op_dollar(a, 2) <= real_of_num(0) && real_of_num(0) <= op_dollar(b, 2) → (∃ x : Cart[Real, 2], IN(x, hull(convex, {a, b})) && op_dollar(x, 2) == real_of_num(0))"), t76))
}

///|
let lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma")

///|
/// `lemma`
pub fn lemma() -> @kernel.Thm {
  lemma_c.get()
}

///|
/// TRUONG_OPPOSITE_LEMMA
fn step_10() -> Unit raise {
  let t123 = @meson.meson_tac(@list.List([lemma(), @sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _)} == {b, a}"))]))
  let t120 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(b' : Real) == -(b : Real) → (∀ a : Real, a <= real_of_num(0) && real_of_num(0) <= b || a <= real_of_num(0) && real_of_num(0) <= b' || b <= real_of_num(0) && real_of_num(0) <= a || b' <= real_of_num(0) && real_of_num(0) <= a)")))
  let t117 = @term_syntax.parse_term("op_dollar((a : Cart[Real, 2]), 2)")
  let t122 = @tactics.first_assum(fn(x121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s115 = @tactics.mp_tac(x114)
        fn(x116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s115(x116)
        }
      })(((x118 : @kernel.Thm) => @bool.spec(t117, x118))(x119))
    })(t120(x121))
  })
  let t113 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t112 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("!(INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {}) == (∃ x : _, IN(x, s) && IN(x, t))"))]))
  let t111 = @tactics.repeat_tac(@tactics.strip_tac)
  let t110 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @calc_rat.real_arith(@term_syntax.parse_term("(inv(real_of_num(2)) * ((x : Real) + (y : Real)) == real_of_num(0)) == (y == -x)"))]))
  let t106 = @simp.asm_rewrite_tac(@list.List([]))
  let t107 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t106), @calc_rat.real_arith_tac)
  let t105 = @simp.asm_simp_tac(@list.List([@cart.cart_eq(), @vectors.vector_mul_component(), @cart.dimindex_2(), @calc_num.arith(), @vectors.forall_2(), @calc_int.real_mul_rzero(), @real.real_div_rmul()]))
  let t108 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_add_lid()])), t105), t107])
  let t104 = @tactics.subgoal_then(@term_syntax.parse_term("(u : Cart[Real, 2]) == op_pct(real_of_num(1) - op_dollar(u, 1) / op_dollar((y : Cart[Real, 2]), 1), vec(0)) + op_pct(op_dollar(u, 1) / op_dollar(y, 1), y)"), fn(x101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s102 = @tactics.subst1_tac(x101)
    fn(x103 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s102(x103)
    }
  })
  let t100 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, 2])"))
  let t99 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_gspec()]))
  let t98 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)"))
  let t97 = @simp.asm_simp_tac(@list.List([@vectors.vec_component(), @cart.dimindex_2(), @calc_num.arith(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid()]))
  let t96 = @simp.rewrite_tac(@list.List([@convex.affine(), @sets.insert_subset(), @sets.empty_subset(), @sets.in_elim_thm()]))
  let t109 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_unique()), t96), t97), t98), @tactics.strip_tac), t99), t100), @tactics.disch_tac), t104), t108), @tactics.all_tac])
  let t95 = @tactics.subgoal_then(@term_syntax.parse_term("hull(affine, {vec(0), (y : Cart[Real, 2])}) == {(u : Cart[Real, 2]) | op_dollar(u, 2) == real_of_num(0)}"), fn(x92 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s93 = @tactics.subst1_tac(x92)
    fn(x94 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s93(x94)
    }
  })
  let t91 = @simp.simp_tac(@list.List([@vectors.midpoint(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t90 = @tactics.disch_then(fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x86 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s87 = @tactics.assume_tac(x86)
      fn(x88 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s87(x88)
      }
    })(@equal.gsym(x89))
  })
  let t85 = @simp.asm_simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vec_component()]))
  let t84 = @tactics.repeat_tac(@tactics.gen_tac)
  let t82 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t81 = @determinants.geom_origin_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t80 = @tactics.disch_then(fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t78 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t77 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t124 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@wlog.geom_horizontal_plane_tac(@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)")), t77), t78), t80), @wlog.pad2d3d_tac), t81), (x83 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @wlog.geom_horizontal_line_tac(t82, x83)), @tactics.gen_tac), @tactics.disch_tac), t84), t85), t90), t91), t95), t109), t110), t111), t112), t113), t122), t123)
  truong_opposite_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, 3]) -> Bool, ∀ a : Cart[Real, 3], ∀ b : Cart[Real, 3], ∀ bb : Cart[Real, 3], ∀ m : Cart[Real, 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], plane(p) && SUBSET({a, b, bb, m, x, y}, p) && !(x == y) && IN(m, hull(affine, {x, y})) && midpoint((b, bb)) == m → !(INTER(hull(convex, {a, b}), hull(affine, {x, y})) == {}) || !(INTER(hull(convex, {a, bb}), hull(affine, {x, y})) == {})"), t124))
}

///|
let truong_opposite_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRUONG_OPPOSITE_LEMMA")

///|
/// `TRUONG_OPPOSITE_LEMMA`
pub fn truong_opposite_lemma() -> @kernel.Thm {
  truong_opposite_lemma_c.get()
}

///|
/// TRUONG_OPPOSITE_THM
fn step_11() -> Unit raise {
  let t147 = @simp.asm_rewrite_tac(@list.List([]))
  let t144 = @simp.rewrite_rule(@list.List([@convex.affine()]))
  let t146 = @tactics.first_x_assum(fn(x145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t144(x145))
  })
  let t148 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.subst1_tac(@vectors.vector_arith(@term_syntax.parse_term("(bb : Cart[Real, 3]) == op_pct(-real_of_num(1), (b : Cart[Real, 3])) + op_pct(real_of_num(2), op_pct(real_of_num(1) / real_of_num(2), b + bb))")))), t146), t147), @calc_rat.real_arith_tac)
  let t143 = @simp.asm_simp_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t142 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t141 = @simp.asm_rewrite_tac(@list.List([]))
  let t140 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, {(x : Cart[Real, 3]), (y : Cart[Real, 3])})"))
  let t149 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, IN((x : _), t) && SUBSET(t, (s : (_) -> Bool)) → IN(x, s)"))), t140), t141), t142), t143), t148])
  let t139 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && (b → (a : Bool)) → a && b")))
  let t136 = @drule.match_mp(affine_plane())
  let t138 = @tactics.first_assum(fn(x137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x133 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s134 = @tactics.assume_tac(x133)
      fn(x135 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s134(x135)
      }
    })(t136(x137))
  })
  let t132 = @simp.asm_rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @vectors.midpoint()]))
  let t130 = @term_syntax.parse_term("op_pct(real_of_num(1) / real_of_num(2), (b : Cart[Real, 3]) + (bb : Cart[Real, 3]))")
  let t131 = @tactics.map_every(fn(x127 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s128 = @tactics.exists_tac(x127)
    fn(x129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s128(x129)
    }
  }, @list.List([@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)"), t130]))
  let t126 = @tactics.match_mp_tac(truong_opposite_lemma())
  let t125 = @tactics.repeat_tac(@tactics.strip_tac)
  let t150 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([opposite(), @sets.insert_subset(), @sets.empty_subset()])), t125), t126), t131), t132), @tactics.conj_tac), @list.List([@tactics.all_tac, @vectors.vector_arith_tac])), t138), t139), @tactics.conj_tac), t149)
  truong_opposite_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 3], ∀ b : Cart[Real, 3], ∀ bb : Cart[Real, 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ p : (Cart[Real, 3]) -> Bool, !(x == y) && plane(p) && SUBSET({a, b, x, y}, p) && opposite(b, bb, hull(affine, {x, y})) → !(INTER(hull(convex, {a, b}), hull(affine, {x, y})) == {}) || !(INTER(hull(convex, {a, bb}), hull(affine, {x, y})) == {})"), t150))
}

///|
let truong_opposite_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRUONG_OPPOSITE_THM")

///|
/// `TRUONG_OPPOSITE_THM`
pub fn truong_opposite_thm() -> @kernel.Thm {
  truong_opposite_thm_c.get()
}

///|
/// lin_combo
fn step_12() -> Unit raise {
  lin_combo_c.set(@pair.new_definition(@term_syntax.parse_term("(lin_combo : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Real) -> Cart[Real, N])((V : (Cart[Real, N]) -> Bool), (f : (Cart[Real, N]) -> Real)) == vsum(V, (v : Cart[Real, N]) => op_pct(f(v), v))")))
}

///|
let lin_combo_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lin_combo")

///|
/// `lin_combo`
pub fn lin_combo() -> @kernel.Thm {
  lin_combo_c.get()
}

///|
/// affsign
fn step_13() -> Unit raise {
  affsign_c.set(@pair.new_definition(@term_syntax.parse_term("(affsign : ((Real) -> Bool, (Cart[Real, A]) -> Bool, (Cart[Real, A]) -> Bool, Cart[Real, A]) -> Bool)((sgn : (Real) -> Bool), (s : (Cart[Real, A]) -> Bool), (t : (Cart[Real, A]) -> Bool), (v : Cart[Real, A])) == (∃ f : (Cart[Real, A]) -> Real, v == lin_combo(UNION(s, t), f) && (∀ w : Cart[Real, A], t(w) → sgn(f(w))) && sum(UNION(s, t), f) == real_of_num(1))")))
}

///|
let affsign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("affsign")

///|
/// `affsign`
pub fn affsign() -> @kernel.Thm {
  affsign_c.get()
}

///|
/// sgn_gt
fn step_14() -> Unit raise {
  sgn_gt_c.set(@pair.new_definition(@term_syntax.parse_term("(sgn_gt : (Real) -> Bool) == ((t : Real) => real_of_num(0) < t)")))
}

///|
let sgn_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sgn_gt")

///|
/// `sgn_gt`
pub fn sgn_gt() -> @kernel.Thm {
  sgn_gt_c.get()
}

///|
/// sgn_ge
fn step_15() -> Unit raise {
  sgn_ge_c.set(@pair.new_definition(@term_syntax.parse_term("(sgn_ge : (Real) -> Bool) == ((t : Real) => real_of_num(0) <= t)")))
}

///|
let sgn_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sgn_ge")

///|
/// `sgn_ge`
pub fn sgn_ge() -> @kernel.Thm {
  sgn_ge_c.get()
}

///|
/// sgn_lt
fn step_16() -> Unit raise {
  sgn_lt_c.set(@pair.new_definition(@term_syntax.parse_term("(sgn_lt : (Real) -> Bool) == ((t : Real) => t < real_of_num(0))")))
}

///|
let sgn_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sgn_lt")

///|
/// `sgn_lt`
pub fn sgn_lt() -> @kernel.Thm {
  sgn_lt_c.get()
}

///|
/// sgn_le
fn step_17() -> Unit raise {
  sgn_le_c.set(@pair.new_definition(@term_syntax.parse_term("(sgn_le : (Real) -> Bool) == ((t : Real) => t <= real_of_num(0))")))
}

///|
let sgn_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sgn_le")

///|
/// `sgn_le`
pub fn sgn_le() -> @kernel.Thm {
  sgn_le_c.get()
}

///|
/// aff_gt_def
fn step_18() -> Unit raise {
  aff_gt_def_c.set(@pair.new_definition(@term_syntax.parse_term("(aff_gt : ((Cart[Real, _]) -> Bool, (Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool) == affsign(sgn_gt)")))
}

///|
let aff_gt_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("aff_gt_def")

///|
/// `aff_gt_def`
pub fn aff_gt_def() -> @kernel.Thm {
  aff_gt_def_c.get()
}

///|
/// aff_ge_def
fn step_19() -> Unit raise {
  aff_ge_def_c.set(@pair.new_definition(@term_syntax.parse_term("(aff_ge : ((Cart[Real, _]) -> Bool, (Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool) == affsign(sgn_ge)")))
}

///|
let aff_ge_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("aff_ge_def")

///|
/// `aff_ge_def`
pub fn aff_ge_def() -> @kernel.Thm {
  aff_ge_def_c.get()
}

///|
/// aff_lt_def
fn step_20() -> Unit raise {
  aff_lt_def_c.set(@pair.new_definition(@term_syntax.parse_term("(aff_lt : ((Cart[Real, _]) -> Bool, (Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool) == affsign(sgn_lt)")))
}

///|
let aff_lt_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("aff_lt_def")

///|
/// `aff_lt_def`
pub fn aff_lt_def() -> @kernel.Thm {
  aff_lt_def_c.get()
}

///|
/// aff_le_def
fn step_21() -> Unit raise {
  aff_le_def_c.set(@pair.new_definition(@term_syntax.parse_term("(aff_le : ((Cart[Real, _]) -> Bool, (Cart[Real, _]) -> Bool, Cart[Real, _]) -> Bool) == affsign(sgn_le)")))
}

///|
let aff_le_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("aff_le_def")

///|
/// `aff_le_def`
pub fn aff_le_def() -> @kernel.Thm {
  aff_le_def_c.get()
}

///|
/// AFFSIGN
fn step_22() -> Unit raise {
  let t151 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t152 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), affsign(), lin_combo(), @sets.in_elim_thm()])), t151)
  affsign_v1_c.set(@tactics.prove(@term_syntax.parse_term("affsign((sgn : (Real) -> Bool), (s : (Cart[Real, _]) -> Bool), (t : (Cart[Real, _]) -> Bool)) == {(y : Cart[Real, _]) | ∃ f : (Cart[Real, _]) -> Real, y == vsum(UNION(s, t), (v : Cart[Real, _]) => op_pct(f(v), v)) && (∀ w : Cart[Real, _], IN(w, t) → sgn(f(w))) && sum(UNION(s, t), f) == real_of_num(1)}"), t152))
}

///|
let affsign_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFSIGN")

///|
/// `AFFSIGN`
pub fn affsign_v1() -> @kernel.Thm {
  affsign_v1_c.get()
}

///|
/// AFFSIGN_ALT
fn step_23() -> Unit raise {
  let t154 = @meson.meson_tac(@list.List([]))
  let t153 = @simp.rewrite_tac(@list.List([affsign_v1(), @sets.extension(), @sets.in_elim_thm()]))
  let t155 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(IN((w : _), UNION((s : (_) -> Bool), (t : (_) -> Bool))) → IN(w, t) → (P : (_) -> Bool)(w)) == (IN(w, t) → P(w))"))])), t153), t154)
  affsign_alt_c.set(@tactics.prove(@term_syntax.parse_term("affsign((sgn : (Real) -> Bool), (s : (Cart[Real, _]) -> Bool), (t : (Cart[Real, _]) -> Bool)) == {(y : Cart[Real, _]) | ∃ f : (Cart[Real, _]) -> Real, (∀ w : Cart[Real, _], IN(w, UNION(s, t)) → IN(w, t) → sgn(f(w))) && sum(UNION(s, t), f) == real_of_num(1) && vsum(UNION(s, t), (v : Cart[Real, _]) => op_pct(f(v), v)) == y}"), t155))
}

///|
let affsign_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFSIGN_ALT")

///|
/// `AFFSIGN_ALT`
pub fn affsign_alt() -> @kernel.Thm {
  affsign_alt_c.get()
}

///|
/// IN_AFFSIGN
fn step_24() -> Unit raise {
  let t156 = @sets.set_tac(@list.List([]))
  let t157 = @tactics.then_tac(@simp.rewrite_tac(@list.List([affsign_v1(), @sets.in_elim_thm()])), t156)
  in_affsign_v1_c.set(@tactics.prove(@term_syntax.parse_term("IN((y : Cart[Real, _]), affsign((sgn : (Real) -> Bool), (s : (Cart[Real, _]) -> Bool), (t : (Cart[Real, _]) -> Bool))) == (∃ u : (Cart[Real, _]) -> Real, (∀ x : Cart[Real, _], IN(x, t) → sgn(u(x))) && sum(UNION(s, t), u) == real_of_num(1) && vsum(UNION(s, t), (x : Cart[Real, _]) => op_pct(u(x), x)) == y)"), t157))
}

///|
let in_affsign_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_AFFSIGN")

///|
/// `IN_AFFSIGN`
pub fn in_affsign_v1() -> @kernel.Thm {
  in_affsign_v1_c.get()
}

///|
/// AFFSIGN_INJECTIVE_LINEAR_IMAGE
fn step_25() -> Unit raise {
  let t160 = @simp.simp_tac(@list.List([@trivia.o_thm(), @vectors.vector_mul_lzero()]))
  let t159 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && !(p && !(q : Bool))) == (p && q)"))]))
  let t158 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t161 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@vectors.vsum_superset()), t158), t159), t160)
  let lemma0 = @tactics.prove(@term_syntax.parse_term("vsum((s : (Cart[Real, _]) -> Bool), (x : Cart[Real, _]) => op_pct((u : (Cart[Real, _]) -> Real)(x), x)) == vsum({(x : Cart[Real, _]) | IN(x, s) && !(u(x) == real_of_num(0))}, (x : Cart[Real, _]) => op_pct(u(x), x))"), t161)
  let t226 = @simp.asm_simp_tac(@list.List([@vectors.linear_vsum(), @trivia.o_def(), @equal.gsym(@vectors.linear_cmul())]))
  let t225 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t224 = @tactics.disch_then(fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s222 = @tactics.subst1_tac(x221)
    fn(x223 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s222(x223)
    }
  })
  let t219 = @meson.asm_meson_tac(@list.List([]))
  let t220 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t219), @tactics.all_tac])
  let t213 = @drule.part_match(fn(x212 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x212))
  }, @vectors.vsum_image())
  let t227 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(fn(x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x215 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x214 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s210 = @tactics.mp_tac(x209)
            fn(x211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s210(x211)
            }
          })(t213(x214))
        })(@equal.lhand(x215))
      })((fn(x216 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x216.1
      })(x217))
    })(x218)(x218)
  }, @tactics.ants_tac), t220), t224), t225), t226)
  let t208 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t207 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum()), @iterate.support(), @iterate.neutral_real_add(), @trivia.o_thm()]))
  let t206 = @simp.once_rewrite_tac(@list.List([@iterate.iterate_expand_cases()]))
  let t204 = @simp.gen_rewrite_rule(fn(x203 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x199 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x193 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s194 = @equal.land_conv(x193)
        fn(x195 : @kernel.Term) -> @kernel.Thm raise {
          s194(x195)
        }
      })((fn(x196 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s197 = @equal.rator_conv(x196)
        fn(x198 : @kernel.Term) -> @kernel.Thm raise {
          s197(x198)
        }
      })(x199))
    })((fn(x200 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s201 = @equal.rator_conv(x200)
      fn(x202 : @kernel.Term) -> @kernel.Thm raise {
        s201(x202)
      }
    })(x203))
  }, @list.List([@iterate.sum()]))
  let t228 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s191 = @tactics.mp_tac(x190)
      fn(x192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s191(x192)
      }
    })(t204(x205))
  }), t206), t207), @class.cond_cases_tac), t208), t227])
  let t189 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(x : Cart[Real, M]) | IN(x, (s : (Cart[Real, M]) -> Bool)) && !((u : (Cart[Real, N]) -> Real)((f : (Cart[Real, M]) -> Cart[Real, N])(x)) == real_of_num(0))})"), fn(x186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s187 = @tactics.assume_tac(x186)
    fn(x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s187(x188)
    }
  })
  let t184 = @tactics.conv_tac(@equal.sym_conv)
  let t185 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t184])
  let t183 = @tactics.subgoal_then(@term_syntax.parse_term("{(y : Cart[Real, N]) | IN(y, IMAGE((f : (Cart[Real, M]) -> Cart[Real, N]), (s : (Cart[Real, M]) -> Bool))) && !((u : (Cart[Real, N]) -> Real)(y) == real_of_num(0))} == IMAGE(f, {(x : Cart[Real, M]) | IN(x, s) && !(u(f(x)) == real_of_num(0))})"), fn(x180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s181 = @tactics.subst1_tac(x180)
    fn(x182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s181(x182)
    }
  })
  let t179 = @simp.once_rewrite_tac(@list.List([lemma0]))
  let t178 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("((p : Bool) → (z : _) == (x : _)) → (p && x == (y : _)) == (p && z == y)")))
  let t176 = @tactics.disch_then(fn(x173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s174 = @tactics.subst1_tac(x173)
    fn(x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s174(x175)
    }
  })
  let t177 = @list.List([@meson.asm_meson_tac(@list.List([])), t176])
  let t166 = @drule.part_match(fn(x165 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x165))
  }, @iterate.sum_image())
  let t229 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), fn(x172 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x169 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x167 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s163 = @tactics.mp_tac(x162)
            fn(x164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s163(x164)
            }
          })(t166(x167))
        })(((x168 : @kernel.Term) => @lib.funpow(3, @equal.lhand, x168))(x169))
      })((fn(x170 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x170.1
      })(x171))
    })(x172)(x172)
  }), @tactics.ants_tac), t177), t178), @tactics.disch_tac), t179), t183), t185), t189), t228)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, linear(f) && (∀ x : Cart[Real, M], ∀ y : Cart[Real, M], f(x) == f(y) → x == y) → (sum(IMAGE(f, s), (u : (Cart[Real, N]) -> Real)) == real_of_num(1) && vsum(IMAGE(f, s), (x : Cart[Real, N]) => op_pct(u(x), x)) == (y : Cart[Real, N])) == (sum(s, o(u, f)) == real_of_num(1) && f(vsum(s, (x : Cart[Real, M]) => op_pct(o(u, f, x), x))) == y)"), t229)
  let t255 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def(), @class.eta_ax()]))
  let t254 = @tactics.exists_tac(@term_syntax.parse_term("o((u : (Cart[Real, M]) -> Real), (g : (Cart[Real, N]) -> Cart[Real, M]))"))
  let t253 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : (Cart[Real, M]) -> Real)"))(@tactics.strip_assume_tac))
  let t251 = @tactics.conjuncts_then2(fn(x245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s246 = @tactics.subst1_tac(x245)
    fn(x247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s246(x247)
    }
  }, fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s249 = @tactics.mp_tac(x248)
    fn(x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s249(x250)
    }
  })
  let t252 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Cart[Real, M])"))(t251))
  let t244 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Cart[Real, N]) -> Cart[Real, M])"))(@tactics.strip_assume_tac))
  let t243 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_thm()]))
  let t256 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(f : (Cart[Real, M]) -> Cart[Real, N])"), @vectors.linear_injective_left_inverse())), t243), t244), t252), t253), t254), t255)
  let t242 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t241 = @simp.asm_rewrite_tac(@list.List([]))
  let t240 = @tactics.exists_tac(@term_syntax.parse_term("o((u : (Cart[Real, N]) -> Real), (f : (Cart[Real, M]) -> Cart[Real, N]))"))
  let t239 = @simp.asm_rewrite_tac(@list.List([]))
  let t238 = @tactics.exists_tac(@term_syntax.parse_term("vsum(UNION((s : (Cart[Real, M]) -> Bool), (t : (Cart[Real, M]) -> Bool)), (x : Cart[Real, M]) => op_pct(o((u : (Cart[Real, N]) -> Real), (f : (Cart[Real, M]) -> Cart[Real, N]), x), x))"))
  let t257 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : (Cart[Real, N]) -> Real)"))(@tactics.strip_assume_tac)), t238), t239), t240), t241), t242), t256])
  let t237 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t236 = @tactics.first_assum(fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x234
    @simp.rewrite_tac(@list.List([@drule.match_mp(lemma1)(th)]))
  })
  let t233 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_union())]))
  let t232 = @simp.rewrite_tac(@list.List([@sets.in_image(), in_affsign_v1()]))
  let t231 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t230 = @simp.rewrite_tac(@list.List([@sets.extension(), in_affsign_v1()]))
  let t258 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t230), t231), t232), t233), t236), t237), @tactics.eq_tac), t257)
  affsign_injective_linear_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ sgn : (Real) -> Bool, ∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, M]) -> Bool, ∀ v : _, linear(f) && (∀ x : Cart[Real, M], ∀ y : Cart[Real, M], f(x) == f(y) → x == y) → affsign(sgn, IMAGE(f, s), IMAGE(f, t)) == IMAGE(f, affsign(sgn, s, t))"), t258))
}

///|
let affsign_injective_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFSIGN_INJECTIVE_LINEAR_IMAGE")

///|
/// `AFFSIGN_INJECTIVE_LINEAR_IMAGE`
pub fn affsign_injective_linear_image() -> @kernel.Thm {
  affsign_injective_linear_image_c.get()
}

///|
/// AFF_GE_INJECTIVE_LINEAR_IMAGE
fn step_26() -> Unit raise {
  let t259 = @simp.rewrite_tac(@list.List([aff_ge_def(), affsign_injective_linear_image()]))
  aff_ge_injective_linear_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, M]) -> Bool, linear(f) && (∀ x : Cart[Real, M], ∀ y : Cart[Real, M], f(x) == f(y) → x == y) → aff_ge(IMAGE(f, s), IMAGE(f, t)) == IMAGE(f, aff_ge(s, t))"), t259))
}

///|
let aff_ge_injective_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFF_GE_INJECTIVE_LINEAR_IMAGE")

///|
/// `AFF_GE_INJECTIVE_LINEAR_IMAGE`
pub fn aff_ge_injective_linear_image() -> @kernel.Thm {
  aff_ge_injective_linear_image_c.get()
}

///|
/// AFF_GT_INJECTIVE_LINEAR_IMAGE
fn step_27() -> Unit raise {
  let t260 = @simp.rewrite_tac(@list.List([aff_gt_def(), affsign_injective_linear_image()]))
  aff_gt_injective_linear_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, M]) -> Bool, linear(f) && (∀ x : Cart[Real, M], ∀ y : Cart[Real, M], f(x) == f(y) → x == y) → aff_gt(IMAGE(f, s), IMAGE(f, t)) == IMAGE(f, aff_gt(s, t))"), t260))
}

///|
let aff_gt_injective_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFF_GT_INJECTIVE_LINEAR_IMAGE")

///|
/// `AFF_GT_INJECTIVE_LINEAR_IMAGE`
pub fn aff_gt_injective_linear_image() -> @kernel.Thm {
  aff_gt_injective_linear_image_c.get()
}

///|
/// AFF_LE_INJECTIVE_LINEAR_IMAGE
fn step_28() -> Unit raise {
  let t261 = @simp.rewrite_tac(@list.List([aff_le_def(), affsign_injective_linear_image()]))
  aff_le_injective_linear_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, M]) -> Bool, linear(f) && (∀ x : Cart[Real, M], ∀ y : Cart[Real, M], f(x) == f(y) → x == y) → aff_le(IMAGE(f, s), IMAGE(f, t)) == IMAGE(f, aff_le(s, t))"), t261))
}

///|
let aff_le_injective_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFF_LE_INJECTIVE_LINEAR_IMAGE")

///|
/// `AFF_LE_INJECTIVE_LINEAR_IMAGE`
pub fn aff_le_injective_linear_image() -> @kernel.Thm {
  aff_le_injective_linear_image_c.get()
}

///|
/// AFF_LT_INJECTIVE_LINEAR_IMAGE
fn step_29() -> Unit raise {
  let t262 = @simp.rewrite_tac(@list.List([aff_lt_def(), affsign_injective_linear_image()]))
  aff_lt_injective_linear_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, M]) -> Bool, linear(f) && (∀ x : Cart[Real, M], ∀ y : Cart[Real, M], f(x) == f(y) → x == y) → aff_lt(IMAGE(f, s), IMAGE(f, t)) == IMAGE(f, aff_lt(s, t))"), t262))
}

///|
let aff_lt_injective_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFF_LT_INJECTIVE_LINEAR_IMAGE")

///|
/// `AFF_LT_INJECTIVE_LINEAR_IMAGE`
pub fn aff_lt_injective_linear_image() -> @kernel.Thm {
  aff_lt_injective_linear_image_c.get()
}

///|
/// Multivariate/wlog_examples.ml:378
fn step_30() -> Unit raise {
  @vectors.add_linear_invariants(@list.List([affsign_injective_linear_image(), aff_ge_injective_linear_image(), aff_gt_injective_linear_image(), aff_le_injective_linear_image(), aff_lt_injective_linear_image()]))
}

///|
/// IN_AFFSIGN_TRANSLATION
fn step_31() -> Unit raise {
  let t350 = @sets.set_tac(@list.List([]))
  let t349 = @tactics.match_mp_tac(@iterate.sum_superset())
  let t348 = @tactics.first_x_assum(fn(x347 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x344 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s345 = @tactics.subst1_tac(x344)
      fn(x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s345(x346)
      }
    })(@equal.sym(x347))
  })
  let t343 = @simp.gen_rewrite_tac(fn(x340 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s341 = @equal.land_conv(x340)
    fn(x342 : @kernel.Term) -> @kernel.Thm raise {
      s341(x342)
    }
  }, @list.List([@equal.gsym(@vectors.vector_mul_lid())]))
  let t339 = @simp.rewrite_tac(@list.List([@vectors.vsum_rmul()]))
  let t338 = @simp.asm_simp_tac(@list.List([@vectors.vector_add_ldistrib(), @vectors.vsum_add()]))
  let t337 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.vector_add_sub()]))
  let t336 = @tactics.disch_then(fn(x335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t334 = @simp.asm_simp_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) + (x : Cart[Real, N]) == a + (y : Cart[Real, N])) == (x == y)"))]))
  let t328 = @drule.part_match(fn(x327 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x327))
  }, @vectors.vsum_image())
  let t322 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t321 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum()), @iterate.support(), @iterate.neutral_real_add()]))
  let t320 = @simp.once_rewrite_tac(@list.List([@iterate.iterate_expand_cases()]))
  let t318 = @simp.gen_rewrite_rule(fn(x317 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x313 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x307 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s308 = @equal.land_conv(x307)
        fn(x309 : @kernel.Term) -> @kernel.Thm raise {
          s308(x309)
        }
      })((fn(x310 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s311 = @equal.rator_conv(x310)
        fn(x312 : @kernel.Term) -> @kernel.Thm raise {
          s311(x312)
        }
      })(x313))
    })((fn(x314 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s315 = @equal.rator_conv(x314)
      fn(x316 : @kernel.Term) -> @kernel.Thm raise {
        s315(x316)
      }
    })(x317))
  }, @list.List([@iterate.sum()]))
  let t323 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s305 = @tactics.mp_tac(x304)
      fn(x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s305(x306)
      }
    })(t318(x319))
  }), t320), t321), @class.cond_cases_tac), t322), @tactics.all_tac])
  let t303 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(x : Cart[Real, N]) | IN(x, UNION((s : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool))) && !((f : (Cart[Real, N]) -> Real)(x) == real_of_num(0))})"), fn(x300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s301 = @tactics.assume_tac(x300)
    fn(x302 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s301(x302)
    }
  })
  let t298 = @sets.set_tac(@list.List([]))
  let t297 = @simp.rewrite_tac(@list.List([@vectors.vector_add_sub()]))
  let t296 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_conj(), @sets.forall_in_image(), @vectors.vector_mul_eq_0()]))
  let t295 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t294 = @tactics.match_mp_tac(@vectors.vsum_superset())
  let t299 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t294), @tactics.conj_tac), t295), t296), t297), t298)])
  let t293 = @tactics.exists_tac(@term_syntax.parse_term("vsum(IMAGE((x : Cart[Real, N]) => (a : Cart[Real, N]) + x, {(x : Cart[Real, N]) | IN(x, UNION((s : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool))) && !((f : (Cart[Real, N]) -> Real)(x) == real_of_num(0))}), (v : Cart[Real, N]) => op_pct(f(v - a), v))"))
  let t292 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t290 = @meson.meson_tac(@list.List([]))
  let t289 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @sets.subset(), @sets.in_elim_thm()]))
  let t291 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.match_mp_tac(@vectors.vsum_superset())), t289), t290), @tactics.all_tac])
  let t288 = @tactics.exists_tac(@term_syntax.parse_term("(a : Cart[Real, N]) + vsum({(x : Cart[Real, N]) | IN(x, UNION((s : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool))) && !((f : (Cart[Real, N]) -> Real)(x) == real_of_num(0))}, (v : Cart[Real, N]) => op_pct(f(v), v))"))
  let t287 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t284 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def(), @vectors.vector_add_sub(), @class.eta_ax()]))
  let t283 = @simp.simp_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) + (x : Cart[Real, N]) == a + (y : Cart[Real, N])) == (x == y)"))]))
  let t277 = @drule.part_match(fn(x276 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x276))
  }, @iterate.sum_image())
  let t285 = @tactics.then_tac(@tactics.then_tac(fn(x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x281 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x279 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x278 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s274 = @tactics.mp_tac(x273)
            fn(x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s274(x275)
            }
          })(t277(x278))
        })(@equal.lhs(x279))
      })((fn(x280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x280.1
      })(x281))
    })(x282)(x282)
  }, t283), t284)
  let t286 = @list.List([@tactics.all_tac, @simp.asm_rewrite_tac(@list.List([@sets.forall_in_image(), @class.eta_ax(), @vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, N]) + (x : Cart[Real, N]) - a == x"))])), t285])
  let t272 = @tactics.repeat_tac(@tactics.conj_tac)
  let t271 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.image_union())]))
  let t270 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N]) => (f : (Cart[Real, N]) -> Real)(x - (a : Cart[Real, N]))"))
  let t268 = @tactics.conjuncts_then2(fn(x265 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s266 = @tactics.subst_all_tac(x265)
    fn(x267 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s266(x267)
    }
  }, @tactics.strip_assume_tac)
  let t269 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Real)"))(t268))
  let t264 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(∀ x : _, (s : (_) -> Bool)(x) → (p : (_) -> Bool)(x)) == (∀ x : _, IN(x, s) → p(x))"))]))
  let t263 = @simp.rewrite_tac(@list.List([affsign(), lin_combo()]))
  let t351 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t263), t264), t269), t270), t271), t272), t286), t287), t288), @tactics.conj_tac), t291), t292), t293), @tactics.conj_tac), t299), t303), t323), fn(x333 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x330 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x329 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s325 = @tactics.mp_tac(x324)
            fn(x326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s325(x326)
            }
          })(t328(x329))
        })(@equal.rhs(x330))
      })((fn(x331 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x331.1
      })(x332))
    })(x333)(x333)
  }), t334), t336), t337), t338), @tactics.ap_thm_tac), @tactics.ap_term_tac), t339), t343), @tactics.ap_thm_tac), @tactics.ap_term_tac), t348), t349), t350)
  in_affsign_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ sgn : (Real) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, ∀ a : Cart[Real, N], ∀ v : Cart[Real, N], affsign(sgn, s, t, v) → affsign(sgn, IMAGE((x : Cart[Real, N]) => a + x, s), IMAGE((x : Cart[Real, N]) => a + x, t), a + v)"), t351))
}

///|
let in_affsign_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_AFFSIGN_TRANSLATION")

///|
/// `IN_AFFSIGN_TRANSLATION`
pub fn in_affsign_translation() -> @kernel.Thm {
  in_affsign_translation_c.get()
}

///|
/// AFFSIGN_TRANSLATION
fn step_32() -> Unit raise {
  let t377 = @simp.rewrite_tac(@list.List([]))
  let t374 = @drule.match_mp(in_affsign_translation())
  let t371 = @term_syntax.parse_term("(a : Cart[Real, N])")
  let t376 = @tactics.disch_then(fn(x375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x373 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x368 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s369 = @tactics.mp_tac(x368)
        fn(x370 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s369(x370)
        }
      })(((x372 : @kernel.Thm) => @bool.spec(t371, x372))(x373))
    })(t374(x375))
  })
  let t367 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t378 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image()])), @tactics.gen_tac), t367), t376), t377)
  let t366 = @simp.asm_rewrite_tac(@list.List([@sets.in_()]))
  let t365 = @tactics.exists_tac(@term_syntax.parse_term("-(a : Cart[Real, N]) + (x : Cart[Real, N])"))
  let t364 = @simp.rewrite_tac(@list.List([@sets.image(), @sets.in_elim_thm()]))
  let t362 = @vectors.vector_arith(@term_syntax.parse_term("-(a : Cart[Real, N]) + (a + (x : Cart[Real, N])) == x"))
  let t363 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o()), @trivia.o_def(), t362, @sets.image_id()]))
  let t359 = @drule.match_mp(in_affsign_translation())
  let t356 = @term_syntax.parse_term("-(a : Cart[Real, N])")
  let t361 = @tactics.disch_then(fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x353 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s354 = @tactics.mp_tac(x353)
        fn(x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s354(x355)
        }
      })(((x357 : @kernel.Thm) => @bool.spec(t356, x357))(x358))
    })(t359(x360))
  })
  let t379 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_()])), @tactics.gen_tac), t361), t363), @tactics.disch_tac), t364), t365), t366), @vectors.vector_arith_tac), t378])
  let t352 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t380 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t352), @tactics.conj_tac), t379)
  affsign_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ sgn : (Real) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, affsign(sgn, IMAGE((x : Cart[Real, N]) => a + x, s), IMAGE((x : Cart[Real, N]) => a + x, t)) == IMAGE((x : Cart[Real, N]) => a + x, affsign(sgn, s, t))"), t380))
}

///|
let affsign_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFSIGN_TRANSLATION")

///|
/// `AFFSIGN_TRANSLATION`
pub fn affsign_translation() -> @kernel.Thm {
  affsign_translation_c.get()
}

///|
/// AFF_GE_TRANSLATION
fn step_33() -> Unit raise {
  let t381 = @simp.rewrite_tac(@list.List([aff_ge_def(), affsign_translation()]))
  aff_ge_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, aff_ge(IMAGE((x : Cart[Real, N]) => a + x, s), IMAGE((x : Cart[Real, N]) => a + x, t)) == IMAGE((x : Cart[Real, N]) => a + x, aff_ge(s, t))"), t381))
}

///|
let aff_ge_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFF_GE_TRANSLATION")

///|
/// `AFF_GE_TRANSLATION`
pub fn aff_ge_translation() -> @kernel.Thm {
  aff_ge_translation_c.get()
}

///|
/// AFF_GT_TRANSLATION
fn step_34() -> Unit raise {
  let t382 = @simp.rewrite_tac(@list.List([aff_gt_def(), affsign_translation()]))
  aff_gt_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, aff_gt(IMAGE((x : Cart[Real, N]) => a + x, s), IMAGE((x : Cart[Real, N]) => a + x, t)) == IMAGE((x : Cart[Real, N]) => a + x, aff_gt(s, t))"), t382))
}

///|
let aff_gt_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFF_GT_TRANSLATION")

///|
/// `AFF_GT_TRANSLATION`
pub fn aff_gt_translation() -> @kernel.Thm {
  aff_gt_translation_c.get()
}

///|
/// AFF_LE_TRANSLATION
fn step_35() -> Unit raise {
  let t383 = @simp.rewrite_tac(@list.List([aff_le_def(), affsign_translation()]))
  aff_le_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, aff_le(IMAGE((x : Cart[Real, N]) => a + x, s), IMAGE((x : Cart[Real, N]) => a + x, t)) == IMAGE((x : Cart[Real, N]) => a + x, aff_le(s, t))"), t383))
}

///|
let aff_le_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFF_LE_TRANSLATION")

///|
/// `AFF_LE_TRANSLATION`
pub fn aff_le_translation() -> @kernel.Thm {
  aff_le_translation_c.get()
}

///|
/// AFF_LT_TRANSLATION
fn step_36() -> Unit raise {
  let t384 = @simp.rewrite_tac(@list.List([aff_lt_def(), affsign_translation()]))
  aff_lt_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, aff_lt(IMAGE((x : Cart[Real, N]) => a + x, s), IMAGE((x : Cart[Real, N]) => a + x, t)) == IMAGE((x : Cart[Real, N]) => a + x, aff_lt(s, t))"), t384))
}

///|
let aff_lt_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFF_LT_TRANSLATION")

///|
/// `AFF_LT_TRANSLATION`
pub fn aff_lt_translation() -> @kernel.Thm {
  aff_lt_translation_c.get()
}

///|
/// Multivariate/wlog_examples.ml:474
fn step_37() -> Unit raise {
  @vectors.add_translation_invariants(@list.List([affsign_translation(), aff_ge_translation(), aff_gt_translation(), aff_le_translation(), aff_lt_translation()]))
}

///|
/// NOT_COPLANAR_NOT_COLLINEAR
fn step_38() -> Unit raise {
  let t398 = @sets.set_tac(@list.List([]))
  let t397 = @tactics.match_mp_tac(@misc.hull_mono())
  let t396 = @simp.asm_rewrite_tac(@list.List([]))
  let t395 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, {(x : Cart[Real, N]), (y : Cart[Real, N])})"))
  let t394 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, SUBSET(t, (s : (_) -> Bool)) && IN((x : _), t) → IN(x, s)")))
  let t393 = @tactics.repeat_tac(@tactics.conj_tac)
  let t392 = @simp.asm_simp_tac(@list.List([@misc.hull_inc(), @sets.in_insert()]))
  let t391 = @tactics.exists_tac(@term_syntax.parse_term("(w : Cart[Real, N])"))
  let t390 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t389 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t388 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t387 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t386 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t385 = @simp.rewrite_tac(@list.List([@convex.collinear_affine_hull(), @convex.coplanar(), @class.contrapos_thm()]))
  let t399 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t385), t386), t387), t388), t389), t390), @tactics.strip_tac), t391), t392), t393), t394), t395), t396), t397), t398)
  not_coplanar_not_collinear_c.set(@tactics.prove(@term_syntax.parse_term("∀ v1 : Cart[Real, N], ∀ v2 : Cart[Real, N], ∀ v3 : Cart[Real, N], ∀ w : Cart[Real, N], !coplanar({v1, v2, v3, w}) → !collinear({v1, v2, v3})"), t399))
}

///|
let not_coplanar_not_collinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_COPLANAR_NOT_COLLINEAR")

///|
/// `NOT_COPLANAR_NOT_COLLINEAR`
pub fn not_coplanar_not_collinear() -> @kernel.Thm {
  not_coplanar_not_collinear_c.get()
}

///|
/// AFFSIGN
fn step_39() -> Unit raise {
  let t400 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t401 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), affsign(), lin_combo(), @sets.in_elim_thm()])), t400)
  affsign_v2_c.set(@tactics.prove(@term_syntax.parse_term("affsign((sgn : (Real) -> Bool), (s : (Cart[Real, _]) -> Bool), (t : (Cart[Real, _]) -> Bool)) == {(y : Cart[Real, _]) | ∃ f : (Cart[Real, _]) -> Real, y == vsum(UNION(s, t), (v : Cart[Real, _]) => op_pct(f(v), v)) && (∀ w : Cart[Real, _], IN(w, t) → sgn(f(w))) && sum(UNION(s, t), f) == real_of_num(1)}"), t401))
}

///|
let affsign_v2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFSIGN")

///|
/// `AFFSIGN`
pub fn affsign_v2() -> @kernel.Thm {
  affsign_v2_c.get()
}

///|
/// IN_AFFSIGN
fn step_40() -> Unit raise {
  let t402 = @sets.set_tac(@list.List([]))
  let t403 = @tactics.then_tac(@simp.rewrite_tac(@list.List([affsign_v2(), @sets.in_elim_thm()])), t402)
  in_affsign_c.set(@tactics.prove(@term_syntax.parse_term("IN((y : Cart[Real, _]), affsign((sgn : (Real) -> Bool), (s : (Cart[Real, _]) -> Bool), (t : (Cart[Real, _]) -> Bool))) == (∃ u : (Cart[Real, _]) -> Real, (∀ x : Cart[Real, _], IN(x, UNION(s, t)) → IN(x, t) → sgn(u(x))) && sum(UNION(s, t), u) == real_of_num(1) && vsum(UNION(s, t), (x : Cart[Real, _]) => op_pct(u(x), x)) == y)"), t403))
}

///|
let in_affsign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_AFFSIGN")

///|
/// `IN_AFFSIGN`
pub fn in_affsign() -> @kernel.Thm {
  in_affsign_c.get()
}

///|
/// LEMMA
fn step_41() -> Unit raise {
  let t669 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_assoc(), @real.real_div_rmul(), @real.real_lt_imp_nz()]))
  let t668 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rneg(), @vectors.vector_mul_lneg(), @equal.gsym(@realax.real_div())]))
  let t667 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_neg(), @calc_int.real_mul_rneg()]))
  let t666 = @simp.rewrite_tac(@list.List([@vectors.vector_add_ldistrib(), @equal.gsym(@vectors.vector_add_assoc())]))
  let t665 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith_eq(), @vectors.vector_add_rid()]))
  let t664 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.finite_insert(), @bool.conjunct1(@sets.finite_rules())]))
  let t663 = @tactics.conv_tac(@equal.once_depth_conv(@iterate.numseg_conv))
  let t662 = @simp.rewrite_tac(@list.List([@cart.dimindex_3()]))
  let t661 = @simp.gen_rewrite_tac(fn(x660 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x654 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s655 = @equal.rand_conv(x654)
      fn(x656 : @kernel.Term) -> @kernel.Thm raise {
        s655(x656)
      }
    })((fn(x657 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s658 = @equal.rand_conv(x657)
      fn(x659 : @kernel.Term) -> @kernel.Thm raise {
        s658(x659)
      }
    })(x660))
  }, @list.List([@equal.gsym(@vectors.basis_expansion())]))
  let t653 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, 3]) + (a : Cart[Real, 3]) + (y : Cart[Real, 3]) == a + (z : Cart[Real, 3])) == (x + y == z)"))]))
  let t652 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_add_lid()]))
  let t651 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((a : Real) + (x : Real) * (a' : Real), (v1 : Cart[Real, N])) + (op_pct((b : Real) + x * (b' : Real), (v2 : Cart[Real, N])) + (op_pct((c : Real) + x * (c' : Real), (v3 : Cart[Real, N])) + (h : Cart[Real, N]))) == op_pct(a, v1) + (op_pct(b, v2) + op_pct(c, v3)) + (op_pct(x, op_pct(a', v1) + (op_pct(b', v2) + op_pct(c', v3))) + h)"))]))
  let t650 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realarith.real_lt_imp_le()]))
  let t649 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + (x : Real) * (a' : Real) + ((b : Real) + x * (b' : Real) + ((c : Real) + x * (c' : Real) + (h : Real))) == a + (b + (c + h)) + x * (a' + (b' + c'))"))]))
  let t645 = @term_syntax.parse_term("(h : Real) / -op_dollar((w : Cart[Real, 3]), 3)")
  let t646 = @term_syntax.parse_term("(c : Real) + (real_of_num(1) - ((a : Real) + ((b : Real) + (c + (h : Real) / -op_dollar((w : Cart[Real, 3]), 3))))) * (c' : Real)")
  let t647 = @term_syntax.parse_term("(b : Real) + (real_of_num(1) - ((a : Real) + (b + ((c : Real) + (h : Real) / -op_dollar((w : Cart[Real, 3]), 3))))) * (b' : Real)")
  let t648 = @tactics.map_every(fn(x642 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s643 = @tactics.exists_tac(x642)
    fn(x644 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s643(x644)
    }
  }, @list.List([@term_syntax.parse_term("(a : Real) + (real_of_num(1) - (a + ((b : Real) + ((c : Real) + (h : Real) / -op_dollar((w : Cart[Real, 3]), 3))))) * (a' : Real)"), t647, t646, t645]))
  let t641 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s635 = @tactics.assume_tac(x634)
    fn(x636 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s635(x636)
    }
  }, fn(x640 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x637 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s638 = @tactics.assume_tac(x637)
      fn(x639 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s638(x639)
      }
    })(@equal.sym(x640))
  }))
  let t631 = @term_syntax.parse_term("(c' : Real)")
  let t632 = @term_syntax.parse_term("(b' : Real)")
  let t633 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a' : Real)"), t632, t631]))
  let t628 = @term_syntax.parse_term("(c : Real)")
  let t629 = @term_syntax.parse_term("(b : Real)")
  let t630 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t629, t628]))
  let t627 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) == (x : Real) + (y : Real)) == (x + y == real_of_num(1))"))]))
  let t626 = @simp.rewrite_tac(@list.List([@vectors.vector_add_rid(), @calc_int.real_add_rid(), @theorems.left_imp_exists_thm()]))
  let t625 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, 3]) - (y : Cart[Real, 3]) == (z : Cart[Real, 3])) == (x == y + z)"))]))
  let t624 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (y : Real) == (z : Real)) == (x == y + z)"))]))
  let t623 = @simp.simp_tac(@list.List([@convex.affine_hull_finite(), @sets.finite_insert(), @bool.conjunct1(@sets.finite_rules()), @convex.affine_hull_finite_step(), @sets.in_elim_thm()]))
  let t622 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vector_sub_component(), @vectors.basis_component(), @calc_num.arith(), @cart.dimindex_3()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t621 = @tactics.subgoal_then(@term_syntax.parse_term("IN((y : Cart[Real, 3]) - op_pct((h : Real) / -op_dollar((w : Cart[Real, 3]), 3), op_pct(op_dollar(w, 1), basis(1)) + op_pct(op_dollar(w, 2), basis(2))), hull(affine, {(v1 : Cart[Real, 3]), (v2 : Cart[Real, 3]), (v3 : Cart[Real, 3])}))"), fn(x618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s619 = @tactics.mp_tac(x618)
    fn(x620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s619(x620)
    }
  })
  let t617 = @tactics.undisch_tac(@term_syntax.parse_term("IN(vec(0), hull(affine, {(v1 : Cart[Real, 3]), (v2 : Cart[Real, 3]), (v3 : Cart[Real, 3])}))"))
  let t616 = @term_syntax.parse_term("(h : Real)")
  let t670 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Cart[Real, 3])"), t616])), @tactics.strip_tac), t617), t621), t622), t623), t624), t625), t626), t627), t630), @tactics.strip_tac), t633), t641), t648), t649), t650), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t651), t652), t653), t661), t662), t663), t664), t665), t666), t667), t668), t669)
  let t615 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith_eq(), @vectors.vector_add_rid()]))
  let t614 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.finite_insert(), @bool.conjunct1(@sets.finite_rules())]))
  let t613 = @tactics.conv_tac(@equal.once_depth_conv(@iterate.numseg_conv))
  let t612 = @simp.rewrite_tac(@list.List([@cart.dimindex_3()]))
  let t611 = @simp.gen_rewrite_tac(fn(x608 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s609 = @equal.land_conv(x608)
    fn(x610 : @kernel.Term) -> @kernel.Thm raise {
      s609(x610)
    }
  }, @list.List([@equal.gsym(@vectors.basis_expansion())]))
  let t607 = @tactics.replicate_tac(4, @tactics.ap_term_tac)
  let t604 = @equal.gsym(@vectors.vector_add_assoc())
  let t605 = @equal.gsym(@vectors.vector_add_ldistrib())
  let t606 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vector_mul_assoc()), t605, t604]))
  let t603 = @simp.asm_simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.basis_component(), @cart.dimindex_3(), @calc_num.arith(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid()]))
  let t602 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((x : Real) * -(y : Real), -(z : Cart[Real, N])) == op_pct(x * y, z)"))]))
  let t601 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_lt_imp_le()]))
  let t600 = @tactics.exists_tac(@term_syntax.parse_term("(h : Real) * -op_dollar((w : Cart[Real, 3]), 3)"))
  let t599 = @tactics.exists_tac(@term_syntax.parse_term("op_pct((a : Real), (v1 : Cart[Real, 3])) + (op_pct((b : Real), (v2 : Cart[Real, 3])) + (op_pct((c : Real), (v3 : Cart[Real, 3])) + op_pct((h : Real), op_pct(op_dollar((w : Cart[Real, 3]), 1), basis(1)) + op_pct(op_dollar(w, 2), basis(2)))))"))
  let t596 = @term_syntax.parse_term("(h : Real)")
  let t597 = @term_syntax.parse_term("(c : Real)")
  let t598 = @term_syntax.parse_term("(b : Real)")
  let t671 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t598, t597, t596])), @tactics.strip_tac), t599), t600), t601), t602), t603), t606), t607), t611), t612), t613), t614), t615)
  let t595 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_assoc(), @real.real_div_rmul(), @real.real_lt_imp_nz()]))
  let t594 = @simp.rewrite_tac(@list.List([@vectors.vector_add_ldistrib(), @equal.gsym(@vectors.vector_add_assoc())]))
  let t593 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith_eq(), @vectors.vector_add_rid()]))
  let t592 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.finite_insert(), @bool.conjunct1(@sets.finite_rules())]))
  let t591 = @tactics.conv_tac(@equal.once_depth_conv(@iterate.numseg_conv))
  let t590 = @simp.rewrite_tac(@list.List([@cart.dimindex_3()]))
  let t589 = @simp.gen_rewrite_tac(fn(x588 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x582 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s583 = @equal.rand_conv(x582)
      fn(x584 : @kernel.Term) -> @kernel.Thm raise {
        s583(x584)
      }
    })((fn(x585 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s586 = @equal.rand_conv(x585)
      fn(x587 : @kernel.Term) -> @kernel.Thm raise {
        s586(x587)
      }
    })(x588))
  }, @list.List([@equal.gsym(@vectors.basis_expansion())]))
  let t581 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, 3]) + (a : Cart[Real, 3]) + (y : Cart[Real, 3]) == a + (z : Cart[Real, 3])) == (x + y == z)"))]))
  let t580 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_add_lid()]))
  let t579 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((a : Real) + (x : Real) * (a' : Real), (v1 : Cart[Real, N])) + (op_pct((b : Real) + x * (b' : Real), (v2 : Cart[Real, N])) + (op_pct((c : Real) + x * (c' : Real), (v3 : Cart[Real, N])) + (h : Cart[Real, N]))) == op_pct(a, v1) + (op_pct(b, v2) + op_pct(c, v3)) + (op_pct(x, op_pct(a', v1) + (op_pct(b', v2) + op_pct(c', v3))) + h)"))]))
  let t578 = @simp.asm_simp_tac(@list.List([@real.real_le_div(), @realarith.real_lt_imp_le()]))
  let t577 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + (x : Real) * (a' : Real) + ((b : Real) + x * (b' : Real) + ((c : Real) + x * (c' : Real) + (h : Real))) == a + (b + (c + h)) + x * (a' + (b' + c'))"))]))
  let t573 = @term_syntax.parse_term("(h : Real) / op_dollar((w : Cart[Real, 3]), 3)")
  let t574 = @term_syntax.parse_term("(c : Real) + (real_of_num(1) - ((a : Real) + ((b : Real) + (c + (h : Real) / op_dollar((w : Cart[Real, 3]), 3))))) * (c' : Real)")
  let t575 = @term_syntax.parse_term("(b : Real) + (real_of_num(1) - ((a : Real) + (b + ((c : Real) + (h : Real) / op_dollar((w : Cart[Real, 3]), 3))))) * (b' : Real)")
  let t576 = @tactics.map_every(fn(x570 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s571 = @tactics.exists_tac(x570)
    fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s571(x572)
    }
  }, @list.List([@term_syntax.parse_term("(a : Real) + (real_of_num(1) - (a + ((b : Real) + ((c : Real) + (h : Real) / op_dollar((w : Cart[Real, 3]), 3))))) * (a' : Real)"), t575, t574, t573]))
  let t569 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s563 = @tactics.assume_tac(x562)
    fn(x564 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s563(x564)
    }
  }, fn(x568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x565 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s566 = @tactics.assume_tac(x565)
      fn(x567 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s566(x567)
      }
    })(@equal.sym(x568))
  }))
  let t559 = @term_syntax.parse_term("(c' : Real)")
  let t560 = @term_syntax.parse_term("(b' : Real)")
  let t561 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a' : Real)"), t560, t559]))
  let t556 = @term_syntax.parse_term("(c : Real)")
  let t557 = @term_syntax.parse_term("(b : Real)")
  let t558 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t557, t556]))
  let t555 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) == (x : Real) + (y : Real)) == (x + y == real_of_num(1))"))]))
  let t554 = @simp.rewrite_tac(@list.List([@vectors.vector_add_rid(), @calc_int.real_add_rid(), @theorems.left_imp_exists_thm()]))
  let t553 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, 3]) - (y : Cart[Real, 3]) == (z : Cart[Real, 3])) == (x == y + z)"))]))
  let t552 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (y : Real) == (z : Real)) == (x == y + z)"))]))
  let t551 = @simp.simp_tac(@list.List([@convex.affine_hull_finite(), @sets.finite_insert(), @bool.conjunct1(@sets.finite_rules()), @convex.affine_hull_finite_step(), @sets.in_elim_thm()]))
  let t550 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vector_sub_component(), @vectors.basis_component(), @calc_num.arith(), @cart.dimindex_3()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t549 = @tactics.subgoal_then(@term_syntax.parse_term("IN((y : Cart[Real, 3]) - op_pct((h : Real) / op_dollar((w : Cart[Real, 3]), 3), op_pct(op_dollar(w, 1), basis(1)) + op_pct(op_dollar(w, 2), basis(2))), hull(affine, {(v1 : Cart[Real, 3]), (v2 : Cart[Real, 3]), (v3 : Cart[Real, 3])}))"), fn(x546 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s547 = @tactics.mp_tac(x546)
    fn(x548 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s547(x548)
    }
  })
  let t545 = @tactics.undisch_tac(@term_syntax.parse_term("IN(vec(0), hull(affine, {(v1 : Cart[Real, 3]), (v2 : Cart[Real, 3]), (v3 : Cart[Real, 3])}))"))
  let t544 = @term_syntax.parse_term("(h : Real)")
  let t672 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Cart[Real, 3])"), t544])), @tactics.strip_tac), t545), t549), t550), t551), t552), t553), t554), t555), t558), @tactics.strip_tac), t561), t569), t576), t577), t578), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t579), t580), t581), t589), t590), t591), t592), t593), t594), t595)
  let t543 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith_eq(), @vectors.vector_add_rid()]))
  let t542 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.finite_insert(), @bool.conjunct1(@sets.finite_rules())]))
  let t541 = @tactics.conv_tac(@equal.once_depth_conv(@iterate.numseg_conv))
  let t540 = @simp.rewrite_tac(@list.List([@cart.dimindex_3()]))
  let t539 = @simp.gen_rewrite_tac(fn(x536 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s537 = @equal.land_conv(x536)
    fn(x538 : @kernel.Term) -> @kernel.Thm raise {
      s537(x538)
    }
  }, @list.List([@equal.gsym(@vectors.basis_expansion())]))
  let t535 = @tactics.replicate_tac(4, @tactics.ap_term_tac)
  let t532 = @equal.gsym(@vectors.vector_add_assoc())
  let t533 = @equal.gsym(@vectors.vector_add_ldistrib())
  let t534 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vector_mul_assoc()), t533, t532]))
  let t531 = @simp.asm_simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.basis_component(), @cart.dimindex_3(), @calc_num.arith(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid()]))
  let t530 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_lt_imp_le()]))
  let t529 = @tactics.exists_tac(@term_syntax.parse_term("(h : Real) * op_dollar((w : Cart[Real, 3]), 3)"))
  let t528 = @tactics.exists_tac(@term_syntax.parse_term("op_pct((a : Real), (v1 : Cart[Real, 3])) + (op_pct((b : Real), (v2 : Cart[Real, 3])) + (op_pct((c : Real), (v3 : Cart[Real, 3])) + op_pct((h : Real), op_pct(op_dollar((w : Cart[Real, 3]), 1), basis(1)) + op_pct(op_dollar(w, 2), basis(2)))))"))
  let t525 = @term_syntax.parse_term("(h : Real)")
  let t526 = @term_syntax.parse_term("(c : Real)")
  let t527 = @term_syntax.parse_term("(b : Real)")
  let t673 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Real)"), t527, t526, t525])), @tactics.strip_tac), t528), t529), t530), t531), t534), t535), t539), t540), t541), t542), t543), t672, t671, t670])
  let t524 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t523 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) == (x : Real) + (y : Real)) == (x + y == real_of_num(1))"))]))
  let t522 = @simp.rewrite_tac(@list.List([@vectors.vector_add_rid(), @calc_int.real_add_rid()]))
  let t521 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, 3]) - (y : Cart[Real, 3]) == (z : Cart[Real, 3])) == (x == y + z)"))]))
  let t520 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (y : Real) == (z : Real)) == (x == y + z)"))]))
  let t519 = @simp.asm_rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t517 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real) / real_of_num(2)) == (real_of_num(0) <= x)"))
  let t518 = @simp.simp_tac(@list.List([@convex.affine_hull_finite_step_gen(), @realarith.real_le_add(), @sets.finite_insert(), @bool.conjunct1(@sets.finite_rules()), t517, @theorems.right_exists_and_thm()]))
  let t516 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("IN((x : _), {(a : _)}) == (a == x)"))]))
  let t515 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION({(a : _), (b : _), (c : _)}, {(d : _)}) == {a, b, c, d}"))]))
  let t514 = @simp.rewrite_tac(@list.List([aff_ge_def(), in_affsign(), sgn_ge()]))
  let t513 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 3])"))
  let t512 = @simp.asm_simp_tac(@list.List([@vectors.norm_basis(), @cart.dimindex_3(), @calc_num.arith(), @sets.in_elim_thm(), @vectors.dot_basis(), @vectors.norm_neg(), @vectors.dot_lneg(), @cart.dimindex_3(), @calc_num.arith(), @vectors.vector_sub_component(), @real.real_sub_refl(), @calc_int.real_neg_0()]))
  let t510 = @tactics.exists_tac(@term_syntax.parse_term("-(basis : (Num) -> Cart[Real, 3])(3)"))
  let t511 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(basis : (Num) -> Cart[Real, 3])(3)")), t510])
  let t507 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) → real_of_num(0) < x || real_of_num(0) < -x")))
  let t509 = @tactics.first_assum(fn(x508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t507(x508))
  })
  let t502 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_rules(), @sets.in_insert(), @sets.not_in_empty(), @calc_num.arith()]))
  let t501 = @simp.simp_tac(@list.List([@sets.card_image_inj(), @sets.finite_insert(), @sets.finite_rules(), @vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, N]) - (a : Cart[Real, N]) == (y : Cart[Real, N]) - a) == (x == y)"))]))
  let t500 = @simp.once_rewrite_tac(@list.List([@sets.simple_image()]))
  let t503 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@vectors.dim_special_hyperplane(), @cart.dimindex_3(), @calc_num.arith()])), t500), t501), t502)
  let t499 = @meson.asm_meson_tac(@list.List([@convex.affine_dependent_imp_collinear_3(), not_coplanar_not_collinear()]))
  let t498 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t495 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@convex.dependent_imp_affine_dependent()))
  let t497 = @tactics.disch_then(fn(x496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s493 = @tactics.mp_tac(x492)
      fn(x494 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s493(x494)
      }
    })(t495(x496))
  })
  let t504 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.independent()])), t497), t498), t499)
  let t491 = @simp.asm_simp_tac(@list.List([@vectors.vector_sub_component(), @cart.dimindex_3(), @calc_num.arith(), @real.real_sub_refl()]))
  let t505 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_gspec(), @sets.in_elim_thm(), @sets.forall_in_insert(), @sets.not_in_empty()])), t491), t504, t503])
  let t490 = @tactics.repeat_tac(@tactics.conj_tac)
  let t489 = @tactics.match_mp_tac(@vectors.card_ge_dim_independent())
  let t487 = @meson.meson_tac(@list.List([@vectors.span_sub(), @vectors.span_inc(), @sets.in_insert(), @sets.subset()]))
  let t486 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_gspec(), @sets.forall_in_insert(), @sets.not_in_empty()]))
  let t485 = @tactics.match_mp_tac(@vectors.span_mono())
  let t488 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x482 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s483 = @equal.rand_conv(x482)
    fn(x484 : @kernel.Term) -> @kernel.Thm raise {
      s483(x484)
    }
  }, @list.List([@equal.gsym(@vectors.span_span())])), t485), t486), t487), @tactics.all_tac])
  let t480 = @simp.asm_simp_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty(), @sets.in_elim_thm()]))
  let t479 = @simp.simp_tac(@list.List([@vectors.subspace_special_hyperplane(), @cart.dimindex_3(), @calc_num.arith()]))
  let t478 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((x : _) => IN(x, (s : (_) -> Bool))) == s"))]))
  let t477 = @tactics.match_mp_tac(@vectors.span_induct())
  let t481 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset()])), t477), t478), t479), t480), @tactics.all_tac])
  let t476 = @tactics.exists_tac(@term_syntax.parse_term("span({(x : Cart[Real, 3]) - (v1 : Cart[Real, 3]) | IN(x, {(v2 : Cart[Real, 3]), (v3 : Cart[Real, 3])})})"))
  let t475 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ s : (_) -> Bool, SUBSET((t : (_) -> Bool), (u : (_) -> Bool)) && SUBSET(s, t) && SUBSET(u, s) → t == u")))
  let t506 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@convex.affine_hull_eq_span()])), t475), t476), @tactics.conj_tac), t481), @tactics.conj_tac), t488), t489), t490), t505), @tactics.all_tac])
  let t474 = @tactics.subgoal_then(@term_syntax.parse_term("hull(affine, {(v1 : Cart[Real, 3]), (v2 : Cart[Real, 3]), (v3 : Cart[Real, 3])}) == {(z : Cart[Real, 3]) | op_dollar(z, 3) == real_of_num(0)}"), fn(x471 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s472 = @tactics.assume_tac(x471)
    fn(x473 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s472(x473)
    }
  })
  let t469 = @meson.asm_meson_tac(@list.List([@convex.affine_dependent_imp_collinear_3(), not_coplanar_not_collinear()]))
  let t468 = @simp.rewrite_tac(@list.List([@convex.dependent_affine_dependent_cases()]))
  let t466 = @simp.asm_rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_rules()]))
  let t465 = @tactics.match_mp_tac(@vectors.collinear_small())
  let t464 = @simp.rewrite_tac(@list.List([]))
  let t461 = @drule.match_mp(not_coplanar_not_collinear())
  let t463 = @tactics.first_assum(fn(x462 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x458 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s459 = @tactics.mp_tac(x458)
      fn(x460 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s459(x460)
      }
    })(t461(x462))
  })
  let t457 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_le())]))
  let t456 = @simp.simp_tac(@list.List([@vectors.dim_special_hyperplane(), @cart.dimindex_3(), @calc_num.arith()]))
  let t454 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t455 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@vectors.dim_subset()), t454), @tactics.all_tac])
  let t453 = @tactics.exists_tac(@term_syntax.parse_term("dim({(z : Cart[Real, 3]) | op_dollar(z, 3) == real_of_num(0)})"))
  let t452 = @tactics.match_mp_tac(@arith.let_trans())
  let t451 = @simp.rewrite_tac(@list.List([@arith.gt()]))
  let t467 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x450 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t451), t452), t453), @tactics.conj_tac), t455), t456), t457), @tactics.disch_tac), t463), t464), t465), t466), @tactics.all_tac])
  let t470 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("{(v1 : Cart[Real, 3]), (v2 : Cart[Real, 3]), (v3 : Cart[Real, 3])}"), @vectors.dependent_biggerset_general())), @tactics.ants_tac), t467), t468), t469), @tactics.all_tac])
  let t449 = @tactics.subgoal_then(@term_syntax.parse_term("IN(vec(0), hull(affine, {(v1 : Cart[Real, 3]), (v2 : Cart[Real, 3]), (v3 : Cart[Real, 3])}))"), fn(x446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s447 = @tactics.assume_tac(x446)
    fn(x448 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s447(x448)
    }
  })
  let t444 = @simp.asm_rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @sets.in_elim_thm()]))
  let t443 = @tactics.disch_then(fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x441 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s439 = @tactics.subst1_tac(x438)
        fn(x440 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s439(x440)
        }
      })(@equal.sym(x441))
    })(@bool.conjunct2(x442))
  })
  let t437 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), @tactics.gen_tac))
  let t434 = @simp.gen_rewrite_rule(fn(x433 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x433
  }, @list.List([@wlog.plane()]))
  let t436 = @tactics.first_x_assum(fn(x435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s431 = @tactics.mp_tac(x430)
      fn(x432 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s431(x432)
      }
    })(t434(x435))
  })
  let t429 = @simp.rewrite_tac(@list.List([@convex.coplanar()]))
  let t445 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("!coplanar({(v1 : Cart[Real, 3]), (v2 : Cart[Real, 3]), (v3 : Cart[Real, 3]), (w : Cart[Real, 3])})"))), t429), t436), t437), t443), t444), @tactics.all_tac])
  let t428 = @tactics.subgoal_then(@term_syntax.parse_term("!(op_dollar((w : Cart[Real, 3]), 3) == real_of_num(0))"), fn(x425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s426 = @tactics.assume_tac(x425)
    fn(x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s426(x427)
    }
  })
  let t424 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_rzero()]))
  let t423 = @tactics.exists_tac(@term_syntax.parse_term("(vec : (Num) -> Cart[Real, 3])(0)"))
  let t422 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t416 = @term_syntax.parse_term("(v3 : Cart[Real, 3]) == (w : Cart[Real, 3])")
  let t417 = @term_syntax.parse_term("(v2 : Cart[Real, 3]) == (w : Cart[Real, 3])")
  let t418 = @term_syntax.parse_term("(v1 : Cart[Real, 3]) == (w : Cart[Real, 3])")
  let t419 = @term_syntax.parse_term("(v2 : Cart[Real, 3]) == (v3 : Cart[Real, 3])")
  let t420 = @term_syntax.parse_term("(v1 : Cart[Real, 3]) == (v3 : Cart[Real, 3])")
  let t421 = @tactics.map_every(fn(x413 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x413
    let t415 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.insert_ac(), @convex.coplanar_3()])), @tactics.all_tac])
    @tactics.thenl(@class.asm_cases_tac(t), t415)
  }, @list.List([@term_syntax.parse_term("(v1 : Cart[Real, 3]) == (v2 : Cart[Real, 3])"), t420, t419, t418, t417, t416]))
  let t412 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @sets.in_elim_thm()]))
  let t411 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s406 = @tactics.assume_tac(x405)
    fn(x407 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s406(x407)
    }
  }, fn(x408 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s409 = @tactics.mp_tac(x408)
    fn(x410 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s409(x410)
    }
  }))
  let t404 = @tactics.repeat_tac(@tactics.gen_tac)
  let t674 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@wlog.geom_horizontal_plane_tac(@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)")), t404), t411), t412), t421), @tactics.strip_tac), t422), t423), t424), t428), t445), t449), t470), t474), t506), t509), t511), t512), t513), t514), t515), t516), t518), t519), t520), t521), t522), t523), @tactics.eq_tac), t524), t673)
  lemma_v2_c.set(@tactics.prove(@term_syntax.parse_term("∀ v1 : Cart[Real, 3], ∀ v2 : Cart[Real, 3], ∀ v3 : Cart[Real, 3], ∀ w : Cart[Real, 3], ∀ p : (Cart[Real, 3]) -> Bool, plane(p) && SUBSET({v1, v2, v3}, p) && !coplanar({v1, v2, v3, w}) → (∃ n : Cart[Real, 3], ∃ n' : Cart[Real, 3], norm(n - n') == real_of_num(1) && (∀ x : Cart[Real, 3], IN(x, aff_ge({v1, v2, v3}, {w})) == (∃ xx : Cart[Real, 3], ∃ h : Real, IN(xx, hull(affine, {v1, v2, v3})) && real_of_num(0) <= h && x - xx == op_pct(h, n - n'))) && (∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], SUBSET({x, y}, hull(affine, {v1, v2, v3})) → dot(n - n', x - y) == real_of_num(0)))"), t674))
}

///|
let lemma_v2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA")

///|
/// `LEMMA`
pub fn lemma_v2() -> @kernel.Thm {
  lemma_v2_c.get()
}

///|
/// THEOREM
fn step_42() -> Unit raise {
  let t681 = @meson.asm_meson_tac(@list.List([not_coplanar_not_collinear()]))
  let t680 = @simp.rewrite_tac(@list.List([@misc.hull_subset(), @wlog.plane()]))
  let t679 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, {(v1 : Cart[Real, 3]), (v2 : Cart[Real, 3]), (v3 : Cart[Real, 3])})"))
  let t678 = @simp.asm_rewrite_tac(@list.List([]))
  let t677 = @tactics.match_mp_tac(lemma_v2())
  let t676 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ a : Cart[Real, 3], ∃ b : Cart[Real, 3], (P : (Cart[Real, 3]) -> Bool)(a - b)) → (∃ a : Cart[Real, 3], P(a))")))
  let t675 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((x : Cart[Real, 3]) == (y : Cart[Real, 3]) + op_pct((h : Real), (z : Cart[Real, 3]))) == (x - y == op_pct(h, z))"))]))
  let t682 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t675), t676), t677), t678), t679), t680), t681)
  theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ v1 : Cart[Real, 3], ∀ v2 : Cart[Real, 3], ∀ v3 : Cart[Real, 3], ∀ w : Cart[Real, 3], !coplanar({v1, v2, v3, w}) → (∃ nor : Cart[Real, 3], norm(nor) == real_of_num(1) && (∀ x : Cart[Real, 3], IN(x, aff_ge({v1, v2, v3}, {w})) == (∃ xx : Cart[Real, 3], ∃ h : Real, IN(xx, hull(affine, {v1, v2, v3})) && real_of_num(0) <= h && x == xx + op_pct(h, nor))) && (∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], SUBSET({x, y}, hull(affine, {v1, v2, v3})) → dot(nor, x - y) == real_of_num(0)))"), t682))
}

///|
let theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THEOREM")

///|
/// `THEOREM`
pub fn theorem() -> @kernel.Thm {
  theorem_c.get()
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
}
