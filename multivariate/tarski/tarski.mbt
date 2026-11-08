// Translated from upstream Multivariate/tarski.ml; edit this file directly.

///|
/// TARSKI_AXIOM_1_EUCLIDEAN
fn step_1() -> Unit raise {
  tarski_axiom_1_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], distance((a, b)) == distance((b, a))"), @vectors.norm_arith_tac))
}

///|
let tarski_axiom_1_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_1_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_1_EUCLIDEAN`
pub fn tarski_axiom_1_euclidean() -> @kernel.Thm {
  tarski_axiom_1_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_2_EUCLIDEAN
fn step_2() -> Unit raise {
  tarski_axiom_2_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ p : Cart[Real, _], ∀ q : Cart[Real, _], ∀ r : Cart[Real, _], ∀ s : Cart[Real, _], distance((a, b)) == distance((p, q)) && distance((a, b)) == distance((r, s)) → distance((p, q)) == distance((r, s))"), @calc_rat.real_arith_tac))
}

///|
let tarski_axiom_2_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_2_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_2_EUCLIDEAN`
pub fn tarski_axiom_2_euclidean() -> @kernel.Thm {
  tarski_axiom_2_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_3_EUCLIDEAN
fn step_3() -> Unit raise {
  tarski_axiom_3_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], ∀ c : Cart[Real, _], distance((a, b)) == distance((c, c)) → a == b"), @vectors.norm_arith_tac))
}

///|
let tarski_axiom_3_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_3_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_3_EUCLIDEAN`
pub fn tarski_axiom_3_euclidean() -> @kernel.Thm {
  tarski_axiom_3_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_4_EUCLIDEAN
fn step_4() -> Unit raise {
  let t7 = @simp.asm_simp_tac(@list.List([@real.real_div_rmul(), @vectors.norm_eq_0()]))
  let t6 = @simp.simp_tac(@list.List([@real.real_abs_refl(), @realarith.real_pos(), @realarith.real_le_add(), @real.real_le_div(), @vectors.norm_pos_le()]))
  let t8 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("(a : Real) == real_of_num(1) + (b : Real) → a * (q : Real) == q + b * q"))), t6), t7])
  let t5 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_mul(), @vectors.norm_neg(), @real.real_abs_div(), @vectors.real_abs_norm(), @vectors.vector_arith(@term_syntax.parse_term("(q : Cart[Real, _]) - -op_pct((a : Real), q) == op_pct(real_of_num(1) + a, q)"))]))
  let t4 = @simp.rewrite_tac(@list.List([@vectors.between(), @vectors.dist_0()]))
  let t9 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("-op_pct(distance(((b : Cart[Real, 2]), (c : Cart[Real, 2]))) / norm((q : Cart[Real, 2])), q)")), t4), t5), @tactics.conj_tac), t8)
  let t10 = @list.List([@simp.asm_simp_tac(@list.List([@vectors.between_refl(), @vectors.vector_choose_size(), @vectors.dist_pos_le()])), t9])
  let t3 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Cart[Real, 2]) == vec(0)"))
  let t2 = @simp.rewrite_tac(@list.List([@vectors.dist_0()]))
  let t1 = @tactics.repeat_tac(@tactics.gen_tac)
  let t11 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@determinants.geom_origin_tac(@term_syntax.parse_term("(a : Cart[Real, 2])")), t1), t2), t3), t10)
  tarski_axiom_4_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ q : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∃ x : Cart[Real, 2], between(a, (q, x)) && distance((a, x)) == distance((b, c))"), t11))
}

///|
let tarski_axiom_4_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_4_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_4_EUCLIDEAN`
pub fn tarski_axiom_4_euclidean() -> @kernel.Thm {
  tarski_axiom_4_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_5_EUCLIDEAN
fn step_5() -> Unit raise {
  let t22 = @simp.asm_simp_tac(@list.List([@real.real_eq_mul_rcancel(), @vectors.norm_eq_0(), @realax.real_abs(), @vectors.vector_sub_eq()]))
  let t21 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((b : Cart[Real, N]), b + (x : Cart[Real, N]))) == norm(x)")), @vectors.norm_mul()]))
  let t20 = @tactics.undisch_tac(@term_syntax.parse_term("distance(((b : Cart[Real, N]), (x : Cart[Real, N]))) == distance((b, (y : Cart[Real, N])))"))
  let t19 = @tactics.repeat_tac(@tactics.strip_tac)
  let t18 = @simp.asm_simp_tac(@list.List([]))
  let t15 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@vectors.between_exists_extension()))
  let t17 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x12 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s13 = @tactics.mp_tac(x12)
      fn(x14 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s13(x14)
      }
    })(t15(x16))
  }))
  let t23 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t17), t18), t19), t20), t21), t22)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ x : Cart[Real, N], ∀ y : Cart[Real, N], !(b == a) && between(b, (a, x)) && between(b, (a, y)) && distance((b, x)) == distance((b, y)) → x == y"), t23)
  let t56 = @meson.asm_meson_tac(@list.List([@vectors.between_translation(), @determinants.orthogonal_transformation(), @vectors.norm_arith(@term_syntax.parse_term("distance(((a : Cart[Real, N]) + (x : Cart[Real, N]), a + (y : Cart[Real, N]))) == distance((x, y))")), @determinants.orthogonal_transformation_isometry(), @convex.between_linear_image_eq(), @vectors.dist_eq_0(), @determinants.orthogonal_transformation_injective()]))
  let t54 = @vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) + (x : Cart[Real, N]) == a + (y : Cart[Real, N])) == (x == y)"))
  let t55 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((a : Cart[Real, N]) + (x : Cart[Real, N]), a + (y : Cart[Real, N]))) == distance((x, y))")), @vectors.between_translation(), t54]))
  let t51 = @term_syntax.parse_term("(k : Cart[Real, 2]) + (f : (Cart[Real, 2]) -> Cart[Real, 2])((b : Cart[Real, 2]))")
  let t52 = @tactics.map_every(fn(x48 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s49 = @tactics.exists_tac(x48)
    fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s49(x50)
    }
  }, @list.List([@term_syntax.parse_term("(k : Cart[Real, 2]) + (f : (Cart[Real, 2]) -> Cart[Real, 2])((a : Cart[Real, 2]))"), t51]))
  let t53 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(lemma), t52), @tactics.all_tac])
  let t47 = @tactics.subgoal_then(@term_syntax.parse_term("(x' : Cart[Real, 2]) == (k : Cart[Real, 2]) + (f : (Cart[Real, 2]) -> Cart[Real, 2])((x : Cart[Real, 2]))"), fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s45 = @tactics.subst1_tac(x44)
    fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s45(x46)
    }
  })
  let t43 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x40 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s41 = @tactics.subst_all_tac(x40)
    fn(x42 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s41(x42)
    }
  }))
  let t37 = @tactics.conjuncts_then2(fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s32 = @tactics.assume_tac(x31)
    fn(x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s32(x33)
    }
  }, fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s35 = @tactics.mp_tac(x34)
    fn(x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s35(x36)
    }
  })
  let t38 = @tactics.x_choose_then(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"))(t37)
  let t39 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Cart[Real, 2])"))(t38))
  let t30 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.dist_eq_0(), @vectors.dist_sym()])), @tactics.all_tac])
  let t24 = @term_syntax.parse_term("(c' : Cart[Real, 2])")
  let t25 = @term_syntax.parse_term("(b' : Cart[Real, 2])")
  let t26 = @term_syntax.parse_term("(a' : Cart[Real, 2])")
  let t27 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t28 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t29 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t28, t27, t26, t25, t24]), @convex.rigid_transformation_between_3()))
  let t57 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t29), @tactics.ants_tac), t30), t39), t43), t47), t53), t55), t56)
  tarski_axiom_5_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ a' : Cart[Real, 2], ∀ b' : Cart[Real, 2], ∀ c' : Cart[Real, 2], ∀ x' : Cart[Real, 2], !(a == b) && distance((a, b)) == distance((a', b')) && distance((a, c)) == distance((a', c')) && distance((b, c)) == distance((b', c')) && between(b, (a, x)) && between(b', (a', x')) && distance((b, x)) == distance((b', x')) → distance((c, x)) == distance((c', x'))"), t57))
}

///|
let tarski_axiom_5_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_5_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_5_EUCLIDEAN`
pub fn tarski_axiom_5_euclidean() -> @kernel.Thm {
  tarski_axiom_5_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_6_EUCLIDEAN
fn step_6() -> Unit raise {
  let t58 = @simp.simp_tac(@list.List([@vectors.between_refl_eq()]))
  tarski_axiom_6_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Cart[Real, _], between(b, (a, a)) → a == b"), t58))
}

///|
let tarski_axiom_6_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_6_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_6_EUCLIDEAN`
pub fn tarski_axiom_6_euclidean() -> @kernel.Thm {
  tarski_axiom_6_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_7_EUCLIDEAN
fn step_7() -> Unit raise {
  let t122 = @list.List([@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@realax.real_le_mul())), @tactics.all_tac])
  let t121 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (real_of_num(1) - (d : Real)) * (real_of_num(1) + (e : Real)) && real_of_num(0) <= d * e"), fn(x118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s119 = @tactics.mp_tac(x118)
    fn(x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s119(x120)
    }
  })
  let t117 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_le_rdiv_eq()]))
  let t123 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(real_of_num(1) - (d : Real) + ((e : Real) - d * e)) / (real_of_num(1) - d + e)")), t117), t121), t122), @calc_rat.asm_real_arith_tac)
  let t116 = @tactics.conv_tac(@calc_rat.real_field)
  let t115 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) - (d : Real) + (e : Real)"))
  let t114 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.basis_component(), @vectors.vec_component(), @calc_num.arith(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vector_sub_component()]))
  let t113 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t112 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @real.real_le_rdiv_eq()]))
  let t124 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(e : Real) / (real_of_num(1) - (d : Real) + e)")), t112), t113), t114), t115), t116), t123])
  let t125 = @tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(op_pct : (Real, Cart[Real, 2]) -> Cart[Real, 2])((real_of_num(1) - (d : Real) + ((e : Real) - d * e)) / (real_of_num(1) - d + e), (basis : (Num) -> Cart[Real, 2])(1))")), @tactics.conj_tac), t124)
  let t111 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_rid(), @theorems.imp_imp()]))
  let t110 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @vectors.vector_mul_lzero(), @vectors.vector_mul_rzero()]))
  let t109 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s102 = @tactics.mp_tac(x101)
      fn(x103 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s102(x103)
      }
    })(((x107 : @kernel.Thm) => @lib.check(fn(x106 : @kernel.Thm) -> Bool raise {
      (fn(x104 : @kernel.Term) -> Bool raise {
        @basics.is_eq(x104)
      })((fn(x105 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x105)
      })(x106))
    }, x107))(x108))
  }))
  let t126 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(d : Real) == real_of_num(1) && (e : Real) == real_of_num(0)")), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t109), t110), t111), t125])
  let t100 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < real_of_num(1) - (d : Real) + (e : Real)"), fn(x97 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s98 = @tactics.assume_tac(x97)
    fn(x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s98(x99)
    }
  })
  let t96 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_add_lid()]))
  let t95 = @simp.asm_rewrite_tac(@list.List([@topology.between_in_segment(), @topology.in_segment()]))
  let t94 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t93 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t90 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@vectors.between_exists_extension()))
  let t84 = @simp.rewrite_rule(@list.List([@topology.between_in_segment(), @topology.in_segment()]))
  let t85 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac)
  let t92 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x86 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t85(t84(x86))
  }, fn(x91 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x87 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s88 = @tactics.mp_tac(x87)
      fn(x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s88(x89)
      }
    })(t90(x91))
  }))
  let t83 = @simp.once_rewrite_tac(@list.List([@vectors.between_sym()]))
  let t82 = @tactics.repeat_tac(@tactics.gen_tac)
  let t81 = @simp.simp_tac(@list.List([@vectors.vector_mul_lid()]))
  let t80 = @tactics.repeat_tac(@tactics.disch_then(fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t78 = @simp.simp_tac(@list.List([@vectors.norm_mul(), @vectors.norm_basis(), @realax.real_abs(), @cart.dimindex_2(), @calc_num.arith(), @realarith.real_mul_rid()]))
  let t76 = @term_syntax.parse_term("(q : Cart[Real, 2])")
  let t74 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2(), @vectors.between(), @vectors.dist_0()]))
  let t73 = @simp.rewrite_tac(@list.List([@vectors.between_refl_eq()]))
  let t75 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.conj_sym()])), t73), t74), @vectors.norm_arith_tac), @tactics.all_tac])
  let t72 = @determinants.geom_normalize_tac(@term_syntax.parse_term("(q : Cart[Real, 2])"))
  let t71 = @determinants.geom_origin_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t69 = @tactics.pop_assum(fn(x66 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s67 = @tactics.mp_tac(x66)
    fn(x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s67(x68)
    }
  })
  let t70 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.between_refl(), @vectors.between_sym()])), t69])
  let t65 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Cart[Real, 2]) == (a : Cart[Real, 2]) && (b : Cart[Real, 2]) == (q : Cart[Real, 2])"))
  let t63 = @tactics.pop_assum(fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s61 = @tactics.mp_tac(x60)
    fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s61(x62)
    }
  })
  let t64 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.between_refl(), @vectors.between_sym()])), t63])
  let t59 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Cart[Real, 2]) == (c : Cart[Real, 2])"))
  let t127 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t59), t64), t65), t70), t71), t72), @tactics.conj_tac), t75), (x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_basis_multiple_tac(1L, t76, x77)), t78), @tactics.gen_tac), t80), t81), t82), t83), @tactics.disch_tac), @tactics.disch_tac), t92), t93), t94), @tactics.strip_tac), t95), t96), t100), t126)
  tarski_axiom_7_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ p : Cart[Real, 2], ∀ q : Cart[Real, 2], between(p, (a, c)) && between(q, (b, c)) → (∃ x : Cart[Real, 2], between(x, (p, b)) && between(x, (q, a)))"), t127))
}

///|
let tarski_axiom_7_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_7_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_7_EUCLIDEAN`
pub fn tarski_axiom_7_euclidean() -> @kernel.Thm {
  tarski_axiom_7_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_8_EUCLIDEAN
fn step_8() -> Unit raise {
  let t137 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t136 = @simp.simp_tac(@list.List([@vectors.basis_component(), @vectors.vec_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t133 = @term_syntax.parse_term("(basis : (Num) -> Cart[Real, 2])(2)")
  let t134 = @term_syntax.parse_term("(basis : (Num) -> Cart[Real, 2])(1)")
  let t135 = @tactics.map_every(fn(x130 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s131 = @tactics.exists_tac(x130)
    fn(x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s131(x132)
    }
  }, @list.List([@term_syntax.parse_term("(vec : (Num) -> Cart[Real, 2])(0)"), t134, t133]))
  let t129 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.collinear_between_cases()), @vectors.collinear_3_2d()]))
  let t128 = @simp.once_rewrite_tac(@list.List([@vectors.between_sym()]))
  let t138 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@class.de_morgan_thm())])), t128), t129), t135), t136), t137)
  tarski_axiom_8_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∃ a : Cart[Real, 2], ∃ b : Cart[Real, 2], ∃ c : Cart[Real, 2], !between(b, (a, c)) && !between(c, (b, a)) && !between(a, (c, b))"), t138))
}

///|
let tarski_axiom_8_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_8_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_8_EUCLIDEAN`
pub fn tarski_axiom_8_euclidean() -> @kernel.Thm {
  tarski_axiom_8_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_9_EUCLIDEAN
fn step_9() -> Unit raise {
  let t145 = @tactics.conv_tac(@calc_rat.real_field)
  let t144 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @vectors.vector_sub_component()]))
  let t143 = @simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.collinear_3_2d()]))
  let t142 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) == !(pow(x, 2) == real_of_num(0))"))]))
  let t141 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_eq(), @vectors.norm_arith(@term_syntax.parse_term("!((p : Cart[Real, _]) == (q : Cart[Real, _])) == !(norm(p - q) == real_of_num(0))"))]))
  let t140 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.collinear_between_cases())]))
  let t139 = @simp.once_rewrite_tac(@list.List([@vectors.between_sym()]))
  let t146 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t139), t140), t141), t142), t143), t144), t145)
  tarski_axiom_9_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Cart[Real, 2], ∀ q : Cart[Real, 2], ∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], !(p == q) && distance((a, p)) == distance((a, q)) && distance((b, p)) == distance((b, q)) && distance((c, p)) == distance((c, q)) → between(b, (a, c)) || between(c, (b, a)) || between(a, (c, b))"), t146))
}

///|
let tarski_axiom_9_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_9_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_9_EUCLIDEAN`
pub fn tarski_axiom_9_euclidean() -> @kernel.Thm {
  tarski_axiom_9_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_10_EUCLIDEAN
fn step_10() -> Unit raise {
  let t163 = @equal.gsym(@vectors.between())
  let t164 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.dist()), t163]))
  let t162 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_add_ldistrib()), @real.real_eq_mul_lcancel()]))
  let t161 = @simp.asm_simp_tac(@list.List([@vectors.norm_mul(), @realarith.real_le_add(), @realarith.real_pos(), @realax.real_abs()]))
  let t160 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_sub_lzero(), @vectors.norm_neg(), @vectors.vector_arith(@term_syntax.parse_term("(b : Cart[Real, N]) - op_pct(real_of_num(1) + (u : Real), b) == -op_pct(u, b)"))]))
  let t159 = @simp.asm_rewrite_tac(@list.List([@vectors.between(), @vectors.dist(), @equal.gsym(@vectors.vector_sub_ldistrib())]))
  let t157 = @term_syntax.parse_term("op_pct(real_of_num(1) + (u : Real), (c : Cart[Real, N]))")
  let t158 = @tactics.map_every(fn(x154 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s155 = @tactics.exists_tac(x154)
    fn(x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s155(x156)
    }
  }, @list.List([@term_syntax.parse_term("op_pct(real_of_num(1) + (u : Real), (b : Cart[Real, N]))"), t157]))
  let t153 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Real)"))
  let t152 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @vectors.vector_arith(@term_syntax.parse_term("(d : Cart[Real, N]) + op_pct((u : Real), d - vec(0)) == op_pct(real_of_num(1) + u, d)"))]))
  let t149 = @term_syntax.parse_term("(t : Cart[Real, N])")
  let t150 = @term_syntax.parse_term("(d : Cart[Real, N])")
  let t151 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(vec : (Num) -> Cart[Real, N])(0)"), t150, t149]), @vectors.between_exists_extension()))
  let t148 = @tactics.repeat_tac(@tactics.strip_tac)
  let t147 = @determinants.geom_origin_tac(@term_syntax.parse_term("(a : Cart[Real, N])"))
  let t165 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t147), t148), t151), t152), t153), @tactics.strip_tac), t158), t159), t160), t161), t162), t164), @calc_rat.real_arith_tac)
  tarski_axiom_10_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ c : Cart[Real, N], ∀ d : Cart[Real, N], ∀ t : Cart[Real, N], between(d, (a, t)) && between(d, (b, c)) && !(a == d) → (∃ x : Cart[Real, N], ∃ y : Cart[Real, N], between(b, (a, x)) && between(c, (a, y)) && between(t, (x, y)))"), t165))
}

///|
let tarski_axiom_10_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_10_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_10_EUCLIDEAN`
pub fn tarski_axiom_10_euclidean() -> @kernel.Thm {
  tarski_axiom_10_euclidean_c.get()
}

///|
/// TARSKI_AXIOM_11_EUCLIDEAN
fn step_11() -> Unit raise {
  let t267 = @meson.asm_meson_tac(@list.List([@sets.image_eq_empty(), @sets.member_not_empty()]))
  let t266 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : (Real) -> Bool)"), @sets.sup_v1()))
  let t265 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (s : Real) && s <= (y : Real) → abs(x - y) == abs(x - s) + abs(s - y)")))
  let t264 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t263 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t262 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) → (abs(y) == abs(x) + abs(x - y)) == (x <= y)"))]))
  let t261 = @simp.simp_tac(@list.List([@vectors.norm_basis(), @cart.dimindex_ge_1(), @arith.le_refl(), @realarith.real_mul_rid()]))
  let t260 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_rdistrib()), @vectors.norm_mul()]))
  let t259 = @simp.rewrite_tac(@list.List([@vectors.between(), @vectors.dist(), @vectors.norm_arith(@term_syntax.parse_term("norm(vec(0) - (x : Cart[Real, _])) == norm(x)"))]))
  let t258 = @tactics.disch_then(fn(x255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x255
    let t257 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(op_pct : (Real, Cart[Real, 2]) -> Cart[Real, 2])(sup((s : (Real) -> Bool)), (basis : (Num) -> Cart[Real, 2])(1))")), t257)
  })
  let t254 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm(), @sets.forall_in_image()]))
  let t253 = @tactics.remove_then("*", fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s251 = @tactics.mp_tac(x250)
    fn(x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s251(x252)
    }
  })
  let t248 = @tactics.x_choose_then(@term_syntax.parse_term("(t : (Real) -> Bool)"))(@tactics.strip_assume_tac)
  let t249 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(s : (Real) -> Bool)"))(@tactics.strip_assume_tac), t248))
  let t247 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t268 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset_image()])), t247), t249), t253), t254), t258), t259), t260), t261), t262), @tactics.disch_tac), t263), @tactics.disch_tac), t264), @tactics.disch_tac), t265), t266), t267)
  let t244 = @simp.asm_simp_tac(@list.List([@realax.real_mul_linv(), @vectors.vector_mul_lid()]))
  let t243 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @real.real_le_inv_eq(), @vectors.vector_mul_assoc()]))
  let t242 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.vector_mul_assoc())]))
  let t241 = @tactics.exists_tac(@term_syntax.parse_term("inv((u : Real)) * (d : Real)"))
  let t240 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @vectors.vector_mul_eq_0()]))
  let t239 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Real) == real_of_num(0)"))
  let t238 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(fn(x235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s236 = @tactics.mp_tac(x235)
    fn(x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s236(x237)
    }
  }))
  let t234 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_add_lid(), @sets.in_elim_thm()]))
  let t233 = @simp.rewrite_tac(@list.List([@topology.between_in_segment(), @topology.in_segment()]))
  let t232 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_assoc()]))
  let t227 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t228 = @list.List([@term_syntax.parse_term("(z : Cart[Real, 2])"), t227])
  let t231 = @tactics.remove_then("*", fn(x230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s225 = @tactics.mp_tac(x224)
      fn(x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s225(x226)
      }
    })(((x229 : @kernel.Thm) => @bool.specl(t228, x229))(x230))
  })
  let t223 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t222 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @class.de_morgan_thm()]))
  let t221 = @tactics.undisch_tac(@term_syntax.parse_term("!((z : Cart[Real, 2]) == vec(0))"))
  let t220 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t219 = @simp.asm_rewrite_tac(@list.List([]))
  let t216 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t245 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x218 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s214 = @tactics.mp_tac(x213)
      fn(x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s214(x215)
      }
    })(((x217 : @kernel.Thm) => @bool.spec(t216, x217))(x218))
  }), t219), t220), t221), t222), @tactics.strip_tac), t223), @tactics.disch_tac), t231), t232), t233), t234), t238), t239), t240), @tactics.strip_tac), t241), t242), t243), t244)
  let t212 = @meson.asm_meson_tac(@list.List([@vectors.vector_mul_assoc(), @realax.real_le_mul()]))
  let t211 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero(), @vectors.vector_add_lid(), @sets.in_elim_thm()]))
  let t210 = @simp.asm_rewrite_tac(@list.List([@topology.between_in_segment(), @topology.in_segment()]))
  let t205 = @term_syntax.parse_term("(op_pct : (Real, Cart[Real, 2]) -> Cart[Real, 2])((c : Real), (basis : (Num) -> Cart[Real, 2])(1))")
  let t206 = @list.List([@term_syntax.parse_term("(x : Cart[Real, 2])"), t205])
  let t209 = @tactics.first_x_assum(fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s203 = @tactics.mp_tac(x202)
      fn(x204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s203(x204)
      }
    })(((x207 : @kernel.Thm) => @bool.specl(t206, x207))(x208))
  })
  let t246 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])")), @tactics.disch_tac), t209), t210), t211), t212), t245])
  let t201 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t269 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @sets.in_elim_thm()])), t201), @tactics.conj_tac), t246), t268])
  let t200 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((X : (Cart[Real, 2]) -> Bool), IMAGE((c : Real) => op_pct(c, basis(1)), {(c : Real) | real_of_num(0) <= c})) && SUBSET((Y : (Cart[Real, 2]) -> Bool), IMAGE((c : Real) => op_pct(c, basis(1)), {(c : Real) | real_of_num(0) <= c}))"), fn(x197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s198 = @tactics.mp_tac(x197)
    fn(x199 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s198(x199)
    }
  })
  let t196 = @tactics.disch_then(fn(x193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s194 = ((x192 : @kernel.Thm) => @tactics.label_tac("*", x192))(x193)
    fn(x195 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s194(x195)
    }
  })
  let t191 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t190 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp()]))
  let t189 = @tactics.repeat_tac(@tactics.gen_tac)
  let t188 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Real)"))
  let t186 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t184 = @tactics.repeat_tac(@tactics.pop_assum(fn(x181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s182 = @tactics.mp_tac(x181)
    fn(x183 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s182(x183)
    }
  }))
  let t185 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t184])
  let t179 = @tactics.choose_then(fn(x176 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s177 = @tactics.mp_tac(x176)
    fn(x178 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s177(x178)
    }
  })
  let t180 = @tactics.subgoal_then(@term_syntax.parse_term("∃ c : Cart[Real, 2], IN(c, (Y : (Cart[Real, 2]) -> Bool))"), t179)
  let t175 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t174 = @class.asm_cases_tac(@term_syntax.parse_term("(Y : (Cart[Real, 2]) -> Bool) == {}"))
  let t172 = @tactics.pop_assum(fn(x169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s170 = @tactics.mp_tac(x169)
    fn(x171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s170(x171)
    }
  })
  let t173 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.between_refl()])), t172])
  let t168 = @class.asm_cases_tac(@term_syntax.parse_term("∀ x : Cart[Real, 2], IN(x, (X : (Cart[Real, 2]) -> Bool)) → x == vec(0)"))
  let t167 = @tactics.repeat_tac(@tactics.gen_tac)
  let t166 = @determinants.geom_origin_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t270 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])), t166), t167), t168), t173), t174), t175), t180), t185), (x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_basis_multiple_tac(1L, t186, x187)), t188), @tactics.disch_tac), t189), @tactics.disch_tac), @tactics.disch_tac), t190), t191), t196), t200), t269)
  tarski_axiom_11_euclidean_c.set(@tactics.prove(@term_syntax.parse_term("∀ X : (Cart[Real, 2]) -> Bool, ∀ Y : (Cart[Real, 2]) -> Bool, (∃ a : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], IN(x, X) && IN(y, Y) → between(x, (a, y))) → (∃ b : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], IN(x, X) && IN(y, Y) → between(b, (x, y)))"), t270))
}

///|
let tarski_axiom_11_euclidean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TARSKI_AXIOM_11_EUCLIDEAN")

///|
/// `TARSKI_AXIOM_11_EUCLIDEAN`
pub fn tarski_axiom_11_euclidean() -> @kernel.Thm {
  tarski_axiom_11_euclidean_c.get()
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
}
