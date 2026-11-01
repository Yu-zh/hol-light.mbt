// Translated from upstream Multivariate/wlog.ml; edit this file directly.

///|
/// plane
fn step_1() -> Unit raise {
  plane_c.set(@pair.new_definition(@term_syntax.parse_term("(plane : ((Cart[Real, _]) -> Bool) -> Bool)((x : (Cart[Real, _]) -> Bool)) == (∃ u : Cart[Real, _], ∃ v : Cart[Real, _], ∃ w : Cart[Real, _], !collinear({u, v, w}) && x == hull(affine, {u, v, w}))")))
}

///|
let plane_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("plane")

///|
/// `plane`
pub fn plane() -> @kernel.Thm {
  plane_c.get()
}

///|
/// PLANE_TRANSLATION_EQ
fn step_2() -> Unit raise {
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([plane()])), (x1 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_translate_tac(@list.List([]), x1))
  plane_translation_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, plane(IMAGE((x : Cart[Real, N]) => a + x, s)) == plane(s)"), t2))
}

///|
let plane_translation_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PLANE_TRANSLATION_EQ")

///|
/// `PLANE_TRANSLATION_EQ`
pub fn plane_translation_eq() -> @kernel.Thm {
  plane_translation_eq_c.get()
}

///|
/// PLANE_TRANSLATION
fn step_3() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([plane_translation_eq()]))
  plane_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, plane(s) → plane(IMAGE((x : Cart[Real, N]) => a + x, s))"), t3))
}

///|
let plane_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PLANE_TRANSLATION")

///|
/// `PLANE_TRANSLATION`
pub fn plane_translation() -> @kernel.Thm {
  plane_translation_c.get()
}

///|
/// Multivariate/wlog.ml:23
fn step_4() -> Unit raise {
  @vectors.add_translation_invariants(@list.List([plane_translation_eq()]))
}

///|
/// PLANE_LINEAR_IMAGE_EQ
fn step_5() -> Unit raise {
  let t18 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t19 = @list.List([@meson.asm_meson_tac(@list.List([@determinants.collinear_linear_image_eq()])), t18])
  let t17 = @tactics.repeat_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac))
  let t16 = @simp.asm_simp_tac(@list.List([@convex.affine_hull_linear_image()]))
  let t15 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)((a : _)), f((b : _)), f((c : _))} == IMAGE(f, {a, b, c})"))]))
  let t20 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.exists_in_image(), @sets.in_univ()])), t15), t16), t17), @tactics.binop_tac), t19)
  let t13 = @sets.set_tac(@list.List([]))
  let t14 = @list.List([@simp.asm_rewrite_tac(@list.List([@misc.hull_subset()])), t13])
  let t12 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET({(u : Cart[Real, N]), (v : Cart[Real, N]), (w : Cart[Real, N])}, IMAGE((f : (Cart[Real, M]) -> Cart[Real, N]), (p : (Cart[Real, M]) -> Bool)))"), fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s10 = @tactics.mp_tac(x9)
    fn(x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s10(x11)
    }
  })
  let t8 = @simp.asm_rewrite_tac(@list.List([]))
  let t7 = @tactics.repeat_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac))
  let t21 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @sets.in_image(), @sets.in_univ()])), t7), @tactics.eq_tac), @tactics.disch_tac), t8), t12), t14), t20])
  let t6 = @tactics.exists_tac(@term_syntax.parse_term("∃ u : Cart[Real, N], IN(u, IMAGE((f : (Cart[Real, M]) -> Cart[Real, N]), UNIV)) && (∃ v : Cart[Real, N], IN(v, IMAGE(f, UNIV)) && (∃ w : Cart[Real, N], IN(w, IMAGE(f, UNIV)) && !collinear({u, v, w}) && IMAGE(f, (p : (Cart[Real, M]) -> Bool)) == hull(affine, {u, v, w})))"))
  let t5 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t4 = @simp.rewrite_tac(@list.List([plane()]))
  let t22 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t4), t5), t6), @tactics.conj_tac), t21)
  plane_linear_image_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ p : (Cart[Real, M]) -> Bool, linear(f) && (∀ x : Cart[Real, M], ∀ y : Cart[Real, M], f(x) == f(y) → x == y) → plane(IMAGE(f, p)) == plane(p)"), t22))
}

///|
let plane_linear_image_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PLANE_LINEAR_IMAGE_EQ")

///|
/// `PLANE_LINEAR_IMAGE_EQ`
pub fn plane_linear_image_eq() -> @kernel.Thm {
  plane_linear_image_eq_c.get()
}

///|
/// PLANE_LINEAR_IMAGE
fn step_6() -> Unit raise {
  let t23 = @meson.meson_tac(@list.List([plane_linear_image_eq()]))
  plane_linear_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ p : (Cart[Real, M]) -> Bool, linear(f) && plane(p) && (∀ x : Cart[Real, M], ∀ y : Cart[Real, M], f(x) == f(y) → x == y) → plane(IMAGE(f, p))"), t23))
}

///|
let plane_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PLANE_LINEAR_IMAGE")

///|
/// `PLANE_LINEAR_IMAGE`
pub fn plane_linear_image() -> @kernel.Thm {
  plane_linear_image_c.get()
}

///|
/// Multivariate/wlog.ml:53
fn step_7() -> Unit raise {
  @vectors.add_linear_invariants(@list.List([plane_linear_image_eq()]))
}

///|
/// ROTATION_PLANE_HORIZONTAL
fn step_8() -> Unit raise {
  let t24 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @cart.dimindex_3(), @calc_num.arith()]))
  let t25 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.span_eq_self(), @vectors.subspace(), @sets.in_elim_thm()])), t24), @calc_rat.real_arith_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("span({(z : Cart[Real, Tybit1[Unit]]) | op_dollar(z, 3) == real_of_num(0)}) == {(z : Cart[Real, Tybit1[Unit]]) | op_dollar(z, 3) == real_of_num(0)}"), t25)
  let t123 = @meson.meson_tac(@list.List([@vectors.collinear_lemma(), @sets.insert_ac()]))
  let t122 = @simp.once_rewrite_tac(@list.List([@vectors.vector_sub_eq()]))
  let t121 = @simp.rewrite_tac(@list.List([@vectors.span_breakdown_eq(), @vectors.span_empty(), @sets.in_sing()]))
  let t118 = @vectors.vector_arith(@term_syntax.parse_term("((b : Cart[Real, Tybit1[Unit]]) - (a : Cart[Real, Tybit1[Unit]]) == (c : Cart[Real, Tybit1[Unit]]) - a) == (b == c)"))
  let t119 = @sets.set_rule(@term_syntax.parse_term("!((a : _) == (b : _)) → DELETE({a, b}, a) == {b}"))
  let t120 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("!((a : _) == (b : _)) → DELETE({a, b}, b) == {a}")), t119, t118]))
  let t117 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @theorems.unwind_thm2()]))
  let t116 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @theorems.right_or_distrib()]))
  let t115 = @simp.rewrite_tac(@list.List([@vectors.independent(), @class.contrapos_thm(), @vectors.dependent()]))
  let t114 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t113 = @simp.rewrite_tac(@list.List([]))
  let t110 = @simp.gen_rewrite_rule(fn(x109 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x103 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s104 = @equal.rand_conv(x103)
      fn(x105 : @kernel.Term) -> @kernel.Thm raise {
        s104(x105)
      }
    })((fn(x106 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s107 = @equal.rand_conv(x106)
      fn(x108 : @kernel.Term) -> @kernel.Thm raise {
        s107(x108)
      }
    })(x109))
  }, @list.List([@sets.set_rule(@term_syntax.parse_term("{(a : _), (b : _), (c : _)} == {b, a, c}"))]))
  let t112 = @tactics.first_x_assum(fn(x111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s101 = @tactics.mp_tac(x100)
      fn(x102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s101(x102)
      }
    })(t110(x111))
  })
  let t99 = @tactics.disch_then(@tactics.match_mp_tac)
  let t98 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((b : Cart[Real, Tybit1[Unit]]) - (a : Cart[Real, Tybit1[Unit]]) == (c : Cart[Real, Tybit1[Unit]]) - a) == (b == c)")), @calc_num.arith()]))
  let t97 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_rules(), @sets.in_sing(), @sets.not_in_empty()]))
  let t96 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("{(b : Cart[Real, Tybit1[Unit]]) - (a : Cart[Real, Tybit1[Unit]]), (c : Cart[Real, Tybit1[Unit]]) - a}"), @vectors.independent_bound_general()))
  let t95 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@arith.le_refl(), @vectors.dim_injective_linear_image(), @determinants.orthogonal_transformation_injective()]))])
  let t94 = @tactics.exists_tac(@term_syntax.parse_term("dim({(b : Cart[Real, Tybit1[Unit]]) - (a : Cart[Real, Tybit1[Unit]]), (c : Cart[Real, Tybit1[Unit]]) - a})"))
  let t93 = @tactics.match_mp_tac(@arith.le_trans())
  let t91 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @vectors.vector_3()]))
  let t87 = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, Tybit1[Unit]])([real_of_num(0), real_of_num(0), real_of_num(1)])")
  let t90 = @tactics.disch_then(fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x84 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s85 = @tactics.mp_tac(x84)
      fn(x86 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s85(x86)
      }
    })(((x88 : @kernel.Thm) => @bool.spec(t87, x88))(x89))
  })
  let t83 = @simp.rewrite_tac(@list.List([@sets.extension(), @vectors.span_univ(), @sets.in_elim_thm()]))
  let t82 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((x : Num) <= 2) == (3 <= x)"))]))
  let t81 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(r : Bool) && (!(p : Bool) → (q : Bool)) → (q → r) → p")))
  let t80 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), @vectors.dim_univ(), @cart.dimindex_3(), lemma]))
  let t79 = @term_syntax.parse_term("(UNIV : (Cart[Real, Tybit1[Unit]]) -> Bool)")
  let t92 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("{(z : Cart[Real, Tybit1[Unit]]) | op_dollar(z, 3) == real_of_num(0)}"), t79]), @vectors.dim_eq_span())), t80), t81), t82), t83), t90), t91), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t78 = @tactics.exists_tac(@term_syntax.parse_term("2"))
  let t77 = @tactics.match_mp_tac(@arith.le_trans())
  let t76 = @list.List([@meson.asm_meson_tac(@list.List([@sets.image_subset(), @vectors.span_inc(), @sets.subset_trans()])), @tactics.all_tac])
  let t75 = @tactics.match_mp_tac(@vectors.dim_eq_span())
  let t74 = @simp.gen_rewrite_tac(fn(x71 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s72 = @equal.rand_conv(x71)
    fn(x73 : @kernel.Term) -> @kernel.Thm raise {
      s72(x73)
    }
  }, @list.List([@equal.gsym(lemma)]))
  let t70 = @simp.asm_simp_tac(@list.List([@equal.gsym(@vectors.span_linear_image())]))
  let t67 = @drule.match_mp(@determinants.orthogonal_transformation_linear())
  let t69 = @tactics.first_assum(fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s65 = @tactics.assume_tac(x64)
      fn(x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s65(x66)
      }
    })(t67(x68))
  })
  let t63 = @simp.asm_rewrite_tac(@list.List([]))
  let t62 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]])"))
  let t61 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t59 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_rules()]))
  let t58 = @simp.simp_tac(@list.List([@vectors.dim_span(), @vectors.dim_le_card(), @sets.finite_rules()]))
  let t57 = @tactics.exists_tac(@term_syntax.parse_term("CARD({(b : Cart[Real, Tybit1[Unit]]) - (a : Cart[Real, Tybit1[Unit]]), (c : Cart[Real, Tybit1[Unit]]) - a})"))
  let t60 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.let_trans()), t57), t58), t59), @int.arith_tac), @tactics.all_tac])
  let t56 = @simp.rewrite_tac(@list.List([@cart.dimindex_3()]))
  let t55 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("span({(b : Cart[Real, Tybit1[Unit]]) - (a : Cart[Real, Tybit1[Unit]]), (c : Cart[Real, Tybit1[Unit]]) - a})"), @determinants.rotation_lowdim_horizontal()))
  let t54 = @simp.rewrite_tac(@list.List([@sets.set_rule(@parser.parse_term("{x - a:real^B | x = b \\/ x = c} = {b - a,c - a}"))]))
  let t53 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("-(a : Cart[Real, Tybit1[Unit]]) + (a + (x : Cart[Real, Tybit1[Unit]])) == x")), @sets.image_id()]))
  let t52 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("IMAGE((x : Cart[Real, Tybit1[Unit]]) => -(a : Cart[Real, Tybit1[Unit]]) + x, {a + (x : Cart[Real, Tybit1[Unit]]) | IN(x, (s : (Cart[Real, Tybit1[Unit]]) -> Bool))}) == IMAGE((x : Cart[Real, Tybit1[Unit]]) => -a + (a + x), s)"))]))
  let t51 = @tactics.exists_tac(@term_syntax.parse_term("-(a : Cart[Real, Tybit1[Unit]])"))
  let t50 = @simp.asm_simp_tac(@list.List([@convex.affine_hull_insert_span(), @sets.in_insert(), @sets.not_in_empty()]))
  let t49 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x43 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s44 = @tactics.assume_tac(x43)
    fn(x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s44(x45)
    }
  }, fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s47 = @tactics.subst1_tac(x46)
    fn(x48 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s47(x48)
    }
  }))
  let t40 = @term_syntax.parse_term("(b : Cart[Real, Tybit1[Unit]]) == (c : Cart[Real, Tybit1[Unit]])")
  let t41 = @term_syntax.parse_term("(a : Cart[Real, Tybit1[Unit]]) == (c : Cart[Real, Tybit1[Unit]])")
  let t42 = @tactics.map_every(fn(x37 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x37
    let t39 = @list.List([@simp.asm_rewrite_tac(@list.List([@vectors.collinear_2(), @sets.insert_ac()])), @tactics.all_tac])
    @tactics.thenl(@class.asm_cases_tac(t), t39)
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, Tybit1[Unit]]) == (b : Cart[Real, Tybit1[Unit]])"), t41, t40]))
  let t34 = @term_syntax.parse_term("(c : Cart[Real, Tybit1[Unit]])")
  let t35 = @term_syntax.parse_term("(b : Cart[Real, Tybit1[Unit]])")
  let t36 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, Tybit1[Unit]])"), t35, t34]))
  let t33 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t30 = @simp.gen_rewrite_rule(fn(x29 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x29
  }, @list.List([plane()]))
  let t32 = @tactics.first_assum(fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s27 = @tactics.mp_tac(x26)
      fn(x28 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s27(x28)
      }
    })(t30(x31))
  })
  let t124 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t32), t33), t36), t42), t49), t50), t51), t52), t53), t54), t55), t56), @tactics.ants_tac), t60), t61), t62), @tactics.strip_tac), t63), t69), t70), t74), t75), @tactics.conj_tac), t76), t77), t78), @tactics.conj_tac), t92), t93), t94), @tactics.conj_tac), t95), t96), t97), t98), t99), t112), t113), t114), t115), t116), t117), t120), t121), t122), t123)
  rotation_plane_horizontal_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, Tybit1[Unit]]) -> Bool, plane(s) → (∃ a : Cart[Real, Tybit1[Unit]], ∃ f : (Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]], orthogonal_transformation(f) && det(matrix(f)) == real_of_num(1) && IMAGE(f, IMAGE((x : Cart[Real, Tybit1[Unit]]) => a + x, s)) == {(z : Cart[Real, Tybit1[Unit]]) | op_dollar(z, 3) == real_of_num(0)})"), t124))
}

///|
let rotation_plane_horizontal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ROTATION_PLANE_HORIZONTAL")

///|
/// `ROTATION_PLANE_HORIZONTAL`
pub fn rotation_plane_horizontal() -> @kernel.Thm {
  rotation_plane_horizontal_c.get()
}

///|
/// ROTATION_HORIZONTAL_PLANE
fn step_9() -> Unit raise {
  let t153 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def(), @vectors.matrix_id(), @determinants.det_i()]))
  let t152 = @simp.asm_simp_tac(@list.List([@equal.gsym(@vectors.matrix_compose()), @determinants.orthogonal_transformation_linear()]))
  let t151 = @simp.rewrite_tac(@list.List([@equal.gsym(@determinants.det_mul())]))
  let t150 = @tactics.exists_tac(@term_syntax.parse_term("det(matrix((f : (Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]])))"))
  let t149 = @tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("∀ f : Real, f * (g : Real) == real_of_num(1) && f == real_of_num(1) → g == real_of_num(1)")))
  let t147 = @vectors.vector_arith(@term_syntax.parse_term("-(a : Cart[Real, Tybit1[Unit]]) + (a + (x : Cart[Real, Tybit1[Unit]])) == x"))
  let t148 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.image_o()), @trivia.o_def(), @sets.image_id(), t147]))
  let t146 = @tactics.first_x_assum(fn(x145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s143 = @tactics.subst1_tac(x142)
      fn(x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s143(x144)
      }
    })(@equal.sym(x145))
  })
  let t140 = @term_syntax.parse_term("(g : (Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]])")
  let t141 = @tactics.map_every(fn(x137 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s138 = @tactics.exists_tac(x137)
    fn(x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s138(x139)
    }
  }, @list.List([@term_syntax.parse_term("-(a : Cart[Real, Tybit1[Unit]])"), t140]))
  let t133 = @drule.match_mp(@determinants.orthogonal_transformation_inverse())
  let t134 = @tactics.x_choose_then(@term_syntax.parse_term("(g : (Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]])"))(@tactics.strip_assume_tac)
  let t136 = @tactics.first_assum(fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t134(t133(x135))
  })
  let t131 = @tactics.x_choose_then(@term_syntax.parse_term("(f : (Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]])"))(@tactics.strip_assume_tac)
  let t132 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : Cart[Real, Tybit1[Unit]])"))(t131))
  let t128 = @drule.match_mp(rotation_plane_horizontal())
  let t130 = @tactics.first_x_assum(fn(x129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s126 = @tactics.mp_tac(x125)
      fn(x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s126(x127)
      }
    })(t128(x129))
  })
  let t154 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t130), t132), t136), t141), t146), t148), t149), t150), t151), t152), t153)
  rotation_horizontal_plane_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, Tybit1[Unit]]) -> Bool, plane(p) → (∃ a : Cart[Real, Tybit1[Unit]], ∃ f : (Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]], orthogonal_transformation(f) && det(matrix(f)) == real_of_num(1) && IMAGE((x : Cart[Real, Tybit1[Unit]]) => a + x, IMAGE(f, {(z : Cart[Real, Tybit1[Unit]]) | op_dollar(z, 3) == real_of_num(0)})) == p)"), t154))
}

///|
let rotation_horizontal_plane_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ROTATION_HORIZONTAL_PLANE")

///|
/// `ROTATION_HORIZONTAL_PLANE`
pub fn rotation_horizontal_plane() -> @kernel.Thm {
  rotation_horizontal_plane_c.get()
}

///|
/// GEOM_HORIZONTAL_PLANE_RULE
fn step_10() -> Unit raise {
  let ifn : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(@class.taut(@term_syntax.parse_term("((p : Bool) → (x : Bool) == (x' : Bool)) && (!p → x == true) → x' → x")))
  let t158 = @meson.asm_meson_tac(@list.List([@determinants.orthogonal_transformation_surjective(), @vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, N]) + ((x : Cart[Real, N]) - a) == x"))]))
  let t157 = @tactics.disch_then(@tactics.match_mp_tac)
  let t156 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @sets.image_o()]))
  let t155 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("o((x : Cart[Real, N]) => (a : Cart[Real, N]) + x, (f : (Cart[Real, N]) -> Cart[Real, N]))"), @vectors.quantify_surjection_thm()))
  let t159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t155), t156), t157), t158)
  let pth = @tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ f : (Cart[Real, N]) -> Cart[Real, N], orthogonal_transformation(f) → ((∀ P : (Cart[Real, N]) -> Bool, (∀ x : Cart[Real, N], P(x)) == (∀ x : Cart[Real, N], P(a + f(x)))) && (∀ P : (Cart[Real, N]) -> Bool, (∃ x : Cart[Real, N], P(x)) == (∃ x : Cart[Real, N], P(a + f(x)))) && (∀ Q : ((Cart[Real, N]) -> Bool) -> Bool, (∀ s : (Cart[Real, N]) -> Bool, Q(s)) == (∀ s : (Cart[Real, N]) -> Bool, Q(IMAGE((x : Cart[Real, N]) => a + x, IMAGE(f, s))))) && (∀ Q : ((Cart[Real, N]) -> Bool) -> Bool, (∃ s : (Cart[Real, N]) -> Bool, Q(s)) == (∃ s : (Cart[Real, N]) -> Bool, Q(IMAGE((x : Cart[Real, N]) => a + x, IMAGE(f, s)))))) && (∀ P : (Cart[Real, N]) -> Bool, {(x : Cart[Real, N]) | P(x)} == IMAGE((x : Cart[Real, N]) => a + x, IMAGE(f, {(x : Cart[Real, N]) | P(a + f(x))})))"), t159)
  let t160 = @simp.rewrite_tac(@list.List([@sets.image_clauses()]))
  let cth = @tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit1[Unit]], ∀ f : (_) -> Cart[Real, Tybit1[Unit]], {} == IMAGE((x : Cart[Real, Tybit1[Unit]]) => a + x, IMAGE(f, {}))"), t160)
  let t163 = @meson.asm_meson_tac(@list.List([@determinants.orthogonal_transformation_v1()]))
  let t164 = @meson.asm_meson_tac(@list.List([@determinants.orthogonal_transformation_surjective()]))
  let t165 = @meson.asm_meson_tac(@list.List([@determinants.orthogonal_transformation_injective()]))
  let t166 = @list.List([@simp.asm_simp_tac(@list.List([@determinants.orthogonal_transformation_linear()])), t165, t164, t163])
  let t162 = @tactics.repeat_tac(@tactics.conj_tac)
  let t161 = @simp.asm_rewrite_tac(@list.List([]))
  let t167 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t161), t162), t166)
  let oth = @tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]], (orthogonal_transformation : ((Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]]) -> Bool)(f) && (det : (Cart[Cart[Real, Tybit1[Unit]], Tybit1[Unit]]) -> Real)((matrix : ((Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]]) -> Cart[Cart[Real, Tybit1[Unit]], Tybit1[Unit]])(f)) == real_of_num(1) → (linear : ((Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]]) -> Bool)(f) && (∀ x : Cart[Real, Tybit1[Unit]], ∀ y : Cart[Real, Tybit1[Unit]], f(x) == f(y) → x == y) && (∀ y : Cart[Real, Tybit1[Unit]], ∃ x : Cart[Real, Tybit1[Unit]], f(x) == y) && (∀ x : Cart[Real, Tybit1[Unit]], (norm : (Cart[Real, Tybit1[Unit]]) -> Real)(f(x)) == (norm : (Cart[Real, Tybit1[Unit]]) -> Real)(x)) && (2 <= (dimindex : ((Tybit1[Unit]) -> Bool) -> Num)((UNIV : (Tybit1[Unit]) -> Bool)) → (det : (Cart[Cart[Real, Tybit1[Unit]], Tybit1[Unit]]) -> Real)((matrix : ((Cart[Real, Tybit1[Unit]]) -> Cart[Real, Tybit1[Unit]]) -> Cart[Cart[Real, Tybit1[Unit]], Tybit1[Unit]])(f)) == real_of_num(1))"), t167)
  let fth = @meson.meson(@list.List([]), @term_syntax.parse_term("(∀ a : _, ∀ f : _, (q : (_, _) -> Bool)(a, f) → (p : Bool) == (p' : (_, _) -> Bool)(a, f)) → (∃ a : _, ∃ f : _, q(a, f)) → p == (∀ a : _, ∀ f : _, q(a, f) → p'(a, f))"))
  geom_horizontal_plane_rule_c.set(fn(x168 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x168
    let (x, bod) = @basics.dest_forall(tm)
    let th1 = @determinants.exists_genvar_rule(@bool.undisch(@bool.ispec(x, rotation_horizontal_plane())))
    match @basics.strip_exists(@kernel.concl(th1)) {
      (More(a, tail=More(f, tail=Empty)), tm1) => {
        match @bool.conjuncts_rule(@kernel.assume_rule(tm1)) {
          More(th_orth, tail=More(th_det, tail=More(th_im, tail=Empty))) => {
            let th2 = @bool.prove_hyp(th_orth, @bool.undisch(@bool.ispecl(@list.List([a, f]), pth)))
            let t169 = @bool.ispecl(@list.List([a, f]), cth)
            let t170 = @equal.subs_conv(@list.List([@equal.gsym(th_im), t169]))
            let th3 = @equal.thenc(@vectors.expand_quants_conv(@kernel.assume_rule(@kernel.concl(th2))), t170)(bod)
            let th4 = @bool.prove_hyp(th2, th3)
            let th5 = @determinants.translation_invariants(a)
            let th6 = @simp.gen_rewrite_rule(fn(x177 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              (fn(x171 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s172 = @equal.rand_conv(x171)
                fn(x173 : @kernel.Term) -> @kernel.Thm raise {
                  s172(x173)
                }
              })((fn(x174 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s175 = @equal.redepth_conv(x174)
                fn(x176 : @kernel.Term) -> @kernel.Thm raise {
                  s175(x176)
                }
              })(x177))
            }, @list.List([@kernel.assume_rule(@kernel.concl(th5))]))(th4)
            let th7 = @bool.prove_hyp(th5, th6)
            let t178 = @bool.conj(th_orth, th_det)
            let th8s = @bool.conjuncts_rule(@drule.match_mp(oth)(t178))
            let th9 = @determinants.linear_invariants(f)(th8s)
            let th10 = @simp.gen_rewrite_rule(fn(x185 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              (fn(x179 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s180 = @equal.rand_conv(x179)
                fn(x181 : @kernel.Term) -> @kernel.Thm raise {
                  s180(x181)
                }
              })((fn(x182 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s183 = @equal.redepth_conv(x182)
                fn(x184 : @kernel.Term) -> @kernel.Thm raise {
                  s183(x184)
                }
              })(x185))
            }, @list.List([th9]))(th7)
            let th11 = if (@lib.intersect(@kernel.frees(@kernel.concl(th10)), @list.List([a, f])) == @list.List([])) {
              @bool.prove_hyp(th1, @lib.itlist(@bool.simple_choose, @list.List([a, f]), th10))
            } else {
              let t186 = @bool.genl(@list.List([a, f]), @bool.disch_all(th10))
              @bool.mp(@drule.match_mp(fth)(t186), th1)
            }
            let th12 = @simp.rewrite_conv(@list.List([@kernel.assume_rule(@bool.mk_neg(@lib.hd(@kernel.hyp(th11))))]))(bod)
            let t187 = @bool.disch_all(th12)
            let th13 = ifn(@bool.conj(@bool.disch_all(th11), t187))
            let t188 = @bool.gen(x, th13)
            let th14 = @drule.match_mp(@theorems.mono_forall())(t188)
            @simp.gen_rewrite_rule(fn(x195 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              (fn(x189 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s190 = @equal.try_conv(x189)
                fn(x191 : @kernel.Term) -> @kernel.Thm raise {
                  s190(x191)
                }
              })((fn(x192 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s193 = @equal.land_conv(x192)
                fn(x194 : @kernel.Term) -> @kernel.Thm raise {
                  s193(x194)
                }
              })(x195))
            }, @list.List([@theorems.forall_simp()]))(th14)
          }
          _ => raise @lib.MatchFailure("tscript.ml:192")
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:191")
    }
  })
}

///|
let geom_horizontal_plane_rule_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("GEOM_HORIZONTAL_PLANE_RULE")

///|
/// `GEOM_HORIZONTAL_PLANE_RULE`
pub fn geom_horizontal_plane_rule(x : @kernel.Term) -> @kernel.Thm raise {
  (geom_horizontal_plane_rule_c.get())(x)
}

///|
/// `GEOM_HORIZONTAL_PLANE_TAC`
pub fn geom_horizontal_plane_tac(x196 : @kernel.Term) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  let p = x196
  fn(x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x198 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x198
      let (avs, bod) = @basics.strip_forall(w)
      let t203 = @kernel.freesl(@lib.map(fn(x202 : (String, @kernel.Thm)) -> @kernel.Term raise {
        (fn(x200 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x200)
        })((fn(x201 : (String, @kernel.Thm)) -> @kernel.Thm raise {
          x201.1
        })(x202))
      }, asl))
      let avs_p = @lib.subtract(@kernel.frees(w), t203)
      let (avs_1, bod_1) = @basics.strip_forall(w)
      let t207 = @tactics.spec_tac(p, p)
      let t206 = @tactics.map_every(fn(x204 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let t = x204
        @tactics.spec_tac(t, t)
      }, @lib.rev(@lib.subtract(avs_1.concat(avs_p), @list.List([p]))))
      @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, avs_1), t206), t207), fn(x211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        (fn(x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x208 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            @tactics.match_mp_tac(geom_horizontal_plane_rule(x208))
          })((fn(x209 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
            x209.1
          })(x210))
        })(x211)(x211)
      })
    })(x212)(x212)
  }
}

///|
/// pad2d3d
fn step_11() -> Unit raise {
  pad2d3d_c.set(@pair.new_definition(@term_syntax.parse_term("(pad2d3d : (Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit1[Unit]])((x : Cart[Real, Tybit0[Unit]])) == lambda((i : Num) => if i < 3 { op_dollar(x, i) } else { real_of_num(0) })")))
}

///|
let pad2d3d_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pad2d3d")

///|
/// `pad2d3d`
pub fn pad2d3d() -> @kernel.Thm {
  pad2d3d_c.get()
}

///|
/// FORALL_PAD2D3D_THM
fn step_12() -> Unit raise {
  let t225 = @meson.asm_meson_tac(@list.List([]))
  let t224 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) <= 3) == (i <= 2 || i == 3)"))]))
  let t223 = @simp.simp_tac(@list.List([@cart.cart_eq(), pad2d3d(), @cart.dimindex_3(), @calc_num.arith(), @cart.lambda_beta(), @cart.dimindex_2(), @int.arith_rule(@term_syntax.parse_term("((i : Num) < 3) == (i <= 2)"))]))
  let t222 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t219 = @term_syntax.parse_term("(lambda : ((Num) -> Real) -> Cart[Real, Tybit0[Unit]])((i : Num) => (op_dollar : (Cart[Real, Tybit1[Unit]], Num) -> Real)((y : Cart[Real, Tybit1[Unit]]), i))")
  let t226 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s217 = @tactics.mp_tac(x216)
      fn(x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s217(x218)
      }
    })(((x220 : @kernel.Thm) => @bool.spec(t219, x220))(x221))
  }), t222), @tactics.ap_term_tac), t223), t224), t225)
  let t215 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @cart.dimindex_3(), @calc_num.arith(), @arith.lt_refl()]))
  let t214 = @simp.rewrite_tac(@list.List([pad2d3d()]))
  let t227 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t214), t215), t226])
  let t213 = @tactics.repeat_tac(@tactics.strip_tac)
  let t228 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t213), t227)
  forall_pad2d3d_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Cart[Real, Tybit1[Unit]]) -> Bool, (∀ y : Cart[Real, Tybit1[Unit]], op_dollar(y, 3) == real_of_num(0) → P(y)) == (∀ x : Cart[Real, Tybit0[Unit]], P(pad2d3d(x)))"), t228))
}

///|
let forall_pad2d3d_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_PAD2D3D_THM")

///|
/// `FORALL_PAD2D3D_THM`
pub fn forall_pad2d3d_thm() -> @kernel.Thm {
  forall_pad2d3d_thm_c.get()
}

///|
/// QUANTIFY_PAD2D3D_THM
fn step_13() -> Unit raise {
  let t230 = @meson.meson_tac(@list.List([]))
  let t229 = @simp.rewrite_tac(@list.List([@equal.gsym(forall_pad2d3d_thm())]))
  let t231 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ y : _, (P : (_) -> Bool)(y)) == !(∀ x : _, !P(x))"))])), t229), t230)
  quantify_pad2d3d_thm_c.set(@tactics.prove(@term_syntax.parse_term("(∀ P : (Cart[Real, Tybit1[Unit]]) -> Bool, (∀ y : Cart[Real, Tybit1[Unit]], op_dollar(y, 3) == real_of_num(0) → P(y)) == (∀ x : Cart[Real, Tybit0[Unit]], P(pad2d3d(x)))) && (∀ P : (Cart[Real, Tybit1[Unit]]) -> Bool, (∃ y : Cart[Real, Tybit1[Unit]], op_dollar(y, 3) == real_of_num(0) && P(y)) == (∃ x : Cart[Real, Tybit0[Unit]], P(pad2d3d(x))))"), t231))
}

///|
let quantify_pad2d3d_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUANTIFY_PAD2D3D_THM")

///|
/// `QUANTIFY_PAD2D3D_THM`
pub fn quantify_pad2d3d_thm() -> @kernel.Thm {
  quantify_pad2d3d_thm_c.get()
}

///|
/// LINEAR_PAD2D3D
fn step_14() -> Unit raise {
  let t234 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t233 = @tactics.repeat_tac(@tactics.strip_tac)
  let t232 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @cart.lambda_beta(), @cart.dimindex_2(), @cart.dimindex_3(), @calc_num.arith(), @int.arith_rule(@term_syntax.parse_term("(i : Num) < 3 → i <= 2"))]))
  let t235 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.linear(), pad2d3d()])), t232), t233), t234), @calc_rat.real_arith_tac)
  linear_pad2d3d_c.set(@tactics.prove(@term_syntax.parse_term("linear(pad2d3d)"), t235))
}

///|
let linear_pad2d3d_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_PAD2D3D")

///|
/// `LINEAR_PAD2D3D`
pub fn linear_pad2d3d() -> @kernel.Thm {
  linear_pad2d3d_c.get()
}

///|
/// INJECTIVE_PAD2D3D
fn step_15() -> Unit raise {
  let t237 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) <= 2 → i <= 3"))]))
  let t236 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) < 3) == (i <= 2)"))]))
  let t238 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), pad2d3d(), @cart.lambda_beta(), @cart.dimindex_3(), @cart.dimindex_2()])), t236), t237)
  injective_pad2d3d_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : Cart[Real, Tybit0[Unit]], pad2d3d(x) == pad2d3d(y) → x == y"), t238))
}

///|
let injective_pad2d3d_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJECTIVE_PAD2D3D")

///|
/// `INJECTIVE_PAD2D3D`
pub fn injective_pad2d3d() -> @kernel.Thm {
  injective_pad2d3d_c.get()
}

///|
/// NORM_PAD2D3D
fn step_16() -> Unit raise {
  let t239 = @tactics.then_tac(@simp.simp_tac(@list.List([@vectors.norm_eq(), @vectors.dot_2(), @vectors.dot_3(), pad2d3d(), @cart.lambda_beta(), @cart.dimindex_2(), @cart.dimindex_3(), @calc_num.arith()])), @calc_rat.real_arith_tac)
  norm_pad2d3d_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], norm(pad2d3d(x)) == norm(x)"), t239))
}

///|
let norm_pad2d3d_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_PAD2D3D")

///|
/// `NORM_PAD2D3D`
pub fn norm_pad2d3d() -> @kernel.Thm {
  norm_pad2d3d_c.get()
}

///|
/// PAD2D3D_QUANTIFY_CONV
fn step_17() -> Unit raise {
  let gv = @basics.genvar(@parser.parse_type("real^2"))
  let pth = @equal.conv_rule(@equal.binop_conv(@equal.binder_conv(@equal.rand_conv(@equal.gen_alpha_conv(gv)))), quantify_pad2d3d_thm())
  let conv1 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x240 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x240
  }, @list.List([pth]))
  let dest_quant : (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise = fn(x241 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    let tm = x241
    try {
      @basics.dest_forall(tm)
    } catch {
      Failure(_) => @basics.dest_exists(tm)
      e => raise e
    }
  }
  pad2d3d_quantify_conv_c.set(fn(x242 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x242
    let th = conv1(tm_1)
    let name = @kernel.dest_var(dest_quant(tm_1).0).0
    let ty = @kernel.dest_var(dest_quant(@kernel.rand(@kernel.concl(th))).0).1
    @equal.conv_rule(@equal.rand_conv(@equal.gen_alpha_conv(@kernel.mk_var(name, ty))), th)
  })
}

///|
let pad2d3d_quantify_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("PAD2D3D_QUANTIFY_CONV")

///|
/// `PAD2D3D_QUANTIFY_CONV`
pub fn pad2d3d_quantify_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (pad2d3d_quantify_conv_c.get())(x)
}

///|
/// PAD2D3D_TAC
fn step_18() -> Unit raise {
  let pad2d3d_tm = @term_syntax.parse_term("pad2d3d")
  let pths = @list.List([linear_pad2d3d(), injective_pad2d3d(), norm_pad2d3d()])
  let t243 = @meson.meson_tac(@list.List([linear_pad2d3d(), @vectors.linear_0()]))
  let t244 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.image_clauses()])), t243)
  let cth = @tactics.prove(@term_syntax.parse_term("{} == IMAGE(pad2d3d, {}) && vec(0) == pad2d3d(vec(0))"), t244)
  let lasttac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @simp.gen_rewrite_tac(fn(x245 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s246 = @equal.redepth_conv(x245)
    fn(x247 : @kernel.Term) -> @kernel.Thm raise {
      s246(x247)
    }
  }, @list.List([@determinants.linear_invariants(pad2d3d_tm)(pths)]))
  pad2d3d_tac_c.set(fn(x248 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let gl = x248
    let t252 = @tactics.conv_tac(@equal.depth_conv(pad2d3d_quantify_conv))
    @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x249 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s250 = @equal.once_depth_conv(x249)
      fn(x251 : @kernel.Term) -> @kernel.Thm raise {
        s250(x251)
      }
    }, @list.List([cth])), t252), lasttac)(gl)
  })
}

///|
let pad2d3d_tac_c : @lib.Cell[(@tactics.Goal) -> @tactics.Goalstate raise] = @lib.Cell::new("PAD2D3D_TAC")

///|
/// `PAD2D3D_TAC`
pub fn pad2d3d_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (pad2d3d_tac_c.get())(x)
}

///|
/// ROTATION_HORIZONTAL_LINE
fn step_19() -> Unit raise {
  let t264 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_ge_1()]))
  let t263 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 1) && 1 <= n → 2 <= n")))
  let t262 = @simp.rewrite_tac(@list.List([@vectors.real_abs_norm(), @realarith.real_mul_rid()]))
  let t261 = @simp.simp_tac(@list.List([@vectors.norm_mul(), @vectors.norm_basis(), @arith.le_refl(), @cart.dimindex_ge_1()]))
  let t260 = @tactics.match_mp_tac(@determinants.rotation_exists())
  let t259 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 < (k : Num) → !(k == 1)")), @calc_int.real_mul_rzero()]))
  let t258 = @simp.simp_tac(@list.List([@vectors.vector_mul_component(), @arith.lt_imp_le(), @vectors.basis_component()]))
  let t265 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(op_pct : (Real, Cart[Real, N]) -> Cart[Real, N])((norm : (Cart[Real, N]) -> Real)((a : Cart[Real, N])), (basis : (Num) -> Cart[Real, N])(1))")), t258), t259), t260), t261), t262), t263), t264)
  let t257 = @simp.asm_simp_tac(@list.List([@determinants.det_i(), @vectors.matrix_id(), @determinants.orthogonal_transformation_id(), @arith.lte_antisym()]))
  let t256 = @term_syntax.parse_term("(x : Cart[Real, N]) => x")
  let t266 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x253 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s254 = @tactics.exists_tac(x253)
    fn(x255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s254(x255)
    }
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t256])), t257), t265])
  let t267 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) == 1"))), t266)
  rotation_horizontal_line_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∃ b : Cart[Real, N], ∃ f : (Cart[Real, N]) -> Cart[Real, N], (orthogonal_transformation : ((Cart[Real, N]) -> Cart[Real, N]) -> Bool)(f) && (det : (Cart[Cart[Real, N], N]) -> Real)((matrix : ((Cart[Real, N]) -> Cart[Real, N]) -> Cart[Cart[Real, N], N])(f)) == real_of_num(1) && f(b) == a && (∀ k : Num, 1 < k && k <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (op_dollar : (Cart[Real, N], Num) -> Real)(b, k) == real_of_num(0))"), t267))
}

///|
let rotation_horizontal_line_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ROTATION_HORIZONTAL_LINE")

///|
/// `ROTATION_HORIZONTAL_LINE`
pub fn rotation_horizontal_line() -> @kernel.Thm {
  rotation_horizontal_line_c.get()
}

///|
/// GEOM_HORIZONTAL_LINE_RULE
fn step_20() -> Unit raise {
  let t275 = @meson.asm_meson_tac(@list.List([@determinants.orthogonal_transformation_surjective()]))
  let t276 = @tactics.then_tac(@tactics.match_mp_tac(@vectors.quantify_surjection_thm()), t275)
  let t274 = @meson.meson_tac(@list.List([@vectors.linear_0()]))
  let t272 = @drule.match_mp(@determinants.orthogonal_transformation_linear())
  let t277 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s270 = @tactics.mp_tac(x269)
      fn(x271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s270(x271)
      }
    })(t272(x273))
  }), t274), t276])
  let t268 = @simp.rewrite_tac(@list.List([@sets.image_clauses()]))
  let t278 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t268), @tactics.conj_tac), t277)
  let pth = @tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, N], orthogonal_transformation(f) → (vec(0) == f(vec(0)) && {} == IMAGE(f, {})) && ((∀ P : (Cart[Real, N]) -> Bool, (∀ x : Cart[Real, N], P(x)) == (∀ x : Cart[Real, N], P(f(x)))) && (∀ P : (Cart[Real, N]) -> Bool, (∃ x : Cart[Real, N], P(x)) == (∃ x : Cart[Real, N], P(f(x)))) && (∀ Q : ((Cart[Real, N]) -> Bool) -> Bool, (∀ s : (Cart[Real, N]) -> Bool, Q(s)) == (∀ s : (Cart[Real, N]) -> Bool, Q(IMAGE(f, s)))) && (∀ Q : ((Cart[Real, N]) -> Bool) -> Bool, (∃ s : (Cart[Real, N]) -> Bool, Q(s)) == (∃ s : (Cart[Real, N]) -> Bool, Q(IMAGE(f, s))))) && (∀ P : (Cart[Real, N]) -> Bool, {(x : Cart[Real, N]) | P(x)} == IMAGE(f, {(x : Cart[Real, N]) | P(f(x))}))"), t278)
  let t281 = @meson.asm_meson_tac(@list.List([@determinants.orthogonal_transformation_v1()]))
  let t282 = @meson.asm_meson_tac(@list.List([@determinants.orthogonal_transformation_surjective()]))
  let t283 = @meson.asm_meson_tac(@list.List([@determinants.orthogonal_transformation_injective()]))
  let t284 = @list.List([@simp.asm_simp_tac(@list.List([@determinants.orthogonal_transformation_linear()])), t283, t282, t281])
  let t280 = @tactics.repeat_tac(@tactics.conj_tac)
  let t279 = @simp.asm_rewrite_tac(@list.List([]))
  let t285 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t279), t280), t284)
  let oth = @tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, N], (orthogonal_transformation : ((Cart[Real, N]) -> Cart[Real, N]) -> Bool)(f) && (det : (Cart[Cart[Real, N], N]) -> Real)((matrix : ((Cart[Real, N]) -> Cart[Real, N]) -> Cart[Cart[Real, N], N])(f)) == real_of_num(1) → (linear : ((Cart[Real, N]) -> Cart[Real, N]) -> Bool)(f) && (∀ x : Cart[Real, N], ∀ y : Cart[Real, N], f(x) == f(y) → x == y) && (∀ y : Cart[Real, N], ∃ x : Cart[Real, N], f(x) == y) && (∀ x : Cart[Real, N], (norm : (Cart[Real, N]) -> Real)(f(x)) == (norm : (Cart[Real, N]) -> Real)(x)) && (2 <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (det : (Cart[Cart[Real, N], N]) -> Real)((matrix : ((Cart[Real, N]) -> Cart[Real, N]) -> Cart[Cart[Real, N], N])(f)) == real_of_num(1))"), t285)
  let t287 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 < 2 && 1 < 3"))]))
  let t286 = @int.arith_rule(@term_syntax.parse_term("((k : Num) <= 2) == (k == 2 || !(1 < k))"))
  let t288 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.dimindex_2(), @cart.dimindex_3(), @int.arith_rule(@term_syntax.parse_term("((k : Num) <= 3) == (k == 3 || k <= 2)")), t286])), t287)
  let sth = @tactics.prove(@term_syntax.parse_term("(∀ k : Num, 1 < k && k <= (dimindex : ((Tybit0[Unit]) -> Bool) -> Num)((UNIV : (Tybit0[Unit]) -> Bool)) → (op_dollar : (Cart[Real, _], Num) -> Real)((b : Cart[Real, _]), k) == real_of_num(0)) == ((op_dollar : (Cart[Real, _], Num) -> Real)(b, 2) == real_of_num(0)) && (∀ k : Num, 1 < k && k <= (dimindex : ((Tybit1[Unit]) -> Bool) -> Num)((UNIV : (Tybit1[Unit]) -> Bool)) → (op_dollar : (Cart[Real, _], Num) -> Real)(b, k) == real_of_num(0)) == ((op_dollar : (Cart[Real, _], Num) -> Real)(b, 2) == real_of_num(0) && (op_dollar : (Cart[Real, _], Num) -> Real)(b, 3) == real_of_num(0))"), t288)
  let sfn : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(fn(x289 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s290 = @equal.once_depth_conv(x289)
    fn(x291 : @kernel.Term) -> @kernel.Thm raise {
      s290(x291)
    }
  }, @list.List([sth]))
  geom_horizontal_line_rule_c.set(fn(x292 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x292
    let (x, bod) = @basics.dest_forall(tm)
    let th1 = @determinants.exists_genvar_rule(sfn(@bool.ispec(x, rotation_horizontal_line())))
    match @basics.strip_exists(@kernel.concl(th1)) {
      (More(a, tail=More(f, tail=Empty)), tm1) => {
        let (th_orth, th2) = @bool.conj_pair(@kernel.assume_rule(tm1))
        let (th_det, th2a) = @bool.conj_pair(th2)
        let (th_works, th_zero) = @bool.conj_pair(th2a)
        let (thc, thq) = @bool.conj_pair(@bool.prove_hyp(th2, @bool.undisch(@bool.ispec(f, pth))))
        let t294 = @vectors.expand_quants_conv(@kernel.assume_rule(@kernel.concl(thq)))(bod)
        let t293 = @bool.conjuncts_rule(thc)
        let th3 = @equal.conv_rule(@equal.rand_conv(@equal.subs_conv(t293.prepend(@equal.gsym(th_works)))), t294)
        let th4 = @bool.prove_hyp(thq, th3)
        let t295 = @bool.conj(th_orth, th_det)
        let thps = @bool.conjuncts_rule(@drule.match_mp(oth)(t295))
        let th5 = @determinants.linear_invariants(f)(thps)
        let th6 = @bool.prove_hyp(th_orth, @simp.gen_rewrite_rule(fn(x302 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(x296 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s297 = @equal.rand_conv(x296)
            fn(x298 : @kernel.Term) -> @kernel.Thm raise {
              s297(x298)
            }
          })((fn(x299 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s300 = @equal.redepth_conv(x299)
            fn(x301 : @kernel.Term) -> @kernel.Thm raise {
              s300(x301)
            }
          })(x302))
        }, @list.List([th5]))(th4))
        let t303 = @kernel.rand(@kernel.concl(th6))
        let ntm = @bool.mk_forall(a, @bool.mk_imp(@kernel.concl(th_zero), t303))
        let th7 = @bool.mp(@bool.spec(a, @kernel.assume_rule(ntm)), th_zero)
        let th8 = @bool.disch(ntm, @kernel.eq_mp(@equal.sym(th6), th7))
        if (@lib.intersect(@kernel.frees(@kernel.concl(th8)), @list.List([a, f])) == @list.List([])) {
          let th9 = @bool.prove_hyp(th1, @lib.itlist(@bool.simple_choose, @list.List([a, f]), th8))
          let th10 = @bool.disch(ntm, @bool.gen(x, @bool.undisch(th9)))
          @equal.conv_rule(@equal.land_conv(@equal.gen_alpha_conv(x)), th10)
        } else {
          let t304 = @kernel.rand(@kernel.concl(th6))
          let mtm = @bool.list_mk_forall(@list.List([a, f]), @bool.mk_imp(@lib.hd(@kernel.hyp(th8)), t304))
          let t305 = @bool.undisch(@bool.specl(@list.List([a, f]), @kernel.assume_rule(mtm)))
          let th9_1 = @kernel.eq_mp(@equal.sym(th6), t305)
          let th10_1 = @lib.itlist(@bool.simple_choose, @list.List([a, f]), @bool.disch(mtm, th9_1))
          let th11 = @bool.gen(x, @bool.prove_hyp(th1, th10_1))
          @drule.match_mp(@theorems.mono_forall())(th11)
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:357")
    }
  })
}

///|
let geom_horizontal_line_rule_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("GEOM_HORIZONTAL_LINE_RULE")

///|
/// `GEOM_HORIZONTAL_LINE_RULE`
pub fn geom_horizontal_line_rule(x : @kernel.Term) -> @kernel.Thm raise {
  (geom_horizontal_line_rule_c.get())(x)
}

///|
/// `GEOM_HORIZONTAL_LINE_TAC`
pub fn geom_horizontal_line_tac(x306 : @kernel.Term, x307 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let l = x306
  let (asl, w) as gl = x307
  let (avs, bod) = @basics.strip_forall(w)
  let t311 = @kernel.freesl(@lib.map(fn(x310 : (String, @kernel.Thm)) -> @kernel.Term raise {
    (fn(x308 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x308)
    })((fn(x309 : (String, @kernel.Thm)) -> @kernel.Thm raise {
      x309.1
    })(x310))
  }, asl))
  let avs_p = @lib.subtract(@kernel.frees(w), t311)
  let t315 = @tactics.spec_tac(l, l)
  let t314 = @tactics.map_every(fn(x312 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x312
    @tactics.spec_tac(t, t)
  }, @lib.rev(@lib.subtract(avs.concat(avs_p), @list.List([l]))))
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, avs), t314), t315), fn(x319 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x318 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x316 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        @tactics.match_mp_tac(geom_horizontal_line_rule(x316))
      })((fn(x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x317.1
      })(x318))
    })(x319)(x319)
  })(gl)
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
}
