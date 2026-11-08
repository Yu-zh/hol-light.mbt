// Translated from upstream 100/cubedissection.ml; edit this file directly.

///|
/// cube
fn step_1() -> Unit raise {
  cube_c.set(@pair.new_definition(@term_syntax.parse_term("(cube : ((Cart[Real, N]) -> Bool) -> Bool)((k : (Cart[Real, N]) -> Bool)) == (∃ a : Cart[Real, N], ∃ d : Real, real_of_num(0) < d && k == interval([(a, a + op_pct(d, vec(1)))]))")))
}

///|
let cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cube")

///|
/// `cube`
pub fn cube() -> @kernel.Thm {
  cube_c.get()
}

///|
/// CUBE_IMP_NONEMPTY_INTERIOR
fn step_2() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([@vectors.vec_component()]))
  let t1 = @simp.simp_tac(@list.List([@vectors.interval_ne_empty(), @vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t3 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([cube(), @theorems.left_imp_exists_thm(), @topology.interior_interval()])), t1), t2), @calc_rat.real_arith_tac)
  cube_imp_nonempty_interior_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : (Cart[Real, N]) -> Bool, cube(k) → !(interior(k) == {})"), t3))
}

///|
let cube_imp_nonempty_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_IMP_NONEMPTY_INTERIOR")

///|
/// `CUBE_IMP_NONEMPTY_INTERIOR`
pub fn cube_imp_nonempty_interior() -> @kernel.Thm {
  cube_imp_nonempty_interior_c.get()
}

///|
/// CUBE_IMP_NONEMPTY
fn step_3() -> Unit raise {
  let t4 = @meson.meson_tac(@list.List([cube_imp_nonempty_interior(), @topology.interior_empty()]))
  cube_imp_nonempty_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : (Cart[Real, N]) -> Bool, cube(k) → !(k == {})"), t4))
}

///|
let cube_imp_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_IMP_NONEMPTY")

///|
/// `CUBE_IMP_NONEMPTY`
pub fn cube_imp_nonempty() -> @kernel.Thm {
  cube_imp_nonempty_c.get()
}

///|
/// interval_length
fn step_4() -> Unit raise {
  interval_length_c.set(@pair.new_definition(@term_syntax.parse_term("(interval_length : ((Cart[Real, N]) -> Bool) -> Real)((s : (Cart[Real, N]) -> Bool)) == (if s == {} { real_of_num(0) } else { op_dollar(interval_upperbound(s), 1) - op_dollar(interval_lowerbound(s), 1) })")))
}

///|
let interval_length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interval_length")

///|
/// `interval_length`
pub fn interval_length() -> @kernel.Thm {
  interval_length_c.get()
}

///|
/// INTERVAL_LENGTH_CUBE
fn step_5() -> Unit raise {
  let t10 = @meson.asm_meson_tac(@list.List([@arith.le_refl(), @cart.dimindex_ge_1()]))
  let t9 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (d : Real) < a) == (d < real_of_num(0))"))]))
  let t8 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Real) < real_of_num(0)"))
  let t7 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @vectors.interval_eq_empty(), @real.real_add_sub(), @realarith.real_mul_rid(), @calc_rat.real_arith(@term_syntax.parse_term("max((d : Real), real_of_num(0)) == (if d < real_of_num(0) { real_of_num(0) } else { d })"))]))
  let t6 = @simp.simp_tac(@list.List([@integration.interval_upperbound_nonempty(), @integration.interval_lowerbound_nonempty()]))
  let t5 = @simp.rewrite_tac(@list.List([interval_length()]))
  let t11 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t5), t6), t7), t8), t9), t10)
  interval_length_cube_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ d : Real, interval_length(interval([(a, a + op_pct(d, vec(1)))])) == max(d, real_of_num(0))"), t11))
}

///|
let interval_length_cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_LENGTH_CUBE")

///|
/// `INTERVAL_LENGTH_CUBE`
pub fn interval_length_cube() -> @kernel.Thm {
  interval_length_cube_c.get()
}

///|
/// INTERVAL_LENGTH_CUBE_COMPONENT
fn step_6() -> Unit raise {
  let t15 = @simp.asm_simp_tac(@list.List([@vectors.interval_ne_empty(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), @real.real_le_addr(), @realarith.real_lt_imp_le(), @integration.interval_lowerbound_v1(), @integration.interval_upperbound_v1()]))
  let t14 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.cond_swap())]))
  let t13 = @simp.rewrite_tac(@list.List([interval_length()]))
  let t12 = @tactics.repeat_tac(@tactics.strip_tac)
  let t16 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cube()])), t12), t13), t14), t15), @calc_rat.real_arith_tac)
  interval_length_cube_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : (Cart[Real, N]) -> Bool, ∀ i : Num, cube(k) → op_dollar(interval_upperbound(k), i) - op_dollar(interval_lowerbound(k), i) == interval_length(k)"), t16))
}

///|
let interval_length_cube_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_LENGTH_CUBE_COMPONENT")

///|
/// `INTERVAL_LENGTH_CUBE_COMPONENT`
pub fn interval_length_cube_component() -> @kernel.Thm {
  interval_length_cube_component_c.get()
}

///|
/// INTERVAL_LENGTH_CUBE_POS
fn step_7() -> Unit raise {
  let t17 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interval_length_cube()])), @calc_rat.real_arith_tac)
  interval_length_cube_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ d : Real, real_of_num(0) < d → interval_length(interval([(a, a + op_pct(d, vec(1)))])) == d"), t17))
}

///|
let interval_length_cube_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_LENGTH_CUBE_POS")

///|
/// `INTERVAL_LENGTH_CUBE_POS`
pub fn interval_length_cube_pos() -> @kernel.Thm {
  interval_length_cube_pos_c.get()
}

///|
/// VECTOR2_CUBE
fn step_8() -> Unit raise {
  let t18 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @vectors.vector_2(), @realarith.real_mul_rid()]))
  vector2_cube_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 3], ∀ s : Real, (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(c, 2) + s, (op_dollar : (Cart[Real, 3], Num) -> Real)(c, 3) + s]) == (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(c, 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(c, 3)]) + (op_pct : (Real, Cart[Real, 2]) -> Cart[Real, 2])(s, (vec : (Num) -> Cart[Real, 2])(1))"), t18))
}

///|
let vector2_cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR2_CUBE")

///|
/// `VECTOR2_CUBE`
pub fn vector2_cube() -> @kernel.Thm {
  vector2_cube_c.get()
}

///|
/// CUBE_BOUNDS_TAC
fn step_9() -> Unit raise {
  cube_bounds_tac_c.set(@simp.asm_simp_tac(@list.List([@integration.interval_lowerbound_v1(), @integration.interval_upperbound_v1(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), @real.real_le_addr(), @realarith.real_lt_imp_le()])))
}

///|
let cube_bounds_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("CUBE_BOUNDS_TAC")

///|
/// `CUBE_BOUNDS_TAC`
pub fn cube_bounds_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (cube_bounds_tac_c.get())(x)
}

///|
/// `MESON_ASSUME_TAC`
pub fn meson_assume_tac(x19 : @list.List[@kernel.Thm], x20 : @kernel.Term) -> @tactics.Tactic raise {
  let lemmas = x19
  let tm = x20
  let t25 = @list.List([@meson.asm_meson_tac(lemmas), @tactics.all_tac])
  @tactics.thenl(@tactics.subgoal_then(tm, fn(x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s23 = @tactics.assume_tac(x22)
    fn(x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s23(x24)
    }
  }), t25)
}

///|
/// cube_dissection
fn step_10() -> Unit raise {
  cube_dissection_c.set(@pair.new_definition(@term_syntax.parse_term("(cube_dissection : (((Cart[Real, N]) -> Bool) -> Bool) -> Bool)((d : ((Cart[Real, N]) -> Bool) -> Bool)) == (division_of(d, UNIONS(d)) && (∀ k : (Cart[Real, N]) -> Bool, IN(k, d) → cube(k)) && pairwise((k : (Cart[Real, N]) -> Bool) => (k' : (Cart[Real, N]) -> Bool) => !(interval_length(k) == interval_length(k')), d))")))
}

///|
let cube_dissection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cube_dissection")

///|
/// `cube_dissection`
pub fn cube_dissection() -> @kernel.Thm {
  cube_dissection_c.get()
}

///|
/// POINT_IN_MULTIPLE_DIVISION_OF_GEN
fn step_11() -> Unit raise {
  let t86 = @simp.asm_simp_tac(@list.List([@iterate.sum_delta(), @iterate.in_numseg(), @equal.gsym(@real.real_lt_square_abs())]))
  let t85 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t84 = @simp.rewrite_tac(@list.List([@class.cond_rand(), @class.cond_rator(), @real.real_sub_refl()]))
  let t83 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @vectors.vector_sub_component(), @iterate.in_numseg()]))
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_lt_square(), @vectors.dot(), @equal.gsym(@realarith.real_pow_2())])), t83), t84), t85), t86), @calc_rat.asm_real_arith_tac)
  let t81 = @simp.asm_rewrite_tac(@list.List([]))
  let t78 = @term_syntax.parse_term("(i : Num)")
  let t82 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x80 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s76 = @tactics.mp_tac(x75)
      fn(x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s76(x77)
      }
    })(((x79 : @kernel.Thm) => @bool.spec(t78, x79))(x80))
  }), t81), @calc_rat.asm_real_arith_tac)
  let t74 = @simp.asm_rewrite_tac(@list.List([]))
  let t73 = @simp.asm_rewrite_tac(@list.List([]))
  let t69 = @term_syntax.parse_term("(j : Num)")
  let t72 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x71 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x66 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s67 = @tactics.mp_tac(x66)
      fn(x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s67(x68)
      }
    })(((x70 : @kernel.Thm) => @bool.spec(t69, x70))(x71))
  }))
  let t88 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)")), @tactics.strip_tac), t72), t73), @class.cond_cases_tac), t74), @calc_rat.asm_real_arith_tac), t82])), t87]))
  let t65 = @simp.simp_tac(@list.List([@cart.lambda_beta()]))
  let t63 = @tactics.exists_tac(@term_syntax.parse_term("(lambda : ((Num) -> Real) -> Cart[Real, N])((j : Num) => if j == (i : Num) { min((op_dollar : (Cart[Real, N], Num) -> Real)((b : Cart[Real, N]), i), (op_dollar : (Cart[Real, N], Num) -> Real)((v : Cart[Real, N]), i) + (e : Real) / real_of_num(2)) } else { (op_dollar : (Cart[Real, N], Num) -> Real)((x : Cart[Real, N]), j) })"))
  let t64 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(lambda : ((Num) -> Real) -> Cart[Real, N])((j : Num) => if j == (i : Num) { max((op_dollar : (Cart[Real, N], Num) -> Real)((a : Cart[Real, N]), i), (op_dollar : (Cart[Real, N], Num) -> Real)((u : Cart[Real, N]), i) - (e : Real) / real_of_num(2)) } else { (op_dollar : (Cart[Real, N], Num) -> Real)((x : Cart[Real, N]), j) })")), t63])
  let t62 = @tactics.first_x_assum(@tactics.disj_cases_tac)
  let t61 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @vectors.in_interval()]))
  let t60 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t59 = @simp.rewrite_tac(@list.List([@topology.closure_approachable()]))
  let t58 = @list.List([@meson.asm_meson_tac(@list.List([@realax.real_le_trans()])), @tactics.disch_tac])
  let t57 = @simp.rewrite_tac(@list.List([@vectors.subset_interval(), @vectors.in_interval()]))
  let t56 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Cart[Real, N]), interval([((u : Cart[Real, N]), (v : Cart[Real, N]))]))"))
  let t55 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(interval([((u : Cart[Real, N]), (v : Cart[Real, N]))]), interval([((a : Cart[Real, N]), (b : Cart[Real, N]))]))"))
  let t54 = @tactics.disch_then(@tactics.match_mp_tac)
  let t53 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t50 = @drule.match_mp(@topology.subset_closure())
  let t52 = @tactics.disch_then(fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x47 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s48 = @tactics.mp_tac(x47)
      fn(x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s48(x49)
      }
    })(t50(x51))
  })
  let t45 = @sets.set_tac(@list.List([]))
  let t46 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET(interval([((a : Cart[Real, N]), (b : Cart[Real, N]))]), UNIONS((D : ((Cart[Real, N]) -> Bool) -> Bool)))")), t45), @tactics.all_tac])
  let t44 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(DIFF(interval([((a : Cart[Real, N]), (b : Cart[Real, N]))]), interval([((u : Cart[Real, N]), (v : Cart[Real, N]))])), DIFF(UNIONS((D : ((Cart[Real, N]) -> Bool) -> Bool)), interval([(u, v)])))"), fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s42 = @tactics.mp_tac(x41)
    fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s42(x43)
    }
  })
  let t40 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t39 = @tactics.match_mp_tac(@meson.meson(@list.List([@topology.subset_closure(), @sets.subset()]), @term_syntax.parse_term("SUBSET(DIFF(UNIONS((D : ((Cart[Real, N]) -> Bool) -> Bool)), (s : (Cart[Real, N]) -> Bool)), UNIONS(DELETE(D, s))) && IN((x : Cart[Real, N]), closure(DIFF(UNIONS(D), s))) → IN(x, closure(UNIONS(DELETE(D, s))))")))
  let t37 = @meson.asm_meson_tac(@list.List([@sets.finite_delete(), @sets.in_delete(), @integration.division_of(), @topology.closed_interval()]))
  let t38 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@topology.closed_unions()), t37), @tactics.all_tac])
  let t36 = @tactics.match_mp_tac(@meson.meson(@list.List([@topology.closure_closed()]), @term_syntax.parse_term("closed((s : (Cart[Real, N]) -> Bool)) && IN((x : Cart[Real, N]), closure(s)) → IN(x, s)")))
  let t34 = @meson.meson_tac(@list.List([]))
  let t35 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_unions(), @sets.in_delete()])), t34)])
  let t33 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, N]), UNIONS(DELETE((D : ((Cart[Real, N]) -> Bool) -> Bool), interval([((u : Cart[Real, N]), (v : Cart[Real, N]))]))))"), fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s31 = @tactics.mp_tac(x30)
    fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s31(x32)
    }
  })
  let t29 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s27 = @tactics.assume_tac(x26)
    fn(x28 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s27(x28)
    }
  }))
  let t89 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t29), t33), t35), t36), @tactics.conj_tac), t38), t39), @tactics.conj_tac), t40), t44), t46), t52), t53), t54), t55), t56), t57), @tactics.disch_tac), @tactics.ants_tac), t58), t59), t60), @tactics.disch_tac), t61), t62), t64), t65), t88)
  point_in_multiple_division_of_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, N]) -> Bool) -> Bool, ∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ u : Cart[Real, N], ∀ v : Cart[Real, N], ∀ x : Cart[Real, N], ∀ i : Num, (division_of : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(D, (UNIONS : (((Cart[Real, N]) -> Bool) -> Bool, Cart[Real, N]) -> Bool)(D)) && (IN : ((Cart[Real, N]) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)((interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(u, v)]), D) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(u, v)])) && (SUBSET : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)((interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(a, b)]), (UNIONS : (((Cart[Real, N]) -> Bool) -> Bool, Cart[Real, N]) -> Bool)(D)) && (SUBSET : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)((interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(u, v)]), (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(a, b)])) && 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (op_dollar : (Cart[Real, N], Num) -> Real)(a, i) < (op_dollar : (Cart[Real, N], Num) -> Real)(x, i) && (op_dollar : (Cart[Real, N], Num) -> Real)(x, i) < (op_dollar : (Cart[Real, N], Num) -> Real)(b, i) && ((op_dollar : (Cart[Real, N], Num) -> Real)(x, i) == (op_dollar : (Cart[Real, N], Num) -> Real)(u, i) || (op_dollar : (Cart[Real, N], Num) -> Real)(x, i) == (op_dollar : (Cart[Real, N], Num) -> Real)(v, i)) → (∃ j' : (Cart[Real, N]) -> Bool, (IN : ((Cart[Real, N]) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)(j', D) && !(j' == (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(u, v)])) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, j'))"), t89))
}

///|
let point_in_multiple_division_of_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POINT_IN_MULTIPLE_DIVISION_OF_GEN")

///|
/// `POINT_IN_MULTIPLE_DIVISION_OF_GEN`
pub fn point_in_multiple_division_of_gen() -> @kernel.Thm {
  point_in_multiple_division_of_gen_c.get()
}

///|
/// POINT_IN_MULTIPLE_DIVISION_OF
fn step_12() -> Unit raise {
  let t98 = @meson.asm_meson_tac(@list.List([@integration.division_of(), @sets.subset_refl()]))
  let t97 = @simp.asm_rewrite_tac(@list.List([]))
  let t94 = @term_syntax.parse_term("(i : Num)")
  let t95 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t96 = @tactics.map_every(fn(x91 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s92 = @tactics.exists_tac(x91)
    fn(x93 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s92(x93)
    }
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t95, t94]))
  let t90 = @tactics.match_mp_tac(point_in_multiple_division_of_gen())
  let t99 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t90), t96), t97), t98)
  point_in_multiple_division_of_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, N]) -> Bool) -> Bool, ∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ u : Cart[Real, N], ∀ v : Cart[Real, N], ∀ x : Cart[Real, N], ∀ i : Num, (division_of : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(D, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(a, b)])) && (IN : ((Cart[Real, N]) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)((interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(u, v)]), D) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(u, v)])) && 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (op_dollar : (Cart[Real, N], Num) -> Real)(a, i) < (op_dollar : (Cart[Real, N], Num) -> Real)(x, i) && (op_dollar : (Cart[Real, N], Num) -> Real)(x, i) < (op_dollar : (Cart[Real, N], Num) -> Real)(b, i) && ((op_dollar : (Cart[Real, N], Num) -> Real)(x, i) == (op_dollar : (Cart[Real, N], Num) -> Real)(u, i) || (op_dollar : (Cart[Real, N], Num) -> Real)(x, i) == (op_dollar : (Cart[Real, N], Num) -> Real)(v, i)) → (∃ j' : (Cart[Real, N]) -> Bool, (IN : ((Cart[Real, N]) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)(j', D) && !(j' == (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([(u, v)])) && (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, j'))"), t99))
}

///|
let point_in_multiple_division_of_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POINT_IN_MULTIPLE_DIVISION_OF")

///|
/// `POINT_IN_MULTIPLE_DIVISION_OF`
pub fn point_in_multiple_division_of() -> @kernel.Thm {
  point_in_multiple_division_of_c.get()
}

///|
/// CUBE_EXISTS_FORM
fn step_13() -> Unit raise {
  let t112 = @meson.asm_meson_tac(@list.List([]))
  let t111 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t110 = @tactics.exists_tac(@term_syntax.parse_term("(ee : Real)"))
  let t109 = @tactics.exists_tac(@term_syntax.parse_term("(xx : Cart[Real, N])"))
  let t107 = @term_syntax.parse_term("(ee : Real)")
  let t108 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(xx : Cart[Real, N])"), t107]))
  let t105 = @simp.rewrite_tac(@list.List([cube(), @theorems.left_imp_exists_thm()]))
  let t106 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection()])), t105])
  let t104 = @tactics.subgoal_then(@term_syntax.parse_term("cube((j : (Cart[Real, N]) -> Bool))"), fn(x101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s102 = @tactics.mp_tac(x101)
    fn(x103 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s102(x103)
    }
  })
  let t100 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(j : (Cart[Real, N]) -> Bool)"))(@tactics.strip_assume_tac))
  let t113 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t100), t104), t106), t108), @tactics.strip_tac), t109), t110), t111), t112)
  cube_exists_form_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, N]) -> Bool) -> Bool, cube_dissection(D) && (∀ x : Cart[Real, N], ∀ e : Real, IN(interval([(x, x + op_pct(e, vec(1)))]), D) && (P : ((Cart[Real, N]) -> Bool) -> Bool)(interval([(x, x + op_pct(e, vec(1)))])) → (R : (Cart[Real, N], Real) -> Bool)(x, e)) → (∃ j : (Cart[Real, N]) -> Bool, IN(j, D) && P(j)) → (∃ x : Cart[Real, N], ∃ e : Real, R(x, e))"), t113))
}

///|
let cube_exists_form_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_EXISTS_FORM")

///|
/// `CUBE_EXISTS_FORM`
pub fn cube_exists_form() -> @kernel.Thm {
  cube_exists_form_c.get()
}

///|
/// SQUARE_DISSECTION_NONEDGE
fn step_14() -> Unit raise {
  let iterm : (Int64) -> @kernel.Term raise = fn(x114 : Int64) -> @kernel.Term raise {
    let n = x114
    match n {
      1L => @term_syntax.parse_term("interval([((x1 : Cart[Real, 2]), x1 + op_pct((e1 : Real), vec(1)))])")
      2L => @term_syntax.parse_term("interval([((x2 : Cart[Real, 2]), x2 + op_pct((e2 : Real), vec(1)))])")
      3L => @term_syntax.parse_term("interval([((x3 : Cart[Real, 2]), x3 + op_pct((e3 : Real), vec(1)))])")
      4L => @term_syntax.parse_term("interval([((x4 : Cart[Real, 2]), x4 + op_pct((e4 : Real), vec(1)))])")
      _ => raise @lib.MatchFailure("tscript.ml:183")
    }
  }
  let itspec : (@list.List[Int64]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x115 : @list.List[Int64]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    match x115 {
      More(m, tail=More(n_1, tail=Empty)) => {
        let t117 = iterm(n_1)
        let t118 = @list.List([iterm(m), t117])
        (x119 : @kernel.Thm) => @bool.specl(t118, x119)
      }
      _ => raise @lib.MatchFailure("tscript.ml:188")
    }
  }
  let t355 = @tactics.repeat_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.strip_tac])))
  let t354 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (e : Real) <= a) == !(real_of_num(0) < e)"))]))
  let t353 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vector_2(), @vectors.vec_component(), @realarith.real_mul_rid(), @class.de_morgan_thm(), @vectors.interval_ne_empty()]))
  let t352 = @simp.asm_rewrite_tac(@list.List([@topology.eq_interval(), @topology.interior_interval(), @vectors.disjoint_interval(), @cart.cart_eq(), @class.de_morgan_thm(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.in_interval(), @vectors.interval_ne_empty(), @meson.meson(@list.List([]), @term_syntax.parse_term("(∃ i : Num, 1 <= i && i <= 2 && (P : (Num) -> Bool)(i)) == !(∀ i : Num, 1 <= i && i <= 2 → !P(i))"))]))
  let t344 = @tactics.disch_then(fn(x337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_3 = x337
    @tactics.map_every(fn(x343 : @list.List[Int64]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s340 = @tactics.mp_tac(x339)
        fn(x341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s340(x341)
        }
      })((fn(x342 : @list.List[Int64]) -> @kernel.Thm raise {
        itspec(x342)(t_3)
      })(x343))
    }, @list.List([@list.List([1L, 2L]), @list.List([1L, 3L]), @list.List([2L, 3L])]))
  })
  let t345 = @tactics.disch_then(fn(x330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_2 = x330
    @tactics.map_every(fn(x336 : @list.List[Int64]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s333 = @tactics.mp_tac(x332)
        fn(x334 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s333(x334)
        }
      })((fn(x335 : @list.List[Int64]) -> @kernel.Thm raise {
        itspec(x335)(t_2)
      })(x336))
    }, @list.List([@list.List([1L, 3L]), @list.List([1L, 4L]), @list.List([3L, 4L])]))
  })
  let t346 = @tactics.disch_then(fn(x323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_1 = x323
    @tactics.map_every(fn(x329 : @list.List[Int64]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s326 = @tactics.mp_tac(x325)
        fn(x327 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s326(x327)
        }
      })((fn(x328 : @list.List[Int64]) -> @kernel.Thm raise {
        itspec(x328)(t_1)
      })(x329))
    }, @list.List([@list.List([1L, 2L]), @list.List([1L, 4L]), @list.List([2L, 4L])]))
  })
  let t321 = itspec(@list.List([1L, 2L]))
  let t347 = @tactics.disch_then(fn(x322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s319 = @tactics.mp_tac(x318)
      fn(x320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s319(x320)
      }
    })(t321(x322))
  })
  let t316 = itspec(@list.List([1L, 4L]))
  let t348 = @tactics.disch_then(fn(x317 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x313 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s314 = @tactics.mp_tac(x313)
      fn(x315 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s314(x315)
      }
    })(t316(x317))
  })
  let t349 = @tactics.disch_then(fn(x306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x306
    @tactics.map_every(fn(x312 : @list.List[Int64]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s309 = @tactics.mp_tac(x308)
        fn(x310 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s309(x310)
        }
      })((fn(x311 : @list.List[Int64]) -> @kernel.Thm raise {
        itspec(x311)(t)
      })(x312))
    }, @list.List([@list.List([2L, 3L]), @list.List([2L, 4L]), @list.List([3L, 4L])]))
  })
  let t304 = itspec(@list.List([2L, 3L]))
  let t350 = @tactics.disch_then(fn(x305 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x301 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s302 = @tactics.mp_tac(x301)
      fn(x303 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s302(x303)
      }
    })(t304(x305))
  })
  let t299 = itspec(@list.List([3L, 4L]))
  let t351 = @list.List([@tactics.disch_then(fn(x300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s297 = @tactics.mp_tac(x296)
      fn(x298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s297(x298)
      }
    })(t299(x300))
  }), t350, t349, t348, t347, t346, t345, t344])
  let t295 = @tactics.disch_then(fn(x294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x293 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s290 = @tactics.mp_tac(x289)
        fn(x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s290(x291)
        }
      })(((x292 : @list.List[@kernel.Thm]) => @lib.el(2, x292))(x293))
    })(@bool.conjuncts_rule(x294))
  })
  let t288 = @simp.rewrite_tac(@list.List([@integration.division_of(), @equal.gsym(@theorems.conj_assoc())]))
  let t285 = @simp.gen_rewrite_rule(fn(x284 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x284
  }, @list.List([cube_dissection()]))
  let t287 = @tactics.first_assum(fn(x286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s282 = @tactics.mp_tac(x281)
      fn(x283 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s282(x283)
      }
    })(t285(x286))
  })
  let t280 = @tactics.try_tac(@calc_rat.asm_real_arith_tac)
  let t279 = @simp.asm_rewrite_tac(@list.List([]))
  let t275 = @term_syntax.parse_term("op_dollar((u : Cart[Real, 2]), 2) + (d : Real) == op_dollar((b : Cart[Real, 2]), 2)")
  let t276 = @term_syntax.parse_term("op_dollar((u : Cart[Real, 2]), 2) == op_dollar((a : Cart[Real, 2]), 2)")
  let t277 = @term_syntax.parse_term("op_dollar((u : Cart[Real, 2]), 1) + (d : Real) == op_dollar((b : Cart[Real, 2]), 1)")
  let t278 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("op_dollar((u : Cart[Real, 2]), 1) == op_dollar((a : Cart[Real, 2]), 1)"), t277, t276, t275]))
  let t274 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.in_interval(), @vectors.vector_2(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t269 = @simp.rewrite_tac(@list.List([@vectors.disjoint_interval(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.in_interval(), @meson.meson(@list.List([]), @term_syntax.parse_term("(∃ i : Num, 1 <= i && i <= 2 && (P : (Num) -> Bool)(i)) == !(∀ i : Num, 1 <= i && i <= 2 → !P(i))")), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vector_2(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t266 = @simp.gen_rewrite_rule(fn(x265 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x265
  }, @list.List([@vectors.in_interval()]))
  let t268 = @tactics.first_x_assum(fn(x267 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s263 = @tactics.mp_tac(x262)
      fn(x264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s263(x264)
      }
    })(t266(x267))
  })
  let t261 = @simp.asm_rewrite_tac(@list.List([@topology.interior_interval(), @vectors.subset_interval()]))
  let t257 = @term_syntax.parse_term("interval([((u : Cart[Real, 2]), u + op_pct((d : Real), vec(1)))])")
  let t260 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s251 = @tactics.mp_tac(x250)
      fn(x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s251(x252)
      }
    })(@bool.conjunct1(x253))
  }, fn(x259 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s255 = @tactics.mp_tac(x254)
      fn(x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s255(x256)
      }
    })(((x258 : @kernel.Thm) => @bool.spec(t257, x258))(x259))
  }))
  let t249 = @simp.asm_rewrite_tac(@list.List([]))
  let t244 = @term_syntax.parse_term("interval([((x : Cart[Real, 2]), x + op_pct((e : Real), vec(1)))])")
  let t248 = @tactics.disch_then(fn(x247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s242 = @tactics.mp_tac(x241)
        fn(x243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s242(x243)
        }
      })(((x245 : @kernel.Thm) => @bool.spec(t244, x245))(x246))
    })(@bool.conjunct2(x247))
  })
  let t240 = @simp.asm_rewrite_tac(@list.List([@integration.division_of(), @theorems.and_forall_thm()]))
  let t238 = @simp.rewrite_rule(@list.List([cube_dissection()]))
  let t270 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s235 = @tactics.mp_tac(x234)
        fn(x236 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s235(x236)
        }
      })(@bool.conjunct1(x237))
    })(t238(x239))
  }), t240), t248), t249), t260), t261), t268), t269), @calc_rat.asm_real_arith_tac)
  let t233 = @simp.asm_rewrite_tac(@list.List([interval_length_cube()]))
  let t230 = @term_syntax.parse_term("interval([((x : Cart[Real, 2]), x + op_pct((e : Real), vec(1)))])")
  let t271 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s228 = @tactics.mp_tac(x227)
      fn(x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s228(x229)
      }
    })(((x231 : @kernel.Thm) => @bool.spec(t230, x231))(x232))
  }), t233), @calc_rat.asm_real_arith_tac), t270])
  let t226 = @simp.asm_rewrite_tac(@list.List([]))
  let t224 = @term_syntax.parse_term("(e : Real)")
  let t225 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, 2])"), t224]))
  let t223 = @simp.asm_rewrite_tac(@list.List([]))
  let t222 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("(D : ((Cart[Real, 2]) -> Bool) -> Bool)"), cube_exists_form()))
  let t221 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t272 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.in_interval(), @vectors.vector_2(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component()])), t221), @calc_rat.asm_real_arith_tac), @tactics.all_tac])), t222), t223), t225), @tactics.strip_tac), t226), @tactics.conj_tac), t271)
  let t213 = @term_syntax.parse_term("2")
  let t214 = @list.List([@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 2], Num) -> Real)((u : Cart[Real, 2]), 1) + (d : Real) / real_of_num(2), (op_dollar : (Cart[Real, 2], Num) -> Real)(u, 2) + d])"), t213])
  let t217 = @tactics.first_x_assum(fn(x216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s211 = @tactics.mp_tac(x210)
      fn(x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s211(x212)
      }
    })(((x215 : @kernel.Thm) => @bool.specl(t214, x215))(x216))
  })
  let t206 = @term_syntax.parse_term("1")
  let t207 = @list.List([@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 2], Num) -> Real)((u : Cart[Real, 2]), 1) + (d : Real), (op_dollar : (Cart[Real, 2], Num) -> Real)(u, 2) + d / real_of_num(2)])"), t206])
  let t218 = @tactics.first_x_assum(fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s204 = @tactics.mp_tac(x203)
      fn(x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s204(x205)
      }
    })(((x208 : @kernel.Thm) => @bool.specl(t207, x208))(x209))
  })
  let t199 = @term_syntax.parse_term("2")
  let t200 = @list.List([@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 2], Num) -> Real)((u : Cart[Real, 2]), 1) + (d : Real) / real_of_num(2), (op_dollar : (Cart[Real, 2], Num) -> Real)(u, 2)])"), t199])
  let t219 = @tactics.first_x_assum(fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x196 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s197 = @tactics.mp_tac(x196)
      fn(x198 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s197(x198)
      }
    })(((x201 : @kernel.Thm) => @bool.specl(t200, x201))(x202))
  })
  let t192 = @term_syntax.parse_term("1")
  let t193 = @list.List([@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 2], Num) -> Real)((u : Cart[Real, 2]), 1), (op_dollar : (Cart[Real, 2], Num) -> Real)(u, 2) + (d : Real) / real_of_num(2)])"), t192])
  let t220 = @list.List([@tactics.first_x_assum(fn(x195 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s190 = @tactics.mp_tac(x189)
      fn(x191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s190(x191)
      }
    })(((x194 : @kernel.Thm) => @bool.specl(t193, x194))(x195))
  }), t219, t218, t217])
  let t188 = @tactics.repeat_tac(@tactics.conj_tac)
  let t187 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @equal.gsym(@theorems.conj_assoc()), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t273 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@theorems.conj_assoc(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (d : Real) → (d < (e : Real) && real_of_num(0) < e) == (d < e)"))])), t187), t188), @tactics.disch_tac), t220), t272), @tactics.all_tac])
  let t186 = @tactics.subgoal_then(@term_syntax.parse_term("(!(op_dollar((u : Cart[Real, 2]), 1) == op_dollar((a : Cart[Real, 2]), 1)) → (∃ x1 : Cart[Real, 2], ∃ e1 : Real, (d : Real) < e1 && real_of_num(0) < e1 && IN(interval([(x1, x1 + op_pct(e1, vec(1)))]), (D : ((Cart[Real, 2]) -> Bool) -> Bool)) && op_dollar(a, 1) <= op_dollar(x1, 1) && op_dollar(x1, 1) + e1 == op_dollar(u, 1) && op_dollar(a, 2) <= op_dollar(x1, 2) && op_dollar(x1, 2) + e1 <= op_dollar((b : Cart[Real, 2]), 2) && IN(vector([op_dollar(u, 1), op_dollar(u, 2) + d / real_of_num(2)]), interval([(x1, x1 + op_pct(e1, vec(1)))])))) && (!(op_dollar(u, 2) == op_dollar(a, 2)) → (∃ x2 : Cart[Real, 2], ∃ e2 : Real, d < e2 && real_of_num(0) < e2 && IN(interval([(x2, x2 + op_pct(e2, vec(1)))]), D) && op_dollar(a, 1) <= op_dollar(x2, 1) && op_dollar(x2, 1) + e2 <= op_dollar(b, 1) && op_dollar(a, 2) <= op_dollar(x2, 2) && op_dollar(x2, 2) + e2 == op_dollar(u, 2) && IN(vector([op_dollar(u, 1) + d / real_of_num(2), op_dollar(u, 2)]), interval([(x2, x2 + op_pct(e2, vec(1)))])))) && (!(op_dollar(u + op_pct(d, vec(1)), 1) == op_dollar(b, 1)) → (∃ x3 : Cart[Real, 2], ∃ e3 : Real, d < e3 && real_of_num(0) < e3 && IN(interval([(x3, x3 + op_pct(e3, vec(1)))]), D) && op_dollar(x3, 1) == op_dollar(u + op_pct(d, vec(1)), 1) && op_dollar(x3, 1) + e3 <= op_dollar(b, 1) && op_dollar(a, 2) <= op_dollar(x3, 2) && op_dollar(x3, 2) + e3 <= op_dollar(b, 2) && IN(vector([op_dollar(u, 1) + d, op_dollar(u, 2) + d / real_of_num(2)]), interval([(x3, x3 + op_pct(e3, vec(1)))])))) && (!(op_dollar(u + op_pct(d, vec(1)), 2) == op_dollar(b, 2)) → (∃ x4 : Cart[Real, 2], ∃ e4 : Real, d < e4 && real_of_num(0) < e4 && IN(interval([(x4, x4 + op_pct(e4, vec(1)))]), D) && op_dollar(a, 1) <= op_dollar(x4, 1) && op_dollar(x4, 1) + e4 <= op_dollar(b, 1) && op_dollar(x4, 2) == op_dollar(u + op_pct(d, vec(1)), 2) && op_dollar(x4, 2) + e4 <= op_dollar(b, 2) && IN(vector([op_dollar(u, 1) + d / real_of_num(2), op_dollar(u, 2) + d]), interval([(x4, x4 + op_pct(e4, vec(1)))]))))"), fn(x183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s184 = @tactics.mp_tac(x183)
    fn(x185 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s184(x185)
    }
  })
  let t182 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t180 = @simp.asm_rewrite_tac(@list.List([]))
  let t181 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection()])), t180])
  let t179 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm(), @cart.dimindex_2()]))
  let t174 = @term_syntax.parse_term("(u : Cart[Real, 2]) + op_pct((d : Real), vec(1))")
  let t175 = @term_syntax.parse_term("(u : Cart[Real, 2])")
  let t176 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t177 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t178 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 2]) -> Bool) -> Bool)"), t177, t176, t175, t174]), point_in_multiple_division_of()))
  let t173 = @simp.gen_rewrite_tac(fn(x172 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x168 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x164 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x158 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s159 = @equal.rand_conv(x158)
          fn(x160 : @kernel.Term) -> @kernel.Thm raise {
            s159(x160)
          }
        })((fn(x161 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s162 = @equal.binop_conv(x161)
          fn(x163 : @kernel.Term) -> @kernel.Thm raise {
            s162(x163)
          }
        })(x164))
      })((fn(x165 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s166 = @equal.land_conv(x165)
        fn(x167 : @kernel.Term) -> @kernel.Thm raise {
          s166(x167)
        }
      })(x168))
    })((fn(x169 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s170 = @equal.rand_conv(x169)
      fn(x171 : @kernel.Term) -> @kernel.Thm raise {
        s170(x171)
      }
    })(x172))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t157 = @simp.asm_rewrite_tac(@list.List([]))
  let t156 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t155 = @simp.rewrite_tac(@list.List([@vectors.interval_ne_empty(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t154 = @tactics.undisch_tac(@term_syntax.parse_term("!(interval([((u : Cart[Real, 2]), u + op_pct((d : Real), vec(1)))]) == {})"))
  let t153 = @simp.asm_rewrite_tac(@list.List([@vectors.subset_interval(), @cart.dimindex_2(), @vectors.forall_2()]))
  let t152 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection(), @integration.division_of()])), @tactics.all_tac])
  let t151 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(interval([((u : Cart[Real, 2]), u + op_pct((d : Real), vec(1)))]), interval([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]))"), fn(x148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s149 = @tactics.mp_tac(x148)
    fn(x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s149(x150)
    }
  })
  let t146 = @simp.asm_rewrite_tac(@list.List([@topology.eq_interval(), @vectors.subset_interval(), @cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2()]))
  let t147 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection(), @integration.division_of(), @sets.subset_empty()])), t146])
  let t145 = @tactics.subgoal_then(@term_syntax.parse_term("!(interval([((u : Cart[Real, 2]), u + op_pct((d : Real), vec(1)))]) == {}) && !(interval([((a : Cart[Real, 2]), (b : Cart[Real, 2]))]) == {})"), @tactics.strip_assume_tac)
  let t144 = @simp.asm_simp_tac(@list.List([interval_length_cube(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (d : Real) → max(d, real_of_num(0)) == d"))]))
  let t143 = @tactics.first_x_assum(fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s136 = @tactics.mp_tac(x135)
      fn(x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s136(x137)
      }
    })(((x141 : @kernel.Thm) => @lib.check(fn(x140 : @kernel.Thm) -> Bool raise {
      (fn(x138 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x138)
      })((fn(x139 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x139)
      })(x140))
    }, x141))(x142))
  })
  let t134 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s129 = @tactics.assume_tac(x128)
    fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s129(x130)
    }
  }, fn(x131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s132 = @tactics.subst_all_tac(x131)
    fn(x133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s132(x133)
    }
  }))
  let t126 = @term_syntax.parse_term("(d : Real)")
  let t127 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Cart[Real, 2])"), t126]))
  let t124 = @simp.rewrite_tac(@list.List([cube(), @theorems.left_imp_exists_thm()]))
  let t125 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection()])), t124])
  let t123 = @tactics.subgoal_then(@term_syntax.parse_term("cube((j : (Cart[Real, 2]) -> Bool))"), fn(x120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s121 = @tactics.mp_tac(x120)
    fn(x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s121(x122)
    }
  })
  let t356 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t123), t125), t127), t134), t143), t144), @tactics.disch_tac), t145), t147), t151), t152), t153), t154), t155), @tactics.strip_tac), t156), @tactics.strip_tac), t157), t173), t178), t179), @tactics.ants_tac), t181), t182), @tactics.strip_tac), t186), t273), t274), t278), t279), t280), @tactics.strip_tac), t287), t288), t295), t351), t352), t353), t354), t355), @calc_rat.asm_real_arith_tac)
  square_dissection_nonedge_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 2]) -> Bool) -> Bool, ∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ j : (Cart[Real, 2]) -> Bool, cube_dissection(D) && UNIONS(D) == interval([(a, b)]) && IN(j, D) && (∀ j' : (Cart[Real, 2]) -> Bool, IN(j', D) && !(j' == j) → interval_length(j) < interval_length(j')) → j == interval([(a, b)]) || SUBSET(j, interval((a, b)))"), t356))
}

///|
let square_dissection_nonedge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQUARE_DISSECTION_NONEDGE")

///|
/// `SQUARE_DISSECTION_NONEDGE`
pub fn square_dissection_nonedge() -> @kernel.Thm {
  square_dissection_nonedge_c.get()
}

///|
/// FINITE_PAIRWISE_MINIMUM
fn step_15() -> Unit raise {
  let t382 = @simp.asm_rewrite_tac(@list.List([]))
  let t377 = @term_syntax.parse_term("(y : A)")
  let t378 = @list.List([@term_syntax.parse_term("(x0 : A)"), t377])
  let t381 = @tactics.disch_then(fn(x380 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s375 = @tactics.mp_tac(x374)
      fn(x376 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s375(x376)
      }
    })(((x379 : @kernel.Thm) => @bool.specl(t378, x379))(x380))
  })
  let t373 = @simp.rewrite_tac(@list.List([@sets.pairwise()]))
  let t383 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("pairwise((x : A) => (y : A) => !((f : (A) -> Real)(x) == f(y)), (s : (A) -> Bool))")), t373), t381), t382)
  let t371 = @simp.asm_rewrite_tac(@list.List([]))
  let t370 = @tactics.exists_tac(@term_syntax.parse_term("(y : A)"))
  let t369 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t372 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t369), t370), t371), @calc_rat.asm_real_arith_tac])
  let t384 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(b : Real) <= (f : (A) -> Real)((y : A))"), fn(x366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s367 = @tactics.mp_tac(x366)
    fn(x368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s367(x368)
    }
  }), t372), t383])
  let t365 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) && !(x == y) → x < y")))
  let t364 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : A)"))
  let t363 = @simp.asm_rewrite_tac(@list.List([]))
  let t362 = @tactics.exists_tac(@term_syntax.parse_term("(x0 : A)"))
  let t361 = @list.List([@meson.asm_meson_tac(@list.List([@sets.in_image()])), @tactics.all_tac])
  let t360 = @tactics.subgoal_then(@term_syntax.parse_term("∃ x0 : A, IN(x0, (s : (A) -> Bool)) && (f : (A) -> Real)(x0) == (b : Real)"), @tactics.strip_assume_tac)
  let t359 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Real)"))(@tactics.strip_assume_tac))
  let t358 = @simp.asm_simp_tac(@list.List([@sets.finite_image(), @sets.image_eq_empty()]))
  let t357 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("IMAGE((f : (A) -> Real), (s : (A) -> Bool))"), @sets.inf_finite_lemma()))
  let t385 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t357), t358), t359), t360), t361), t362), t363), t364), @tactics.strip_tac), t365), @tactics.conj_tac), t384)
  finite_pairwise_minimum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && pairwise((x : A) => (y : A) => !(f(x) == f(y)), s) → (∃ x : A, IN(x, s) && (∀ y : A, IN(y, s) && !(y == x) → f(x) < f(y)))"), t385))
}

///|
let finite_pairwise_minimum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_PAIRWISE_MINIMUM")

///|
/// `FINITE_PAIRWISE_MINIMUM`
pub fn finite_pairwise_minimum() -> @kernel.Thm {
  finite_pairwise_minimum_c.get()
}

///|
/// valley
fn step_16() -> Unit raise {
  valley_c.set(@pair.new_definition(@term_syntax.parse_term("(valley : (((Cart[Real, 3]) -> Bool) -> Bool, (Cart[Real, 3]) -> Bool) -> Bool)((D : ((Cart[Real, 3]) -> Bool) -> Bool), (v : (Cart[Real, 3]) -> Bool)) == (cube(v) && (∀ z : Cart[Real, 3], op_dollar(z, 1) == op_dollar(interval_upperbound(v), 1) && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3) → (∃ k : (Cart[Real, 3]) -> Bool, IN(k, D) && IN(z, k) && op_dollar(interval_lowerbound(k), 1) == op_dollar(interval_upperbound(v), 1))) && (∀ k : (Cart[Real, 3]) -> Bool, IN(k, D) && op_dollar(interval_lowerbound(k), 1) == op_dollar(interval_upperbound(v), 1) && (∃ z : Cart[Real, 3], IN(z, k) && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3)) → op_dollar(interval_lowerbound(v), 2) <= op_dollar(interval_lowerbound(k), 2) && op_dollar(interval_upperbound(k), 2) <= op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) <= op_dollar(interval_lowerbound(k), 3) && op_dollar(interval_upperbound(k), 3) <= op_dollar(interval_upperbound(v), 3)) && (∀ k : (Cart[Real, 3]) -> Bool, IN(k, D) && op_dollar(interval_lowerbound(k), 1) == op_dollar(interval_upperbound(v), 1) && (∃ z : Cart[Real, 3], IN(z, k) && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3)) → interval_length(k) < interval_length(v)))")))
}

///|
let valley_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valley")

///|
/// `valley`
pub fn valley() -> @kernel.Thm {
  valley_c.get()
}

///|
/// DIVISION_WHOLE_IS_SINGLETON
fn step_17() -> Unit raise {
  let t407 = @simp.asm_rewrite_tac(@list.List([]))
  let t408 = @tactics.then_tac(@tactics.disch_then(fn(x404 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s405 = @tactics.subst1_tac(x404)
    fn(x406 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s405(x406)
    }
  }), t407)
  let t402 = @meson.asm_meson_tac(@list.List([cube_imp_nonempty_interior()]))
  let t401 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t400 = meson_assume_tac(@list.List([@integration.division_of()]), @term_syntax.parse_term("INTER(interior((j : (Cart[Real, 3]) -> Bool)), interior(interval([((a : Cart[Real, 3]), (b : Cart[Real, 3]))]))) == {}"))
  let t398 = @meson.asm_meson_tac(@list.List([@integration.division_of()]))
  let t399 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@topology.subset_interior()), t398), @tactics.all_tac])
  let t403 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("SUBSET(interior((j : (Cart[Real, 3]) -> Bool)), interior(interval([((a : Cart[Real, 3]), (b : Cart[Real, 3]))])))"), fn(x395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s396 = @tactics.assume_tac(x395)
    fn(x397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s396(x397)
    }
  }), t399), t400), t401), t402])
  let t394 = @tactics.subgoal_then(@term_syntax.parse_term("interior((j : (Cart[Real, 3]) -> Bool)) == {}"), fn(x391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s392 = @tactics.mp_tac(x391)
    fn(x393 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s392(x393)
    }
  })
  let t390 = @simp.asm_rewrite_tac(@list.List([]))
  let t409 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @class.asm_cases_tac(@term_syntax.parse_term("(j : (Cart[Real, 3]) -> Bool) == interval([((a : Cart[Real, 3]), (b : Cart[Real, 3]))])"))), t390), t394), t403), t408])
  let t389 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : (Cart[Real, 3]) -> Bool)"))
  let t388 = @simp.rewrite_tac(@list.List([@sets.in_sing()]))
  let t387 = @simp.gen_rewrite_tac(fn(x386 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x386
  }, @list.List([@sets.extension()]))
  let t410 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t387), t388), t389), @tactics.eq_tac), t409)
  division_whole_is_singleton_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, ∀ a : Cart[Real, 3], ∀ b : Cart[Real, 3], division_of(D, interval([(a, b)])) && (∀ k : (Cart[Real, 3]) -> Bool, IN(k, D) → cube(k)) && IN(interval([(a, b)]), D) → D == {interval([(a, b)])}"), t410))
}

///|
let division_whole_is_singleton_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVISION_WHOLE_IS_SINGLETON")

///|
/// `DIVISION_WHOLE_IS_SINGLETON`
pub fn division_whole_is_singleton() -> @kernel.Thm {
  division_whole_is_singleton_c.get()
}

///|
/// VALLEY_INITIAL
fn step_18() -> Unit raise {
  let t521 = @meson.asm_meson_tac(@list.List([]))
  let t520 = @meson.asm_meson_tac(@list.List([cube_dissection()]))
  let t522 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(division_whole_is_singleton()), t520), t521])
  let t519 = @tactics.subgoal_then(@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool) == {interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))])}"), fn(x516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s517 = @tactics.mp_tac(x516)
    fn(x518 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s517(x518)
    }
  })
  let t515 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t514 = @tactics.subgoal_then(@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool) == interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))])"), fn(x511 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s512 = @tactics.assume_tac(x511)
    fn(x513 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s512(x513)
    }
  })
  let t509 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component()]))
  let t508 = @simp.asm_rewrite_tac(@list.List([@vectors.subset_interval(), @vectors.interval_ne_empty(), @cart.dimindex_3(), @vectors.forall_3()]))
  let t507 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((k : (Cart[Real, 3]) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"))
  let t510 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3()])), t507), t508), t509), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t523 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(c : Cart[Real, 3]) == (a : Cart[Real, 3])"), fn(x504 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s505 = @tactics.assume_tac(x504)
    fn(x506 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s505(x506)
    }
  }), t510), t514), t515), t519), t522), @calc_rat.asm_real_arith_tac])
  let t503 = @class.asm_cases_tac(@term_syntax.parse_term("(e : Real) == (d : Real)"))
  let t501 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component()]))
  let t500 = @simp.asm_rewrite_tac(@list.List([@vectors.subset_interval(), @vectors.interval_ne_empty(), @cart.dimindex_3(), @vectors.forall_3()]))
  let t502 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET((k : (Cart[Real, 3]) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))")), t500), t501), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t499 = @tactics.subgoal_then(@term_syntax.parse_term("(e : Real) <= (d : Real)"), fn(x496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s497 = @tactics.assume_tac(x496)
    fn(x498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s497(x498)
    }
  })
  let t495 = @list.List([@simp.asm_simp_tac(@list.List([interval_length_cube_pos()])), @tactics.all_tac])
  let t494 = @tactics.subgoal_then(@term_syntax.parse_term("interval_length((k : (Cart[Real, 3]) -> Bool)) == (e : Real)"), fn(x492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x492
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t491 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection(), cube()])), @tactics.all_tac])
  let t490 = @tactics.subgoal_then(@term_syntax.parse_term("∃ c : Cart[Real, 3], ∃ e : Real, real_of_num(0) < e && (k : (Cart[Real, 3]) -> Bool) == interval([(c, c + op_pct(e, vec(1)))])"), @tactics.strip_assume_tac)
  let t489 = meson_assume_tac(@list.List([@integration.division_of()]), @term_syntax.parse_term("SUBSET((k : (Cart[Real, 3]) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"))
  let t524 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")), @tactics.strip_tac), t489), t490), t491), t494), t495), t499), t502), t503), t523)
  let t488 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component()]))
  let t487 = @simp.asm_rewrite_tac(@list.List([@vectors.subset_interval(), @vectors.interval_ne_empty(), @cart.dimindex_3(), @vectors.forall_3()]))
  let t486 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((k : (Cart[Real, 3]) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"))
  let t485 = @simp.asm_rewrite_tac(@list.List([]))
  let t484 = @tactics.subgoal_then(@term_syntax.parse_term("interval_lowerbound((k : (Cart[Real, 3]) -> Bool)) == (c : Cart[Real, 3]) && interval_upperbound(k) == c + op_pct((e : Real), vec(1))"), @tactics.strip_assume_tac)
  let t483 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection(), cube()])), @tactics.all_tac])
  let t482 = @tactics.subgoal_then(@term_syntax.parse_term("∃ c : Cart[Real, 3], ∃ e : Real, real_of_num(0) < e && (k : (Cart[Real, 3]) -> Bool) == interval([(c, c + op_pct(e, vec(1)))])"), @tactics.strip_assume_tac)
  let t481 = meson_assume_tac(@list.List([@integration.division_of()]), @term_syntax.parse_term("SUBSET((k : (Cart[Real, 3]) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"))
  let t525 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")), @tactics.strip_tac), t481), t482), t483), t484), @list.List([cube_bounds_tac, @tactics.all_tac])), t485), t486), t487), t488), @calc_rat.asm_real_arith_tac)
  let t479 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component()]))
  let t478 = @simp.rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3()]))
  let t480 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((u : Cart[Real, 3]), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))")), t478), t479), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t477 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((a : Cart[Real, 3]), 1) <= op_dollar((u : Cart[Real, 3]), 1)"), fn(x474 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s475 = @tactics.assume_tac(x474)
    fn(x476 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s475(x476)
    }
  })
  let t472 = @simp.asm_rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3()]))
  let t473 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((z : Cart[Real, 3]), (k : (Cart[Real, 3]) -> Bool))")), t472), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t471 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((u : Cart[Real, 3]), 1) <= op_dollar((z : Cart[Real, 3]), 1)"), fn(x468 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s469 = @tactics.assume_tac(x468)
    fn(x470 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s469(x470)
    }
  })
  let t465 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t464 = @meson.asm_meson_tac(@list.List([]))
  let t463 = @simp.rewrite_tac(@list.List([@vectors.interval_ne_empty()]))
  let t462 = @tactics.undisch_tac(@term_syntax.parse_term("!(interval([((u : Cart[Real, 3]), (v : Cart[Real, 3]))]) == {})"))
  let t466 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.in_interval()])), @tactics.gen_tac), @tactics.disch_tac), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t462), t463), t464), t465])
  let t467 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((u : Cart[Real, 3]), interval([(u, (v : Cart[Real, 3]))]))"), fn(x459 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s460 = @tactics.mp_tac(x459)
    fn(x461 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s460(x461)
    }
  }), t466), @tactics.all_tac])
  let t458 = @tactics.subgoal_then(@term_syntax.parse_term("IN((u : Cart[Real, 3]), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"), fn(x455 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s456 = @tactics.assume_tac(x455)
    fn(x457 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s456(x457)
    }
  })
  let t454 = @list.List([@simp.asm_simp_tac(@list.List([@integration.interval_lowerbound_nonempty()])), @tactics.all_tac])
  let t453 = @tactics.subgoal_then(@term_syntax.parse_term("interval_lowerbound((k : (Cart[Real, 3]) -> Bool)) == (u : Cart[Real, 3])"), fn(x451 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x451
    @simp.rewrite_tac(@list.List([th]))
  })
  let t450 = meson_assume_tac(@list.List([]), @term_syntax.parse_term("!(interval([((u : Cart[Real, 3]), (v : Cart[Real, 3]))]) == {})"))
  let t449 = @list.List([@meson.asm_meson_tac(@list.List([@integration.division_of()])), @tactics.all_tac])
  let t448 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((k : (Cart[Real, 3]) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))])) && !(k == {}) && (∃ u : Cart[Real, 3], ∃ v : Cart[Real, 3], k == interval([(u, v)]))"), @tactics.strip_assume_tac)
  let t447 = @simp.asm_rewrite_tac(@list.List([]))
  let t446 = @tactics.exists_tac(@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)"))
  let t444 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t445 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_unions())])), t444), @tactics.all_tac])
  let t443 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k : (Cart[Real, 3]) -> Bool, IN(k, (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && IN((z : Cart[Real, 3]), k)"), @tactics.strip_assume_tac)
  let t441 = @simp.simp_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component()]))
  let t442 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3()])), t441), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t440 = @tactics.subgoal_then(@term_syntax.parse_term("IN((z : Cart[Real, 3]), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"), fn(x437 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s438 = @tactics.assume_tac(x437)
    fn(x439 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s438(x439)
    }
  })
  let t526 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 3])")), @tactics.strip_tac), t440), t442), t443), t445), t446), t447), t448), t449), t450), t453), t454), t458), t467), t471), t473), t477), t480), @calc_rat.asm_real_arith_tac)
  let t436 = @simp.asm_rewrite_tac(@list.List([]))
  let t434 = @term_syntax.parse_term("(d : Real)")
  let t435 = @tactics.map_every(fn(x431 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s432 = @tactics.exists_tac(x431)
    fn(x433 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s432(x433)
    }
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, 3]) - op_pct((d : Real), basis(1))"), t434]))
  let t527 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cube()])), t435), t436), t526, t525, t524])
  let t430 = @tactics.repeat_tac(@tactics.conj_tac)
  let t429 = @simp.asm_rewrite_tac(@list.List([]))
  let t427 = @simp.rewrite_tac(@list.List([interval_length_cube()]))
  let t426 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t421 = @int.arith_rule(@term_syntax.parse_term("3 <= 3"))
  let t422 = @int.arith_rule(@term_syntax.parse_term("2 <= 3"))
  let t423 = @int.arith_rule(@term_syntax.parse_term("1 <= 3"))
  let t424 = @int.arith_rule(@term_syntax.parse_term("1 <= 2"))
  let t425 = @simp.simp_tac(@list.List([@vectors.vector_sub_component(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @vectors.basis_component(), @cart.dimindex_3(), @int.arith_rule(@term_syntax.parse_term("1 <= 1")), t424, t423, t422, t421]))
  let t428 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@integration.interval_upperbound_v1(), @integration.interval_lowerbound_v1()])), t425), t426), t427), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t420 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_upperbound(interval([((a : Cart[Real, 3]) - op_pct((d : Real), basis(1)), a - op_pct(d, basis(1)) + op_pct(d, vec(1)))])), 1) == op_dollar(a, 1) && op_dollar(interval_lowerbound(interval([(a - op_pct(d, basis(1)), a - op_pct(d, basis(1)) + op_pct(d, vec(1)))])), 2) == op_dollar(a, 2) && op_dollar(interval_upperbound(interval([(a - op_pct(d, basis(1)), a - op_pct(d, basis(1)) + op_pct(d, vec(1)))])), 2) == op_dollar(a, 2) + d && op_dollar(interval_lowerbound(interval([(a - op_pct(d, basis(1)), a - op_pct(d, basis(1)) + op_pct(d, vec(1)))])), 3) == op_dollar(a, 3) && op_dollar(interval_upperbound(interval([(a - op_pct(d, basis(1)), a - op_pct(d, basis(1)) + op_pct(d, vec(1)))])), 3) == op_dollar(a, 3) + d && interval_length(interval([(a - op_pct(d, basis(1)), a - op_pct(d, basis(1)) + op_pct(d, vec(1)))])) == d"), @tactics.strip_assume_tac)
  let t418 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t417 = @simp.simp_tac(@list.List([@vectors.vector_sub_component(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @vectors.basis_component(), @cart.dimindex_3()]))
  let t419 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.dimindex_3(), @vectors.forall_3()])), t417), t418), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t416 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, 1 <= i && i <= (dimindex : ((3) -> Bool) -> Num)((UNIV : (3) -> Bool)) → (op_dollar : (Cart[Real, 3], Num) -> Real)((a : Cart[Real, 3]) - (op_pct : (Real, Cart[Real, 3]) -> Cart[Real, 3])((d : Real), (basis : (Num) -> Cart[Real, 3])(1)), i) <= (op_dollar : (Cart[Real, 3], Num) -> Real)(a - (op_pct : (Real, Cart[Real, 3]) -> Cart[Real, 3])(d, (basis : (Num) -> Cart[Real, 3])(1)) + (op_pct : (Real, Cart[Real, 3]) -> Cart[Real, 3])(d, (vec : (Num) -> Cart[Real, 3])(1)), i)"), fn(x413 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s414 = @tactics.assume_tac(x413)
    fn(x415 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s414(x415)
    }
  })
  let t412 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("division_of((D : ((Cart[Real, 3]) -> Bool) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"))
  let t411 = @simp.rewrite_tac(@list.List([valley()]))
  let t528 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t411), t412), t416), t419), t420), t428), t429), t430), t527)
  valley_initial_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, ∀ a : Cart[Real, 3], ∀ d : Real, real_of_num(0) < d && cube_dissection(D) && UNIONS(D) == interval([(a, a + op_pct(d, vec(1)))]) && !(D == {interval([(a, a + op_pct(d, vec(1)))])}) → valley(D, interval([(a - op_pct(d, basis(1)), a - op_pct(d, basis(1)) + op_pct(d, vec(1)))]))"), t528))
}

///|
let valley_initial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALLEY_INITIAL")

///|
/// `VALLEY_INITIAL`
pub fn valley_initial() -> @kernel.Thm {
  valley_initial_c.get()
}

///|
/// DIVISION_FACE_LOWERBOUND
fn step_19() -> Unit raise {
  let t552 = @simp.asm_rewrite_tac(@list.List([@topology.interior_interval(), @vectors.interval_ne_empty(), @vectors.in_interval(), @vectors.disjoint_interval(), @cart.dimindex_3(), @meson.meson(@list.List([]), @term_syntax.parse_term("(∃ i : Num, 1 <= i && i <= 3 && (P : (Num) -> Bool)(i)) == !(∀ i : Num, 1 <= i && i <= 3 → !P(i))")), @vectors.forall_3()]))
  let t544 = @term_syntax.parse_term("op_dollar((x : Cart[Real, 3]), 3) < op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 3)")
  let t545 = @term_syntax.parse_term("op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 3) < op_dollar((x : Cart[Real, 3]), 3)")
  let t546 = @term_syntax.parse_term("op_dollar((x : Cart[Real, 3]), 2) < op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 2)")
  let t547 = @term_syntax.parse_term("op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 2) < op_dollar((x : Cart[Real, 3]), 2)")
  let t548 = @term_syntax.parse_term("op_dollar((x : Cart[Real, 3]), 1) == op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 1)")
  let t549 = @term_syntax.parse_term("IN((x : Cart[Real, 3]), (j : (Cart[Real, 3]) -> Bool))")
  let t550 = @term_syntax.parse_term("!(interior((j : (Cart[Real, 3]) -> Bool)) == {})")
  let t551 = @tactics.map_every(fn(x541 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s542 = @tactics.undisch_tac(x541)
    fn(x543 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s542(x543)
    }
  }, @list.List([@term_syntax.parse_term("!(interior((k : (Cart[Real, 3]) -> Bool)) == {})"), t550, t549, t548, t547, t546, t545, t544]))
  let t540 = @list.List([@meson.asm_meson_tac(@list.List([@integration.division_of()])), @tactics.all_tac])
  let t539 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(interior((k : (Cart[Real, 3]) -> Bool)), interior((j : (Cart[Real, 3]) -> Bool))) == {}"), fn(x536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s537 = @tactics.mp_tac(x536)
    fn(x538 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s537(x538)
    }
  })
  let t535 = @simp.asm_rewrite_tac(@list.List([]))
  let t534 = @list.List([@simp.asm_simp_tac(@list.List([@integration.interval_lowerbound_nonempty(), @integration.interval_upperbound_nonempty()])), @tactics.all_tac])
  let t533 = @tactics.subgoal_then(@term_syntax.parse_term("interval_lowerbound((k : (Cart[Real, 3]) -> Bool)) == (u : Cart[Real, 3]) && interval_upperbound(k) == (v : Cart[Real, 3]) && interval_lowerbound((j : (Cart[Real, 3]) -> Bool)) == (p : Cart[Real, 3]) && interval_upperbound(j) == (q : Cart[Real, 3])"), @tactics.strip_assume_tac)
  let t532 = @list.List([@meson.asm_meson_tac(@list.List([@integration.division_of()])), @tactics.all_tac])
  let t531 = @tactics.subgoal_then(@term_syntax.parse_term("∃ p : Cart[Real, 3], ∃ q : Cart[Real, 3], (j : (Cart[Real, 3]) -> Bool) == interval([(p, q)]) && !(interval([(p, q)]) == {})"), @tactics.strip_assume_tac)
  let t530 = @list.List([@meson.asm_meson_tac(@list.List([@integration.division_of()])), @tactics.all_tac])
  let t529 = @tactics.subgoal_then(@term_syntax.parse_term("∃ u : Cart[Real, 3], ∃ v : Cart[Real, 3], (k : (Cart[Real, 3]) -> Bool) == interval([(u, v)]) && !(interval([(u, v)]) == {})"), @tactics.strip_assume_tac)
  let t553 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t529), t530), t531), t532), t533), t534), t535), t539), t540), t551), t552), @calc_rat.real_arith_tac)
  division_face_lowerbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, ∀ k : (Cart[Real, 3]) -> Bool, ∀ j : (Cart[Real, 3]) -> Bool, ∀ x : Cart[Real, 3], division_of(D, UNIONS(D)) && !(interior(k) == {}) && !(interior(j) == {}) && IN(k, D) && IN(j, D) && !(j == k) && IN(x, k) && IN(x, j) && op_dollar(x, 1) == op_dollar(interval_upperbound(k), 1) && op_dollar(interval_lowerbound(k), 2) < op_dollar(x, 2) && op_dollar(x, 2) < op_dollar(interval_upperbound(k), 2) && op_dollar(interval_lowerbound(k), 3) < op_dollar(x, 3) && op_dollar(x, 3) < op_dollar(interval_upperbound(k), 3) → op_dollar(interval_lowerbound(j), 1) == op_dollar(interval_upperbound(k), 1)"), t553))
}

///|
let division_face_lowerbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVISION_FACE_LOWERBOUND")

///|
/// `DIVISION_FACE_LOWERBOUND`
pub fn division_face_lowerbound() -> @kernel.Thm {
  division_face_lowerbound_c.get()
}

///|
/// E_PAIR_PREIMAGE_TAC
fn step_20() -> Unit raise {
  let t570 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), cube_bounds_tac), @tactics.all_tac])
  let t569 = @tactics.subgoal_then(@term_syntax.parse_term("interval_lowerbound((m1 : (Cart[Real, 3]) -> Bool)) == (c1 : Cart[Real, 3]) && interval_upperbound(m1) == c1 + op_pct((s1 : Real), vec(1)) && interval_lowerbound((m2 : (Cart[Real, 3]) -> Bool)) == (c2 : Cart[Real, 3]) && interval_upperbound(m2) == c2 + op_pct((s2 : Real), vec(1))"), @tactics.strip_assume_tac)
  let t568 = @list.List([@tactics.then_tac(@tactics.conj_tac, @meson.asm_meson_tac(@list.List([cube_dissection(), cube()]))), @tactics.all_tac])
  let t567 = @tactics.subgoal_then(@term_syntax.parse_term("(∃ c1 : Cart[Real, 3], ∃ s1 : Real, real_of_num(0) < s1 && (m1 : (Cart[Real, 3]) -> Bool) == interval([(c1, c1 + op_pct(s1, vec(1)))])) && (∃ c2 : Cart[Real, 3], ∃ s2 : Real, real_of_num(0) < s2 && (m2 : (Cart[Real, 3]) -> Bool) == interval([(c2, c2 + op_pct(s2, vec(1)))]))"), @tactics.strip_assume_tac)
  let t565 = @simp.asm_rewrite_tac(@list.List([]))
  let t566 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.undisch_tac(@term_syntax.parse_term("!((e1 : (Cart[Real, 2]) -> Bool) == (e2 : (Cart[Real, 2]) -> Bool))"))), t565), @tactics.all_tac])
  let t564 = @tactics.subgoal_then(@term_syntax.parse_term("!((m1 : (Cart[Real, 3]) -> Bool) == (m2 : (Cart[Real, 3]) -> Bool))"), fn(x561 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s562 = @tactics.assume_tac(x561)
    fn(x563 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s562(x563)
    }
  })
  let t560 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m2 : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t559 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()]))
  let t558 = @simp.expand_tac("E")
  let t557 = @tactics.undisch_tac(@term_syntax.parse_term("IN((e2 : (Cart[Real, 2]) -> Bool), (E : ((Cart[Real, 2]) -> Bool) -> Bool))"))
  let t556 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m1 : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t555 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()]))
  let t554 = @simp.expand_tac("E")
  e_pair_preimage_tac_c.set(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((e1 : (Cart[Real, 2]) -> Bool), (E : ((Cart[Real, 2]) -> Bool) -> Bool))")), t554), t555), t556), t557), t558), t559), t560), t564), t566), t567), t568), t569), t570))
}

///|
let e_pair_preimage_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("E_PAIR_PREIMAGE_TAC")

///|
/// `E_PAIR_PREIMAGE_TAC`
pub fn e_pair_preimage_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (e_pair_preimage_tac_c.get())(x)
}

///|
/// VALLEY_FACE_INTERIOR
fn step_21() -> Unit raise {
  let t896 = @simp.rewrite_tac(@list.List([@vectors.vector_2()]))
  let t895 = @tactics.disch_then(fn(x892 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x892
    let t894 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((ck : Cart[Real, 3]), 2) + (sk : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(ck, 3) + sk])"), th_2))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((ck : Cart[Real, 3]), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(ck, 3)])"), th_2)), t894)
  })
  let t891 = @simp.rewrite_tac(@list.List([@topology.interior_interval(), @vectors.in_interval(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_2(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), @vectors.interval_ne_empty()]))
  let t890 = @simp.expand_tac("face_sq")
  let t889 = @simp.expand_tac("proj_k")
  let t887 = @simp.gen_rewrite_rule(fn(x886 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x886
  }, @list.List([@sets.subset()]))
  let t897 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x888 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x883 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s884 = @tactics.mp_tac(x883)
      fn(x885 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s884(x885)
      }
    })(t887(x888))
  }), t889), t890), t891), t895), t896), @calc_rat.asm_real_arith_tac)
  let t882 = @simp.asm_rewrite_tac(@list.List([@topology.eq_interval(), @cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_2()]))
  let t881 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t880 = @tactics.subgoal_then(@term_syntax.parse_term("(interval : (List[(Cart[Real, 2], Cart[Real, 2])], Cart[Real, 2]) -> Bool)([((vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((ck : Cart[Real, 3]), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(ck, 3)]), (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(ck, 2) + (sk : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(ck, 3) + sk]))]) == (interval : (List[(Cart[Real, 2], Cart[Real, 2])], Cart[Real, 2]) -> Bool)([((vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((cv : Cart[Real, 3]), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3)]), (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 2) + (sv : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3) + sv]))])"), fn(x877 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s878 = @tactics.mp_tac(x877)
    fn(x879 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s878(x879)
    }
  })
  let t876 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.interval_ne_empty(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_2()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t898 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!((interval : (List[(Cart[Real, 2], Cart[Real, 2])], Cart[Real, 2]) -> Bool)([((vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((ck : Cart[Real, 3]), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(ck, 3)]), (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(ck, 2) + (sk : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(ck, 3) + sk]))]) == ({} : (Cart[Real, 2]) -> Bool)) && !((interval : (List[(Cart[Real, 2], Cart[Real, 2])], Cart[Real, 2]) -> Bool)([((vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((cv : Cart[Real, 3]), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3)]), (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 2) + (sv : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3) + sv]))]) == ({} : (Cart[Real, 2]) -> Bool))"), @tactics.strip_assume_tac), t876), t880), t881), t882), @calc_rat.asm_real_arith_tac), t897])
  let t875 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t873 = @simp.asm_rewrite_tac(@list.List([]))
  let t874 = @list.List([@tactics.then_tac(@simp.expand_tac("face_sq"), t873), @tactics.all_tac])
  let t869 = @term_syntax.parse_term("(proj_k : (Cart[Real, 2]) -> Bool)")
  let t870 = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((cv : Cart[Real, 3]), 2) + (sv : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3) + sv])")
  let t871 = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((cv : Cart[Real, 3]), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3)])")
  let t872 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(E : ((Cart[Real, 2]) -> Bool) -> Bool)"), t871, t870, t869]), square_dissection_nonedge()))
  let t867 = @simp.asm_rewrite_tac(@list.List([]))
  let t864 = @simp.asm_simp_tac(@list.List([interval_length_cube_pos()]))
  let t863 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), vector2_cube()]))
  let t865 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("interval_lowerbound((m1 : (Cart[Real, 3]) -> Bool)) == (cm1 : Cart[Real, 3]) && interval_upperbound(m1) == cm1 + op_pct((sm1 : Real), vec(1))"), @tactics.strip_assume_tac), @list.List([cube_bounds_tac, @tactics.all_tac])), t863), t864), @tactics.all_tac])
  let t862 = @tactics.subgoal_then(@term_syntax.parse_term("interval_length((e0 : (Cart[Real, 2]) -> Bool)) == (sm1 : Real)"), fn(x859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s860 = @tactics.assume_tac(x859)
    fn(x861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s860(x861)
    }
  })
  let t857 = @simp.asm_simp_tac(@list.List([interval_length_cube_pos()]))
  let t856 = @simp.rewrite_tac(@list.List([vector2_cube()]))
  let t858 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("proj_k"), t856), t857), @tactics.all_tac])
  let t855 = @tactics.subgoal_then(@term_syntax.parse_term("interval_length((proj_k : (Cart[Real, 2]) -> Bool)) == (sk : Real)"), fn(x852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s853 = @tactics.assume_tac(x852)
    fn(x854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s853(x854)
    }
  })
  let t851 = @list.List([@tactics.then_tac(@tactics.conj_tac, @simp.asm_simp_tac(@list.List([interval_length_cube_pos()]))), @tactics.all_tac])
  let t850 = @tactics.subgoal_then(@term_syntax.parse_term("interval_length((k : (Cart[Real, 3]) -> Bool)) == (sk : Real) && interval_length((m1 : (Cart[Real, 3]) -> Bool)) == (sm1 : Real)"), @tactics.strip_assume_tac)
  let t847 = @simp.rewrite_tac(@list.List([]))
  let t846 = @meson.asm_meson_tac(@list.List([]))
  let t848 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()])), t846), t847])
  let t849 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.first_assum(fn(x844 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x844
    if @basics.is_forall(@kernel.concl(th_1)) {
      let (v, _) = @basics.dest_forall(@kernel.concl(th_1))
      if (@kernel.dest_var(v).0 == "j'") {
        @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m1 : (Cart[Real, 3]) -> Bool)"), th_1))
      } else {
        raise Failure("")
      }
    } else {
      raise Failure("")
    }
  }), @tactics.ants_tac), t848), @tactics.all_tac])
  let t843 = @tactics.subgoal_then(@term_syntax.parse_term("interval_length((k : (Cart[Real, 3]) -> Bool)) < interval_length((m1 : (Cart[Real, 3]) -> Bool))"), fn(x840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s841 = @tactics.assume_tac(x840)
    fn(x842 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s841(x842)
    }
  })
  let t838 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t837 = @tactics.undisch_tac(@term_syntax.parse_term("!((e0 : (Cart[Real, 2]) -> Bool) == (proj_k : (Cart[Real, 2]) -> Bool))"))
  let t839 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s835 = @tactics.subst_all_tac(x834)
    fn(x836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s835(x836)
    }
  }), t837), t838), @tactics.all_tac])
  let t833 = @tactics.subgoal_then(@term_syntax.parse_term("!((m1 : (Cart[Real, 3]) -> Bool) == (k : (Cart[Real, 3]) -> Bool))"), fn(x830 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s831 = @tactics.assume_tac(x830)
    fn(x832 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s831(x832)
    }
  })
  let t829 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection(), cube()])), @tactics.all_tac])
  let t828 = @tactics.subgoal_then(@term_syntax.parse_term("∃ cm1 : Cart[Real, 3], ∃ sm1 : Real, real_of_num(0) < sm1 && (m1 : (Cart[Real, 3]) -> Bool) == interval([(cm1, cm1 + op_pct(sm1, vec(1)))])"), @tactics.strip_assume_tac)
  let t827 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m1 : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t826 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()]))
  let t825 = @simp.expand_tac("E")
  let t824 = @tactics.undisch_tac(@term_syntax.parse_term("IN((e0 : (Cart[Real, 2]) -> Bool), (E : ((Cart[Real, 2]) -> Bool) -> Bool))"))
  let t866 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(e0 : (Cart[Real, 2]) -> Bool)")), @tactics.strip_tac), t824), t825), t826), t827), t828), t829), t833), t839), t843), t849), t850), t851), t855), t858), t862), t865), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t823 = @tactics.subgoal_then(@term_syntax.parse_term("∀ e : (Cart[Real, 2]) -> Bool, IN(e, (E : ((Cart[Real, 2]) -> Bool) -> Bool)) && !(e == (proj_k : (Cart[Real, 2]) -> Bool)) → interval_length(proj_k) < interval_length(e)"), fn(x820 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s821 = @tactics.assume_tac(x820)
    fn(x822 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s821(x822)
    }
  })
  let t816 = @simp.asm_rewrite_tac(@list.List([]))
  let t815 = @tactics.match_mp_tac(@topology.closure_minimal())
  let t813 = @simp.asm_rewrite_tac(@list.List([]))
  let t814 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@equal.gsym(@topology.closure_open_interval())), t813), @tactics.all_tac])
  let t812 = @tactics.subgoal_then(@term_syntax.parse_term("(interval : (List[(Cart[Real, 2], Cart[Real, 2])], Cart[Real, 2]) -> Bool)([((vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((cv : Cart[Real, 3]), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3)]), (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 2) + (sv : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3) + sv]))]) == (closure : ((Cart[Real, 2]) -> Bool, Cart[Real, 2]) -> Bool)((interval : ((Cart[Real, 2], Cart[Real, 2]), Cart[Real, 2]) -> Bool)(((vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3)]), (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 2) + sv, (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3) + sv]))))"), fn(x809 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s810 = @tactics.subst1_tac(x809)
    fn(x811 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s810(x811)
    }
  })
  let t807 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (sv : Real)"))
  let t808 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.interval_ne_empty(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_2()])), t807), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t806 = @tactics.subgoal_then(@term_syntax.parse_term("!((interval : ((Cart[Real, 2], Cart[Real, 2]), Cart[Real, 2]) -> Bool)(((vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((cv : Cart[Real, 3]), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3)]), (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 2) + (sv : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(cv, 3) + sv]))) == ({} : (Cart[Real, 2]) -> Bool))"), fn(x803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s804 = @tactics.assume_tac(x803)
    fn(x805 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s804(x805)
    }
  })
  let t802 = @simp.expand_tac("face_sq")
  let t800 = @meson.meson_tac(@list.List([]))
  let t799 = @simp.asm_rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_3(), @vectors.vector_2(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t798 = @tactics.undisch_tac(@term_syntax.parse_term("IN(vector([op_dollar((cv : Cart[Real, 3]), 1) + (sv : Real), op_dollar((y : Cart[Real, 2]), 1), op_dollar(y, 2)]), (mp2 : (Cart[Real, 3]) -> Bool))"))
  let t797 = @tactics.subgoal_then(@term_syntax.parse_term("interval_lowerbound((mp2 : (Cart[Real, 3]) -> Bool)) == (cmp2 : Cart[Real, 3]) && interval_upperbound(mp2) == cmp2 + op_pct((smp2 : Real), vec(1))"), @tactics.strip_assume_tac)
  let t796 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection(), cube()])), @tactics.all_tac])
  let t795 = @tactics.subgoal_then(@term_syntax.parse_term("∃ cmp2 : Cart[Real, 3], ∃ smp2 : Real, real_of_num(0) < smp2 && (mp2 : (Cart[Real, 3]) -> Bool) == interval([(cmp2, cmp2 + op_pct(smp2, vec(1)))])"), @tactics.strip_assume_tac)
  let t793 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_3()]))
  let t792 = @tactics.exists_tac(@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)((cv : Cart[Real, 3]), 1) + (sv : Real), (op_dollar : (Cart[Real, 2], Num) -> Real)((y : Cart[Real, 2]), 1), (op_dollar : (Cart[Real, 2], Num) -> Real)(y, 2)])"))
  let t791 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t790 = @tactics.exists_tac(@term_syntax.parse_term("(mp2 : (Cart[Real, 3]) -> Bool)"))
  let t789 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()]))
  let t794 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("E"), t789), t790), t791), t792), t793), @tactics.all_tac])
  let t788 = @tactics.exists_tac(@term_syntax.parse_term("(interval : (List[(Cart[Real, 2], Cart[Real, 2])], Cart[Real, 2]) -> Bool)([((vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((interval_lowerbound : ((Cart[Real, 3]) -> Bool) -> Cart[Real, 3])((mp2 : (Cart[Real, 3]) -> Bool)), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)((interval_lowerbound : ((Cart[Real, 3]) -> Bool) -> Cart[Real, 3])(mp2), 3)]), (vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((interval_upperbound : ((Cart[Real, 3]) -> Bool) -> Cart[Real, 3])(mp2), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)((interval_upperbound : ((Cart[Real, 3]) -> Bool) -> Cart[Real, 3])(mp2), 3)]))])"))
  let t787 = @simp.rewrite_tac(@list.List([@sets.in_unions()]))
  let t785 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t782 = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)((cv : Cart[Real, 3]), 1) + (sv : Real), (op_dollar : (Cart[Real, 2], Num) -> Real)((y : Cart[Real, 2]), 1), (op_dollar : (Cart[Real, 2], Num) -> Real)(y, 2)])")
  let t786 = @list.List([@tactics.then_tac(@tactics.use_then("vcov", fn(x784 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(((x783 : @kernel.Thm) => @bool.spec(t782, x783))(x784))
  }), t785), @tactics.all_tac])
  let t780 = @tactics.x_choose_then(@term_syntax.parse_term("(mp2 : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac)
  let t781 = @tactics.subgoal_then(@term_syntax.parse_term("∃ mp2 : (Cart[Real, 3]) -> Bool, IN(mp2, (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && IN(vector([op_dollar((cv : Cart[Real, 3]), 1) + (sv : Real), op_dollar((y : Cart[Real, 2]), 1), op_dollar(y, 2)]), mp2) && op_dollar(interval_lowerbound(mp2), 1) == op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1)"), t780)
  let t779 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t801 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @vectors.in_interval(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_2()])), t779), @tactics.strip_tac), t781), t786), t787), t788), @tactics.conj_tac), t794), t795), t796), t797), @list.List([cube_bounds_tac, @tactics.all_tac])), t798), t799), t800), @tactics.all_tac])
  let t778 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(interval((vector([op_dollar((cv : Cart[Real, 3]), 2), op_dollar(cv, 3)]), vector([op_dollar(cv, 2) + (sv : Real), op_dollar(cv, 3) + sv]))), UNIONS((E : ((Cart[Real, 2]) -> Bool) -> Bool)))"), fn(x775 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s776 = @tactics.assume_tac(x775)
    fn(x777 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s776(x777)
    }
  })
  let t773 = @meson.asm_meson_tac(@list.List([cube_dissection(), cube(), @topology.closed_interval()]))
  let t772 = @tactics.x_gen_tac(@term_syntax.parse_term("(ef : (Cart[Real, 2]) -> Bool)"))
  let t771 = @simp.asm_rewrite_tac(@list.List([]))
  let t774 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.closed_unions()), t771), t772), @tactics.disch_tac), t773), @tactics.all_tac])
  let t817 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("closed(UNIONS((E : ((Cart[Real, 2]) -> Bool) -> Bool)))"), fn(x768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s769 = @tactics.assume_tac(x768)
    fn(x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s769(x770)
    }
  }), t774), t778), t801), t802), t806), t808), t812), t814), t815), t816)
  let t767 = @tactics.repeat_tac(@tactics.strip_tac)
  let t766 = @simp.rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_2()]))
  let t765 = @simp.expand_tac("face_sq")
  let t764 = @simp.asm_rewrite_tac(@list.List([]))
  let t763 = @tactics.undisch_tac(@term_syntax.parse_term("IN((p : Cart[Real, 2]), (ep : (Cart[Real, 2]) -> Bool))"))
  let t761 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t759 = @meson.asm_meson_tac(@list.List([]))
  let t760 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()])), t759), @tactics.all_tac])
  let t756 = @term_syntax.parse_term("(mp : (Cart[Real, 3]) -> Bool)")
  let t762 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.use_then("vcont", fn(x758 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x753 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s754 = @tactics.mp_tac(x753)
      fn(x755 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s754(x755)
      }
    })(((x757 : @kernel.Thm) => @bool.spec(t756, x757))(x758))
  }), @tactics.ants_tac), t760), t761), @tactics.all_tac])
  let t752 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((cv : Cart[Real, 3]), 2) <= op_dollar(interval_lowerbound((mp : (Cart[Real, 3]) -> Bool)), 2) && op_dollar(interval_upperbound(mp), 2) <= op_dollar(cv, 2) + (sv : Real) && op_dollar(cv, 3) <= op_dollar(interval_lowerbound(mp), 3) && op_dollar(interval_upperbound(mp), 3) <= op_dollar(cv, 3) + sv"), @tactics.strip_assume_tac)
  let t751 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(mp : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t750 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()]))
  let t749 = @simp.expand_tac("E")
  let t748 = @tactics.undisch_tac(@term_syntax.parse_term("IN((ep : (Cart[Real, 2]) -> Bool), (E : ((Cart[Real, 2]) -> Bool) -> Bool))"))
  let t747 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ep : (Cart[Real, 2]) -> Bool)"))(@tactics.strip_assume_tac))
  let t746 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Cart[Real, 2])"))
  let t818 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_unions()])), t746), t747), t748), t749), t750), t751), t752), t762), t763), t764), t765), t766), t767), @calc_rat.asm_real_arith_tac), t817])
  let t819 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_antisym()), @tactics.conj_tac), t818), @tactics.all_tac])
  let t745 = @tactics.subgoal_then(@term_syntax.parse_term("UNIONS((E : ((Cart[Real, 2]) -> Bool) -> Bool)) == (face_sq : (Cart[Real, 2]) -> Bool)"), fn(x742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s743 = @tactics.assume_tac(x742)
    fn(x744 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s743(x744)
    }
  })
  let t736 = @tactics.use_then("epw", fn(x733 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s734 = @tactics.accept_tac(x733)
    fn(x735 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s734(x735)
    }
  })
  let t737 = @tactics.use_then("ecub", fn(x730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s731 = @tactics.accept_tac(x730)
    fn(x732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s731(x732)
    }
  })
  let t738 = @tactics.use_then("edisj", fn(x727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s728 = @tactics.accept_tac(x727)
    fn(x729 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s728(x729)
    }
  })
  let t724 = @meson.asm_meson_tac(@list.List([cube()]))
  let t725 = @meson.asm_meson_tac(@list.List([cube_imp_nonempty()]))
  let t726 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t725, t724])
  let t723 = @tactics.repeat_tac(@tactics.conj_tac)
  let t739 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(ef : (Cart[Real, 2]) -> Bool)")), @tactics.disch_tac), t723), t726)
  let t740 = @list.List([@tactics.first_assum(fn(x720 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s721 = @tactics.accept_tac(x720)
    fn(x722 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s721(x722)
    }
  }), t739, t738, t737, t736])
  let t719 = @tactics.repeat_tac(@tactics.conj_tac)
  let t741 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([cube_dissection(), @integration.division_of()])), t719), t740), @tactics.all_tac])
  let t718 = @tactics.subgoal_then(@term_syntax.parse_term("cube_dissection((E : ((Cart[Real, 2]) -> Bool) -> Bool))"), fn(x715 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s716 = @tactics.assume_tac(x715)
    fn(x717 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s716(x717)
    }
  })
  let t713 = @simp.asm_simp_tac(@list.List([interval_length_cube_pos()]))
  let t712 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection(), @sets.pairwise()])), @tactics.all_tac])
  let t711 = @tactics.subgoal_then(@term_syntax.parse_term("!(interval_length((m1 : (Cart[Real, 3]) -> Bool)) == interval_length((m2 : (Cart[Real, 3]) -> Bool)))"), fn(x708 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s709 = @tactics.mp_tac(x708)
    fn(x710 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s709(x710)
    }
  })
  let t706 = @simp.asm_simp_tac(@list.List([interval_length_cube_pos()]))
  let t707 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), vector2_cube()]))), t706), @tactics.all_tac])
  let t705 = @tactics.subgoal_then(@term_syntax.parse_term("interval_length((e1 : (Cart[Real, 2]) -> Bool)) == (s1 : Real) && interval_length((e2 : (Cart[Real, 2]) -> Bool)) == (s2 : Real)"), @tactics.strip_assume_tac)
  let t703 = @term_syntax.parse_term("(e2 : (Cart[Real, 2]) -> Bool)")
  let t704 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(e1 : (Cart[Real, 2]) -> Bool)"), t703]))
  let t714 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.pairwise()])), t704), @tactics.strip_tac), e_pair_preimage_tac), t705), t707), t711), t712), t713), @tactics.all_tac])
  let t702 = @tactics.subgoal_then(@term_syntax.parse_term("pairwise((k : (Cart[Real, 2]) -> Bool) => (k' : (Cart[Real, 2]) -> Bool) => !(interval_length(k) == interval_length(k')), (E : ((Cart[Real, 2]) -> Bool) -> Bool))"), fn(x699 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s700 = ((x698 : @kernel.Thm) => @tactics.label_tac("epw", x698))(x699)
    fn(x701 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s700(x701)
    }
  })
  let t696 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t695 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(interior((m1 : (Cart[Real, 3]) -> Bool)), interior((m2 : (Cart[Real, 3]) -> Bool))) == {}"))
  let t693 = @simp.asm_rewrite_tac(@list.List([@topology.interior_closed_interval(), @vectors.in_interval(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_2(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t692 = @tactics.undisch_tac(@term_syntax.parse_term("IN((y : Cart[Real, 2]), interior((e2 : (Cart[Real, 2]) -> Bool)))"))
  let t691 = @tactics.undisch_tac(@term_syntax.parse_term("IN((y : Cart[Real, 2]), interior((e1 : (Cart[Real, 2]) -> Bool)))"))
  let t694 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@topology.interior_closed_interval(), @vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()])), t691), t692), t693), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t690 = @tactics.subgoal_then(@term_syntax.parse_term("IN(vector([op_dollar((c1 : Cart[Real, 3]), 1) + min((s1 : Real), (s2 : Real)) / real_of_num(2), op_dollar((y : Cart[Real, 2]), 1), op_dollar(y, 2)]), interior((m1 : (Cart[Real, 3]) -> Bool))) && IN(vector([op_dollar(c1, 1) + min(s1, s2) / real_of_num(2), op_dollar(y, 1), op_dollar(y, 2)]), interior((m2 : (Cart[Real, 3]) -> Bool)))"), @tactics.strip_assume_tac)
  let t689 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t688 = @simp.rewrite_tac(@list.List([@sets.in_inter()]))
  let t685 = @simp.gen_rewrite_rule(fn(x684 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x684
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t687 = @tactics.first_x_assum(fn(x686 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x681 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s682 = @tactics.mp_tac(x681)
      fn(x683 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s682(x683)
      }
    })(t685(x686))
  })
  let t680 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) → false) → p")))
  let t679 = meson_assume_tac(@list.List([cube_dissection(), @integration.division_of()]), @term_syntax.parse_term("INTER(interior((m1 : (Cart[Real, 3]) -> Bool)), interior((m2 : (Cart[Real, 3]) -> Bool))) == {}"))
  let t678 = meson_assume_tac(@list.List([]), @term_syntax.parse_term("op_dollar((c1 : Cart[Real, 3]), 1) == op_dollar((c2 : Cart[Real, 3]), 1)"))
  let t677 = @term_syntax.parse_term("(e2 : (Cart[Real, 2]) -> Bool)")
  let t697 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(e1 : (Cart[Real, 2]) -> Bool)"), t677])), @tactics.strip_tac), e_pair_preimage_tac), t678), t679), t680), @tactics.disch_tac), t687), t688), t689), t690), t694), t695), t696), @tactics.all_tac])
  let t676 = @tactics.subgoal_then(@term_syntax.parse_term("∀ e1 : (Cart[Real, 2]) -> Bool, ∀ e2 : (Cart[Real, 2]) -> Bool, IN(e1, (E : ((Cart[Real, 2]) -> Bool) -> Bool)) && IN(e2, E) && !(e1 == e2) → INTER(interior(e1), interior(e2)) == {}"), fn(x673 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s674 = ((x672 : @kernel.Thm) => @tactics.label_tac("edisj", x672))(x673)
    fn(x675 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s674(x675)
    }
  })
  let t670 = @simp.asm_rewrite_tac(@list.List([vector2_cube()]))
  let t669 = @tactics.exists_tac(@term_syntax.parse_term("(sma : Real)"))
  let t668 = @tactics.exists_tac(@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(op_dollar : (Cart[Real, 3], Num) -> Real)((cma : Cart[Real, 3]), 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(cma, 3)])"))
  let t667 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), cube()]))
  let t666 = @tactics.subgoal_then(@term_syntax.parse_term("interval_lowerbound((ma : (Cart[Real, 3]) -> Bool)) == (cma : Cart[Real, 3]) && interval_upperbound(ma) == cma + op_pct((sma : Real), vec(1))"), @tactics.strip_assume_tac)
  let t665 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection(), cube()])), @tactics.all_tac])
  let t664 = @tactics.subgoal_then(@term_syntax.parse_term("∃ cma : Cart[Real, 3], ∃ sma : Real, real_of_num(0) < sma && (ma : (Cart[Real, 3]) -> Bool) == interval([(cma, cma + op_pct(sma, vec(1)))])"), @tactics.strip_assume_tac)
  let t663 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ma : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t662 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()]))
  let t661 = @simp.expand_tac("E")
  let t671 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(ea : (Cart[Real, 2]) -> Bool)")), t661), t662), t663), t664), t665), t666), @list.List([cube_bounds_tac, @tactics.all_tac])), t667), t668), t669), t670), @tactics.all_tac])
  let t660 = @tactics.subgoal_then(@term_syntax.parse_term("∀ e : (Cart[Real, 2]) -> Bool, IN(e, (E : ((Cart[Real, 2]) -> Bool) -> Bool)) → cube(e)"), fn(x657 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s658 = ((x656 : @kernel.Thm) => @tactics.label_tac("ecub", x656))(x657)
    fn(x659 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s658(x659)
    }
  })
  let t654 = @sets.set_tac(@list.List([]))
  let t653 = @simp.asm_rewrite_tac(@list.List([]))
  let t652 = @tactics.exists_tac(@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"))
  let t651 = @tactics.match_mp_tac(@sets.finite_subset())
  let t650 = @tactics.match_mp_tac(@sets.finite_image())
  let t655 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("E"), t650), t651), t652), t653), t654), @tactics.all_tac])
  let t649 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((E : ((Cart[Real, 2]) -> Bool) -> Bool))"), fn(x646 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s647 = @tactics.assume_tac(x646)
    fn(x648 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s647(x648)
    }
  })
  let t644 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t643 = @tactics.exists_tac(@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)"))
  let t642 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm()]))
  let t641 = @simp.expand_tac("proj_k")
  let t645 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("E"), t641), t642), t643), t644), @tactics.all_tac])
  let t640 = @tactics.subgoal_then(@term_syntax.parse_term("IN((proj_k : (Cart[Real, 2]) -> Bool), (E : ((Cart[Real, 2]) -> Bool) -> Bool))"), fn(x637 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s638 = @tactics.assume_tac(x637)
    fn(x639 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s638(x639)
    }
  })
  let t635 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t631 = @term_syntax.parse_term("op_dollar((z : Cart[Real, 3]), 3) < op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 3)")
  let t632 = @term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 3) < op_dollar((z : Cart[Real, 3]), 3)")
  let t633 = @term_syntax.parse_term("op_dollar((z : Cart[Real, 3]), 2) < op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 2)")
  let t634 = @tactics.map_every(fn(x628 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s629 = @tactics.undisch_tac(x628)
    fn(x630 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s629(x630)
    }
  }, @list.List([@term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2) < op_dollar((z : Cart[Real, 3]), 2)"), t633, t632, t631]))
  let t627 = @simp.asm_rewrite_tac(@list.List([]))
  let t636 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 3])")), t627), t634), t635), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t868 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ z : Cart[Real, 3], IN(z, (k : (Cart[Real, 3]) -> Bool)) && op_dollar((cv : Cart[Real, 3]), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(cv, 2) + (sv : Real) && op_dollar(cv, 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(cv, 3) + sv"), fn(x624 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s625 = ((x623 : @kernel.Thm) => @tactics.label_tac("zk_cv", x623))(x624)
    fn(x626 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s625(x626)
    }
  }), t636), t640), t645), t649), t655), t660), t671), t676), t697), t702), t714), t718), t741), t745), t819), t823), t866), t867), @tactics.all_tac])
  let t622 = @tactics.subgoal_then(@term_syntax.parse_term("cube_dissection((E : ((Cart[Real, 2]) -> Bool) -> Bool)) && UNIONS(E) == (face_sq : (Cart[Real, 2]) -> Bool) && IN((proj_k : (Cart[Real, 2]) -> Bool), E) && (∀ e : (Cart[Real, 2]) -> Bool, IN(e, E) && !(e == proj_k) → interval_length(proj_k) < interval_length(e))"), @tactics.strip_assume_tac)
  let t621 = @simp.abbrev_tac(@term_syntax.parse_term("(proj_k : (Cart[Real, 2]) -> Bool) == interval([(vector([op_dollar((ck : Cart[Real, 3]), 2), op_dollar(ck, 3)]), vector([op_dollar(ck, 2) + (sk : Real), op_dollar(ck, 3) + sk]))])"))
  let t620 = @simp.abbrev_tac(@term_syntax.parse_term("(face_sq : (Cart[Real, 2]) -> Bool) == interval([(vector([op_dollar((cv : Cart[Real, 3]), 2), op_dollar(cv, 3)]), vector([op_dollar(cv, 2) + (sv : Real), op_dollar(cv, 3) + sv]))])"))
  let t619 = @simp.abbrev_tac(@term_syntax.parse_term("(E : ((Cart[Real, 2]) -> Bool) -> Bool) == IMAGE((m : (Cart[Real, 3]) -> Bool) => interval([(vector([op_dollar(interval_lowerbound(m), 2), op_dollar(interval_lowerbound(m), 3)]), vector([op_dollar(interval_upperbound(m), 2), op_dollar(interval_upperbound(m), 3)]))]), {(m : (Cart[Real, 3]) -> Bool) | IN(m, (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && op_dollar(interval_lowerbound(m), 1) == op_dollar((cv : Cart[Real, 3]), 1) + (sv : Real) && (∃ z : Cart[Real, 3], IN(z, m) && op_dollar(cv, 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(cv, 2) + sv && op_dollar(cv, 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(cv, 3) + sv)})"))
  let t617 = @simp.asm_simp_tac(@list.List([interval_length_cube_pos()]))
  let t615 = @meson.asm_meson_tac(@list.List([]))
  let t616 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t615), @tactics.all_tac])
  let t612 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t618 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.use_then("vsz", fn(x614 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x609 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s610 = @tactics.mp_tac(x609)
      fn(x611 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s610(x611)
      }
    })(((x613 : @kernel.Thm) => @bool.spec(t612, x613))(x614))
  }), @tactics.ants_tac), t616), t617), @tactics.all_tac])
  let t608 = @tactics.subgoal_then(@term_syntax.parse_term("(sk : Real) < (sv : Real)"), fn(x605 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s606 = @tactics.assume_tac(x605)
    fn(x607 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s606(x607)
    }
  })
  let t603 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t601 = @meson.asm_meson_tac(@list.List([]))
  let t602 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t601), @tactics.all_tac])
  let t598 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t604 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.use_then("vcont", fn(x600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s596 = @tactics.mp_tac(x595)
      fn(x597 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s596(x597)
      }
    })(((x599 : @kernel.Thm) => @bool.spec(t598, x599))(x600))
  }), @tactics.ants_tac), t602), t603), @tactics.all_tac])
  let t594 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((cv : Cart[Real, 3]), 2) <= op_dollar((ck : Cart[Real, 3]), 2) && op_dollar(ck, 2) + (sk : Real) <= op_dollar(cv, 2) + (sv : Real) && op_dollar(cv, 3) <= op_dollar(ck, 3) && op_dollar(ck, 3) + sk <= op_dollar(cv, 3) + sv"), @tactics.strip_assume_tac)
  let t592 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t593 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 1) == op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1)")), t592), @tactics.all_tac])
  let t591 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((ck : Cart[Real, 3]), 1) == op_dollar((cv : Cart[Real, 3]), 1) + (sv : Real)"), fn(x588 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s589 = @tactics.assume_tac(x588)
    fn(x590 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s589(x590)
    }
  })
  let t587 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t586 = @list.List([@tactics.then_tac(@tactics.conj_tac, cube_bounds_tac), @tactics.all_tac])
  let t585 = @tactics.subgoal_then(@term_syntax.parse_term("(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)) == (cv : Cart[Real, 3]) && interval_upperbound(v) == cv + op_pct((sv : Real), vec(1))) && interval_lowerbound((k : (Cart[Real, 3]) -> Bool)) == (ck : Cart[Real, 3]) && interval_upperbound(k) == ck + op_pct((sk : Real), vec(1))"), @tactics.strip_assume_tac)
  let t584 = @list.List([@meson.asm_meson_tac(@list.List([cube()])), @tactics.all_tac])
  let t583 = @tactics.subgoal_then(@term_syntax.parse_term("∃ ck : Cart[Real, 3], ∃ sk : Real, real_of_num(0) < sk && (k : (Cart[Real, 3]) -> Bool) == interval([(ck, ck + op_pct(sk, vec(1)))])"), @tactics.strip_assume_tac)
  let t582 = @list.List([@meson.asm_meson_tac(@list.List([valley(), cube()])), @tactics.all_tac])
  let t581 = @tactics.subgoal_then(@term_syntax.parse_term("∃ cv : Cart[Real, 3], ∃ sv : Real, real_of_num(0) < sv && (v : (Cart[Real, 3]) -> Bool) == interval([(cv, cv + op_pct(sv, vec(1)))])"), @tactics.strip_assume_tac)
  let t580 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("cube((k : (Cart[Real, 3]) -> Bool))"))
  let t579 = meson_assume_tac(@list.List([@integration.division_of()]), @term_syntax.parse_term("FINITE((D : ((Cart[Real, 3]) -> Bool) -> Bool))"))
  let t578 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("division_of((D : ((Cart[Real, 3]) -> Bool) -> Bool), UNIONS(D))"))
  let t577 = @tactics.first_assum(fn(x571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x571
    let th_p = @simp.gen_rewrite_rule(fn(x573 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x573
    }, @list.List([valley()]))(th)
    let t576 = @tactics.label_tac("vsz", @bool.conjunct2(@bool.conjunct2(@bool.conjunct2(th_p))))
    let t575 = @tactics.label_tac("vcont", @bool.conjunct1(@bool.conjunct2(@bool.conjunct2(th_p))))
    let t574 = @tactics.label_tac("vcov", @bool.conjunct1(@bool.conjunct2(th_p)))
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.label_tac("vcub", @bool.conjunct1(th_p)), t574), t575), t576)
  })
  let t899 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t577), t578), t579), t580), t581), t582), t583), t584), t585), t586), t587), t591), t593), t594), t604), t608), t618), t619), t620), t621), t622), t868), t872), @tactics.ants_tac), t874), t875), t898)
  valley_face_interior_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, ∀ a : Cart[Real, 3], ∀ d : Real, ∀ v : (Cart[Real, 3]) -> Bool, ∀ k : (Cart[Real, 3]) -> Bool, real_of_num(0) < d && cube_dissection(D) && UNIONS(D) == interval([(a, a + op_pct(d, vec(1)))]) && valley(D, v) && IN(k, D) && op_dollar(interval_lowerbound(k), 1) == op_dollar(interval_upperbound(v), 1) && (∃ z : Cart[Real, 3], IN(z, k) && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3)) && (∀ j' : (Cart[Real, 3]) -> Bool, IN(j', D) && !(j' == k) && op_dollar(interval_lowerbound(j'), 1) == op_dollar(interval_upperbound(v), 1) && (∃ z : Cart[Real, 3], IN(z, j') && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3)) → interval_length(k) < interval_length(j')) → op_dollar(interval_lowerbound(v), 2) < op_dollar(interval_lowerbound(k), 2) && op_dollar(interval_upperbound(k), 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(interval_lowerbound(k), 3) && op_dollar(interval_upperbound(k), 3) < op_dollar(interval_upperbound(v), 3)"), t899))
}

///|
let valley_face_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALLEY_FACE_INTERIOR")

///|
/// `VALLEY_FACE_INTERIOR`
pub fn valley_face_interior() -> @kernel.Thm {
  valley_face_interior_c.get()
}

///|
/// REAL_OPEN_INTERVAL_AVOID_FINITE
fn step_22() -> Unit raise {
  let t913 = @meson.meson_tac(@list.List([]))
  let t912 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_diff(), @sets.in_elim_thm()]))
  let t909 = @drule.match_mp(@sets.infinite_nonempty())
  let t911 = @tactics.disch_then(fn(x910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x906 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s907 = @tactics.mp_tac(x906)
      fn(x908 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s907(x908)
      }
    })(t909(x910))
  })
  let t904 = @simp.asm_rewrite_tac(@list.List([@sets.infinite(), @sets.finite_real_interval()]))
  let t905 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.infinite_diff_finite()), t904), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t903 = @tactics.subgoal_then(@term_syntax.parse_term("INFINITE(DIFF({(x : Real) | (a : Real) < x && x < (b : Real)}, (s : (Real) -> Bool)))"), fn(x900 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s901 = @tactics.mp_tac(x900)
    fn(x902 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s901(x902)
    }
  })
  let t914 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t903), t905), t911), t912), t913)
  real_open_interval_avoid_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ a : Real, ∀ b : Real, FINITE(s) && a < b → (∃ x : Real, a < x && x < b && !IN(x, s))"), t914))
}

///|
let real_open_interval_avoid_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OPEN_INTERVAL_AVOID_FINITE")

///|
/// `REAL_OPEN_INTERVAL_AVOID_FINITE`
pub fn real_open_interval_avoid_finite() -> @kernel.Thm {
  real_open_interval_avoid_finite_c.get()
}

///|
/// `AVOID_DIM2_TAC`
pub fn avoid_dim2_tac(x915 : @kernel.Term, x916 : @kernel.Term) -> @tactics.Tactic raise {
  let lo = x915
  let hi = x916
  let t924 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w2 : Real)"))(@tactics.strip_assume_tac))
  let t923 = @simp.asm_rewrite_tac(@list.List([]))
  let t922 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("UNION(IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_lowerbound(k'), 2), (D : ((Cart[Real, 3]) -> Bool) -> Bool)), IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_upperbound(k'), 2), D))"), lo, hi]), real_open_interval_avoid_finite()))
  let t921 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_max_lt(), @real.real_lt_min()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@basics.mk_binop(@term_syntax.parse_term("real_lt"), lo, hi), fn(x918 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s919 = @tactics.assume_tac(x918)
    fn(x920 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s919(x920)
    }
  }), t921), t922), t923), t924)
}

///|
/// `AVOID_DIM3_TAC`
pub fn avoid_dim3_tac(x925 : @kernel.Term, x926 : @kernel.Term) -> @tactics.Tactic raise {
  let lo = x925
  let hi = x926
  let t934 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w3 : Real)"))(@tactics.strip_assume_tac))
  let t933 = @simp.asm_rewrite_tac(@list.List([]))
  let t932 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("UNION(IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_lowerbound(k'), 3), (D : ((Cart[Real, 3]) -> Bool) -> Bool)), IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_upperbound(k'), 3), D))"), lo, hi]), real_open_interval_avoid_finite()))
  let t931 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_max_lt(), @real.real_lt_min()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@basics.mk_binop(@term_syntax.parse_term("real_lt"), lo, hi), fn(x928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s929 = @tactics.assume_tac(x928)
    fn(x930 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s929(x930)
    }
  }), t931), t932), t933), t934)
}

///|
/// BOUND_COMMON_TAC
fn step_23() -> Unit raise {
  let t1049 = @simp.asm_rewrite_tac(@list.List([]))
  let t1044 = @term_syntax.parse_term("(j : (Cart[Real, 3]) -> Bool)")
  let t1045 = @list.List([@term_syntax.parse_term("(m : (Cart[Real, 3]) -> Bool)"), t1044])
  let t1048 = @tactics.disch_then(fn(x1047 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1042 = @tactics.mp_tac(x1041)
      fn(x1043 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1042(x1043)
      }
    })(((x1046 : @kernel.Thm) => @bool.specl(t1045, x1046))(x1047))
  })
  let t1038 = @simp.rewrite_rule(@list.List([@integration.division_of()]))
  let t1040 = @tactics.disch_then(fn(x1039 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1037 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1036 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1033 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s1034 = @tactics.mp_tac(x1033)
          fn(x1035 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s1034(x1035)
          }
        })(@bool.conjunct2(x1036))
      })(@bool.conjunct2(x1037))
    })(t1038(x1039))
  })
  let t1032 = @tactics.undisch_tac(@term_syntax.parse_term("division_of((D : ((Cart[Real, 3]) -> Bool) -> Bool), UNIONS(D))"))
  let t1030 = @simp.rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), @vectors.vector_3()]))
  let t1029 = @tactics.exists_tac(@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)((ck : Cart[Real, 3]), 1) + ((sk : Real) + min((sm : Real) - sk, (sj : Real)) / real_of_num(2)), (w2 : Real), (w3 : Real)])"))
  let t1028 = meson_assume_tac(@list.List([]), @term_syntax.parse_term("op_dollar((cm : Cart[Real, 3]), 1) == op_dollar((ck : Cart[Real, 3]), 1)"))
  let t1027 = @simp.asm_rewrite_tac(@list.List([@topology.interior_interval()]))
  let t1031 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_inter()])), t1027), t1028), t1029), t1030), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1026 = @tactics.subgoal_then(@term_syntax.parse_term("!(INTER(interior((m : (Cart[Real, 3]) -> Bool)), interior((j : (Cart[Real, 3]) -> Bool))) == {})"), fn(x1023 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1024 = @tactics.mp_tac(x1023)
    fn(x1025 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1024(x1025)
    }
  })
  let t1021 = @meson.asm_meson_tac(@list.List([]))
  let t1020 = @simp.asm_rewrite_tac(@list.List([]))
  let t1019 = @tactics.try_tac(@tactics.first_assum(fn(x1016 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1017 = @tactics.accept_tac(x1016)
    fn(x1018 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1017(x1018)
    }
  }))
  let t1015 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) && !(x == y) → x < y")))
  let t1014 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1012 = @simp.rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), @vectors.vector_3()]))
  let t1011 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1013 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN(vector([op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1), (w2 : Real), (w3 : Real)]), interval([((cm : Cart[Real, 3]), cm + op_pct((sm : Real), vec(1)))]))"), fn(x1008 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1009 = @tactics.mp_tac(x1008)
    fn(x1010 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1009(x1010)
    }
  }), t1011), t1012), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1022 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("op_dollar((cm : Cart[Real, 3]), 2) <= (w2 : Real) && w2 <= op_dollar(cm, 2) + (sm : Real) && op_dollar(cm, 3) <= (w3 : Real) && w3 <= op_dollar(cm, 3) + sm"), @tactics.strip_assume_tac), t1013), t1014), t1015), @tactics.conj_tac), t1019), t1020), t1021), @tactics.all_tac])
  let t1007 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((cm : Cart[Real, 3]), 2) < (w2 : Real) && w2 < op_dollar(cm, 2) + (sm : Real) && op_dollar(cm, 3) < (w3 : Real) && w3 < op_dollar(cm, 3) + sm"), @tactics.strip_assume_tac)
  let t1005 = @meson.asm_meson_tac(@list.List([@sets.in_image(), @sets.in_union()]))
  let t1006 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), @tactics.disch_tac), t1005), @tactics.all_tac])
  let t1004 = @tactics.subgoal_then(@term_syntax.parse_term("!((w2 : Real) == op_dollar(interval_lowerbound((m : (Cart[Real, 3]) -> Bool)), 2)) && !(w2 == op_dollar(interval_upperbound(m), 2)) && !((w3 : Real) == op_dollar(interval_lowerbound(m), 3)) && !(w3 == op_dollar(interval_upperbound(m), 3))"), @tactics.strip_assume_tac)
  let t1002 = @simp.asm_rewrite_tac(@list.List([]))
  let t1001 = @tactics.exists_tac(@term_syntax.parse_term("(m : (Cart[Real, 3]) -> Bool)"))
  let t1000 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t1003 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t1000), t1001), t1002), @tactics.all_tac])
  let t999 = @tactics.subgoal_then(@term_syntax.parse_term("IN(op_dollar(interval_lowerbound((m : (Cart[Real, 3]) -> Bool)), 2), IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_lowerbound(k'), 2), (D : ((Cart[Real, 3]) -> Bool) -> Bool))) && IN(op_dollar(interval_upperbound(m), 2), IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_upperbound(k'), 2), D)) && IN(op_dollar(interval_lowerbound(m), 3), IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_lowerbound(k'), 3), D)) && IN(op_dollar(interval_upperbound(m), 3), IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_upperbound(k'), 3), D))"), @tactics.strip_assume_tac)
  let t997 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t996 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((cj : Cart[Real, 3]), 1) == op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1)"), fn(x993 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s994 = @tactics.mp_tac(x993)
    fn(x995 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s994(x995)
    }
  })
  let t998 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_then(fn(x990 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s991 = @tactics.subst_all_tac(x990)
    fn(x992 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s991(x992)
    }
  }), t996), t997), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t989 = @tactics.subgoal_then(@term_syntax.parse_term("!((m : (Cart[Real, 3]) -> Bool) == (j : (Cart[Real, 3]) -> Bool))"), fn(x986 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s987 = @tactics.assume_tac(x986)
    fn(x988 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s987(x988)
    }
  })
  let t984 = @simp.asm_simp_tac(@list.List([interval_length_cube_pos()]))
  let t985 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("interval_length((k : (Cart[Real, 3]) -> Bool)) < interval_length((m : (Cart[Real, 3]) -> Bool))")), t984), @tactics.all_tac])
  let t983 = @tactics.subgoal_then(@term_syntax.parse_term("(sk : Real) < (sm : Real)"), fn(x980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s981 = @tactics.assume_tac(x980)
    fn(x982 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s981(x982)
    }
  })
  let t978 = @meson.asm_meson_tac(@list.List([]))
  let t976 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_3()]))
  let t975 = @tactics.exists_tac(@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)((interval_upperbound : ((Cart[Real, 3]) -> Bool) -> Cart[Real, 3])((v : (Cart[Real, 3]) -> Bool)), 1), (w2 : Real), (w3 : Real)])"))
  let t977 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t975), t976), @tactics.all_tac])
  let t979 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((m : (Cart[Real, 3]) -> Bool), (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && !(m == (k : (Cart[Real, 3]) -> Bool)) && op_dollar(interval_lowerbound(m), 1) == op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1) && (∃ zz : Cart[Real, 3], IN(zz, m) && op_dollar(interval_lowerbound(v), 2) < op_dollar(zz, 2) && op_dollar(zz, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(zz, 3) && op_dollar(zz, 3) < op_dollar(interval_upperbound(v), 3))"), fn(x972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s973 = @tactics.mp_tac(x972)
    fn(x974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s973(x974)
    }
  }), t977), t978), @tactics.all_tac])
  let t971 = @tactics.subgoal_then(@term_syntax.parse_term("interval_length((k : (Cart[Real, 3]) -> Bool)) < interval_length((m : (Cart[Real, 3]) -> Bool))"), fn(x968 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s969 = @tactics.assume_tac(x968)
    fn(x970 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s969(x970)
    }
  })
  let t967 = @tactics.subgoal_then(@term_syntax.parse_term("interval_lowerbound((m : (Cart[Real, 3]) -> Bool)) == (cm : Cart[Real, 3]) && interval_upperbound(m) == cm + op_pct((sm : Real), vec(1))"), @tactics.strip_assume_tac)
  let t966 = @list.List([@simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()])), @tactics.all_tac])
  let t965 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((cm : Cart[Real, 3]) + op_pct((sm : Real), vec(1)), 2) == op_dollar(cm, 2) + sm && op_dollar(cm + op_pct(sm, vec(1)), 3) == op_dollar(cm, 3) + sm"), @tactics.strip_assume_tac)
  let t964 = @list.List([@meson.asm_meson_tac(@list.List([cube()])), @tactics.all_tac])
  let t963 = @tactics.subgoal_then(@term_syntax.parse_term("∃ cm : Cart[Real, 3], ∃ sm : Real, real_of_num(0) < sm && (m : (Cart[Real, 3]) -> Bool) == interval([(cm, cm + op_pct(sm, vec(1)))])"), @tactics.strip_assume_tac)
  let t962 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("cube((m : (Cart[Real, 3]) -> Bool))"))
  let t960 = @simp.asm_rewrite_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), @vectors.vector_3()]))
  let t959 = @tactics.undisch_tac(@term_syntax.parse_term("IN(vector([op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1), (w2 : Real), (w3 : Real)]), (k : (Cart[Real, 3]) -> Bool))"))
  let t961 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x956 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s957 = @tactics.subst_all_tac(x956)
    fn(x958 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s957(x958)
    }
  }), t959), t960), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t955 = @tactics.subgoal_then(@term_syntax.parse_term("!((m : (Cart[Real, 3]) -> Bool) == (k : (Cart[Real, 3]) -> Bool))"), fn(x952 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s953 = @tactics.assume_tac(x952)
    fn(x954 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s953(x954)
    }
  })
  let t951 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t950 = @list.List([@simp.asm_rewrite_tac(@list.List([@vectors.vector_3()])), @tactics.all_tac])
  let t946 = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)((interval_upperbound : ((Cart[Real, 3]) -> Bool) -> Cart[Real, 3])((v : (Cart[Real, 3]) -> Bool)), 1), (w2 : Real), (w3 : Real)])")
  let t949 = @tactics.disch_then(fn(x948 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x943 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s944 = @tactics.mp_tac(x943)
      fn(x945 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s944(x945)
      }
    })(((x947 : @kernel.Thm) => @bool.spec(t946, x947))(x948))
  })
  let t941 = @simp.gen_rewrite_rule(fn(x940 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x940
  }, @list.List([valley()]))
  bound_common_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x942 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x939 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x938 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x935 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s936 = @tactics.mp_tac(x935)
          fn(x937 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s936(x937)
          }
        })(@bool.conjunct1(x938))
      })(@bool.conjunct2(x939))
    })(t941(x942))
  }), t949), @tactics.ants_tac), t950), t951), t955), t961), t962), t963), t964), t965), t966), t967), @list.List([cube_bounds_tac, @tactics.all_tac])), t971), t979), t983), t985), t989), t998), t999), t1003), t1004), t1006), t1007), t1022), t1026), t1031), @tactics.disch_tac), t1032), t1040), t1048), t1049))
}

///|
let bound_common_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("BOUND_COMMON_TAC")

///|
/// `BOUND_COMMON_TAC`
pub fn bound_common_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (bound_common_tac_c.get())(x)
}

///|
/// VALLEY_DESCENT_CONTAINMENT
fn step_24() -> Unit raise {
  let t1119 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2) < (w2 : Real) && op_dollar((cj : Cart[Real, 3]), 2) < w2 && w2 < op_dollar(interval_upperbound(v), 2) && w2 < op_dollar(cj, 2) + (sj : Real) && op_dollar(interval_lowerbound(v), 3) < (w3 : Real) && w3 < op_dollar(cj, 3) + sj && w3 < op_dollar(interval_upperbound(v), 3)"), @tactics.strip_assume_tac)
  let t1117 = @term_syntax.parse_term("min(op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 3), op_dollar((cj : Cart[Real, 3]), 3) + (sj : Real))")
  let t1118 = avoid_dim3_tac(@term_syntax.parse_term("op_dollar((ck : Cart[Real, 3]), 3) + (sk : Real)"), t1117)
  let t1115 = @term_syntax.parse_term("min(op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 2), op_dollar((cj : Cart[Real, 3]), 2) + (sj : Real))")
  let t1116 = avoid_dim2_tac(@term_syntax.parse_term("max(op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2), op_dollar((cj : Cart[Real, 3]), 2))"), t1115)
  let t1120 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt())])), @tactics.disch_tac), t1116), t1118), t1119), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), bound_common_tac)
  let t1114 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2) < (w2 : Real) && op_dollar((cj : Cart[Real, 3]), 2) < w2 && w2 < op_dollar(interval_upperbound(v), 2) && w2 < op_dollar(cj, 2) + (sj : Real) && op_dollar(interval_lowerbound(v), 3) < (w3 : Real) && op_dollar(cj, 3) < w3 && w3 < op_dollar(interval_upperbound(v), 3)"), @tactics.strip_assume_tac)
  let t1112 = @term_syntax.parse_term("op_dollar((ck : Cart[Real, 3]), 3)")
  let t1113 = avoid_dim3_tac(@term_syntax.parse_term("max(op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 3), op_dollar((cj : Cart[Real, 3]), 3))"), t1112)
  let t1110 = @term_syntax.parse_term("min(op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 2), op_dollar((cj : Cart[Real, 3]), 2) + (sj : Real))")
  let t1111 = avoid_dim2_tac(@term_syntax.parse_term("max(op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2), op_dollar((cj : Cart[Real, 3]), 2))"), t1110)
  let t1121 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt())])), @tactics.disch_tac), t1111), t1113), t1114), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), bound_common_tac)
  let t1109 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2) < (w2 : Real) && w2 < op_dollar((cj : Cart[Real, 3]), 2) + (sj : Real) && w2 < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < (w3 : Real) && op_dollar(cj, 3) < w3 && w3 < op_dollar(interval_upperbound(v), 3) && w3 < op_dollar(cj, 3) + sj"), @tactics.strip_assume_tac)
  let t1107 = @term_syntax.parse_term("min(op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 2), op_dollar((cj : Cart[Real, 3]), 2) + (sj : Real))")
  let t1108 = avoid_dim2_tac(@term_syntax.parse_term("op_dollar((ck : Cart[Real, 3]), 2) + (sk : Real)"), t1107)
  let t1105 = @term_syntax.parse_term("min(op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 3), op_dollar((cj : Cart[Real, 3]), 3) + (sj : Real))")
  let t1106 = avoid_dim3_tac(@term_syntax.parse_term("max(op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 3), op_dollar((cj : Cart[Real, 3]), 3))"), t1105)
  let t1122 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt())])), @tactics.disch_tac), t1106), t1108), t1109), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), bound_common_tac)
  let t1104 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2) < (w2 : Real) && op_dollar((cj : Cart[Real, 3]), 2) < w2 && op_dollar(interval_lowerbound(v), 3) < (w3 : Real) && op_dollar(cj, 3) < w3 && w3 < op_dollar(interval_upperbound(v), 3) && w3 < op_dollar(cj, 3) + (sj : Real) && w2 < op_dollar(interval_upperbound(v), 2)"), @tactics.strip_assume_tac)
  let t1102 = @term_syntax.parse_term("op_dollar((ck : Cart[Real, 3]), 2)")
  let t1103 = avoid_dim2_tac(@term_syntax.parse_term("max(op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2), op_dollar((cj : Cart[Real, 3]), 2))"), t1102)
  let t1100 = @term_syntax.parse_term("min(op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 3), op_dollar((cj : Cart[Real, 3]), 3) + (sj : Real))")
  let t1101 = avoid_dim3_tac(@term_syntax.parse_term("max(op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 3), op_dollar((cj : Cart[Real, 3]), 3))"), t1100)
  let t1123 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt())])), @tactics.disch_tac), t1101), t1103), t1104), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), bound_common_tac), t1122, t1121, t1120])
  let t1099 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1098 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection()])), @tactics.all_tac])
  let t1097 = @tactics.subgoal_then(@term_syntax.parse_term("pairwise((k : (Cart[Real, 3]) -> Bool) => (k' : (Cart[Real, 3]) -> Bool) => !(interval_length(k) == interval_length(k')), (D : ((Cart[Real, 3]) -> Bool) -> Bool))"), fn(x1094 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1095 = @tactics.assume_tac(x1094)
    fn(x1096 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1095(x1096)
    }
  })
  let t1092 = @simp.asm_rewrite_tac(@list.List([]))
  let t1091 = @tactics.match_mp_tac(@sets.finite_image())
  let t1093 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @simp.rewrite_tac(@list.List([@sets.finite_union()]))), @tactics.conj_tac), t1091), t1092), @tactics.all_tac])
  let t1090 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE(UNION(IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_lowerbound(k'), 2), (D : ((Cart[Real, 3]) -> Bool) -> Bool)), IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_upperbound(k'), 2), D))) && FINITE(UNION(IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_lowerbound(k'), 3), D), IMAGE((k' : (Cart[Real, 3]) -> Bool) => op_dollar(interval_upperbound(k'), 3), D)))"), @tactics.strip_assume_tac)
  let t1088 = @simp.rewrite_tac(@list.List([@cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t1086 = @simp.gen_rewrite_rule(fn(x1085 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1085
  }, @list.List([@vectors.in_interval()]))
  let t1089 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1087 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1082 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1083 = @tactics.mp_tac(x1082)
      fn(x1084 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1083(x1084)
      }
    })(t1086(x1087))
  }), t1088), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1081 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((cj : Cart[Real, 3]), 2) <= op_dollar((z' : Cart[Real, 3]), 2) && op_dollar(z', 2) <= op_dollar(cj, 2) + (sj : Real) && op_dollar(cj, 3) <= op_dollar(z', 3) && op_dollar(z', 3) <= op_dollar(cj, 3) + sj"), @tactics.strip_assume_tac)
  let t1080 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1079 = @tactics.subgoal_then(@term_syntax.parse_term("IN((z' : Cart[Real, 3]), interval([((cj : Cart[Real, 3]), cj + op_pct((sj : Real), vec(1)))]))"), fn(x1076 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1077 = @tactics.assume_tac(x1076)
    fn(x1078 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1077(x1078)
    }
  })
  let t1075 = @list.List([@tactics.then_tac(@tactics.conj_tac, @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1074 = @tactics.subgoal_then(@term_syntax.parse_term("(op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2) < op_dollar((ck : Cart[Real, 3]), 2) && op_dollar(ck, 2) + (sk : Real) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(ck, 3) && op_dollar(ck, 3) + sk < op_dollar(interval_upperbound(v), 3)) && op_dollar(ck, 2) < op_dollar((z' : Cart[Real, 3]), 2) && op_dollar(z', 2) < op_dollar(ck, 2) + sk && op_dollar(ck, 3) < op_dollar(z', 3) && op_dollar(z', 3) < op_dollar(ck, 3) + sk"), @tactics.strip_assume_tac)
  let t1073 = @list.List([@simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()])), @tactics.all_tac])
  let t1072 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 2) == op_dollar((ck : Cart[Real, 3]), 2) && op_dollar(interval_lowerbound(k), 3) == op_dollar(ck, 3) && op_dollar(interval_upperbound(k), 2) == op_dollar(ck, 2) + (sk : Real) && op_dollar(interval_upperbound(k), 3) == op_dollar(ck, 3) + sk"), @tactics.strip_assume_tac)
  let t1071 = meson_assume_tac(@list.List([]), @term_syntax.parse_term("op_dollar((ck : Cart[Real, 3]), 1) == op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1)"))
  let t1070 = meson_assume_tac(@list.List([]), @term_syntax.parse_term("op_dollar((cj : Cart[Real, 3]), 1) == op_dollar((ck : Cart[Real, 3]), 1) + (sk : Real)"))
  let t1069 = @list.List([@simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()])), @tactics.all_tac])
  let t1068 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((ck : Cart[Real, 3]) + op_pct((sk : Real), vec(1)), 1) == op_dollar(ck, 1) + sk && op_dollar(ck + op_pct(sk, vec(1)), 2) == op_dollar(ck, 2) + sk && op_dollar(ck + op_pct(sk, vec(1)), 3) == op_dollar(ck, 3) + sk && op_dollar((cj : Cart[Real, 3]) + op_pct((sj : Real), vec(1)), 1) == op_dollar(cj, 1) + sj && op_dollar(cj + op_pct(sj, vec(1)), 2) == op_dollar(cj, 2) + sj && op_dollar(cj + op_pct(sj, vec(1)), 3) == op_dollar(cj, 3) + sj"), @tactics.strip_assume_tac)
  let t1067 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t1066 = @list.List([@tactics.then_tac(@tactics.conj_tac, cube_bounds_tac), @tactics.all_tac])
  let t1065 = @tactics.subgoal_then(@term_syntax.parse_term("(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)) == (ck : Cart[Real, 3]) && interval_upperbound(k) == ck + op_pct((sk : Real), vec(1))) && interval_lowerbound((j : (Cart[Real, 3]) -> Bool)) == (cj : Cart[Real, 3]) && interval_upperbound(j) == cj + op_pct((sj : Real), vec(1))"), @tactics.strip_assume_tac)
  let t1064 = @list.List([@meson.asm_meson_tac(@list.List([cube()])), @tactics.all_tac])
  let t1063 = @tactics.subgoal_then(@term_syntax.parse_term("∃ cj : Cart[Real, 3], ∃ sj : Real, real_of_num(0) < sj && (j : (Cart[Real, 3]) -> Bool) == interval([(cj, cj + op_pct(sj, vec(1)))])"), @tactics.strip_assume_tac)
  let t1062 = @list.List([@meson.asm_meson_tac(@list.List([cube()])), @tactics.all_tac])
  let t1061 = @tactics.subgoal_then(@term_syntax.parse_term("∃ ck : Cart[Real, 3], ∃ sk : Real, real_of_num(0) < sk && (k : (Cart[Real, 3]) -> Bool) == interval([(ck, ck + op_pct(sk, vec(1)))])"), @tactics.strip_assume_tac)
  let t1060 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("cube((j : (Cart[Real, 3]) -> Bool))"))
  let t1059 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("cube((k : (Cart[Real, 3]) -> Bool))"))
  let t1058 = meson_assume_tac(@list.List([@integration.division_of()]), @term_syntax.parse_term("FINITE((D : ((Cart[Real, 3]) -> Bool) -> Bool))"))
  let t1057 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("division_of((D : ((Cart[Real, 3]) -> Bool) -> Bool), UNIONS(D))"))
  let t1055 = @meson.asm_meson_tac(@list.List([]))
  let t1056 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1055), @tactics.all_tac])
  let t1050 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t1051 = @term_syntax.parse_term("(v : (Cart[Real, 3]) -> Bool)")
  let t1052 = @term_syntax.parse_term("(d : Real)")
  let t1053 = @term_syntax.parse_term("(a : Cart[Real, 3])")
  let t1054 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"), t1053, t1052, t1051, t1050]), valley_face_interior()))
  let t1124 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1054), @tactics.ants_tac), t1056), @tactics.strip_tac), t1057), t1058), t1059), t1060), t1061), t1062), t1063), t1064), t1065), t1066), t1067), t1068), t1069), t1070), t1071), t1072), t1073), t1074), t1075), t1079), t1080), t1081), t1089), t1090), t1093), t1097), t1098), t1099), t1123)
  valley_descent_containment_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, ∀ a : Cart[Real, 3], ∀ d : Real, ∀ v : (Cart[Real, 3]) -> Bool, ∀ k : (Cart[Real, 3]) -> Bool, ∀ j : (Cart[Real, 3]) -> Bool, real_of_num(0) < d && cube_dissection(D) && UNIONS(D) == interval([(a, a + op_pct(d, vec(1)))]) && valley(D, v) && IN(k, D) && op_dollar(interval_lowerbound(k), 1) == op_dollar(interval_upperbound(v), 1) && (∃ z : Cart[Real, 3], IN(z, k) && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3)) && (∀ j' : (Cart[Real, 3]) -> Bool, IN(j', D) && !(j' == k) && op_dollar(interval_lowerbound(j'), 1) == op_dollar(interval_upperbound(v), 1) && (∃ z : Cart[Real, 3], IN(z, j') && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3)) → interval_length(k) < interval_length(j')) && IN(j, D) && op_dollar(interval_lowerbound(j), 1) == op_dollar(interval_upperbound(k), 1) && (∃ z : Cart[Real, 3], IN(z, j) && op_dollar(interval_lowerbound(k), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(k), 2) && op_dollar(interval_lowerbound(k), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(k), 3)) → op_dollar(interval_lowerbound(k), 2) <= op_dollar(interval_lowerbound(j), 2) && op_dollar(interval_upperbound(j), 2) <= op_dollar(interval_upperbound(k), 2) && op_dollar(interval_lowerbound(k), 3) <= op_dollar(interval_lowerbound(j), 3) && op_dollar(interval_upperbound(j), 3) <= op_dollar(interval_upperbound(k), 3)"), t1124))
}

///|
let valley_descent_containment_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALLEY_DESCENT_CONTAINMENT")

///|
/// `VALLEY_DESCENT_CONTAINMENT`
pub fn valley_descent_containment() -> @kernel.Thm {
  valley_descent_containment_c.get()
}

///|
/// VALLEY_FACE_EXISTS_ANOTHER
fn step_25() -> Unit raise {
  let t1164 = @simp.asm_rewrite_tac(@list.List([]))
  let t1165 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(zw : Cart[Real, 3])")), t1164)
  let t1166 = @list.List([@meson.asm_meson_tac(@list.List([])), t1165])
  let t1163 = @simp.asm_rewrite_tac(@list.List([]))
  let t1162 = @tactics.exists_tac(@term_syntax.parse_term("(j0 : (Cart[Real, 3]) -> Bool)"))
  let t1161 = @list.List([@meson.asm_meson_tac(@list.List([valley()])), @tactics.all_tac])
  let t1160 = @tactics.subgoal_then(@term_syntax.parse_term("∃ j0 : (Cart[Real, 3]) -> Bool, IN(j0, (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && IN((zw : Cart[Real, 3]), j0) && op_dollar(interval_lowerbound(j0), 1) == op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1)"), @tactics.strip_assume_tac)
  let t1158 = @simp.simp_tac(@list.List([@vectors.vec_component(), @cart.dimindex_3(), @calc_num.arith(), @realarith.real_mul_rid()]))
  let t1157 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t1152 = @term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2) < op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 2)")
  let t1153 = @term_syntax.parse_term("op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 2) < op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 2)")
  let t1154 = @term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 3) < op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 3)")
  let t1155 = @term_syntax.parse_term("op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 3) < op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 3)")
  let t1156 = @tactics.map_every(fn(x1149 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1150 = @tactics.undisch_tac(x1149)
    fn(x1151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1150(x1151)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0) < (sk : Real)"), t1155, t1154, t1153, t1152]))
  let t1148 = @simp.rewrite_tac(@list.List([@vectors.vector_3()]))
  let t1159 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("zw"), t1148), t1156), t1157), t1158), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1147 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((zw : Cart[Real, 3]), 1) == op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1) && op_dollar(interval_lowerbound(v), 2) < op_dollar(zw, 2) && op_dollar(zw, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(zw, 3) && op_dollar(zw, 3) < op_dollar(interval_upperbound(v), 3)"), @tactics.strip_assume_tac)
  let t1145 = @simp.asm_rewrite_tac(@list.List([]))
  let t1144 = @tactics.undisch_tac(@term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2) < op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 2)"))
  let t1143 = @simp.rewrite_tac(@list.List([@vectors.vector_3()]))
  let t1142 = @simp.expand_tac("zw")
  let t1141 = @simp.simp_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t1146 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1141), t1142), t1143), t1144), t1145), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1140 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((zw : Cart[Real, 3]), (k : (Cart[Real, 3]) -> Bool))"), fn(x1137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1138 = @tactics.assume_tac(x1137)
    fn(x1139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1138(x1139)
    }
  })
  let t1136 = @simp.abbrev_tac(@term_syntax.parse_term("(zw : Cart[Real, 3]) == vector([op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1), (op_dollar(interval_lowerbound(v), 2) + op_dollar((ck : Cart[Real, 3]), 2)) / real_of_num(2), (op_dollar(interval_lowerbound(v), 3) + op_dollar(ck, 3)) / real_of_num(2)])"))
  let t1135 = @tactics.subgoal_then(@term_syntax.parse_term("interval_lowerbound((k : (Cart[Real, 3]) -> Bool)) == (ck : Cart[Real, 3]) && interval_upperbound(k) == ck + op_pct((sk : Real), vec(1))"), @tactics.strip_assume_tac)
  let t1134 = @list.List([@meson.asm_meson_tac(@list.List([cube_dissection(), cube()])), @tactics.all_tac])
  let t1133 = @tactics.subgoal_then(@term_syntax.parse_term("∃ ck : Cart[Real, 3], ∃ sk : Real, real_of_num(0) < sk && (k : (Cart[Real, 3]) -> Bool) == interval([(ck, ck + op_pct(sk, vec(1)))])"), @tactics.strip_assume_tac)
  let t1131 = @meson.asm_meson_tac(@list.List([]))
  let t1130 = @simp.asm_rewrite_tac(@list.List([]))
  let t1126 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t1127 = @term_syntax.parse_term("(v : (Cart[Real, 3]) -> Bool)")
  let t1128 = @term_syntax.parse_term("(d : Real)")
  let t1129 = @term_syntax.parse_term("(a : Cart[Real, 3])")
  let t1132 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"), t1129, t1128, t1127, t1126]), valley_face_interior())), t1130), t1131), @tactics.all_tac])
  let t1125 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_lowerbound((v : (Cart[Real, 3]) -> Bool)), 2) < op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 2) && op_dollar(interval_upperbound(k), 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(interval_lowerbound(k), 3) && op_dollar(interval_upperbound(k), 3) < op_dollar(interval_upperbound(v), 3)"), @tactics.strip_assume_tac)
  let t1167 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1125), t1132), t1133), t1134), t1135), @list.List([cube_bounds_tac, @tactics.all_tac])), t1136), t1140), t1146), t1147), t1159), t1160), t1161), t1162), t1163), @tactics.conj_tac), t1166)
  valley_face_exists_another_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, ∀ a : Cart[Real, 3], ∀ d : Real, ∀ v : (Cart[Real, 3]) -> Bool, ∀ k : (Cart[Real, 3]) -> Bool, real_of_num(0) < d && cube_dissection(D) && UNIONS(D) == interval([(a, a + op_pct(d, vec(1)))]) && valley(D, v) && IN(k, D) && op_dollar(interval_lowerbound(k), 1) == op_dollar(interval_upperbound(v), 1) && (∃ z : Cart[Real, 3], IN(z, k) && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3)) && (∀ j' : (Cart[Real, 3]) -> Bool, IN(j', D) && !(j' == k) && op_dollar(interval_lowerbound(j'), 1) == op_dollar(interval_upperbound(v), 1) && (∃ z : Cart[Real, 3], IN(z, j') && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3)) → interval_length(k) < interval_length(j')) → (∃ j0 : (Cart[Real, 3]) -> Bool, IN(j0, D) && !(j0 == k) && op_dollar(interval_lowerbound(j0), 1) == op_dollar(interval_upperbound(v), 1) && (∃ z' : Cart[Real, 3], IN(z', j0) && op_dollar(interval_lowerbound(v), 2) < op_dollar(z', 2) && op_dollar(z', 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z', 3) && op_dollar(z', 3) < op_dollar(interval_upperbound(v), 3)))"), t1167))
}

///|
let valley_face_exists_another_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALLEY_FACE_EXISTS_ANOTHER")

///|
/// `VALLEY_FACE_EXISTS_ANOTHER`
pub fn valley_face_exists_another() -> @kernel.Thm {
  valley_face_exists_another_c.get()
}

///|
/// VALLEY_DESCENT
fn step_26() -> Unit raise {
  let t1396 = @meson.asm_meson_tac(@list.List([@sets.pairwise()]))
  let t1395 = @simp.asm_rewrite_tac(@list.List([]))
  let t1393 = @term_syntax.parse_term("2")
  let t1394 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(j : (Cart[Real, 3]) -> Bool)"), t1393]), interval_length_cube_component()))
  let t1392 = @term_syntax.parse_term("2")
  let t1397 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)"), t1392]), interval_length_cube_component())), t1394), t1395), @calc_rat.asm_real_arith_tac), t1396])
  let t1391 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) && !(x == y) → x < y")))
  let t1390 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("cube((j : (Cart[Real, 3]) -> Bool))"))
  let t1388 = @meson.asm_meson_tac(@list.List([]))
  let t1387 = @simp.asm_rewrite_tac(@list.List([]))
  let t1382 = @term_syntax.parse_term("(j : (Cart[Real, 3]) -> Bool)")
  let t1383 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t1384 = @term_syntax.parse_term("(v : (Cart[Real, 3]) -> Bool)")
  let t1385 = @term_syntax.parse_term("(d : Real)")
  let t1386 = @term_syntax.parse_term("(a : Cart[Real, 3])")
  let t1389 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"), t1386, t1385, t1384, t1383, t1382]), valley_descent_containment())), t1387), t1388), @tactics.all_tac])
  let t1381 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 2) <= op_dollar(interval_lowerbound((j : (Cart[Real, 3]) -> Bool)), 2) && op_dollar(interval_upperbound(j), 2) <= op_dollar(interval_upperbound(k), 2) && op_dollar(interval_lowerbound(k), 3) <= op_dollar(interval_lowerbound(j), 3) && op_dollar(interval_upperbound(j), 3) <= op_dollar(interval_upperbound(k), 3)"), @tactics.strip_assume_tac)
  let t1378 = @simp.asm_rewrite_tac(@list.List([interval_length_cube()]))
  let t1377 = @simp.rewrite_tac(@list.List([cube()]))
  let t1379 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("cube((k : (Cart[Real, 3]) -> Bool))")), t1377), @tactics.strip_tac), t1378), @calc_rat.asm_real_arith_tac), @calc_rat.asm_real_arith_tac])
  let t1376 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < interval_length((k : (Cart[Real, 3]) -> Bool))"), fn(x1373 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1374 = @tactics.mp_tac(x1373)
    fn(x1375 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1374(x1375)
    }
  })
  let t1372 = @simp.asm_rewrite_tac(@list.List([]))
  let t1370 = @term_syntax.parse_term("1")
  let t1371 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)"), t1370]), interval_length_cube_component()))
  let t1380 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1368 = @tactics.subst_all_tac(x1367)
    fn(x1369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1368(x1369)
    }
  }), t1371), t1372), t1376), t1379), @tactics.all_tac])
  let t1366 = @tactics.subgoal_then(@term_syntax.parse_term("!((j : (Cart[Real, 3]) -> Bool) == (k : (Cart[Real, 3]) -> Bool))"), fn(x1363 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1364 = @tactics.assume_tac(x1363)
    fn(x1365 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1364(x1365)
    }
  })
  let t1398 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(j : (Cart[Real, 3]) -> Bool)")), @tactics.strip_tac), t1366), t1380), t1381), t1389), t1390), t1391), @tactics.conj_tac), t1397)
  let t1362 = @meson.asm_meson_tac(@list.List([]))
  let t1361 = @simp.asm_rewrite_tac(@list.List([]))
  let t1355 = @term_syntax.parse_term("(j : (Cart[Real, 3]) -> Bool)")
  let t1356 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t1357 = @term_syntax.parse_term("(v : (Cart[Real, 3]) -> Bool)")
  let t1358 = @term_syntax.parse_term("(d : Real)")
  let t1359 = @term_syntax.parse_term("(a : Cart[Real, 3])")
  let t1360 = @tactics.match_mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"), t1359, t1358, t1357, t1356, t1355]), valley_descent_containment()))
  let t1399 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(j : (Cart[Real, 3]) -> Bool)")), @tactics.strip_tac), t1360), t1361), t1362)
  let t1351 = @meson.asm_meson_tac(@list.List([cube_imp_nonempty_interior(), cube_dissection()]))
  let t1350 = @simp.asm_rewrite_tac(@list.List([]))
  let t1347 = @term_syntax.parse_term("(zc : Cart[Real, 3])")
  let t1348 = @term_syntax.parse_term("(jc : (Cart[Real, 3]) -> Bool)")
  let t1349 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t1352 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"), t1349, t1348, t1347]), division_face_lowerbound())), t1350), t1351)
  let t1353 = @meson.asm_meson_tac(@list.List([]))
  let t1354 = @list.List([@meson.asm_meson_tac(@list.List([])), t1353, t1352])
  let t1346 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1345 = @tactics.exists_tac(@term_syntax.parse_term("(jc : (Cart[Real, 3]) -> Bool)"))
  let t1344 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(jc : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1342 = @meson.asm_meson_tac(@list.List([]))
  let t1341 = @simp.asm_simp_tac(@list.List([@sets.subset_refl(), @integration.interval_upperbound_nonempty(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t1343 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 1) < op_dollar((a : Cart[Real, 3]) + op_pct((d : Real), vec(1)), 1)")), t1341), t1342), @tactics.all_tac])
  let t1339 = @int.arith_rule(@term_syntax.parse_term("1 <= 3"))
  let t1340 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= 1")), @cart.dimindex_3(), t1339]))
  let t1332 = @term_syntax.parse_term("1")
  let t1333 = @term_syntax.parse_term("(zc : Cart[Real, 3])")
  let t1334 = @term_syntax.parse_term("(ck : Cart[Real, 3]) + op_pct((sk : Real), vec(1))")
  let t1335 = @term_syntax.parse_term("(ck : Cart[Real, 3])")
  let t1336 = @term_syntax.parse_term("(a : Cart[Real, 3]) + op_pct((d : Real), vec(1))")
  let t1337 = @term_syntax.parse_term("(a : Cart[Real, 3])")
  let t1338 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"), t1337, t1336, t1335, t1334, t1333, t1332]), point_in_multiple_division_of_gen()))
  let t1330 = @simp.asm_simp_tac(@list.List([@vectors.subset_interval(), @integration.interval_upperbound_nonempty(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t1329 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (sk : Real)"))
  let t1328 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((k : (Cart[Real, 3]) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"))
  let t1331 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("op_dollar((zc : Cart[Real, 3]), 1) == op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 1)")), t1328), t1329), t1330), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1327 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((a : Cart[Real, 3]), 1) < op_dollar((zc : Cart[Real, 3]), 1)"), fn(x1324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1325 = @tactics.assume_tac(x1324)
    fn(x1326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1325(x1326)
    }
  })
  let t1322 = @simp.asm_simp_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid(), @integration.interval_lowerbound_nonempty(), @integration.interval_upperbound_nonempty()]))
  let t1317 = @term_syntax.parse_term("real_of_num(0) < (sk : Real)")
  let t1318 = @term_syntax.parse_term("op_dollar((zc : Cart[Real, 3]), 3) < op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 3)")
  let t1319 = @term_syntax.parse_term("op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 3) < op_dollar((zc : Cart[Real, 3]), 3)")
  let t1320 = @term_syntax.parse_term("op_dollar((zc : Cart[Real, 3]), 2) < op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 2)")
  let t1321 = @term_syntax.parse_term("op_dollar(interval_lowerbound((k : (Cart[Real, 3]) -> Bool)), 2) < op_dollar((zc : Cart[Real, 3]), 2)")
  let t1323 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x1314 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1315 = @tactics.undisch_tac(x1314)
    fn(x1316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1315(x1316)
    }
  }, @list.List([@term_syntax.parse_term("op_dollar((zc : Cart[Real, 3]), 1) == op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 1)"), t1321, t1320, t1319, t1318, t1317])), t1322), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1313 = @tactics.subgoal_then(@term_syntax.parse_term("IN((zc : Cart[Real, 3]), (k : (Cart[Real, 3]) -> Bool))"), fn(x1310 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1311 = @tactics.assume_tac(x1310)
    fn(x1312 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1311(x1312)
    }
  })
  let t1307 = @simp.simp_tac(@list.List([@vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()]))
  let t1306 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1305 = @tactics.subgoal_then(@term_syntax.parse_term("IN(interval_upperbound((j0 : (Cart[Real, 3]) -> Bool)), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"), fn(x1302 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1303 = @tactics.mp_tac(x1302)
    fn(x1304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1303(x1304)
    }
  })
  let t1301 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@integration.interval_upperbound_nonempty(), @vectors.in_interval(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component(), @realarith.real_mul_rid()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1300 = @tactics.subgoal_then(@term_syntax.parse_term("IN(interval_upperbound((j0 : (Cart[Real, 3]) -> Bool)), j0)"), fn(x1297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1298 = @tactics.assume_tac(x1297)
    fn(x1299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1298(x1299)
    }
  })
  let t1296 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1295 = @tactics.subgoal_then(@term_syntax.parse_term("!(interval([((cj : Cart[Real, 3]), cj + op_pct((sj : Real), vec(1)))]) == {})"), fn(x1292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1293 = @tactics.assume_tac(x1292)
    fn(x1294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1293(x1294)
    }
  })
  let t1291 = @list.List([@meson.asm_meson_tac(@list.List([cube()])), @tactics.all_tac])
  let t1308 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ cj : Cart[Real, 3], ∃ sj : Real, real_of_num(0) < sj && (j0 : (Cart[Real, 3]) -> Bool) == interval([(cj, cj + op_pct(sj, vec(1)))])"), @tactics.strip_assume_tac), t1291), t1295), t1296), t1300), t1301), t1305), t1306), t1307), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1290 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_upperbound((j0 : (Cart[Real, 3]) -> Bool)), 1) <= op_dollar((a : Cart[Real, 3]) + op_pct((d : Real), vec(1)), 1)"), fn(x1287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1288 = @tactics.assume_tac(x1287)
    fn(x1289 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1288(x1289)
    }
  })
  let t1286 = meson_assume_tac(@list.List([cube_imp_nonempty()]), @term_syntax.parse_term("!((j0 : (Cart[Real, 3]) -> Bool) == {})"))
  let t1285 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1284 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((j0 : (Cart[Real, 3]) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"), fn(x1281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1282 = @tactics.assume_tac(x1281)
    fn(x1283 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1282(x1283)
    }
  })
  let t1279 = @simp.asm_rewrite_tac(@list.List([]))
  let t1278 = @term_syntax.parse_term("1")
  let t1280 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(j0 : (Cart[Real, 3]) -> Bool)"), t1278]), interval_length_cube_component())), t1279), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1277 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_upperbound((j0 : (Cart[Real, 3]) -> Bool)), 1) == op_dollar(interval_lowerbound(j0), 1) + interval_length(j0)"), fn(x1274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1275 = @tactics.assume_tac(x1274)
    fn(x1276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1275(x1276)
    }
  })
  let t1273 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("cube((j0 : (Cart[Real, 3]) -> Bool))"))
  let t1272 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1271 = @tactics.subgoal_then(@term_syntax.parse_term("interval_length((k : (Cart[Real, 3]) -> Bool)) < interval_length((j0 : (Cart[Real, 3]) -> Bool))"), fn(x1268 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1269 = @tactics.assume_tac(x1268)
    fn(x1270 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1269(x1270)
    }
  })
  let t1267 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(j0 : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1265 = @meson.asm_meson_tac(@list.List([]))
  let t1266 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1265), @tactics.all_tac])
  let t1260 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t1261 = @term_syntax.parse_term("(v : (Cart[Real, 3]) -> Bool)")
  let t1262 = @term_syntax.parse_term("(d : Real)")
  let t1263 = @term_syntax.parse_term("(a : Cart[Real, 3])")
  let t1264 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"), t1263, t1262, t1261, t1260]), valley_face_exists_another()))
  let t1258 = @simp.asm_rewrite_tac(@list.List([]))
  let t1257 = @term_syntax.parse_term("1")
  let t1259 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)"), t1257]), interval_length_cube_component())), t1258), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1309 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 1) == op_dollar(interval_lowerbound(k), 1) + interval_length(k)"), fn(x1254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1255 = @tactics.assume_tac(x1254)
    fn(x1256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1255(x1256)
    }
  }), t1259), t1264), @tactics.ants_tac), t1266), t1267), t1271), t1272), t1273), t1277), t1280), t1284), t1285), t1286), t1290), t1308), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1253 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_upperbound((k : (Cart[Real, 3]) -> Bool)), 1) < op_dollar((a : Cart[Real, 3]) + op_pct((d : Real), vec(1)), 1)"), fn(x1250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1251 = @tactics.assume_tac(x1250)
    fn(x1252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1251(x1252)
    }
  })
  let t1249 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1248 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((k : (Cart[Real, 3]) -> Bool), interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))]))"), fn(x1245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1246 = @tactics.assume_tac(x1245)
    fn(x1247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1246(x1247)
    }
  })
  let t1244 = meson_assume_tac(@list.List([]), @term_syntax.parse_term("!(interval([((ck : Cart[Real, 3]), ck + op_pct((sk : Real), vec(1)))]) == {})"))
  let t1243 = meson_assume_tac(@list.List([cube_imp_nonempty()]), @term_syntax.parse_term("!((k : (Cart[Real, 3]) -> Bool) == {})"))
  let t1242 = @list.List([@meson.asm_meson_tac(@list.List([cube()])), @tactics.all_tac])
  let t1241 = @tactics.subgoal_then(@term_syntax.parse_term("∃ ck : Cart[Real, 3], ∃ sk : Real, real_of_num(0) < sk && (k : (Cart[Real, 3]) -> Bool) == interval([(ck, ck + op_pct(sk, vec(1)))])"), @tactics.strip_assume_tac)
  let t1400 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(zc : Cart[Real, 3])")), @tactics.strip_tac), t1241), t1242), t1243), t1244), t1248), t1249), t1253), t1309), t1313), t1323), t1327), t1331), t1338), t1340), @tactics.ants_tac), t1343), t1344), t1345), t1346), t1354), t1399, t1398])
  let t1240 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1239 = @simp.asm_rewrite_tac(@list.List([]))
  let t1238 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("cube((k : (Cart[Real, 3]) -> Bool))"))
  let t1237 = @simp.rewrite_tac(@list.List([valley()]))
  let t1236 = @simp.asm_rewrite_tac(@list.List([]))
  let t1235 = @tactics.exists_tac(@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)"))
  let t1234 = @list.List([@meson.asm_meson_tac(@list.List([valley()])), @tactics.all_tac])
  let t1233 = @tactics.subgoal_then(@term_syntax.parse_term("interval_length((k : (Cart[Real, 3]) -> Bool)) < interval_length((v : (Cart[Real, 3]) -> Bool))"), fn(x1230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1231 = @tactics.assume_tac(x1230)
    fn(x1232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1231(x1232)
    }
  })
  let t1229 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1228 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1223 = @sets.set_tac(@list.List([]))
  let t1222 = @simp.asm_rewrite_tac(@list.List([]))
  let t1221 = @tactics.exists_tac(@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"))
  let t1224 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.pairwise_mono()), t1221), t1222), t1223)
  let t1220 = @simp.asm_rewrite_tac(@list.List([]))
  let t1219 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 3])"))
  let t1218 = @simp.asm_rewrite_tac(@list.List([]))
  let t1217 = @tactics.exists_tac(@term_syntax.parse_term("(k0 : (Cart[Real, 3]) -> Bool)"))
  let t1225 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_elim_thm()])), t1217), t1218), t1219), t1220)
  let t1216 = @simp.asm_rewrite_tac(@list.List([]))
  let t1226 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_restrict()), t1216), t1225, t1224])
  let t1227 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1226), @tactics.all_tac])
  let t1214 = @term_syntax.parse_term("{(k : (Cart[Real, 3]) -> Bool) | IN(k, (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && op_dollar(interval_lowerbound(k), 1) == op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1) && (∃ z : Cart[Real, 3], IN(z, k) && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3))}")
  let t1215 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(interval_length : ((Cart[Real, 3]) -> Bool) -> Real)"), t1214]), finite_pairwise_minimum()))
  let t1213 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("pairwise((k : (Cart[Real, 3]) -> Bool) => (k' : (Cart[Real, 3]) -> Bool) => !(interval_length(k) == interval_length(k')), (D : ((Cart[Real, 3]) -> Bool) -> Bool))"))
  let t1211 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_3()]))
  let t1210 = @tactics.exists_tac(@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)((av : Cart[Real, 3]), 1) + (dv : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(av, 2) + dv / real_of_num(2), (op_dollar : (Cart[Real, 3], Num) -> Real)(av, 3) + dv / real_of_num(2)])"))
  let t1209 = @simp.asm_rewrite_tac(@list.List([]))
  let t1208 = @tactics.exists_tac(@term_syntax.parse_term("(k1 : (Cart[Real, 3]) -> Bool)"))
  let t1207 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k1 : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1206 = @simp.rewrite_tac(@list.List([@vectors.vector_3()]))
  let t1202 = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)((av : Cart[Real, 3]), 1) + (dv : Real), (op_dollar : (Cart[Real, 3], Num) -> Real)(av, 2) + dv / real_of_num(2), (op_dollar : (Cart[Real, 3], Num) -> Real)(av, 3) + dv / real_of_num(2)])")
  let t1205 = @tactics.disch_then(fn(x1204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1200 = @tactics.mp_tac(x1199)
      fn(x1201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1200(x1201)
      }
    })(((x1203 : @kernel.Thm) => @bool.spec(t1202, x1203))(x1204))
  })
  let t1198 = @simp.asm_rewrite_tac(@list.List([]))
  let t1195 = @simp.gen_rewrite_rule(fn(x1194 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1194
  }, @list.List([valley()]))
  let t1197 = @tactics.first_assum(fn(x1196 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s1190 = @tactics.mp_tac(x1189)
          fn(x1191 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s1190(x1191)
          }
        })(@bool.conjunct1(x1192))
      })(@bool.conjunct2(x1193))
    })(t1195(x1196))
  })
  let t1188 = @simp.asm_rewrite_tac(@list.List([]))
  let t1186 = @simp.asm_simp_tac(@list.List([@integration.interval_upperbound_nonempty(), @integration.interval_lowerbound_nonempty(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.vec_component()]))
  let t1185 = @simp.asm_rewrite_tac(@list.List([]))
  let t1184 = @list.List([@meson.asm_meson_tac(@list.List([cube_imp_nonempty()])), @tactics.all_tac])
  let t1187 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!(interval([((av : Cart[Real, 3]), av + op_pct((dv : Real), vec(1)))]) == {})"), fn(x1181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1182 = @tactics.assume_tac(x1181)
    fn(x1183 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1182(x1183)
    }
  }), t1184), t1185), t1186), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1180 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1) == op_dollar((av : Cart[Real, 3]), 1) + (dv : Real) && op_dollar(interval_lowerbound(v), 2) == op_dollar(av, 2) && op_dollar(interval_upperbound(v), 2) == op_dollar(av, 2) + dv && op_dollar(interval_lowerbound(v), 3) == op_dollar(av, 3) && op_dollar(interval_upperbound(v), 3) == op_dollar(av, 3) + dv"), @tactics.strip_assume_tac)
  let t1178 = @tactics.x_choose_then(@term_syntax.parse_term("(dv : Real)"))(@tactics.strip_assume_tac)
  let t1179 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(av : Cart[Real, 3])"))(t1178))
  let t1176 = @simp.gen_rewrite_rule(fn(x1175 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1175
  }, @list.List([cube()]))
  let t1212 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1173 = @tactics.mp_tac(x1172)
      fn(x1174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1173(x1174)
      }
    })(t1176(x1177))
  }), t1179), t1180), t1187), t1188), t1197), t1198), t1205), t1206), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1207), t1208), t1209), t1210), t1211), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1171 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k0 : (Cart[Real, 3]) -> Bool, IN(k0, (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && op_dollar(interval_lowerbound(k0), 1) == op_dollar(interval_upperbound((v : (Cart[Real, 3]) -> Bool)), 1) && (∃ z : Cart[Real, 3], IN(z, k0) && op_dollar(interval_lowerbound(v), 2) < op_dollar(z, 2) && op_dollar(z, 2) < op_dollar(interval_upperbound(v), 2) && op_dollar(interval_lowerbound(v), 3) < op_dollar(z, 3) && op_dollar(z, 3) < op_dollar(interval_upperbound(v), 3))"), @tactics.strip_assume_tac)
  let t1170 = meson_assume_tac(@list.List([valley()]), @term_syntax.parse_term("cube((v : (Cart[Real, 3]) -> Bool))"))
  let t1169 = meson_assume_tac(@list.List([@integration.division_of()]), @term_syntax.parse_term("FINITE((D : ((Cart[Real, 3]) -> Bool) -> Bool))"))
  let t1168 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("division_of((D : ((Cart[Real, 3]) -> Bool) -> Bool), UNIONS(D))"))
  let t1401 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1168), t1169), t1170), t1171), t1212), t1213), t1215), @tactics.ants_tac), t1227), t1228), t1229), t1233), t1234), t1235), t1236), t1237), t1238), t1239), t1240), t1400)
  valley_descent_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, ∀ a : Cart[Real, 3], ∀ d : Real, ∀ v : (Cart[Real, 3]) -> Bool, real_of_num(0) < d && cube_dissection(D) && UNIONS(D) == interval([(a, a + op_pct(d, vec(1)))]) && valley(D, v) → (∃ k : (Cart[Real, 3]) -> Bool, IN(k, D) && interval_length(k) < interval_length(v) && valley(D, k))"), t1401))
}

///|
let valley_descent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALLEY_DESCENT")

///|
/// `VALLEY_DESCENT`
pub fn valley_descent() -> @kernel.Thm {
  valley_descent_c.get()
}

///|
/// VALLEY_IMPOSSIBLE
fn step_27() -> Unit raise {
  let t1456 = @simp.asm_rewrite_tac(@list.List([]))
  let t1453 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t1457 = @tactics.then_tac(@tactics.disch_then(fn(x1455 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1450 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1451 = @tactics.mp_tac(x1450)
      fn(x1452 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1451(x1452)
      }
    })(((x1454 : @kernel.Thm) => @bool.spec(t1453, x1454))(x1455))
  }), t1456)
  let t1446 = @simp.asm_rewrite_tac(@list.List([]))
  let t1445 = @simp.asm_rewrite_tac(@list.List([]))
  let t1447 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.card_psubset()), t1445), t1446])
  let t1444 = @tactics.subgoal_then(@term_syntax.parse_term("CARD({(k' : (Cart[Real, 3]) -> Bool) | IN(k', (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && interval_length(k') < interval_length((k : (Cart[Real, 3]) -> Bool))}) < CARD({(k' : (Cart[Real, 3]) -> Bool) | IN(k', D) && interval_length(k') < interval_length((v' : (Cart[Real, 3]) -> Bool))})"), fn(x1441 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1442 = @tactics.mp_tac(x1441)
    fn(x1443 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1442(x1443)
    }
  })
  let t1439 = @simp.asm_rewrite_tac(@list.List([]))
  let t1440 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_restrict()), t1439), @tactics.all_tac])
  let t1448 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(k' : (Cart[Real, 3]) -> Bool) | IN(k', (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && interval_length(k') < interval_length((v' : (Cart[Real, 3]) -> Bool))})"), fn(x1436 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1437 = @tactics.assume_tac(x1436)
    fn(x1438 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1437(x1438)
    }
  })), t1440), t1444), t1447)
  let t1435 = @simp.asm_rewrite_tac(@list.List([@realarith.real_lt_refl()]))
  let t1431 = @term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)")
  let t1434 = @tactics.disch_then(fn(x1433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1429 = @tactics.mp_tac(x1428)
      fn(x1430 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1429(x1430)
      }
    })(((x1432 : @kernel.Thm) => @bool.spec(t1431, x1432))(x1433))
  })
  let t1427 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t1426 = @list.List([@meson.asm_meson_tac(@list.List([@realarith.real_lt_trans()])), @tactics.all_tac])
  let t1449 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.psubset(), @sets.subset(), @sets.in_elim_thm()])), @tactics.conj_tac), t1426), t1427), t1434), t1435), t1448])
  let t1458 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("PSUBSET({(k' : (Cart[Real, 3]) -> Bool) | IN(k', (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && interval_length(k') < interval_length((k : (Cart[Real, 3]) -> Bool))}, {(k' : (Cart[Real, 3]) -> Bool) | IN(k', D) && interval_length(k') < interval_length((v' : (Cart[Real, 3]) -> Bool))})"), fn(x1423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1424 = @tactics.mp_tac(x1423)
    fn(x1425 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1424(x1425)
    }
  }), t1449), t1457])
  let t1419 = @term_syntax.parse_term("CARD({(k' : (Cart[Real, 3]) -> Bool) | IN(k', (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && interval_length(k') < interval_length((k : (Cart[Real, 3]) -> Bool))})")
  let t1422 = @tactics.first_x_assum(fn(x1421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1417 = @tactics.mp_tac(x1416)
      fn(x1418 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1417(x1418)
      }
    })(((x1420 : @kernel.Thm) => @bool.spec(t1419, x1420))(x1421))
  })
  let t1415 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1414 = @simp.asm_rewrite_tac(@list.List([]))
  let t1410 = @term_syntax.parse_term("(v' : (Cart[Real, 3]) -> Bool)")
  let t1411 = @term_syntax.parse_term("(d : Real)")
  let t1412 = @term_syntax.parse_term("(a : Cart[Real, 3])")
  let t1413 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"), t1412, t1411, t1410]), valley_descent()))
  let t1409 = @tactics.x_gen_tac(@term_syntax.parse_term("(v' : (Cart[Real, 3]) -> Bool)"))
  let t1408 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1407 = @tactics.match_mp_tac(@arith.num_wf())
  let t1406 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ v : (Cart[Real, 3]) -> Bool, CARD({(k : (Cart[Real, 3]) -> Bool) | IN(k, (D : ((Cart[Real, 3]) -> Bool) -> Bool)) && interval_length(k) < interval_length(v)}) == n && valley(D, v) → false"), fn(x1404 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1404
    @meson.asm_meson_tac(@list.List([th]))
  })
  let t1403 = meson_assume_tac(@list.List([@integration.division_of()]), @term_syntax.parse_term("FINITE((D : ((Cart[Real, 3]) -> Bool) -> Bool))"))
  let t1402 = meson_assume_tac(@list.List([cube_dissection()]), @term_syntax.parse_term("division_of((D : ((Cart[Real, 3]) -> Bool) -> Bool), UNIONS(D))"))
  let t1459 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1402), t1403), t1406), t1407), t1408), @tactics.disch_tac), t1409), @tactics.strip_tac), t1413), t1414), t1415), t1422), @tactics.ants_tac), t1458)
  valley_impossible_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, ∀ a : Cart[Real, 3], ∀ d : Real, ∀ v : (Cart[Real, 3]) -> Bool, real_of_num(0) < d && cube_dissection(D) && UNIONS(D) == interval([(a, a + op_pct(d, vec(1)))]) && valley(D, v) → false"), t1459))
}

///|
let valley_impossible_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALLEY_IMPOSSIBLE")

///|
/// `VALLEY_IMPOSSIBLE`
pub fn valley_impossible() -> @kernel.Thm {
  valley_impossible_c.get()
}

///|
/// ONLY_TRIVIAL_CUBE_DISSECTION_CUBE
fn step_28() -> Unit raise {
  let t1468 = @simp.rewrite_tac(@list.List([]))
  let t1467 = @simp.asm_rewrite_tac(@list.List([]))
  let t1466 = @tactics.match_mp_tac(valley_initial())
  let t1469 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1466), t1467), t1468])
  let t1462 = @term_syntax.parse_term("interval([((a : Cart[Real, 3]) - op_pct((d : Real), basis(1)), a - op_pct(d, basis(1)) + op_pct(d, vec(1)))])")
  let t1463 = @term_syntax.parse_term("(d : Real)")
  let t1464 = @term_syntax.parse_term("(a : Cart[Real, 3])")
  let t1465 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool)"), t1464, t1463, t1462]), valley_impossible()))
  let t1461 = @simp.asm_rewrite_tac(@list.List([]))
  let t1460 = @class.asm_cases_tac(@term_syntax.parse_term("(D : ((Cart[Real, 3]) -> Bool) -> Bool) == {interval([((a : Cart[Real, 3]), a + op_pct((d : Real), vec(1)))])}"))
  let t1470 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1460), t1461), t1465), @tactics.ants_tac), t1469)
  only_trivial_cube_dissection_cube_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 3], ∀ d : Real, ∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, real_of_num(0) < d && cube_dissection(D) && UNIONS(D) == interval([(a, a + op_pct(d, vec(1)))]) → D == {interval([(a, a + op_pct(d, vec(1)))])}"), t1470))
}

///|
let only_trivial_cube_dissection_cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ONLY_TRIVIAL_CUBE_DISSECTION_CUBE")

///|
/// `ONLY_TRIVIAL_CUBE_DISSECTION_CUBE`
pub fn only_trivial_cube_dissection_cube() -> @kernel.Thm {
  only_trivial_cube_dissection_cube_c.get()
}

///|
/// ONLY_TRIVIAL_CUBE_DISSECTION
fn step_29() -> Unit raise {
  let t1478 = @simp.asm_rewrite_tac(@list.List([]))
  let t1477 = @tactics.match_mp_tac(only_trivial_cube_dissection_cube())
  let t1476 = @simp.asm_rewrite_tac(@list.List([]))
  let t1474 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac)
  let t1475 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1471 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1472 = @tactics.assume_tac(x1471)
    fn(x1473 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1472(x1473)
    }
  }, @tactics.x_choose_then(@term_syntax.parse_term("(a : Cart[Real, 3])"))(t1474)))
  let t1479 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([cube()]))), t1475), t1476), t1477), t1478)
  only_trivial_cube_dissection_c.set(@tactics.prove(@term_syntax.parse_term("∀ D : ((Cart[Real, 3]) -> Bool) -> Bool, cube_dissection(D) && cube(UNIONS(D)) → D == {UNIONS(D)}"), t1479))
}

///|
let only_trivial_cube_dissection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ONLY_TRIVIAL_CUBE_DISSECTION")

///|
/// `ONLY_TRIVIAL_CUBE_DISSECTION`
pub fn only_trivial_cube_dissection() -> @kernel.Thm {
  only_trivial_cube_dissection_c.get()
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
}
